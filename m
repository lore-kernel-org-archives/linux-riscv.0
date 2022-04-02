Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AD9C433FE
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Apr 2022 05:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y/2tm/e/3Hvz0Zuggye5AmhqbzWB/afivep9opj+OdM=; b=uORGDDJ0L3kbhK
	1lm2DRt731y89t9G5gi/+pufsELpBXWvl1sQ1CxqBvcPpJMWZ3eROu5VKGbQUgnTEcwmxMRUzBwO6
	0w6xxG5i4DqdXXTm+kbQjKfeKtVvlTKHInQNLeryk3TjRvByv/IV/UuX+s8ZqJFsjysgRsxFVb2EF
	H4qNM9yddHp2exHgr5bI7W0MjqSsh7StRO+cXoP+dCSsLk+luXIhWl3d6bQUikyTZnWI4v5TIr2vZ
	k8Lfyfn8iaN4cJbX+gsUogfgbswIfDGyqYMQUboah8f2Uv1Gm7MjdWKibO037oxUorRUYhnmoDUjM
	H6xoROaUky38i/i7FS/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naVvg-007zga-DD; Sat, 02 Apr 2022 05:04:04 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naVvZ-007zcV-6A
 for linux-riscv@lists.infradead.org; Sat, 02 Apr 2022 05:03:58 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 n18-20020a17090ade9200b001ca699ee462so116714pjv.3
 for <linux-riscv@lists.infradead.org>; Fri, 01 Apr 2022 22:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=JxE+RWEW+46zWhCkShHjyZUwP7jLdproVcOpdmDQ50o=;
 b=Cb9ifftuOEg4bNIrtw2PRgGNZ2zu7j48jLZDwdofAi6CqwlcsmMdIa0SaqlgRhbOOq
 zsIqhzxJ2u4/ygwb7x/QX14/1Gspc9EPZJoLcajTf8Qe9zHhirHZIhy4HlqO6RHVBzgc
 rk9eJX1QjVcTGG+s4XKQDgZtN0oF81PqWi12GvRAJnSChbE2F/Y0QBm9hN4/u8BMsQqn
 jCCfmmnN+U9SKeQf5puP9YF8npNbzY2wxmxxLuXugpWdx63XAh0gh7AT2ZZDasBlH+7A
 jv6LM/DJ7lQsDvtFWuKxYg0MT3fOqtiU/HG9FRAoTf3BOglfLdNnHvfnKH8oohOpTfGW
 iHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=JxE+RWEW+46zWhCkShHjyZUwP7jLdproVcOpdmDQ50o=;
 b=jSaMnlx9sd9j6Kk20FnI9ArCQo11x81kpElN1ktdMGAJLBC6VDFcY35gvxuIDrdtF9
 SfcTDHNb+4WqBCG2NKsLeFWoYewvgrOfyQ17Ye69xDN81DDFBIvMQwT+Y66T0risREXW
 TrwY2RrYI+NnILJVEvyhuA9/sfygS8vB55bYN+Tspf9vHSn4NbaID2uG3EmTlQYi9e7S
 gsHClw9YUrkr0zn/5ouPP6dcwAvfYBlIbhETIq2rSxuQybvOpxMsgPZ59JO3Ox2K5rpi
 fAWLXWBzdWe/AcbNyXwxiANITciw0eBbnL+BvgyWqO/9iAt451Yjtr00aq4IBfoZC5W+
 ztag==
X-Gm-Message-State: AOAM533Y8VpQGiD75m0w9EE5RBglFIqKvvw3FHlSzbC82KC30FK7yc1N
 ycx5BWvrtni7shPCyOmvhWwucA==
X-Google-Smtp-Source: ABdhPJzb7WbfvbooQaPrSRud7psH6IEeYzSpvZX8Dk+vvYhoItvyyDWEmMngwytzbryJWGpSKer4Qg==
X-Received: by 2002:a17:902:ef47:b0:156:646b:58e7 with SMTP id
 e7-20020a170902ef4700b00156646b58e7mr7741339plx.57.1648875835762; 
 Fri, 01 Apr 2022 22:03:55 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 w129-20020a628287000000b004fdc453b49asm4790103pfd.39.2022.04.01.22.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 22:03:55 -0700 (PDT)
Subject: [PATCH v1 3/6] RISC-V: Remove the unimplemented ISA extensions
Date: Fri,  1 Apr 2022 22:00:38 -0700
Message-Id: <20220402050041.21302-4-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220402050041.21302-1-palmer@rivosinc.com>
References: <20220402050041.21302-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-sparse@vger.kernel.org, Kito Cheng <kito.cheng@gmail.com>,
 linux-riscv@lists.infradead.org, mkl@pengutronix.de, aurelien@aurel32.net,
 Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_220357_303515_41E76B45 
X-CRM114-Status: UNSURE (   9.13  )
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

This made sense when we die()d on unknown ISA extensions, but now that
we're just warning it's actually a bit detrimental: users won't see that
their unimplemented ISA extensions are silently having the wrong
definitions set, which may cause hard to debug failures.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target-riscv.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/target-riscv.c b/target-riscv.c
index 494c08db..924259af 100644
--- a/target-riscv.c
+++ b/target-riscv.c
@@ -37,17 +37,7 @@ static void parse_march_riscv(const char *arg)
 		{ "f",		RISCV_FLOAT|RISCV_FDIV },
 		{ "d",		RISCV_DOUBLE|RISCV_FDIV },
 		{ "g",		RISCV_GENERIC },
-		{ "q",		0 },
-		{ "l",		0 },
 		{ "c",		RISCV_COMP },
-		{ "b",		0 },
-		{ "j",		0 },
-		{ "t",		0 },
-		{ "p",		0 },
-		{ "v",		0 },
-		{ "n",		0 },
-		{ "h",		0 },
-		{ "s",		0 },
 	};
 	int i;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
