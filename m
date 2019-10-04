Return-Path: <SRS0=3PXF=X5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBBDC4CED1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2019 17:36:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA8362077B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2019 17:36:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gcN+tht/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="j2VU4nhu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA8362077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D0dTz6tJfCKXSvskmCHfXf2T6znYYPJJCmD6sxoWQns=; b=gcN+tht/GRNScf
	SzgtcBNl+8AU03uGQ84CzLu5e0cg02hfrIg84G8ZSVGWmteAUp1rpvgK1slQXrPC7dtnEkVuPgTwF
	pCTyg0GHxfi2MKLOdoNHaNtEr0qpoVAdEI3tDTgH9nPLu8eQ+ZM40JMdPKYerWrmoIQ2ex0kxRjFY
	e5WFFC6ne+lMUnjb4tcf/ZDLmC/Y0Msn6GFQqe8wcQmBTCShow2DKxOugKlBp7MMu4wiwNBDqac/M
	5R+a/gQs1krYdWZLMYh92oqoE3YRCXMf3HlVVU05I+kuZ5Y74x+PvUbyXVPIiPo6OGSw5H+9qcS4f
	PmMXPi1kpeLupBu2By9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGRVj-0000BM-5Z; Fri, 04 Oct 2019 17:36:59 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGRVg-0000Af-KQ
 for linux-riscv@lists.infradead.org; Fri, 04 Oct 2019 17:36:57 +0000
Received: by mail-io1-xd44.google.com with SMTP id n197so15229161iod.9
 for <linux-riscv@lists.infradead.org>; Fri, 04 Oct 2019 10:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:message-id:user-agent:mime-version;
 bh=wY8a4I6EvPZotqzLTyscITojeAnhMbow8kNJLZSccGA=;
 b=j2VU4nhudfCwpOV14M8+kBsDhVuSQiLUgOglDWxA9Or6YplVHi0izJ84RQ6xD5qfQY
 Ypifmxa2jOePCXYgtHaG8m3e9xMkrYNk5TwCfsGKfC1AWobdrLtnp/2qEncRXNL+um1C
 ti22ewBrCqeditYfBbebGBqzOzlLx8rPydAq0HyjxxnCxoNXNoX1kYl7BGiDuzc1JAYs
 mawjrVPc/BTmgs+FOXzC3/uiX85pBulABLMNNLkbXSqT0bh+U2svnvpLf3c5DNb1arL4
 p50k6IBbrwlShDOXZQp0sEZqxff3RMZA/sOG1bUbgR1SDmAPq1OZpOc6AIS0JFFMmS97
 wa3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :mime-version;
 bh=wY8a4I6EvPZotqzLTyscITojeAnhMbow8kNJLZSccGA=;
 b=V7wd7grz73Z1ht/F7ZBszw0mH5nmF2+85JagCtlwvJ6zQyAiabyD9umnrKqBTJS+bX
 Bsb8+ZQ9nbWEcWI6d9eTYj+0gO3vMqBWzgtHh7nknGzfmQJvU/DfnN4nQOyjdCWllXeJ
 tu43IzhQF2myYg4MJaBpXE9Ye9xigVTo+QQ4bVBiVlE4qSMTQuUT8RV3upNEchr0sHR9
 Xp8c0LSnz7dYrb2jsvfIL/jAJL93lPTM7WUl6tVoGHFACnRyyTQ6KONX7eHFEZz6h53n
 OGn1qgeZKcugY1EYdRKvAfrhHDPf0Yws1gJmxX6AJEZbWvwnXExvEm7LGApC3rBFxBoE
 o3/Q==
X-Gm-Message-State: APjAAAWT147e7f6XDkRlI9mOfT3gNAIEVUkPuwzwI2E/mvRumKhJNHhc
 O2jWqjf1DfyZNgWjOUSZaLi4V4lAc+U=
X-Google-Smtp-Source: APXvYqwiiyfcO5zfpFG0B4LUXjsy02MITOscolsE3p87ClD/+IpiRYj3xKideFfLwgHqf3N/ClEFGg==
X-Received: by 2002:a6b:7b01:: with SMTP id l1mr14101296iop.292.1570210615947; 
 Fri, 04 Oct 2019 10:36:55 -0700 (PDT)
Received: from localhost (67-0-10-3.albq.qwest.net. [67.0.10.3])
 by smtp.gmail.com with ESMTPSA id m14sm2634004ild.3.2019.10.04.10.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 10:36:55 -0700 (PDT)
Date: Fri, 4 Oct 2019 10:36:54 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: torvalds@linux-foundation.org
Subject: [GIT PULL] RISC-V updates for v5.4-rc2
Message-ID: <alpine.DEB.2.21.9999.1910041036010.15827@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_103656_674532_37ADF596 
X-CRM114-Status: UNSURE (   9.41  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Linus,

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv/for-v5.4-rc2

for you to fetch changes up to 922b0375fc93fb1a20c5617e37c389c26bbccb70:

  riscv: Fix memblock reservation for device tree blob (2019-10-01 13:22:39 -0700)

----------------------------------------------------------------
RISC-V updates for v5.4-rc2

Two RISC-V fixes for v5.4-rc2:

- Ensure that exclusive-load reservations are terminated after system
  call or exception handling.  This primarily affects QEMU, which does
    not expire load reservations.

- Fix an issue primarily affecting RV32 platforms that can cause the
  DT header to be corrupted, causing boot failures.

----------------------------------------------------------------
Albert Ou (1):
      riscv: Fix memblock reservation for device tree blob

Palmer Dabbelt (1):
      RISC-V: Clear load reservations while restoring hart contexts

 arch/riscv/include/asm/asm.h |  1 +
 arch/riscv/kernel/entry.S    | 21 ++++++++++++++++++++-
 arch/riscv/mm/init.c         | 12 +++++++++++-
 3 files changed, 32 insertions(+), 2 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
