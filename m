Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB27CF9C6D
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Sep 2024 20:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Q9GRDsVpNbPrVHaUezlC62Ld4Wg2BKAG3nPLkOL1P0=; b=wlwP4d2cvDuQNz
	wDC/JCf6GLmRLwEAKdojkbY9QOwHET2wNQOelLxycLALRGnLkm1/5JRyvQHqP7HlFT3jNQtbl9Pn1
	hhsVgnExMt0RXXnNuCgbi/pnEdSMSqUl4LebrIpSKJwXxAXpB+Vd7vbN2u0hErkc+MumzPtM+hMPq
	Z5nlUJ4QZqQjmcKru743vjSNi+yI9UQF0D4ClekTLZLeD0NZIeG2yy2L1E1Z2tM00oNBIRQzssRA0
	ttI1rgfwpaQe08JVmDp4s7RgARvKDcAwmPuDnk85L9hmzaQYW0aHtQKT03mpjySDGB8y2beUcbSOK
	zll7HIOvwjUsMwrqPBfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssT2r-0000000FgtY-02UQ;
	Sun, 22 Sep 2024 20:19:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssT2n-0000000Fgsr-29lT
	for linux-riscv@lists.infradead.org;
	Sun, 22 Sep 2024 20:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727036334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JQF2wHEOy39gPJQyE4jaQPvgH2PM4Ztu8cMFG4wT1eE=;
	b=MLqdVf1VXNX0Yi/EcN4WghbNT/73UubMsL2HW4yuKooHW66HF+/rbPN7s8dYujN9rJ5lUU
	9zYloFrmKZWwciyOB4P9JlBaZj/fzNFzFFn6W7GkLiNf/2EMgdlgY6CTczbcXJsEND6RDs
	CDukqcxnA2yumBlu9ebeV4FxD1moZYo=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-hMO2HK4rOwuxlIEh0SN_AQ-1; Sun, 22 Sep 2024 16:18:53 -0400
X-MC-Unique: hMO2HK4rOwuxlIEh0SN_AQ-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-209dc9354c3so7923105ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 22 Sep 2024 13:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727036331; x=1727641131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQF2wHEOy39gPJQyE4jaQPvgH2PM4Ztu8cMFG4wT1eE=;
        b=Dt+Fyrampr297j+h4VCxH9vguBkjr1D39KkXEOnKGFBUNPDJ3FgNYaWxzv2O2P/ytP
         ll+T3SoI2YqCbLzyQwK0ccJOKkwxO/nufo+bJ0g3UNeu/xYMuKlBYIVq7Cdh665Rj5jV
         1NUtWG8KJZiKinI1GeBpn+d1w7bimB8Yap+udvW5NWMkxqGl4Avj+vKgOjqhVLXNcz+c
         mmsiegrK/+fGbXRPV7xLMBTGy8+b/1mzVB9SJeTTP06yt5wk/t8/JNjG5cxD2iN9TGpT
         Z7ATA5t0sCBoAd4ObO6unf1XfvyKRAphZS9X/ZRjKbuRYp+p1aDitj71ROji7vZcgCix
         VSqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuOi9dvMHFHGGZssVDLhU8yyYwB2ExfouYgrdNno8FQw8RF5rcB6piC6EGPFaYzyWELuGF4l7JS8Dhtg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+9P0Wl0Fv828/anKLkSej7bnPm5lKQJcmWRcocPtApt4Q9sB4
	c64rgf263v2USch33iFufcuvlUeDVjLpUjNJ6o0VrrXRwCeV9ViT/JsmEy269thvKcamSvNOgc+
	pDTWPI/JqrY9ooYtHxCZNjMTNhF3m20qlY+O6vT+EBy9xfQ08Zfl6g43TYZw1jxzaXbo5l7UKnc
	Aaz7/D/BsUTkqCUTkQciUDmGkHNI8a1qi+zRn33Cz5ZelsViWxjQ8=
X-Received: by 2002:a17:902:d549:b0:205:5284:e510 with SMTP id d9443c01a7336-208d756dc07mr148771925ad.1.1727036331390;
        Sun, 22 Sep 2024 13:18:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1/PhP8j7+j+MFBqwrJbSHRpRkk2jJTg3qLJwZrq/UPGBOPF6lufpAIxxmQ25p1qB/PrYpl8YbaxClD0c9gxY=
X-Received: by 2002:a17:902:d549:b0:205:5284:e510 with SMTP id
 d9443c01a7336-208d756dc07mr148771705ad.1.1727036330952; Sun, 22 Sep 2024
 13:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAJD_bPJes4QhmXY5f63GHV9B9HFkSCoaZjk-qCT2NGS7Q9HODg@mail.gmail.com>
 <B2A62C7F-45BA-43E1-975F-5AF0197CD2C3@kernel.org>
In-Reply-To: <B2A62C7F-45BA-43E1-975F-5AF0197CD2C3@kernel.org>
From: Jason Montleon <jmontleo@redhat.com>
Date: Sun, 22 Sep 2024 16:18:39 -0400
Message-ID: <CAJD_bP+43=XXD7p3fRfDxCbj=_YedgVLv38XO4iOAw94a+4PHg@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Cannot boot Lichee Pi 4A with
 FORTIFY_SOURCE enabled
To: Kees Cook <kees@kernel.org>
Cc: linux-hardening@vger.kernel.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>, linux-riscv@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240922_131857_653295_CB723DED 
X-CRM114-Status: GOOD (  28.97  )
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

T24gU2F0LCBTZXAgMjEsIDIwMjQgYXQgMTA6NDLigK9QTSBLZWVzIENvb2sgPGtlZXNAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPgo+Cj4gT24gU2VwdGVtYmVyIDIxLCAyMDI0IDEwOjQyOjExIEFNIFBE
VCwgSmFzb24gTW9udGxlb24gPGptb250bGVvQHJlZGhhdC5jb20+IHdyb3RlOgo+ID5TdGFydGlu
ZyB3aXRoIDYuMTEtcmMxIEkgY2FuIG5vIGxvbmdlciBib290IHRoZSBMaWNoZWUgUGkgNEEgd2l0
aAo+ID5GT1JUSUZZX1NPVVJDRSBlbmFibGVkLiBUaGlzIHdvcmtzIG9uIDYuMTAgdXAgdG8gYXQg
bGVhc3QgNi4xMC4xMS4KPiA+SG93ZXZlciwgd2l0aCA2LjExIEkgZ2V0IG5vIG91dHB1dCBhdCBh
bGwgZnJvbSB0aGUga2VybmVsIG9uIHRoZQo+ID5zZXJpYWwgY29uc29sZSB3aXRoIEZPUlRJRllf
U09VUkNFIGVuYWJsZWQgYW5kIHRoZSBzeXN0ZW0gbmV2ZXIgY29tZXMKPiA+b25saW5lIG9uIG5l
dHdvcmsgb3Igb3RoZXJ3aXNlIGFzIGZhciBhcyBJIGNhbiB0ZWxsLgo+ID4KPiA+SSBkaWQgYSBi
aXNlY3Qgd2hpY2ggbGVkIHRvOgo+ID4yMDAzZTQ4M2E4MWNjMjM1ZTI5Zjc3ZGEzZjZiMjU2Y2I0
YjM0OGU3Cj4gPmZvcnRpZnk6IERvIG5vdCBzcGVjaWFsLWNhc2UgMC1zaXplZCBkZXN0aW5hdGlv
bnMKPiA+Cj4gPklmIEkgcmV2ZXJ0IHRoaXMgY29tbWl0IEkgY2FuIG9uY2UgYWdhaW4gYm9vdCB0
aGUgTGljaGVlIFBpIDRBIHdpdGgKPiA+Rk9SVElGWV9TT1VSQ0UgZW5hYmxlZC4KPiA+Cj4KPiBU
aGFua3MgZm9yIHRoZSByZXBvcnQhIEFyZSB5b3UgYWJsZSB0byBjYXRjaCB3aGF0IHRoZSBlcnJv
ciBsb2cgc2hvd3M/IFRoZXJlIG11c3QgYmUgc29tZSAwLXNpemVkIGFycmF5IHRoYXQgc251Y2sg
YnkuCj4KPiBDYW4geW91IHNoYXJlIHlvdXIgLmNvbmZpZyBhbmQgY29tcGlsZXIgdmVyc2lvbj8K
PgpIaSBLZWVzLApUaGFuayB5b3UgZm9yIHRoZSBxdWljayByZXBseSEgSSBhbSB1c2luZyB0aGUg
RmVkb3JhIDQwIHBhY2thZ2VkCnZlcnNpb24gb2YgZ2NjLCBnY2MtMTQuMS4xLTEuZmM0MC5yaXNj
djY0LgoKSSBvcmlnaW5hbGx5IG5vdGljZWQgdGhpcyB3aGlsZSB0ZXN0aW5nIGEgYnVpbGQgb2Yg
dGhlIEZlZG9yYSBSSVNDLVYKLmNvbmZpZyBvbiBGZWRvcmEgNDAuCmh0dHA6Ly9mZWRvcmEucmlz
Y3Yucm9ja3M6MzAwMC9ycG1zL2tlcm5lbC9zcmMvYnJhbmNoL21haW4tcmlzY3Y2NC9rZXJuZWwt
cmlzY3Y2NC1mZWRvcmEuY29uZmlnCgpXaGVuIEkgbm90aWNlZCBJIGNvdWxkIG5vdCBib290IHRo
aXMgb24gdGhlIGxwaTRhIEkgdHJpZWQgdGhlCmRlZmNvbmZpZyhhcmNoL3Jpc2N2L2NvbmZpZ3Mv
ZGVmY29uZmlnKSwgd2hpY2ggd29ya2VkLiBBZnRlciBtZXJnaW5nCnRoZSBjb25maWdzIGEgYml0
IGF0IGEgdGltZSBJIG5hcnJvd2VkIGl0IGRvd24gdG8gRk9SVElGWV9TT1VSQ0U9eQoKVG8gZG8g
dGhlIGJpc2VjdCBJIHVzZWQgdGhlIHJpc2N2IGRlZmNvbmZpZywgcnVubmluZyBtYWtlIG1lbnVj
b25maWcKdG8gdHVybiBvbiBGT1JUSUZZX1NPVVJDRSwgYW5kIHNhdmluZy4KaHR0cHM6Ly9naXN0
LmdpdGh1Yi5jb20vam1vbnRsZW9uLzljZGM3NzhlOWM5MTM5Mjk2OTI0ZDNmNzFiNDgwNjdiCgpB
cyBmYXIgYXMgbG9ncywgSSBhbSBoYXZpbmcgYSBoYXJkIHRpbWUgZ2F0aGVyaW5nIGFueXRoaW5n
IHVzZWZ1bApiZWNhdXNlIHRoZSBib290IGZhaWxzIHNvIGVhcmx5LiBOb3JtYWxseSB3aXRoIEZP
UlRJRllfU09VUkNFIHR1cm5lZApvbiBJIGdldCBubyBvdXRwdXQgZnJvbSB0aGUga2VybmVsIGF0
IGFsbC4KaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vam1vbnRsZW9uLzQyMTY3YTdiNmQ3MWJiNGRi
OGI3Y2E3MTE0ODkzYjg2CgpXaXRoIGEgY29uZmlnIGNsb3NlciB0byB0aGUgRmVkb3JhIGRlYnVn
IGtlcm5lbCBjb25maWcgSSBnb3QgYSBiaXQKbW9yZSwgYnV0IGl0IHN0b3BwZWQgYm9vdGluZyBo
ZXJlIGFuZCBkb2Vzbid0IHNlZW0gbXVjaCBtb3JlIHVzZWZ1bC4KaHR0cHM6Ly9naXN0LmdpdGh1
Yi5jb20vam1vbnRsZW9uLzAwNDI2YjNiZmYyYzg1YTY4MzcwY2ExZmI1Zjk2OGM3CgpJZiB5b3Ug
aGF2ZSBzdWdnZXN0aW9ucyBmb3IgZ2V0dGluZyBtb3JlIG1lYW5pbmdmdWwgb3V0cHV0IEkgYW0g
aGFwcHkgdG8gdHJ5LgoKVGhlIEZlZG9yYSBrZXJuZWwgY29uZmlnIGJvb3RzIGZpbmUgb24gdGhl
IFZpc2lvbkZpdmUgMiwgc28gSSB0aGluayBpdAppcyBtb3JlIHNwZWNpZmljIHRvIHRoZSBoYXJk
d2FyZSB0aGFuIFJJU0MtViwgbWF5YmUgc29tZXRoaW5nIFQtSGVhZApyZWxhdGVkIGlmIG5vdCBz
cGVjaWZpYyB0byB0aGUgTGljaGVlIFBpIDRBLiBJIHdhcyB0aGlua2luZyBiZWNhdXNlIGl0CnNl
ZW1zIHByZXR0eSBoYXJkd2FyZSBzcGVjaWZpYyBhbmQgZmFpbHVyZSBpcyBzbyBlYXJseSBtYXli
ZSBpdCBpcyBkdWUKdG8gc29tZXRoaW5nIGluIG9uZSBvZiB0aGUgVEhFQUQgZXJyYXRhIG9yIHRo
ZSBwYXRjaCBmdW5jdGlvbi4KCldoaWxlIHRyeWluZyBzb21lIG1vcmUgdGhpbmdzIHRvZGF5IEkg
bm90aWNlZCBpZiBGT1JUSUZZX1NPVVJDRSBpcwpsZWZ0IHVuc2V0IGFuZCBJIGFsc28gdW5zZXQg
RVJSQVRBX1RIRUFEX01BRSBpdCBzaW1pbGFybHkgZmFpbHMgdG8KYm9vdCB3aXRob3V0IG91dHB1
dCwgc28gSSB0aGluayBteSBpZGVhIGlzIHBvc3NpYmxlIHRob3VnaCBJIGRvbid0CmhhdmUgYW55
dGhpbmcgbW9yZSBjb25jcmV0ZSB0aGFuIHRoYXQgdG8gYmFjayBpdCB1cCBhdCB0aGUgbW9tZW50
LgoKVGhhbmsgeW91LAotIEphc29uCgo+IC1LZWVzCj4KPiAtLQo+IEtlZXMgQ29vawo+CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
