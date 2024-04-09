Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BEEC67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 03:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+NhBNLGl+2vIjQThkOxYyWg7xl5nCOTspuWKe9fYGA=; b=z/S6mokhcoB97W
	TrDecFSs2eDaQrmKpTIkuRXkU9k5k0XKfYxX/lt2PIOgFSaEHZgPp6iiNYrDOXOXWioP0t+Yjt6Of
	LDKqhfL3ldVVfw+VAqYrjCgaul4NaNhj/M2rHO0Cj4PGNHSMLksBgSgFkNEPnmL7Z+02qofCho7E7
	rftwWQ8rhu9Zjce08V3LruU7bByD+e45PDDSPT9ZAYQO/CXm1eypQTfDZuVj/7Z8Mur88m8E97kK/
	mdE7hu1vIQt9cTx9YfT0yc1hvQnO8X9HJe+3eTqym4t2iR+B7qYdTXJzUX57qKQZyZlZ0On8LW2I+
	kzZc4YD/XS2Ado0C4vvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru1kJ-000000001re-0VrB;
	Tue, 09 Apr 2024 03:02:03 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru1kF-000000001pW-3LjS
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 03:02:01 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-dd161eb03afso4534378276.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 20:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712631717; x=1713236517; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMhjxCCXtqewYhIaOMBsuZj2va2Oyrp6d//G8WU88iY=;
        b=RzARfbn7SvwOp8DI9ym3Z8q7aeVQvoa9xdptQ99OrnDCk6v2wTxCG23SuFaPBmpPh2
         XZ5hHyZ/f/Aj3uDtNsqwspw4PNlRpD74zqNNGxIDP2EiK5PxrhpZqkj06qlNG3j6DtFV
         kxkYr9Ox7kDeJ2EnLpgr+YbjPQ5xIa/HTQHG2MLnCbkhVv3EvlzLEY4cX6DUeEep5R22
         Ic8WiZCGLFRhkancyacfEasAopzG/sm4NdHeK4gZZ4bH46aK2Em6mKzOLciZpW602F2j
         Wks07y1rsENhASftvBTkmOCLMHDF6GsvVUlCoQWiGX7mwQNcMI71zxB2C+c77V1z4Csx
         Ej8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712631717; x=1713236517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMhjxCCXtqewYhIaOMBsuZj2va2Oyrp6d//G8WU88iY=;
        b=koodlNX9yLI27PXbHsJB8XKs7kxAqArq23qM+iL1iMvLiZ3M81a8lQd5Qapifzlfg0
         uHHzC+VOvmGNTV4lK+fWG5o2QTXK0F2d0laddbMDyeJB8BNkLmxgl7hjdUc0I/rJFB2U
         OIgi3Wi/R1+fJJIEljqW81PKOsVYcoGPtX7BJtPzlYWKq5KPMSej1OvdAf2L98g0srNr
         A7rRH8DZTuUo3uN47GgYCLQTjAGFwHR0YortO1CrXZ7bMk/QsQ4mhOFDJ8fMmw0YVfwq
         U/OhESlo9JnwDTTxhbn0dt5zkcNMNZC48LxvcgcAGerpocb9bFmrGP2jHaE0iWInlgFG
         PVBA==
X-Forwarded-Encrypted: i=1; AJvYcCWeiIzlWEoDEAFSsxNxk3DcqyhvIbn1odr/TAzvVm2XFWAntHEpW+ccA53r8FPfp+dYccX0IgHLMq3Xb/HP/w9EFIbHYOj1f6u/2KnoMHUa
X-Gm-Message-State: AOJu0Yy9JhSB0J8bcNsJpzEmf89OhFgdg5k6a9ii7mSeJpFLCAg3D6PQ
	O1rG5r3CDuBUuh6yWuuNO9IT8m5bfj4R/9iRyDIAxyk2uxWnFR8MRwuDc9wz7r//5qs6aNfM0qe
	f274jkCZAU7HwO64aeakMop/PSTgtshXx5cHayg==
X-Google-Smtp-Source: AGHT+IGlMfC7YmTw0Qwgs8NfQmPIC72Qt4+rc4wZc+lexO5+feXuB2iXYRklLy5rm87lMCCLYeUbAGlgnX6g1UFvvus=
X-Received: by 2002:a25:eb0a:0:b0:dc7:497e:cddf with SMTP id
 d10-20020a25eb0a000000b00dc7497ecddfmr7972914ybs.33.1712631717011; Mon, 08
 Apr 2024 20:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-vector_sigreturn_tests-v1-1-2e68b7a3b8d7@rivosinc.com> <87bk6pof1t.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87bk6pof1t.fsf@all.your.base.are.belong.to.us>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 9 Apr 2024 11:01:46 +0800
Message-ID: <CABgGipUQ4nQSpKFEbpXvcf5n7Zkbh-HQnky1H5GeEvKw5OxSfg@mail.gmail.com>
Subject: Re: [PATCH] riscv: selftests: Add signal handling vector tests
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Vineet Gupta <vineetg@rivosinc.com>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_200200_052969_DE033F54 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCBBcHIgNCwgMjAyNCBhdCAxOjQ34oCvUE0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29t
PiB3cml0ZXM6Cj4KPiA+IEFkZCB0d28gdGVzdHMgdG8gY2hlY2sgdmVjdG9yIHNhdmUvcmVzdG9y
ZSB3aGVuIGEgc2lnbmFsIGlzIHJlY2VpdmVkCj4gPiBkdXJpbmcgYSB2ZWN0b3Igcm91dGluZS4g
T25lIHRlc3QgZW5zdXJlcyB0aGF0IGEgdmFsdWUgaXMgbm90IGNsb2JiZXJlZAo+ID4gZHVyaW5n
IHNpZ25hbCBoYW5kbGluZy4gVGhlIG90aGVyIHZlcmlmaWVzIHRoYXQgdmVjdG9yIHJlZ2lzdGVy
cwo+ID4gbW9kaWZpZWQgaW4gdGhlIHNpZ25hbCBoYW5kbGVyIGFyZSBwcm9wZXJseSByZWZsZWN0
ZWQgd2hlbiB0aGUgc2lnbmFsCj4gPiBoYW5kbGluZyBpcyBjb21wbGV0ZS4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+Cj4gTmlj
ZSEKPgo+IFJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CgpU
aGFua3MhCgpSZXZpZXdlZC1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KVGVz
dGVkLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
