Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8795EC47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 12:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bt+hmDLtDLYn6FzmwOspoFenHwgepazyWImjPrFfi0Q=; b=i9GiOTM+vLs6Sd
	WS9MbCcu3pr1bAD0R0d/A9CrSRpdia/Abyqq9AkZQMCP/NPWHwPqndHEBrJGP25MGG3p4eI1eqLTR
	aIr/1CGJLBvSVzjAbrzTvcz2pN1tpzFGGzagnKJFqnEjAanQy/3iY1fIEhL3zU3ffAOUXfXYxyYn6
	MRB5xBSJZJdXfscLkcFGew/PM7K/CGlCeBE3VAHiwDiuhAO50gePvc94eihtUGC9Gcx8AbeAXnjyb
	RY0wRzhj3P2SMg1VBoC9K9wAJzZSKHJ/kI3LqfZa+p+pf7sHfwJlLieTMvCFtM6r1kaasccIKiVvH
	b+OB/vgaCxfOZbKRLPWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLN8I-00E0rv-0T;
	Thu, 04 Jan 2024 12:47:34 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLN8G-00E0rE-07
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 12:47:33 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a27cc46d40bso57190166b.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 04:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704372448; x=1704977248; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4/T6LM2cR9BhRuyec6i7dIzoBYTu6Jc/wC4bPpGSrs=;
        b=f0LTwujjqta0nkzGMtw5ejKEp0E0o30L9EHpTKZ/jixpx01tA2nn72SaUAZKD5aRT6
         8yWPE6q3dyTLTYdLgF0pIan0e9ejglPVCJOCNjER5MNFdUiH7/Zn2fRtvSkmrV+AIsXs
         F7r1Z/IeJ09HEjOQ5dTc1YXH68Z+m6JetRXHPbIjWJMO4vvp6Mgu6K+Utndfu/V1qBO1
         sg8a/ex4AF4d+ERmgxWJC6vbRv+hSFzg7SYU/pkjfVycRfFBBPS30djTaShjL/VFK5KQ
         JkNKXYQ+QvXg5E4IIRLYf4UN8kq3z5tU18ZpttWCHBQJdHu6erN/e9pDWZYkCPJGQiNI
         j0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704372448; x=1704977248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4/T6LM2cR9BhRuyec6i7dIzoBYTu6Jc/wC4bPpGSrs=;
        b=QYd46fMWDYuepagLqNMMkKIcEliBgIK+pIvdU9HLuSfxEWuR7CsCQIDEBBQEeYrmfV
         AfNZlIpQweI8fzJPHhdH2h0rRXE75ueRiifzCi2M0Q3MN4w5sign4P7BWhjMxswOmyNj
         Y6T9ePp7nVbco2JQkDh7fybAOkDidx5/DfspV6NSkXrnrJXXQQRRUIq1iEBDt56RbqYv
         l+HMvQYDo+7JBkOoSKlk6nUNIyvO0DZ51LcnKmSftiAjwoilI4AVWU5DJPMONYQvolN1
         V2ABReigOF4g3c7r3MlQ5FDqfo48t1jJbtnN57DiFsi7ThDGTQXQ7PmBiDuXOLBE1E59
         wCuQ==
X-Gm-Message-State: AOJu0YxxB1TjGUm1Aa+s6KCZaJkBk1EeHmKcgstoKHezgH+qmdJqKOtO
	35a9knrjSKqEa/9uarBoZUes+lv3ZQIjQPwdVFRApm8AI2Pwdw==
X-Google-Smtp-Source: AGHT+IHUQ3YoVaFmv46BhHeLVQ5EJ1NE0eAcs7J5rojOmYSHjoP6iLNHAvk7t77NJdQ/bytQn9xnJQcuGL/1iBdPOgY=
X-Received: by 2002:a17:906:f34c:b0:a28:b7e1:e24b with SMTP id
 hg12-20020a170906f34c00b00a28b7e1e24bmr195383ejb.162.1704372448064; Thu, 04
 Jan 2024 04:47:28 -0800 (PST)
MIME-Version: 1.0
References: <20240102220134.3229156-1-samuel.holland@sifive.com> <20240102220134.3229156-11-samuel.holland@sifive.com>
In-Reply-To: <20240102220134.3229156-11-samuel.holland@sifive.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 4 Jan 2024 13:47:17 +0100
Message-ID: <CAHVXubg4T8ViOvEzd-WoQww_z=CpHetSjjAscfw2qXVCv2zx2g@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] riscv: mm: Make asid_bits a local variable
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_044732_078103_55F40E45 
X-CRM114-Status: GOOD (  14.54  )
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

T24gVHVlLCBKYW4gMiwgMjAyNCBhdCAxMTowMeKAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRoaXMgdmFyaWFibGUgaXMgb25seSB1c2Vk
IGluc2lkZSBhc2lkc19pbml0KCkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8
c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPiAtLS0KPgo+IChubyBjaGFuZ2VzIHNpbmNlIHYx
KQo+Cj4gIGFyY2gvcmlzY3YvbW0vY29udGV4dC5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvbW0vY29udGV4dC5jIGIvYXJjaC9yaXNjdi9tbS9jb250ZXh0LmMKPiBpbmRleCBiNTE3MGFj
MWI3NDIuLjQzYThiYzJkNWFmNCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2NvbnRleHQu
Ywo+ICsrKyBiL2FyY2gvcmlzY3YvbW0vY29udGV4dC5jCj4gQEAgLTIwLDcgKzIwLDYgQEAKPgo+
ICBERUZJTkVfU1RBVElDX0tFWV9GQUxTRSh1c2VfYXNpZF9hbGxvY2F0b3IpOwo+Cj4gLXN0YXRp
YyB1bnNpZ25lZCBsb25nIGFzaWRfYml0czsKPiAgc3RhdGljIHVuc2lnbmVkIGxvbmcgbnVtX2Fz
aWRzOwo+Cj4gIHN0YXRpYyBhdG9taWNfbG9uZ190IGN1cnJlbnRfdmVyc2lvbjsKPiBAQCAtMjI2
LDcgKzIyNSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzZXRfbW0oc3RydWN0IG1tX3N0cnVjdCAq
cHJldiwKPgo+ICBzdGF0aWMgaW50IF9faW5pdCBhc2lkc19pbml0KHZvaWQpCj4gIHsKPiAtICAg
ICAgIHVuc2lnbmVkIGxvbmcgb2xkOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBhc2lkX2JpdHMs
IG9sZDsKPgo+ICAgICAgICAgLyogRmlndXJlLW91dCBudW1iZXIgb2YgQVNJRCBiaXRzIGluIEhX
ICovCj4gICAgICAgICBvbGQgPSBjc3JfcmVhZChDU1JfU0FUUCk7Cj4gLS0KPiAyLjQyLjAKPgoK
WW91IGNhbiBhZGQ6CgpSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2
b3NpbmMuY29tPgoKVGhhbmtzLAoKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
