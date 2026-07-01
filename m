Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AD4C44503
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 02:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4sexbpXkVxgzqPmIGa+BvqHcmGwxflZc30HfmE8xtms=; b=cx9sJXkpnlhggS
	4ufwnwA4PvzgcLNWXD0iZ+lPW57PL1R+EO/KiNkTuiCUHNHss5SFU4Bi5DCko+DAkjBvOok3XFubp
	FWr7S7qmGHRZgK3OX9yEF9yIgmfy0Afg/xGpSHjvmMTzRwgrmIL5pT6eLrx+OtSftc0Je6Rhf+BTV
	i1aBxvx7jf/DPz2c8M50zrvkSSTlcjlPSy/aR/irsM9HKRGH0+eeqzhK+OHF5tMdb8dcMBmSlB1EQ
	JIG+gMohb4eyGPOTmizbixw5+aLqdopsDkh4FLtq8ooLOdOGAXUGcWcha4DjNgvSmKZqhmzr9oovw
	RSo272QwgQ1eiS6CHOBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekNJ-00000000Uqd-3cSP;
	Wed, 01 Jul 2026 02:08:29 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekNE-00000000Ulc-1rsH
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 02:08:27 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-380544d00b1so67045a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 19:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782871703; x=1783476503; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwFDdkksbt790fLoy4tClBNp4x5JbRI/xOADu+E9kr0=;
        b=nUMUVPIGN0Mfl2lGosr6TSqeMOxTFyGTDfyVWUQevzDxCs+8aJgOtNfQNvZCQgN6Gg
         KymRs/q5rmFioUbKu6r7gJEM/cxzisfLrLipLiarySSw99jk4uef+MbWM5luPj72MGox
         7MaEDYjL3wf6ssIiSVQUIYf1oKU2XVkrHQiECGznoWUuVUP9ixy2KPqnDiNih0vmAdBR
         Xvn2QuX7s61HTQTjLXB4LtyjdScAHFVDjWBhNqSDgbneA4sKeBbR6/+STGg/v/GjSB6b
         ILnf6+Bd2/hPFLuVJa7c1Vujo95V4kN0TTr5ZmtNJ2GGxMur2ppyJ7yhPtRll4obA1I+
         xHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782871703; x=1783476503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rwFDdkksbt790fLoy4tClBNp4x5JbRI/xOADu+E9kr0=;
        b=WfiT3EtGiLR6lb/VD/595TKwQrg2BrLPWJd5Tva+5JqVQu7KC6T9CLCTne5xE206lV
         anP1tjB0xX9KUU9k8NJcwm50ndQuiSEcUXoua7zv5sQMHgoXYTzmaUIpvGOcJhXtzvr4
         vGbdQRW6PVrMjdMFPRdX3TQ/mO3gUHP4o6G8pT8ohl/VRaAEW0R24eLMUwnQ4xxRvd0J
         N5ZnMpyOEcaDQ0WoYpWffSfhkaM05P7fH3CvKPt0uhav1yiXIZ4v1iwX2kfUgxTTumBp
         MBT962CqR7iaWN+OQ28wequDM/kGMrn67p1veBlqvj0Nc9F1YA02ParRZvewV6+ah9AQ
         GCyQ==
X-Gm-Message-State: AOJu0YzPKfme6ZCeI71lUNmz5IhRmweWnrFeWat0hXXyg14j+kyBm/0G
	+TANwGsoN7hUD5+XemEm9AjSW86k5ZQZNS6xi4unLKSvQ8D0JAa2w4Du
X-Gm-Gg: AfdE7ck9HobI7Uk2APYnZUXZCBGLWyvWBmvd9pJU2Dz9LBfB4bEBWAbrhZtuDh0bswE
	IadGKYJOOLHrRTu6qyiBoUzV5bpe1uGf5r89m0Ycvh3DAU1SpJ6dQ9NAhzvMXsRUBma+rVRTnsO
	j7BdQv1ERkDmwYaPISDsE2R0pyIUlv/cq6BIDbmY4tf8h8v/V2vhpDtruRKL3UpMLf+cTNtwSv5
	xfBF68nHLj82c6yHGd6Wga5rxtTY1hxZUQBWqLU0h9plqrzrD0csE0dJ2J4bL0i+aCH90p7WGg4
	Bwxg+1sa5t7DZqftfzS6nZNDecfXHxITmlQiRk9UUv96yRW1NbnFZQ2/fV1jCzRI94ojThB3mRA
	nXM9TYMO3VFBHygK+VVJyANyevPIr3e7gqDqKCtnY+qU4BaTzo4Er7A5Jet3yx05QOc1rKh/0mP
	JUeikbgYMgib8gf3oFW9GovA==
X-Received: by 2002:a17:90b:4e8e:b0:37f:9cdf:f03d with SMTP id 98e67ed59e1d1-380527f7932mr4841362a91.32.1782871703409;
        Tue, 30 Jun 2026 19:08:23 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095d2a0f0sm865257a91.3.2026.06.30.19.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:08:23 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v4 3/8] RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
Date: Wed,  1 Jul 2026 10:07:40 +0800
Message-ID: <20260701020746.170157-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260701020746.170157-1-inochiama@gmail.com>
References: <20260701020746.170157-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_190825_384642_D992B452 
X-CRM114-Status: UNSURE (   8.68  )
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
index 7bbea8812d92..a27de850fa4c 100644
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
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
