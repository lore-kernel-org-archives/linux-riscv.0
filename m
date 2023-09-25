Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DE5CE7A8C
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 15:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gX7l9W86N8raEL4Hx8r7myAXj7S86K9ZjB7OYJOKsNo=; b=tnCux4FsnRgsp9
	yVLrh0DhlX0h+LQLoShCU0WA1MoBgz4JQIS429S3L/s4E+y35g4fj9o5SyOia0UzQ/UHBSrsWKwvQ
	+p7f4ud9tC76ObOKgId+hW4as+UtxctLk8YpgTP8cIvMmML342Nx/meBxdjx7bqEKy+ehcc2Q+1hs
	7/kJk80KZ/LYrBaRKvZZb52h0siw1D1sNJfJNGu0ds1NmHUlZKRiAmeWyj/Ta0irf3A1vPt0lSEk8
	cb80xWuEtvVoGXKvw8bd/286cERzGckYZGHsZSwzKBeiKbGjGsXybfEPMggxudva+VSDLwI/Jdu9m
	xfmp5KrTtrwIT+lMniPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkngH-00EZal-0A;
	Mon, 25 Sep 2023 15:39:29 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkngE-00EZa1-1U
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 15:39:27 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40594697600so15376265e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 08:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695656363; x=1696261163; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zI4xebzYU4bFfFhG1gQnF1IxqTyPLKeseQ7Q+EIyte4=;
        b=jfgmX2QTYWd+DAE29lx/brjNh6NGd6BxGdAGWvRaW4yTJZWDtC/C0/YANl+mDckI0i
         Za+lwAYiANYyM3oGXvnEXGS7a/AAGoe5Wc+b/9rLSXSxHXZTNxQKjsPUfMAQ0TLzgEiz
         EmCb2GGGotvZj84f/BTZFpCTcx00DcJCRWWbF94Uus/7LebUPjImO7q/78h88awI46gf
         usC/dFCT8zikzCsDO9gCyp9jAd0WjXzrjU4IYAOB0X9goIJbFjkOKtcyT0RxFXII0AtW
         CglxoYaprnMVvUTm1zgq1INjgeF2WXVjsrQqC9g6mADE63c9LPT1NIcMgt6PvFTF3u3K
         hMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695656363; x=1696261163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zI4xebzYU4bFfFhG1gQnF1IxqTyPLKeseQ7Q+EIyte4=;
        b=gCBHHrtldy45qORePE4guow/uv/O4LoCIKOQygidLMNLFM3eddRCeeBolZTQjlZTAg
         VWrrR6Vy41ly19dDkpjq97o3m+i+sR9pE/xOTq0SC0nNUPH+bddbcGnMEFx/suRhEwOk
         SjGvFYnqAqwZT7g/0Mw4rsNT6Y7Zuzk64B6JTXlwt/eI89YQ+iumlgnmDooWtrmafmS1
         wlHmOfhi/7idpdqvV6xLZVD1NAQEw/iYWHHYJ8fzvIFwxt9jsIhENy6ULUTOdZmaBpwm
         Q+S3h5Tf+7TBSpT5wtfyj2y2VFtQhKocFAd4LpFumLaHoUlAyT/xnbt+xKwX7RiBfAlQ
         jcgA==
X-Gm-Message-State: AOJu0Yy81jGwViKAnAPCZDb1A5HA/86Bygq5AeeNBfLfqkCaaGSUrpjc
	JjJC3Uum3FgcibRrNBjr4ec=
X-Google-Smtp-Source: AGHT+IGmio0BsSiBXssQTj+z2/Vno0WeDNG8BAx+qL9K6D9LmNv/sH4hqT8UGCO6XH4OPejS3+i0tg==
X-Received: by 2002:a7b:c34c:0:b0:401:d803:6243 with SMTP id l12-20020a7bc34c000000b00401d8036243mr5996648wmj.32.1695656362475;
        Mon, 25 Sep 2023 08:39:22 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:47ed:1dba:e442:ccf2])
        by smtp.gmail.com with ESMTPSA id e15-20020a05600c218f00b00402ff8d6086sm12552582wme.18.2023.09.25.08.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 08:39:22 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] riscv: errata: andes: Makefile: Fix randconfig build issue
Date: Mon, 25 Sep 2023 16:38:44 +0100
Message-Id: <20230925153844.26820-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_083926_499573_F527D4F8 
X-CRM114-Status: UNSURE (   8.08  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Compile the andes errata with cflags set to " -mcmodel=medany"
when CONFIG_RISCV_ALTERNATIVE_EARLY is enabled.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202309111311.8tcq3KVc-lkp@intel.com/
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/riscv/errata/andes/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/errata/andes/Makefile b/arch/riscv/errata/andes/Makefile
index 2d644e19caef..6278c389b801 100644
--- a/arch/riscv/errata/andes/Makefile
+++ b/arch/riscv/errata/andes/Makefile
@@ -1 +1,5 @@
+ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
+CFLAGS_errata.o := -mcmodel=medany
+endif
+
 obj-y += errata.o
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
