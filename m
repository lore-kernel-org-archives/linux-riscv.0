Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD26C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 14:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=03MPLQiVHlhRPiz2RU229V5L0mn4/r3AjqNB72w79+E=; b=tvDjAHChmdt86b
	VwtQhRYAUc7l/S3j8Qedx2gCjUlCOGFb4y0VI5ENj4F4z7IIKrZDAM9/aenrxZXC2p67OwkkM9gdH
	p5F8iBCEyJ4IXGaEGmzTuSRPk6TTAaZgskdxloSbBeXWWiAngx8EfxYgqMEGrD80dnQkLjXFIRPhG
	xFYQ5+oY9mHyFXKlv0E+x6uOgabkcXDLRXVQnl8Zk7ef8OIpa7dL5hpp8Zn1gZtFAD+Y52MiH5YP2
	a1GrvmNgzWIC+AcOJ+azlsRj9Rz2VSfCEelLjWqOgqQTzETtkDWE1SWeme77IKFBfzGkNCTV+Z4Lw
	opTzvEXqKbX08rHRP39g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCh8n-0059nd-0S;
	Mon, 11 Dec 2023 14:20:13 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCh8B-0059fY-0t
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 14:19:55 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40c41b43e1eso17875045e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 06:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702304373; x=1702909173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qOlCMJwBwYnq+sc4eyv2TB9LiWqmTIQQJ4G+eSTSNEs=;
        b=KqLVGiFaGOJVMfaY1mqvKH4RBk4+elbrk+SsU5DuRtXfBUKZ5nWEIzx5RjqgeWESNn
         0b5V472ESPe6zjzIaadLzJUZXwRW9pZZr3jQamUoMzfDTR+te26axJ/qDeQcNgxOjNub
         LmWv/dz0xjf110vfLZbT3nGcJdhpI2Wp1sWTH9af+M15buhL96O8ttnReAAy9kDeZnWS
         gyRCjaOsXxh/qXp7sWCEFwyuj9k5FeIVJLV8ks41rIWNzXl0174avw1ngPQs3wal2tYb
         s3NCINlaXYS4pXVuTJmqoW9khaUuoifFyzuEU2H3IitifS2UxIcD+HoZtIMFnFFqlhs1
         cPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702304373; x=1702909173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qOlCMJwBwYnq+sc4eyv2TB9LiWqmTIQQJ4G+eSTSNEs=;
        b=ByQF7B7/YFF5nTEQGt1fO/UN/S+FH9UE0RHoKgJJEVia2+Lr/US4iPlOGQjd9ZUTjK
         hIXhobvDBxvCst8N0ebiLjORGDBEC4/sCJglYN+LbmfsaH/exjZDxWR6ZCrSOwr1lKUq
         Vcda80i6VpCxz77QpNE9JnNiSHMYpglmkLJFgk3vz53BBTJ60ABdo3EFFA0UyL9QkPfh
         FaDtsFaGL0dbIisNw3i32H4rTwdjGdE4Q5vxU+sxAuimB9GGtCQb7XL0X5Iyw0Y/mxPN
         l7/JOsFlGiheiJJSUan3SfVwnDPStqiVKyVG5/aAnkd7naB8eMFzpqPyJvZ5z5iFaNBT
         1aCg==
X-Gm-Message-State: AOJu0Yy4g3ltQTcInAMy25FGa9rE95MS1PrA1E+h2uIpGglrnOwQzKrg
	ICnOLZoVjk8O7q8ZKtisfCIfpA==
X-Google-Smtp-Source: AGHT+IHNZuhUDSHQwqbqJR6bQF+DiZTNX+U7LebyL8QHidDrkYX/aM6pa1KWGCN0tezAhwkUCGFaWA==
X-Received: by 2002:a05:600c:1884:b0:40c:28dc:f26f with SMTP id x4-20020a05600c188400b0040c28dcf26fmr2263783wmp.36.1702304372926;
        Mon, 11 Dec 2023 06:19:32 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id e17-20020a05600c4e5100b0040c34cb896asm11859176wmq.41.2023.12.11.06.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 06:19:32 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: syzbot+afb726d49f84c8d95ee1@syzkaller.appspotmail.com
Subject: [PATCH -fixes] riscv: Fix wrong usage of lm_alias() when splitting a huge linear mapping
Date: Mon, 11 Dec 2023 15:19:29 +0100
Message-Id: <20231211141929.74027-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_061936_238806_9203133E 
X-CRM114-Status: GOOD (  10.24  )
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

lm_alias() can only be used on kernel mappings since it explicitly uses
__pa_symbol(), so simply fix this by checking where the address belongs
to before.

Fixes: 311cd2f6e253 ("riscv: Fix set_memory_XX() and set_direct_map_XX() by splitting huge linear mappings")
Reported-by: syzbot+afb726d49f84c8d95ee1@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-riscv/000000000000620dd0060c02c5e1@google.com/
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/pageattr.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index fc5fc4f785c4..f5f8aa1d38d6 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -304,9 +304,16 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
 			if (ret)
 				goto unlock;
 		}
-	} else if (is_kernel_mapping(start) || is_linear_mapping(start)) {
-		lm_start = (unsigned long)lm_alias(start);
-		lm_end = (unsigned long)lm_alias(end);
+	} else {
+		if (is_kernel_mapping(start)) {
+			lm_start = (unsigned long)lm_alias(start);
+			lm_end = (unsigned long)lm_alias(end);
+		} else if (is_linear_mapping(start)) {
+			lm_start = start;
+			lm_end = end;
+		} else {
+			goto unlock;
+		}
 
 		ret = split_linear_mapping(lm_start, lm_end);
 		if (ret)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
