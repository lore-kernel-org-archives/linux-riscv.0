Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2432C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 11:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jJMlVXZtJBLuzJ5mTpkLSZWc488ZpHwpjrv2b1/2hmY=; b=bU2hOsNBK4X+J3
	iSm0gJhSXl5QFTsGrc7hrKXcYiRwE4R+GJbeRF50xsW0FONAJjY5sF14a1q/xVMP3wj4V0TyRvBFP
	IP651WyR0UE7q1WTg2W9Z8qnPZRPELWScn6jN192sdAIMrYDIoxzTt/SHLIpViq3e9l9J28fiUcjD
	Cj4EjGRGjnULw6mIFHPBxoitZ+sqw8iINvT4SHrsd6WOPFHsAXwCPYgFPnWgpB/vrtULWL7NthC6U
	JE2cJ9uaJw1Oxm1mqcTO/4sJwrkLcH9Di3cBI+pxCRsWMIPLnwedapxcKWdaFsH9TaRD4rq6Rve9e
	f4c7WZ0xFKSRVKBbhXQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbg-0000000100O-3ND5;
	Wed, 19 Jun 2024 11:36:04 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbM-00000000zf9-0EBk
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 11:35:48 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-363db2f9fc5so47531f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 04:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718796942; x=1719401742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75rTjwiTigH0M5dSuDfGTD/7XLnMHNSdwJR4GKnSoMI=;
        b=O9qEN7C0WLUk7rSHQERK/6PPgZOD0LCuBDN9DD+y6UoXGJh3df7j30vNEL0EDfvBA5
         PkBszuejb5ZM6oqmob3hNMlB7tm9N9lyrksWuonemOHugg9IfNQt0ZT74Mzdny30LHGx
         yRqWJpPR5qtbQ2hnMTou6IHviL30y5pfXHm98I/xQap+ibooG5cxHV66L4Nm9ge50ETA
         /P1G5BeeKRdc4LX+dzhdJOBdY4+PkaMJU0H5FCo5M2EYrkOL3OfM87if04f8YNVC7FTB
         c8AK6pzy4DC2c+k4iMJbIS638+IHN29iMisuoesgfbDGIqVPYEyTbUvzjjFaEEldnTPx
         JsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796942; x=1719401742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75rTjwiTigH0M5dSuDfGTD/7XLnMHNSdwJR4GKnSoMI=;
        b=usEbXoqpwRDUIhzsRuD7ScGQFo1nXxVQsCqCPxx4g/kL17dp21qrtcR2dw1ijg/leg
         re4Ybu6TcpDrj3AjzEpieK96wTjz5ZO2q8eOuMiSG86mIzcFDeF/GYVdgwB/Z5Lqh31g
         WJNSJrtPs27CPxMPszuVwPYAl/Ur4LyUCeRB42/+537ILplfTQlyM/WstJQxwgV04LLh
         x/sjBQ27RZUm556Sku1wx8ABUibjXxy0YfqEU68hKznITHa0p66PK+97JM4TkP38AI3y
         1M2JaAGvdqgTbLDmYBfVHms2iJyWShXZMcge2UrfMdmTiNwORA+VfchhS4EwfNV9iZZV
         KQTw==
X-Forwarded-Encrypted: i=1; AJvYcCWiMsbAxfjmnkXFH9fdjT7SgMMAhb8sbQoNbqNuGzdAccwPz+WdrWr/MdO3BqQJ/2lTuBHTs2MFxmGZUEfAOfMN72LGO3MegbA/fh/H9oKS
X-Gm-Message-State: AOJu0YxUNgs2h5GE5s6owJ5cpKy6fTEm+wf0xMUNeXxXiUj/1+I1HuJA
	S+vxJGNSJexd2nHs2Jnb6oD+9W4okFMlt3fGxqk0FEfQAMpk6IeI24X1L47Vikw=
X-Google-Smtp-Source: AGHT+IHnu+3U5OyaRWV2j3JU5BIwJF09UD4syTsljNxRRPi07OByw6Zovlpi+faN3PrM3kuT5uCqKA==
X-Received: by 2002:a05:600c:2252:b0:424:798a:f7f3 with SMTP id 5b1f17b1804b1-424798afe49mr6215185e9.1.1718796941741;
        Wed, 19 Jun 2024 04:35:41 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:e67b:7ea9:5658:701a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9681sm266192075e9.28.2024.06.19.04.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 04:35:40 -0700 (PDT)
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
Subject: [PATCH v7 05/16] KVM: riscv: selftests: Add Zimop extension to get-reg-list test
Date: Wed, 19 Jun 2024 13:35:15 +0200
Message-ID: <20240619113529.676940-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619113529.676940-1-cleger@rivosinc.com>
References: <20240619113529.676940-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_043544_332710_9CE25CFA 
X-CRM114-Status: UNSURE (   9.55  )
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

VGhlIEtWTSBSSVNDLVYgYWxsb3dzIFppbW9wIGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0gc28gYWRk
IHRoaXMKZXh0ZW5zaW9uIHRvIGdldC1yZWctbGlzdCB0ZXN0LgoKU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KQWNrZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+Ci0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWct
bGlzdC5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jIGIv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCmluZGV4IDIy
MjE5OGRkNmQwNC4uOGM4YjEwOWNlM2NhIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCkBAIC02OCw2ICs2OCw3IEBAIGJvb2wgZmlsdGVy
X3JlZyhfX3U2NCByZWcpCiAJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJ
U0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aSUhJTlROVEw6CiAJY2FzZSBLVk1f
UkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1Zf
SVNBX0VYVF9aSUhJTlRQQVVTRToKIAljYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9S
RUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pJSFBNOgorCWNhc2UgS1ZN
X1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NW
X0lTQV9FWFRfWklNT1A6CiAJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJ
U0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aS05EOgogCWNhc2UgS1ZNX1JFR19S
SVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9F
WFRfWktORToKIAljYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNB
X1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pLTkg6CkBAIC00MzQsNiArNDM1LDcgQEAgc3Rh
dGljIGNvbnN0IGNoYXIgKmlzYV9leHRfc2luZ2xlX2lkX3RvX3N0cihfX3U2NCByZWdfb2ZmKQog
CQlLVk1fSVNBX0VYVF9BUlIoWklISU5UTlRMKSwKIAkJS1ZNX0lTQV9FWFRfQVJSKFpJSElOVFBB
VVNFKSwKIAkJS1ZNX0lTQV9FWFRfQVJSKFpJSFBNKSwKKwkJS1ZNX0lTQV9FWFRfQVJSKFpJTU9Q
KSwKIAkJS1ZNX0lTQV9FWFRfQVJSKFpLTkQpLAogCQlLVk1fSVNBX0VYVF9BUlIoWktORSksCiAJ
CUtWTV9JU0FfRVhUX0FSUihaS05IKSwKQEAgLTk1OCw2ICs5NjAsNyBAQCBLVk1fSVNBX0VYVF9T
SU1QTEVfQ09ORklHKHppZmVuY2VpLCBaSUZFTkNFSSk7CiBLVk1fSVNBX0VYVF9TSU1QTEVfQ09O
RklHKHppaGludG50bCwgWklISU5UTlRMKTsKIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemlo
aW50cGF1c2UsIFpJSElOVFBBVVNFKTsKIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemlocG0s
IFpJSFBNKTsKK0tWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemltb3AsIFpJTU9QKTsKIEtWTV9J
U0FfRVhUX1NJTVBMRV9DT05GSUcoemtuZCwgWktORCk7CiBLVk1fSVNBX0VYVF9TSU1QTEVfQ09O
RklHKHprbmUsIFpLTkUpOwogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6a25oLCBaS05IKTsK
QEAgLTEwMTQsNiArMTAxNyw3IEBAIHN0cnVjdCB2Y3B1X3JlZ19saXN0ICp2Y3B1X2NvbmZpZ3Nb
XSA9IHsKIAkmY29uZmlnX3ppaGludG50bCwKIAkmY29uZmlnX3ppaGludHBhdXNlLAogCSZjb25m
aWdfemlocG0sCisJJmNvbmZpZ196aW1vcCwKIAkmY29uZmlnX3prbmQsCiAJJmNvbmZpZ196a25l
LAogCSZjb25maWdfemtuaCwKLS0gCjIuNDUuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
