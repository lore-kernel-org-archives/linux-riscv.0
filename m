Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2921DC83000
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 17:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6xGi8weCxF9inpRnjfPbvAWVlXjZ1sfzrhfbahd8758=; b=kE82LamptVHxQu
	nvJwDH20j8FBWLrbaM5MUnWUM+Dbnbgd8onraZWPbpvHT8+9WxwAQ5e34Tsd/afboASY9x4cGmgFH
	A7MHOCDVaQ+ouC3t3B6AqTTIRh3nC5A3bvUuLnnI2O0G1ybN4S++Btr9yoZZ2gWAzP/UB7vlWamjr
	gKHfjogdQY8jMMlvE3TF6o9SB5tcA1Ybl/K2/yuMBJ2yHHkUDCNltrXwNL3vygpURJcRDvyBcV1EZ
	ZKI4hyTXvDPgOQnviQjNsc+upO4y9IP+SvHk/8YkakocuxZjyE5DrgMBL6zrJkOfIT5jP/0Pixo+6
	dAv0JeoAHHJqItvVQqnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCno-0000000FOqK-08LX;
	Fri, 27 Jun 2025 17:23:52 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBfS-0000000FDoR-1p7b
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 16:11:11 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3df2fa612c4so280715ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jun 2025 09:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751040668; x=1751645468; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcIH4pjrPEib5s/3B0d1zkZ9Z/0XhgYXm5HComwjvMU=;
        b=onFFlQlkz6mXvzxeSqpHPViPx/LMTik25OSlBrQRu6fL0lT2HvMK6mk442BiyXHkuf
         BHrByX5tmzDfgwYXvtyKTvmeav5NXNAFxiHF7YveS2kERH5DYBdLDa6DGh0mz6qn23xi
         VHCAcq5VlXd/OuqXV9c5mI1VzrjY6X4LLudZ4Hx1LmUKMnq3vJa6y1VAFy8cRGi3+zUZ
         lDyoRoxgLda0TjdBQskbkpSaD/iZPf/ZShaGSDRI2LiN7lGykDNvOv9R0IGx98XlQpui
         FfZATmB/TwbeQieDH880r2lq8JVQHEUJp9ZY/ZsIEyEd54tGaI2mghCYlifFAXHbPdOF
         exmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751040668; x=1751645468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TcIH4pjrPEib5s/3B0d1zkZ9Z/0XhgYXm5HComwjvMU=;
        b=u+iXUrOBICTZI8LYAhVyud1kqt1JBVllQug8UgHERvmxb8b3GB/WXhq0bU4AVTtDE6
         ZwLNnivFpR9n0se+V5l5JvK7ZC8lN7+NulUi1yT8Y88gU7zdmwkWvB25zYBAq1WtUF3c
         ndiPI5W4P/jDbepSS/36haIv9XtVK5SlVVwPh5mBEFRWjyVw+HDIQIqeQkt+nf5pb0tN
         dvTbBcct9co2gpSJEt4P/Opns0Os8Ey0vMjovvY9czRKtBV7EXhP4F3UsV3J4AsAsXRI
         elU7XRaLLOxsauaJd9tkHucn7dfnU8Xts9paI6FacNybrhVv/RLuTC61ewFM4jUpb1Bv
         HW4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUopb45d8ph1PEvQdMDOdCgKH3o4aXaWx7gDhInCboDhw8aGOvQB62f5xys5snqKTiYqPJ7KwIZyctylw==@lists.infradead.org
X-Gm-Message-State: AOJu0YymLYfu/85DkAeGAWzAvwVnBo+lJDXI6kZrDpDf16KHgX8qVaH4
	GnFZAsrGuQl2uNyKdEDaGRKrUT7N5f+odnduw3rczWNh2df59400EYW4Qxmfjdsi8qRg6Ud75Vi
	4LKdCdvbPa3vB1KRkmSTpg5SBnJK+Mwbi8qjqHxSH
X-Gm-Gg: ASbGnct28ZsTG68XGx5HQgnHCMLPMyngkfCWvKHtEH9HWKGtEOFYgBvw9q1crNrb4gf
	hKhlVTT5frB2qFXtKNJeredgHe8MDwJBgo4bKb30/XvzbAUij11MwfAffFnPkOH5g71DTDBeGqh
	04D1IPG57F3qfHEAyYas2aWXePTjax71OzAoFLn3Mm
X-Google-Smtp-Source: AGHT+IFg6e4a6YEfWbui8xwO9yD9rLdV6FsjD0j7apl8hIGvv47L9p86pecdsvAU0q7wRaa8l3NwHfyIyMgL9Gnaxno=
X-Received: by 2002:a17:903:2ca:b0:237:e45b:4f45 with SMTP id
 d9443c01a7336-23ae4db11d0mr267905ad.1.1751040668255; Fri, 27 Jun 2025
 09:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250611033150.396172-2-zhihang.shao.iscas@gmail.com>
 <20250624035057.GD7127@sol> <48de9a74-58e8-49c2-8d8a-fa9c71bf0092@cryptogams.org>
 <20250625035446.GC8962@sol> <CABCJKudbdWThfL71L-ccCpCeVZBW7Yhf3JXo9FvaPboRVaXOyg@mail.gmail.com>
 <fa13aa9c-fd72-4aa3-98bc-becaf68a5469@cryptogams.org>
In-Reply-To: <fa13aa9c-fd72-4aa3-98bc-becaf68a5469@cryptogams.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 27 Jun 2025 09:10:30 -0700
X-Gm-Features: Ac12FXznZZZX9Qm6z0k4xbwNRAF0CTs4EHV5XI2tFLn6EJECgfKuduEu2PnIjzI
Message-ID: <CABCJKucHNWz6J9vvDvKh_Je8eQTJO_1r0f6jsDTsDmfaxdBygg@mail.gmail.com>
Subject: Re: [PATCH v4] crypto: riscv/poly1305 - import OpenSSL/CRYPTOGAMS implementation
To: Andy Polyakov <appro@cryptogams.org>
Cc: Eric Biggers <ebiggers@kernel.org>, Zhihang Shao <zhihang.shao.iscas@gmail.com>, 
	linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org, 
	herbert@gondor.apana.org.au, paul.walmsley@sifive.com, alex@ghiti.fr, 
	zhang.lyra@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_091110_492239_445473F0 
X-CRM114-Status: GOOD (  20.09  )
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

T24gRnJpLCBKdW4gMjcsIDIwMjUgYXQgMjowN+KAr0FNIEFuZHkgUG9seWFrb3YgPGFwcHJvQGNy
eXB0b2dhbXMub3JnPiB3cm90ZToKPgo+ID4gd2Ugd291bGQgbmVlZAo+ID4gdG8gdXNlIFNZTV9U
WVBFRF9GVU5DX1NUQVJUIHRvIGVtaXQgQ0ZJIHR5cGUgaW5mb3JtYXRpb24gZm9yIHRoZW0uCj4K
PiBJJ20gY29uZnVzZWQuIE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBTWU1fVFlQRURfRlVOQ19T
VEFSVCBpcyBhYm91dAo+IGNsYW5nIC1mc2FuaXRpemU9a2NmaSwgd2hpY2ggaXMgYSBkaWZmZXJl
bnQgbWVjaGFuaXNtLiBXZWxsLCB5b3UgbWlnaHQKPiBiZSByZWZlcnJpbmcgdG8gZnV0dXJlIGRl
dmVsb3BtZW50cy4uLgoKQ09ORklHX0NGSV9DTEFORyBpcyBzdXBwb3J0ZWQgaW4gdGhlIGtlcm5l
bCByaWdodCBub3csIHdoaWNoIGlzIHdoeSB3ZQpuZWVkIHRvIG1ha2Ugc3VyZSBpbmRpcmVjdCBj
YWxsIHRhcmdldHMgaW4gYXNzZW1ibHkgY29kZSBhcmUgcHJvcGVybHkKYW5ub3RhdGVkLgoKTGlr
ZSBJIHNhaWQsIGlmIFJJU0MtViBnYWlucyBrZXJuZWwtbW9kZSBaaWNmaWxwIHN1cHBvcnQgbGF0
ZXIsIEkKd291bGQgZXhwZWN0IHRoZSBTWU1fVFlQRURfRlVOQ19TVEFSVCBtYWNybyB0byBiZSBv
dmVycmlkZGVuIHRvCmluY2x1ZGUgdGhlIGxwYWQgaW5zdHJ1Y3Rpb24gYXMgd2VsbCwgc2ltaWxh
cmx5IHRvIG90aGVyIGFyY2hpdGVjdHVyZXMKdGhhdCBhbHJlYWR5IHN1cHBvcnQgbGFuZGluZyBw
YWQgaW5zdHJ1Y3Rpb25zLiBJbiBlaXRoZXIgY2FzZSwgaW5zdGVhZApvZiBpbmNsdWRpbmcgcmF3
IGxwYWQgaW5zdHJ1Y3Rpb25zIGluIHRoZSBjb2RlLCBpdCBzaG91bGQgYmUgdXAgdG8gdGhlCmtl
cm5lbCB0byBkZWNpZGUgaWYgbGFuZGluZyBwYWRzIChvciBvdGhlciBDRkkgYW5ub3RhdGlvbnMp
IGFyZSBuZWVkZWQKZm9yIHRoZSBmdW5jdGlvbi4KCj4gPiBBbHNvLCBpZiB0aGUga2VybmVsIGRl
Y2lkZXMgdG8gdXNlIHR5cGUtYmFzZWQgbGFuZGluZyBwYWQgbGFiZWxzIGZvcgo+ID4gZmluZXIt
Z3JhaW5lZCBDRkksICJscGFkIDAiIGlzbid0IGdvaW5nIHRvIHdvcmsgYW55d2F5Lgo+Cj4gSXQg
d291bGQsIGl0IHNpbXBseSB3b24ndCBiZSBmaW5lLWdyYW5lZC4KClNvcnJ5IGZvciBub3QgYmVp
bmcgY2xlYXIuIElmIHRoZSBrZXJuZWwgaW1wbGVtZW50cyBhIGZpbmUtZ3JhaW5lZApaaWNmaWxw
IHNjaGVtZSwgd2Ugd291bGRuJ3Qgd2FudCB1bml2ZXJzYWwgaW5kaXJlY3QgY2FsbCB0YXJnZXRz
IChpLmUuCmxwYWQgMCkgYW55d2hlcmUgaW4gdGhlIGNvZGUuIEFuZCBldmVuIGlmIHdlIGltcGxl
bWVudCBjb2Fyc2UtZ3JhaW5lZApaaWNmaWxwLCB3ZSB3b3VsZCBvbmx5IHdhbnQgbGFuZGluZyBw
YWRzIGluIGZ1bmN0aW9ucyB3aGVyZSB0aGV5J3JlCm5lZWRlZCB0byBtaW5pbWl6ZSB0aGUgbnVt
YmVyIG9mIGNhbGwgdGFyZ2V0cy4KCj4gPiBQZXJoYXBzIGl0Cj4gPiB3b3VsZCBtYWtlIHNlbnNl
IHRvIGp1c3QgZHJvcCB0aGUgbHBhZCBpbnN0cnVjdGlvbiBpbiBrZXJuZWwgYnVpbGRzCj4gPiBm
b3Igbm93IHRvIGF2b2lkIGNvbmZ1c2lvbj8KPgo+IExldCdzIHNheSBJIGdvIGZvcgo+Cj4gI2lm
ZGVmIF9fS0VSTkVMX18KPiBTWU1fVFlQRURfRlVOQ19TVEFSVChwb2x5MTMwNV9pbml0LCAuLi4p
Cj4gI2Vsc2UKPiAuZ2xvYmwgIHBvbHkxMzA1X2luaXQKPiAudHlwZSAgIHBvbHkxMzA1X2luaXQs
XEBmdW5jdGlvbgo+IHBvbHkxMzA1X2luaXQ6Cj4gIyBpZmRlZiBfX3Jpc2N2X3ppY2ZpbHAKPiAg
ICAgICAgIGxwYWQgICAgMAo+ICMgZW5kaWYKPiAjZW5kaWYKPgo+IFdvdWxkIGl0IGJlIHN1ZmZp
Y2llbnQgdG8gI2luY2x1ZGUgPGxpbnV4L2NmaV90eXBlcy5oPj8KClllcywgYnV0IHRoaXMgcmVx
dWlyZXMgdGhlIGZ1bmN0aW9uIHRvIGJlIGluZGlyZWN0bHkgY2FsbGVkLCBiZWNhdXNlCndpdGgg
Q0ZJX0NMQU5HIHRoZSBjb21waWxlciBvbmx5IGVtaXRzIENGSSB0eXBlIGluZm9ybWF0aW9uIGZv
cgpmdW5jdGlvbnMgdGhhdCBhcmUgYWRkcmVzcy10YWtlbiBpbiBDLiBJZiwgbGlrZSBFcmljIHN1
Z2dlc3RlZCwgdGhlc2UKZnVuY3Rpb25zIGFyZSBub3QgY3VycmVudGx5IGluZGlyZWN0bHkgY2Fs
bGVkLCBJIHdvdWxkIHNpbXBseSBsZWF2ZQpvdXQgdGhlIGxwYWQgaW5zdHJ1Y3Rpb25zIGZvciBr
ZXJuZWwgYnVpbGRzIGFuZCB3b3JyeSBhYm91dAprZXJuZWwtbW9kZSBDRkkgYW5ub3RhdGlvbnMg
d2hlbiB0aGV5J3JlIGFjdHVhbGx5IG5lZWRlZDoKCiMgaWYgZGVmaW5lZChfX3Jpc2N2X3ppY2Zp
bHApICYmICFkZWZpbmVkKF9fS0VSTkVMX18pCiAgICAgICAgbHBhZCAgICAwCiMgZW5kaWYKClNh
bWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
