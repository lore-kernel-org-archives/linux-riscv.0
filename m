Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A751C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Feb 2022 12:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xmx4stEWuV26jwOmn6KERmmk9N+5X6UxaRqStAS3XB8=; b=tjodFkfdgUPj+6
	Y4a0co5bbeBsTK6TrV+68UQD3qT3dMvn0AMJ5/R8Xs/bIRSw232k855Yl1SxfssMvJ+hEYcI1v6Rk
	mWdjJ380o9KCGaOqMCb45Y9S0NLFGL1LgZTKxUbIOjDfHI1s4/7gSNEdZciwAbfJ0fcyaP7NNH38q
	radBgL5JqTBngn7itg/Dahs7skJiMU7G1GtG4mZDpQQtT3M+U1p1O+15yoRNn09wDa5Rm9V4glbpV
	VXx2TbZ5/89zKBcY/PHYssv+D+u6nIw/1nU/R19oITQ0WQKJg1vP/jaNHfBwR6A19Zusq5FXC529s
	ZuJlIFgqUir6mAwKU0Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNZxA-004tdR-IL; Fri, 25 Feb 2022 12:44:08 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNZx6-004tbX-1P
 for linux-riscv@lists.infradead.org; Fri, 25 Feb 2022 12:44:06 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 403753F1DD
 for <linux-riscv@lists.infradead.org>; Fri, 25 Feb 2022 12:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645793041;
 bh=JOP3F1szvziyyHwwb25WbMBDR7/phOdbs80dtO/BlA0=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=LLJ6IWhpJ6nKNMqqShVRMVnNn4J9YumQp3stAbxcpEJ0RnmNXnk/rNVg6SGNanG27
 +QT7s39/jdtDzDVljmRtn6l+7ScI1VObQ6yN83+YGJhp/PIEtEz28vR8+6mBq5czzS
 6dOG8HjyvtgNLWP6Y5xDpw5Xjz/1jX4ZXeIzdCNiAn0GhlR0Qpcdc7atoMaIZDkrYk
 BOar5vJeuNq/sji1jI+ZTO4IzhHWMWHwYVsLzFwfk1zQb2o8iRHlpsh4UiXzyMXmFz
 uNr+L3gtxs1U9JmSkCC9Zbu+ln6OrmeCGGIXSYUKVjjrj3z0UIX3xYAhoXZzv2Lqr/
 6B/uD0n8PLXZQ==
Received: by mail-wm1-f71.google.com with SMTP id
 h206-20020a1c21d7000000b003552c13626cso1520314wmh.3
 for <linux-riscv@lists.infradead.org>; Fri, 25 Feb 2022 04:44:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JOP3F1szvziyyHwwb25WbMBDR7/phOdbs80dtO/BlA0=;
 b=BXMoLPKFj4wOOggBVw09R1i1WPbTbtLih9LngYR2BJHtWprwGgo8qKlPPesnsf+W09
 Y24D3J7EIq+vaECuUH9WHLvsrlojftvtzG/ZMT7MnxaTXqyAXozqtJZ8UQ9PHYRIXe9V
 GETFmixpTuULWazQuBEYD/D0ocEU2A0Ggz6yQujbBhZEKimv+P8YrvgTcKB9DE7JB1kv
 asHmU78x/c0YvcjkVvyQwkL1evApaSJL8KHbXbmgijEzV4aOZ99AD/6ejUuWN5iafNo/
 Z76PUQrFdr9qjCC3KQUstpIoD4j1lNvGgxtVvmPD8pU/H16pDaE9Wy1RatRDDweNWqGP
 VFxg==
X-Gm-Message-State: AOAM531KrYKgbW74qoG4EV6cepsKF6PY9GtGuXh4EQ06BGwtnNxTnT6D
 x+MUV+J2gJzs7Xft+QxQvDadvyAmq66ViK3c2B4sc0vgZn6JXMLNBt7YrVJrAHSBy26MDjy9bdw
 SoRRy1PEdD+NgM+RBcsaS3xcTmn3EDa6Qmz5eDDWVbKx6Xw==
X-Received: by 2002:a7b:ce84:0:b0:37c:52fe:a3ff with SMTP id
 q4-20020a7bce84000000b0037c52fea3ffmr2567629wmj.48.1645793040960; 
 Fri, 25 Feb 2022 04:44:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztvmWREbdipkwIP+Q6hL7beS4tVObs1D+0g7s/qnUUZuZ6sJgmbN9exqgPVTMCY5OVHLM1OQ==
X-Received: by 2002:a7b:ce84:0:b0:37c:52fe:a3ff with SMTP id
 q4-20020a7bce84000000b0037c52fea3ffmr2567618wmj.48.1645793040749; 
 Fri, 25 Feb 2022 04:44:00 -0800 (PST)
Received: from localhost.localdomain (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr.
 [90.112.158.1]) by smtp.gmail.com with ESMTPSA id
 f10-20020a05600c154a00b0037bbbc15ca7sm10658533wmg.36.2022.02.25.04.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 04:44:00 -0800 (PST)
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
Subject: [PATCH -fixes v3 4/6] riscv: Fix config KASAN && DEBUG_VIRTUAL
Date: Fri, 25 Feb 2022 13:39:51 +0100
Message-Id: <20220225123953.3251327-5-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220225123953.3251327-1-alexandre.ghiti@canonical.com>
References: <20220225123953.3251327-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_044404_232978_08527949 
X-CRM114-Status: UNSURE (   9.90  )
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
