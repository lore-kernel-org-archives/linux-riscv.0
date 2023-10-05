Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF99E92725
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Oct 2023 18:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l/QMfVXSgTvMNLbVYjopFDDFzsJMkEHZ0DoZFnMloPE=; b=alckS44XZ0LYve
	THidQrjf8DrOP69ItqqdZaigCwkL9qA8fWS1vnuX7R7dYDTsDIQMfQ8ruqpnCQPVHse/hrGmqdP1X
	wahDJmKzRIlzWbzeYoMTj/WccCXqstIxHRGHdCajOKs4fu+9V6xB1jZ1wwusse7q6W2KB1TBxQmCD
	m9Svof5hC3A/9+deyEdGEwADfcO8honpPnU9VbKSTTLeewealRhd/ec6FNoEbROc9aqilF2pCk1C9
	IA8z/o5UjWxz3l8yLX63lffgnUCStcmJMu+4lYlnWOQBH+JKj2DENdK8ui9fN3Iia+V/9aqer/h7e
	qBzU4ueGpi2ay2UEZWZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoSou-004GJp-2R;
	Thu, 05 Oct 2023 18:11:32 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoSor-004GI6-2d
	for linux-riscv@lists.infradead.org;
	Thu, 05 Oct 2023 18:11:31 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-317c3ac7339so1186583f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Oct 2023 11:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696529487; x=1697134287; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RThp+Tjx6tvMyvfgRSLCX2P1N1wh3IEB3ufu//n5DiI=;
        b=XwTC8KmVe+tJ3mUdDAollJMq9CIN2oeJwfNqJeMejBr4xkLv3Ya/nMqmyYoccZHDQc
         I/KYvejjg9J+8c9p+rZRQZc/1+WRP83TBXdrmwOA+V7H9M8tK2lBgnUmagp+vNKjHlbp
         xcIID+RCSWg+N6O4gWzGmsMji7sXwT1M9F+QtDSlPQLA3PNZTMk7nMJsDpyOn70g+Bo2
         3ODKpn4dIGNm6u9OsE31/dendmMEETG0iHPH6jsAHeX/fktFweqStrIGznhf740/H0bT
         KWJPWjcoZs55iaYlinhoSCUgHtPCdiGhaLFr8p2tHGHlCyYCOEmRksXBK1+PzQ8WLnsr
         7eTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696529487; x=1697134287;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RThp+Tjx6tvMyvfgRSLCX2P1N1wh3IEB3ufu//n5DiI=;
        b=XX+HYpXknwMvZ3+96BF7HNoq19MwGhoE2eslQ+8K0GA4f7klwTs7OjR/0ivebqsGe8
         u2UT9qaN88GXrOsMRBWarMwsRCwmAVGe574qRMLG+mMAVVRXCneeXg+gwV/40EJ/coeP
         FOTpnZoBxyaZ5kHkAHVpRhxyPBke91Nc1XVkxDgL1RvQdXlULBta2iXCJQQkmnVlrPzH
         1youIPJGycQSwuiXAmW0bYoBdWX/cCsB9kwmI5RFB+3J16eKErPAzS5ZYM/170FMZDEv
         xPkzeIYcE45KLu5d0JiMhj6AFD/kJHcOgGejN8d77bhKv/1BiB64a7L1k4IdyODegXHk
         /BuA==
X-Gm-Message-State: AOJu0YxoX269C3eFqzFhEP0hV/Tmsu5ENB4138ZvadKbtjBFLVRvItUq
	HKjQT6tHmPD5yE6xLDeDFGyHkw==
X-Google-Smtp-Source: AGHT+IGdIdbV3OXjLxGccGel1LwM+U3Wf1bS8+jRQm54M43nl8t2gr0AtiwJlA6OYPPDh3tw9RDT5g==
X-Received: by 2002:a05:6000:1046:b0:31f:f9fe:e739 with SMTP id c6-20020a056000104600b0031ff9fee739mr5789560wrx.59.1696529487053;
        Thu, 05 Oct 2023 11:11:27 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id z23-20020a1c4c17000000b00405935b417asm4332605wmf.2.2023.10.05.11.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 11:11:26 -0700 (PDT)
Date: Thu, 5 Oct 2023 20:11:25 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com, 
	apatel@ventanamicro.com
Subject: Re: [RFC PATCH 3/5] RISC-V: hwprobe: Introduce which-cpus flag
Message-ID: <20231005-5221bab223ee6d8a4c77b23d@orel>
References: <20230921125518.175428-7-ajones@ventanamicro.com>
 <20230921125518.175428-10-ajones@ventanamicro.com>
 <CALs-HstCDZK3BPpubW8FqWQ8w4qH-_Zfgv3YhUYOgguv-OWufw@mail.gmail.com>
 <20231005-f530ebe8df5c0880e53fcfa3@orel>
 <CALs-Hsu3QCvjm7ERTFHqF+GjqkfK2x_eUbca2OjD0TzrCukABA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALs-Hsu3QCvjm7ERTFHqF+GjqkfK2x_eUbca2OjD0TzrCukABA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_111129_891342_EB38CB0B 
X-CRM114-Status: GOOD (  31.94  )
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

T24gVGh1LCBPY3QgMDUsIDIwMjMgYXQgMTA6MTI6MTRBTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90
ZToKPiBPbiBUaHUsIE9jdCA1LCAyMDIzIGF0IDY6MjPigK9BTSBBbmRyZXcgSm9uZXMgPGFqb25l
c0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIFNlcCAyNSwgMjAyMyBh
dCAwOToxNjowMUFNIC0wNzAwLCBFdmFuIEdyZWVuIHdyb3RlOgouLi4KPiA+ID4gU28gaWYgSSB3
cml0ZSBvdXQgdGhpcyBhbGdvcml0aG0sIEkgZ2V0IHNvbWV0aGluZyBsaWtlOgo+ID4gPiAgKiBD
cmVhdGUgYW4gYXJyYXkgb2YgZXZlcnkgcG9zc2libGUga2V5LCBhbmQgZGVkdXBlIHRoZSBjYWxs
ZXIncyBsaXN0Cj4gPiA+IG9mIHBhaXJzIGludG8gdGhpcyBhcnJheS4KPiA+ID4gICogRm9yIGVh
Y2ggcmVtYWluaW5nIGNwdSwgZ28gdGhyb3VnaCB0aGlzIGFycmF5IGFuZCBlaXRoZXIgY29uZmly
bQo+ID4gPiB0aGUgYmlnIGFycmF5J3MgZWxlbWVudCBtYXRjaGVzIHRoaXMgY3B1J3MgdmFsdWUs
IG9yIGNsZWFyIHRoZSBjcHUKPiA+ID4gZnJvbSB0aGUgcmVzdWx0IHNldC4KPiA+ID4KPiA+ID4g
QnV0IHdoeSBkbyB3ZSBnbyB0byBhbGwgdGhlIGVmZm9ydCBvZiBkZS1kdXBpbmcgdGhlIGNhbGxl
cidzIGFycmF5IG9mCj4gPiA+IHBhaXJzPyBDYW4ndCB0aGV5IGRvIHRoYXQgdGhlbXNlbHZlcyAo
b3IgcGF5IGEgc21hbGwgcGVyZm9ybWFuY2UKPiA+ID4gcGVuYWx0eSBmb3IgInllcyIgcmVzdWx0
cyk/IEluc3RlYWQsIGNvdWxkbid0IGl0IGJlIHNvbWV0aGluZyBsaWtlOgo+ID4gPiBGb3IgZWFj
aCBwYWlyIGluIHRoZSB1c2VyJ3Mgc2V0LCBmb3IgZWFjaCByZW1haW5pbmcgY3B1IGluIHRoZSBz
ZXQsCj4gPiA+IGNvbXBhcmUgdGhlIHZhbHVlcywgb3IgY2xlYXIgdGhlIGNwdSBpbiB0aGUgcmVt
YWluaW5nIHNldC4KPiA+ID4KPiA+ID4gRG9pbmcgdGhhdCB3b3VsZCBhbHNvIHRha2UgdGhlIHJ1
bnRpbWUgZnJvbSBPKGtleXNwYWNlICogbmNwdXMpIHRvCj4gPiA+IE8ocXVlcnlfbGVuZ2ggKiBu
Y3B1cykuCj4gPgo+ID4gSSB3YW50IHRvIGRlLWR1cGUgZm9yIHR3byByZWFzb25zOgo+ID4gICog
cXVlcnlfbGVuZ3RoIGlzIHVuYm91bmRlZCwgYnV0IGtleXNwYWNlIGlzIGJvdW5kZWQgKGFuZCBp
cyBjdXJyZW50bHkKPiA+ICAgIHNtYWxsKQo+IAo+IE9rLCBidXQgcmVtZW1iZXIgdGhhdCBpZiB3
ZSBzaGlwIHRoaXMgYmVoYXZpb3IgdG9kYXksIHdlJ3JlIGNvbW1pdHRlZAo+IHRvIGl0IGZvcmV2
ZXIuIFRoZSBrZXlzcGFjZSBpcyBsaWtlbHkgdG8gZ3JvdywgaXQgd291bGQgYmUgdW5mb3J0dW5h
dGUKPiBpZiB0aGlzIHN0ZXAgc3RhcnRlZCB0byBjYXVzZSBhIG5vdGljZWFibGUgcGVyZm9ybWFu
Y2UgZGVsYXkuCgpNYXliZSBpdCdzIG5vdCB0b28gbGF0ZSB0byBwdXQgYSBib3VuZCBvbiBwYWly
cywgaS5lLiBwYWlyX2NvdW50IGdyZWF0ZXIKdGhhbiBzb21lIG51bWJlciBzaG91bGQgcmV0dXJu
IEUyQklHLgoKPiAKPiA+ICAqIFRoZSBtZXJnZSBmdW5jdGlvbiBhbHNvIHByb3ZpZGVzIGFuIG9w
cG9ydHVuaXR5IGZvciBzYW5pdHkgY2hlY2tzIG9mCj4gPiAgICB2YWx1ZS10eXBlIGR1cGxpY2F0
ZXMuIElmIHRoZSB2YWx1ZXMgZG9uJ3QgbWF0Y2ggdGhlbiB0aGUgc3lzY2FsbAo+ID4gICAgcmV0
dXJucyAtRUlOVkFMLgo+IAo+IEJ1dCB0aGUgYmVoYXZpb3IgaWYgd2UgZG9uJ3QgZG8gdGhlIGRl
ZHVwaW5nIGlzIHRoYXQgd2UgZ2V0IGFuIGVtcHR5Cj4gc2V0IG9mIENQVXMgKGVnIHRoZSBjYWxs
ZXIgaGFzIGFza2VkICJ3aGljaCBDUFVzIGhhdmUgZmVhdHVyZVg9PTEgJiYKPiBmZWF0dXJlWD09
MiIsIGFuc3dlcjogbm9uZSkuIE90aGVyIHRoYW4gcGVyaGFwcyBhIGRpYWdub3N0aWMgcHJpbnQs
Cj4gY2FuIHRoZSBhcHBsaWNhdGlvbiB0YWtlIGFueSBwcmFjdGljYWwgZGlmZmVyZW50IGNvdXJz
ZSBvZiBhY3Rpb24gZnJvbQo+IHRoZXNlIHR3byByZXN1bHRzPyBJbiBvdGhlciB3b3JkcywgdGhl
IG9ubHkgbG9naWNhbCBjaG9pY2VzIEkgY2FuIHNlZQo+IGFuIGFwcCBvciBsaWJyYXJ5IHRha2lu
ZyB0byBlaXRoZXIgb2YgdGhlc2UgdHdvIHJlc3BvbnNlcyBpcyAxKSBzaHJ1Zwo+IGFuZCBtb3Zl
IG9uIG9yIDIpIHBhbmljIGFuZCBhYm9ydC4KCkZvciAoMiksIGFuIEVJTlZBTCB3b3VsZCBpbmRp
Y2F0ZSB3aGF0IHdlbnQgd3JvbmcgdG8gdGhlIGRldmVsb3BlciBhbmQKaXQgbWF5IGJlIGZpeGVk
LiBBbHNvLCBmb3IgRUlOVkFMLCB0aGVyZSdzICgzKSwgd2hpY2ggaXMgdG8gcHJvcGFnYXRlCnRo
ZSBlcnJvciwgcG9zc2libHkgYWxsIHRoZSB3YXkgdG8gdGhlIHVzZXIsIHdoZXJlIHRoZSBpbnB1
dHMgY291bGQgZ2V0CmNvcnJlY3RlZCBhbmQgdGhlIGNhbGwgbWF5IGJlIHJldHJpZWQuCgo+IElu
IG15IG9waW5pb24gdGhlIGRlZHVwaW5nIGhhcyByZWFsIGNvc3RzIGFzc29jaWF0ZWQgd2l0aCBp
dCwgYnV0Cj4gb3RoZXIgdGhhbiBtb3JlIGRpcmVjdGx5IHBvaW50aW5nIG91dCB0aGF0IHVzZXJt
b2RlIG1hZGUgYSBzaWxseQo+IHJlcXVlc3QsIEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgYmVuZWZp
dC4KPgoKV2hlbiBwYWlyX2NvdW50IGlzIGxhcmdlLCB0aGVuIHRoZSBjb3N0IHNob3VsZCBiZSBs
ZXNzIHRvIGxvb3Agb3ZlciB0aGUKcGFpcnMgb25jZSwgZGUtZHVwaW5nLCB0aGFuIHRvIGxvb3Ag
b3ZlciB0aGVtIG9uY2UgZm9yIGVhY2ggQ1BVLiBJZgp3ZSBvcHQgdG8gbGltaXQgcGFpcl9jb3Vu
dCwgdGhlbiBJIGFncmVlIHRoZXJlJ3MgbGVzcyBuZWVkIGZvciBhIGRlLQpkdXBlIGxvb3AsIGJ1
dCB3ZSBzdGlsbCBuZWVkIHRvIGNvcHlfZnJvbV91c2VyKCkgZWFjaCBwYWlyLCBhbmQgdGhhdApz
aG91bGQgb25seSBiZSBkb25lIG9uY2UuIFNvLCB3ZSBlaXRoZXIgY29tcGxpY2F0ZSB0aGUgYm9k
eSBvZiB0aGUgbWFpbgpsb29wIGluIG9yZGVyIHRvIGRvIGl0IG9uIHRoZSBmaXJzdCB0aW1lIHRo
cm91Z2gsIG9yIHdlIGRvIGl0IGluIGEKc2VwYXJhdGUgbG9vcCBmaXJzdCAod2hlcmUgd2UgbWln
aHQgYXMgd2VsbCBhbHNvIGRlLWR1cGUgOi0pCgpUaGFua3MsCmRyZXcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
