Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F7AEB64DB
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 20:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=vvBWPG+oBWxwIcxEYWhFNmNEzeYRqmFjhILTk/+azm4=; b=rpE9q9v4Lkj3fIQ0lcVIiA59ff
	AL/tev8+sPX7ZWN0MhouJu2HU6PEXJUo+0GG1Dl7xJKykqEARBb+wfq2sSMKCKMh1wfHHNfk+ohDe
	Tw3nsStQYJWATNc5kASKLVfRdDq3LbsO2hntJYXfLOgzj+U4QvTI4pNLHurr7Xl/8YLkyKQ00VSq9
	mwhdeVDDfEgq+IK4Q/TXXx+BCLjbFyqrQ7OVv5q5sK6Sth61GAzveRH3GjTrQSjuaOuPhzKerkH/r
	Q4tIJammKZxeHbTD7HMKtyx1/O4RChNcCFsIA6dtBc91XTy8nKjx0U8arwQvXJ16+r9QSMh2OGtse
	tnbQVn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9tfC-00G2LC-1s;
	Thu, 15 Jun 2023 20:33:50 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9tf9-00G2KO-0n
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 20:33:49 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b3f66dda65so244295ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 13:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686861225; x=1689453225;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXoqyFl6N42XXs5/XZCP4kZOyXwyyDGAo56en1oKrIg=;
        b=UaT0+aW2qwNdtoM8Il2nbvuDcmFbAh7ZexiLCA2t017iCkJpzXxPtlEhhhLRIGLGPT
         Wd0Flzda5t7aWg0UvUGm5yGgZjob/jcb0HnQsXfjnTwYT9DHvMWlJ5Y2OXe5pGboADgO
         AhNPDQyNvZXKoSiOZF+e2XKOdIVHiJFV0hqbEK0PKvIgul2Rju5MTcRneinGlIEKmU6b
         tiPAQUz2m9F8helQzCKcx1uXYOyXr3I8FmVzxKZjcxxlbgMdLONURjaH11VENky4I0p9
         FGb0Zeb53eLnVY1xlK3LocQ/0OULokST4vIKD4b8sW1s+d4qkgF6nCT3vXEOQcULDjjA
         Hwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686861225; x=1689453225;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXoqyFl6N42XXs5/XZCP4kZOyXwyyDGAo56en1oKrIg=;
        b=YfHuH0soJODfCqKVTdF6U2MGwkmHZUW5ypT4rCObzAkmyn/RottqYceCJYbKTwvkfI
         CDiCSETsPFGnyg7tbggVnyKYaLj9LMFfvkZly4b/mTH2eKadOj9GITE60hqbZ5YgAWu3
         laedabTSnpAR3jv55De6tGmEgQMrEQpN8BEa53xMKz+s4nTN/Hd+Q7q/1G0pRIqgrm9d
         5/S7XslrvjIDszXu/xYZY24XFuB0R2bVulzfZx51bKSOmCkkRRho5m3X1ilXnhbQiu9c
         1+aCR4vnPNMNHMwECvXHYenetqqqYUZQPz2v4emQZbI/+Z82cPkytSMlk3nryOdCYKHq
         LiQA==
X-Gm-Message-State: AC+VfDwywpDlLJTn1/JRr9sYENo0aRIvzNL7ho5HKyQqxvKGPo7vVWot
	AnCzh1pxGJrlOwn182zTAh+dmP5LzS0NT6qXM6g=
X-Google-Smtp-Source: ACHHUZ6UgGy3GDHNxS9W6mJ/G8BQxY0/GeWMyw4j+Wxk7kmKcrvwvxPB3c7r48snzCLhYB7ISQkWiA==
X-Received: by 2002:a17:902:d509:b0:1b0:4a37:9ccc with SMTP id b9-20020a170902d50900b001b04a379cccmr37472plg.62.1686861225101;
        Thu, 15 Jun 2023 13:33:45 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id g18-20020a170902869200b001aaf2e8b1eesm14354126plo.248.2023.06.15.13.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 13:33:44 -0700 (PDT)
Date: Thu, 15 Jun 2023 13:33:44 -0700 (PDT)
X-Google-Original-Date: Thu, 15 Jun 2023 13:33:05 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Clobber V registers on syscalls
In-Reply-To: <2357195.3bzvq7fpCv@basile.remlab.net>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: remi@remlab.net
Message-ID: <mhng-10fcb0a9-cf4a-4416-ae30-120838a45bdb@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_133347_511957_A99153C4 
X-CRM114-Status: GOOD (  22.84  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAxNSBKdW4gMjAyMyAxMDozNjozMSBQRFQgKC0wNzAwKSwgcmVtaUByZW1sYWIubmV0
IHdyb3RlOgo+IExlIGtlc2tpdmlpa2tvbmEgMTQuIGtlc8Oka3V1dGEgMjAyMywgMTkuMzUuMzQg
RUVTVCBQYWxtZXIgRGFiYmVsdCBhIMOpY3JpdCA6Cj4+IFRoZSBWIHJlZ2lzdGVycyBhcmUgY2xv
YmJlcmVkIGJ5IHN0YW5kYXJkIEFCSSBmdW5jdGlvbnMsIHNvIHVzZXJzcGFjZQo+PiBwcm9iYWJs
eSBkb2Vzbid0IGhhdmUgYW55dGhpbmcgdXNlZnVsIGluIHRoZW0gYnkgdGhlIHRpbWUgd2UgZ2V0
IHRvIHRoZQo+PiBrZXJuZWwuCj4KPiBJbmRlZWQsIGZvciB5b3VyIHR5cGljYWwgc3lzdGVtIGNh
bGwsIHdyYXBwZWQgYnkgdHdvIG9yIG1vcmUgbGF5ZXJzIG9mIAo+IGZ1bmN0aW9uIGNhbGxzIGlu
c2lkZSBsaWJjLCB1c2Vyc3BhY2Ugd2lsbCB0cmVhdCB0aGUgcmVnaXN0ZXJzIGFzIGNsb2JiZXJl
ZCAKPiBhbnlob3cuCj4KPiBCdXQgQUZBSVUsIG90aGVyIGFyY2hpdGVjdHVyZXMgZG9uJ3QgZ3Jh
dHVpdGlvdXNseSBjbG9iYmVyIFNJTUQgb3IgdmVjdG9yIAo+IHJlZ2lzdGVycywgZXZlbiB0aG9z
ZSB0aGF0IGFyZSBjYWxsZWUtY2xvYmJlcmVkIGJ5IHRoZWlyIHJlc3BlY3RpdmUgZnVuY3Rpb24g
Cj4gY2FsbGluZyBjb252ZW50aW9uLCBvciBkbyB0aGV5PwoKSUlVQyBhcm02NCBoYXMgc29tZSBz
aW1pbGFyIGNvZGUsIGF0IGxlYXN0IHRoYXQncyB3aGF0IHRoZSBjb21tZW50IHNheXMgCihhbmQg
SSBnb3QgdGhlIGNsb2JiZXJpbmcgViBzdGF0ZSBmcm9tIEFybSkKCiAgICAvKgogICAgICogQXMg
cGVyIHRoZSBBQkkgZXhpdCBTTUUgc3RyZWFtaW5nIG1vZGUgYW5kIGNsZWFyIHRoZSBTVkUgc3Rh
dGUgbm90CiAgICAgKiBzaGFyZWQgd2l0aCBGUFNJTUQgb24gc3lzY2FsbCBlbnRyeS4KICAgICAq
LwogICAgc3RhdGljIGlubGluZSB2b2lkIGZwX3VzZXJfZGlzY2FyZCh2b2lkKQoKaWYgd2UgZG9u
J3QgY2xvYmJlciBvbiBzeXNjYWxscyB0aGVuIHdlJ2xsIGxpa2VseSBuZWVkIHNvbWUgd2F5IGZv
ciAKdXNlcnNwYWNlIHRvIGluZm9ybSB0aGUga2VybmVsIHRoYXQgViBzdGF0ZSBjYW4gYmUgZGlz
Y2FyZGVkLgoKPiBGV0lXLCBBcm0gaXMgZ29pbmcgdGhlIG9wcG9zaXRlIGRpcmVjdGlvbiB3aXRo
IAo+IHRoZWlyIGhpZ2hlciBwcml2aWxlZ2UgY2FsbHMgKG5ld2VyIHZlcnNpb25zIG9mIFNNQ0ND
IGRlZmluZSBob3cgdG8gcHJlc2VydmUgCj4gU1ZFIHZlY3RvcnMpLgoKVGhhdCBoYXMgYSBzbGln
aHRseSBkaWZmZXJlbnQgY29zdCBzdHJ1Y3R1cmUsIHRob3VnaDogaW4gdGhlIGtlcm5lbCBWIAp3
b3VsZCB1c3VhbGx5IGJlIG9mZiwgc28gdGhlcmUncyBhbHJlYWR5IGEgc3Ryb25nIGluZGljYXRp
b24gd2hlbiB0aGUgCnNhdmUvcmVzdG9yZSBpcyB1c2VmdWwuCgo+IFRoZSBrZXJuZWwgY2Fubm90
IHNpbXBseSBjbG9iYmVyIHJlZ2lzdGVycywgYXMgdGhhdCB3b3VsZCBsaWtlbHkgY2F1c2UgZGF0
YSAKPiBsZWFrYWdlIGZyb20ga2VybmVsIHRvIHVzZXIgbW9kZS4gU28gaXQgaXMgdW5jbGVhciB3
aGF0IHRoZSBiZW5lZml0cyB3b3VsZCBiZSAKCldoYXQncyB0aGUgZGF0YSBsZWFrYWdlPyAgVW5s
ZXNzIEknbSBtaXNzaW5nIHNvbWV0aGluZyBzZXR0aW5nIHRoZSAKc3N0YXR1cy52cz1vZmYgd2ls
bCByZXN1bHQgaW4gdXNlcnNwYWNlIHRyYXBwaW5nIGluIGFueSBWIHN0YXRlIGFjY2VzcywgCnNv
IGlmIHdlJ3JlIGxlYWtpbmcgc29tZXRoaW5nIHdlJ3JlIHByb2JhYmx5IGFsc28gYXQgcmlzayBv
ZiBsZWFraW5nIGl0IApmb3IgbmV3L2Nsb25lZCBwcm9jZXNzZXMuCgpUaGF0IHNhaWQsIHdlIGRv
IG5lZWQgdG8gdGhpbmsgYWJvdXQgc3BlY3VsYXRpdmUgc2lkZS1jaGFubmVsczogd2l0aCB0aGUg
ClYgY3J5cHRvIHN0dWZmIHRoZXJlIHdpbGwgYmUga2V5cyBpbiBWIHJlZ2lzdGVycyBhbmQgb3Ro
ZXIgYXJjaGl0ZWN0dXJlcyAKaGF2ZSBoYWQgZXhwbG9pdGFibGUgaXNzdWVzIHJlbGF0ZWQgdG8g
bGF6eSBzYXZlL3Jlc3RvcmUgYW5kIApzcGVjdWxhdGlvbi4gIE1heWJlIGl0J3MgYmVzdCB0byBq
dXN0IHdhaXQgb24gdGhhdCwgdGhvdWdoPyAgV2UnZCAKaWRlYWxseSB3YW50IHNvbWUgY2Fub25p
Y2FsIHNlcXVlbmNlIGluIHRoZSBJU0EgYnV0IHRoZSBmYXN0ZXN0IHdheSB0byAKZG8gdGhhdCBp
cyBwcm9iYWJseSB0byBqdXN0IHdhaXQgZm9yIGFuIGV4cGxvaXQgdG8gc2hvdyB1cC4KCj4gaGVy
ZS4gQW5kIEkgZmVhciB0aGF0IHRoZXJlIHdpbGwgYmUgbGVzcyBjb252ZW50aW9uYWwgdXNlIGNh
c2VzIHdoZW5jZSBpdCAKPiBtYWtlcyBzZW5zZSB0byBwcmVzZXJ2ZSByZWdpc3RlcnMgb24gc3lz
dGVtIGNhbGxzLgo+Cj4gRm9yIGV4YW1wbGUgYW4gaW5saW5lIG9yIGNvbXBpbGVyIGludHJpbnNp
YyBpbXBsZW1lbnRhdGlvbiBvZiBDKysyMC9DMlggCj4gYXRvbWljLXdhaXQvYXRvbWljLW5vdGlm
eSwgd2hpY2ggd291bGQgcHJlc3VtYWJseSBpbnZva2UgdGhlIGZ1dGV4KCkgc3lzY2FsbCAKPiBv
biBMaW51eCwgbWF5YmU/PwoKSXQnZCBoYXZlIHRvIGJlIGEgcHJldHR5IHNwZWNpYWwgY2FzZTog
YXQgbGVhc3QgaW4gbGlic3RkYysrIGFuZCBnbGliYyAKdGhlIGZ1dGV4IGNhbGxzIGFyZSBiZWhp
bmQgZnVuY3Rpb24gY2FsbHMsIHNvIHRoZSBWIHJlZ2lzdGVycyBhcmUgCmFscmVhZHkgY2xvYmJl
cmVkIGJ5IHRoZSB0aW1lIHRoZSBrZXJuZWwgaGFzIGJlZW4gZW50ZXJlZCAoYXQgbGVhc3QgZm9y
IAphbnl0aGluZyBmb2xsb3dpbmcgdGhlIHN0YW5kYXJkIEFCSXMpLgoKPgo+IC0tIAo+IOmbt+ex
s+KAp+W+t+WwvC3lupPlsJTokpkKPiBodHRwOi8vd3d3LnJlbWxhYi5uZXQvCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
