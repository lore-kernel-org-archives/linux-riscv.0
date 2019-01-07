Return-Path: <SRS0=5Ln/=PP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEE2C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 16:11:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F0A32087F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 16:11:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hvjga2WL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="C2NFECgv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F0A32087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Q1og1eJmqkgryQSbeuDgn9XEXZrv/QVjL4eeDb8xyV8=; b=Hvjga2WL3geaXZSvWEIhEak1JX
	kYQ54ae5zxab1+TQcHNDyKllAEF+WPDlbaphASYdo0vXaCP8NuI7xKf6botbCMigeIslHYGZV35VI
	rF027veoukhORHEl0cecwguOI7XNB38D0o2c9MREPTQ65vevwDomPUkkuBo3mdgdTsT5jPK8hIPBe
	9fcIX7BaHRAYOvHredL5ex2k94i5uxf3TJT54LWqitdEEJXiCoP52YpzjMPIGXxe/So7AfbNMayMD
	RSfUfyIG0FRqI2tvNKJGaBAq1F+H/tbVEZleQFPrbT2Yqr0pE3euVJ+c3/Murrgr2HL6MSwRFXRhY
	DriFaiyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggXUo-00059c-5G; Mon, 07 Jan 2019 16:11:22 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggXUl-00057M-2a
 for linux-riscv@lists.infradead.org; Mon, 07 Jan 2019 16:11:20 +0000
Received: by mail-pl1-x643.google.com with SMTP id e11so343547plt.11
 for <linux-riscv@lists.infradead.org>; Mon, 07 Jan 2019 08:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=V8xgFTF0trh6SGkurGKzpWNhAcRz6eK6HX/JkCyedrQ=;
 b=C2NFECgvWtYo2Ag+3cL5Wmnikf66jtfVuNcqQHM3c5GN2Yy0fqZqMDp8v0an/H9uhh
 Pqm0J1k5WdvFs/d5UfppZjGE7g2ePu2sDg3nj6CEIGoP+Bm590MPcq602qu0bqGvSa5F
 /xT6sxCDQvIGKfSqYmXjs97AyLOdaP9VLsImipt4FHIAnDshZFOhAZv4YndfJtDiHAqQ
 qNxOSHdNNUitjC3zwXw8crz67+jh9GLs1f0I8d5MCdxAB4sm9Iay2jX10iW2NW2JHbNT
 GweghlwVn1HEqMH64x1gwVJdSQzYL9+aDqFC08HvFb6nituWnjaiW4U1T+utnM/5xXZR
 vFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=V8xgFTF0trh6SGkurGKzpWNhAcRz6eK6HX/JkCyedrQ=;
 b=HJnPkTKPFHGr+9R8+6879TkifpWgH8dTwSsHe/N9tpMxioFxFLJ5PGfdk6l0QyKnx7
 P3KWHON108/clLp3xVIXwzhi6Ioc+gtxSX3oprlFpHQa0uAqfI+c6dbe3XcEIqVXi3bl
 5sAD1qJUadtr7XTUT+/kGu7YR+z2dymuucdfwdiTkrRZMzbfwUnmF8SbaMrn0yQAMPJ2
 UnwK4k2kDd4jBJFj3ad94+hdcOvStF75hBvL9ApEW6Nfpvod62WaR5ZPQH/TfGFhLDO/
 IThUGHvNp6e0f/warOOM221wYBQ1r8B+HoZEvlsKiVOdpbB8fQjSlMWQ2HHMkMXRApoo
 RZ+g==
X-Gm-Message-State: AJcUukd8EL2obmNzroEtY1U2euhdik5h5aBWBCf9VocYqzsAD5UijBZA
 iN1ENfVLyQrhcPqJzPalxV4e4wqfUAM=
X-Google-Smtp-Source: ALg8bN6NOdOb4IsHwjeBH1UbimT0TibP73NfLcbOyU6fCVQavsFWayomdqq5olLc6MzG2fwwgelkmw==
X-Received: by 2002:a17:902:9006:: with SMTP id
 a6mr61033475plp.334.1546877478097; 
 Mon, 07 Jan 2019 08:11:18 -0800 (PST)
Received: from localhost.localdomain ([49.207.48.214])
 by smtp.gmail.com with ESMTPSA id a10sm93243512pfi.138.2019.01.07.08.11.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Jan 2019 08:11:17 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 2/5] RISC-V: Setup init_mm before parse_early_param()
Date: Mon,  7 Jan 2019 21:40:44 +0530
Message-Id: <20190107161047.10516-3-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190107161047.10516-1-anup@brainfault.org>
References: <20190107161047.10516-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190107_081119_119787_90E6B389 
X-CRM114-Status: GOOD (  10.71  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <anup.patel@wdc.com>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Anup Patel <anup.patel@wdc.com>

We should setup init_mm before doing parse_early_param()
in setup_arch() to be consistent with setup_arch() of
other architectures such as x86, ARM, and ARM64.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/kernel/setup.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 64646d0b4d53..f7132547b8b3 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -201,15 +201,15 @@ static void __init setup_bootmem(void)
 
 void __init setup_arch(char **cmdline_p)
 {
-	*cmdline_p = boot_command_line;
-
-	parse_early_param();
-
 	init_mm.start_code = (unsigned long) _stext;
 	init_mm.end_code   = (unsigned long) _etext;
 	init_mm.end_data   = (unsigned long) _edata;
 	init_mm.brk        = (unsigned long) _end;
 
+	*cmdline_p = boot_command_line;
+
+	parse_early_param();
+
 	setup_bootmem();
 	paging_init();
 	unflatten_device_tree();
@@ -228,4 +228,3 @@ void __init setup_arch(char **cmdline_p)
 
 	riscv_fill_hwcap();
 }
-
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
