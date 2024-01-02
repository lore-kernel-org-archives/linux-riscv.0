Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F3CC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 13:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HCkp1HiJQTO3uvnsfdUYn8AtpjvlBjqqLEVtTWinZjY=; b=ntH6xJ9cvoj1+x
	24TOKyhUnKacSCsafRnGLDp0ADl4j6v3ZK9yNamFmXwm7gFzSK6gvk1bgMmGohbZi2Mtr6yoFjxxZ
	m3eGYRcFgSfmKrBQl2ykPm1m41XC2207eI5kiL4kLQ6UmJ1dWm/wM/whz8FemSS29OQryIbWQBE5R
	QJAnAUKuYee8DG2M3KNb/np699aQXeprcm3cPo3vb+i1DBmXQxTkQ8LYXz0ged+dT4HAhW6NEeT65
	rrreAJvGgFBGIBPeUoCODboAqal+b/tOCJ2LN/LxtJRnS901Zr4LYzAxo/Bimp98tp6YwUbcIWpwp
	hfe0m9xXn0xzKJUGV2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKewf-0087fk-0W;
	Tue, 02 Jan 2024 13:36:37 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKewb-0087dw-11
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 13:36:35 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-68083a0889dso31453536d6.2
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 05:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=torrio.net; s=google; t=1704202590; x=1704807390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CyNzc0weciOlOUF6OmadmzzxbxFI+CreXUXIxsYm/ss=;
        b=eAIuWdG5LIuHtp7i6uXa/gm8BLvKwXXyvc8yl80fobb1Jr5OYFmpjpp2LOxutt9ep3
         lkTV8M9RAoG7DfbpqIPddArkPtZ8525YxiTZTZXWfHOwQanfquq0PULkt9yCfJ4fXv+o
         JZo8a9S6gjHPmzfosetFlp//lWt83+Y0VCfhE3b9p6i3YsJdHD63RfU1Q1UlCjxiP+GT
         c4tteVJKl6vGNyU9jdflh7opMCtVpUo309lYgGhbl5NdCWfYVjv4ds7qg7QVm05jnymM
         MHgoLQT/8Ey0W9rLea8zM/ymQJOlp4q7QR4l38WaOXbsCkFoI7UuCuNeAK+7jXwnnxFm
         zF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704202590; x=1704807390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CyNzc0weciOlOUF6OmadmzzxbxFI+CreXUXIxsYm/ss=;
        b=TJAV0TRK3Lw+O88O2y50PugG8bTixk/r/hjfZ+GxHbUmfCdrfh4F8DXJWNQBZ8TT5o
         fLbzz24l5gjz6lKxOLZfn9kOZ98ihB1yRIJcHyDg1nyY59FksHMhFad5+1X0eNOtHjcT
         eCs9+w9mB6doLGcM+n6BmE2VxDL/6EPiQK+70LxZVSl7WRgaRibM2ne8FbhefhfqvcNA
         fWgBf44CYrKCAWsd9o1yKr3FgJHqoEJOz5yy8YJkJQCOf4EDslxQBTk57hcecIdffwBV
         rY+Y1ojD/Yqhx0tMvi9uo85cqoYgko6YwzOBgN881hhmqTz70mhypgcSl42yk7eEsNrM
         fuuQ==
X-Gm-Message-State: AOJu0YyeGj9RZDOAjEbO6FAEX7GIZRAU7HKXuPXjoyLfN+3re7XUZBBk
	XFmtrfYqtyOxMbjnoPS1N5Fg582sfG3lJ+Xujn/LoRqmLSVukv0=
X-Google-Smtp-Source: AGHT+IFoHgwpdmFekYtfS7dIkMiODBjlLA4T/3Ie50ncav4oqzJ7hrAQXAfwOb8UUt3oYCvxs4HfTA==
X-Received: by 2002:a05:6214:62a:b0:67f:5784:bf24 with SMTP id a10-20020a056214062a00b0067f5784bf24mr25607780qvx.48.1704202590386;
        Tue, 02 Jan 2024 05:36:30 -0800 (PST)
Received: from torrioPC. (c-73-238-229-134.hsd1.ma.comcast.net. [73.238.229.134])
        by smtp.gmail.com with ESMTPSA id l8-20020ad44088000000b0067f49c64c14sm10006268qvp.142.2024.01.02.05.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 05:36:29 -0800 (PST)
From: victor@torrio.net
To: linux-riscv@lists.infradead.org
Cc: Victor Isaev <isv@google.com>,
	Ivan Komarov <ivan.komarov@dfyz.info>
Subject: [PATCH] [PATCH] Update the size of auxv to respect the new constant added in e92f469b0771e6db9688a58c0e34a8342da6a6bc
Date: Tue,  2 Jan 2024 08:36:17 -0500
Message-Id: <20240102133617.3649-1-victor@torrio.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_053633_654553_0034429D 
X-CRM114-Status: GOOD (  10.88  )
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

From: Victor Isaev <isv@google.com>

Commit e92f469b0771 ("riscv: signal: Report signal frame size to
userspace via auxv") has added a new constant AT_MINSIGSTKSZ but
failed to increment the size of auxv, keeping AT_VECTOR_SIZE_ARCH
at 9.
This fix correctly increments AT_VECTOR_SIZE_ARCH to 10, following
the approach in the commit 94b07c1f8c39 ("arm64: signal: Report
signal frame size to userspace via auxv")

Reported-by: Ivan Komarov <ivan.komarov@dfyz.info>
Closes: https://lore.kernel.org/linux-riscv/CY3Z02NYV1C4.11BLB9PLVW9G1@fedora/
Fixes: e92f469b0771 ("riscv: signal: Report signal frame size to userspace via auxv")
Signed-off-by: Victor Isaev <isv@google.com>

---
 arch/riscv/include/uapi/asm/auxvec.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/uapi/asm/auxvec.h
index 10aaa83db89e..95050ebe9ad0 100644
--- a/arch/riscv/include/uapi/asm/auxvec.h
+++ b/arch/riscv/include/uapi/asm/auxvec.h
@@ -34,7 +34,7 @@
 #define AT_L3_CACHEGEOMETRY	47
 
 /* entries in ARCH_DLINFO */
-#define AT_VECTOR_SIZE_ARCH	9
+#define AT_VECTOR_SIZE_ARCH	10
 #define AT_MINSIGSTKSZ		51
 
 #endif /* _UAPI_ASM_RISCV_AUXVEC_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
