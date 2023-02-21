Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5A4C6379F
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 10:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9alpyKd2Lu9gz0XqC3UFhipNvch+yFutQO78+/MgnQY=; b=UVbPB5Zvcg5oja
	864uJ0uvtqPVieM0ryzOKmQKC4TBgxOQw2uu4oFAaoL4YM97yd7L4Vi+eRHioU+q3zmDxdjkSRbU8
	8r1WcFwvK/40nKMEGH+gspzNkw3BWwqztxnW4rYBKcbzbUXqNnhipwumJQkfArIml2qT+x5RPmnmc
	4wUqHXIpijrLmD44uz2KApIaBya8b0dx/3MKVVEo8O2U53U9yQv2ikcE54Qsq6qD2/0KxukMANaFD
	YjA39jPm+ZyuAD0SCaM2RQHab99H00eI4IgDk2duNgIFXR1fxjfxl6qg+yXiTqW5+8Z9lB9klmTqV
	+bUItu/Q4zy1CSlpn7Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQEy-007S01-DR; Tue, 21 Feb 2023 10:51:20 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQEv-007Ry2-Tm
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 10:51:19 +0000
Received: by mail-wr1-x431.google.com with SMTP id o4so3927982wrs.4
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 02:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9w7XobGmqoHAIzgD6LtsFXauMIPw7dVC/9cFUkEqxAg=;
        b=AXBF51TxVmSaVNE/WJ8amku2KSqvbxFUmsYKA0gXCvXJqgyKiBQs9uEXObAlXXO/7f
         /l+eZ4zLmdc1I4b9hsiZ/twLu7qAVcd8EfZA4oho/t2X1ZdAzrR7SiGiYVu2aFezzqJm
         +df4yR61596wmZ5fi9d9AocUK64Oe7O14BjlKLmzHvbUcGvMVAzvQ6/XVHgpna5C2jOL
         umPOhgxAOtOgrzSyfHnsPud0NAy8QPEfUyToiLcecoc667tm7GRghydN6Y98YF7nzUNv
         3lmdApV/CvnwmL6AZZl/38AEFazpjx8ROWgcWSGfrA+FeK/lQUEq5lYzMmSfW0kByN7z
         Ic3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9w7XobGmqoHAIzgD6LtsFXauMIPw7dVC/9cFUkEqxAg=;
        b=K/p9/6GPMjYk1Ge/vjHy3WkwSpzn+6IW50rpUUtXRLtlN6YijEp09w+oxjkJVfXkqL
         4X5NsSgFmOymAzdC53creq5vB8xBqRgCgTLO++TxZXiENioL4sjMtMxJSbUXpzXquyZE
         /QL39vy/dtT9TF4M3Yr2uQCRCkKgCEcA8s8FPYgm7GlODsKAZYvWuRymBJ8bLBq7dR0X
         y2Eui21o7gIjrRm8+0E73vg3gh8IC8YKyjVv9gH/hYfUK+mSgyoz7ujAfpbu5s5G3f7e
         TCj3YugUCRazfpwOLLvz1uMMRn9U2Irp6kZKrkdx5cdQLb3hrUOBD0ieQcnxqOou+mMh
         DJgA==
X-Gm-Message-State: AO0yUKVhfubunQb59JE4GU46IzeN54Tx5vcIQtz8W3QMlq49PQn/RvDG
	TG3Pq7CsTAbOpXhV53Nx2Et02w==
X-Google-Smtp-Source: AK7set8U0nwW6pymToKnj0QWWxsDXX4OES4HSyFf1ItR+ya7bj1YlMfmMfNBNYEKfrx1VuPwLLXTgg==
X-Received: by 2002:a5d:65c6:0:b0:2c5:7c7a:78f7 with SMTP id e6-20020a5d65c6000000b002c57c7a78f7mr2849679wrw.45.1676976674381;
        Tue, 21 Feb 2023 02:51:14 -0800 (PST)
Received: from smtpclient.apple (global-5-143.n-2.net.cam.ac.uk. [131.111.5.143])
        by smtp.gmail.com with ESMTPSA id d1-20020a5d4f81000000b002c5526234d2sm3656584wru.8.2023.02.21.02.51.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Feb 2023 02:51:13 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2 2/7] RISC-V: Detect AIA CSRs from ISA string
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <Y/Sfpb2c/LS0LCiA@wendy>
Date: Tue, 21 Feb 2023 10:51:13 +0000
Cc: =?utf-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <apatel@ventanamicro.com>,
 pbonzini@redhat.com,
 Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-kernel@vger.kernel.org
Message-Id: <F80EBB4C-29C4-472D-B213-EFD220EF9B1F@jrtc27.com>
References: <20230128072737.2995881-3-apatel@ventanamicro.com>
 <mhng-0f9bdf58-5289-4db4-8fd7-38898824c44f@palmer-ri-x1c9>
 <CAEg0e7hrQFu+cdZy+3QO1ML9FNTPBehZwOOBnr1F-5ABYDnkGg@mail.gmail.com>
 <CAEg0e7hRjMSgYZbPTQztbQ3bGZf-r8wAfCK5ZnDXOcx27HcTCA@mail.gmail.com>
 <Y/Sfpb2c/LS0LCiA@wendy>
To: Conor Dooley <conor.dooley@microchip.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_025118_034212_01429D10 
X-CRM114-Status: GOOD (  17.85  )
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

T24gMjEgRmViIDIwMjMsIGF0IDEwOjQwLCBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNy
b2NoaXAuY29tPiB3cm90ZToKPiAKPiBIZXkgQ2hyaXN0b3BoLAo+IAo+IE9uIFR1ZSwgRmViIDIx
LCAyMDIzIGF0IDA4OjEyOjU4QU0gKzAxMDAsIENocmlzdG9waCBNw7xsbG5lciB3cm90ZToKPj4g
SGkgYWxsLAo+PiAKPj4gVGhlIFJJU0MtViBBcmNoaXRlY3R1cmFsIFJldmlldyBDb21taXR0ZWUg
aGFzIGRpc2N1c3NlZCB0aGUgY29uY2VybnMKPj4gcmVnYXJkaW5nIHRoZSBub24tcmF0aWZpZWQg
Y2hhcHRlcnMgaW4gdGhlIEFJQSBzcGVjaWZpY2F0aW9uLgo+IAo+IFRoYW5rcyBmb3IgdGhlIHVw
ZGF0ZSEKPiAKPj4gSGVyZSBpcyB0aGUgcmVsZXZhbnQgcXVvdGUgZnJvbSB0aGUgbWVldGluZyBt
aW51dGVzOgo+PiAiIiIKPj4gQWx0aG91Z2ggdGhlIEFkdmFuY2VkIEludGVycnVwdCBBcmNoaXRl
Y3R1cmUgKEFJQSkgaGFzIGFscmVhZHkgcGFzc2VkCj4+IEFyY2hpdGVjdHVyZSBSZXZpZXcgKHdp
dGggYSBtaW5vciBlZGl0IHN0aWxsIHBlbmRpbmcpLCB0aGUgY29tbWl0dGVlCj4+IGhhcyBzb21l
IHN1Z2dlc3Rpb25zIGFib3V0IGl0cyBmaW5hbCBzdGVwcyB0byByYXRpZmljYXRpb24sIHRvIGF2
b2lkCj4+IHRoZSBBSUEgZG9jdW1lbnQgaGF2aW5nIGEgbWl4dHVyZSBvZiByYXRpZmllZCBhbmQg
bm9uLXJhdGlmaWVkIGNvbnRlbnQ6Cj4gCj4+IC0gVGhlIEFJQSBkb2N1bWVudCdzIHJlbWFpbmlu
ZyBkcmFmdCBjaGFwdGVyIG9uIHRoZSBEdW8tUExJQywgd2hpY2ggaXMKPj4gIG5vdCBjdXJyZW50
bHkgb24gYSBwYXRoIHRvIHJhdGlmaWNhdGlvbiwgY2FuIGJlIHJlbW92ZWQgdG8gYSBzZXBhcmF0
ZQo+PiAgZG9jdW1lbnQuCj4gCj4gVGhhdCBzb3VuZHMgcHJvbWlzaW5nLi4uCj4gCj4+IC0gUmF0
aWZpY2F0aW9uIG9mIHRoZSBmdWxsIEFJQSAod2l0aG91dCBEdW8tUExJQykgY2FuIGJlIHBvc3Rw
b25lZCB0bwo+PiAgY29pbmNpZGUgd2l0aCByYXRpZmljYXRpb24gb2YgdGhlIElPTU1VIHNwZWNp
ZmljYXRpb24sIGdpdmVuIHRoYXQKPj4gIHRoZSBsYXR0ZXIgaXMgbm93IGV4cGVjdGVkIGluIGEg
cmVhc29uYWJsZSB0aW1lLCBhbmQgdGhlIEFJQSdzIGxhc3QKPj4gIGNoYXB0ZXIgY29uY2Vybmlu
ZyBJT01NVXMgaXMgYWxyZWFkeSBzY2hlZHVsZWQgdG8gZ28gdGhyb3VnaCBwdWJsaWMKPj4gIHJl
dmlldyBhbmQgYmUgcmF0aWZpZWQgb25seSB0b2dldGhlciB3aXRoIHRoZSBJT01NVSBzcGVjaWZp
Y2F0aW9uLgo+PiAiIiIKPiAKPiAuLi5hbmQgc28gZG9lcyB0aGlzLiBBSUEgc3R1ZmYncyBhY2Nl
cHRhYmlsaXR5IG9ubHkgZGVwZW5kaW5nIG9uIHRoZQo+IElPTU1VIHNwZWMncyBmcmVlemUgKGFu
ZCB0aHVzIENoYXB0ZXIgOSdzKSBzZWVtcyBsaWtlIGEgdmFzdCBpbXByb3ZlbWVudAo+IG9uIHRo
ZSBzdGF0dXMgcXVvIHRvIG1lIQo+IAo+PiBUaGUgZnVsbCBtZWV0aW5nIG1pbnV0ZXMgY2FuIGJl
IGZvdW5kIGhlcmU6Cj4+ICBodHRwczovL2xpc3RzLnJpc2N2Lm9yZy9nL3RlY2gtY2hhaXJzL21l
c3NhZ2UvMTM4MQo+IAo+IFRoaXMgbGluayBpcyBub24gZnVuY3Rpb25hbCB1bmZvcnR1bmF0ZWx5
IDovCgp0ZWNoLWNoYWlycyBpcyBwcml2YXRlLCBmb3IgKGNvLSljaGFpcnMgb25seS4uLiBub3Qg
c3VyZSB3aHkgaXQgd2VudAp0aGVyZSByYXRoZXIgdGhhbiB0ZWNoLXByaXZpbGVnZWQuCgpKZXNz
Cgo+IENoZWVycywKPiBDb25vci4KPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
