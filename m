Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227CBCD6E4C
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VxE2pKO1oZ+CJptBaP/wtTXKfXRI1iLfwZp3tN/BCIc=; b=cGmH0ctATrVap/
	ju0sgBAcZgX/xlFvmrTa0lboEGgvEa+Zw1W1f//Tjt8hgG9QmZXLIGTMlZaPLbjo8hspHoVChBcK3
	M0Ubn1Mj277Lrzs22pgxBFk9qsp31QvQ8XFo97spLbMyW+BnDKZ1jMo0+Hyl/DHck/2GAOmcgOEql
	xfAgmmFuYxlMhvMG03najJAQeXen0QEHFY6kGbRDIGyzD+IhY24oOs0rpd5i1RAXO46UaYm7cMDJk
	Lh0RFBKY+xUpKN9avd/XQR3SUGWHY3AqcIRMmKTTPoQU4UckYwoEWjlF8QHsIMBcNGVCrIZNnNJvW
	/32LGxvvf+6xLPtgp4TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFp-0000000AOMI-24gz;
	Mon, 01 Jun 2026 08:44:13 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFl-0000000AOH8-27YT
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:44:11 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c0c2a68d01so6961095ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303448; x=1780908248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmdSZ4nBLUBMfkWYeMqXhgmIblXvsbFhjdlvAKdM29c=;
        b=GCjcOg4rqLMe3PvmFsZtzwYEKXDEHSueux2B5hkyvrkCNAp2k0m7gKsSVn2ccnBSdm
         iqHQUxHltEgFJshtSk1JWUDMBF0jv5G7U9/+AieftUnLmS7MRZYdsfjD8dmudRcVIEAz
         2SPeE/sTuznnsj9Za8DIECv+v8A3JzRxNKZcSgapTAMpqQES7XSBSViZypNihzq0Shhz
         SVmdAMBaGAMCr+g26GOZ6nmDn5zvJsLwuRQTUXSF+6fDby5mK7qWGC4B3fgzEaCZS9dM
         iqlqvgK3RZb7cabFqiDgmSH9ckoJLxrb7fozQKo20X/XUqtnwiEp6PPfJpM2a3Kf88KK
         7oiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303448; x=1780908248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EmdSZ4nBLUBMfkWYeMqXhgmIblXvsbFhjdlvAKdM29c=;
        b=iQPwCXUktCWWN97w0YALKNvBRsmoicEBSlR2FjtRT0hXSenJPGzJ96tcmqVJNNBqfq
         aG/jKG360N8dyHE8KOboEybqS5veJjxWg8BEkragOG+muqz/Nq6qBnRliGTxbv6S94Ql
         C7TRTFewDijjA1gYy1eVHBq2mCvIr9dTTSiyvA15ek+raAMXhtNB8crwEuw7z8M/xwRI
         9xbe0rufH8Tumtjq5jYni26K3zWGvuKrO4M//pyfSBbZUb6656zguGBAmCcnfUKnBLsk
         fLobR/SfONn4R5rIFn/J3EoNDNNccjvCRcGTkGXh3IuNtFIccYBwprx307SwtZ/tE1Mi
         ovNg==
X-Gm-Message-State: AOJu0YxXSp2DZ1TFQ429Zl5DJ9fKvuO6aR6C+mlZRautT1R4cefyG1Lz
	4lrz1ZnRAH7GI5QxThL+T8GRkeMWZ+Fbk7EWvX/nucYBvDgwfkG8rG8V
X-Gm-Gg: Acq92OFy/ZC2tCXAJ4QOMN/8GKj83njqci9+MP0BFxaKAQf9FINdNjXEZN7Njl1dmap
	ZWo5hG10E9xeCmPkPAGDqeTbE6mxfIb4vWN3ErkMu701LCTt0nM+7rIK5FxTkiyXJshXJkaCLOy
	0KHW4fJrojF9Sn3UE6EUaxulogfzJxZ2RIhsvXaGxNIdPebai5SbxcNNVJjoksggiI9YgLxD9bR
	E3d3lM1qhJMOEp6lkjRRv+ZBnUxsXjqmlWO1OzUma9zxlvNdyNlLHYPTaIteaQqZFP4zb6McruS
	9Wl7383cmRlKG1YghdePrYKoIL5Si4702OhCm9+67kLYjHk3qqSwqtHhqnz/FW3zIPrucWME5Ec
	EAd9EwOQ6Eq8z6SeN01PDomNdCEAC1bYZWOsDNs81n8DSgqCxeOUs9ugEOiRlvzD1bBrn0fuFpN
	EGvRLjUOL7s4i+4O0IhpqKrVnLHw+e8fnAvw==
X-Received: by 2002:a17:903:3585:b0:2b0:b016:773f with SMTP id d9443c01a7336-2bf367c21a9mr124575685ad.11.1780303448528;
        Mon, 01 Jun 2026 01:44:08 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c43f0asm137898535ad.77.2026.06.01.01.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:44:08 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v2 4/7] RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
Date: Mon,  1 Jun 2026 16:43:32 +0800
Message-ID: <20260601084336.2601675-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084336.2601675-1-inochiama@gmail.com>
References: <20260601084336.2601675-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014409_580207_A8AFFB3D 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Extend the KVM ISA extension array to allow KVM userspace to
detect and enable Zicfiss/Zicfilp extensions for Guest/VM.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 2 ++
 arch/riscv/kvm/isa.c              | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 501e4fc60dd2..9f9c5ababd1e 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -199,6 +199,8 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZCLSD,
 	KVM_RISCV_ISA_EXT_ZILSD,
 	KVM_RISCV_ISA_EXT_ZALASR,
+	KVM_RISCV_ISA_EXT_ZICFILP,
+	KVM_RISCV_ISA_EXT_ZICFISS,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/isa.c b/arch/riscv/kvm/isa.c
index 1132d909cc25..9852a91fdecc 100644
--- a/arch/riscv/kvm/isa.c
+++ b/arch/riscv/kvm/isa.c
@@ -65,6 +65,8 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZICBOP),
 	KVM_ISA_EXT_ARR(ZICBOZ),
 	KVM_ISA_EXT_ARR(ZICCRSE),
+	KVM_ISA_EXT_ARR(ZICFILP),
+	KVM_ISA_EXT_ARR(ZICFISS),
 	KVM_ISA_EXT_ARR(ZICNTR),
 	KVM_ISA_EXT_ARR(ZICOND),
 	KVM_ISA_EXT_ARR(ZICSR),
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
