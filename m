Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A791C83F38
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 17:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQrXgyvR9Rm65z8xjDrkXlQV2OLl4LnjmenV1eIzNOo=; b=WKOdEzv6K9EcHL
	NeO8fh1z4J7OejC+oUaQj0nei6vEmd2Ylhz0cx8QclQHPb9EHSO+HFvmxKv/fD6QXIy/E4EPDR+ky
	wgXr1Nb72/gLhXG21cWYBdkPpWA1NCbIH3OE3SzySzgSQd/2IvlGzKDSINP68uegRe4qBQLeovVTB
	d54bhUE01QnTlKK+OC5xGfl63sYkHXMwOi5NPb/xLgAna2sMQy8lmIT80OSI6SVZQ8a8vxY4iF9E2
	8GvA1xIwhEws3KQRbv6C4wYkQcOurIPOLSoRPCIBdPLN1ILMWznRKFMNBdcoyT4b7pMnuGzucHg4J
	lmi7Le4QOkf772bRbPFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qblxM-00FfrQ-0D;
	Thu, 31 Aug 2023 17:59:48 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qblxI-00Ffqn-2j
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 17:59:46 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-64a0176b1easo5830426d6.3
        for <linux-riscv@lists.infradead.org>; Thu, 31 Aug 2023 10:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693504783; x=1694109583; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNeP4faEGIz+O2zm8651gblNuDZ+xOh/vxbaqfxrNIc=;
        b=WWXMPFklcIof3+P4A9Yjw3+tGoiEKCeMRVAPkkueP9u4h5rqHz/fzevFAJpAzwDkSE
         r4bpxDAdvADqItya2LUxyNYaJDvHQpo1ZLSFo09p0SlkKEf1K67PyBxm0kgLEQjIDo7H
         rSjcsyNDxbE5TnhL5AHD3MAzxdwxkNkDi07IU0xRXd+rWAZkUpKhRvhTmhqSBlPLZ65D
         sL97eSEHoDH1kquDKKnNub9R3DJZs/+D+1kOtWwI5k2AIzK2XUce3plGLm3mwnIYbicC
         Ic1yzLjynLp6xOkXDhl7YEgM7Q4AaZhOVeKCGmfycQUmVuFw3RRLORbPI9yR4ORScri6
         jjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693504783; x=1694109583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNeP4faEGIz+O2zm8651gblNuDZ+xOh/vxbaqfxrNIc=;
        b=NVY63J+ds31AuAPp4bTVgFbfL96GKsLs1rqPRLlvWzy1uRSm/JRuipqbvaeC2TO3i1
         j0GwOHP/2hTbBmB4bphJnPgYlap3pP7QEQPIZDfww42KPh1icfSCOhTQRSN7XqywDcJB
         iBQpHMbZAamTPYJx3KUiPQgYeVonyewILdlFR9rDwQcMf6b9xw4fFfK3TTa4RzEcobH9
         yyw5FyqdsSRhWryijus8Z3OS80eEiPZMVWtvifNsXNUa3XxpIOfY/6vb0BgtjRML6nIg
         6uqknO0MW6hx5UkiV7AVV2pJhRNQvG7LWimxznRH2FSRSWjI7/gHLx2FTN6+bghWJGI/
         2UJA==
X-Gm-Message-State: AOJu0Yy6GSX5L7VUPjR5xRZp60dA4yAF2eCe61M1FgqpNN080XxpsIgI
	N1SwaB7e7x6/EJ/1V90eGnDkv+M0aa1xeOQ40yDQmg==
X-Google-Smtp-Source: AGHT+IEaDoyGI3Gv4xWUfglkRLjOd+ls/Xqa6cKvsq9/l8oygJeF83su+BptjWiIyVoeNHCzqgi4DvktnYxVB0X3nmM=
X-Received: by 2002:a05:6214:4b94:b0:647:1c0f:5b8d with SMTP id
 qf20-20020a0562144b9400b006471c0f5b8dmr3303733qvb.21.1693504783330; Thu, 31
 Aug 2023 10:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230825050248.32681-1-andy.chiu@sifive.com> <ZPDIQEVaEJHXR5IW@google.com>
 <20230831-resize-spherical-4f46639097b8@spud> <676f392a-12bb-b9ce-0b69-7d27261eaf33@leemhuis.info>
In-Reply-To: <676f392a-12bb-b9ce-0b69-7d27261eaf33@leemhuis.info>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 31 Aug 2023 10:59:32 -0700
Message-ID: <CAKwvOdnGy_R_C3KsjMZ0+1+r0hVcqKrw9yDOUJuK=CCYL18gNg@mail.gmail.com>
Subject: Re: [v2] RISC-V: Add ptrace support for vectors
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Conor Dooley <conor@kernel.org>, Andy Chiu <andy.chiu@sifive.com>, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, greentime.hu@sifive.com, 
	guoren@linux.alibaba.com, 20230816155450.26200-4-andy.chiu@sifive.com, 
	bjorn@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Oleg Nesterov <oleg@redhat.com>, 
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, 
	Vincent Chen <vincent.chen@sifive.com>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Benjamin Gray <bgray@linux.ibm.com>, 
	Qing Zhang <zhangqing@loongson.cn>, Baruch Siach <baruch@tkos.co.il>, Rolf Eike Beer <eb@emlix.com>, 
	llvm@lists.linux.dev, nathan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_105944_903150_7AE01721 
X-CRM114-Status: GOOD (  39.13  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBBdWcgMzEsIDIwMjMgYXQgMTA6NTDigK9BTSBUaG9yc3RlbiBMZWVtaHVpcwo8cmVn
cmVzc2lvbnNAbGVlbWh1aXMuaW5mbz4gd3JvdGU6Cj4KPiBPbiAzMS4wOC4yMyAxOToxNywgQ29u
b3IgRG9vbGV5IHdyb3RlOgo+ID4gT24gVGh1LCBBdWcgMzEsIDIwMjMgYXQgMTA6MDU6MDRBTSAt
MDcwMCwgTmljayBEZXNhdWxuaWVycyB3cm90ZToKPiA+PiBPbiBGcmksIEF1ZyAyNSwgMjAyMyBh
dCAwNTowMjo0NkFNICswMDAwLCBBbmR5IENoaXUgd3JvdGU6Cj4gPj4+IFRoaXMgcGF0Y2ggYWRk
IGJhY2sgdGhlIHB0cmFjZSBzdXBwb3J0IHdpdGggdGhlIGZvbGxvd2luZyBmaXg6Cj4gPj4+ICAt
IERlZmluZSBOVF9SSVNDVl9DU1IgYW5kIHJlLW51bWJlciBOVF9SSVNDVl9WRUNUT1IgdG8gcHJl
dmVudAo+ID4+PiAgICBjb25mbGljdGluZyB3aXRoIGdkYidzIE5UX1JJU0NWX0NTUi4KPiA+Pj4g
IC0gVXNlIHN0cnVjdCBfX3Jpc2N2X3ZfcmVnc2V0X3N0YXRlIHRvIGhhbmRsZSBwdHJhY2UgcmVx
dWVzdHMKPiA+Pj4KPiA+Pj4gU2luY2UgZ2RiIGRvZXMgbm90IGRpcmVjdGx5IGluY2x1ZGUgdGhl
IG5vdGUgZGVzY3JpcHRpb24gaGVhZGVyIGluCj4gPj4+IExpbnV4IGFuZCBoYXMgYWxyZWFkeSBk
ZWZpbmVkIE5UX1JJU0NWX0NTUiBhcyAweDkwMCwgd2UgZGVjaWRlIHRvCj4gPj4+IHN5bmMgd2l0
aCBnZGIgYW5kIHJlbnVtYmVyIE5UX1JJU0NWX1ZFQ1RPUiB0byBzb2x2ZSBhbmQgcHJldmVudCBm
dXR1cmUKPiA+Pj4gY29uZmxpY3RzLgo+ID4+Pgo+ID4+PiBGaXhlczogMGM1OTkyMmM3NjlhICgi
cmlzY3Y6IEFkZCBwdHJhY2UgdmVjdG9yIHN1cHBvcnQiKQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBB
bmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+ID4+Cj4gPj4gSGkgQW5keSwgdGhpcyBp
cyBjYXVzaW5nIGFuIGluc3RhbmNlIG9mIC1XdW51c2VkLXZhcmlhYmxlLiBQVEFMLgo+ID4+Cj4g
Pj4gUGxlYXNlIHVzZSB0aGUgZm9sbG93aW5nIHRhZ3Mgb24gdGhlIGZpeDoKPiA+Pgo+ID4+IFJl
cG9ydGVkLWJ5OiAia2VybmVsY2kub3JnIGJvdCIgPGJvdEBrZXJuZWxjaS5vcmc+Cj4gPj4gQ2xv
c2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1uZXh0LzY0ZjAzZWExLjE3MGEwMjIw
LmQzZGJmLjExZmRAbXguZ29vZ2xlLmNvbS8KPiA+Pgo+ID4+IExldCdzIHNlZSBpZiBJIGNhbiBn
ZXQgdGhlIHJlZ3pib3QgdGFnIGNvcnJlY3Q7IGZpcnN0IHRpbWUgdHJ5aW5nIGl0Lgo+ID4+ICNy
ZWd6Ym90IGludHJvZHVjZWQgZGJlNDZiMDk0MDI2Cj4KPiBOaWNrLCB0aHggZm9yIHRyeWluZywg
YnV0IEZXSVcsIHRoYXQncyB3YXMgc2xpZ2h0bHkgb2ZmLCBidXQgdGhlcmUgbWlnaHQKPiBiZSBh
IGVhc3kgd29ya2Fyb3VuZC4gVG8gZXhwbGFpbiBmb3IgYW55b25lIHRoYXQgY2FyZXM6Cj4KPiBE
dWUgdG8gdGhhdCAnI3JlZ3pib3QgaW50cm9kdWNlZCAuLi4nIHJlZ3pib3Qgd2lsbCBjb25zaWRl
ciB0aGUgbWFpbAo+IHdpdGggdGhlICIjcmVnemJvdCBpbnRyb2R1Y2VkIGRiZTQ2YjA5NDAyNiIg
KGUuZy4gdGhlIG1zZyBmcm9tIE5pY2sgd2l0aAo+IHRoZSBtc2dpZCBaUERJUUVWYUVKSFhSNUlX
QGdvb2dsZS5jb20pIGFzIGEgcmVwb3J0IGZvciB0aGlzIHJlZ3Jlc3Npb24KPiBhbmQgdGh1cyBs
b29rIG91dCBmb3IgcGF0Y2hlcyBhbmQgY29tbWl0cyB3aXRoIGEgdGFnIGxpa2UgdGhpczoKPgo+
ICBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9aUERJUUVWYUVKSFhSNUlXQGdv
b2dsZS5jb20vCj4KPiBXaGljaCBpcyBraW5kYSBjb3JyZWN0LCBhcyB5b3VyIG1haWwgKmlzKiBh
IHJlcG9ydCBhYm91dCB0aGUgcmVncmVzc2lvbiwKPiBzbyBzb21lIGRldmVsb3BlciBtaWdodCB1
c2UgdGhpcy4gQnV0IGluIHRoaXMgY2FzZSB0aGF0J3Mgbm90IHdoYXQgTmljawo+IHdhbnRlZCwg
YXMgdGhlcmUgd2FzIGFuIGVhcmxpZXIgcmVwb3J0IHRoYXQgd2FzIGV2ZW4gc3BlY2lmaWVkLiBC
dXQKPiB3ZWxsLCB0aGF0IG1pZ2h0IG1ha2UgaXQgZWFzeSB0byBmaXgsIGFzIHdlIGNvdWxkIHNp
bXBseSB0ZWxsIHJlZ3pib3QKPiBhYm91dCB0aGUgZHVwbGljYXRlLgoKQWggc29ycnkgYWJvdXQg
dGhhdC4gSSB0cmllZC4KCkknbSBzdGlsbCB1bmNsZWFyIG9uIHdoYXQgSSBzaG91bGQgaGF2ZSBk
b25lIHRob3VnaC4KClNob3VsZCBJIGhhdmUgcmVwbGllZCB0bwpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1uZXh0LzY0ZjAzZWExLjE3MGEwMjIwLmQzZGJmLjExZmRAbXguZ29vZ2xlLmNv
bS8Kd2l0aCB0aGF0IHNhbWUgcmVnemJvdCB0YWcgdGhhdCBJIHVzZWQgaW5zdGVhZD8KCj4gTmlj
ayBjb3VsZCBoYXZlIGRvbmUgdGhhdCBpbiBoaXMgbWFpbCwgYnV0IEkgY2FuIGRvCj4gaXQgaW4g
dGhpcyBvbmUgd2FzIHdlbGwgKGFzIGl0J3MgYSBpbmRpcmVjdCByZXBseSB0byB0aGUgcmVwb3J0
IGZyb20KPiBOaWNrIHRoYXQgcmVnemJvdCB0cmFjaykgdGhhdCA2NGYwM2VhMS4xNzBhMDIyMC5k
M2RiZi4xMWZkQG14Lmdvb2dsZS5jb20KPiBpcyBhIGR1cGxpY2F0ZSBvZiBaUERJUUVWYUVKSFhS
NUlXQGdvb2dsZS5jb206Cj4KPiAjcmVnemJvdCBkdXAtb2Y6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtbmV4dC82NGYwM2VhMS4xNzBhMDIyMC5kM2RiZi4xMWZkQG14Lmdvb2dsZS5j
b20vCgpUaGFua3MgZm9yIGNsZWFuaW5nIHRoYXQgdXA7IHNvcnJ5IGZvciB0aGUgbWVzcy4KCj4K
PiBMZXQncyBzZWUgaWYgdGhpcyB3b3Jrcy4gSSBoYXZlbid0IHVzZWQgdGhpcyBtdWNoLCBzbyBt
YXliZSBzb21ldGhpbmcKPiBtaWdodCBnbyBzaWRld2F5czsgYnV0IGluIHRoZW9yeSB0aGlzIHNo
b3VsZCB3b3JrIGFuZCB0aGVuIHJlZ3pib3Qgd291bGQKPiBkbyB0aGUgcmlnaHQgdGhpbmcuIEF0
IGxlYXN0IG5vcm1hbGx5Ogo+Cj4gPiBTZWUgPDIwMjMwODMwMjAzNzU0LjI0OTQwLTEtcGFsbWVy
QHJpdm9zaW5jLmNvbT4gZm9yIHRoZSBmaXguCj4gPgo+ID4gVGhhdCBoYXMgeW91IGdhdmUgcmVn
emJvdCBwcm9iIHdvbid0IGJlIHN0YWJsZSB0aG91Z2gsIGJyYW5jaCBuZWVkcyBhCj4gPiByZWJh
c2UgdG8gYWRkIG1pc3NpbmcgU29CIHRhZ3MgZnJvbSBpdHMgY29tbWl0dGVyLgo+Cj4gWW91IG1l
YW4gdGhlIGNvbW1pdC1pZCBvZiB0aGUgY2hhbmdlIGN1cnJlbnRseSBrbm93biBhcyBkYmU0NmIw
OTQwMjYKPiB3aWxsIGNoYW5nZT8gVWdoaCwgeWVhaCwgdGhhdCdzIHVuZm9ydHVuYXRlIGFuZCBz
b21ldGhpbmcgcmVnemJvdCBpcyBub3QKPiB5ZXQgcHJlcGFyZWQgZm9yLgo+Cj4gSG1tbW0uIEhh
dmVuJ3QgaGFkIHRoaXMgY2FzZSB5ZXQsIGFzIHJlZ3pib3QgdW50aWwgbm93IGlzIG5vdCB1c2Vk
IG11Y2gKPiBmb3IgLW5leHQuIE5vdCBzdXJlIGhvdyB0byBiZXN0IGhhbmRsZSB0aGF0LiBTdXJl
LCByZWd6Ym90IGNvdWxkIG5vdGljZQo+ICJ0aGUgY29tbWl0IGZvcm1lcmx5IGtub3duIGFzIGNh
ZmVjMGMwIGlzIG5vdyBub3cgYzBjMGNhZmUsIGFzIHRoZQo+IHN1YmplY3QsIGF1dGhvciwgYW5k
IG1vZGlmaWVkIGZpbGVzIHJvdWdobHkgbWF0Y2giIC0tIGJ1dCBJJ20gbm90IHN1cmUKPiBpZiB0
aGF0J3MgYSBnb29kIGlkZWEsIGFzIGRldmVsb3BlcnMgbGlrZSBDb25vciBtaWdodCBpbnRlZ3Jh
dGUgc2ltcGxlCj4gZml4ZXMgbGlrZSB0aGUgb25lIGZvciB0aGUgcHJvYmxlbSBhdCBoYW5kIGR1
cmluZyB0aGUgcmViYXNlLiBTbyBtYXliZQo+IGF0IHRoaXMgcG9pbnQgaXQgYmVjb21lcyAic29t
ZSBodW1hbiBuZWVkcyB0byBsb29rIGludG8gdGhpcyBhbmQgdGVsbAo+IHJlZ3pib3Qgd2hhdCB0
byBkbyIuIDotLwoKSG93IGFib3V0IGlmIHNvbWVvbmUgZHJvcHMgYSBwYXRjaCBhZnRlciBpdCdz
IGJlZW4gcmVwb3J0ZWQgdG8KcmVnemJvdD8gIElzIHRoZXJlIGN1cnJlbnRseSBhbnkgd2F5IHRv
IGluc3RydWN0IHJlZ3pib3QgdG8gImZvcmdldAphYm91dCB0aGUgcHJldmlvdXMgcmVwb3J0PyIK
ClBlcmhhcHMgdGhhdCdzIG9ubHkgYSBjb21tb24gd29ya2Zsb3cgaW4gLW5leHQuCi0tIApUaGFu
a3MsCn5OaWNrIERlc2F1bG5pZXJzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
