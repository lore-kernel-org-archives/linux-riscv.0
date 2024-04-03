Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587ADCD1294
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 09:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lNehsSTZi9moaj74D7v31T0S23tIywQyShg/HJnLnxo=; b=weHYTB/cmUzzL6
	kIpQYfbh4Vq0XkobbWzDw6vIqA9gGRDUPYU+4DkD73U9A1b3fT7zwcLTVujFKnG+O74VPY2otWIuY
	zyqd0vWuGtEaJ7mgCxhTDS+IaDYX0bqz4LjIQRvfzXN0jn0e/dzwXm91+83sBUaq1nXaOPAVT6kY/
	wSrCFc3luGz8nUi2YqL+d5ZOLftrsRNNtIsS8/2h2X02r5lNS0U4VDxRDwCpY9r8cRjaedEzK2B6s
	aOBYmDQjtB4SABZyk0C//ySFAlddZjd2JEK+LrblRNg84blYiyy4AbinZ7CbIMyX8yYZICsRkehBO
	k6If9sQu7q7zo33xCpoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrwlt-0000000FABI-0Id0;
	Wed, 03 Apr 2024 09:19:05 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvcR-0000000EiSr-3VVV
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 08:05:17 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1def3340682so52557695ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 01:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712131514; x=1712736314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wk9dPs2pdPMy/ouYyBMSDOPD1OQUOIvovvehkpc98kM=;
        b=l/XjP9TeO1K8W6Ae4GWTInej9UIotqVE/UjOH+Pm/fXbV4ysmHQM/JOSOBX+bLqRyN
         2NXA693+MopfO625QzWYAYqZJguX4G4hl+uUrNuRL1fZ/mJSPzjugeWgOaMvQixnp08E
         a+dPMOgMeKr400CofT9o+9w25OSGWuJLjSNpMEd8vm8rcgjIlFqlZqN4l5qKIvetDlcB
         orNull3VmZN0gUA+Y5K4v77z+MJrHB489kBLBxRzGanZHOPaMnTbHytcbxRj0l21Tydc
         POIzWWnJNmf18reoO+RU0M/GTdepI6Xdd0pfLZhar1847FaJC7RCtWaKbEG772vKz2ye
         nABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712131514; x=1712736314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wk9dPs2pdPMy/ouYyBMSDOPD1OQUOIvovvehkpc98kM=;
        b=D5+GCLPA9HAdWxTGFby/W1DXlBG4gd+k0YwTGzRvtfQgrpB7k3LP93PQmHn4XHdb+o
         DXiwQRc9vPE2g3E/wNXVLE3aX+LQTFg/x0FFqq0MMcOGd7BFi++UyD6yc0UzuYHw/eb8
         3fYA9gQj/hJOEQQFddVoX3CDE/ED0vUv/wRItvm91AtSpvn1VY63LXpsdOTQZbrzt19V
         E6e5sukAHwvNS04MwJnG/dsWU9PeQ8ZH/9kpmHDy87Y1tycEL4u3KdWk0FwoqQvY89aP
         EvraYja1vsRVeDd+TTj0+aFSxnwyvsgpxx+3zMfaoiQzWCt2n6S5rnwNspTe00M9ow69
         ZVMw==
X-Forwarded-Encrypted: i=1; AJvYcCXu6moM+x33k/JEMIhj57LJeZ1z/9h3bGENPpMuHaootd3LQuqlU3H++C9GmlBlMUBP9o2I4hRQbV5/dRES94iUsuLnhg3pmniPRTEH6k6n
X-Gm-Message-State: AOJu0Yxkw6GGmeWULz5/AEo4T1gJdZrrtdcaT2PCZV4gDtaBfkebMkS7
	58pJDJEy+avYd6nEHZ9OlyioQNpFS5l2hWUl10Q3jbi83maD9hyC7ty+xe0P3Dk=
X-Google-Smtp-Source: AGHT+IGJGNXcOyb9YrykwAGNPaYyhw8xhsLdGwuGzUBrwVAzvp1h6eGWJ0tNbKMZggDJyDT4f6wwug==
X-Received: by 2002:a17:903:292:b0:1e2:6240:72e7 with SMTP id j18-20020a170903029200b001e2624072e7mr5865569plr.53.1712131513754;
        Wed, 03 Apr 2024 01:05:13 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902d48c00b001e0b5d49fc7sm12557229plg.161.2024.04.03.01.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 01:05:13 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	Ajay Kaher <akaher@vmware.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
	Andrew Jones <ajones@ventanamicro.com>,
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
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v5 01/22] RISC-V: Fix the typo in Scountovf CSR name
Date: Wed,  3 Apr 2024 01:04:30 -0700
Message-Id: <20240403080452.1007601-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403080452.1007601-1-atishp@rivosinc.com>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_010515_991813_4A80D61A 
X-CRM114-Status: GOOD (  11.19  )
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
