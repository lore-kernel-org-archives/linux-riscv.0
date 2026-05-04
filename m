Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3CCFF885A
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 06:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MhxMpc3aGkwayv/v+zJssCRU4NTEv3kUJ4M0VovpSi0=; b=lNoY0OgShpgmAQ
	lyhMqCvVdBxlFASVthjgG52r7V3NEd/13b8wpup0kRn8OyoTU14M1wG88lsZBmCYmsEWwiK3Wkkmo
	gt+BaP4VQbbvVz5JPoOChx7iaur7Kxo65TkpNizRlmOAsjINGxZvzRrg5a8eawQx5aEmRDO5zeo/M
	Ze4ciL4E7PSkIMlwNU03wcE36ByW5ZC9NCDgY2+vEj1qVMA87haibyZ93mTywSsnKDjlLhQsIWvGW
	K6oCeIhx7mvwCNrPhjLAUq7pJjPIMipPigORb+w5ye6HR7PkGWdz/YhldhWpOPMWMYU3/mbi12wBJ
	HSEOSuqdiguIRG/v0LVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJmQX-0000000CT2X-1ZAd;
	Mon, 04 May 2026 06:05:09 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJmQT-0000000CT1j-3rVr
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 06:05:07 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2c15849aa2cso4819983eec.0
        for <linux-riscv@lists.infradead.org>; Sun, 03 May 2026 23:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1777874705; x=1778479505; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1zmVfG2IQ8fhzC+19hTIfCnvMAmFzh0OmJHIQbemgdw=;
        b=cpU0wqIPxowLpK6/PaYyw2VT8MXWzhd3ny5JYrjZsriJnB/Kfc+V8ZuHiObFinnmiM
         XYlviMf0JfWoOgWyXXXUoI04iCGK06tBo1ZP7y03aTMAcfQw5Pmsre6ooNDLQZBEeAOI
         5TZOvzvLUXqVVJOw12dC/RdUOI4AXPgUdBtiU5Ebar6UDo85H5a+uEzCFa65W3IfGCi2
         AMpTnDG4elnlf1yECXlFZtWOGPeDhKZ6GY/qC29M5FsZwaGCYYCG2bcJgVaxN0v+qaKF
         h9AVEYDFYK/bT4FSx4ROSbjcplIGMy3pcxNDtMD+IvEVz5dWrFRsjLuaSv6u9pqBbV9k
         qQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777874705; x=1778479505;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zmVfG2IQ8fhzC+19hTIfCnvMAmFzh0OmJHIQbemgdw=;
        b=GziW/UuCEuziC7nUdYXdUCIc9MWEuXxEyKkBYzgQDdI6QwyPhMbTCkw9eYU7wQeQSE
         fIQKwQVbrAK2IwUFIFKIO6RJqHc0Esm3gdjP8B338+6s2UXaMfgjwZpjhXPmV42dnryc
         POHtuZ2lyPIVqJ+4iVD92gi+Pm90PAXiJAvkWoz1m4rwio8CGHhjewe0VzUKeak09jq0
         n1pJx4Ul9GA4OsXWkwQy4UgQjSw4BSmhiS/3xxW1u/rEp/Y+sD29/+sMCGLtyV/JdK3/
         vxeclNg4RQCF7DlwhqkFdOkzXY0ibd8VIUen5DeWbfTsi2mNwewtRj2oxqc5xASvU3H5
         N/IQ==
X-Gm-Message-State: AOJu0YytHWMDsh1J9qiNlKZnwBCIEyM5F5jbhx2hDQv05/re9iypDLbl
	Nz1uKx/eagXIj+4fkAQm7qO435iV8+mjk7MGnLqzGVtjhg2gAhmWwZKdD23WDBQ82t8=
X-Gm-Gg: AeBDieu6E80b6wMdMBlBk3i1BNiU0xbCDiSwWSGUuD99TvLOTpSopnisn57DzW4SFtv
	6e13dezpF7Mulr+O1TG6WThKJxOkfeYUjLnutJ542Vx1mX/0Bm7HzoX0G0DEFMtzUY/SfJ6hUcv
	P8naxjDrF/gpa8CHGpEefJnZqr12LquV/X0zRKHLI3kr2eR696xiM4xJQQVLqmHZ8CxUN3M/6pv
	dQCShowI15GlUBp05rq692UPXm4gL18XpPyGf2DkF1bYW/2CYO9mh3L+4jI9jyVkcJfO1mbrpB6
	gbG2Tq7OgExqiOzke8BpTzvtR+r7G/+w3o0eoVwdoG6bR0kTrDiXiLaw7D3tvEO2L+wfdNwodMH
	QFGwoYhY9cD1UkekAeLmLxAboyvtfVKINPbtHKw2ZXVHmyf6NA0qfdpET/tDvV4jSI24CnZllWB
	cju1AJOeMaXQPBHNqtVW45Y9P55r0Jv8xYngq2bV7WgZB3j43J7hRVYQ==
X-Received: by 2002:a05:7300:570b:b0:2ea:5057:a2f9 with SMTP id 5a478bee46e88-2efb9b8dea1mr3518098eec.16.1777874704516;
        Sun, 03 May 2026 23:05:04 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm17872381eec.0.2026.05.03.23.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 23:05:04 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Sun, 03 May 2026 23:05:02 -0700
Subject: [PATCH] irqchip/riscv-imsic: sync-up state before CPU offline
MIME-Version: 1.0
Message-Id: <20260503-imsic-v1-1-aa8330bd1c34@sifive.com>
X-B4-Tracking: v=1; b=H4sIAA43+GkC/yXM2wpAUBCF4VfRXNs1zuVV5MIeg1EO7UFK3t3G5
 Vf/WhcoO2GFMrjA8SEqy+wRhQHQ0Mw9G2m9IcY4xwwTI5MKmbZAirKcbJEi+HZ13Mn5/VT1b93
 tyLS9Y7jvB06AsShpAAAA
X-Change-ID: 20260503-imsic-d70c156cb740
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777874703; l=1308;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=1wr8R18V/LbF9lTOXmO69mFRRFEAOKuZ/GLakvvENPo=;
 b=qZoikSdhaw1KQSELCXgn/JlJwNbDt9VRJbUPs1QNENElrEQGT1lnePB/suojw0HFXs48FirOU
 9LkflcRHONHB+iAtJ85aSmU8bdTrrxFr/pL1EhL9i96LMlD7q7/pt12
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_230505_979131_5A17B6C0 
X-CRM114-Status: GOOD (  10.06  )
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

The "move_prev" pointer in struct imsic_vector on the new CPU is
cleared only after the old CPU has cleared "move_next". But when
migrating all the interrupts out from an offling CPU, since the CPU
is already marked as "offlined", the IMSIC driver skip to sync-up the
interrupt vector in __imsic_remote_sync(). The "move_pre" pointer of
these interrupts can only be cleared after the old CPU backs to online.
Therefore the affinity of an interrupt that are orignally target an
offlined CPU can't be changed.

This patch force to clear the "move_pre" pointers before the CPU goes
offline.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index ba903fa689bd..a7a1852b548c 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -158,6 +158,8 @@ static int imsic_dying_cpu(unsigned int cpu)
 	/* Cleanup IPIs */
 	imsic_ipi_dying_cpu();
 
+	imsic_local_sync_all(false);
+
 	/* Mark per-CPU IMSIC state as offline */
 	imsic_state_offline();
 

---
base-commit: 9b3a2be84803cf18c4b4d1efc695991f0daa153c
change-id: 20260503-imsic-d70c156cb740


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
