Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24593C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Mar 2022 17:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6NNGrep72lBHAaleOf0liAB6vjpiG3mecmtfYwxhwH4=; b=pshvZn/m8ai5iz
	HiJDqdFhgaORZgbvjQ/tfYnIQNboSvp8L+0e9OPHm+oPE/Nq0gRw5HSX555dKiV7Q+Q8xwrXCJUX0
	MGUF+Ksw/8H/1A48LLqjg28YDzBYuHHRoGR+JOlIWzOLgi/y0DHbGy3naS2h2J6P+IYbyTFRwvutL
	FtZsBCYqnJoNiUJYDLr2YbsrAM58XDa1uqTxR86OEEs1RCLu56SkhxXdc9nC373SAyi5/GPpHZazs
	5jYYdb0ppnNKsPy64MJC8pJnTM2nWblBuObaJUkQjjhcjfC8PS4YhH1a0+yKwse64RaH5r3utWOcr
	NUXS8Muz7kRcD2NawaJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX4dS-00EOx5-FP; Wed, 23 Mar 2022 17:19:02 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX4dP-00EOvF-6v
 for linux-riscv@lists.infradead.org; Wed, 23 Mar 2022 17:19:00 +0000
Received: by mail-pf1-x436.google.com with SMTP id d19so1979183pfv.7
 for <linux-riscv@lists.infradead.org>; Wed, 23 Mar 2022 10:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aUhE442Chh0VE73xSyuaumajE/w5XLbPiioPvB11NGk=;
 b=7pjMO3GVK+ZW7atuxQR6ijXrvohpgOt+NoFs1nGisTNVLrarZcCGq2tgaMGkkMkLRY
 CuIPLaDoebffi7nHz8osTESDZ+gfKymOObyQQX7IOhQG+YOrMW9MKZoKho3adIBED71/
 QIStW4PjAz0uDneoiisP/VjaZBfJuPLqgrOqSlIR9GwH+RQhRKsWlg29R3TR7WijPof/
 KatIfaWoSLxeTPF94f9/YIsFkTCGWY0YNJW5yUgDmR9eN0ZhCAlKQZADrml8qbC5Br7R
 0GSQqyCI58nhVts3KB7gLmjLYLiuN56tYQk49MYjPoRhUfyuakalm1pqnnhodJ2rNEWG
 CmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aUhE442Chh0VE73xSyuaumajE/w5XLbPiioPvB11NGk=;
 b=KAp157HlXY4mei6tmWfevoptU+zN7rN1F3fR3MZLxpSy21zOOd6i3+7D3Xn2+eGYUc
 P5Pb0iJx1b3z2/MbVr6NseXtF9ofsMkmQjO3W1t+r/Fn4P+78uhKPiGoJKz17ZdV0Y75
 fRd2VP/l6q4fg+jjZNHuUGyCLXZTxXGHoQ5qDoM1ZQcaH2UzFnk+XJ4omikh2awGah+G
 6faAOc1cXW3HXMeLGs7+yL1yehLJKcGNU+X2r7UWLJqDznx5Ejyno/gWLH2bTLaMW+qk
 cabj4WhsSijfJr/dVYnoExfOg9fFPz8m2oq3GRVgcHXoRqYkDRR5UDpGEuU9GX2rTkGu
 /1Rg==
X-Gm-Message-State: AOAM530ezqHHvg2p3cxtjvMi8Z+NN+Dr8tfuH97WNlOip9shfSvDQ4BE
 aRcNlj2rmpghzZhYkVKiEpJI2A==
X-Google-Smtp-Source: ABdhPJwiUO6omSax6cgN0DHF/2aBUy3wNyRywh27FzWP2RZbe9jd0lms0/eROJU0CEYJ9QnJBNtovw==
X-Received: by 2002:a62:1407:0:b0:4fa:6d31:1056 with SMTP id
 7-20020a621407000000b004fa6d311056mr775126pfu.7.1648055937273; 
 Wed, 23 Mar 2022 10:18:57 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 p128-20020a622986000000b004e1366dd88esm444524pfp.160.2022.03.23.10.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 10:18:56 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, kernel test robot <lkp@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] RISC-V: Declare per cpu boot data as static
Date: Wed, 23 Mar 2022 10:17:26 -0700
Message-Id: <20220323171726.1303706-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_101859_332781_46E81F4E 
X-CRM114-Status: UNSURE (   9.91  )
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

The per cpu boot data is only used within the cpu_ops_sbi.c. It can
be delcared as static.

Fixes: 9a2451f18663 ("RISC-V: Avoid using per cpu array for ordered booting")

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/cpu_ops_sbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
index dae29cbfe550..7f2ad008274f 100644
--- a/arch/riscv/kernel/cpu_ops_sbi.c
+++ b/arch/riscv/kernel/cpu_ops_sbi.c
@@ -21,7 +21,7 @@ const struct cpu_operations cpu_ops_sbi;
  * be invoked from multiple threads in parallel. Define a per cpu data
  * to handle that.
  */
-DEFINE_PER_CPU(struct sbi_hart_boot_data, boot_data);
+static DEFINE_PER_CPU(struct sbi_hart_boot_data, boot_data);
 
 static int sbi_hsm_hart_start(unsigned long hartid, unsigned long saddr,
 			      unsigned long priv)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
