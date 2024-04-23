Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA678C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 12:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jgxuhDBjxValMLNOIrh8igDwcZ2b1SSWp1ElN2Yxv0Y=; b=YiHVKRVgVYTItF
	mbd5Y/H/nNkGzLkRA1/kkdzgxacUGzyH6qW17HrpV+bqPLHMl2XDULUQq/JF/gilWo/H+uJ6I5FIS
	oWzJJd8cgKTRBKQ+qIciI1sEILXw5Udw2k2Eijmp8N15R660gZUMTikmhl8sOB8UYFB9jmRSUgci4
	iPGUuaYT1Li9nQke3p5uLQ3dhrHIF4fy6tFPf6dR3pXlTShSzRaonxzquvsof+V1YGayhyKdPuF36
	hqoScNOesWcwRmwQ8wBIL2c4rzfMyvf/EcVDUn0yH1FixV9ULSxuhOX5slHvCXt4bmMAPYnNzqEc7
	NA/tkLJI/ssqyjEmAA4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFVW-0000000HSrd-0Aky;
	Tue, 23 Apr 2024 12:44:22 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFUy-0000000HSOl-04Em
	for linux-riscv@lists.infradead.org;
	Tue, 23 Apr 2024 12:43:50 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-346407b8c9aso1491771f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Apr 2024 05:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713876226; x=1714481026; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKUXibPhUwjjSXA/KBDdbbKS1P63ijLLovqIt9fNrZc=;
        b=SvIBd1oKLjTOgIxfAJE1rWeFIInK3DjeJbpWz/gFTjXCF7H/0Ve+QKi+qvW5UZTj6Z
         GeMUAGJCGlh8p6P9JuTx29buR9iwcKDzTPlRSE/B/0lfa7hSU0tEg699412aEGRFM7oX
         ANlCGRWyNoaSNua3kS4GQYhSpF03PKhEe6RX3F6dS5njH1i2Uak68wzK1Ij07WEMzyzo
         fZ5EgMePGUijZF5BUVwgeAgHGBg94XmDSaGxk1xMEFe+WPOq661TaDK8Wc2Qauc69VjD
         TMVwplLqQARTBgocRrhtakwIGZSxlVqPnsefqt0HAmUtSRzskI+G+fVkrpiAaBdBGqDK
         vHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876226; x=1714481026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKUXibPhUwjjSXA/KBDdbbKS1P63ijLLovqIt9fNrZc=;
        b=xUWPzM9Uqajr7ssZj6saoa8ZwH7HenVv5nw0i+pCCF06Coj1ikLZF0KUAGZ2vSAsPg
         rYH8WkmFkF2JBFWeK7nEmwB9QiftGOEYETBE6POOfK0bt8y+JC9yParOlpfdot/+rtFv
         NlK/jViTGx+4Fu4XhJTAp+ZnNPUW8ihq1P0se2rDljJVj4tGcpChkEDw6gUJ0jDODHJ2
         CMcomGOsDdyItsS1FvFXfidsQvvuTk8nc7Gca1pPSJ660whlaQh9tgRW7OD473zqB3td
         dh/Gt0FP/8Oyzws3dDGCTI3DG6dLxcO0bNg+s1rhM2QL8tO5FevM6bOMm317jq0oYPxa
         NnSw==
X-Forwarded-Encrypted: i=1; AJvYcCUO52/HYtOIckT08pWLFhSpnnUG2hrxoqII/7gHc0EaWMMOCan9rl2swa3FxsOJRDCgUcs8g/CE/Rn0UqfYrqBQdljW8WbDPB+RiWoxFHof
X-Gm-Message-State: AOJu0Yy+HvUg8n19bRTWElRcQzNaXm9Zlq1jf5O87o8KzO4tG7fHnJlO
	MIOHlO9mGigJIZKDFMcMwJ7X4bdEtLCmJU8bmO1dCY/c23CyGmZ1MGwMnsHun7Q=
X-Google-Smtp-Source: AGHT+IFUqPmuRaat/0SXEHHyjTSjZr+ZQTV3TzzwWrI3rXhXB0F+LGSeuZbKVhACNb/TBD8FDVBF0w==
X-Received: by 2002:a05:600c:3b8a:b0:419:f241:6336 with SMTP id n10-20020a05600c3b8a00b00419f2416336mr6604350wms.1.1713876226513;
        Tue, 23 Apr 2024 05:43:46 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:71cb:1f75:7053:849c])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b00418a386c059sm19975709wmo.42.2024.04.23.05.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:43:46 -0700 (PDT)
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
Subject: [PATCH v3 05/11] RISC-V: KVM: Allow Zca, Zcf, Zcd and Zcb extensions for Guest/VM
Date: Tue, 23 Apr 2024 14:43:19 +0200
Message-ID: <20240423124326.2532796-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423124326.2532796-1-cleger@rivosinc.com>
References: <20240423124326.2532796-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_054348_271417_ECADC78F 
X-CRM114-Status: UNSURE (   9.42  )
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

RXh0ZW5kIHRoZSBLVk0gSVNBIGV4dGVuc2lvbiBPTkVfUkVHIGludGVyZmFjZSB0byBhbGxvdyBL
Vk0gdXNlciBzcGFjZQp0byBkZXRlY3QgYW5kIGVuYWJsZSBaY2EsIFpjZiwgWmNkIGFuZCBaY2Ig
ZXh0ZW5zaW9ucyBmb3IgR3Vlc3QvVk0uCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIg
PGNsZWdlckByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPgpBY2tlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KLS0t
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggfCA0ICsrKysKIGFyY2gvcmlzY3Yv
a3ZtL3ZjcHVfb25lcmVnLmMgICAgICB8IDggKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9r
dm0uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAppbmRleCAzNWExMmFhMTk1
M2UuLjU3ZGIzZmVhNjc5ZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2t2bS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaApAQCAtMTY4LDYg
KzE2OCwxMCBAQCBlbnVtIEtWTV9SSVNDVl9JU0FfRVhUX0lEIHsKIAlLVk1fUklTQ1ZfSVNBX0VY
VF9aVFNPLAogCUtWTV9SSVNDVl9JU0FfRVhUX1pBQ0FTLAogCUtWTV9SSVNDVl9JU0FfRVhUX1pJ
TU9QLAorCUtWTV9SSVNDVl9JU0FfRVhUX1pDQSwKKwlLVk1fUklTQ1ZfSVNBX0VYVF9aQ0IsCisJ
S1ZNX1JJU0NWX0lTQV9FWFRfWkNELAorCUtWTV9SSVNDVl9JU0FfRVhUX1pDRiwKIAlLVk1fUklT
Q1ZfSVNBX0VYVF9NQVgsCiB9OwogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X29u
ZXJlZy5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwppbmRleCAxMjQzNmY2ZjBkMjAu
LmEyNzQ3YTZkYmRiNiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwor
KysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCkBAIC00OCw2ICs0OCwxMCBAQCBzdGF0
aWMgY29uc3QgdW5zaWduZWQgbG9uZyBrdm1faXNhX2V4dF9hcnJbXSA9IHsKIAlLVk1fSVNBX0VY
VF9BUlIoWkJLQyksCiAJS1ZNX0lTQV9FWFRfQVJSKFpCS1gpLAogCUtWTV9JU0FfRVhUX0FSUiha
QlMpLAorCUtWTV9JU0FfRVhUX0FSUihaQ0EpLAorCUtWTV9JU0FfRVhUX0FSUihaQ0IpLAorCUtW
TV9JU0FfRVhUX0FSUihaQ0QpLAorCUtWTV9JU0FfRVhUX0FSUihaQ0YpLAogCUtWTV9JU0FfRVhU
X0FSUihaRkEpLAogCUtWTV9JU0FfRVhUX0FSUihaRkgpLAogCUtWTV9JU0FfRVhUX0FSUihaRkhN
SU4pLApAQCAtMTI4LDYgKzEzMiwxMCBAQCBzdGF0aWMgYm9vbCBrdm1fcmlzY3ZfdmNwdV9pc2Ff
ZGlzYWJsZV9hbGxvd2VkKHVuc2lnbmVkIGxvbmcgZXh0KQogCWNhc2UgS1ZNX1JJU0NWX0lTQV9F
WFRfWkJLQzoKIAljYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1pCS1g6CiAJY2FzZSBLVk1fUklTQ1Zf
SVNBX0VYVF9aQlM6CisJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0E6CisJY2FzZSBLVk1fUklT
Q1ZfSVNBX0VYVF9aQ0I6CisJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0Q6CisJY2FzZSBLVk1f
UklTQ1ZfSVNBX0VYVF9aQ0Y6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aRkE6CiAJY2FzZSBL
Vk1fUklTQ1ZfSVNBX0VYVF9aRkg6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aRkhNSU46Ci0t
IAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
