Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC432EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 12:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jgNGSFoI5yrZxGn7cdqCU7fgR+8geybL9l7CqyxKLCw=; b=DhDm1yhlPzyl99
	n9yIlLLsiLS6C3a0BKww6OmQiQ3etnRmuWtA+A5xtjcTIohkhzME6BXVEnT19sR8tDcBg+c2Gf6sr
	9mUIZhnojKRbgwal/3KvBZ1N2sIeEa4Lk2/db4RxX1s1LjUwuOEc6dI6RU0yHbTcdRXdkLoTB5M9Y
	JOhAKhpYUnzeGTuFfUa9lhSIx819O0B5kv9ClaDBeFt+zRy5Z4NMtS3cV7GOtl9mRc6Hyg/BtPtc0
	IoEMpk+fE+n7cJEwBpEPXZIVMsNd2o6x7KUdm2CJSkdqz1WJWz4y/YdVS8heW4nr3Slq8kS/wb9d/
	xKx+OjxNZoIt/j2e+2gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBx9f-00Ea8V-1R;
	Wed, 21 Jun 2023 12:41:47 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBx9c-00Ea7Z-2Q
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 12:41:46 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b51780bed0so46264595ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 05:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687351302; x=1689943302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jakmktEJ1up0aMulatON5TdrC+tj4ZL1HBqul5ZSPMc=;
        b=kzptDpQShDzU+vch0piE9or65a/xGd+G3058Fjjcx7MgPQmjHsmREJ8X4RZAZtjEdC
         9XBacm8ays1pDmmZGyANdLWglk+jv5JIr04ipIHnlfSAnHe9XzTQfyyGrHCE9EQ1qgfK
         nWGkEjf62uE+H74c5TEvKjkbVAim5qARsYMbCt7QdL954P3CphKLf9XgWsqbxOH64ZSy
         OHwlntByf7pYGadx2Eue3/UuGaTGC1MJ5vizSrmc6H8iXJesFpbH0lJw9zrYVgs5uXeC
         PzSsbXNvUqLkCtkLHx4TEtx9tfc0vM3b3RT7w+t2xvAsrV6K4R1GjzFaMIwncZ6qaHDB
         yuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687351302; x=1689943302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jakmktEJ1up0aMulatON5TdrC+tj4ZL1HBqul5ZSPMc=;
        b=U/G3bfwBXQ3EIuf66VKWZws7I84HWDe68pH5jdqaBm2PNothvudXEoAr3wI0WtXHyC
         vNqLm/GMEupmwsgv8ncD/+vA5dVwd8T4rka7/astQMYQN/Vi8D5ax+6r9nv6ESnaaWa9
         DKgs7M48eV7AZ9zCR4hCB1bY6zBv0wR8V0Ta3yfFt9qx0/ke9dSI6ZVcwRAIW5tUNTJ0
         lcIoAhBnaoWR/Kh9ZTUiYPmhzB/foo8TPxTl0PwMUwu7ieKnkVs/KO/8e9KtfuwrLMKW
         EMQrpGPSwMPo9VyJOuxaCaITAqPFvrgaJx9SB0Hgl0Y/Q/G6uf67DpXcbC1ea2RvLINR
         B0Ag==
X-Gm-Message-State: AC+VfDweUobcdJPOmjnSvyNHpiKPJI9nwqkCdxYuYWZP0NH4R7mkm/yF
	SMX7TJx3l95zBrDICEAwka7P5g==
X-Google-Smtp-Source: ACHHUZ4QiHZCwaf9JB7SH13Mr9WRWcW9kt2QbfgN2hmpqRxZmi6IQm4G+db5Bupirxcmyl75DyLL4Q==
X-Received: by 2002:a17:902:c651:b0:1af:bbfd:1c07 with SMTP id s17-20020a170902c65100b001afbbfd1c07mr14586632pls.57.1687351302559;
        Wed, 21 Jun 2023 05:41:42 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([2401:4900:5305:4d9b:7b:d038:88c8:7461])
        by smtp.googlemail.com with ESMTPSA id jw10-20020a170903278a00b001b50b933febsm3400256plb.238.2023.06.21.05.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 05:41:42 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	=Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 0/1] Risc-V Svinval support
Date: Wed, 21 Jun 2023 18:11:32 +0530
Message-Id: <20230621124133.779572-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_054144_785864_86272A09 
X-CRM114-Status: UNSURE (   7.89  )
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

 arch/riscv/mm/tlbflush.c | 62 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 6 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
