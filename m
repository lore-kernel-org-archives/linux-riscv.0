Return-Path: <SRS0=lGgd=WN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE45C3A59D
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 17 Aug 2019 01:26:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F3D8205F4
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 17 Aug 2019 01:26:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b82ppn52";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mn01vxM/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F3D8205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UAPEzRE1/DyGXcfrbP07sastcUYEL1tW8a5/Tgljt1E=; b=b82ppn52W+lLZr
	BjFc0d5mL+zpohApDPJGVg99FTmNoM4DOte4gj0y1Ft/+ztoP+2goIjv19Qsp40WB/howWTcIZzDM
	il5uUN/rGD2oiGrhppHbJNTAw5MTyv5oS17n///uxejAsLfFVhe6xdEFy1wE0a3jjRZmIKOQw+2vf
	g+KNjGBbNai2fMYUfHKxbU6emXi1FZUWJtkrGYWGjMynXPlKtvAjR+H7Sh2Wq+JMq99tCt2hvu10Z
	P0ouggJBXH/4WIZ50TJzy5o7sIyUB7Ut3RS44plqedpT1QqHeouiSmERaL1QtSBQrJm7BJuMt5UAT
	+6dDs5Sa3FMsO0zTmhBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hynTb-0005eA-V2; Sat, 17 Aug 2019 01:25:51 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hynTY-0005dl-NW
 for linux-riscv@lists.infradead.org; Sat, 17 Aug 2019 01:25:50 +0000
Received: by mail-io1-xd41.google.com with SMTP id j6so9842174ioa.5
 for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2019 18:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:message-id:user-agent:mime-version;
 bh=r3OpJwbBDOwHPxJNtLJ3xBe/K17VIy9hFFgeMpXJq1Y=;
 b=mn01vxM/ek1dPiMc2W5VTlT+qImlJM53Q9PD789aJvUjL3fSgBbxIfFa/ykojjwa7+
 6M6Bt/qyCmeC1fKdyIZGe+w1G5mMstDPo8Ex8ArbaCnmYlVQET+KV1gKRS+HIF64+SPB
 jH3tpgeRRD7CzvUots1qawLofT8sZYg4e3AQWbA2r8m+Y8eSfvuSSVM/f6Gp6PnIGfkf
 dCopj7TlLO9U32tpKqflDVSblTPFZg6hS9RxZBP9X2j+7UtzLhxIYKq1Tk4MNijMSlAr
 04zTjPzvj9K3gCr5OtRTfMD+/8TZu10jrQ8R82uh5ikrKLkdA5f1N8ayldLdocma+OKq
 1k4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :mime-version;
 bh=r3OpJwbBDOwHPxJNtLJ3xBe/K17VIy9hFFgeMpXJq1Y=;
 b=LEGzFFVThW50DUgnSFa6DX+Q+T4ebv7YFwxfrgj6cDQN+pjVYNvHF6FGqWj5T/gwZ/
 gibLIdOsf9v2LRilUdbtKiNpbIHK+3z4IfUuFm6YDOAgGOQnj+HLzg1oIdAc7FVkjg7M
 ah7y54SQyyUp1w69XWr8TBErPDjz9Cr5dWP/WpACsIucZcFVGqRMHp+y7QHMuAqzVEYq
 LQGPvp+X/bWMm/EgwpSZQe79GODFuM4rJCO9G61sX7j5zm2mLeU5qEJDi5x86e9yDsyX
 WCw/KzrMdmt0zzLMWAzvKRjhoFQJnZtycB4ILj5SToEOxBh9n3sI5rp0aVjacOJA/Nsq
 cNfA==
X-Gm-Message-State: APjAAAXTRJYa2Z6sIZhQW4RV8N2VzJjhWrwE5swH365AlcSAPWnZ3Z20
 AeO1rb+m4xy0hhDESasDQsoFDw==
X-Google-Smtp-Source: APXvYqyvJdjvTmwp85J3CXa05ry4xmaYqztXglK2aB7PWLhYu7RK5iBqLq8Ue5UYZUOc45RtFDc7Xw==
X-Received: by 2002:a6b:d006:: with SMTP id x6mr4073667ioa.218.1566005141854; 
 Fri, 16 Aug 2019 18:25:41 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 e12sm15282871iob.66.2019.08.16.18.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 18:25:41 -0700 (PDT)
Date: Fri, 16 Aug 2019 18:25:40 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: torvalds@linux-foundation.org
Subject: [GIT PULL] RISC-V updates for v5.3-rc5
Message-ID: <alpine.DEB.2.21.9999.1908161824300.18249@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190816_182548_831002_F1AD60BD 
X-CRM114-Status: UNSURE (   8.40  )
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

The following changes since commit d45331b00ddb179e291766617259261c112db872:

  Linux 5.3-rc4 (2019-08-11 13:26:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv/for-v5.3-rc5

for you to fetch changes up to 69703eb9a8ae28a46cd5bce7d69ceeef6273a104:

  riscv: Make __fstate_clean() work correctly. (2019-08-14 13:20:46 -0700)

----------------------------------------------------------------
RISC-V updates for v5.3-rc5

These updates include:

- Two patches to fix significant bugs in floating point register
  context handling

- A minor fix in RISC-V flush_tlb_page(), to supply a valid end
  address to flush_tlb_range()

- Two minor defconfig additions: to build the virtio hwrng driver by
  default (for QEMU targets), and to partially synchronize the 32-bit
  defconfig with the 64-bit defconfig

----------------------------------------------------------------
Alistair Francis (2):
      riscv: rv32_defconfig: Update the defconfig
      riscv: defconfig: Update the defconfig

Paul Walmsley (1):
      riscv: fix flush_tlb_range() end address for flush_tlb_page()

Vincent Chen (2):
      riscv: Correct the initialized flow of FP register
      riscv: Make __fstate_clean() work correctly.

 arch/riscv/configs/defconfig       |  2 ++
 arch/riscv/configs/rv32_defconfig  |  3 +++
 arch/riscv/include/asm/switch_to.h |  8 +++++++-
 arch/riscv/include/asm/tlbflush.h  | 11 +++++++++--
 arch/riscv/kernel/process.c        | 11 +++++++++--
 5 files changed, 30 insertions(+), 5 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
