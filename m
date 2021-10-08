Return-Path: <SRS0=Gszz=O4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC10C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 20:57:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3DA060F44
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 20:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3DA060F44
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=el4MLUL2uSfmjZCjuvBxtIUoFLFBP8yceKJH/CxbLKQ=; b=pYmTOvAIg9+hfY
	rJkXAQcYfONvDpMqvBWtvavqN1WfsCE3Rd4WH50SvzjyB0SoOzIw6CLE+LEXhKzcz0rhZmBKP1XiG
	S1xZw4XodyuwNWpnBWJhUrlq5y5jRcXGD1w2bBf90LJiLZBX+9umGUoisHoUHoqhrJHiK2ccBbEA5
	lvTnBi7F/MnSflc5Grptjjt08G2JKVGWBkgtifQJhtuikJDlwAbZujtqF3XdOH3W7jT/rex0L9SwL
	gAw46sT01UQ9O6+APHvnJd13EJzz7bwIRtxipnlUDyu3wPZ07OTGLEM5OiVUJBuvHdLXV0zLq364C
	7uPb0vYgokG04ZyZrNbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYwv7-004AQf-L3; Fri, 08 Oct 2021 20:56:45 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYwv4-004API-1e
 for linux-riscv@lists.infradead.org; Fri, 08 Oct 2021 20:56:43 +0000
Received: by mail-qt1-x82b.google.com with SMTP id r17so5490301qtx.10
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 13:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VAGXdnd+R7a1uOjvv7U4cHxnCIdxxrnrbgKVS0Ct3A8=;
 b=A+csej6uLv80o4wTGan2mG4ZLOzEjOanuFUK6K53Z1Y6lrWhgyU/ALd26NtaUGfWr4
 M57WaZv8jLAIx/efmgH0b1i4bVJVQn7Xd4xCCtCuufbbTynD5yVDQr5TBMFEwMXUPhcr
 UtSVNObqxbjeODL74rr/oQpKESk5CPwpxRu6UL/pxVguS5Psxxwhtzg3A6ixeK5FjkM6
 vJO9OryJKEpRVYuvrRaUdfHO3FqMNBGfzq0yalPNaRD0Y0IkXKWBsenXjy2h8Nsk+AQz
 jiyKTvCnxcVKA4x2ki3fBLBx+K6G8pdqQyPvUz2qRTNv7jODnEODSH7Aei2OgSjcv48T
 IumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VAGXdnd+R7a1uOjvv7U4cHxnCIdxxrnrbgKVS0Ct3A8=;
 b=N2HTywYYyMUkj5Y2KQQX5dATbE0h85WLnmCHbIBCH8hg/RzeOqQ2xRsxBi48yJiI+a
 bLEQgmENW0F6fNNd78C1a28EP1oEdeE3/WggP+jRvrC6QBSDdv9CUo+FyBbtUg+dPIBQ
 JnNTlzxHBOnDuXreJ6yvT3RCBgkhwHaAy16Ciq8eclOv+B8ojcolWOlf6CFQGuaa069C
 BdFlZPb1bqHGeAP6r3Sq91hmQeZUm3r/0JD8yZQo5dAc2yPGWFFSu7bw2khRSyCvS7MI
 Mhxd21ukSyrj8bLc6KzQabLCrSTZAZlCN9ysD/34x0QB/qrUOxQuwOgEHMB3M7l6QT+8
 nEkg==
X-Gm-Message-State: AOAM533HyEZIp5dHP39V8GJ0G08YPzDzaqgnW/TL7psWkkfKnmNj0Ajg
 DE/ucb98a9WLuIXnyJ/WmCU=
X-Google-Smtp-Source: ABdhPJxNl5Sd6V+Nq1FcBxRySYlXVe4dztQe6PQ1smgj5xvxYhX+8P/0aqRT4wkPyviuVLa+FWq0mA==
X-Received: by 2002:ac8:1e9e:: with SMTP id c30mr632019qtm.238.1633726600300; 
 Fri, 08 Oct 2021 13:56:40 -0700 (PDT)
Received: from dan-XPS-15-9570.lan
 (2603-6080-6a07-6dd1-a8f2-a380-3d8d-1528.res6.spectrum.com.
 [2603:6080:6a07:6dd1:a8f2:a380:3d8d:1528])
 by smtp.gmail.com with ESMTPSA id 9sm403010qkn.84.2021.10.08.13.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 13:56:39 -0700 (PDT)
From: hasheddan <georgedanielmangum@gmail.com>
To: 
Cc: georgedanielmangum@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Peter Zijlstra <peterz@infradead.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: cacheinfo: fix typo of homogenous
Date: Fri,  8 Oct 2021 16:56:25 -0400
Message-Id: <20211008205628.3073014-1-georgedanielmangum@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_135642_116376_7FBEFF70 
X-CRM114-Status: GOOD (  11.87  )
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

Updates 'homonogenous' to 'homogenous' in comment.

Signed-off-by: hasheddan <georgedanielmangum@gmail.com>
---
 arch/riscv/kernel/cacheinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 90deabfe63ea..ff98546b1152 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -29,7 +29,7 @@ static struct cacheinfo *get_cacheinfo(u32 level, enum cache_type type)
 	/*
 	 * Using raw_smp_processor_id() elides a preemptability check, but this
 	 * is really indicative of a larger problem: the cacheinfo UABI assumes
-	 * that cores have a homonogenous view of the cache hierarchy.  That
+	 * that cores have a homogenous view of the cache hierarchy.  That
 	 * happens to be the case for the current set of RISC-V systems, but
 	 * likely won't be true in general.  Since there's no way to provide
 	 * correct information for these systems via the current UABI we're
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
