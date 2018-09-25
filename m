Return-Path: <SRS0=2CuI=MH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 867E4C43382
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 12:14:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46DDC20842
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 12:14:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CzF7v34y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="l6Ukytcq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46DDC20842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=piYv731vJYiYNGLRNWAfpPdIjj7wh3sSZUXFpxp5BO4=; b=CzF7v34yz4F71ZJSMtMN9OyHrg
	1PIo4C0L0c0VRZAP2hfxOC4ra1Pw0uBzEet71DiqKAdbQkl28t5fwha313oC0h7J4ULNY4aaYUXCZ
	rMDN9iR4k4SnuIIipt9t3Hrdv/uGBKJ0nLDkwvfyuPIDZieX/+zgAmlyC7Ev+pgEwQWcRDRQL+2Ns
	G8sBbWkIO8XNvl4bNN8W0dTkyPuo8OFIDZVcv3B6RtXx9QqVJdt7CDhf4nMW/zayMpQu7Bk170Ebw
	2ndfjvl8GyPJkV+P2SWl5NUPhBzb7BzLreDlLyJamWUfUJUO0pIe9y6YJELZqRy73ZIJ7vnThcQoR
	+1LBf0WQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g4mEE-0005GD-Qm; Tue, 25 Sep 2018 12:14:10 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4mDe-0005DW-BU
 for linux-riscv@lists.infradead.org; Tue, 25 Sep 2018 12:13:37 +0000
Received: by mail-ed1-x541.google.com with SMTP id q19-v6so351095edr.1
 for <linux-riscv@lists.infradead.org>; Tue, 25 Sep 2018 05:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2m92S3b88nnBwqQ1wfTMpyZvQhB+d+NfSNFR716x/D4=;
 b=l6UkytcqE3uswZr51nb5PDoAm503ScJYIHR4wM8YGMapY86ATjYVldX0otz8XPV0hx
 QHUVdBmUSvvGSom26vY7ncBO15CDFoMz5Tye7Fab3OpbhgKyoxZPYThxCfEJh/1XbUwu
 ZNjdwzHhk2/eLG8GffYaRREV6VD8L2eoUSlKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2m92S3b88nnBwqQ1wfTMpyZvQhB+d+NfSNFR716x/D4=;
 b=p4gmy8Yx8BKT97eDHa6cSfVH/NKwEfViLVivvncRyfngLDKR+foXO5tDWVWWjZm5vD
 LR/t48KJ/UAAo8/JQoDtOdaa5woUljciCvv00gBCpJBLV81LZSjaJoR+45z6lcs2yJFA
 KTKPd5c719O/09FofatID8O18RRpd8r8TG78ZaneuVt2nuosJiJnyxqGIOpkQKQAw42n
 ieYsTrLiEvG2QGHZH3NsWUmTkrd4eTRByQi8BmRZ8tp5gDvDCKJEwhdDbcicq6MC8tfY
 wUa6pwYdTBDNuV7sNU7Fgne3k5BuCKXXcds7/31rIHD3XLBqtilMWZ+Vl/u96VtPpw7q
 ZqsA==
X-Gm-Message-State: ABuFfojzGra2LqwM3nW1hznc3q4HGoVxO96JWzGOXeEXHJHR3YD5JQII
 6BujwW0/ItR6p1pdmj0nfStG9Q==
X-Google-Smtp-Source: ACcGV6397GTlvO5hBc3au8aBB6sURP6UyjRCA+SIKmcNBTRIxZ6ZT2TvQpsvrerO0ONicnim3huNWA==
X-Received: by 2002:a50:b410:: with SMTP id
 b16-v6mr680402edh.190.1537877582572; 
 Tue, 25 Sep 2018 05:13:02 -0700 (PDT)
Received: from andrea.amarulasolutions.com (85.100.broadband17.iol.cz.
 [109.80.100.85])
 by smtp.gmail.com with ESMTPSA id a11-v6sm6739522edn.95.2018.09.25.05.13.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Sep 2018 05:13:02 -0700 (PDT)
From: Andrea Parri <andrea.parri@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv/bitops: Remove smp_mb__{before,after}_clear_bit()
Date: Tue, 25 Sep 2018 14:12:24 +0200
Message-Id: <20180925121225.9917-2-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180925121225.9917-1-andrea.parri@amarulasolutions.com>
References: <20180925121225.9917-1-andrea.parri@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180925_051334_389896_377A3425 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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
Cc: Andrea Parri <andrea.parri@amarulasolutions.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180925121224.o-Ny55hdG1SzG3glbBljWz2LKdq1AsqsOUdVnWLErUQ@z>

The barriers are unused; remove their definition.

Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: <linux-riscv@lists.infradead.org>
---
 arch/riscv/include/asm/bitops.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index f30daf26f08f4..01db98dfd0435 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -23,11 +23,6 @@
 #include <asm/barrier.h>
 #include <asm/bitsperlong.h>
 
-#ifndef smp_mb__before_clear_bit
-#define smp_mb__before_clear_bit()  smp_mb()
-#define smp_mb__after_clear_bit()   smp_mb()
-#endif /* smp_mb__before_clear_bit */
-
 #include <asm-generic/bitops/__ffs.h>
 #include <asm-generic/bitops/ffz.h>
 #include <asm-generic/bitops/fls.h>
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
