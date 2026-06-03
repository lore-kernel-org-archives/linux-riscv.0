Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E6BCD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 18:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bAe6XB/9JaenFhaZCcv6sNlizn1HfOqCayHT8TUJSj4=; b=hkAcP6QOPTrUBs
	68T0h+CgWoUxMhQilVKDpgAJ1AppCaZMXqN27+1TXHlvYLZADUzcmyYNg8Zu88tFA2oKatNa0uAdK
	P43qBpx1yPsYf3IcuiEBR8j5KdTdMKncahL25MTW+o+w003lnr1l46arKVuG2NAvhUs0TNSKQePv3
	tw2c+tJw+ewp475zyk6pK9Yli8hTOApUCFx7j1y8+KMJQiZVCdsswiTC86ztdsWSBF6q/xdDuWToM
	2pEJ/k2AJEqR1KHzuiNRe1AxtUxnqk+o3bwdsGHM/oPHpHu5xnZ0aUQxQISHPmwJtt+Soq6p1/WWn
	eKJu/ybXaOfpGsf6cD5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUqPw-0000000FgYo-0Noo;
	Wed, 03 Jun 2026 18:34:16 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUqPs-0000000FgY5-3hOo
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 18:34:15 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-66077c46c5cso4139520d50.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 11:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1780511651; x=1781116451; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gx6XM9HRKPU2EXZQ0+5hp3R7qZZ9FfG80iwNjQy+npM=;
        b=FG9tXwbYcP1noTCcnAWJgXIEeAZ7VrCeeYLiYE9YA24O+tTS8Xe6nVuEUty/pxqxc/
         pBbxR8STRJFCiw6NhvvXj754cuB3DqlZ0bCVdgwG3T+p/1SvENzZM6GW4RpjinWs58kL
         eryn3IFHE/ziMMw0N7/MkQA3oI25z5sTM0HffLtzZgWtaqsQsCt3SMUv0NFzOaun7xhE
         ZxTJMQ7sB97IlGEBVQKhX408HBm3xbzuj3+IEErcudWpYTcab6ldFPvKorMGn5surWY2
         bmd3VIHEd8qo37Cme8C7aGFlb+tqEz3kqfsjDCK3fsFzfMZQX9ZZR/uX8L+vEZcTJ2YX
         H0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780511651; x=1781116451;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gx6XM9HRKPU2EXZQ0+5hp3R7qZZ9FfG80iwNjQy+npM=;
        b=APDGkMDoIlFjHbotZRUgBc6xVP7K9RGidRtqkKux8jNq/3SlQaooC0wytYQlbGXA6D
         2lXtH6i7rzrB8ny0uBjgoQARic9tSjzTIPkgavGhyGLLJQdOX1EI/0xA2VrILAYJh4l4
         9fpfZgqeoB92x+LJDAmtMWwbtftOOSUGIceLuQdpWAODrwe6RH++yBeNbyTCCuVeHrXJ
         8U9d4bryrV/BGXH+Pvhpzca4YIpcNiGkKw1i8qRvjm5mcH6SK0sElDjBW00dFKX8RVtk
         E2gusCfamb5arDosA7DQCgQ5rSlZItNiTTy3cYDs9bDSobQFkJ7Z2KHy86prlwu59dCB
         j84w==
X-Gm-Message-State: AOJu0YzA5yZ1y6+eL7iayV4EQLljtJFdFjYrd5klutgFwdIp7pa1H/3J
	4NixNCprssoNwWpjyJu/f8fWWkD1s35j84ioCffkPv+qb+9SR2OaTfhVMTxPZKXLzJRld1TGGyM
	cjLIO
X-Gm-Gg: Acq92OG8TubeJ4abLxg0CXdj3Q5j3yhIKpWEUBFeHRuM/vl/OMkQkoRcR5uWLDFXCH4
	5qLNvsXJIljQxdUazYpQpFlkfTnL/anP5Vj9mdrZZREcIKrRj5unRamMEI2lNxEZvMhbu3M90kG
	18CGU9V1ZkiRvOBKbaSdzLNtL+6lfqEbpTyul+UT+XZXDobYBagmjGdfKeNyJAh38n/b8AlRIzi
	4Rg09PVUs8ajRziiAI4A6P633Y8zG6N5w5MybtSAzTHdP9D6VX+xOp0BORMa7ud59wyiRLRr/cf
	KjnxyRCoQhP4IGlCRI07RSm9yi92rd0ZcW551B/lWllZdfGtLXBEaW4aoiLKGQgwj9zRl6PS+j8
	EhFXPV7PAvi6aMjJOmDBtWoOx3dy//ZHDHF227jR/nYu5eihBVtZ7YePaxqBfJc/gveDVIXlClH
	xvmlfzR68GG9vJTO+jmxUb33WdsaLAH4SqHgoB2nhke6wFWdHBDvL/kVQTfEknoB0rKXOiaJFaz
	/LU0MawYGU=
X-Received: by 2002:a05:690e:134e:b0:660:41fb:672a with SMTP id 956f58d0204a3-660db8889a8mr4432033d50.0.1780511651279;
        Wed, 03 Jun 2026 11:34:11 -0700 (PDT)
Received: from [10.200.56.73] ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-660d64409e9sm2370446d50.15.2026.06.03.11.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 11:34:10 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Wed, 03 Jun 2026 13:33:48 -0500
Subject: [PATCH] riscv: defconfig: Enable Eswin SoCs
MIME-Version: 1.0
Message-Id: <20260603-eswin_defconfig-v1-1-8471691d3153@oss.tenstorrent.com>
X-B4-Tracking: v=1; b=H4sIAItzIGoC/yXMQQqDMBBG4avIrA2Miin0KkUkxj92uoiS0bYg3
 r3RLr/FezspkkDpXuyU8BaVOWZUZUH+6eIEI2M21VxbttwY6EdiPyL4OQaZTOMwtFy5wDdLuVo
 Sgnyv46P7W7fhBb+eGzqOHyrgcg5zAAAA
X-Change-ID: 20260603-eswin_defconfig-3aeb501af076
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_113413_283366_3A81D191 
X-CRM114-Status: UNSURE (   6.71  )
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

Enable support for Eswin SoCs in the default configuration, so that
defconfig kernel/DTs are bootable on Hifive Premier P550 Board.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index c2c37327b9877..74ba5acc12a40 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -24,6 +24,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_ANDES=y
 CONFIG_ARCH_ANLOGIC=y
+CONFIG_ARCH_ESWIN=y
 CONFIG_ARCH_MICROCHIP=y
 CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_SOPHGO=y

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260603-eswin_defconfig-3aeb501af076

Best regards,
--  
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
