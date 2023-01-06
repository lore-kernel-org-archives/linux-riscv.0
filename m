Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC0DC4708D
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 11:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7oMDYRFRtofs7tdGuBtEZtzv4X1mEx4S3UyFOcBxjPk=; b=mEfCuqW6sLIL9M
	D8WUA1mP5t2rT7D9ZhcP4NGuZrT5/56LnItegnH2+JGUNO19nDldj8xyzLP9nU9cbGfTiHBEaRuun
	sWzehP4YnDRAb/aZ+gYE50GTa8SrmmkiU5gbjovOxiD8nRIzzs3WbTQ9vT6crtSCowyWIjOLxI/6v
	mf5S3lzqTdfhS5tEWpGDe3wLy+rhhbQQMKWXisE4m7cD3koKfEh+NtcopH52ihr9MKTfDM4ySLmiF
	Gqh/UCqKhQpEGz5aSXu1SerUFF8/LGRDEOP/kQvmtBUH51LyYu+kE3mSn2FKM1VHdjlEPoW2sMjBf
	uiDAjmGyH6V6bXQOnvqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDkxV-007lEH-3I; Fri, 06 Jan 2023 11:32:25 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDkxR-007lCY-L7
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 11:32:23 +0000
Received: by mail-wm1-x32c.google.com with SMTP id o15so858235wmr.4
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jan 2023 03:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0yuXVUGh4ukmDqrI7Vx2oBw82/pBGU2yDOfMF7UQXmY=;
        b=K4XUpx5+nAewRWe3m0uXLL4lHUMGpIwDcW27NDvMumVpWPx8XqYOj8zTO5MD4YW40E
         KtkYL2M4QIr2Mp+dlS4E7CufwhPEubeLNzpJZeFA7PLDchoSIQhmPpLe4LcGRPzbELPh
         bptZjdbeN04YjPO3BPDr8sd7IzApIhcsOI9C0D5V1z4EFUvkWhAmszetxGzDZAHsnha7
         vQBuxgWjguy2pdUk7Y8Mzv4pvWAJU6ZvacaLco74spSzaToIuaegrOQPuIAZGg1bsvBu
         pveEVg380PQ4M322OTVREkFICZtoKzqD7xwvaO/wGOxZKCJBYAw7roABFK+qZvbDYvFu
         N0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0yuXVUGh4ukmDqrI7Vx2oBw82/pBGU2yDOfMF7UQXmY=;
        b=YJtIf/MeH7GYs2Mn3TEDBcy/x2b/BUiWEpieSlPZENdwCgFzD2xauWcwfT+8vKuBIc
         lbabQjGbKoKIzUa+j0lNii1BvVThVTOdr1/Epla9kraa/eaqcN9W8QGEKZnD8Pv+J66Z
         DExlRWFRr5KMrYn6PHQwpINO2gqZSk7r6QGOKRxXwNaPPsH+UsAyhjBDn/+wE/OJRpYD
         KUtvXnDBTc7Ujc+VSnIJd8cn2HFaoGdIoI0BNpgr8gNFum64q6Yx+0AkigotwMGg/euS
         Kvphpb04fmIaRYSmUQHfrC8xh0uBDQRAz9xBGEFglaxzNLDun/735GksR0+gTwFWodQ6
         z9Zw==
X-Gm-Message-State: AFqh2kowQ1jQA2l7ifO0lUj1IePAsj3+v3Ph2p0ow8UMqUqg7Nya7RFE
	/xgTf4Fxc0J+IimKzNukAx2+wQzotdPZANB6
X-Google-Smtp-Source: AMrXdXvNYCnrTGZAOY64I5B1iSr25VyETSrIFvlNeEYtcT9YRrd/t7wfi4yLYaoz+Jz1hK5I40U8jg==
X-Received: by 2002:a05:600c:5014:b0:3d3:446a:b46a with SMTP id n20-20020a05600c501400b003d3446ab46amr42149373wmr.38.1673004737637;
        Fri, 06 Jan 2023 03:32:17 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id l14-20020a05600c4f0e00b003d96c811d6dsm6327156wmq.30.2023.01.06.03.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 03:32:17 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: 'Anup Patel ' <apatel@ventanamicro.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Sia Jee Heng ' <jeeheng.sia@starfivetech.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Ley Foon Tan ' <leyfoon.tan@starfivetech.com>
Subject: [RFC PATCH 0/1] riscv: Introduce system suspend support
Date: Fri,  6 Jan 2023 12:32:15 +0100
Message-Id: <20230106113216.443057-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_033221_707422_B112E38C 
X-CRM114-Status: UNSURE (   9.57  )
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

Booting with an OpenSBI including the RFC series[1] implementing the
draft proposal for SBI system suspend[2] we can add system support to
Linux. This support implements "suspend-to-RAM", which means when a
kernel is built with CONFIG_SUSPEND 'echo mem > /sys/power/state' will
initiate a suspension.

This has only been tested on QEMU using the OpenSBI system suspend
test. The test just waits 5 seconds and then resumes. To truly use
system suspend a platform must have a low-level firmware implementation
and provide at least one wake-up event, such as from a wakeup-capable
RTC alarm, to resume.

[1] https://github.com/jones-drew/opensbi/commits/susp-rfc
    Posting: http://lists.infradead.org/pipermail/opensbi/2023-January/004091.html
[2] https://github.com/jones-drew/riscv-sbi-doc/commit/d9e43e9a938fc3eb510e023c3f352462876f7785
    Posting: https://lists.riscv.org/g/tech-prs/message/75

This patch is also available at
https://github.com/jones-drew/linux/commits/riscv/sbi-susp-rfc

Andrew Jones (1):
  riscv: sbi: Introduce system suspend support

 arch/riscv/Kconfig           |  5 ++++-
 arch/riscv/include/asm/sbi.h |  9 ++++++++
 arch/riscv/kernel/suspend.c  | 41 ++++++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 1 deletion(-)

-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
