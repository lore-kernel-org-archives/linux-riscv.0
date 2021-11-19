Return-Path: <SRS0=zkJ7=QG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B84C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:45:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2711061545
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2711061545
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=arfThZPD3U2Un0F8+2FjQGoOrEs0oZnZecZNKLLIHos=; b=Bgkzcx8CNlpRtB
	fZ07fP6YOYRQrHdihszfUVSQwCSpFOIG8HCl6HrJSyrksuDGTdg95dGPlrlxLZXmOKxlsNxGLsVFN
	n0QCVjjgJAOOmjo/UNtG2mf8xhPaIxC6RwpfKIeOFkRJCmUdkNzMs/uBtzpDTF3tIWuI0k1qYWYEb
	dif36lUcey499j0B+JL9cFJqG42k/SQbqVYiCtNoAFcgg/VWYxEml9OzbpNoB92Y48DMTuePepED0
	NBwgYxTMXL2KSkYm/Jb0z1X1vwwqo1C39H/pS03ENZc7hCA54Bsmtcvk6/N5RQB+ulBrR5alwbPwS
	ifHmeUsBve6tRdRMSqIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo70u-00B62G-6z; Fri, 19 Nov 2021 16:45:24 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo70Y-00B5lw-NP
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 16:45:04 +0000
Received: by mail-pf1-x42d.google.com with SMTP id o4so9801660pfp.13
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 08:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=UXSD7rOE9GyWI5KIaojYsAN8GSzjqnafFancHnsp3Vw=;
 b=DPKSJFjvcoZfaJOelec3G3kZmSYwaMUGh9fi3dqbvLJiX8uJJnZzTZjbKaUyxqPl33
 vVJu2ihYOPNOjN3cDeAeaAHWA17S2hWnx+tZzDVu+d8PpUrHcweM6pz8WMVXTWUwYXCQ
 V1/198MTgl5Fgj+5+2/7OXSI8Fo/mnoODWNEwyeLCM9Z83YtMPLIqj3410zGGV0jcInd
 wN0B5X8bcjsHdpev8ySD4Ze6iXzH6Fb9emzZZ/GOzuGeucBDvGlFmo0cscTbLvryZzf1
 iuJEjlthj/Q76AFZdH5oXxnqHRr0G/0Kx+f+Ig07idPD3x/2Ijo0DxF6zdEK9+iLg8ND
 xUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=UXSD7rOE9GyWI5KIaojYsAN8GSzjqnafFancHnsp3Vw=;
 b=HSEes8n5CSQzL2Fz+5ur3arjeVd1vr1AS3J81Gsd9DLBt9GKXRLLN/8JclLZ0vGupR
 u0Hbk3DBrKFkgVo6r3Kou9MEYBNlFSbcoO/ApKnmNrtR/p7RfOOkaR+TDPEfbyzytSe6
 RE9/jnKstwOr75en2FsVlh6CJGI14jYJGLQADSOm1BVXHcbXCMrDBjvOYah5xaT4+j+o
 C8wnFDrKqwv6j+ToOkdaUD7jThIRegQh+W8oOv/mS9FgclKds+zjfw5/sIEXLoFrp8MH
 FK7C9mkc1RON1AfGM+AVjfaDQjhPjUA2hshLDjpAQNgjYlHxsyV9RyEdRYzws78u89iT
 J8mA==
X-Gm-Message-State: AOAM530dbVjhlEsvbnXROYC09nUY2YVD2WEdG2kMw4cm3+88iH1g0U5L
 Xb8PGEpptj1wJjTBplxMX2wmLw==
X-Google-Smtp-Source: ABdhPJyYzXvFPPqLpWYpw4Z6xVh+J0emvMtNeK4RTlNqN3AghwAAr0n8BfpU1Il/ZaGsCMGkd5c7qQ==
X-Received: by 2002:aa7:98dd:0:b0:49f:bab8:3b67 with SMTP id
 e29-20020aa798dd000000b0049fbab83b67mr23219348pfm.86.1637340301522; 
 Fri, 19 Nov 2021 08:45:01 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id rm10sm195689pjb.29.2021.11.19.08.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:45:01 -0800 (PST)
Subject: [PATCH 08/12] RISC-V: defconfigs: Sort CONFIG_SURFACE_PLATFORMS
Date: Fri, 19 Nov 2021 08:44:09 -0800
Message-Id: <20211119164413.29052-9-palmer@rivosinc.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211119164413.29052-1-palmer@rivosinc.com>
References: <20211119164413.29052-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, anup.patel@wdc.com, heinrich.schuchardt@canonical.com,
 atish.patra@wdc.com, 
 bin.meng@windriver.com, sagar.kadam@sifive.com, damien.lemoal@wdc.com,
 axboe@kernel.dk, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_084502_815832_2D3133D8 
X-CRM114-Status: UNSURE (   9.94  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

This should have no functional change, it just sorts
CONFIG_SURFACE_PLATFORMS the same way savedefconfig does.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/configs/nommu_k210_defconfig        | 1 -
 arch/riscv/configs/nommu_k210_sdcard_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index b16a2a12c82a..89ab76349ea8 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -75,7 +75,6 @@ CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_USER=y
 # CONFIG_VIRTIO_MENU is not set
 # CONFIG_VHOST_MENU is not set
-# CONFIG_SURFACE_PLATFORMS is not set
 # CONFIG_FILE_LOCKING is not set
 # CONFIG_DNOTIFY is not set
 # CONFIG_INOTIFY_USER is not set
diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
index 61f887f65419..690460f79925 100644
--- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -72,7 +72,6 @@ CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_USER=y
 # CONFIG_VIRTIO_MENU is not set
 # CONFIG_VHOST_MENU is not set
-# CONFIG_SURFACE_PLATFORMS is not set
 CONFIG_EXT2_FS=y
 # CONFIG_FILE_LOCKING is not set
 # CONFIG_DNOTIFY is not set
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
