Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4766DC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 05:11:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C76F2064C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 05:11:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cF11RqzL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="XavHgQ0t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C76F2064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bJBmsLr6MMw8oIqVzwtCDTMvCjXKqfGvsJUgqzhlRr0=; b=cF11RqzLU9zLkM2h3p9TAqu7XL
	yISUXXgao7cxUOks7LWG/9e+MYgrWoiqOSnAN1yASvupmSYKwt4s/EN6ciA+Ng6wvKfqTp+znlh1N
	thO5hRPejdSlplmMfwDvE5avtmtqXzCncok/tc0MybeqZnge5d0SwoGPDUsq6gAAH3lD0LYbM56yE
	z3f+TGz+pjUEs1Sb4grf9XbLTYjKKs1wamZoCmh+YkCbXMYbezvgu1iv6t4y2ce7dOuM8Jv5Y1P2a
	UoHKJEnVfExp9/XP+DsLDvI2zXURIPXr63T/VHcPNpa/QdD+EzmaPtxSTlWaLW4UNanH+4Z2mRrKC
	nvgYuIeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gI5G9-0007xd-8V; Thu, 01 Nov 2018 05:11:09 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gI5G7-0007ug-Co
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 05:11:08 +0000
Received: by mail-pl1-x641.google.com with SMTP id b9-v6so8353345pls.7
 for <linux-riscv@lists.infradead.org>; Wed, 31 Oct 2018 22:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ubKhKoPKckBfrs+izWAdzx1As6ZWGpwYQzLemVrm8W4=;
 b=XavHgQ0tiG+sL1Lqmp1jYFSlZW1h9lpV7Qg4z0FuK1KUlMNuCBfwWIAFtb2/5uM86F
 iDXH3hQ5889g5L4+R8RmQiDR7Xcosr9no3JTQnTdgX1mMmgRfMIl6dB51+NcG08Bk0m9
 jtlWAJ8FXZIeXO4ap+EkuVgayi0ycTmUahE1FMe9dNtrHztq74GcqRBNBaofWrJ1Uhcb
 I+yuT5tUKwF78jqCWQpTQslJRvZi2mxjMbH1hqthxjbdHde955aKXpRbMDe2zToaAV5f
 D//QfqC0c6otnf6edI7kVpU99PCsVc7jSv7Qo4ceghjj1Xa9ATNAE6/QSGHMgJOLCb19
 w2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ubKhKoPKckBfrs+izWAdzx1As6ZWGpwYQzLemVrm8W4=;
 b=c3yf9suQMbhjtN5B2Wj76npyHzfY9y41jr16lNcXYTqpkUYwr7yeUaXyReWXFQv0zd
 meO5JYFIAM6hgFfAqGhwAPlt/Lf/M+weDvwIMjHnsrlbcmjewPso6Q6dmq12Gi94UBgm
 JYMXvTQ5GSYchSog/H6FkGDc8rzCLHYRT344dImgOCAZQes2hsB2BQNMYKc2M0M3EbC/
 2QeYhhRqRCWBIhKVYO5ovTCQgeo+8fPBligBFKRpLxReb7B5kzCHlBOkjsNMMkhzNeCx
 CQ7NcNeJNQHoR7A3xw5tVpPZyMEhUDxXRp9gG/VZReHghxh3DP566JkSYADAwLaLYBXo
 IBrw==
X-Gm-Message-State: AGRZ1gKw7RvHGKCuOuAVTC2cSdoYHvKmvjBOu1oGUDs1qmACX0ORfLAO
 J0jwN4I5ZPkY3EfZYr8YqEeCI+cZXhQ=
X-Google-Smtp-Source: AJdET5cexhv5tYBwfPxqcaSrBk5RsPm6d9IWLTe9sDjZ/dYZYEwyJtA7V6pfYTmNqQNGtQMLcWNlJA==
X-Received: by 2002:a17:902:108a:: with SMTP id
 c10-v6mr6439201pla.49.1541049056282; 
 Wed, 31 Oct 2018 22:10:56 -0700 (PDT)
Received: from anup-ubuntu64.qualcomm.com ([106.51.30.16])
 by smtp.googlemail.com with ESMTPSA id
 d65-v6sm40439166pfm.100.2018.10.31.22.10.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Oct 2018 22:10:55 -0700 (PDT)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Olof Johansson <olof@lixom.net>
Subject: [PATCH v2 2/2] RISC-V: defconfig: Enable printk timestamps
Date: Thu,  1 Nov 2018 10:40:33 +0530
Message-Id: <20181101051033.10089-2-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181101051033.10089-1-anup@brainfault.org>
References: <20181101051033.10089-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_221107_437532_216D53C1 
X-CRM114-Status: GOOD (  10.86  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup@brainfault.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181101051033.oDRrnRA4qfiN06oj5wDRPX9l0Uvk-ZuqqNd5zkaIYxE@z>

The printk timestamps are very useful information to visually see
where kernel is spending time during boot. It also helps us see
the timing of hotplug events at runtime.

This patch enables printk timestamps in RISC-V defconfig so that
we have it enabled by default (similar to other architectures
such as x86_64, arm64, etc).

Signed-off-by: Anup Patel <anup@brainfault.org>
Acked-by: Olof Johansson <olof@lixom.net>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 07fa9ea75fea..ef4f15df9adf 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -76,4 +76,5 @@ CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
 CONFIG_CRYPTO_USER_API_HASH=y
+CONFIG_PRINTK_TIME=y
 # CONFIG_RCU_TRACE is not set
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
