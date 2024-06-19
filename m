Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE16CC2BA15
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 11:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQ+lq6Rsj7G6AWgLqqLbpRqstRpGfJkjlcWWVlHL9Zw=; b=kn5IAJCveCjs7r
	SXM4aaMwct8vOobvVLFSJfQK/Gm6WbMu8NbBH4nJp6mj3ZtC2HNHz60Nm9WODwy+ZixKCnszb6yKv
	8KKdfMTIiJjI/w/1DoNKmAmNSkPCWtWOTampoQ0kl2IiHdg5Shy2esJfYLYRPe+gOv/QvovPDJf/z
	v2Yh7POUtseqpzHETYvx7W7lEM0gMpVlXjcs+UhyQIfltlnYCVY0Iw77w9mQgcGAcTclSaKwc5eTU
	1U1bFH17ivoaJxI25vv6tFbUcbrbgJZ99PpOymeVyNUV0pDHGysWPrWAQzRo5eC2D/bt8ybMDga4r
	oiY22xf/GxKp5qtLSTPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtc9-000000010QC-1jgT;
	Wed, 19 Jun 2024 11:36:33 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbW-00000000zol-26NN
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 11:35:57 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2eae70fb324so7081161fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 04:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718796952; x=1719401752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5oE8gsBvV5fZz1ffXpMzF77ixjq/ISJJW2NOreey68Q=;
        b=nCMPjYKLkm+6wMU8UuYb2iLSnQEOWRCWq0/i8N71WNPcmBR0L0nVlEGWH7k3zDDOh6
         m53vOiQGxJdpBsQ5dRyk+tQCY/NCvFulV17lHt68DPljv4sMjDbkmJb4FhQ4l2iKVDsB
         X9imQSLcLP5axznxtvKDUhziv96Cf75KUc5gyxhWYQh4bpYZHstpJvLma/Z4spflgAAw
         qph6M5S67eemgaDrNkO93R50PLWwketIdFFQJe6RyMZuuPGsATOW6dfrM7pFVSRP5jwh
         iXtgWAKQaZ002zHfQLgTQyaLdz/IjwGEEFEG/wfP12PD695gyZzw1ja8w7cFMNvKwllP
         jsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796952; x=1719401752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5oE8gsBvV5fZz1ffXpMzF77ixjq/ISJJW2NOreey68Q=;
        b=UMT2NvnbrtieerJjDjP9jtb7hXZbICD5v2Rscoodh3yGVMz7yRmIjYUa9gSN1oKpLX
         TgeIMnmVODSkdP2JpdaW06B/mETnQP/TW46S931gvShD3VMyHI1iWOYxg4+kvM6tOIdF
         IInCt+t9A2imza2JIKK2EGZhxGfCIQUfwLXB/PD6bSkJy+85IuCYWMOa91Od+8F8IjN4
         TXzZLzfJESTkkDjoF6e0UJtcvHvymnLgHazRcp3rk0Gmyo0ad7/0/jlC7+S0sWE/kky3
         dNENxTwGGLG55H3/VabDvFr0qmKGANDaEwAnX7RqUqMzZ2G8nDdoMmzmalaDSex797G6
         ut0g==
X-Forwarded-Encrypted: i=1; AJvYcCVmVoo3uym0NWC93mm+cNwvuE04QF0KkLpOkVPOlIIz3UolhRZx7hd7w+AaWPXXfOf2AUPfL99SYYYhtzRfRotYlf6NMoMBgRGr9X47fZR0
X-Gm-Message-State: AOJu0YxyWS0Sssn6Db+0Buh9VJLuS9fixWLD1yucFh9/4mc/AKt8yGUD
	4al+CtJoGLqmj0m36GNxOCcOzqQC3/rdAymkTtwPizv4aR515gCmYCMe+3N9Efg=
X-Google-Smtp-Source: AGHT+IHTtkzZFj1rr1J3MMHIV92yO19IIimUF3KsHK4wEqSnORETlwIu0v29uuJeQFp2SthY6SPnTQ==
X-Received: by 2002:a05:6512:39c4:b0:52c:a657:7e85 with SMTP id 2adb3069b0e04-52ccaa60a8bmr1738253e87.3.1718796952270;
        Wed, 19 Jun 2024 04:35:52 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:e67b:7ea9:5658:701a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9681sm266192075e9.28.2024.06.19.04.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 04:35:51 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v7 11/16] KVM: riscv: selftests: Add some Zc* extensions to get-reg-list test
Date: Wed, 19 Jun 2024 13:35:21 +0200
Message-ID: <20240619113529.676940-12-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619113529.676940-1-cleger@rivosinc.com>
References: <20240619113529.676940-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_043554_894549_D596F2AC 
X-CRM114-Status: UNSURE (   9.35  )
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

VGhlIEtWTSBSSVNDLVYgYWxsb3dzIFpjYSwgWmNmLCBaY2QgYW5kIFpjYiBleHRlbnNpb25zIGZv
ciBHdWVzdC9WTSBzbwphZGQgdGhlc2UgZXh0ZW5zaW9ucyB0byBnZXQtcmVnLWxpc3QgdGVzdC4K
ClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2
aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CkFja2VkLWJ5OiBBbnVw
IFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyB8IDE2ICsrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
a3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCmluZGV4IDhjOGIxMDljZTNjYS4uODY0YTcwMWVmNmMz
IDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1s
aXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlz
dC5jCkBAIC01Niw2ICs1NiwxMCBAQCBib29sIGZpbHRlcl9yZWcoX191NjQgcmVnKQogCWNhc2Ug
S1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJ
U0NWX0lTQV9FWFRfWkJLQzoKIAljYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdf
UklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pCS1g6CiAJY2FzZSBLVk1fUkVH
X1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNB
X0VYVF9aQlM6CisJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lT
QV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0E6CisJY2FzZSBLVk1fUkVHX1JJU0NWX0lT
QV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0I6
CisJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUg
fCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0Q6CisJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBL
Vk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0Y6CiAJY2FzZSBL
Vk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklT
Q1ZfSVNBX0VYVF9aRkE6CiAJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJ
U0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aRkg6CiAJY2FzZSBLVk1fUkVHX1JJ
U0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VY
VF9aRkhNSU46CkBAIC00MjMsNiArNDI3LDEwIEBAIHN0YXRpYyBjb25zdCBjaGFyICppc2FfZXh0
X3NpbmdsZV9pZF90b19zdHIoX191NjQgcmVnX29mZikKIAkJS1ZNX0lTQV9FWFRfQVJSKFpCS0Mp
LAogCQlLVk1fSVNBX0VYVF9BUlIoWkJLWCksCiAJCUtWTV9JU0FfRVhUX0FSUihaQlMpLAorCQlL
Vk1fSVNBX0VYVF9BUlIoWkNBKSwKKwkJS1ZNX0lTQV9FWFRfQVJSKFpDQiksCisJCUtWTV9JU0Ff
RVhUX0FSUihaQ0QpLAorCQlLVk1fSVNBX0VYVF9BUlIoWkNGKSwKIAkJS1ZNX0lTQV9FWFRfQVJS
KFpGQSksCiAJCUtWTV9JU0FfRVhUX0FSUihaRkgpLAogCQlLVk1fSVNBX0VYVF9BUlIoWkZITUlO
KSwKQEAgLTk0OCw2ICs5NTYsMTAgQEAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6YmtiLCBa
QktCKTsKIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemJrYywgWkJLQyk7CiBLVk1fSVNBX0VY
VF9TSU1QTEVfQ09ORklHKHpia3gsIFpCS1gpOwogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6
YnMsIFpCUyk7CitLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpjYSwgWkNBKSwKK0tWTV9JU0Ff
RVhUX1NJTVBMRV9DT05GSUcoemNiLCBaQ0IpLAorS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6
Y2QsIFpDRCksCitLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpjZiwgWkNGKSwKIEtWTV9JU0Ff
RVhUX1NJTVBMRV9DT05GSUcoemZhLCBaRkEpOwogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6
ZmgsIFpGSCk7CiBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpmaG1pbiwgWkZITUlOKTsKQEAg
LTEwMDUsNiArMTAxNywxMCBAQCBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqdmNwdV9jb25maWdzW10g
PSB7CiAJJmNvbmZpZ196YmtjLAogCSZjb25maWdfemJreCwKIAkmY29uZmlnX3picywKKwkmY29u
ZmlnX3pjYSwKKwkmY29uZmlnX3pjYiwKKwkmY29uZmlnX3pjZCwKKwkmY29uZmlnX3pjZiwKIAkm
Y29uZmlnX3pmYSwKIAkmY29uZmlnX3pmaCwKIAkmY29uZmlnX3pmaG1pbiwKLS0gCjIuNDUuMgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
