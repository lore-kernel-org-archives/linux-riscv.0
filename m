Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A994DEB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 10:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9oSnnmsgaGAPq5Cup3UNs3sOnOQXpg83Isgo9IVwlY=; b=xIOKNvGSMaznz8
	yDdZDfk24l2OH4+9bfjPBhYbW9zL2fguXn9o9NYlMZ5f9CQtuykI6LBo6TqBVZOjIqDSgz//z9b+Q
	dAIiKJWnTfZrkjRJhi78iXZe4zdB8Fs/5rOWbSukaXXvYWNjqbM8/QxMdif0920xX7cF6VnHzAMm3
	iwkjew7inZQPypAisN3jI+NeYr/VQctrtEOV+1HrKdrWjTwWCT5BomMSTaU/VmtRENyS8Eywyad0L
	i/qZYP73pm8T9ztU9Z1wmewPLSy3LkoOo6q/DZ71/F5O7aSfGKK2exlot8Zcw4YkzNerNMIlrQ6Ef
	AxY+WLIMGAIoBR7LxPug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJAyb-00EgVl-0c;
	Tue, 11 Jul 2023 10:52:13 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJAyX-00EgUJ-1V
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 10:52:11 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fc02a92dcfso37795565e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 03:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689072727; x=1691664727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1PdMizM80C3ZI8rblEgvVMyPGq6EddPu4QPQ4ja35g=;
        b=u9OCUAqgxqoO71TrPr/ab1c4ktAGG42chSTWX2bXgly1ZqQ/DoLJJOb0dbXh5LNU8J
         xKcUNyD/dtZSeBcrGlbbqwzhuLkF2c5KyuzsHNO4+8G360nMrm1GQxKkDTV9ue3i/Jzn
         mahw/QKd1GGTyhH7ODvCCeAY33VViShF+8OSosFGxgXfFwM/JJzSQAgxXDgIm8Br0jHK
         imvUDI7c5Z/oXy/vt5ElX8pB3R0vi/r9NIcPJPJJCgupZI+BkPU67nFWHNUjUXW6r+PF
         5p4GSNOjp26G+4MHblcj+eVAdN8OuA06uNf9DfAIhxss3ZoF3i1EgDWktFrqaMI2vTCN
         +rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689072727; x=1691664727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1PdMizM80C3ZI8rblEgvVMyPGq6EddPu4QPQ4ja35g=;
        b=UZX5xxh4kNb1/9wGCHYamvGj78r7gcGlCaaRZvqs3dP62X0E/mehKd3uq29REDni5u
         aS4UUpI+OpMMO3ykACijj1bVMykAqI4+4YbPlrzkkPvuPraXJjbJZpIQ+RSE40mE7B62
         Jm1o8ForYR8eFufo7S3vCsX5/h+zr/svm/iMvVrNBxr7NVPCTWvgeTe6zOGoYa0xtC/9
         NMljumRoq33mBHemFfFfo7Ll9FLRkD9ie2CRWBxcGBwRFjE2QcWg2p0AxeG4UiQbCkyO
         ga9/ITvilu47SPd1q52GE4K1TpijhK4ku3y+bSLc1RICcWtpZz/Iu4IQGI/up0LtZfU1
         tSCw==
X-Gm-Message-State: ABy/qLbCwtSQt2rZESnOFS4Ci2mUYKcT3PEwiOIh1M87eTaN4gkrjLOP
	+qQamKDWt3KaenaM7E/MFAJ0FAw55NOy0A4Qy2EgXQ==
X-Google-Smtp-Source: APBJJlGpdVefawHmCXphduQKsmic0iBz7dS012j6apOKODRTQOukmx93N03K5S1INpevsq04JQqhq9PJyPHkvzwBelg=
X-Received: by 2002:a5d:684c:0:b0:314:4915:689 with SMTP id
 o12-20020a5d684c000000b0031449150689mr15212682wrw.34.1689072726749; Tue, 11
 Jul 2023 03:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230704121837.248976-1-alexghiti@rivosinc.com> <mhng-c5a71036-061e-4704-bcdf-2b23cab36908@palmer-ri-x1c9a>
In-Reply-To: <mhng-c5a71036-061e-4704-bcdf-2b23cab36908@palmer-ri-x1c9a>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 11 Jul 2023 12:51:56 +0200
Message-ID: <CAHVXubiU7XUSDmJ1YuUX85kLtMO=Y00fYYHuepc2=d3oG8Aq4g@mail.gmail.com>
Subject: Re: [PATCH] riscv: Start of DRAM should at least be aligned on PMD
 size for the direct mapping
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, suagrfillet@gmail.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_035209_513998_743ECC19 
X-CRM114-Status: GOOD (  27.65  )
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

KHNvcnJ5IGZvciB0aGUgZGVsYXkhKQoKT24gVGh1LCBKdWwgNiwgMjAyMyBhdCA3OjA14oCvUE0g
UGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIDA0
IEp1bCAyMDIzIDA1OjE4OjM3IFBEVCAoLTA3MDApLCBhbGV4Z2hpdGlAcml2b3NpbmMuY29tIHdy
b3RlOgo+ID4gU28gdGhhdCB3ZSBkbyBub3QgZW5kIHVwIG1hcHBpbmcgdGhlIHdob2xlIGxpbmVh
ciBtYXBwaW5nIHVzaW5nIDRLCj4gPiBwYWdlcywgd2hpY2ggaXMgc2xvdyBhdCBib290IHRpbWUs
IGFuZCBhbHNvIHZlcnkgbGlrZWx5IGF0IHJ1bnRpbWUuCj4gPgo+ID4gU28gbWFrZSBzdXJlIHdl
IGFsaWduIHRoZSBzdGFydCBvZiBEUkFNIG9uIGEgUE1EIGJvdW5kYXJ5Lgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiA+IC0t
LQo+ID4gIGFyY2gvcmlzY3YvbW0vaW5pdC5jIHwgNyArKysrKystCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gPiBpbmRleCA0ZmE0
MjBmYWE3ODAuLjRhNDNlYzI3NWM2ZCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvbW0vaW5p
dC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ID4gQEAgLTIxNCw4ICsyMTQsMTMg
QEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX2Jvb3RtZW0odm9pZCkKPiA+ICAgICAgIG1lbWJs
b2NrX3Jlc2VydmUodm1saW51eF9zdGFydCwgdm1saW51eF9lbmQgLSB2bWxpbnV4X3N0YXJ0KTsK
PiA+Cj4gPiAgICAgICBwaHlzX3JhbV9lbmQgPSBtZW1ibG9ja19lbmRfb2ZfRFJBTSgpOwo+ID4g
Kwo+ID4gKyAgICAgLyoKPiA+ICsgICAgICAqIE1ha2Ugc3VyZSB3ZSBhbGlnbiB0aGUgc3RhcnQg
b2YgdGhlIG1lbW9yeSBvbiBhIFBNRCBib3VuZGFyeSBzbyB0aGF0Cj4gPiArICAgICAgKiBhdCB3
b3JzdCwgd2UgbWFwIHRoZSBsaW5lYXIgbWFwcGluZyB3aXRoIFBNRCBtYXBwaW5ncy4KPiA+ICsg
ICAgICAqLwo+ID4gICAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19YSVBfS0VSTkVMKSkKPiA+
IC0gICAgICAgICAgICAgcGh5c19yYW1fYmFzZSA9IG1lbWJsb2NrX3N0YXJ0X29mX0RSQU0oKTsK
PiA+ICsgICAgICAgICAgICAgcGh5c19yYW1fYmFzZSA9IG1lbWJsb2NrX3N0YXJ0X29mX0RSQU0o
KSAmIFBNRF9NQVNLOwo+Cj4gVGhpcyByb3VuZHMgZG93biwgd2hpY2ggSUlVQyB3aWxsIHJlc3Vs
dCBpbiBtYXBwaW5ncyBvdXRzaWRlIHdoYXQKPiBtZW1ibG9jayBkZXRlY3RlZCBhcyB0aGUgc3Rh
cnQgYWYgRFJBTS4gIEknZCBleHBlY3QgdGhhdCB0byBjYXVzZSBiYWQKPiBiZWhhdmlvciBzb21l
d2hlcmUuCgpBY3R1YWxseSB3ZSBhcmUgbm90IG1hcHBpbmcgdGhpcyBuZXcgcmVnaW9uIGFzIGl0
IGlzIG5vdCBwcmVzZW50IGluCnRoZSBtZW1ibG9jayByZWdpb25zLCB3ZSBhcmUganVzdCByZS1h
bGlnbmluZyB0aGUgdmlydHVhbCBhbmQgcGh5c2ljYWwKYWRkcmVzczogcGh5c19yYW1fYmFzZSBp
cyBvbmx5IHVzZWQgZm9yIHRoZSB2aXJ0dWFsIHRvIHBoeXNpY2FsCnRyYW5zbGF0aW9ucy4KCj4K
PiBTaG91bGRuJ3Qgd2UgYmUgcm91bmRpbmcgdXA/CgpEb2luZyBzbyB3b3VsZCByZW1vdmUgbWVt
b3J5IGZyb20gdGhlIG1lbW9yeSBtYXAsIGJ1dCBJJ20gbm90IHN1cmUKdGhpcyBpcyBjb3JyZWN0
LCB3ZSBjb3VsZCByZW1vdmUgbWVtb3J5IHRoYXQgY29udGFpbnMgInNvbWV0aGluZyIgdGhhdApu
ZWVkcyB0byBiZSBhY2Nlc3NlZCB1c2luZyB0aGUgbGluZWFyIG1hcHBpbmcgKEFDUEkgdGFibGVz
PyBEVD8pLgoKTW9yZSB0ZXN0aW5nIGlzIHdlbGNvbWUgYXMgSSBjYW4gYmUgd3Jvbmcgb2YgY291
cnNlLgoKVGhhbmtzLAoKQWxleAoKCj4KPiA+Cj4gPiAgICAgICAvKgo+ID4gICAgICAgICogSW4g
NjQtYml0LCBhbnkgdXNlIG9mIF9fdmEvX19wYSBiZWZvcmUgdGhpcyBwb2ludCBpcyB3cm9uZyBh
cyB3ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
