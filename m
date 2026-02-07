Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB89EE0AC6
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 10:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AOu3fBxsp3z6Y0FFB+3qWLP9xMWV8Hh+bjWOU58205o=; b=AXjHpU2U0+7o7Z
	iuvDASWxgt+JtDAjoF6H65ZBz1WNJflkTcAZKRHLHK2yt+l+7mGdja6EVRvUfF3wVaalYv6cYNFYD
	Gy777i8bcex1Rdk+uoV41LvJoXP4tj2SpUqUGjZTNUnNPKXpVvLAEdQ5VrBs0HYpzvJV7jqMVvs6u
	+MJvl+yDohtpZYfY4WdpJAV6ncAAm4KDJwJnfgGME8VdjPGsRFsRCC/YeQRSI107ghwNds5VyrPvg
	WZ3sL9RcaXw7DSl3qlNbmcGkg0/879JkOJxZnhCbVWIkI6/lXevqrrbQjYv7Z8/LfoROg8vX1itXr
	LqtOcW65b4m9ybNCxFHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofYO-0000000CKSc-0abx;
	Sat, 07 Feb 2026 10:28:40 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofYJ-0000000CKQK-46Ia
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 10:28:38 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a871c8b171so20046105ad.3
        for <linux-riscv@lists.infradead.org>; Sat, 07 Feb 2026 02:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770460115; x=1771064915; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMXFepmq25l+gK8lb038XPHqcjpXbopjnxKMmYnopIY=;
        b=pb7x1Jlz43KZgs/S7Zq4ruKuK4OjrIYSogl6UVfET9wyt7ii79bqw2XoqmxA61Ueb+
         yYuLbbuK0hYmUD3x9n3zKh96XZTv8621UUoviRIBFKtzedhZScnBbYt05EZcETShI0sk
         vw4dEEn7gVIsNHEkizmRh25ubBQUXPag6hHS62+YcjH2gEvF227UbGDadcOJI0LmyZmx
         GD5ljwuISoSv8lXcRRyZA5YaOee3D8+rVz8ALyfUzq3J6U+kYtaxVhc/Y1NcVIuQV2XP
         sCsNQbAHN6DioaS0oxz+PbD3BuJAIo34sa/gwtxmemafQEognLzkEypQVyRLFHSZCyVb
         vdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460115; x=1771064915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UMXFepmq25l+gK8lb038XPHqcjpXbopjnxKMmYnopIY=;
        b=PtuBZTMIZk/gX7+1n90m56Y221kgCGh3XCDOw4l9/s54808rVJ7f6h6EAd8mlnuuBY
         wiVLfHrKbrZGsGF2GxKIIhQmtEYk/OtGN5B7VuCAvGMPTqQa3T892Wy02+rP003vRSmL
         5FgjDJtznUZjTlslD/en7TC0GjCXSS85xWPG2VQvqZYCyk9xgoGtx8qOl4dl0NPNkMy5
         CqHjyB4VhSlWQPLiEXOnr5t3RIJ/7Ny0H7mDAz80GJrdLlueDsAP4GT0gARCNrsjSMBz
         TJRi3k8dsuarVvnQN1CkfTo85DIHCafN7dPImnVQHkqDwwd5wIRk53SJuxC7DCLxkk9H
         0SNg==
X-Gm-Message-State: AOJu0YxY8B/RKvTLIoP0ThHQhrQTV1+DY9LLYjdCzMwsRFoqgUuA8e4i
	XFzU71mC6cErxx5wmIIp/wyQ5tiBOJG1YmlCfeuHa/BBGy0DfC177drJUwnG+Oy2fr8=
X-Gm-Gg: AZuq6aLrnhjLehyl9YH0Go8jPi6AF/1eu8kTby4oz1OvCf3MpgytR9UUxTRD97rLTiq
	fmI3oVMBvelK7edNDwJpOI1Mr9s8mFxjL1t+UY4OfKsCdwelf1VsF9oweatd00PNrGoI4V1VfBN
	pekuz/5ZH3xgBCqfLMbfEWp/GDUqObtu9CkZXC4ymCRH/XLAMO4XPDoco4Fd1gzQtCTtXO5DaI2
	JzgXTa+cd0YD8ZXKpFkaH4T9lUUwp1v5LjUaoWJDiVL5JX5Of1Mby99+hfH4Acpkhyh6FO4cpJa
	r6Ew3/x4PeVCQxWSUdf0Q7Bhaj+FHybPdB55Q7dya8wtSKUHsESXwe6autBB/ytAyV7MKKd9YaS
	zdjrpKprMY/Ipe8OYFFm+YcyxpFWkCTTSvFvEcV8c6/k9Ke/g8CbTDNwUliunDpJ2GNPJ2hFXFB
	VOVH1EhwTSq2hBWcGqjkgvP+pPYxSZscOmL7Yj2QiWDZrZeUkMYSJc2w==
X-Received: by 2002:a17:902:f68c:b0:2aa:d60c:d48a with SMTP id d9443c01a7336-2aad60cdb4amr1025915ad.7.1770460114944;
        Sat, 07 Feb 2026 02:28:34 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a638a1sm46516555ad.17.2026.02.07.02.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:28:34 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 07 Feb 2026 18:28:00 +0800
Subject: [PATCH 6/8] riscv: hwprobe: Add support for probing Ziccif
MIME-Version: 1.0
Message-Id: <20260207-isa-ext-parse-export-v1-6-a64d3a8bc20a@riscstar.com>
References: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
In-Reply-To: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_022836_023878_FD8160FE 
X-CRM114-Status: GOOD (  10.43  )
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

Ziccif guarantees that instruction fetches from main memory regions with
cacheability and coherence PMAs are atomic for naturally aligned
power-of-2 sizes up to min(ILEN,XLEN). This is a mandatory extension
in the RVA23U64 user-mode profile (and has been since RVA20U64).

Exposing Ziccif through hwprobe allows userspace performing concurrent
code modification (CMODX) to confirm the underlying hardware guarantees
atomic instruction fetches for naturally aligned instructions.

Previous communitiy discussion exists [1].

Link: https://lore.kernel.org/all/20250407180838.42877-12-andybnac@gmail.com/ [1]
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 3 +++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 3 files changed, 5 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 198b31bc9a20c2739988849cf7d2948a4fe1bdc4..89ff3d4e9f299de2b7d14b7ed77a04409f821621 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -399,3 +399,6 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension for main
     memory that must support misaligned loads and stores, as ratified in
     RISC-V Profiles Version 1.0.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCIF`: The Ziccif extension for main memory
+    instruction fetch atomicity, as ratified in RISC-V Profiles Version 1.0.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 323c488de5548883ddceac256bf312ec854ee899..ebf1434f54e6dc640b3414e8a23ab8e29ab243e4 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -118,6 +118,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 0)
 #define		RISCV_HWPROBE_IMA_B		(1ULL << 1)
 #define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 2)
+#define		RISCV_HWPROBE_EXT_ZICCIF	(1ULL << 3)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 6997c6007a8e86dff85b5b83d14924e7c2466eb2..8d774a0be9110c997a200c4eeeb434e8afd5c7f9 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -209,6 +209,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		 */
 		EXT_KEY(isainfo->isa, ZICFISS, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCIF, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
