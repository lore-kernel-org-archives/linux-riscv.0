Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93CC8C07E95
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 20:52:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B1C56113A
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 20:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B1C56113A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=basXvkEvWoHGvZ4+h+a1AqefMNHfm69Ymq0WlCdueVA=; b=sKnlc8DXW7FS1d
	W0oqZ4Lj2Ytiz68Ql5xVbOzhvIzMNnxBZPOS2ADox2DX305Lu/rUiLlcI+d/MVlueWvlwVNMy9QdM
	paTts7mBZ/OFCiqncd4vb52ARHMl6rjhlufRynN03kXFhQBrPEziGD18Zi9r7SnX+7zyUr69Fveoh
	auV7Ynvxa+KXtzfn2h7TcW6t5LbOs2WFNHs1vg1ix16zmdItAOeo9tywMtdOi7nptXpV5U/I0gF6k
	NGUWRHAVXl9bkr30HttdyiRTRDXm6lXRX5183GQgHAeNtSxVQuIdj+G1uIpwHFtcNZQpNH00/KabQ
	L4G4nICmemw3dSedi2jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5aFm-00BJML-Nz; Mon, 19 Jul 2021 20:52:42 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5aFk-00BJLY-3f
 for linux-riscv@lists.infradead.org; Mon, 19 Jul 2021 20:52:41 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so990752pjo.3
 for <linux-riscv@lists.infradead.org>; Mon, 19 Jul 2021 13:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aG3gLfI8y7o/GHJXkoto5DIVOeV/UNicBQ2Kjsz2DKk=;
 b=KOsnSXDXBHk7lFsl6ObeonE63mDUUpkFxljf3ktpwwsTlK3ooCOuj0+I6w5J83+bJy
 xOoosWPKHOHKFRsWoiCcK/kpZ2h281XY7mjfmMJp9prYoBxS7dUbL1+98hldqX9qYKWd
 SoOLfnwcCXOboMu08t5HHCDHz/gTiaMJI+DaKuZznNWHtx6bl0leRFpiwbvMHjXPCVF3
 RQfOhT7lswyfarg3Xvb1GuVMHUFl4TQeZN6TkJL5ib7foz3Ch8N6uBTGpul5ziKMlr57
 rU700LB9DKgH8X2AkmCLvquApMcGsvXKlgkh6xc/f1lp0u4xNqAE787yt4rx4GczlaAW
 iV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aG3gLfI8y7o/GHJXkoto5DIVOeV/UNicBQ2Kjsz2DKk=;
 b=paG8U7BoCnOaTof5rQujp0ylWhD3b2UH2rCH8pAorVlfiE2lJC1X1rWNZHKknHUPHr
 9vOuXev4ylR7FmCvQwWxT1L6Vn1LkL5Nzx0cMXbkj4Lo1+EB3LlWnZyC2v0M+oj5SHPc
 VX7n4k12fZ7kNUuM3nmPoSrxN0+kusEX3//hyhpwSEJqixNE/35bQc7f3+YVCmUZ/GaW
 CQ6A2D6169ixDz9PCu+PjPCn0Hjty5TlsUrE2uDZMYH615q0LecqA678Op2gBGPMsiwk
 A69uGworON7hJvG4LMzb99m4Gp685W42xSUv86dOQM5Cek3QjTQsxxliPjoknzWSiSKu
 BzrA==
X-Gm-Message-State: AOAM531AlgGtwwl5z3pbi+Sun33NS4/DynS6vXWVGzMT/L/EWmFTbnqh
 J2e+tgrDNW/J8JcZEdZfYJw=
X-Google-Smtp-Source: ABdhPJzH5zDkt1aJ85rClFw/YlZrOF7lpE6XOpsibYeSekp/5r8k0bd3Bf/txoyobHLD/T3gsZsSVg==
X-Received: by 2002:a17:903:4095:b029:12b:9a0a:e79b with SMTP id
 z21-20020a1709034095b029012b9a0ae79bmr185766plc.32.1626727958252; 
 Mon, 19 Jul 2021 13:52:38 -0700 (PDT)
Received: from localhost.localdomain ([2604:a880:1:20::1f:7001])
 by smtp.gmail.com with ESMTPSA id 30sm23742437pgq.31.2021.07.19.13.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 13:52:37 -0700 (PDT)
From: Wende Tan <twd2.me@gmail.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: Wende Tan <twd2.me@gmail.com>,
	clang-built-linux@googlegroups.com
Subject: [PATCH 0/3] RISC-V: build: Allow LTO to be selected
Date: Mon, 19 Jul 2021 20:52:08 +0000
Message-Id: <20210719205208.1023221-1-twd2.me@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_135240_203842_628BFA00 
X-CRM114-Status: UNSURE (   6.80  )
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

This patch series first fixes some build issues, and then allows LTO to
be selected.

Wende Tan (3):
  RISC-V: build: Pass `-mattr` to `lld`
  RISC-V: build: Disable LTO for the vDSO
  RISC-V: build: Allow LTO to be selected

 arch/riscv/Kconfig              | 2 ++
 arch/riscv/Makefile             | 7 +++++++
 arch/riscv/kernel/vdso/Makefile | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
