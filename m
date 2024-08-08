Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F03AC52D71
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 09:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q3YliMbBfmraQM4VsBWFCEqBvPwcRwuv9TdpZqXqh68=; b=2FEmsm+f6R2LVO
	VqOBgKxn9+WHwtlnv30HWoK+NAcISbslfE34d1c7ejXdjKUDSUQ56/OYoNbwoROQAUZ0RokGZ+n53
	pRhkuWVs5pIdkB07Ls44empabZ9nWchc556WowT9HBi1e3+sUzq8bM/Xt3iGQTr4WHKPyHtVKJJiS
	vwoaa8qvdz8+WO6QvPaABw8QHZ9WXzCOTWD8PzSnccv2OBiDq/Ytu0PcJk+SyWWfDrjydMAtNbVKF
	rEbamApcTcpffCJnbXl9QohK//HFKTKy49AGhZZf03uIkjkFkYRlA8Qm8bJDVqsir5DmO3CetboHC
	PBOeA9GyIo/0bZBbykWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbzFQ-00000007gaQ-34b4;
	Thu, 08 Aug 2024 09:15:52 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbyII-00000007YMp-042D
	for linux-riscv@lists.infradead.org;
	Thu, 08 Aug 2024 08:14:55 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-75a6c290528so537486a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Aug 2024 01:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723104884; x=1723709684; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uz2Q34geGJiRJ8e8z0pDWtJTTDFKWyWloO9Btu2KCw8=;
        b=a8JLt0RmZSZEJl//mXroAWRg5kRAS5CqtoZ352HxUcp7MMGWTh2jVKpZkNTlmuINDm
         nzlnRawrkwpDVLKmxNncpgAROuKiAs0wKhCgHRcopbBYpWdxS9Knx88hguxp4CdI5QGO
         TRgTLhpPYJJnyp2hSiOGtBhGLCNULgtzcl/Ugl+ZgG1j5HWcZ1ICjlF09HiPaoPfneCg
         6XxQDO2FaJLgInspuM1JtcOSKvY0Hn5gpbtrhkGs+BOj/7UMqJMUpBjh/kUZU04j2Tg+
         iB+u32P75vdAB5XPhiF/7CvqLPiyzyt0kOAXyrHOAuDtUliH4S6GsCOwND/AATiN2rRN
         kgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723104884; x=1723709684;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uz2Q34geGJiRJ8e8z0pDWtJTTDFKWyWloO9Btu2KCw8=;
        b=qQy7MNRkRcH1okp3AN8Hs7Nwg/H6arlpypIekdzQUCt2aiyTvsw0PU1ukd8vjsmtSE
         rqRYs0WpFBwHMKu8AXe4zt6cOFKnaoRaN5qLUk2hGQYOqnC+L5OKANtZDxyutRuAnYCu
         +UJNmM5Z02VRns/Z1YSPklT8eoaosBUt2QJHzHmNiCsAIsu86Wn4e5cJgpufXnHPfqqg
         wosI7fAKcXrcWlqF1Dq/Y0gj+WE6Ibyl4cPLacVXO74AY+AOp0VmQ0GoBF8UzmvEw8zA
         FpzdAbND1WPbmlBt9Qg/YOtrQoe5WfyeCO62yUF61S8z5DC/BRNT+AfwJltWf2UcqxFa
         5O7A==
X-Forwarded-Encrypted: i=1; AJvYcCUhDOPVPVjbGea8gdbuuhbpW2YI8433P/vDIoZFK5UBkdiQ8Rl1l+Waa6jgl4kdLRzSMcFU9XMgBw2F8JlFPLNSYRAU+Mgux/4wn37oglp/
X-Gm-Message-State: AOJu0YxOMZuNLGLpe3zDorRtdL1ayKev/6gs93DG5941MoH39z4owVch
	NIi95Fhx7d0C8WB894W0eITKC6CgZ4ThHchO17WvnnVYcb015RFXF8H/iKnLlDw=
X-Google-Smtp-Source: AGHT+IE8I00iIp/1AKllHFcYCJLmvvu0pdzTgwwUhvhBSbA/p5VCIfIk3GciGH9HF1hk5jCo+FswWg==
X-Received: by 2002:a05:6a20:5501:b0:1c2:912f:ca70 with SMTP id adf61e73a8af0-1c6fcf7b166mr898421637.42.1723104884149;
        Thu, 08 Aug 2024 01:14:44 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f18616sm118451765ad.39.2024.08.08.01.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 01:14:43 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 1/1] RISC-V: KVM: Fix APLIC in_clrip and clripnum write emulation
Date: Thu,  8 Aug 2024 16:14:38 +0800
Message-Id: <20240808081439.24661-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_011446_089464_B332385C 
X-CRM114-Status: GOOD (  10.09  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

In the section "4.7 Precise effects on interrupt-pending bits"
of the RISC-V AIA specification defines that:

If the source mode is Level1 or Level0 and the interrupt domain
is configured in MSI delivery mode (domaincfg.DM = 1):
The pending bit is cleared whenever the rectified input value is
low, when the interrupt is forwarded by MSI, or by a relevant
write to an in_clrip register or to clripnum.

Update the aplic_write_pending() to match the spec.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/kvm/aia_aplic.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/kvm/aia_aplic.c b/arch/riscv/kvm/aia_aplic.c
index da6ff1bade0d..97c6dbcabf47 100644
--- a/arch/riscv/kvm/aia_aplic.c
+++ b/arch/riscv/kvm/aia_aplic.c
@@ -142,8 +142,6 @@ static void aplic_write_pending(struct aplic *aplic, u32 irq, bool pending)
 
 	if (sm == APLIC_SOURCECFG_SM_LEVEL_HIGH ||
 	    sm == APLIC_SOURCECFG_SM_LEVEL_LOW) {
-		if (!pending)
-			goto skip_write_pending;
 		if ((irqd->state & APLIC_IRQ_STATE_INPUT) &&
 		    sm == APLIC_SOURCECFG_SM_LEVEL_LOW)
 			goto skip_write_pending;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
