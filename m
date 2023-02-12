Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BDAC05027
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Feb 2023 20:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vxjvw+LRGUbx5htbclP0k3Sff4m/gURYW7lAzHrRuU8=; b=dEK+9MZE5wMHgq
	UEQN5tEFNFzoFu+MqKLj2kvPQGWZUYmdTPiNR+40VcgGuwGwUPcbZgncS13iN6y3GSrG9oaRH2PYg
	VOxhtuFBfjv/RYYPsq6U4OuPjbSFfTDSmgFJI9lOkBcMU0+U1nTtgIZ3Sq+joqid4TDmKb9AP5Reu
	wJ6pIVihZbay50rIPu9oOtj88c2ZK0pfsNs2sMRAHaVoyd4Zxifi94AKeS68O1zIpVA8qy7NUazGr
	JvCv4DhyjMnOa1MI6kkU1ncwaOARBSCs6XOpnLWSjmy2QeEqTlT0NmGiA54ihbzzSi4e2F+go5Muh
	itRuKX/TQ4CzSrNsRxLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRJNU-00CJUy-Pt; Sun, 12 Feb 2023 20:55:17 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRJNO-00CJSe-Oz
	for linux-riscv@lists.infradead.org; Sun, 12 Feb 2023 20:55:12 +0000
Received: by mail-qv1-xf32.google.com with SMTP id di14so3012208qvb.12
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 12:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YPekLstCDhrZcyGnHLadPwpTLr5cjyPBku8Cb6ACLXw=;
        b=fFGOXIDJYDm93Ab74loOW+g8Vj4v3AlMLeH0eBe9hBV/SRh5etxegnsTeBVMWrdVsm
         cQZo6eJ0aYQK2q0vm1WDrdbm/d3alWR6F+nqSMsgDJhTWz4SXvkl7VwOYCn9rDkEXQFE
         yqwjWdOt7r+m2vXidPxf2Iihz6PxK379rcJnexonq14T3/4vVIStI8E9hxjQcIHa6e6N
         IcBPBTaZaSVlwVIdY5gmYxDtDuNzoZVSRhG/xLheg3HHtbp3rNdEQoawBZwanQEmA+Nu
         8nS6i9pxQhRIKEvYImMk4F3usX0P/hj7jaPfVy4teNxET7dyCO+LXQiKwimh+WKrjgd3
         EViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPekLstCDhrZcyGnHLadPwpTLr5cjyPBku8Cb6ACLXw=;
        b=TVHew0iHF2ZBFMPGjqreesldC70dRd88UwE4uuII166PFd9j4tOnq3SY4q+GfhaaUf
         Ih7lb/LkhlJwl0FTw/poVcFrtGAxlW/vBKwwLqa9Z8zmZT1BlJhazDJGslkW65q6he+e
         WowlD9qxzYHiS45iXFIGQQY+AdK7Lu0jsOgbc3WnNaxN0goPA306Y6k+zKNjlJ63JDQv
         KLpRO2LkWuqwH8JAYnqDfNoYKeeIMzq8Tb32ogDbLt9AzqT30W6r8J/fwD5Kp/QysWuI
         GXRQGsM54pjemY5lic9b7RTPMPJB3WMIflXy+IOz2yxQJQmFaKSmVp/CMszsWYWQTzxB
         VbOw==
X-Gm-Message-State: AO0yUKVFN1vDbejs9CZDyq1W5Ho2oADiOYxfSwavNiS9z5HNygGYrE59
	IRO9zcPpLh75jFK69siOAiOx3n2qB+ZPZQ==
X-Google-Smtp-Source: AK7set8DPoU4B2rtcewAMwnUFdPxbd52/8BIdCUSOwqeCXjPsIbc6C7WRwSQbd9NfZfzivtT9ioiYg==
X-Received: by 2002:a05:6214:21e1:b0:54f:b7e9:182 with SMTP id p1-20020a05621421e100b0054fb7e90182mr43409902qvj.45.1676235308045;
        Sun, 12 Feb 2023 12:55:08 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
        by smtp.gmail.com with ESMTPSA id o62-20020a374141000000b0072ad54e36b2sm8289233qka.93.2023.02.12.12.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 12:55:07 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Jesse Taube <Mr.Bossman075@gmail.com>,
	Yimin Gu <ustcymgu@gmail.com>,
	Waldemar Brodkorb <wbx@openadk.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v2 0/3] Add RISC-V 32 NOMMU support
Date: Sun, 12 Feb 2023 15:55:03 -0500
Message-Id: <20230212205506.1992714-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_125510_965729_EDAF0868 
X-CRM114-Status: GOOD (  10.07  )
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

This patch-set aims to add NOMMU support to RV32.
Many people want to build simple emulators or HDL
models of RISC-V this patch makes it possible to
run linux on them.

Yimin Gu is the original author of this set.
Submitted here:
https://lists.buildroot.org/pipermail/buildroot/2022-November/656134.html

Though Jesse T rewrote the Dconf.

The new set:
https://lists.buildroot.org/pipermail/buildroot/2022-December/658258.html
---
V1->V2:
 - Add Conor's clock patch for implicit div64
 - Fix typo in commit title 3/3
 - Fix typo in commit description 2/3
---

Conor Dooley (1):
  clk: k210: remove an implicit 64-bit division

Jesse Taube (1):
  riscv: configs: Add nommu defconfig for RV32

Yimin Gu (1):
  riscv: Kconfig: Allow RV32 to build with no MMU

 arch/riscv/Kconfig                           |  5 ++---
 arch/riscv/configs/rv32_nommu_virt_defconfig | 16 ++++++++++++++++
 drivers/clk/clk-k210.c                       |  2 +-
 3 files changed, 19 insertions(+), 4 deletions(-)
 create mode 100644 arch/riscv/configs/rv32_nommu_virt_defconfig

-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
