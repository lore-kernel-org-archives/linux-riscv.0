Return-Path: <SRS0=zkJ7=QG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878BBC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:19:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3510D611C3
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3510D611C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5wDS5Upd3kywe0gRVkPC3Xv85Ag0QKKBDtFWPcSMrDM=; b=G9Ikl3CUSAAfZG
	B/Y7A+r+YpoFpWBKPWmZJm+zzssc7PJ2m9Iz9eJNjCT4GfuTuJsIVFgXlBgItxoo7wYTUBS6HNTKW
	8n//4wUDTQLHQtoTDVy+VSzJKQ71odnfruDI8kkgGlbbf0YDzRnK6Ifk58PPF3M3782ehOGZ0P3l7
	yLU80U1+mYn6LQyMXShkoVq+3yqfws86G4i7vBAAUzp4hub5tD6+Olfp65q0kgGn7cReNa78vTO43
	wlO4K8AV8G3BECxEjbRDfGo9eu63xzxHgRy+FKURk4vI3hRWzVhy/7bNSPzhq4FDS4AG4UpN5kHdM
	BHo1MGuzoMIGj8+wrV1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo6bG-00AzB9-EN; Fri, 19 Nov 2021 16:18:54 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo6bD-00Az8o-GM
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 16:18:53 +0000
Received: by mail-pj1-x1033.google.com with SMTP id h24so8323612pjq.2
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 08:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:cc:from:to:message-id;
 bh=wHMnioS1SZyknkUyv7AocjIhtj+qn+WcPXcl1nykX+Y=;
 b=W9JeVDE+WhAmxRB3it5KnwnrO8Jvss7tz7DU4QAn6HKNgbnKk3fjDHwo9NeiswiE2w
 hkzChjTbnbtcDuOL7/+XPpRRuhFARKIKizewUIagavRn1p8X93FHM7L1Wnz0T1Jof+6U
 Z8kew/8wFI3REqkiLB7tghPnjrWOXuScI97R8EcqP7eNDOFyejNNDbK1gkv53K7xDE6Y
 aXLkgGHwFV+oFZkaoBWL6n/tjzwhkGMGJPaHsGqD+CrIhd/qgafnLK91K4fS2nnnaFAK
 LU9JI+TsWVoTHMos2IiUN2NwQKUW8qu8g2f/UWnjNdnFimQrmqgbgnZSOaV4O12qtvnL
 PE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=wHMnioS1SZyknkUyv7AocjIhtj+qn+WcPXcl1nykX+Y=;
 b=4eCmbn4MRfBtFV3rajM1W/UU8NvtszeSr7ZJ/Q96X3FVkpeztaMEZs6BL4LaBm85Ce
 GcGdUdLdZ72MLngOwlygBHfIByGQGEhPRe4DSWTypnYINPtonI61c2WEKkX77wwwJZgi
 X983XtJ9za3uBSicYkvHLrAm1XLV5BV7yJH+MQbQcHwfEIw7snS2rgNVbqPtaEpVIUdt
 jwKon3PIzrc9uuWJ1z+BId42UdxucFXKkj95JMMalPb60FymTxTZXqaOT8SbiHTPtBOr
 CLPqFJP2bnrW/V8UWT2aI6mo0DSdsjA7bEvCWVhmzVSEyZm7ZQfPyqK8i0M5l1Uiu+5j
 3qcA==
X-Gm-Message-State: AOAM531Sh/xRP9cRvLPghvlcPDp3H8B8Zt9XoRTK3X/FNm1IVRIZAvxQ
 CB57a8TGYOOaXYGLWlki0ETGCQ==
X-Google-Smtp-Source: ABdhPJzjmS5V2wIIaC1HU4Rmy1qIXHjsn6Zv8FzHkeJ8a6W0dmllyr8Op80tsvKKEwoVjeVB51xJEA==
X-Received: by 2002:a17:902:c086:b0:142:7169:1573 with SMTP id
 j6-20020a170902c08600b0014271691573mr78123137pld.13.1637338726911; 
 Fri, 19 Nov 2021 08:18:46 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id lp12sm149899pjb.24.2021.11.19.08.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:18:46 -0800 (PST)
Date: Fri, 19 Nov 2021 08:18:46 -0800 (PST)
X-Google-Original-Date: Fri, 19 Nov 2021 08:18:47 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 5.16-rc2
CC: linux-kernel@vger.kernel.org,         linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-fbf2cd0e-320d-4e42-a2f2-d5343d0a58b0@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_081851_620781_9FBDDF59 
X-CRM114-Status: UNSURE (   7.90  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.16-rc2

for you to fetch changes up to 5a19c7e06236a9c55dfc001bb4d1a8f1950d23e7:

  riscv: fix building external modules (2021-11-18 23:06:23 -0800)

----------------------------------------------------------------
RISC-V Fixes for 5.16-rc2

I have two patches for 5.16:

* A fix that allows external modules to be built against read-only
  source trees.
* A patch to turn KVM on in the defconfigs.

The second one isn't technically a fix, but it got tied up pending some
defconfig cleanups that ended up finding some larger issues.  I figured
it'd be better to get the config changes some more testing, but didn't
want to hold up turning KVM on for that.

----------------------------------------------------------------
Andreas Schwab (1):
      riscv: fix building external modules

Anup Patel (1):
      RISC-V: Enable KVM in RV64 and RV32 defconfigs as a module

 arch/riscv/Makefile               | 2 ++
 arch/riscv/configs/defconfig      | 2 ++
 arch/riscv/configs/rv32_defconfig | 2 ++
 3 files changed, 6 insertions(+)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
