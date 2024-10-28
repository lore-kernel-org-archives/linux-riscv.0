Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD3DD13588
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 04:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Uy3SAk3lUmAMjBas2E5nMeSfm7WuKq/yefAXR8SI0M=; b=s1mtgAbJL4lVhk
	rW6jnQrGrYPaKy191sRwG64RUVl2FJJ98h8pR5ncZ/O47B+8ROBS1dKDgR4GCd+ax1v3rgG4IzfJB
	L4WP/ezWTBhBKn3/NoX67aU8Ja7Ti0ThWFZ8rnTPwMDKRWCeGG8KGtfsj4MSPNh0e+AjMdXpWzZjP
	TSRJi2Sq69m7+T7+xskP+imfxKFhlNoj7483XSJwyEFexUQzCcGn5ZLNHuS3UF+Aw6azKaU8rdKk5
	0w7ywL2CMZTPXttHdY9X2ICBwZxxH3N19CcSbkkSdprPgNQr/z9zJcq+luHt3UQbyCI6a+GG+80FV
	Z74+XDG+RWvAi/6XQHag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5GxD-00000009Uuv-1LyY;
	Mon, 28 Oct 2024 04:02:07 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Gx9-00000009UuS-1O7Q
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 04:02:05 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-83ac05206c9so144258139f.3
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 21:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1730088121; x=1730692921; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTkrMIwVXtDibKqC0zJplXVw97dLp3stcJak0OUNlGQ=;
        b=k+6QZRa8IVPE4g2Pl0N4shHF5fy35o4ZyWfJx3chIKXDFidv29ZooMAbpgBAYGAAEq
         DyS9xs5lKeOa6ulkj2a4j32AJqY5Kdfj0z2zVqZmzvfwnp2dJcdVdAF+yf8reGuHgvjk
         Nq+JBOcCcDaNKLSnKQn/M9EzBs2yOVhu5AMpOIAZf2kh2EQCKWR+uiKWM5pwpPeDgrux
         B3y+V9yk7CGZwz7G+s3SjFX09FwEbA6qek3O+2x4wEu+1QIfsfYHRGF8HqaNHC1OdIwW
         AYowhGuJzLCaoTW7ulQcOSV+iqe2jC/kqrGXW+zjjzSmayAZsIfmot+4X9ks5Cd6cCOS
         OzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730088121; x=1730692921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTkrMIwVXtDibKqC0zJplXVw97dLp3stcJak0OUNlGQ=;
        b=r59kJEiFy6E9b5oC/tDE8r8pd46Q8ncVQqyvjBAibwCd/4TOVWjMC50groD+5hoK/i
         OekeNNroaBWGxwBRZICaQwBkYTDHlu41zJSgCZJ7pvfeTd6nx3DwfC7MhiRzChnHrzmI
         oAClmCIxN1KUeb+RDgFkcuUxS3uDZ/qiHptM4Yq7L8yPKWNF2LbqrmQ+zO3bCertDYKw
         /htKbpR2LZqg+oDjI8GvaHWCKAIHTqb6kwq7vrYjche0siwzL+DJIjO4h136i2aUgdQ3
         0ndFYWSNVU3Zwvm3M0MLNWw6VCBjrW44LVTMB/EKx8W6406oNsXJWWTE0u+/jJlcy8H4
         C9ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVR+r9TW5KCwvwRPUAOg+uXvQiLiKVUrpIFrY7N0wP2LVwGVqsdEKeV1u5yJEg7ZsOpbtujMY1KLehvBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzW+b0Sw6oKkr0rESUqmWv8OoqRhYsZoOlB+K4iFFbw2Mn6Kfdz
	XJAJyXYB585cj61Ooz3jEV5QPRowuZYi3BrO9Ke11zcX1ib1DvAtnMbGHbfjM2h56Gsl09ZB4Qf
	0bgbsAdRKtCh4sYSgNf1NSp2QRNi7G/Uwo12bAQ==
X-Google-Smtp-Source: AGHT+IEW3RMxsb+OkLSwXzoPgDRun4PeWtdHYycalmOdPki2HQ/g+qJQULY+edvSYHMAhxM7DrjE17H2RyAh5VkTZ8A=
X-Received: by 2002:a05:6e02:16cf:b0:3a0:8d60:8b7d with SMTP id
 e9e14a558f8ab-3a4ed2aaddfmr68350065ab.11.1730088121508; Sun, 27 Oct 2024
 21:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20241028033928.223218-1-nick.hu@sifive.com> <20241028033928.223218-2-nick.hu@sifive.com>
In-Reply-To: <20241028033928.223218-2-nick.hu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Oct 2024 09:31:49 +0530
Message-ID: <CAAhSdy1AmSmnGV6GbHgcWe2pXuS4sF8wat_po05Mpiho2hD4SQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: Add stimecmp save and restore
To: Nick Hu <nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_210203_668787_3BF90855 
X-CRM114-Status: GOOD (  15.49  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, zong.li@sifive.com, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Pavel Machek <pavel@ucw.cz>, Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBPY3QgMjgsIDIwMjQgYXQgOTowOeKAr0FNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBJZiB0aGUgSFcgc3VwcG9ydCB0aGUgU1NUQyBleHRlbnNpb24sIHdl
IHNob3VsZCBzYXZlIGFuZCByZXN0b3JlIHRoZQo+IHN0aW1lY21wIHJlZ2lzdGVyIHdoaWxlIGNw
dSBub24gcmV0ZW50aW9uIHN1c3BlbmQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEh1IDxuaWNr
Lmh1QHNpZml2ZS5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3N1c3BlbmQuaCB8ICA0ICsrKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvc3VzcGVuZC5jICAg
ICAgfCAxNCArKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N1c3BlbmQuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc3VzcGVuZC5oCj4gaW5kZXggNGZmYjAyMmIwOTdmLi5kYzU3
ODJiNWZiYWQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zdXNwZW5kLmgK
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N1c3BlbmQuaAo+IEBAIC0xOCw2ICsxOCwx
MCBAQCBzdHJ1Y3Qgc3VzcGVuZF9jb250ZXh0IHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgaWU7
Cj4gICNpZmRlZiBDT05GSUdfTU1VCj4gICAgICAgICB1bnNpZ25lZCBsb25nIHNhdHA7Cj4gKyAg
ICAgICB1bnNpZ25lZCBsb25nIHN0aW1lY21wOwo+ICsjaWYgX19yaXNjdl94bGVuIDwgNjQKPiAr
ICAgICAgIHVuc2lnbmVkIGxvbmcgc3RpbWVjbXBoOwo+ICsjZW5kaWYKPiAgI2VuZGlmCj4gIH07
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3VzcGVuZC5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvc3VzcGVuZC5jCj4gaW5kZXggOWE4YTBkYzAzNWIyLi4yNGIzZjU3ZDQ2N2YgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3VzcGVuZC5jCj4gKysrIGIvYXJjaC9yaXNj
di9rZXJuZWwvc3VzcGVuZC5jCj4gQEAgLTMwLDYgKzMwLDEzIEBAIHZvaWQgc3VzcGVuZF9zYXZl
X2NzcnMoc3RydWN0IHN1c3BlbmRfY29udGV4dCAqY29udGV4dCkKPiAgICAgICAgICAqLwo+Cj4g
ICNpZmRlZiBDT05GSUdfTU1VCj4gKyAgICAgICBpZiAocmlzY3ZfaGFzX2V4dGVuc2lvbl91bmxp
a2VseShSSVNDVl9JU0FfRVhUX1NTVEMpKSB7Cj4gKyAgICAgICAgICAgICAgIGNvbnRleHQtPnN0
aW1lY21wID0gY3NyX3JlYWQoQ1NSX1NUSU1FQ01QKTsKPiArI2lmIF9fcmlzY3ZfeGxlbiA8IDY0
Cj4gKyAgICAgICAgICAgICAgIGNvbnRleHQtPnN0aW1lY21waCA9IGNzcl9yZWFkKENTUl9TVElN
RUNNUEgpOwo+ICsjZW5kaWYKPiArICAgICAgIH0KPiArCj4gICAgICAgICBjb250ZXh0LT5zYXRw
ID0gY3NyX3JlYWQoQ1NSX1NBVFApOwo+ICAjZW5kaWYKPiAgfQo+IEBAIC00Myw2ICs1MCwxMyBA
QCB2b2lkIHN1c3BlbmRfcmVzdG9yZV9jc3JzKHN0cnVjdCBzdXNwZW5kX2NvbnRleHQgKmNvbnRl
eHQpCj4gICAgICAgICBjc3Jfd3JpdGUoQ1NSX0lFLCBjb250ZXh0LT5pZSk7Cj4KPiAgI2lmZGVm
IENPTkZJR19NTVUKPiArICAgICAgIGlmIChyaXNjdl9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5KFJJ
U0NWX0lTQV9FWFRfU1NUQykpIHsKPiArICAgICAgICAgICAgICAgY3NyX3dyaXRlKENTUl9TVElN
RUNNUCwgY29udGV4dC0+c3RpbWVjbXApOwo+ICsjaWYgX19yaXNjdl94bGVuIDwgNjQKPiArICAg
ICAgICAgICAgICAgY3NyX3dyaXRlKENTUl9TVElNRUNNUEgsIGNvbnRleHQtPnN0aW1lY21waCk7
Cj4gKyNlbmRpZgo+ICsgICAgICAgfQo+ICsKPiAgICAgICAgIGNzcl93cml0ZShDU1JfU0FUUCwg
Y29udGV4dC0+c2F0cCk7Cj4gICNlbmRpZgo+ICB9Cj4gLS0KPiAyLjM0LjEKPgo+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
