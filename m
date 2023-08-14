Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F360C001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 18:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vdvLIXk6105KF0oY3zReDPN7ey88PRJQMZzeFS1RdaE=; b=hacqdFNBNkieoG
	oVn3ivxYGeFVnu2gjBKd2avhDaTxjiojn//AFMluEBZNqWy6vp+7PNv5zv52r/6zU6icoWo8YGanz
	10LVKgwuvfzl1xL71HoRrMG37AbOZIRJSP7ASKeFko/R6DrTbUTqLEpS7qvt9RG/ZLDo4aSjTT1IS
	Fd1SgMup2Mhr+6LHr+FZijWA+zVd2Yr57f3lDij4KRREdTQ00BOox78DjN4hnMK7gbIewQetzrfxO
	mdMkHH9aUcu0kD7RiC0Ag88q2v8XbWKMEhBPjY/4clmOomkQKRC98tKF1ObNcDCKQ2ThoTyB9bMAX
	LBKhkgdbquv+aSV4Shwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVclY-0009q4-03;
	Mon, 14 Aug 2023 18:58:12 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVclV-0009ox-2D
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 18:58:11 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-63f7c242030so20454486d6.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Aug 2023 11:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692039487; x=1692644287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oac1NakR4+HaQnJJS2KWoIl9BhM/PnITDXJaAOB1MhA=;
        b=KCQ/YHJETF/2Df9lkPM1TTVA7PA0w1q72mWHR4hS1h41MeLVSVpKsp3CBY9hITwGqK
         ownUaLQqz1gUDeCDtbmGfbE/a/OjIJQAcWLh8rCeKOybhW79U5CuO8POtNnsvXt92dIc
         lL8oK3egA15RsuGjUwIAMd1M56ljwg19utRJjeaUrYJ6vVGPO2n/m941+3xHMdpoiLPM
         R51H+/aEvwWTbLtur1yzV+lqAeXW0UxHIFnSck7ADZg4PZLkuvl+IsYjRaVO9IAIlE8Z
         6/wmM1SBVdZLB9EGtXTovRvQeJBM8n1y3DupVKEdzw0YeZRpn6FplAN+ktXOgmXTfiY6
         Wokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692039487; x=1692644287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oac1NakR4+HaQnJJS2KWoIl9BhM/PnITDXJaAOB1MhA=;
        b=iyOrDqnHYWrVcySPg/gkvc4qgyu2M1SSxsOCYbqQaaZee4CDvNv+4zdDKBQaIOI+MZ
         dmaKAfTo6L0IvKS+5+KZz/3kxZtL2Dt0LtYTtnpOGqI5vk/vWf49NFwzNfJcdr5Gr8+S
         lNNjdBSyEu66TK+dH59PJMN93vtCdCiqfnkgkT9miCj51RTXwTpTnHBCJganZHbrNTlu
         2EAEfJ531EYt+xp0QvV3aFXgVqNlqdYzk3rVQeNdwNSBSymQwap2JQ9a14GUnkMx1kDY
         UF6r86N9PUMK54aSxsV9/xVC3pD90x2APCiF9UlGjV8kWIVXyGkJA1xbeF+miL91F6Ga
         7Shw==
X-Gm-Message-State: AOJu0Yy9Yhd8Arsfl+jeY5SB2STZJ1d7vJiey4kt1gGIG/7TYlCiQnxT
	bARnm2aivDAQEPzbukSzjv5n7ViHm1+FhO809K6WcQ==
X-Google-Smtp-Source: AGHT+IE32kh7x2+dcklNNiRoqDp5BNyANmBCjjAzTj/cO0aLBpoCCh6CXSViX91o9TRqjJ6Mf8Rp18OSE3KZcedzIOs=
X-Received: by 2002:a0c:b317:0:b0:63c:f0f9:fedf with SMTP id
 s23-20020a0cb317000000b0063cf0f9fedfmr6421263qve.4.1692039487497; Mon, 14 Aug
 2023 11:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230811233556.97161-7-samitolvanen@google.com>
 <20230814175928.GA1028706@dev-arch.thelio-3990X> <202308141131.6B90A4205@keescook>
In-Reply-To: <202308141131.6B90A4205@keescook>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 14 Aug 2023 11:57:30 -0700
Message-ID: <CABCJKueV8N4pDBFmw0aWn3wqeyjWUVTGotiC-gjMohJtw=_97Q@mail.gmail.com>
Subject: Re: [PATCH 0/5] riscv: SCS support
To: Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Deepak Gupta <debug@rivosinc.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Fangrui Song <maskray@google.com>, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_115809_724032_63F19388 
X-CRM114-Status: GOOD (  35.55  )
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

T24gTW9uLCBBdWcgMTQsIDIwMjMgYXQgMTE6MzPigK9BTSBLZWVzIENvb2sgPGtlZXNjb29rQGNo
cm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEF1ZyAxNCwgMjAyMyBhdCAxMDo1OToyOEFN
IC0wNzAwLCBOYXRoYW4gQ2hhbmNlbGxvciB3cm90ZToKPiA+IEhpIFNhbWksCj4gPgo+ID4gT24g
RnJpLCBBdWcgMTEsIDIwMjMgYXQgMTE6MzU6NTdQTSArMDAwMCwgU2FtaSBUb2x2YW5lbiB3cm90
ZToKPiA+ID4gSGkgZm9sa3MsCj4gPiA+Cj4gPiA+IFRoaXMgc2VyaWVzIGFkZHMgU2hhZG93IENh
bGwgU3RhY2sgKFNDUykgc3VwcG9ydCBmb3IgUklTQy1WLiBTQ1MKPiA+ID4gdXNlcyBjb21waWxl
ciBpbnN0cnVtZW50YXRpb24gdG8gc3RvcmUgcmV0dXJuIGFkZHJlc3NlcyBpbiBhCj4gPiA+IHNl
cGFyYXRlIHNoYWRvdyBzdGFjayB0byBwcm90ZWN0IHRoZW0gYWdhaW5zdCBhY2NpZGVudGFsIG9y
Cj4gPiA+IG1hbGljaW91cyBvdmVyd3JpdGVzLiBNb3JlIGluZm9ybWF0aW9uIGFib3V0IFNDUyBj
YW4gYmUgZm91bmQKPiA+ID4gaGVyZToKPiA+ID4KPiA+ID4gICBodHRwczovL2NsYW5nLmxsdm0u
b3JnL2RvY3MvU2hhZG93Q2FsbFN0YWNrLmh0bWwKPiA+ID4KPiA+ID4gUGF0Y2ggMSBpcyBmcm9t
IERlZXBhaywgYW5kIGl0IHNpbXBsaWZpZXMgVk1BUF9TVEFDSyBvdmVyZmxvdwo+ID4gPiBoYW5k
bGluZyBieSBhZGRpbmcgc3VwcG9ydCBmb3IgYWNjZXNzaW5nIHBlci1DUFUgdmFyaWFibGVzCj4g
PiA+IGRpcmVjdGx5IGluIGFzc2VtYmx5LiBUaGUgcGF0Y2ggaXMgaW5jbHVkZWQgaW4gdGhpcyBz
ZXJpZXMgdG8KPiA+ID4gbWFrZSBJUlEgc3RhY2sgc3dpdGNoaW5nIGNsZWFuZXIgd2l0aCBTQ1Ms
IGFuZCBJJ3ZlIHNpbXBseQo+ID4gPiByZWJhc2VkIGl0LiBQYXRjaCAyIHVzZXMgdGhpcyBmdW5j
dGlvbmFsaXR5IHRvIGNsZWFuIHVwIHRoZSBzdGFjawo+ID4gPiBzd2l0Y2hpbmcgYnkgbW92aW5n
IGR1cGxpY2F0ZSBjb2RlIGludG8gYSBzaW5nbGUgZnVuY3Rpb24uIE9uCj4gPiA+IFJJU0MtViwg
dGhlIGNvbXBpbGVyIHVzZXMgdGhlIGdwIHJlZ2lzdGVyIGZvciBzdG9yaW5nIHRoZSBjdXJyZW50
Cj4gPiA+IHNoYWRvdyBjYWxsIHN0YWNrIHBvaW50ZXIsIHdoaWNoIGlzIGluY29tcGF0aWJsZSB3
aXRoIGdsb2JhbAo+ID4gPiBwb2ludGVyIHJlbGF4YXRpb24uIFBhdGNoIDMgbW92ZXMgZ2xvYmFs
IHBvaW50ZXIgbG9hZGluZyBpbnRvIGEKPiA+ID4gbWFjcm8gdGhhdCBjYW4gYmUgZWFzaWx5IGRp
c2FibGVkIHdpdGggU0NTLiBQYXRjaCA0IGltcGxlbWVudHMKPiA+ID4gU0NTIHJlZ2lzdGVyIGxv
YWRpbmcgYW5kIHN3aXRjaGluZywgYW5kIGFsbG93cyB0aGUgZmVhdHVyZSB0byBiZQo+ID4gPiBl
bmFibGVkLCBhbmQgcGF0Y2ggNSBhZGRzIHNlcGFyYXRlIHBlci1DUFUgSVJRIHNoYWRvdyBjYWxs
IHN0YWNrcwo+ID4gPiB3aGVuIENPTkZJR19JUlFfU1RBQ0tTIGlzIGVuYWJsZWQuCj4gPiA+Cj4g
PiA+IE5vdGUgdGhhdCB0aGlzIHNlcmllcyByZXF1aXJlcyBDbGFuZyAxNy4gRWFybGllciBDbGFu
ZyB2ZXJzaW9ucwo+ID4gPiBzdXBwb3J0IFNDUyBvbiBSSVNDLVYsIGJ1dCB1c2UgdGhlIHgxOCBy
ZWdpc3RlciBpbnN0ZWFkIG9mIGdwLAo+ID4gPiB3aGljaCBpc24ndCBpZGVhbC4gZ2NjIGhhcyBT
Q1Mgc3VwcG9ydCBmb3IgYXJtNjQsIGJ1dCBJJ20gbm90Cj4gPiA+IGF3YXJlIG9mIHBsYW5zIHRv
IHN1cHBvcnQgUklTQy1WLiBPbmNlIHRoZSBaaWNmaXNzIGV4dGVuc2lvbiBpcwo+ID4gPiByYXRp
ZmllZCwgaXQncyBwcm9iYWJseSBwcmVmZXJhYmxlIHRvIHVzZSBoYXJkd2FyZS1iYWNrZWQgc2hh
ZG93Cj4gPiA+IHN0YWNrcyBpbnN0ZWFkIG9mIFNDUyBvbiBoYXJkd2FyZSB0aGF0IHN1cHBvcnRz
IHRoZSBleHRlbnNpb24sCj4gPiA+IGFuZCB3ZSBtYXkgd2FudCB0byBjb25zaWRlciBpbXBsZW1l
bnRpbmcgQ09ORklHX0RZTkFNSUNfU0NTIHRvCj4gPiA+IHBhdGNoIGJldHdlZW4gdGhlIGltcGxl
bWVudGF0aW9uIGF0IHJ1bnRpbWUgKHNpbWlsYXJseSB0byB0aGUKPiA+ID4gYXJtNjQgaW1wbGVt
ZW50YXRpb24sIHdoaWNoIHN3aXRjaGVzIHRvIFNDUyB3aGVuIGhhcmR3YXJlIFBBQwo+ID4gPiBz
dXBwb3J0IGlzbid0IGF2YWlsYWJsZSkuCj4gPgo+ID4gSSB0b29rIHRoaXMgc2VyaWVzIGZvciBh
IHNwaW4gb24gdG9wIG9mIDYuNS1yYzYgd2l0aCBib3RoIExMVk0gMTggKGJ1aWx0Cj4gPiB3aXRo
aW4gdGhlIHBhc3QgY291cGxlIG9mIGRheXMpIGFuZCBMTFZNIDE3LjAuMC1yYzIgYnV0IGl0IHNl
ZW1zIHRoYXQKPiA+IHRoZSBDRklfQkFDS1dBUkRTIExLRFRNIHRlc3QgZG9lcyBub3QgcGFzcyB3
aXRoCj4gPiBDT05GSUdfU0hBRE9XX0NBTExfU1RBQ0s9eS4KPiA+Cj4gPiAgIFsgICA3My4zMjQ2
NTJdIGxrZHRtOiBQZXJmb3JtaW5nIGRpcmVjdCBlbnRyeSBDRklfQkFDS1dBUkQKPiA+ICAgWyAg
IDczLjMyNDkwMF0gbGtkdG06IEF0dGVtcHRpbmcgdW5jaGVja2VkIHN0YWNrIHJldHVybiBhZGRy
ZXNzIHJlZGlyZWN0aW9uIC4uLgo+ID4gICBbICAgNzMuMzI1MTc4XSBsa2R0bTogRWVrOiByZXR1
cm4gYWRkcmVzcyBtaXNtYXRjaCEgMDAwMDAwMDAwMDAwMDAwMiAhPSBmZmZmZmZmZjgwNjE0OTgy
Cj4gPiAgIFsgICA3My4zMjU0NzhdIGxrZHRtOiBGQUlMOiBzdGFjayByZXR1cm4gYWRkcmVzcyBt
YW5pcHVsYXRpb24gZmFpbGVkIQo+ID4KPiA+IERvZXMgdGhlIHRlc3QgbmVlZCB0byBiZSBhZGp1
c3RlZCBvciBpcyB0aGVyZSBzb21lIG90aGVyIGlzc3VlPwo+Cj4gRG9lcyBpdCBwYXNzIHdpdGhv
dXQgdGhlIHNlcmllcz8gSSB0cmllZCB0byB3cml0ZSBpdCB0byBiZQo+IGFyY2gtYWdub3N0aWMs
IGJ1dCBJIG5ldmVyIHRlc3RlZCBpdCBvbiBSSVNDLVYuIEl0J3MgdmVyeSBwb3NzaWJsZSB0aGF0
Cj4gdGVzdCBuZWVkcyBhZGp1c3RpbmcgZm9yIHRoZSBhcmNoaXRlY3R1cmUuIEJlc2lkZXMgdGhl
IGxhYmVsIGhvcnJvcnMsCj4gdGhlIHVzZSBvZiBfX2J1aWx0aW5fZnJhbWVfYWRkcmVzcyBtYXkg
bm90IHdvcmsgdGhlcmUgZWl0aGVyLi4uCgpMb29rcyBsaWtlIF9fYnVpbHRpbl9mcmFtZV9hZGRy
ZXNzIGJlaGF2ZXMgZGlmZmVyZW50bHkgb24gUklTQy1WLgpBZnRlciBzdGFyaW5nIGF0IHRoZSBk
aXNhc3NlbWJseSBhIGJpdCwgdXNpbmcKX19idWlsdGluX2ZyYW1lX2FkZHJlc3MoMCkgLSAxIGlu
c3RlYWQgb2YgKyAxIHNlZW1zIHRvIHlpZWxkIGNvcnJlY3QKcmVzdWx0cy4gV0l0aCB0aGF0IGNo
YW5nZSwgaGVyZSdzIHRoZSB0ZXN0IHdpdGhvdXQgU0NTOgoKIyBlY2hvIENGSV9CQUNLV0FSRCA+
IC9zeXMva2VybmVsL2RlYnVnL3Byb3Zva2UtY3Jhc2gvRElSRUNUClsgICAxNi4yNzIwMjhdIGxr
ZHRtOiBQZXJmb3JtaW5nIGRpcmVjdCBlbnRyeSBDRklfQkFDS1dBUkQKWyAgIDE2LjI3MjM2OF0g
bGtkdG06IEF0dGVtcHRpbmcgdW5jaGVja2VkIHN0YWNrIHJldHVybiBhZGRyZXNzIHJlZGlyZWN0
aW9uIC4uLgpbICAgMTYuMjcyNjcxXSBsa2R0bTogb2s6IHJlZGlyZWN0ZWQgc3RhY2sgcmV0dXJu
IGFkZHJlc3MuClsgICAxNi4yNzI4ODVdIGxrZHRtOiBBdHRlbXB0aW5nIGNoZWNrZWQgc3RhY2sg
cmV0dXJuIGFkZHJlc3MgcmVkaXJlY3Rpb24gLi4uClsgICAxNi4yNzMzODRdIGxrZHRtOiBGQUlM
OiBzdGFjayByZXR1cm4gYWRkcmVzcyB3YXMgcmVkaXJlY3RlZCEKWyAgIDE2LjI3Mzc1NV0gbGtk
dG06IFRoaXMgaXMgcHJvYmFibHkgZXhwZWN0ZWQsIHNpbmNlIHRoaXMga2VybmVsCig2LjUuMC1y
YzUtMDAwMDUtZzVhMTIwMWY4OTI2NS1kaXJ0eSByaXNjdjY0KSB3YXMgYnVpbHQgKndpdGhvdXQq
CkNPTkZJR19BUk02NF9QVFJfQVVUSF9LRVJORUw9eSBub3IgQ09ORklHX1NIQURPV19DQUxMX1NU
QUNLPXkKCkFuZCB3aXRoIFNDUzoKCiMgZWNobyBDRklfQkFDS1dBUkQgPiAvc3lzL2tlcm5lbC9k
ZWJ1Zy9wcm92b2tlLWNyYXNoL0RJUkVDVApbICAgMTcuNDI5NTUxXSBsa2R0bTogUGVyZm9ybWlu
ZyBkaXJlY3QgZW50cnkgQ0ZJX0JBQ0tXQVJEClsgICAxNy40MzAxODRdIGxrZHRtOiBBdHRlbXB0
aW5nIHVuY2hlY2tlZCBzdGFjayByZXR1cm4gYWRkcmVzcyByZWRpcmVjdGlvbiAuLi4KWyAgIDE3
LjQzMTQwMl0gbGtkdG06IG9rOiByZWRpcmVjdGVkIHN0YWNrIHJldHVybiBhZGRyZXNzLgpbICAg
MTcuNDMyMDMxXSBsa2R0bTogQXR0ZW1wdGluZyBjaGVja2VkIHN0YWNrIHJldHVybiBhZGRyZXNz
IHJlZGlyZWN0aW9uIC4uLgpbICAgMTcuNDMyODYxXSBsa2R0bTogb2s6IGNvbnRyb2wgZmxvdyB1
bmNoYW5nZWQuCgpTYW1pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
