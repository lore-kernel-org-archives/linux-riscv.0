Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AE9C282EC
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Mar 2025 00:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f2wyS0C58AVfrPnznXiJEeuY0VYGB/GzicD1GyxBLtg=; b=DbNqQGBie5f0gL
	s19Etr1PpJ/hkSX+fY9UdjcjpZIuOzJ6ljJDiFoMM+xtRVJ1g4JCWPz51Ko5+rC0FuhoPNXB7wEWn
	YH9kFmzTp0nCD2XcKuEbeCIQ9nqmkiFjG4lRf/wcclSGWw2D1HTdEhMX3fwpfhW2BSL8zfQUZi5kE
	CXe2wiHeu8/E1Re+smq1iPqw6NFznPU2TF11PB/2vK5Smx88yhPBO+IhHkrLvsWnw2+tvyvBS9uc9
	Qx3zoQbatxd78+24v4UtKyA23uRRkEEr0pYSrjYppJUh0PFQBgGpJbxffm/sLmSl2OO220xnww7ik
	557OWBUnqtTy6pYwMebA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFjV-0000000Fcju-3Rem;
	Sat, 15 Mar 2025 00:50:33 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFjT-0000000FcjX-2xDK
	for linux-riscv@lists.infradead.org;
	Sat, 15 Mar 2025 00:50:32 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-476ae781d21so26769561cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 17:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741999829; x=1742604629; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XL0DMg+SaimZCHhr18HPXkZgkXm2yI2aAJewslZgM2o=;
        b=EAC81ezAMeiNi18VBPlexPz74a7bMHojka5++aCoJU388xRuvhjGhTc5HqLJtHGxiB
         lw2Si+2cMT6f/srsVP+NIw6JjjPkBcD1aV+Or3CxzZ6JohnZ/3VKq8rJ685S/qJdjqCh
         1l89q/FzyOREdEEMtynI0oOoX9oaLYHRLDwWlr8yvtikq7CkWFd6ie5yeFiF+SysKKWg
         YTNfFBNEkP3HkWEs3qioNq+WB+cLz0I/EUiETPo8hkjklPUzlnrTGMofWoGohNq69Hem
         8mMLdm4YS/mzD/ob+4X2Gk3b80I2eLV4ZswPi3+yj0MqoEFYp9SXOj164UBJXA3IOF3f
         VNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741999829; x=1742604629;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XL0DMg+SaimZCHhr18HPXkZgkXm2yI2aAJewslZgM2o=;
        b=Pa668814T3z5yVeiX30NfVJfvs6vp0c6HZbDIkBQSoupjmQFkWXKOuKsm07G6jCKl7
         Ay2ixCO0QZQdJYPH4rdXsLeo9ByzKZwlU9rRnPPGsG3euymh+f1neeZEr+hFa5chfx1Q
         7nVNaFZXfBkabeov6J+28fPzLOWp30gxVN3uXHt+q+9o/YRymLx7Kvg/dot+sppPrvFP
         1j9fpB5TLjnzfBW0OeuASM20XWa2lqYh9Ri7ptZzMQB/3mNDZ3wp6jrIrLI/dO5jQeGy
         IPtvbfAEuOjvuHtD18kqlBON4KkWr8E0QI7rL4syu5SXnvVZXXrCB3S8dCbE19U4vLM9
         tRKA==
X-Forwarded-Encrypted: i=1; AJvYcCWLVYoD00aaLgiENaPCj44PWXmTFb6JkFV+3RrQ3G7TQ2Hf8lXiVeaC6+v2jtSaq2pGVmWMEYauKpBlBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAC7PuqJEvRycG5+AoOpeoBOS3WCQx7g/c2TbvmozioBH2cNS2
	I4VidalMpTuVXTIv3O5SEmWTVNZXC4t2fF9Hv0omR7jsIAqH7yXi
X-Gm-Gg: ASbGncv4wFFasfAmlkRfLQ/oMjrI9x5NNWWgTiayafwW92Y70NKbraguO0kBAHNSnFo
	i2O57gGrOiTmD4MOQvVRqynO2xh33VNYqptCqfr7Bn22sGaugnAnZ6CMrHLb8b4Y/MylCnefs0M
	Md4+/HH3ydL/+OM/M1SrfEBxUNhn61o6/ZTRjXl0FbP3pbFR1FouvPgN3iSMV9bRd+nINlHZrkM
	Um43wPCwAFInqB+Y+36e+xql7fHyDpxZbKf7pPxSRbYVu0SODxYTSAqzIDm/Dnkb4ObvqG9XGSz
	UJbqKBI5FD0XwWGkOStI
X-Google-Smtp-Source: AGHT+IFvQ9bf7j0bsVydFqN+0fJ+kH39Oh2c16QC7usKjIe+mizhREpZmPxq1sQHO0ujeh7++0yTiA==
X-Received: by 2002:a05:622a:354:b0:476:9847:7c6e with SMTP id d75a77b69052e-476c814a7aamr67976661cf.19.1741999829372;
        Fri, 14 Mar 2025 17:50:29 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-476bb60aac8sm29093511cf.15.2025.03.14.17.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 17:50:28 -0700 (PDT)
Date: Sat, 15 Mar 2025 08:50:12 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Chen Wang <unicorn_wang@outlook.com>, 
	soc@kernel.org, Conor Dooley <conor@kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Xiaoguang Xing <xiaoguang.xing@sophgo.com>, 
	Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
Message-ID: <futjsg55afhxz5whuve4qgnicdupedz4qgqbeox2pp6s5p4tfi@h6ueigflfs4m>
References: <PN0PR01MB1039398834809EEFB83AD25F5FED12@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
 <f65bba9b-726e-469a-8657-693bb640d75b@app.fastmail.com>
 <CACRpkdb+U7CBMByZeYmNedv8jEhNXn_w3psJSfRi62diOBhGCg@mail.gmail.com>
 <t5p5mssjmpbkwc3myfjnolzt23vo63px7zehsvwfp62mdrz7oi@qcrt3672ghxz>
 <CACRpkdarxLiyfZJisyW3F_ipiOgOP189iqUkeGtuKKttHp8F1w@mail.gmail.com>
 <ilkznijefh5haqed3hpj5mynqiqoqvmzodes6os2cccy3tdxf7@zvv3o7k2eful>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ilkznijefh5haqed3hpj5mynqiqoqvmzodes6os2cccy3tdxf7@zvv3o7k2eful>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_175031_763190_F0CA2E57 
X-CRM114-Status: GOOD (  17.79  )
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

T24gU2F0LCBNYXIgMTUsIDIwMjUgYXQgMDc6NDQ6MzdBTSArMDgwMCwgSW5vY2hpIEFtYW90byB3
cm90ZToKPiBPbiBTYXQsIE1hciAxNSwgMjAyNSBhdCAxMjo0MjoxMkFNICswMTAwLCBMaW51cyBX
YWxsZWlqIHdyb3RlOgo+ID4gT24gU2F0LCBNYXIgMTUsIDIwMjUgYXQgMTI6MjDigK9BTSBJbm9j
aGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwuY29tPiB3cm90ZToKPiA+IAo+ID4gPiBJIGd1ZXNz
IHRoaXMgbWVhbnMgd2Ugc2hvdWxkIGNoZWNrb3V0IHRoZSBiaW5kaW5nIHBhdGNoIGluIExpbnVz
J3MgdHJlZQo+ID4gPiBhbmQgbWVyZ2UgaXQgd2l0aG91dCBvdGhlciBkcml2ZXIgcGF0Y2g/IE9y
IGp1c3QgdGFrZSB0aGUgYmluZGluZyBwYXRjaAo+ID4gPiBmcm9tIHRoZSBwYXRjaCBzZXJpZSBh
bmQgbGV0IHRoZSBnaXQgaWdub3JlIHRoZSBzYW1lIHRoaW5nPwo+ID4gCj4gPiBFaXRoZXIgd2F5
IHdvcmtzLCBpdCB3aWxsIG5vdCBoYXZlIHRoZSBzYW1lIGhhc2ggc28gaXQgd2lsbCBhcHBlYXIg
dHdpY2UKPiA+IGluIHRoZSBoaXN0b3J5IGJ1dCBpdCB3aWxsIGJlIHRleHR1YWxseSBpZGVudGlj
YWwgYW5kIGdpdCB3aWxsIHNvcnQgaXQgb3V0Lgo+ID4gCj4gCj4gQ29vbCwgd2Ugd2lsbCBoYXZl
IGEgdHJ5LCBhbmQgc2VuZCBhIG5ldyBQUiBpZiBldmVyeXRoaW5nIGlzIAo+IGZpbmUuIFRoYW5r
cy4KPiAKCkl0IGxvb2tzIGxpa2UgdGhlcmUgYWx3YXlzIGlzIGEgZHVwbGljYXRlIGNvbW1pdCwg
SSB0aGluayBpdCB3aWxsIGJlCmJldHRlciB0byBob2xkIHRoaXMgcGF0Y2ggYW5kIHN1Ym1pdCBp
dCBpbiB0aGUgbmV4dCBjeWNsZS4gQW55d2F5LAp0aGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbi4K
ClJlZ2FyZHMsCklub2NoaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
