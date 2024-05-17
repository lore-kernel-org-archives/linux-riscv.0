Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA84C25B79
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 14:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8knsXM53V8Dif6Hy5TTpfWLzfXeHzpRQZwEV1kRbRt4=; b=ilDqLy9DEWc4tB
	HhbDfKUNoImzjDEAPXt0E/t6k51me/zdfaUQNvKAkBjLOYG5oBVDe1c4zlCR8Wm/xACSiUR4Arm/D
	XeDzz5BCjCiqdRGwBkmBdEYHo0fV41iuZHDXTa3APSAZRNnkUlD4a+UQTSro400gDSbIP4pPEySa4
	BvddjYFwXxZZeC7DGzHFfPITvcYvtY2nsubClRaOLA1HsgEoQESJs4DfXqUw1wU5mWH/n/XCLIBfl
	EjHGXgM4dEowBxiWbAHaU2OZFePVOeq/tpG4zIXj16vfVA4P7KHCQ7UmwrmJywV+Q4n1QRcX1D1ge
	5QgNYZO+wwqGvMGtZ4Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yy7-000000088dm-1Frn;
	Fri, 17 May 2024 14:53:59 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yxf-000000088CD-2YAa
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 14:53:32 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-351d86910deso29086f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 07:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715957610; x=1716562410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HO1pUvU0QFRoXzPxVhmpQLKjzbVC9RycGYDtZgzkuNE=;
        b=bc3/PGuDAwGGHT9bLWtSSZ0vZ0S1a91TnVRVWINlzF3WnG9E47F16AKBhTBQzlxxtg
         NPuWnQQe0tgImLDU9LGz4RZshg8VieEC/2dWnR2SDDqWReoPQi5p9xFN2mp5Kiv0RvqE
         TKJNVYWt6rPmDoMnYHJVTgDfCSNpJJrZJDWnZxal/VF+d5TSiu7nIJkCi/EB0FhRQHuy
         oDxkW1Y9tJMKAFB19gtXswahBt4QdXBuy8ucWmbpNnAv0jZjUO2eSHSxx9kC5nhjFiPa
         Awvv5HvF0YVj6A8wTop7x5rDvT34EX/6/ecZ1sAHjkpkOVA7isetb6a3uWjj/n0oqGWL
         B7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715957610; x=1716562410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HO1pUvU0QFRoXzPxVhmpQLKjzbVC9RycGYDtZgzkuNE=;
        b=fhSs+yPiJLRPlfPre7bUmqyG1V9/afi/qhcNlY7PLtuAWWfK3oba/XPtFeOxmgyPu3
         sRQnixbUU6A6gqePVjwYFCmBqkree97RWeJ4VU/RgZ0h2jQeK+7d26hFKpyAtT4e/fYt
         0DxXJD9HgOAFQ9vQXEZhHc06ZRyEFqg4ovhF8tpfcO3NzPFbHW+SEnHRl1Uwj/BVWhBG
         3tYseP6GkLTWSBpSNmS97GoDEXlc9zmSPw5Jf/Awv8/iYdj9plMxOZ8aQNIHgd9iEow2
         0hhBvB0APomqanx5QLQlDTIqoXRlLcWjzUlL+5t+8vwROs9Lf08VcgYlaRES7xj+LCs0
         FjYw==
X-Forwarded-Encrypted: i=1; AJvYcCWbI6c1HjI+YDKGHjnDTf26/uF0nH5qEAfceU6soxhMifunG+dJSilFAxNUFU4PDqb0feVaWdWUl00ix/PDKGM0mAvDpC0tfqNF6XgGfy6f
X-Gm-Message-State: AOJu0YxX6KB7R9rYm+TmLfMHVJADRwKGrIdvWOk9aIgXSosnKI6ickiD
	fB/cOUabyGoR9B/cr+FMuNq7RVt/tztEAQdI/6le/M85d8A2qEV8rPR3zdzX8S3hqXTzNuMkqYh
	Kn6M=
X-Google-Smtp-Source: AGHT+IHCcI6mTF/qG46F9/WPCDIuGLK4dSqNF1EcLBDpXdJsYapMFNR0VxcFS5FS/J/SwT2j4pYivA==
X-Received: by 2002:a05:600c:3b86:b0:418:f770:ba0 with SMTP id 5b1f17b1804b1-41fea52ef14mr167164555e9.0.1715957610248;
        Fri, 17 May 2024 07:53:30 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:46f0:3724:aa77:c1f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm301723695e9.28.2024.05.17.07.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:53:29 -0700 (PDT)
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
Subject: [PATCH v5 11/16] KVM: riscv: selftests: Add some Zc* extensions to get-reg-list test
Date: Fri, 17 May 2024 16:52:51 +0200
Message-ID: <20240517145302.971019-12-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517145302.971019-1-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_075331_711407_0C6C2C4B 
X-CRM114-Status: UNSURE (   8.71  )
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
a3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCmluZGV4IDQwMTA3YmI2MTk3NS4uNjFjYWQ0NTE0MTk3
IDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1s
aXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlz
dC5jCkBAIC01NSw2ICs1NSwxMCBAQCBib29sIGZpbHRlcl9yZWcoX191NjQgcmVnKQogCWNhc2Ug
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
VF9aRkhNSU46CkBAIC00MjEsNiArNDI1LDEwIEBAIHN0YXRpYyBjb25zdCBjaGFyICppc2FfZXh0
X3NpbmdsZV9pZF90b19zdHIoX191NjQgcmVnX29mZikKIAkJS1ZNX0lTQV9FWFRfQVJSKFpCS0Mp
LAogCQlLVk1fSVNBX0VYVF9BUlIoWkJLWCksCiAJCUtWTV9JU0FfRVhUX0FSUihaQlMpLAorCQlL
Vk1fSVNBX0VYVF9BUlIoWkNBKSwKKwkJS1ZNX0lTQV9FWFRfQVJSKFpDQiksCisJCUtWTV9JU0Ff
RVhUX0FSUihaQ0QpLAorCQlLVk1fSVNBX0VYVF9BUlIoWkNGKSwKIAkJS1ZNX0lTQV9FWFRfQVJS
KFpGQSksCiAJCUtWTV9JU0FfRVhUX0FSUihaRkgpLAogCQlLVk1fSVNBX0VYVF9BUlIoWkZITUlO
KSwKQEAgLTk0NSw2ICs5NTMsMTAgQEAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6YmtiLCBa
QktCKTsKIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemJrYywgWkJLQyk7CiBLVk1fSVNBX0VY
VF9TSU1QTEVfQ09ORklHKHpia3gsIFpCS1gpOwogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6
YnMsIFpCUyk7CitLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpjYSwgWkNBKSwKK0tWTV9JU0Ff
RVhUX1NJTVBMRV9DT05GSUcoemNiLCBaQ0IpLAorS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6
Y2QsIFpDRCksCitLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpjZiwgWkNGKSwKIEtWTV9JU0Ff
RVhUX1NJTVBMRV9DT05GSUcoemZhLCBaRkEpOwogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6
ZmgsIFpGSCk7CiBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpmaG1pbiwgWkZITUlOKTsKQEAg
LTEwMDEsNiArMTAxMywxMCBAQCBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqdmNwdV9jb25maWdzW10g
PSB7CiAJJmNvbmZpZ196YmtjLAogCSZjb25maWdfemJreCwKIAkmY29uZmlnX3picywKKwkmY29u
ZmlnX3pjYSwKKwkmY29uZmlnX3pjYiwKKwkmY29uZmlnX3pjZCwKKwkmY29uZmlnX3pjZiwKIAkm
Y29uZmlnX3pmYSwKIAkmY29uZmlnX3pmaCwKIAkmY29uZmlnX3pmaG1pbiwKLS0gCjIuNDMuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
