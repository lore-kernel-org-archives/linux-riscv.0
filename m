Return-Path: <SRS0=a5+H=NM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB96BC4338F
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Aug 2021 15:39:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C75D6121F
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Aug 2021 15:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C75D6121F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/vkWHzFfL3B1oaZF2Fa7J5a9XafBRyOh1n2zV1W4o58=; b=3OhvhlxJXXO8t9
	sjwajR8GqOFwC5TIJJPARCF4CbEanIwcZ1yWGWlm/A1lbSz8EFiAGGXLA0T8XsM2URAlOsbJ6rKmc
	OeEa7g8J7WRS0NfKo+KE01q1nQd7EYfOMlF4PG4TdH69zAcXhLj8DNfuJEHgiIV62xVjY2LhXG7FT
	2pMEKXq0liwjYznpW6VkT0AvXeSdXYAYWAa84WJqYmsMsoxTltGcwGnI8JjqQ1ZD9J9lQPNwrgn8m
	7W4SME+v6fAqYdyOTMrHTgtQtrG9DytlLoxh7kRC8bsQzMvcaFhpJMQTLZ2ayBxbNqi9Srk1bZ0zL
	0OYnj9pBPYX4z3zKPE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHT4z-00Cvs7-J6; Sat, 21 Aug 2021 15:38:41 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHT4v-00Cvrc-Gd
 for linux-riscv@lists.infradead.org; Sat, 21 Aug 2021 15:38:39 +0000
Received: by mail-pg1-x52f.google.com with SMTP id w8so12251568pgf.5
 for <linux-riscv@lists.infradead.org>; Sat, 21 Aug 2021 08:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=RTMJMW0nE10jtTlMIfTd0xjDXr/ztqWVbOop2zPkMIw=;
 b=DKif8Co6Mq/DJlrMwu2uroQUZwYZ6i0/rWx/+11A8iih4dM2ucXPel4otpAQg6dOks
 gPwxkF2N0jtikITGE72bcgVyrL9ZsLrv9XW1oqc3qg1rjY7m/M5OSAzP5BILiGv16dzI
 ZMG0KJX2Uz585+PFaV07oqpgA09jgeo0GtA30e0Pb2XTxRRwREfCgppr7emKU45/o8Yy
 i/Sg4m7b9suOWb4sL4Uyy7X8wEdTdGkMDF7Uofjqx8iqjs0aG3uMZoCJnSVeO1K+qtu8
 LuDOsd4PBGmJF7M06vULXKF7ptfe3vtSgmw9DfAHPw2PCO3HoE1dMzpIu6bgHQ3bk717
 6bDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=RTMJMW0nE10jtTlMIfTd0xjDXr/ztqWVbOop2zPkMIw=;
 b=KeoP5TfsI+vy63LT7eL1NdLkCtcYe5SsYLaTdYuboWBqQgB9iaJgRtIv0akgibLNEq
 2OqItXNX2HhZYZSk1yQLJUZ/KH1qhz2zZfq4z+gkR+bttP0yT4qSIAxnFAJsbDjyCn2s
 XW6AOqvNg/41D0sfjJQu1nYd86BnGjuCzNvreBoKuXqyYPa6lM6X5YKJl7RjpUAcyhNd
 KOr1VxgS4mQ/8hfDxICPARZzAoCoZCDa5OvQsoThvpnZyk6fAFBhpVyD4bUECLHqIoEt
 YjkxTKSowFUvj3Pl5ETKl7z1DtwgvZzhd/ssUzkxBIG2M0Nt6jZR/i/gqr/z0WYDfBbm
 j5kA==
X-Gm-Message-State: AOAM530P8/R+NjevkEMslHaBK8lYuW3dEV3Bw7/FgDPHbZrjS6G2Apni
 Nm3FXWIyNc94nJqmdphvci5HCGGGlUhSAg==
X-Google-Smtp-Source: ABdhPJwu3TlVxRJa93Y6m+d60OVdtrl1funU4u6Hndsj90YBDfb6327psOtIcsvH54agNq0QqJmrdA==
X-Received: by 2002:a05:6a00:2ba:b0:3e1:d586:c92a with SMTP id
 q26-20020a056a0002ba00b003e1d586c92amr25275975pfs.43.1629560315367; 
 Sat, 21 Aug 2021 08:38:35 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e13sm10816946pfi.210.2021.08.21.08.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 08:38:34 -0700 (PDT)
Date: Sat, 21 Aug 2021 08:38:34 -0700 (PDT)
X-Google-Original-Date: Sat, 21 Aug 2021 08:38:25 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.14-rc7
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-182cc50e-78d7-4a85-a5bc-19e7a4648e87@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210821_083837_661302_438780E4 
X-CRM114-Status: UNSURE (   9.90  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit fdf3a7a1e0a67a52f631b055975c6ac7e0e49a65:

  riscv: Fix comment regarding kernel mapping overlapping with IS_ERR_VALUE (2021-08-12 07:16:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.14-rc7

for you to fetch changes up to aa3e1ba32e553e611a58145c2eb349802feaa6eb:

  riscv: Fix a number of free'd resources in init_resources() (2021-08-20 10:15:51 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.14-rc7

* A fix to the sifive-l2-cache device tree bindings, for json-schema
  compatibility.  This does not change the intended behavior of the
  binding.
* A fix to avoid improperly freeing necessary resources during early
  boot.

----------------------------------------------------------------
Petr Pavlu (1):
      riscv: Fix a number of free'd resources in init_resources()

Rob Herring (1):
      dt-bindings: sifive-l2-cache: Fix 'select' matching

 Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml | 8 ++++----
 arch/riscv/kernel/setup.c                                    | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
