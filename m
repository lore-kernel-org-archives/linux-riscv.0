Return-Path: <SRS0=FYRI=CF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F39C433E1
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2020 08:22:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4B9C20738
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2020 08:22:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hr33NfLM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="f1/fcUj8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4B9C20738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5wrNvJ3SaZMCEiT5n/fJ4oBLZ0OXVg7mgj5pfp6WWIs=; b=hr33NfLMZ6CD1rl/4D+Q8KFMQZ
	gvjK1dDnTohXWk/v57Yq9cSwrSufq4M9A9psddD3+5DXpPl9p0GKPk1CGG5+vAeeNS/MNV5su66nF
	//ExzoEEXHbXSRODJ9T7NvEMBd8H/7A582zboBWOpv4G0VlDJtovZKbajqccgNrvSdVctvkpSoLaT
	PQW66zXbs1HjPF+tNTZojmMtrrVxLSQ244z8YwHMaCzTZtWMgVjKXKWM/zxvz6MoIUsc8uuVsCtXz
	lhyduYWRxjUxmeXSAXu2YythLBfZWpu2lbM6CT2sp+BXy+LjnaseZSOgGALkbXP33akjf48xuBKId
	xANnwYhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBDBB-00017S-F2; Thu, 27 Aug 2020 08:22:41 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBDB8-00015Z-Hb
 for linux-riscv@lists.infradead.org; Thu, 27 Aug 2020 08:22:40 +0000
Received: by mail-pg1-x544.google.com with SMTP id p37so2831563pgl.3
 for <linux-riscv@lists.infradead.org>; Thu, 27 Aug 2020 01:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ftNSmWyY4DXtAPMFhhFUNPxTBnM04m1o45AJFNQ6MLU=;
 b=f1/fcUj8AvfqkfH010tjpwC1yboh98LK+9rN+VdhHx+mC465aqaRLgs2Xp/b0XfS5Z
 i58biRjeJurZN7B+F416ZZEITKOAhGBNOmF4ZcmQylcjF/2LjMpkiKppo1cpvxDCZN/X
 bZYIa6IeHL6sAsykwiWlHnN4rjxBjDVv3123g8Dg5Qu82mxGILpLxiJmVny7LHmWAC1S
 SVumcEUWVlL5i0gDzfRgNWm63EUNe88FH5jHN5bRxorYTyIR1aiW+C7oqiv9QZP+XPcU
 +7g7LKNdqr7WyQoITO1mJ9t2VEZEcz5ahiV+zqUbfYc0nU/d0HMFc1fJ7KxkpDYZ3D1z
 xxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ftNSmWyY4DXtAPMFhhFUNPxTBnM04m1o45AJFNQ6MLU=;
 b=f+9uXqPonNXw/HbIULgwgh81NUc1Rt2mnytHHuXFOkBsRGxkDt6VvDdJghDoG3LKNE
 poArFCCzkpiNdwQ1vL6HH1NSFK0RLNt9+93aq7dlwMU6S8Pybrv1FN9mfQdJPV6c0s4U
 ksUMAyQf726J1SqzQ+3WO6TLGWzK1chvhL3buVnwZL3JQ36R5arZoAdUfZX8P27HJ8bL
 Y97S5Z2l6CGX36+U5tWyj/Sdk3Zr7pnyzcHZN/9ULQ+jn9noOCgpjz7rtQqm0sFL8S80
 t1An2ZhpcMtq+APMQFqC4M2k0yjrE9lLa4b3XA3UPCNYD7gWoKXIMr8WlAziUqBAiOwl
 fVOQ==
X-Gm-Message-State: AOAM530jioUBboaRoWMRyes3sWhS6WkdXz8WqyTz1BbHwxrw0gT0M5FL
 GR+Pml/jprNh4QYJtVGEC4HZsl6ui3VJ0Q==
X-Google-Smtp-Source: ABdhPJxJUcigDvDepGZN4aYbKgKPsbbPdwFaGloGOvO+/FBaOs+rqTuBr6qf1OkUW9FDlWEEoBbCSA==
X-Received: by 2002:aa7:80d6:: with SMTP id a22mr15738360pfn.275.1598516553111; 
 Thu, 27 Aug 2020 01:22:33 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id 124sm1828351pfb.19.2020.08.27.01.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 01:22:32 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 david.abdurachmanov@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Get cache information from userland
Date: Thu, 27 Aug 2020 16:22:25 +0800
Message-Id: <cover.1598515355.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_042238_871590_8A31C765 
X-CRM114-Status: GOOD (  10.29  )
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

Changed in v2:
  - Add error checking for parsing cache properties.

Zong Li (3):
  riscv: Set more data to cacheinfo
  riscv: Define AT_VECTOR_SIZE_ARCH for ARCH_DLINFO
  riscv: Add cache information in AUX vector

 arch/riscv/include/asm/cacheinfo.h   |  5 ++
 arch/riscv/include/asm/elf.h         | 13 ++++
 arch/riscv/include/uapi/asm/auxvec.h | 24 ++++++++
 arch/riscv/kernel/cacheinfo.c        | 91 +++++++++++++++++++++++-----
 4 files changed, 117 insertions(+), 16 deletions(-)

-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
