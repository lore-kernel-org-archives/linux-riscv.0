Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CA0C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jun 2022 11:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DM4OiTkSYWtzyclAYVwplXR3CRv+uLoIzfd8b/4qA88=; b=km8y7X2q/1VSid
	+DaP2MWdvYvJQA/s7XJdm1rFkdKn84EBgSByg0vmCaIEWw3qoK1KbY+Aq2HvTuFLGT96U7S9YVX76
	9JTCZ8VOE8fnx5tXaNuYKRpBD7RzaaSDx45dZxb85OyhtPlBNGdDB0BlGEtXVm4YsSMGhgheCujRm
	wCyZ6NHaUWT+WL8WN6CR4b21i8wiJd3nHuTE/bpv8TL+621vEqwYBgWvVLbFLBADuxPRbwZb5aCla
	GvAgmM5BhZ6FVieCo6IVXUP6VHCn0ycLtCes32wBvLtrXnJvLrzyK11HHE2VEgWItYKh2/Reou3Gd
	SUkaa2vbxdiBmepJdVMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4L02-00EiVf-P4; Thu, 23 Jun 2022 11:27:50 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Kzv-00EiSS-Vv
	for linux-riscv@lists.infradead.org; Thu, 23 Jun 2022 11:27:46 +0000
Received: by mail-lj1-x22c.google.com with SMTP id o23so15792957ljg.13
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 04:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6/I0BGe/Dm/fRl7p147PmnTNb/JQQt37myhuj1325hs=;
        b=EiRpvSXPKIjWqSvfKWflxrHTKykHGIUCn8kJWwhTRkKwFsJJQY2zcKuXx6U1/uRVg+
         SqJXnTa/IyYxR79Ey6Uu4zeV9PGZdE1zvGtrMd5jdMmuQqvuiglno8PEgjWPrGSLe7Dz
         eHDSyRF/cH5DXw8LGc+zLuY7K2w9h/oj7oZtja2lPOL3+qpGTeNcAEUEU+7aGIIrIb3f
         pnXyGl07+Li4+UZVtqKfKHz23982WLUfAssYap1QNIsrCFGHjpcYgKzmQ0gBPFGqAFDS
         QwIlEQcLNKJojUBS7e8vjGgRUeh7DcuxaRA+/i6DjuJ1dGifLyJxwSqRaNWbAue+d/zN
         fEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6/I0BGe/Dm/fRl7p147PmnTNb/JQQt37myhuj1325hs=;
        b=CQAGeKqgUYiF7px/7Dsoe4yuVxqc7Z8X8Cr4a9x5R7WEhnJUP+xrT+/K0KMScSJxso
         nLPysbub3k1jSaDaxJGolyX392e5+bbzIVIbUAtDkoz2lGYa6TzMjOnUKDrLR8tXr5ca
         GNA/ryzh7AzQVHxqrQ+aMe8xluYqyuEBGsrvT9jOpbFy0idWnSYRh2cGkfRS3NsPjQR8
         A/aH1ouMNUqBQR0cDR7ZqDgjLneJ3Ba27AzgjlpaLqrUlNySbi9wF2CRoFkcyQ0WxaQk
         6gb20sDufrt0nRqu4soCt6yibH8+M5RAufc8rRkzLa7EXZJPZZkByveIGMVg+iSWGwz0
         HRIQ==
X-Gm-Message-State: AJIora9Njpt7CBLeokYajFuMKvYO6r991Njb614gMlIO0mmN75fjfDJu
	u8A3XV56rExmjmzXpKJFfNxIbLnygfQ=
X-Google-Smtp-Source: AGRyM1vIFEDigIo/emSoIFUuVKs3o/q3IjN0G047mkVIwzG4LVIAJP7rcjbCI3tPGQL2TiqHEtIZJg==
X-Received: by 2002:a2e:b0d7:0:b0:25a:739c:b0d5 with SMTP id g23-20020a2eb0d7000000b0025a739cb0d5mr4710791ljl.208.1655983658885;
        Thu, 23 Jun 2022 04:27:38 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id p4-20020a2e93c4000000b00255bd6e1923sm2752124ljh.45.2022.06.23.04.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 04:27:38 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Subject: [PATCH 1/3] perf: RISC-V: fix access beyond allocated array
Date: Thu, 23 Jun 2022 14:27:33 +0300
Message-Id: <20220623112735.357093-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623112735.357093-1-geomatsi@gmail.com>
References: <20220623112735.357093-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_042744_066741_35BB90DB 
X-CRM114-Status: GOOD (  11.66  )
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

From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

Both OpenSBI and Linux driver explicitly assume that pmu counter IDs are
not expected to be contiguous. Namely, there is no hardware counter with
index 1: hardware uses that bit for TM control. However counter array is
allocated without that assumption. As a result, memory beyond allocated
array is accessed. Fix this by adding unused array element for index 1.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
---
 drivers/perf/riscv_pmu_sbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index dca3537a8dcc..3e0ea564b9b8 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -453,7 +453,7 @@ static int pmu_sbi_get_ctrinfo(int nctr)
 	int i, num_hw_ctr = 0, num_fw_ctr = 0;
 	union sbi_pmu_ctr_info cinfo;
 
-	pmu_ctr_list = kcalloc(nctr, sizeof(*pmu_ctr_list), GFP_KERNEL);
+	pmu_ctr_list = kcalloc(nctr + 1, sizeof(*pmu_ctr_list), GFP_KERNEL);
 	if (!pmu_ctr_list)
 		return -ENOMEM;
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
