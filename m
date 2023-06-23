Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2620DC0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 12:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JDpPzlC6nJk9HcRRpNLx7T5z5NKLunxVdzS3D3BZ33M=; b=igTRyvjLQuQuUE
	b4utQ75X1E1Nm7tCrcffHcwbGnVkxj1CORoVdmm7HVVCbCy3heWxJBV1RNRecur5Ul/oiEIOHUbxz
	BG2m5AQINzt4GptoeeFv3KhC1tXExghMT+G75g2XIZjnj+ZHpAS/sjZuaKChLsLlBTvCOcT39sZbR
	d0Obx92HfkyrbQbLv9+NwZXTQH8aA/Qnlmd5bJ6MaQt3cHmcGxWFeMeErU5noSY72i9jy4qHJWpxj
	uD0+axc22rvqPtgf/sdBdyyThk6H3NziCyp2qAnj6h1ZeTjKtBQRXvNNhQLpPwqTBheCii3hoxNsr
	gHryhbnBUhucyQWsZotA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCg4I-003YUl-11;
	Fri, 23 Jun 2023 12:39:14 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCg4E-003YTs-3D
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 12:39:12 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-25ecc11961dso430452a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jun 2023 05:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687523942; x=1690115942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kkdE+cfSylJ+712UudViAal8RnuHXojgZSHU75O0ktk=;
        b=BfZ/OKajCUysHsuTmmD6KA7Ha2jpLWEFzX5A108/3f5MSUyPWsnDHkjQLvrCasct0O
         Djzhi/+i8bl2xHGBKKr6tlQ3Y0Xdhh5tCSj1poONxbWO26aVyh4E+XFo+rYvHvDKwtUK
         AMtaYefyyCOKbBqzAcI0ZnJrEqFRyCBkWDwzE/lRYfeBa6Njp4hy/JrITpgcH3xwZRTn
         FeyPecGqOlH2620WX2vEFuRw4aJuaQMIk71/tp7OHEVFE5NphxCiDGBnoXw/0vd4yFd8
         lurY0+eLQCrA70jkA6c4EoJYATPA887P7wzrhSc1MxCDXaF1X99bGv5p3kn5/mjIVhWh
         3bcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687523942; x=1690115942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kkdE+cfSylJ+712UudViAal8RnuHXojgZSHU75O0ktk=;
        b=OtX+HnabqjWl7aNWWq5D+nC98V6j+B6+Up+Q6F/V+ITkVPOYl5QJwsaMmFGsAlLO5M
         YtNuMOBQamqdGt806shzQMVi77qgnQXJwBfubI7m3/itE/vrgVHHkVPe70duORA/N4aj
         fR6KhMYQdghXPYIb6Kv9VMJjSYUNB91hZlIQcZg2dumY5zBpxBVpuOe4tT90IIIk2pPk
         cDNVM+bPUumVBxDReaKznxjNiLe8Oiv7LlSGKUk1l3jdgzKl3EHrCEvZPZs6BPCdpNdw
         BgSSEVojO+Ufz4z9BMBHxNEooR0KWhf6vcrpUNtaCFxJGjTSmKULwqsODlO+9hRJ+x1t
         Ek0w==
X-Gm-Message-State: AC+VfDw6tEKoxR+4XfE4FKNijpL0z1Oy//WmfJXA9uh4XiM74PQWGsgo
	LMYFP/mVe+/Ro3krhwcrjyZMMQ==
X-Google-Smtp-Source: ACHHUZ5EoF2OLNQawIWIiyQtv0zvnMSFwAh+0rp9e+0n5+oWRWF+lz3QxYfJiQrwClBBaqsg4U7t4A==
X-Received: by 2002:a17:90b:1d03:b0:25e:a057:afa with SMTP id on3-20020a17090b1d0300b0025ea0570afamr13833061pjb.13.1687523941855;
        Fri, 23 Jun 2023 05:39:01 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id x9-20020a17090a1f8900b0025bf330903esm5749117pja.1.2023.06.23.05.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 05:39:01 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 0/1] Risc-V Svinval support
Date: Fri, 23 Jun 2023 18:08:48 +0530
Message-Id: <20230623123849.1425805-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_053911_055093_FFD62B35 
X-CRM114-Status: UNSURE (   8.27  )
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

This patch adds support for the Svinval extension as defined in the
Risc V Privileged specification. 

Changes in v5:
- Reduce tlb flush threshold to 64
- Improve implementation of local_flush_tlb* functions

Changes in v4:
- Rebase and refactor as per latest changes on torvalds/master
- Drop patch 1 in the series

Changes in v3:
- Fix incorrect vma used for sinval instructions
- Use unified static key mechanism for svinval
- Rebased on torvalds/master

Changes in v2:
- Rebased on 5.18-rc3
- update riscv_fill_hwcap to probe Svinval extension


Mayuresh Chitale (1):
  riscv: mm: use svinval instructions instead of sfence.vma

 arch/riscv/include/asm/tlbflush.h |  1 +
 arch/riscv/mm/tlbflush.c          | 66 +++++++++++++++++++++++++++----
 2 files changed, 59 insertions(+), 8 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
