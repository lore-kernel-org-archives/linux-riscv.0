Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBB7C77B75
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 11:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jNQ7zUdb8oTkF9nl9+eXgdcxbZEDmStvxIlotiT6SE0=; b=SboLVcdA0PZAav
	LSkXopm7ivldSOAyiC0UCYywsCa4aLbDdJdDYZvlFJG2XImk9JTnEv3eHG7aEo4EjA8sIU4gbB5cp
	f4/imonhy+DNFu3Mw7z0U0+ad/IoN90Ef+f/qAEDp9WTXNaImq7p4p7LbSUJG/EDThW7kv4jXkBvj
	tENYM1JyHUvqPu2VQkhEG7MDvw9ck+C+VLF4D0IBOU/xwhLGGRW2o8dEy9Ndpaj6yCVnAgy5zpVS2
	xUFdYTMXurhpEgt840jECiuVRnmMnssS7Fkj7Io5cDWHgPN3vgPzd1PRsf8S5rzroA0O7C7MF5r6i
	0gAJWNhwsfVa1upxMC4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzQZ-000Rwi-1P;
	Mon, 08 May 2023 11:53:15 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzQW-000Rvi-2W
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 11:53:14 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1a5197f00e9so30537795ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 04:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683546791; x=1686138791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3BRBVSL8Q8oMs51cYTt5mS52il5fOg1fDJihGv43qY=;
        b=ES80Pxi/On81xqzn466VvCtk334hOGfLr3xn3NTzV4apgRB6RhbwKVZIBTo1IalSBU
         lVcmcysxZ/p/60nF3RQX8UI1koHmb+gb7F5LJZjEVSoVIGSHNIZ9O+CQQqq/ou8vs896
         PsjSxFkz+JnUtxrFW3Jc29Ds2qTuysCBuEk2ac+MWgL1rEcleqYXwdECBvL5XAcvB/Wu
         hGnV8U+fIXsSHGY1953OB4LCCRDAP4Dd+fG/2c0eFv5FtPnxQujLOUpF86J7i47XEM3m
         1YKonECds2h4NnmW4jdkgHVQz2gvVlcClU0sfnJgFqdQkSIDsEQpi42essJJz1Rx3DXZ
         MKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683546791; x=1686138791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3BRBVSL8Q8oMs51cYTt5mS52il5fOg1fDJihGv43qY=;
        b=LCjrmQ6RMJB6YimLgYLvly5ewEEcHdEyUKkY7jbbkvPXuwTUyI5X1Vq8WYlzp6pxK1
         thnYhqws1rFYnTj5eUhv0/jrfYpkD6EU7hVgKJ85gb3IwaTQrxleVUwPnTaoXCBIoRtm
         CH3vgP+2uea6zAfrjjdRARVyvNmeMk64cqSw/ILtjeZSX0K3Tqc1hGfdD5C0Yrzfnl5R
         VXxFRsMnbeJqD2O2AKdw3zzakkcFKTJDs9AM92PvsyYiE3UAW3FI/JFEBGct3kwz20VI
         uV3HCqwBcAUyvOA1LYnnt3+X4Zm4WIiGLTSf9GhaQnJXKooR2zjmC4vCXHfUv6LDWMHf
         bgIw==
X-Gm-Message-State: AC+VfDxpbl4iSAACiK2uo02W0C4NWoCpdKYQ7iXbYJtfeySE719/pQhh
	I94hEcIuQebvcPVXgGNqA1jaUA==
X-Google-Smtp-Source: ACHHUZ53NJaW+sZlrm12uD3x0j9cg0hxSH1iCIdCk/a3op4cRVXeGuLCDkrlAFFwOkN/WoP8UHY5Cg==
X-Received: by 2002:a17:903:2312:b0:1ac:656f:a697 with SMTP id d18-20020a170903231200b001ac656fa697mr6858328plh.21.1683546791698;
        Mon, 08 May 2023 04:53:11 -0700 (PDT)
Received: from sunil-laptop.. ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b001aaed524541sm7015149plz.227.2023.05.08.04.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:53:11 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V5 02/21] platform/surface: Disable for RISC-V
Date: Mon,  8 May 2023 17:22:18 +0530
Message-Id: <20230508115237.216337-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508115237.216337-1-sunilvl@ventanamicro.com>
References: <20230508115237.216337-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_045312_819444_A2743432 
X-CRM114-Status: GOOD (  13.35  )
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
Cc: Weili Qian <qianweili@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tom Rix <trix@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Nick Desaulniers <ndesaulniers@google.com>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Herbert Xu <herbert@gondor.apana.org.au>, Thomas Gleixner <tglx@linutronix.de>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>, Nathan Chancellor <nathan@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

V2l0aCBDT05GSUdfQUNQSSBlbmFibGVkIGZvciBSSVNDLVYsIHRoaXMgZHJpdmVyIGdldHMgZW5h
YmxlZAppbiBhbGxtb2Rjb25maWcgYnVpbGQuIEhvd2V2ZXIsIFJJU0MtViBkb2Vzbid0IHN1cHBv
cnQgc3ViLXdvcmQKYXRvbWljcyB3aGljaCBpcyB1c2VkIGJ5IHRoaXMgZHJpdmVyLiBEdWUgdG8g
dGhpcywgdGhlIGJ1aWxkIGZhaWxzCndpdGggYmVsb3cgZXJyb3IuCgpJbiBmdW5jdGlvbiDigJhz
c2hfc2VxX25leHTigJksCiAgICBpbmxpbmVkIGZyb20g4oCYc3NhbV9yZXF1ZXN0X3dyaXRlX2Rh
dGHigJkgYXQgZHJpdmVycy9wbGF0Zm9ybS9zdXJmYWNlL2FnZ3JlZ2F0b3IvY29udHJvbGxlci5j
OjE0ODM6ODoKLi8uL2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDozOTk6NDU6IGVycm9y
OiBjYWxsIHRvIOKAmF9fY29tcGlsZXRpbWVfYXNzZXJ0XzMzNeKAmSBkZWNsYXJlZCB3aXRoIGF0
dHJpYnV0ZSBlcnJvcjogQlVJTERfQlVHIGZhaWxlZAogIDM5OSB8ICAgICAgICAgX2NvbXBpbGV0
aW1lX2Fzc2VydChjb25kaXRpb24sIG1zZywgX19jb21waWxldGltZV9hc3NlcnRfLCBfX0NPVU5U
RVJfXykKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF4KLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyLmg6Nzg6NDU6IG5vdGU6IGluIGRlZmluaXRpb24g
b2YgbWFjcm8g4oCYdW5saWtlbHnigJkKICAgNzggfCAjIGRlZmluZSB1bmxpa2VseSh4KSAgICBf
X2J1aWx0aW5fZXhwZWN0KCEhKHgpLCAwKQogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXgouLy4vaW5jbHVkZS9saW51eC9jb21waWxlcl90eXBlcy5o
OjM4Nzo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYX19jb21waWxldGltZV9hc3Nl
cnTigJkKICAzODcgfCAgICAgICAgIF9fY29tcGlsZXRpbWVfYXNzZXJ0KGNvbmRpdGlvbiwgbXNn
LCBwcmVmaXgsIHN1ZmZpeCkKICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+Ci4v
Li9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmg6Mzk5Ojk6IG5vdGU6IGluIGV4cGFuc2lv
biBvZiBtYWNybyDigJhfY29tcGlsZXRpbWVfYXNzZXJ04oCZCiAgMzk5IHwgICAgICAgICBfY29t
cGlsZXRpbWVfYXNzZXJ0KGNvbmRpdGlvbiwgbXNnLCBfX2NvbXBpbGV0aW1lX2Fzc2VydF8sIF9f
Q09VTlRFUl9fKQogICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fgouL2luY2x1ZGUv
bGludXgvYnVpbGRfYnVnLmg6Mzk6Mzc6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhj
b21waWxldGltZV9hc3NlcnTigJkKICAgMzkgfCAjZGVmaW5lIEJVSUxEX0JVR19PTl9NU0coY29u
ZCwgbXNnKSBjb21waWxldGltZV9hc3NlcnQoIShjb25kKSwgbXNnKQogICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fgouL2luY2x1ZGUv
bGludXgvYnVpbGRfYnVnLmg6NTk6MjE6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhC
VUlMRF9CVUdfT05fTVNH4oCZCiAgIDU5IHwgI2RlZmluZSBCVUlMRF9CVUcoKSBCVUlMRF9CVUdf
T05fTVNHKDEsICJCVUlMRF9CVUcgZmFpbGVkIikKICAgICAgfCAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fn5+fn5+fn5+fn4KLi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NtcHhjaGcuaDozMzU6
MTc6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhCVUlMRF9CVUfigJkKICAzMzUgfCAg
ICAgICAgICAgICAgICAgQlVJTERfQlVHKCk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCiAgICAgIHwgICAgICAgICAgICAgICAgIF5+fn5+fn5+fgouL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oOjM0NDozMDogbm90ZTogaW4gZXhwYW5zaW9uIG9m
IG1hY3JvIOKAmF9fY21weGNoZ+KAmQogIDM0NCB8ICAgICAgICAgKF9fdHlwZW9mX18oKihwdHIp
KSkgX19jbXB4Y2hnKChwdHIpLCAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fgouL2luY2x1ZGUvbGludXgvYXRv
bWljL2F0b21pYy1pbnN0cnVtZW50ZWQuaDoxOTE2Ojk6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBt
YWNybyDigJhhcmNoX2NtcHhjaGfigJkKIDE5MTYgfCAgICAgICAgIGFyY2hfY21weGNoZyhfX2Fp
X3B0ciwgX19WQV9BUkdTX18pOyBcCiAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn4KZHJpdmVy
cy9wbGF0Zm9ybS9zdXJmYWNlL2FnZ3JlZ2F0b3IvY29udHJvbGxlci5jOjYxOjMyOiBub3RlOiBp
biBleHBhbnNpb24gb2YgbWFjcm8g4oCYY21weGNoZ+KAmQogICA2MSB8ICAgICAgICAgd2hpbGUg
KHVubGlrZWx5KChyZXQgPSBjbXB4Y2hnKCZjLT52YWx1ZSwgb2xkLCBuZXcpKSAhPSBvbGQpKSB7
CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn4KClRoZXJlIGlz
IGN1cnJlbnRseSBubyBwbGFuIHRvIHN1cHBvcnQgdGhpcyBkcml2ZXIgZm9yIFJJU0MtVi4gU28s
CmRpc2FibGUgdGhpcyBkcml2ZXIgZm9yIFJJU0MtViBldmVuIHdoZW4gQUNQSSBpcyBlbmFibGVk
IGZvciBub3cuCgpTaWduZWQtb2ZmLWJ5OiBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3Jv
LmNvbT4KQWNrZWQtYnk6IE1heGltaWxpYW4gTHV6IDxsdXptYXhpbWlsaWFuQGdtYWlsLmNvbT4K
LS0tCiBkcml2ZXJzL3BsYXRmb3JtL3N1cmZhY2UvYWdncmVnYXRvci9LY29uZmlnIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9wbGF0Zm9ybS9zdXJmYWNlL2FnZ3JlZ2F0b3IvS2NvbmZpZyBiL2RyaXZlcnMv
cGxhdGZvcm0vc3VyZmFjZS9hZ2dyZWdhdG9yL0tjb25maWcKaW5kZXggYzExNGY5ZGQ1ZmUxLi44
OGFmYzM4ZmZkYzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGxhdGZvcm0vc3VyZmFjZS9hZ2dyZWdh
dG9yL0tjb25maWcKKysrIGIvZHJpdmVycy9wbGF0Zm9ybS9zdXJmYWNlL2FnZ3JlZ2F0b3IvS2Nv
bmZpZwpAQCAtNCw3ICs0LDcgQEAKIG1lbnVjb25maWcgU1VSRkFDRV9BR0dSRUdBVE9SCiAJdHJp
c3RhdGUgIk1pY3Jvc29mdCBTdXJmYWNlIFN5c3RlbSBBZ2dyZWdhdG9yIE1vZHVsZSBTdWJzeXN0
ZW0gYW5kIERyaXZlcnMiCiAJZGVwZW5kcyBvbiBTRVJJQUxfREVWX0JVUwotCWRlcGVuZHMgb24g
QUNQSQorCWRlcGVuZHMgb24gQUNQSSAmJiAhUklTQ1YKIAlzZWxlY3QgQ1JDX0NDSVRUCiAJaGVs
cAogCSAgVGhlIFN1cmZhY2UgU3lzdGVtIEFnZ3JlZ2F0b3IgTW9kdWxlIChTdXJmYWNlIFNBTSBv
ciBTU0FNKSBpcyBhbgotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
