Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EA2CDB484
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 13:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oekjxn7sGsAhB1xD+rgT8fcFhjKGIyk8NrXrLrxNk/U=; b=lklkeW5K8V/JCV
	EMUymbjTjmkQwvfLY4Pr3PY58CSjDSG/eUyU6l/Ge5YrcTNAaisGPAzQG3vMsE8vDzidsbSJZTHLD
	pah2jBf+o+cQELStkGKJudUscoheY6gAkMYImPPFwbZD+D2yhWN3pA9AL+WpoPdg6vdnURX65JSe1
	Pgy33Mxu4AhWsHFN7mxnYCXfqEp3PFGrOzcDUEIC2kGmJiCGz1Uf0hSx3YPiaUilaR99RCTXvf71R
	4Vf+wvRleSb8oKsf/MU828CJ06OJb7ZqwiC8SxdHP9zSKcXW3yuL/GWRg5CHRGjB73FO6yrj+/Ud4
	Mve7t9seovvu74rVAbhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjvb-00CNhi-0K;
	Tue, 17 Oct 2023 13:16:07 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjvJ-00CNGL-0S
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 13:15:52 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4064e3c7c07so11476465e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 06:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548546; x=1698153346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VR7lcVmAz+UhHjZIcV3xEUmifohwbRxKjtUEu/6fWYw=;
        b=yzuqL6hnXfaqGuGEm7dFEpUKDWkcHDIjUhbBBa+6lufRHasPQTB0uyQKTVMd8uXGuA
         sIndgCRzG/s86AN90rWDChuE238LngOj9Y5HWmmNWJNvvZ4e4quNlSeIhGfyaODIAFRm
         t1JD//ZZLu7QxK3bWrCaZN+UV401sFGwEr6PwtzEmUMFcUHXFeXMGvyXzwf0aDVwWl6n
         A08CJW3lZqoTysU1vFq2Mte+yaQs17BaM1Dyk7JDc0dKAE2O3HxPMxpXLPcCg8Ur8g0E
         TYm6UzDo7+TFStQkGGw135C1bJOB/cyMNO2WfPhk+Utv2locKSoMSHFO7spdMWnOlUCz
         FtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548546; x=1698153346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VR7lcVmAz+UhHjZIcV3xEUmifohwbRxKjtUEu/6fWYw=;
        b=twFDZtjkvRY2ZqOh1nAEfgwjaPY9AnaLn24eXBNM41kc4J2qH6nv5aFYcAgw5hTp0Y
         KNO/+jBS4DMSVVInv7xdpoYKC001HdjO7B28o/+phm0cMY7RxMqLeNYn/FDteA872YZz
         mGUdQ1VJhAtRSpclCDGcONE2hmREAPgV+v22jZ7x8nsx9VgBvIpHl/nSHz6gG3yUmYdN
         Fz9u55hxFooN6OtyN27n2+CdMxfJywoAurKF1nx6fHQZHixFcvqC/CedcRIbtyD2Db9y
         bQkjGeYVRagamPWeOkAR57srNjfmUxacI3+k2cxjZ7YYViutDfACW37fjD0KNephpNza
         snGw==
X-Gm-Message-State: AOJu0Yw4BS3qFb/NVEayJxSYU0Nhr9rsGByXqQIY/LTkoeGVjCznNZoC
	lB/fFogmYFK6po+iJplFEhIstdMPP7kw11Tw4CqAQA==
X-Google-Smtp-Source: AGHT+IHIQDkhluCQslFyJdgDxKAY9q+c4pJ4JyE/Vo42cW4xdwk6uSfnB9uiUpQR0s0lka7NJ6WUWQ==
X-Received: by 2002:a05:600c:5026:b0:404:75cc:62e6 with SMTP id n38-20020a05600c502600b0040475cc62e6mr1650073wmr.3.1697548545908;
        Tue, 17 Oct 2023 06:15:45 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:45 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>
Subject: [PATCH v2 19/19] dt-bindings: riscv: add Zfa ISA extension description
Date: Tue, 17 Oct 2023 15:14:56 +0200
Message-ID: <20231017131456.2053396-20-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017131456.2053396-1-cleger@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_061549_226065_99F7AA5D 
X-CRM114-Status: UNSURE (   8.98  )
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

QWRkIGRlc2NyaXB0aW9uIGZvciB0aGUgWmZhIElTQSBleHRlbnNpb25bMV0gd2hpY2ggY2FuIG5v
dyBiZQpyZXBvcnRlZCB0aHJvdWdoIGh3cHJvYmUgZm9yIHVzZXJzcGFjZSB1c2FnZS4KCkxpbms6
IGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMVZUNlFJZ2dwYjU5LThRUlYyNjZkRUU0
VDhGWlR4R3E0L3ZpZXcgWzFdClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcmlz
Y3YvZXh0ZW5zaW9ucy55YW1sIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcmlz
Y3YvZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jp
c2N2L2V4dGVuc2lvbnMueWFtbAppbmRleCAwNzY3ODU2NGYxMWQuLjMwMzNhZmNlYTAzMyAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lv
bnMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0
ZW5zaW9ucy55YW1sCkBAIC0yMDgsNiArMjA4LDEyIEBAIHByb3BlcnRpZXM6CiAgICAgICAgICAg
ICBpbnN0cnVjdGlvbnMgYXMgcmF0aWZpZWQgYXQgY29tbWl0IDZkMzM5MTkgKCJNZXJnZSBwdWxs
IHJlcXVlc3QgIzE1OAogICAgICAgICAgICAgZnJvbSBoaXJvb2loL2NsbXVsLWZpeC1sb29wLWVu
ZC1jb25kaXRpb24iKSBvZiByaXNjdi1iaXRtYW5pcC4KIAorICAgICAgICAtIGNvbnN0OiB6ZmEK
KyAgICAgICAgICBkZXNjcmlwdGlvbjoKKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBaZmEgZXh0
ZW5zaW9uIGZvciBhZGRpdGlvbmFsIGZsb2F0aW5nIHBvaW50CisgICAgICAgICAgICBpbnN0cnVj
dGlvbnMsIGFzIHJhdGlmaWVkIGluIGNvbW1pdCAwNTZiNmZmICgiWmZhIGlzIHJhdGlmaWVkIikg
b2YKKyAgICAgICAgICAgIHJpc2N2LWlzYS1tYW51YWwuCisKICAgICAgICAgLSBjb25zdDogemZo
CiAgICAgICAgICAgZGVzY3JpcHRpb246CiAgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWmZoIGV4
dGVuc2lvbiBmb3IgMTYtYml0IGhhbGYtcHJlY2lzaW9uIGJpbmFyeQotLSAKMi40Mi4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
