Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2E3C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Feb 2022 13:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xmx4stEWuV26jwOmn6KERmmk9N+5X6UxaRqStAS3XB8=; b=mbP5JQxVTasw9v
	pdP+pyLlESBglSILzXFksuZe7KYRizm4FNIZ8wBA5w8RaEstjhlXhn4YPs73JRWmE7A8hu3Uhn87Y
	qjiDGuHZe9FjdGxwr6p/kspQ3mI6fIbVLZGFFP0sWWCHOgoUsC1tpa2oRbIbm7tvkitVFQM3qIIE+
	CW9s3AkiM8nifyig62+WuIl8OOVwbvMUrx0mMUrExqeZojLB/D95oEqEDGZgpjxXD5sqAxYWffsHg
	y/z0HHcVzFlxTUHjD5Liz7vPnbBB3udkkC6MRBJySom/ewdRVbnaKWAtkqjEF1RLHgc5yqFjSXfUB
	idSinybsfdCUWOrWDeug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3ap-00Eh7V-3l; Fri, 18 Feb 2022 13:46:39 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL3UB-00EeLo-H9
 for linux-riscv@lists.infradead.org; Fri, 18 Feb 2022 13:39:50 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 51AFD4025B
 for <linux-riscv@lists.infradead.org>; Fri, 18 Feb 2022 13:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645191586;
 bh=JOP3F1szvziyyHwwb25WbMBDR7/phOdbs80dtO/BlA0=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=HkBgePu1z6Xb6T7ZU/TwY2W3OP3b9XR8R+DhdYzwQQ3HDjpcZXhjzTtPfF2uNXv5T
 W4hBSf+BKGreno7qJ7238UZHBPoOI2rpDdEIpP7VPkqSxTuoVfFwxcLo6yXbVAZm8V
 3aGS5mK/0m3Rw5vyYOZRODSct5rAuiFRAi4NYISg3a42CI2x8FetaM5eYphowgTnp0
 rzZAYHOTDDbIOp4EQud6hLTDA2ecjVyTk5Xz9b/ufUzPfyu3tOsEZ+z9LjMbHKSwA6
 ngWt5hbEcCKqpBCRABhH++cHiNbx/LbXIatzsS3x6VBpnA+YMMUMtVpHCt9Ds8sAgT
 9Lj7WY3HPu9wA==
Received: by mail-wm1-f72.google.com with SMTP id
 v130-20020a1cac88000000b0037e3d70e7e1so3181927wme.1
 for <linux-riscv@lists.infradead.org>; Fri, 18 Feb 2022 05:39:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JOP3F1szvziyyHwwb25WbMBDR7/phOdbs80dtO/BlA0=;
 b=TN4H2UgmlA1Pdjz8ZTO/wmcegJfTE9gkJq3n8L4jrwoSJ4Lcc/odK8QGOBJnSFhDoQ
 S9GWlEZ5TEsUCFBpvcTxqY8lIzx2rjXCGGj3yCMUKMmbnz0Xwe7OBgH9LklQHbUfZTt7
 8zT0nNfsePL0/uoCIY+3GylNYxU2klI7EMcM/vmvsiG9DXOVdTmQVL60Tajg9f7LqKpo
 DUA1b4gH3epfyMni4rdDWmz5y3jUhpsd6MP0FehV/Pptz//xNi09eQa3w0hBv9xK0Rsz
 Q+uyFUStM+fLXGH0oTKUd4AlRsn3WFlhSSVZOUXZrRcG1PMVzze5+eoybOx5DhLumHQP
 Q23g==
X-Gm-Message-State: AOAM530zTYnjdJc33uorZCZy12Dksoft+F+ipXuJP3OzDxg/GzICGXn+
 0oUBf2ycHER63MJWi/N4H/ySll14KLfHLofGDAYDPIRSSMpWUJwm7q3cwxi3vGtN4WjQ16hW5fz
 0YOE2g7+1x0wOcUzcuiL7IaJIvgvYHSoJiijlMhlAKV6dbA==
X-Received: by 2002:adf:e5d0:0:b0:1da:4dfb:497e with SMTP id
 a16-20020adfe5d0000000b001da4dfb497emr6489396wrn.282.1645191585234; 
 Fri, 18 Feb 2022 05:39:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwa9rnt86pwmOEJdbUgC/kacrYzPY5oQ4mpvy+Mq/o4FjRWXCIzn6psjVvt7DCwVdslstNNkQ==
X-Received: by 2002:adf:e5d0:0:b0:1da:4dfb:497e with SMTP id
 a16-20020adfe5d0000000b001da4dfb497emr6489383wrn.282.1645191585101; 
 Fri, 18 Feb 2022 05:39:45 -0800 (PST)
Received: from localhost.localdomain (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr.
 [90.112.158.1])
 by smtp.gmail.com with ESMTPSA id x11sm4183619wmi.37.2022.02.18.05.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 05:39:44 -0800 (PST)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Aleksandr Nogikh <nogikh@google.com>, Nick Hu <nickhu@andestech.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
Subject: [PATCH -fixes 4/4] riscv: Fix config KASAN && DEBUG_VIRTUAL
Date: Fri, 18 Feb 2022 14:35:13 +0100
Message-Id: <20220218133513.1762929-5-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220218133513.1762929-1-alexandre.ghiti@canonical.com>
References: <20220218133513.1762929-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_053947_738273_30B4CF25 
X-CRM114-Status: UNSURE (   9.84  )
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

__virt_to_phys function is called very early in the boot process (ie
kasan_early_init) so it should not be instrumented by KASAN otherwise it
bugs.

Fix this by declaring phys_addr.c as non-kasan instrumentable.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/mm/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 7ebaef10ea1b..ac7a25298a04 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -24,6 +24,9 @@ obj-$(CONFIG_KASAN)   += kasan_init.o
 ifdef CONFIG_KASAN
 KASAN_SANITIZE_kasan_init.o := n
 KASAN_SANITIZE_init.o := n
+ifdef CONFIG_DEBUG_VIRTUAL
+KASAN_SANITIZE_physaddr.o := n
+endif
 endif
 
 obj-$(CONFIG_DEBUG_VIRTUAL) += physaddr.o
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
