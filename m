Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A43C6FD1D
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Apr 2023 11:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OAEgd0WOmZQR42BXgJXFEXJwedvABzGyKqaL/FwaZK0=; b=Akn8irz58dztc5
	z9V/mXHVZYegaewOtPGbylrpfezMne40N/flkVAE8sNDkXLhSR/rpVOlNs+cgSTDGSnT9uL//Be5L
	H+akCKhSh+92ut3D9iU7x/Ml9NxpuwMZ28AWcyDZgz03k0htP5fUWDMr0ZohIT6kNs7HWcwuaw38C
	rsyZu9RW3Dn2p5XiyN430FaPm5g8XHfEZbhE8pxXVSAobG4cHfOar/ecUjDx5hauFpDx6HvdwWSH+
	Db1m9tSu+bGmibkyUSwYqrlC3UoXsuSK8tBaq7DylooROIRT0jZkRsuZIE6DKJiUaREpO+vQQGsR6
	mEgVDRrFOiexQsFrydxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piZOe-00AHFW-0d;
	Sat, 01 Apr 2023 11:27:48 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piZOb-00AHBR-1R
	for linux-riscv@lists.infradead.org;
	Sat, 01 Apr 2023 11:27:46 +0000
Received: by mail-pj1-x102a.google.com with SMTP id l9-20020a17090a3f0900b0023d32684e7fso10252085pjc.1
        for <linux-riscv@lists.infradead.org>; Sat, 01 Apr 2023 04:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680348462; x=1682940462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V9h16YuAEUK1wvL2RNBHCcwpte7Y1FwWRsmABLjps+c=;
        b=PGIwXlXrzX91EGrukJM1qAYYCcMIfBb3wXtKHu6+fISpFF6RjKrQ20HM+dKW28CSkX
         iKmubwFsJtVjc82a3/yKsT7EJI6YSkEby9CR1Gu/wr5/xSQLvTCve1Df6Xk1DTqfyL3S
         q7EubEeoKYuNmwpXskbDU6gG4ohF+9a5SmUnR8zH1YXpCFEI4u/tBEivbogaFZvwvOL7
         4UY5jBvhaMx3l1VaZM+KeSLuVzCEIRwFpAdVKKoyNY6viYAmZNOzyyydDuuJds592QI5
         liA3f/uCd48q2H5oWJzBmjcpiYiTK8JH8C7Uq6N0ewf2yNUPWhM39VWhKmvgFSW6U+ju
         x1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680348462; x=1682940462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9h16YuAEUK1wvL2RNBHCcwpte7Y1FwWRsmABLjps+c=;
        b=RvNnXmT5JTY6csfB8RuM/BAjhFg/FjLhbjKaw+4gV1Y+GAPRO8c9ob/AIgSb9NwBV5
         V8D6HesfeV1iZUnpu8WOHHR9JO6ZvFy0ir/Ie6CuZEQIPHCgzoUTQj3iJeAHKGU1T8Qn
         np4sJg3pLZ2+IkFHx5NSm3eSitgKOdeSA121eXYlXi479e57IW+lH0mtgOOyfvpoBESK
         EkYxlLefONs8/ypCvxLj3d1TBRNa/+c3v+TcnL6stjh9tSW0U/r3mJe52f//dtXrBIYp
         B/9nhJO5OENaTZPY9CQ7EL9XN4vAj6itVGhb3l3yc00zvYPmeZ684khZCyLAhRytQPMi
         LgyQ==
X-Gm-Message-State: AO0yUKX3j2S0eMoTVP18vdC65JSfM2R7cOPAraD3V/MwNpiUlnGsQQ03
	oNg486r+TIO0ltWpODANT70EVA==
X-Google-Smtp-Source: AKy350Yb2xF/pvwiHbx7wPM935xs42zQ6oSDlOhbgGDoGjfTqsYizXN99mKtJQc8tkFQPxI9LxR9KA==
X-Received: by 2002:a17:90b:2243:b0:23f:7176:df32 with SMTP id hk3-20020a17090b224300b0023f7176df32mr32788883pjb.40.1680348462342;
        Sat, 01 Apr 2023 04:27:42 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id j8-20020a17090a738800b0023b4d4ca3a9sm2915991pjg.50.2023.04.01.04.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 04:27:41 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] RISC-V: KVM: Allow Zbb extension for Guest/VM
Date: Sat,  1 Apr 2023 16:57:30 +0530
Message-Id: <20230401112730.2105240-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_042745_486601_061929E8 
X-CRM114-Status: UNSURE (   8.04  )
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

We extend the KVM ISA extension ONE_REG interface to allow KVM
user space to detect and enable Zbb extension for Guest/VM.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index d8ead5952ed9..47a7c3958229 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -106,6 +106,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_SVINVAL,
 	KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
 	KVM_RISCV_ISA_EXT_ZICBOM,
+	KVM_RISCV_ISA_EXT_ZBB,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 3112697cb12d..02b49cb94561 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -61,6 +61,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(SSTC),
 	KVM_ISA_EXT_ARR(SVINVAL),
 	KVM_ISA_EXT_ARR(SVPBMT),
+	KVM_ISA_EXT_ARR(ZBB),
 	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
 	KVM_ISA_EXT_ARR(ZICBOM),
 };
@@ -99,6 +100,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
+	case KVM_RISCV_ISA_EXT_ZBB:
 		return false;
 	default:
 		break;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
