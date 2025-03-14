Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE69C282EC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 23:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cTl8yHx5mOBEsefL6wzHLb2qbqWqAwibBfRreLDpr4Q=; b=roZqhHwRo4pTgl
	/we+k1b6njCxHB9vbdECOZ9QLUKZNgOxwHBMhpkgr0HNsHsA7zzEXY2gYrCk20cgbx6OUl4RWFejL
	vyoZf7nz24zLz9vEJKjYkyv1kPa+51cW0/dBboiA4u6+y9NDQEHZUmfZ5LdnIH8eWbSrNZR0G3+rv
	eItU5PuMmxuRF7ufsgp4aczilQFO7vjnp8nrZCZbc1UO2Lbw7csa03UXB74rN1ihhP1+mNBbwadcI
	q7GEl5eDjC/x/fe4MawCDCegcNTFDMJf/AhpJDG5lE3H6aIA77ydvXi0Yb/wMOPDosLiICX5rvR6R
	epXg90o97pXBKO5XVNxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEKe-0000000FVKv-1YXs;
	Fri, 14 Mar 2025 23:20:48 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEKb-0000000FVKb-2icZ
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 23:20:46 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7be8f28172dso177143385a.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 16:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741994444; x=1742599244; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iPHaV1z4NWkaWgSXlughOQ6tIsariGFIoAHIEq5GJrg=;
        b=jkIRaV/3SmqVcgxr55zNPe7DmFWH7YvS3sH+cxHHhH+xDxcB/Pg30WS/zui3YJcPXC
         HTblAgijWdaf1VURnZamzeYmGFBvalRrddKTkOm5syZzNyvITuxft3R60xCqltj+V09/
         Akx4n2vkC7iTMxK/URn4cF8DLLALTfq2scCdnBhF/Pn4a4pjIrAlhI3dVRwY9y8P8/Kv
         FQK5Cce2pGjuzafAm5c2/0tktuMHBJI4YVzj/WWVDiluKbS13cVmc73iWpmZE+ZZMlrN
         VOXQz+qMPN6TvrzakQcDLvn9gD6ID/6zuK003qC6694slaFc7y4TM0SSxqRYjyHRV528
         xGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741994444; x=1742599244;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iPHaV1z4NWkaWgSXlughOQ6tIsariGFIoAHIEq5GJrg=;
        b=j4LZ0pqN8rOsIQTNq6GG+MT68zB9/t4NRpA73EG8dAVduNRdCUGui7DHLuQnT9g+m2
         adt5RwVYNmBEFdF3X9mUvvhr7lkV6rHEcyg0dsrX/VYnmxnNAwiKkgsBhfNCZjL2FXVN
         FzLI8ySPtJZ9xLxIvBDGFmTZmlVtdlijwtICcERtwnsr8bU+7ukJR1F7IUTEzikI9FRY
         K3/t7bNhr3AxcCkGSr2gVN7KzCLKlGL601qxNvXT5Lq+YJlp6WooCjcFsvtP5RFyJHrT
         bGHmh82JgSrCuB5RA00exKyUDsicj1h6UpM8vNhsCWiZxjTGibuXH11IT5LTDXMfxklM
         vYfA==
X-Forwarded-Encrypted: i=1; AJvYcCUiH450rgmLkXclNtMmwfdIw4LmD8e617BxFhsBqwg/J0GYKMFboKZDNQciSxeMp34rzCRPBeMCL4WV7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxK4RRAb9CveXmFA7xJbOeojJmoINeP/WeX1GqLvIC+3uoARIOr
	BvWzx5Tpe/2lhHXmz8oruRI33yDtme5fLg6/1h8/0ZGL1J8+HUqK
X-Gm-Gg: ASbGncshE2LGjB6y6PY4jUuxbenBODrqCpcbC7TH9cANDH75G4bzDlxQw33Qp8yERKE
	5CXNXaifLsriKc4Ud6xZ0p09klfwWwK194HkGjJWsDIMpPlhPLXBgAfT4XhJunkTItnnleFVxGw
	AOHehl7AP9unGgQ/JXJVRwwDZO1hDE5oc/Et2dSDkEKIsLrpB66XWvJFOModtoK0YRDNLia5+8W
	vWAQQkFlZ8MuWH8O4yAHGw3yUc+1C82SU8L2LMNJen2N/kflwUe4703pjVZVRMetI9m80yh0d+5
	4NcvkDacgjOM34eOIcse
X-Google-Smtp-Source: AGHT+IFj/SlB1MFhDPin66L0iQfr4wDOGbR6n7uiOtlKhc0AhLhsMg5/g8AnbxdPUUK4+Mj4P4Bj8w==
X-Received: by 2002:a05:620a:1b96:b0:7c3:d75c:cc45 with SMTP id af79cd13be357-7c57c8ab6b3mr658626085a.37.1741994444057;
        Fri, 14 Mar 2025 16:20:44 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c573d9253asm310153485a.104.2025.03.14.16.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 16:20:43 -0700 (PDT)
Date: Sat, 15 Mar 2025 07:20:16 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>
Cc: Chen Wang <unicorn_wang@outlook.com>, soc@kernel.org, 
	Conor Dooley <conor@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Xiaoguang Xing <xiaoguang.xing@sophgo.com>, 
	Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
Message-ID: <t5p5mssjmpbkwc3myfjnolzt23vo63px7zehsvwfp62mdrz7oi@qcrt3672ghxz>
References: <PN0PR01MB1039398834809EEFB83AD25F5FED12@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
 <f65bba9b-726e-469a-8657-693bb640d75b@app.fastmail.com>
 <CACRpkdb+U7CBMByZeYmNedv8jEhNXn_w3psJSfRi62diOBhGCg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdb+U7CBMByZeYmNedv8jEhNXn_w3psJSfRi62diOBhGCg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_162045_686098_C9DA03F5 
X-CRM114-Status: GOOD (  15.33  )
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

T24gU2F0LCBNYXIgMTUsIDIwMjUgYXQgMTI6MDY6NDRBTSArMDEwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBGcmksIE1hciAxNCwgMjAyNSBhdCAxMTowNeKAr1BNIEFybmQgQmVyZ21hbm4g
PGFybmRAYXJuZGIuZGU+IHdyb3RlOgo+IAo+ID4gQXJlIHlvdSBhY3R1YWxseSBkb2luZyBpbmNv
bXBhdGlibGUgY2hhbmdlcyBoZXJlLCBvciBpcyB0aGlzCj4gPiBqdXN0IGFib3V0IHRoZSBEVCBi
aW5kaW5nPwo+IAo+IElmIGl0J3MganVzdCB0aGUgYmluZGluZyBJIGd1ZXNzIHdlIGNvdWxkIGRv
IHRoYXQgc3R1bnQgd2hlcmUgd2UKPiBhcHBseSB0aGUgc2FtZSBwYXRjaCBpbmRlcGVuZGVudGx5
IHRvIGJvdGggdHJlZXMgYW5kIGxldCBnaXQKPiBzb3J0IGl0IG91dC4KPiAKPiBTdWJqZWN0ICJk
dC1iaW5kaW5nczogcGluY3RybDogQWRkIHBpbmN0cmwgZm9yIFNvcGhnbyBTRzIwNDIgc2VyaWVz
IFNvQyIKPiAKClllYWgsIHdlIG9ubHkgbmVlZCB0aGUgZmlyc3QgYmluZGluZyBwYXRjaCB0byBw
cm92aWRlIGJpbmRpbmcgaGVhZGVycy4KCj4gU2FkbHkgaXQncyBub3QgdGhlIGZpcnN0IHBhdGNo
IGluIHRoZSBzZXJpZXMgc28geW91IGNhbid0IHB1bGwganVzdCB0aGF0Cj4gZnJvbSBteSB0cmVl
Lgo+IAoKSSBndWVzcyB0aGlzIG1lYW5zIHdlIHNob3VsZCBjaGVja291dCB0aGUgYmluZGluZyBw
YXRjaCBpbiBMaW51cydzIHRyZWUKYW5kIG1lcmdlIGl0IHdpdGhvdXQgb3RoZXIgZHJpdmVyIHBh
dGNoPyBPciBqdXN0IHRha2UgdGhlIGJpbmRpbmcgcGF0Y2gKZnJvbSB0aGUgcGF0Y2ggc2VyaWUg
YW5kIGxldCB0aGUgZ2l0IGlnbm9yZSB0aGUgc2FtZSB0aGluZz8KClJlZ2FyZHMsCklub2NoaQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
