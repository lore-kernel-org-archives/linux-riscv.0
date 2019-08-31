Return-Path: <SRS0=nlXr=W3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC259C3A59B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 31 Aug 2019 02:32:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8682423429
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 31 Aug 2019 02:32:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dkZ5+H1E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ZpoWEnNQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8682423429
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z5VEv92crmGp22jKYHXa/i+XIYdaUuWnGOb6eO+pbCA=; b=dkZ5+H1EVZA9O+
	bgt8bTFBuT2uDc17vHn8JIMTIs8IIjOwN5CKnfsa05VThZme/gkQPMOY9lk++IDB+BT9D62oSOBV/
	lAP6tDRXG+YVPEYv62P2JnsMGwR6UwN8+JuCst6Qx1Ob1+0uMnOIHuHPXm+JJC/CYVVVangv6NjCk
	GCJkAkJKlc1n+PiRtuK7Bg3V3WTiknpMFLXScBhdSuJ2fAP8kiOqury+IckexX58vlN62vNtdCX6T
	Txhdhj0mJiWkHeGH8OLlkaaVgGRcoNwgaGHzCd05szZPv/Piuh4NVWG6ed38mDMbUCAHZzOpJdFSW
	9us6SGWfZ2tCw80gkfQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3tBN-000415-TT; Sat, 31 Aug 2019 02:32:05 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3tBK-00040a-En
 for linux-riscv@lists.infradead.org; Sat, 31 Aug 2019 02:32:03 +0000
Received: by mail-pg1-x543.google.com with SMTP id d1so4420676pgp.4
 for <linux-riscv@lists.infradead.org>; Fri, 30 Aug 2019 19:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:message-id:user-agent:mime-version;
 bh=FBpAnnmFSQN+uWiLL2/GrqwNrDFmIljLv+JtnhGF5Sw=;
 b=ZpoWEnNQU8H5ZKyt08S1tNqhM92cHgG1vmOz52sCpNxvSSQGGXfsESroJULNQ8q0JC
 RxjP6qaM6Wdqg0858t9xNpKLfsSc6rYmWO88H0RYgVrFw/7p3VKUcKjpiRiGQHansYWl
 9RTDBZH5d6J0QdFsMeL3CWFDBeUIkvWPShJQ97N3yevT/Gc2PrWbjLB5EQ91nGlavMaK
 rZnYmkUFgjAMzAckgrcJ5i0KiZzUXx6TgNUqFhWbw8cTM4xy1dQr7HcPrXmCj3s0ZqO7
 0DnIMdBwaCuIS+z2OuKjw0+VT55Cn22JZQ8GbIRJQFkBqJlfO51Sl5cf7FFH3dXEUhtb
 Vtpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :mime-version;
 bh=FBpAnnmFSQN+uWiLL2/GrqwNrDFmIljLv+JtnhGF5Sw=;
 b=SNwx/tluEnA/TyfffHe9fVmtFm28Hc61GxI4QOKLIZstP5mYQs3FdF5ug5vSqHFHEX
 bqGDFrIMOnvlh+V6cBsIUJqdUh4tmDXee9XETTYwkHoSDYrSvGg2Z3+sQJZz7nOC6bHt
 mhGb6Btg50V1b3Pio71oz/O1EcmTAcfIUGiXyiBRLQyJ7wybfCHbRzCPPbHNYA0I+vaL
 dkT4efXuqpuQkLAckNcdr0PsFM7MJdrhtpsFV3j46QK09PH7+5J/WyjQognHQtDQ9KU9
 N02pUvN/2l7lIpAlbRJasqg3jgtjCHBCVHyPVP1TI07wPqxxolMku3lB8B+jykzCUtZi
 oFHA==
X-Gm-Message-State: APjAAAUjPxxutONOQ4OpoELx+1uUGyl5zBZg2+sXlY6+Fot2U8quCnVf
 L/8rynvno4ZQFkkyg7rt4fG8og==
X-Google-Smtp-Source: APXvYqyI9inCd1df02N4PqNj0BWfnV1BgA+8YV6J4CbPMAGIwTTR8//GTnbP50aeqaDLYIzZdGo/qw==
X-Received: by 2002:a65:500a:: with SMTP id f10mr15415728pgo.105.1567218720386; 
 Fri, 30 Aug 2019 19:32:00 -0700 (PDT)
Received: from localhost ([216.9.110.7])
 by smtp.gmail.com with ESMTPSA id a16sm9677276pfo.33.2019.08.30.19.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2019 19:31:59 -0700 (PDT)
Date: Fri, 30 Aug 2019 19:31:58 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: torvalds@linux-foundation.org
Subject: [GIT PULL] RISC-V updates for v5.3-rc7
Message-ID: <alpine.DEB.2.21.9999.1908301929460.8525@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190830_193202_508400_79E481CB 
X-CRM114-Status: UNSURE (   8.01  )
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

The following changes since commit a55aa89aab90fae7c815b0551b07be37db359d76:

  Linux 5.3-rc6 (2019-08-25 12:01:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv/for-v5.3-rc7

for you to fetch changes up to a256f2e329df0773022d28df2c3d206b9aaf1e61:

  RISC-V: Fix FIXMAP area corruption on RV32 systems (2019-08-28 15:30:12 -0700)

----------------------------------------------------------------
RISC-V updates for v5.3-rc7

One significant fix for 32-bit RISC-V systems:

- Fix the RV32 memory map to prevent userspace from corrupting the
  FIXMAP area.  Without this patch, the system can crash very early
  during the boot.

----------------------------------------------------------------
Anup Patel (1):
      RISC-V: Fix FIXMAP area corruption on RV32 systems

 arch/riscv/include/asm/fixmap.h  |  4 ----
 arch/riscv/include/asm/pgtable.h | 12 ++++++++++--
 2 files changed, 10 insertions(+), 6 deletions(-)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
