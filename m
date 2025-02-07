Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C112CC02194
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 17:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HBIC9f8xbrvB2hl9nEXJJA/SXv2gDIFm2pZyfC3GWM4=; b=qbbFHpz1ZQGgK+
	KigR2yzWfG/P/XJWEy8BCgNmIZYnvm9REaR6Pm2O8+HeMbSNP8iUCADJHJqWPf4cHT6rtPydnrVT8
	srAR/2A6RUawvbPn6lAzt7UgRTPjA1dN6wwZXwJH3Kk8IA6RsqDLWlbcN1TL7FAY7G+tjA54aYlgu
	ZRcXeVOPUtk5MNezaaP3mIf279Kk+sVzqCMqL6DoPex+Y9DksIOTMIJfPQXBfBX/yjzrrbgR22BwU
	qH+IVq3qfxNLvKeo7sL+sgJ5QGtCv3uDi+gujRrvLPbASCEnt0bAV5KNtNeKtFr8n0OiXVF1luz/U
	93Me747E/oRXfqOCQrGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRoK-0000000AQ1E-2bhc;
	Fri, 07 Feb 2025 17:06:36 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRR7-0000000AKiN-0luH
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 16:42:38 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-38db570a639so1341594f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 08:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738946555; x=1739551355; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bhByG6ma/CCtg99IeiiHau0X6tUcp/TIvfIcykd8Mjw=;
        b=zHZItKcdKTezegiA6NkG0DpVxTW0CbH4qwFDhMjz+nuzaBfN2fKaGaXd3Kci3XKeM1
         kYevVTxDuOBvTYjnAMGt1wNf2pbH3a+96hVmhWzpxd05C3w/UEjWiMv+GN234n0HGnLX
         Fu3SvRInnk0goGcbfouaMoO0z9J6D9QGlYD9FoDvW1sI680aPQRq4gmWAUnABcgJzCWD
         xep2SkkjQtSCPp4PGWuZ7TulM7M60qd4JRczGSQp8tZtQYC6/jcjQXJ15HKmTbU1TZm2
         GFDV49tk+E75XGo4frsHDBMPudBupZTcet6XeMpYBtxN2XG3L8dAk4pp3l9Shh30q+bp
         bNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738946555; x=1739551355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bhByG6ma/CCtg99IeiiHau0X6tUcp/TIvfIcykd8Mjw=;
        b=CMKCpysBj5udyWmCbnQQVs4792MMRLN4olq99saBpVN6iyGAgut0C3725ApAbX/LWJ
         X2TrAPx2MZmPapEkeTQaN86selZkIYao1T+hjqPJvSsjK/KSbEfgETx76XJehwPxjWr9
         N8TnPDMYfOx5Pf5Y0WeJLgYfi/spm8NZvUQnO8hAYIjdSeTY1d/oHOPIhObBtjxgODjP
         Z3o5uKwzNvEegbpdnlDuk3PlcTydNq+Gdmy1X0nYibLNahZkgQSVh7Q2tfpZQBImD3T5
         pLVFHqLBBM7TgU9chrpTFvB7+7z4hHI/71NaecMnhu8Th69Q5mdmDcLyBq243glu8Ssc
         6HeA==
X-Forwarded-Encrypted: i=1; AJvYcCWqBCnQhG2tw29QlrMCdt9nifg0eKxKh4mDffceIsSY5KdX5KvUmrc2K61m205IZ+1MTlH8DGjmVyVLxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMLVHMCPSoeb7lIjHXTGFgGqDEsSrWqmiAJLVXu3jCt6z2bgS9
	Uv9JwJu0X5GVYkvJxDQNvQtJbGMrE0wOsje3kWgLNpCWvlDVFPj9zmewphwKHCE=
X-Gm-Gg: ASbGnctmmeyOTQuxbO9SxuQsTP0eg9NHVc3hC/rSxxk7Jb92YTO/L2cLCxfRpddnO1e
	Y57/5y/N6Byi7Cdt07iAXCRoO+VRp4JCYMp4J7dSsfBqvEa4mvK9etI9J4BcJgMmilSxMfZ6JqM
	o9eQWvlS7dD3K62+Xdcfvlk6Av2fG+r4730bD+1tbWpexG8YTWHWiodNbfJdCkhbetBP421SMWl
	ncW8zJSCf7StL4Gv0gHJKG1diZOMMZbYgG+bEwYxAFRRfPny56itQ2U8lqFLQOKYWNRz4Lm4L0f
	fmOll7FhdVknsY13Ay8DZSG5gWni3iXnt+fjKSzI8LEA6jKHkhMNdNxSdGbC
X-Google-Smtp-Source: AGHT+IFndOVqVL6fCq+3s96eJy475G+cWXMlxn4LNE1FeT93u8xS7tBkrWZrckpAsU4XEeMbaXtLdQ==
X-Received: by 2002:a5d:5f48:0:b0:386:37f8:451c with SMTP id ffacd0b85a97d-38dbb20b159mr7040560f8f.1.1738946555464;
        Fri, 07 Feb 2025 08:42:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d40csm94877305e9.9.2025.02.07.08.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 08:42:34 -0800 (PST)
Message-ID: <95bcf744-63b0-4b44-800e-ff2ba1ddf86a@rivosinc.com>
Date: Fri, 7 Feb 2025 17:42:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] riscv: Change check_unaligned_access_speed_all_cpus
 to void
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com,
 jesse@rivosinc.com, Anup Patel <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-15-ajones@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250207161939.46139-15-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_084237_390696_4B2B8C3B 
X-CRM114-Status: GOOD (  17.32  )
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

CgpPbiAwNy8wMi8yMDI1IDE3OjE5LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gVGhlIHJldHVybiB2
YWx1ZSBvZiBjaGVja191bmFsaWduZWRfYWNjZXNzX3NwZWVkX2FsbF9jcHVzKCkgaXMgYWx3YXlz
Cj4gemVybywgc28gbWFrZSB0aGUgZnVuY3Rpb24gdm9pZCBzbyB3ZSBkb24ndCBuZWVkIHRvIGNv
bmNlcm4gb3Vyc2VsdmVzCj4gd2l0aCBpdC4gVGhlIGNoYW5nZSBhbHNvIGFsbG93cyB1cyB0byB0
aWR5IHVwCj4gY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19hbGxfY3B1cygpIGEgYml0Lgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0t
Cj4gIGFyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYyB8IDE1ICsrKysr
LS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vz
c19zcGVlZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jCj4g
aW5kZXggMDJiNDg1ZGM0YmM0Li43ODBmMWM1ZjUxMmEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jCj4gQEAgLTIxOCw3ICsyMTgsNyBAQCBzdGF0aWMg
aW50IHJpc2N2X29mZmxpbmVfY3B1KHVuc2lnbmVkIGludCBjcHUpCj4gIH0KPiAgCj4gIC8qIE1l
YXN1cmUgdW5hbGlnbmVkIGFjY2VzcyBzcGVlZCBvbiBhbGwgQ1BVcyBwcmVzZW50IGF0IGJvb3Qg
aW4gcGFyYWxsZWwuICovCj4gLXN0YXRpYyBpbnQgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nl
c3Nfc3BlZWRfYWxsX2NwdXModm9pZCkKPiArc3RhdGljIHZvaWQgX19pbml0IGNoZWNrX3VuYWxp
Z25lZF9hY2Nlc3Nfc3BlZWRfYWxsX2NwdXModm9pZCkKPiAgewo+ICAJdW5zaWduZWQgaW50IGNw
dTsKPiAgCXVuc2lnbmVkIGludCBjcHVfY291bnQgPSBudW1fcG9zc2libGVfY3B1cygpOwo+IEBA
IC0yMjYsNyArMjI2LDcgQEAgc3RhdGljIGludCBfX2luaXQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vz
c19zcGVlZF9hbGxfY3B1cyh2b2lkKQo+ICAKPiAgCWlmICghYnVmcykgewo+ICAJCXByX3dhcm4o
IkFsbG9jYXRpb24gZmFpbHVyZSwgbm90IG1lYXN1cmluZyBtaXNhbGlnbmVkIHBlcmZvcm1hbmNl
XG4iKTsKPiAtCQlyZXR1cm4gMDsKPiArCQlyZXR1cm47Cj4gIAl9Cj4gIAo+ICAJLyoKPiBAQCAt
MjYxLDEyICsyNjEsMTAgQEAgc3RhdGljIGludCBfX2luaXQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vz
c19zcGVlZF9hbGxfY3B1cyh2b2lkKQo+ICAJfQo+ICAKPiAgCWtmcmVlKGJ1ZnMpOwo+IC0JcmV0
dXJuIDA7Cj4gIH0KPiAgI2Vsc2UgLyogQ09ORklHX1JJU0NWX1BST0JFX1VOQUxJR05FRF9BQ0NF
U1MgKi8KPiAtc3RhdGljIGludCBfX2luaXQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19zcGVlZF9h
bGxfY3B1cyh2b2lkKQo+ICtzdGF0aWMgdm9pZCBfX2luaXQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vz
c19zcGVlZF9hbGxfY3B1cyh2b2lkKQo+ICB7Cj4gLQlyZXR1cm4gMDsKPiAgfQo+ICAjZW5kaWYK
PiAgCj4gQEAgLTQwMywxMCArNDAxLDEwIEBAIHN0YXRpYyBpbnQgX19pbml0IHZlY19jaGVja191
bmFsaWduZWRfYWNjZXNzX3NwZWVkX2FsbF9jcHVzKHZvaWQgKnVudXNlZCBfX2Fsd2F5Cj4gIAo+
ICBzdGF0aWMgaW50IF9faW5pdCBjaGVja191bmFsaWduZWRfYWNjZXNzX2FsbF9jcHVzKHZvaWQp
Cj4gIHsKPiAtCWJvb2wgYWxsX2NwdXNfZW11bGF0ZWQ7Cj4gIAlpbnQgY3B1Owo+ICAKPiAtCWFs
bF9jcHVzX2VtdWxhdGVkID0gY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1
cygpOwo+ICsJaWYgKCFjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKCkp
Cj4gKwkJY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19zcGVlZF9hbGxfY3B1cygpOwo+ICAKPiAgCWlm
ICghaGFzX3ZlY3RvcigpKSB7Cj4gIAkJZm9yX2VhY2hfb25saW5lX2NwdShjcHUpCj4gQEAgLTQx
Nyw5ICs0MTUsNiBAQCBzdGF0aWMgaW50IF9faW5pdCBjaGVja191bmFsaWduZWRfYWNjZXNzX2Fs
bF9jcHVzKHZvaWQpCj4gIAkJCSAgICBOVUxMLCAidmVjX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nf
c3BlZWRfYWxsX2NwdXMiKTsKPiAgCX0KPiAgCj4gLQlpZiAoIWFsbF9jcHVzX2VtdWxhdGVkKQo+
IC0JCXJldHVybiBjaGVja191bmFsaWduZWRfYWNjZXNzX3NwZWVkX2FsbF9jcHVzKCk7Cj4gLQo+
ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCgpIaSBBbmRyZXcsCgpJIGhhZCBhIHNpbWlsYXIgcGF0Y2gg
aW4gYW4gdXBjb21pbmcgc2VyaWVzIGJ1dCB5b3Ugd2VyZSBmYXN0ZXIgIQoKUmV2aWV3ZWQtYnk6
IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KClRoYW5rcywKCkNsw6ltZW50
CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
