Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF53C71136
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 13:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H1lHWt1tZnMUmiQoc6UpBKFH/NNylZmo3bhfOOelPRc=; b=Qj8F71Wy9nPalD
	tFE8rvAX0dHahiI+o5mzDUp5wElWFiHmmK/wCEy/ViFqBV92mdOprbteUQXVMlV5WoUt7XtH4ws+W
	qZx3861ViRfLei1BaCk8EBLc3APCIGMxSqx9BnbordeDCS06PnviPkLi+0pVj9I0d6gWxpZp8/r/8
	+GKRoaTyudPFw+KKSI6hINh4Ik8+PLfgpP87/Q7+lIFxgM5JBdMYYOaDY1+cZLYZgfWCfhQ+5PyIg
	syAW1dk+SB5+dZOmV9eTOBZ1r0w6nDr8ko1QUPDgBs9qMnp+RpCxo0Xbq6ggyhe7rGGpw/vMU69y0
	h/IHHbhaBhU/CkR+sIjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWIo-00000007LAG-0FF4;
	Tue, 17 Jun 2025 13:24:38 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVzw-00000007HSf-2iEH
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 13:05:09 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-553b544e7b4so4414158e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 06:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165507; x=1750770307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hQ7rt4e14DyPGgHQFy3EQy+5G7wFsrLkDEYIps9brIY=;
        b=ePI1OICePEwkVZC+CXYrSxROyk3iRmxQ9aVwZ/wo/7IybS98lDtqTQpEmxzvVpM5Cw
         eYt7eYgpmIJkvLwn03zzB0W0cK/JJ+Ravc08RbFVm+U0FmpZ/QhBXsAf0GWAhyN65vX9
         ANhv3zNw6dIUOaLnSjbl7QRKCW1v0NFNdhY+GAbr60fSnVDX7hVVnYt1w4mjiZ2inCAY
         lU23u8X58EReRmDLoAGv6eAiTNHWdXLILn4qlZ9CnoVAvh58HExZnbeK1kiWMZtznvhg
         HR9yoayz3rTAPUZSvI1SZGnc3Pm4Q5gv217zKJ7+QzTkhxXktJBtOmSRtUYbUssSBwZU
         Ck/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165507; x=1750770307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQ7rt4e14DyPGgHQFy3EQy+5G7wFsrLkDEYIps9brIY=;
        b=NlpbaBL++VY9SrbBEx8UbfZNE0FHMq0scsWtNkhUBeF8VnsI0EG04u78ySWEFDWmmh
         QKujUJAyHGQ87cesRfhouXIls0ZTuQEfGKyHqqGP50qM1SBwm29+3YoaJw4qMdqbSoRS
         Ct73qMS3DAGuoZflTyw47J0mf7SAos+GY0b58HTDCHrHf0TZzicO8ll0IvnmBygSCXAi
         rs99Y2nNIgmWkv5di705Jg/UVIb6emZWuG5VnFDSMlVf2Q8OsnEBJ8LkeCam7QFIqH9Q
         ULOuMUFscXm72aVfodpgHlRDbuIN8427hdYP8oFnfOs1oPjwDekx+LRxWeNdo9K5vO40
         EZ0Q==
X-Gm-Message-State: AOJu0Yyj8Xf963E9Wsk0hYLB5JS/CZMbtOeK02nmIH2bgeQAL7CYa5FX
	43T/Y/5RG3suiM4xWzQDJmnD3pomb06ZTAvlfz+GzQyvzXg+ByIR69TS
X-Gm-Gg: ASbGncs3im4scuJ+1mZCR1lbwzC7IcM50bo0IU/bA7rMIKholHYN3HO+JmC9era4UxE
	QkYfxkpWIoTwNQPTPFyEFWRCUsjDmIH11Tq3BtipFvQF7NGAM1UomqlQexy8vSaClL6my87m5fK
	7GYhVOhIDp8SMv4RRFXTJxJsRc2nvMfW9yVPB/IPWPss0GNEtj81MPzVUR4irOZYYjZeu4y85/s
	8Q6Lf/Ht7mIQzEpyBr1bDFP6rjj/ydgJ1+jRMKmO4+FOfBtljrJMyVPSNGC14wu2BeyohgPVB1N
	RZPI3bzjRhHr6opNeHpqLk6cfV7+8+mpzzMevd8bBXP8gacK4EklxWZfH2JyGWV1WpmBjBRAGOH
	gTV/hpFXGOTtFxHON6w==
X-Google-Smtp-Source: AGHT+IHHo3gWM8jne4M/ik8SRuW9s/CXCSDuf5VVjjbmz065W7Ty2nNpgRR2fJksE2eb2m1Q59uOcg==
X-Received: by 2002:a05:6512:15a2:b0:553:2ef3:f73d with SMTP id 2adb3069b0e04-553b6e8851amr3027873e87.14.1750165506269;
        Tue, 17 Jun 2025 06:05:06 -0700 (PDT)
Received: from localhost.localdomain (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1f91ddsm1900394e87.250.2025.06.17.06.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:05:05 -0700 (PDT)
From: Klara Modin <klarasmodin@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	conor.dooley@microchip.com,
	valentina.fernandezalanis@microchip.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Klara Modin <klarasmodin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] riscv: export boot_cpu_hartid
Date: Tue, 17 Jun 2025 14:58:47 +0200
Message-ID: <20250617125847.23829-1-klarasmodin@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_060508_680991_9AC89964 
X-CRM114-Status: UNSURE (   8.39  )
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

The mailbox controller driver for the Microchip Inter-processor
Communication can be built as a module. It uses cpuid_to_hartid_map and
commit 4783ce32b080 ("riscv: export __cpuid_to_hartid_map") enables that
to work for SMP. However, cpuid_to_hartid_map uses boot_cpu_hartid on
non-SMP kernels and this driver can be useful in such configurations[1].

Export boot_cpu_hartid so the driver can be built as a module on non-SMP
kernels as well.

Link: https://lore.kernel.org/lkml/20250617-confess-reimburse-876101e099cb@spud/ [1]
Cc: stable@vger.kernel.org
Fixes: e4b1d67e7141 ("mailbox: add Microchip IPC support")
Signed-off-by: Klara Modin <klarasmodin@gmail.com>
---
 arch/riscv/kernel/setup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index f7c9a1caa83e..14888e5ea19a 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -50,6 +50,7 @@ atomic_t hart_lottery __section(".sdata")
 #endif
 ;
 unsigned long boot_cpu_hartid;
+EXPORT_SYMBOL_GPL(boot_cpu_hartid);
 
 /*
  * Place kernel memory regions on the resource tree so that
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
