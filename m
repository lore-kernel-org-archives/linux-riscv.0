Return-Path: <SRS0=aIEb=AO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B6AC433E2
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2020 08:58:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F59D20826
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2020 08:58:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pD3v1uBg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UYyFvt0y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F59D20826
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VV2dtGRrrAAIwyh56+Hhcg3d3UiQBkk4EJJYcuZnXwI=; b=pD3v1uBgIUPB0S6EygFaZuy9J0
	HqHIjW70YVEscydxosevpgO9kbnQX3T2iC4D8X/7RIzB0k1j8DZ2rE3k0gIgDCUxjP13VxRbxXuUz
	Xnq/+OHTpjf5GBFfiRKiREYRXHaY96HGSYyGel18x+U7/rthMWjScBEYR19VCOSyi2hn7q/zCEyil
	VkrFduYyyanRRdEibClDuD6tQ8cOWjlyfxa+DhTQRSbYFLzcpuXeZn+Xs96bDn+OwyvXgncSaql/A
	COaqihx9s1COYbfgRJ25Wm97tpvkwXNyzwR4+mqRO5oyDjIou17v9X6G9q585ra+EM17xE0qMgqq5
	ye6w2ooA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrHWJ-00035f-7Q; Fri, 03 Jul 2020 08:58:07 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrHWF-00033A-7s
 for linux-riscv@lists.infradead.org; Fri, 03 Jul 2020 08:58:04 +0000
Received: by mail-pl1-x642.google.com with SMTP id o1so5844700plk.1
 for <linux-riscv@lists.infradead.org>; Fri, 03 Jul 2020 01:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l5krbZyzVlqtJlOtCzvF9lWot4EaX2wFJODMLjpfT4I=;
 b=UYyFvt0yHy8s+GaHXFDWNpCmUSIIUi1ARn1Nol8baUVBhpIIPAvw//y55ov/JDYZ9E
 DcIzzfh7GLHhx7zBBS2T/noiqaLvQdRYIVsvbapYFWozPXkRSqMdDYptpp/J68qPJbVs
 PuZlS69ZvO2fuKtpWKI9YGWVG293nIWvJGUQ8M0yySw1WJhkPDKsxKY3cSrbVK7RX6Wx
 40MeCtPwwA25KJ4/SF9fp8Xa2f7vZr46RMz9dzrcvdRpNkfsz0CXSBgTAJ/G2zyJYBhY
 dl/8a9rInKt8BA9505EvF6SVg9U9MgQLAMJbQVeGdEsxJH+PsbIzskM1fdx+ctoHn8hs
 wPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l5krbZyzVlqtJlOtCzvF9lWot4EaX2wFJODMLjpfT4I=;
 b=FnzPu4CUiMy0BUbEvgLBXqigCGVjiqLXvGKzC/uYnCWG2dsqNAF72jmgivnOTAItjz
 qh1cdylp+wUDpG7rpIOgxmLaxuRwNjPMrTDh8zkSY1NikHYL4189U4/d8DzGB+Kkn+gg
 W7uZu/cEa5zzUvkhbLrV/PUEEVqlZoQ0CW8Mz0+4IL2fxz9Mo+/TeD/76MhbTOCmqLJW
 tz6zDP9iixNi+pYd61BwphyfKFxLCBFvZ+IXhWOV/vpNHm/cEQ8jjNuXW5ONmZEOsEF8
 P3lGBQjxvWFUMzLYe1gkEzqwMIj2KIbfBBO3KW76UxPrXOWcVxvueIy2OAfPSe4tfF7T
 CdwQ==
X-Gm-Message-State: AOAM531CwNp4gdHqGb8La7DAxlph40LtJ5CGL7zSp9jdKVbzHj6dbANF
 4WCTvHNBOM9OOK04fuUW5YaFbg==
X-Google-Smtp-Source: ABdhPJziBzbhbh7LkHtY3EnPldKzpWtTLtYu7SsscIuCrPkd9X2YdWZoAir/RegXx6s4AkyF+pNL6Q==
X-Received: by 2002:a17:90b:1386:: with SMTP id
 hr6mr35394676pjb.93.1593766679662; 
 Fri, 03 Jul 2020 01:57:59 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id l23sm2126287pjy.45.2020.07.03.01.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 01:57:59 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Get cache information from userland
Date: Fri,  3 Jul 2020 16:57:52 +0800
Message-Id: <cover.1593766028.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_045803_607678_3A2E7E87 
X-CRM114-Status: UNSURE (   7.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

There are no standard CSR registers to provide cache information, the
way for RISC-V is to get this information from DT. Currently, AT_L1I_X,
AT_L1D_X and AT_L2_X are present in glibc header, and sysconf syscall
could use them to get information of cache through AUX vector. We
exploit 'struct cacheinfo' to obtain the information of cache, then we
don't need additional variable or data structure to record it.

We also need some works in glibc, but we have to support the function in
kernel first by rule of glibc, then post the patch to glibc site.

The result of 'getconf -a' as follows:

LEVEL1_ICACHE_SIZE                 32768
LEVEL1_ICACHE_ASSOC                8
LEVEL1_ICACHE_LINESIZE             64
LEVEL1_DCACHE_SIZE                 32768
LEVEL1_DCACHE_ASSOC                8
LEVEL1_DCACHE_LINESIZE             64
LEVEL2_CACHE_SIZE                  2097152
LEVEL2_CACHE_ASSOC                 32
LEVEL2_CACHE_LINESIZE              64

Zong Li (3):
  riscv: Set more data to cacheinfo
  riscv: Define AT_VECTOR_SIZE_ARCH for ARCH_DLINFO
  riscv: Add cache information in AUX vector

 arch/riscv/include/asm/cacheinfo.h   | 14 +++++
 arch/riscv/include/asm/elf.h         | 13 ++++
 arch/riscv/include/uapi/asm/auxvec.h | 24 ++++++++
 arch/riscv/kernel/cacheinfo.c        | 92 +++++++++++++++++++++++-----
 4 files changed, 127 insertions(+), 16 deletions(-)
 create mode 100644 arch/riscv/include/asm/cacheinfo.h

-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
