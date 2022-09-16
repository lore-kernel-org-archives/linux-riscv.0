Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456A0C54EE9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 05:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vBo+IwJg+fylrmnw6dDpD5B/0OYALSz04n2DQyGbIAM=; b=Ipn4H3QjghBa1w
	R/qYVpT875tXp11FI6ytawE1y7DJGcLwjR4/S2PTnH+4VomuAn4iwT+bWHZqUl25suNQGe5lmAJ3J
	26XLzVAxNtekZw/k3iLjqHAngBiarRv3vEecJS9ispQIsuSpmSnQV73UMNPV0iZVWY4CHL66EzHuG
	FVYF2v3MqIqVjU/6o/8xZdgRq5h9y0W9g2LH+i3rWFqrgkOVfr5vklIs3f4c6lFcnCPMV2qa8iHF1
	aDsGxvh7woBxp7REgkPXqXLbmDdLgbtXs8xboTVH22qMXrpccqsGVCyHToFNzs6kQsjBBBfP+Hzxa
	qFAKEvil2uRIwyGEnTjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ4Br-008XE7-RM; Fri, 16 Sep 2022 05:47:03 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ4Bo-008WvY-KE
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 05:47:02 +0000
Received: by mail-pj1-x1030.google.com with SMTP id s14-20020a17090a6e4e00b0020057c70943so24595335pjm.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 22:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=KR++kMsMWKOlc+go1l1Yf8GVj8KL9Cb61pjIboyyqR8=;
        b=Fsj5zXLtgwH/YZdlmfmkLFEPytAU1NquWJW8OQgjDyPxeRbtlhcW3+1Sa9n9LoEz2I
         NJD5/hmDPbgcTXEuKOk9adR/ws5N30EhCBhRkoir9JwMUMyHtYuLWGkd/D6iMPAXMEDf
         V4KlSCrDceX65VEDuaQyJm0ERVc/K8j43Nbj/sk9ZJv6/5SUwBj9ZpucRa5/p41yHhdq
         ljm61ZpCDMq5ERFu7NBe09WfMLrkIRWHykT6kAueXQiXTs6+VHUSHdJftASW6azzgDdg
         8lWnJgsEOpvqrLBoCmPK9SQvPrzQBlDA8qSI+9q89YDHBfTL0jP58Y09etUNMd9eOQuF
         E5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=KR++kMsMWKOlc+go1l1Yf8GVj8KL9Cb61pjIboyyqR8=;
        b=23yyzOW4aXwKvpAE/5cBuNINaDLKWdCoRYw3xOOzxH3SROnEjKAt/iJVojow3jqZwF
         wFDNmBu5KydfG+c2Q03zP3HnlCYtnHNJRRCwqw1DM+Hbx7rdp+89bM93ULZkKy+c9IDI
         JOtcYplzf8Bis/7QNIl3Pyn11c9cU7qh/qN/g1nsp9+GVp6kZ9cnPE79GgWWFCQIn9tJ
         FtEg5ylb0jX1Lan4schp3tTpjI6u0mCmRYL9/D6iocG7l7hNcC0xvpiIjpFbovKAM5P6
         lEB85AJd+gCkgwjk6IGbQkLKnQvI015UQHbk3tQBPTdO9vGmbQ96qNsKM75g6WYTUSDE
         aUHQ==
X-Gm-Message-State: ACrzQf0gUNBPI2HSGXmPKlfw2ge3FQYLGko9IKyRMDtLolzklmEx0TNy
	Fa3kUFkidy+k2I/VIUh83H9hIw==
X-Google-Smtp-Source: AMsMyM4JBGvTNh7fQE8NpCvxngyrCkqFd4GiiY6UYjLCpIUP4L1QeuUxrbS9VFy/56AEnLRQg/hg4Q==
X-Received: by 2002:a17:902:c950:b0:178:4544:55c1 with SMTP id i16-20020a170902c95000b00178454455c1mr3048836pla.168.1663307211793;
        Thu, 15 Sep 2022 22:46:51 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([182.70.62.242])
        by smtp.googlemail.com with ESMTPSA id t20-20020a62d154000000b0053e7d3b8d6dsm13400601pfl.1.2022.09.15.22.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 22:46:51 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1] RISC-V: KVM: Allow Guest use Zihintpause extension
Date: Fri, 16 Sep 2022 11:16:37 +0530
Message-Id: <20220916054637.24133-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_224700_711125_DE35AA40 
X-CRM114-Status: UNSURE (   7.62  )
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

We should advertise Zihintpause ISA extension to KVM user-space whenever
host supports it. This will allow KVM user-space (i.e. QEMU or KVMTOOL)
to pass on this information to Guest via ISA string.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index b6770ee08872..9085b90cf324 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -99,6 +99,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_SVPBMT,
 	KVM_RISCV_ISA_EXT_SSTC,
 	KVM_RISCV_ISA_EXT_SVINVAL,
+	KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 901bb5c0cb50..0de0dd22e734 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -54,6 +54,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	RISCV_ISA_EXT_SVPBMT,
 	RISCV_ISA_EXT_SSTC,
 	RISCV_ISA_EXT_SVINVAL,
+	RISCV_ISA_EXT_ZIHINTPAUSE,
 };
 
 static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
@@ -89,6 +90,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_M:
 	case KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_RISCV_ISA_EXT_SVINVAL:
+	case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
 		return false;
 	default:
 		break;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
