Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E387CD1297
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 00:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lNehsSTZi9moaj74D7v31T0S23tIywQyShg/HJnLnxo=; b=LRDoOQg/jP6XdE
	YcorKY6z6ZA9sOmZBChRh+2sKnYP3fC1Aj1HQQMWHnDqJmwEd+suOTX+a9kDk0p/Gd35SCSuoScMj
	whdQtC5yYt6o+tvIpbuAnWTFAu9c6MDSaGH590YkTggRgbDr8vz+2zuNaI1pw04R+1aHGXCpIlDd9
	9uSj0VTsWjBYQtQEbJX5ukDp6vxz2havUyQOGpr2eRd5qST3jPubCmOnxrCSAYPytpXOfcmfv3z1b
	8jGiCbximSO7X6tORaUozEumtBYYxH2OsgMvb97ulAjGfNla3xQBV15RVvIJ5YX6GvIzAZb7RkMMw
	7oCWL1L66YbD73ktSQ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhzD-00000009ZTj-1dFa;
	Thu, 11 Apr 2024 00:08:15 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhzA-00000009ZRB-0DIf
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 00:08:14 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6ed20fb620fso3520516b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 17:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712794090; x=1713398890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wk9dPs2pdPMy/ouYyBMSDOPD1OQUOIvovvehkpc98kM=;
        b=flWga+M8EdPwYn1CePcBxJB65R/MtVT4ItngdK3e5ax3D4X8rSkXI/bi46bpS3CX06
         s9DsBOwnausEazm4qJduipgxT8qw74Rg59c9ISVu+xJQhgBk1EIvn6E35aKPyyppQ3TJ
         tuBeZFKSfTnusalv3xYxy9xUJ3BVeqwwU7pBB6fN6ykYp67IfSRlKmMRXAK83V569zwr
         oPC2g9FNhtE8W1hmRAEEvgGolzO0PVMEkSQdLlAwvTnXI8r5QCGvWy0S+Xg1POgB7ywQ
         noKVxLvx+okf06zwVs6tbZZgmjN7yi4/pnZSsAYGinE5NJMB81NiEgAhgSsaUpv1LZYq
         0GQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712794090; x=1713398890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wk9dPs2pdPMy/ouYyBMSDOPD1OQUOIvovvehkpc98kM=;
        b=glxZGWD0A0rPFDd1A9hyTH1/IekTsgCkFmdI/rMrq3yM2BFRSlxynQmnta8SQTccBB
         Grhpmgi0ZNIBCPRRCuTfZH26lVKPaKidkhtSgyC+Un+ZHZdBFqxIAOd5eFgp0BWjK5Kt
         zHit5GxVf9QoGsDKyXXzqYWCb4kx22pw5R3hfrhRf2qj4UIe/PPgO+UxEPqGXT6D2mip
         zVcdL0f+Vhy0zA/HDuECw8zOcbR+NkapX8sAtJlSM7o2nJXcZX2wNCUIRMZoyfX3Afz9
         N8+1FlTvrISwfce9rUoxaL91Hilk9x/KQ7hvSl/R+C5LYbsTWIjge4L/eR/qJ2ry1fNd
         rDVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxhP27mqjguQvV/sVA1gyt2VvCImE7p5uOhf6jFYCqdklvCIQRxC6xS2mnnTf7CCym78Yg+fvgWlHSifpPcuTtR4Hq8W1/BvsMU9l+b31H
X-Gm-Message-State: AOJu0Yx9XTpbV77vq6l3gsNjD0wTXSgBn3tKJ7BNpKP9FUP/uOnREUqM
	jysZOnO7+qyNIIgwSOEfA33E+1yP1Tsb+4j2+OK4ZUhzfgHQdGNx5O6Di0X3IT4=
X-Google-Smtp-Source: AGHT+IEUlLK4WAkAvm3dQl//UcwbrhAG4hAU1Ze/VITIGy9xvn1rUCggLrBxo4kkHL3eR04eJnJL9Q==
X-Received: by 2002:a05:6a20:2d06:b0:1a9:4343:7649 with SMTP id g6-20020a056a202d0600b001a943437649mr5367555pzl.56.1712794089923;
        Wed, 10 Apr 2024 17:08:09 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b001e3d8a70780sm130351pln.171.2024.04.10.17.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 17:08:08 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v6 01/24] RISC-V: Fix the typo in Scountovf CSR name
Date: Wed, 10 Apr 2024 17:07:29 -0700
Message-Id: <20240411000752.955910-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411000752.955910-1-atishp@rivosinc.com>
References: <20240411000752.955910-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_170812_361933_38AAC2F7 
X-CRM114-Status: GOOD (  11.20  )
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

VGhlIGNvdW50ZXIgb3ZlcmZsb3cgQ1NSIG5hbWUgaXMgInNjb3VudG92ZiIgbm90ICJzc2NvdW50
b3ZmIi4KCkZpeCB0aGUgY3NyIG5hbWUuCgpGaXhlczogNDkwNWVjMmZiN2U2ICgiUklTQy1WOiBB
ZGQgc3Njb2ZwbWYgZXh0ZW5zaW9uIHN1cHBvcnQiKQpSZXZpZXdlZC1ieTogQ2zDqW1lbnQgTMOp
Z2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25v
ci5kb29sZXlAbWljcm9jaGlwLmNvbT4KUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+ClNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMu
Y29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmggfCAyICstCiBkcml2ZXJzL3Bl
cmYvcmlzY3ZfcG11X3NiaS5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9j
c3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKaW5kZXggMjQ2OGM1NTkzM2NkLi45
ZDFiMDc5MzI3OTQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaApAQCAtMjgxLDcgKzI4MSw3IEBACiAjZGVm
aW5lIENTUl9IUE1DT1VOVEVSMzBICTB4YzllCiAjZGVmaW5lIENTUl9IUE1DT1VOVEVSMzFICTB4
YzlmCiAKLSNkZWZpbmUgQ1NSX1NTQ09VTlRPVkYJCTB4ZGEwCisjZGVmaW5lIENTUl9TQ09VTlRP
VkYJCTB4ZGEwCiAKICNkZWZpbmUgQ1NSX1NTVEFUVVMJCTB4MTAwCiAjZGVmaW5lIENTUl9TSUUJ
CQkweDEwNApkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyBiL2RyaXZl
cnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKaW5kZXggOGNiZTZlNWY5YzM5Li4zZTQ0ZDJmYjhiZjgg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKKysrIGIvZHJpdmVycy9w
ZXJmL3Jpc2N2X3BtdV9zYmkuYwpAQCAtMjcsNyArMjcsNyBAQAogCiAjZGVmaW5lIEFMVF9TQklf
UE1VX09WRVJGTE9XKF9fb3ZsKQkJCQkJXAogYXNtIHZvbGF0aWxlKEFMVEVSTkFUSVZFXzIoCQkJ
CQkJXAotCSJjc3JyICUwLCAiIF9fc3RyaW5naWZ5KENTUl9TU0NPVU5UT1ZGKSwJCQlcCisJImNz
cnIgJTAsICIgX19zdHJpbmdpZnkoQ1NSX1NDT1VOVE9WRiksCQkJCVwKIAkiY3NyciAlMCwgIiBf
X3N0cmluZ2lmeShUSEVBRF9DOVhYX0NTUl9TQ09VTlRFUk9GKSwJCVwKIAkJVEhFQURfVkVORE9S
X0lELCBFUlJBVEFfVEhFQURfUE1VLAkJCVwKIAkJQ09ORklHX0VSUkFUQV9USEVBRF9QTVUsCQkJ
CVwKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
