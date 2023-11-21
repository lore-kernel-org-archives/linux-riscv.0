Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA31DC61D90
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 21:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zv5OBGhiATzdAcqS8unHkO0V8XVx2Hqt9k+bazMG6mk=; b=YxkQgpxLhH0LdQ
	CIztwDsFoOv7HwwVQABN+mM5GaKa2XnTxYjYkOJO7lQl7GGJr4gDHshRp8JCzVDf2j2Qs6NXLTnr+
	IpMqx3y8hjMQ47iWmOdZh8YClfFKrNJhGi0j39XH2l1rfIfPazMQfrjVk08YKTfeyLT8MspeaREFD
	+M2Nd9mQPdj7D3C9dTyRmjN2toRD3XHOT+6xfoJe8r0Q9KlIT/ede3YIV8KYld117DP+o/e9r3UpO
	7LL7AcHdCAj0JnoHROqLJNxS5IozMOiRHhL0ikBBVfqt/d9TOIUdv9hVczYnIqphp4/k8WsMbjCWn
	bsAQIpUi8ubhYZ/dtKwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5YAC-0005tW-0i;
	Tue, 21 Nov 2023 21:20:08 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5YA9-0005r3-0D
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 21:20:06 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cf5901b4c8so26818025ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 13:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700601602; x=1701206402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kgh0uBFCCexs3X74tOvJ4nUeduxVPgSncyExFdlszoE=;
        b=fmQIIoDvOefDBMpEtzIRLO31Q+dJ+3Y61T/pyqYix8JjL6qP2TXPuk3b+fcRuOUrbz
         bRh4MeuR/nNKEBI1Tu23Wz+juLTbwpRs7KtHLNhiMzcmXTyUbC4CDYX6ZLAwHeK3AvtF
         NvULJatwoqHyk/GYUSBBY9/dKf/vHWiKBeEGZ62+KTO3bExPDhxEwmc+O+hwj2c4lX8e
         IvJlQWBs3FCirTg8t4GtAqA8t1t6XUJDObaAqpxvEmuFiDzvz8I7eDIdunl71BB3Q8C3
         cJpzfrOrs23H1lHjjY3CPt1tzqNYoxiQhYp9hgVjLKOpLrHqkNTmdPwa9nww/QI8uaHU
         mR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700601602; x=1701206402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgh0uBFCCexs3X74tOvJ4nUeduxVPgSncyExFdlszoE=;
        b=aLglKIhbP/ZOVr6YXjM+SvRCEMyXp5+pllvygaKw5iOMfKrOz2asbZy/jQQxpqP4d0
         fNi1BspVk7IdQHeFy9Ujfzi0WTRkVkTEx/cGSwpIXfKgy2mruRvn0F+sBptMgPlVag0l
         cl9Rqpr4OMe2Id0r1QU53QvBvZzv4mwirBcTY6qaqKgwB7FMm8m9Zb3Ypg93hIl/YrGq
         YGVmQ1S+qnIgOBW0Ox8sj6+RBekKQniQcFuk8Z2oNFd+msDHP2bAROv0Z0kXVWNS7qJN
         5CFMPdP5JHxS7EdN2sPe2lY155VEQnslmKxmPhsGSNCe8ms5MSW2SkrZZc/eAOdhyvOk
         6RwQ==
X-Gm-Message-State: AOJu0YzQrllyFzXSPh7sCepRU12fLPlJJMqhGgF19ZPfKvstRFUq7sR4
	v29LdKp0zZpSYMPnzgvzgFT9xA==
X-Google-Smtp-Source: AGHT+IH7LCfW7pTDQ78ElXfcTV37jEIPXch7qDRXDGAYWklJ2EMCEyweA+opQIBlNxj7jsdRKkdq7g==
X-Received: by 2002:a17:902:aa8e:b0:1cc:2f90:6291 with SMTP id d14-20020a170902aa8e00b001cc2f906291mr367179plr.54.1700601601956;
        Tue, 21 Nov 2023 13:20:01 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id p7-20020a170902a40700b001b53c8659fesm8333270plq.30.2023.11.21.13.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 13:20:01 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andy.chiu@sifive.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nam Cao <namcaov@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Fix SMP when shadow call stacks are enabled
Date: Tue, 21 Nov 2023 13:19:29 -0800
Message-ID: <20231121211958.3158576-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_132005_140027_A25BAAD4 
X-CRM114-Status: GOOD (  11.73  )
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

This fixes two bugs in SCS initialization for secondary CPUs. First,
the SCS was not initialized at all in the spinwait boot path. Second,
the code for the SBI HSM path attempted to initialize the SCS before
enabling the MMU. However, that involves dereferencing the thread
pointer, which requires the MMU to be enabled.

Fix both issues by setting up the SCS in the common secondary entry
path, after enabling the MMU.

Fixes: d1584d791a29 ("riscv: Implement Shadow Call Stack")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/head.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index b77397432403..76ace1e0b46f 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -154,7 +154,6 @@ secondary_start_sbi:
 	XIP_FIXUP_OFFSET a3
 	add a3, a3, a1
 	REG_L sp, (a3)
-	scs_load_current
 
 .Lsecondary_start_common:
 
@@ -165,6 +164,7 @@ secondary_start_sbi:
 	call relocate_enable_mmu
 #endif
 	call .Lsetup_trap_vector
+	scs_load_current
 	tail smp_callin
 #endif /* CONFIG_SMP */
 
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
