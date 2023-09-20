Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CC7CE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 08:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kudtX7vomeoEQRS7reuRhNHN/YoAnJ0VmvSddCmk1sM=; b=QyYkV9XB/7POGv
	StbT7JHEG/jaVSY0wstP5g7bThysXfYmZek0hQSqgVb445y1fmfgqNi1bfU0e2U8bWhDeXykrO2MR
	ygFXIivNLgTM3htkKvgJg6ICAkJcHIKI7rSIpk9kxhe9M3KNAtXPZe5qIp4MM74SkbWjuAH2lonN9
	P2u/53cqsnhj1A4gmR2NT5oBX6eGcVfO6i6i8QVyu6OZkagS49MlVaCf6je8MrHW0ZCaial9DJdkH
	+KGYndJtM/r2PCmwXq6ECaiocfLegcDvvQJF4z0Gm804CXXfc3OqGjC0Pg0PZnVJigOaJ3awJaw/4
	K1zsZ90VZLBvZtUb3ugg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qisKg-002F8v-30;
	Wed, 20 Sep 2023 08:13:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qisKe-002F8D-0R
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 08:13:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A69D0B81C0C
	for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 08:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60882C433CA
	for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 08:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695197589;
	bh=BHg2WeM95rpBPjSMtBK54EXDu7Fym4u87Mw9H+3v6no=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FgbS2oaQQz5/ROzre/v3t66FIfY12n+sbyeiA0ewV0IslizhDBg3fMC/84+vZ/ep5
	 VgjuhkUvz258KvDgzSAvbnNYfvvY6H7DvjomLj2uL145N+oHZNZHKcPMuHIVR93ea7
	 HN5vAZ00KgCFHNZP8ARg/RKKSGvhH8/hwNhiSnEh8m8ayYHEFlBI3OZHjZkfFasl8R
	 Gdh7sXZ60vi6bZuyC5Yf/5Nv1KiG4buobDe3lU81Y4ndCUoZN6AwvChFm2E02cKxSm
	 NrLDDzSJm8NKzBoWHnyEk/YWFrK90BYv6oloSNEzcIWv0r5+kpPSjqyunJ9qrkuRfB
	 qmKD5BsNUJ3zw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2bffa8578feso58712511fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 01:13:09 -0700 (PDT)
X-Gm-Message-State: AOJu0YzwkxXtjbI5VjmarvDEvpSNcI/oME/3lS0FtAu7b17gmx3D+hmk
	nfJbqJUiI3gIuJZ4NyxiUajUYDBjQkj9q1T4IFw=
X-Google-Smtp-Source: AGHT+IGwjome/AlKiUn8xGguHpMmW+YpKm8Pe6RU+TH5Vb8xW7yjkVi5Uq+QUgh8oIAyllj23ml6rFP95Ng60vN9ga0=
X-Received: by 2002:a2e:9959:0:b0:2bd:180d:67b7 with SMTP id
 r25-20020a2e9959000000b002bd180d67b7mr1497733ljj.40.1695197587601; Wed, 20
 Sep 2023 01:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695189879.git.wangchen20@iscas.ac.cn> <55865e1ce40d2017f047d3a9e1a9ee30043b271f.1695189879.git.wangchen20@iscas.ac.cn>
In-Reply-To: <55865e1ce40d2017f047d3a9e1a9ee30043b271f.1695189879.git.wangchen20@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 20 Sep 2023 16:12:55 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTTUYuMi4F8wPsEPMwCv7Fqi9OSBTGoaYmzo6cPwdZjjQ@mail.gmail.com>
Message-ID: <CAJF2gTTTUYuMi4F8wPsEPMwCv7Fqi9OSBTGoaYmzo6cPwdZjjQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] dt-bindings: timer: Add Sophgo sg2042 clint
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, 
	devicetree@vger.kernel.org, emil.renner.berthing@canonical.com, 
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, 
	xiaoguang.xing@sophgo.com, Inochi Amaoto <inochiama@outlook.com>, 
	Chen Wang <wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_011312_465283_A534F869 
X-CRM114-Status: GOOD (  16.23  )
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

T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgMjozOeKAr1BNIENoZW4gV2FuZyA8dW5pY29ybnh3QGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAb3V0bG9v
ay5jb20+Cj4KPiBBZGQgdHdvIG5ldyBjb21wYXRpYmxlIHN0cmluZyBmb3JtYXR0ZWQgbGlrZSBg
Qzl4eC1jbGludC14eHhgIHRvIGlkZW50aWZ5Cj4gdGhlIHRpbWVyIGFuZCBpcGkgZGV2aWNlIHNl
cGFyYXRlbHksIGFuZCBkbyBub3QgYWxsb3cgYzkwMC1jbGludCBhcyB0aGUKPiBmYWxsYmFjayB0
byBhdm9pZCBjb25mbGljdC4KUGxlYXNlIGV4cGxhaW4gbW9yZSBhYm91dCB0aGUgYzkwMC1jbGlu
dCBtdGltZXIgJiBtc3dpLCB3aHkgZG8gd2UgbmVlZAp0byBzZXBhcmF0ZSB0aGUgYzkwMC1jbGlu
dCBpbnRvIHR3byBwaWVjZXM/IFdoZW4gY291bGQgd2UgdXNlCmM5MDAtY2xpbnQgd2hpY2ggZWFz
ZXMgZHRzIGRlc2lnbj8KCj4KPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlh
bWFAb3V0bG9vay5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBXYW5nIDx3YW5nY2hlbjIwQGlz
Y2FzLmFjLmNuPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGlt
ZXIvc2lmaXZlLGNsaW50LnlhbWwgfCA4ICsrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwKPiBpbmRleCBhMDE4NWUxNWE0MmYuLmFl
Njk2OTZjNWM3NSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwKPiBAQCAtMzksNiArMzksMTQgQEAg
cHJvcGVydGllczoKPiAgICAgICAgICAgICAgICAtIGFsbHdpbm5lcixzdW4yMGktZDEtY2xpbnQK
PiAgICAgICAgICAgICAgICAtIHRoZWFkLHRoMTUyMC1jbGludAo+ICAgICAgICAgICAgLSBjb25z
dDogdGhlYWQsYzkwMC1jbGludAo+ICsgICAgICAtIGl0ZW1zOgo+ICsgICAgICAgICAgLSBlbnVt
Ogo+ICsgICAgICAgICAgICAgIC0gc29waGdvLHNnMjA0Mi1jbGludC1tdGltZXIKPiArICAgICAg
ICAgIC0gY29uc3Q6IHRoZWFkLGM5MDAtY2xpbnQtbXRpbWVyCj4gKyAgICAgIC0gaXRlbXM6Cj4g
KyAgICAgICAgICAtIGVudW06Cj4gKyAgICAgICAgICAgICAgLSBzb3BoZ28sc2cyMDQyLWNsaW50
LW1zd2kKPiArICAgICAgICAgIC0gY29uc3Q6IHRoZWFkLGM5MDAtY2xpbnQtbXN3aQo+ICAgICAg
ICAtIGl0ZW1zOgo+ICAgICAgICAgICAgLSBjb25zdDogc2lmaXZlLGNsaW50MAo+ICAgICAgICAg
ICAgLSBjb25zdDogcmlzY3YsY2xpbnQwCj4gLS0KPiAyLjI1LjEKPgoKCi0tIApCZXN0IFJlZ2Fy
ZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
