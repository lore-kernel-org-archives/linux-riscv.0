Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DE4CA5FFF
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 07:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7USMs749C3kxOboa8BPmdXj+C2hC6Cyf025PAh/BOZM=; b=H3Cm1z/o0a/K/8
	7Kt6F0TbokL2u333gm1M21QWBfk5OuWh63jyWXRQya8xVywvFdoZFRkCHFMhkSjZJMH0WvbAUxLBi
	JgR+HWQNUOn+EKtclVencTTBnj56nuIVE8tThqOx9a9sIGYuEGBpV7B4H1fTgE6U3iun314l2TL7D
	NmyUuxLQvd49YHW+OYMmVu6LHSALl9FTU4SxUnqhm68Aqu8R0bwAtpFE68/lZo4OscYyBPYmcKchd
	RepjEPgDsxHlfUlJNpt1xPNach1glSIA5L/LXhnxkz9UJhF77AAwiF39VzgbJClGLJqzfeGwjcSxW
	t6xhh5+JPfM3abECFozw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjt1-00000001VxF-0wUS;
	Mon, 19 Jan 2026 07:41:22 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjsx-00000001Vws-3XgA
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 07:41:18 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a12ebe4b74so38803345ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 18 Jan 2026 23:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768808475; x=1769413275; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p92Z2FtAmifPHY1z6+19+QrnmSgTIkXmdyXVKP6Vh/o=;
        b=BHF311piofQOocIjKmlt+hsyekz7AI/RsDsunJI2UgFQqrh78K+IHFi1zlaCpQFaMA
         F3IcI7+AysLNo6IweEiPq20mZFhXxFSWdOXXQMUsBz+l+LPboWMGhRE1rotA4BjYWq+O
         ZsssIcwcFL1497ZLu9eWbqhfuqxZeKtyrDrMjLjBa36S9D8PeCTlIfNPbktMhyjioFCY
         NiXtQhjz0oEqcV27mwjjQCdr3aOJHTTWG9n7IVDIjb+KhPg8mArNTBhTyDJaJ9G2KJwm
         ferSIxEWHo4TrfSUQKJhU7IO0n7ujLsCFiN8Uj2tqdPJ/Rctd9ZVdwUqUfObPBUUoaOv
         t09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768808475; x=1769413275;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p92Z2FtAmifPHY1z6+19+QrnmSgTIkXmdyXVKP6Vh/o=;
        b=l3iYWdz6L086WUleJK0MuPaF1JW//Vdx7ypT448vvjB/76jI7S0FqAfnjlFF7DzqxB
         020gH1vfKEwKFSUXLOkDP5WQJDRuUhvv1gACr6cyAKOgmdlBbCaT2m83uOvSQ8EC1r+X
         7v2Ca2CaaKfuN48XA3XvbsBg19MNQoW7avaEhL+VodgPULpblAeEKqZZ2IoSaenUFm+L
         SciC2UFnQ2TIYdprFg9khfkCng8K5rrUUF2HPrcoP27no6s/pNaXjPU98hgyd/tT9Cdp
         thCNkX0YaXoWD4LVQ/ftxHZMZjiw9QTQt+pL78YaC1YXBCVRWv0qUqMqQON6hMoJ1+IW
         fwyA==
X-Forwarded-Encrypted: i=1; AJvYcCWDfOY+BA65Wgr0V7RNiOqgTHbEzlcJXEToHIkyQCZW4fXvDHGuOgOa/7GgS6iObtP+yis3UKIOmUbWdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwskwqoPNxfpFhJxkC4z8RbvMWEu2zv7V885XWyd6WggXOwW9JC
	BzXroKDVJmNKQtKRrzH1/3+rHHki1bSbqRPVQ56TUMHzvqtOKpIlUezO
X-Gm-Gg: AZuq6aLSfJCIghnNeWkQJaRAOD3HU6tiJA83ALpOV+Pvri7IP7KGlVq8LEnLpTjrr+k
	49AJEQS4d+6axplgLwaghaNgSaNq2cg/xrXfFCvbyG87m1KCGcxLvAdkfs9OKWXArIk/MfQyZkm
	Y2Wj+QPoAVSQwcHbaPEBBotdrNAQFpRtMrjEskw/o9eWpJ3IfZEIKGhtNVGO+c/X/dFYgik9LuX
	EqW7XxA8NGGC21witDZ9fIIbi67BoQToodHJiHYns1wb2/Z7IrnEnuWBBHoMWH2QaAKohyYnJ3/
	MGAeN5B7MX4j73AFnC4RVlNlXB4WdJpEvUMQ/7lVWpLIx7h81GOuKrdVqVSHbz7uiAoljk7g5k7
	Yy9pWxEhmRtoh1Sewz1lRyB7bKo670XaxtifkJ/MZTR4vtv2qC+HLezSRbpMdcSP9KP9sL9/pwC
	ZarxM3u1BBZKDabSDDeokOhS1yGwI=
X-Received: by 2002:a17:903:1a2e:b0:2a0:de4f:c96 with SMTP id d9443c01a7336-2a7175423f0mr113997595ad.18.1768808474992;
        Sun, 18 Jan 2026 23:41:14 -0800 (PST)
Received: from adminpc-PowerEdge-R7525 ([27.122.242.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ac3bdsm86705535ad.18.2026.01.18.23.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 23:41:14 -0800 (PST)
Date: Mon, 19 Jan 2026 16:41:10 +0900
From: Austin Kim <austindh.kim@gmail.com>
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	austindh.kim@gmail.com
Subject: [PATCH] riscv: increase COMMAND_LINE_SIZE value to 2048
Message-ID: <aW3gFmOlA/Z4kmfJ@adminpc-PowerEdge-R7525>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_234117_089172_28C0B649 
X-CRM114-Status: GOOD (  10.66  )
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

From: Austin Kim <austin.kim@lge.com>

SoC people may send many parameters to configure the drivers via kernel 
command line. If COMMAND_LINE_SIZE is not enough, they may go through 
unexpected error.

To avoid the potential pain, we had better increase COMMAND_LINE_SIZE.

Signed-off-by: Austin Kim <austin.kim@lge.com>
---
 arch/riscv/include/uapi/asm/setup.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/uapi/asm/setup.h b/arch/riscv/include/uapi/asm/setup.h
index 66b13a522..eb4f0209c 100644
--- a/arch/riscv/include/uapi/asm/setup.h
+++ b/arch/riscv/include/uapi/asm/setup.h
@@ -3,6 +3,6 @@
 #ifndef _UAPI_ASM_RISCV_SETUP_H
 #define _UAPI_ASM_RISCV_SETUP_H
 
-#define COMMAND_LINE_SIZE	1024
+#define COMMAND_LINE_SIZE	2048
 
 #endif /* _UAPI_ASM_RISCV_SETUP_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
