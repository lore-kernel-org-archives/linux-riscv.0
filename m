Return-Path: <SRS0=DZC9=4U=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0228C3F2C6
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2020 18:57:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81CCE206D7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2020 18:57:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rcFGYTn4";
	dkim=pass (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="omvBLagy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81CCE206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-ID:To:From:Subject:Date:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2U7xU0WivIPvRRMGWiKDxnJ5G5AYpY+E3IRtCMPj8hU=; b=rcFGYTn4DH1BkexXChz+qaZW9y
	bwB3WlmNuE+Sn04nLmogs6w7r95IyXEioVgB1ATo61aD4QcydSid968LhpQhfux5VhsaVfLUARppN
	HZi+7147SKWSI+PS22G5p1pXKaqnzr1pQ7dlwvcsnUNnG+hEhCx2WzLUlEemW4qRVwpwgCYr4rwfk
	gmazE7tLdUPloMOKX2EIMsBPzGpAyULRZjI1PLMcRQ2WLpjItAoA9wFDYSuzKDyJBmvBGKuWPP80m
	QjslVOUQJmHm+jQyw/2SlfWhXkODrR3eT1TtXTgHe9yuyCN1fJ8JIujY0/8qvuOfFrsFY+bHdlX7L
	jcqOzyzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9CjY-0006tc-Es; Tue, 03 Mar 2020 18:57:36 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9CjV-0006t0-0D
 for linux-riscv@lists.infradead.org; Tue, 03 Mar 2020 18:57:34 +0000
Received: by mail-pl1-x62f.google.com with SMTP id b22so1722151pls.12
 for <linux-riscv@lists.infradead.org>; Tue, 03 Mar 2020 10:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=2U7xU0WivIPvRRMGWiKDxnJ5G5AYpY+E3IRtCMPj8hU=;
 b=omvBLagykPa3p9CrJdi3NJgfwTmgiT7q2489rAyEDOZi7ktGA5Zrgc14vSfr+9xUAA
 wHzp461MHZFLBKmBvz2gC3ddwCm1hIjfoWzG2vdiEPAhxtgfybIyHvYHtTgF/QyBwLL0
 QLKFa90sPsNpOgfCHgHNSWnklpnqkO85BpfPHsDjyTCtBVlRA2EHXWwYYY2iZFgQmWHQ
 2aR1ozu45paILnHdfhg8RV1ZdLwhZPTGgmfZSwEbGNJKgi5K+1qwSRhk/C6wk47Nzlu7
 pCRdTvP9LMJeoEBMdQ49KMC5gi4x0oc9hmu6YZabel9ykezpfGEaqee70ZA2QBa5pjzj
 KoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=2U7xU0WivIPvRRMGWiKDxnJ5G5AYpY+E3IRtCMPj8hU=;
 b=B6hjWq9H+mmtazHiFIvZ0vXt0Fg+ImEM+/PgtnUbl3UM4UUEo46cp4W3isNreRwWg1
 LFP4QSsEYxq+SR5I7EbV/sAR71UF6DWSK0seruYAPYEOt/mbp1+x/D0E6SeVP1NhqSAb
 FnsaZVA0kkMdgDngeOK7LQI0+kP9aVRRa60fmI7gz64Pzy4Xi0MShEQan8+GLxtECpCY
 cts6RUJHCHG0Iuv3o5hgenYaW0e3gYKoJu37fhXKRRUbU9gpXOhRNBK5Jbpio+BRj3c6
 2O3jBTqIBZEewMvtHDEnMEwQnessBNnyfDd5F2xW8ufgGF4Cc56+W/x8RvwUKVK0kRGB
 Af2Q==
X-Gm-Message-State: ANhLgQ2ULh1olQsviY6UcwDkjNUjZVLPomryX0QN1AfaoaQI44I/bVwC
 LX1FlhpXJzlceGpYfyr0mJ03DgFTU9c=
X-Google-Smtp-Source: ADFU+vt58DDy/uf+MBmmPlzDefhYmB7TqSq6xLUJLxWbwYCzskpSHTwut5fpept9Noy3YkSwL6rIRw==
X-Received: by 2002:a17:902:b692:: with SMTP id
 c18mr5597530pls.7.1583261850754; 
 Tue, 03 Mar 2020 10:57:30 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id x2sm24456166pge.2.2020.03.03.10.57.30
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 10:57:30 -0800 (PST)
Date: Tue, 03 Mar 2020 10:57:30 -0800 (PST)
X-Google-Original-Date: Tue, 03 Mar 2020 10:57:28 PST (-0800)
Subject: for-next based on rc4
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-1817491a-46cd-4ed3-b8cb-bf3319dad665@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_105733_093368_972702F2 
X-CRM114-Status: UNSURE (   8.41  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

rc4 is looking pretty good to me, so I'm going to use that as the starting
point for the next for-next.  A quick poke at my inbox reveals:

* K210 support
* Static kernel memory permissions
* Percpu in modules
* UEFI
* KGDB

as the big patch sets, but there's some smaller things interspersed that my
grepping isn't going to catch.  For the record, for-next currently contains:

* abc71bf0a703 - (HEAD -> for-next, riscv/for-next) RISC-V: Stop using LOCAL for the uaccess fixups (22 seconds ago) <Palmer Dabbelt>
* fdff9911f266 - RISC-V: Inline the assembly register save/restore macros (12 minutes ago) <Palmer Dabbelt>
* 52e7c52d2ded - RISC-V: Stop relying on GCC's register allocator's hueristics (17 minutes ago) <Palmer Dabbelt>
* 064223b947a8 - RISC-V: Stop putting .sbss in .sdata (17 minutes ago) <Palmer Dabbelt>
* aff7783392e0 - riscv: force hart_lottery to put in .sdata section (17 minutes ago) <Zong Li>
* 2fab7a15604c - riscv: Delete CONFIG_SYSFS_SYSCALL from defconfigs (17 minutes ago) <Deepa Dinamani>
* ab70a73aa45b - riscv: Use flush_icache_mm for flush_icache_user_range (17 minutes ago) <Guo Ren>

