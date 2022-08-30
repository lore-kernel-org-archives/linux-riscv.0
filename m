Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBC3ECAAD1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 04:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0T6sweqcb1PDNOb8aZoEvESBGdNnpui/fmLmsUGUZMU=; b=Tai80Yu5RW7JCr
	KnCOD82KIBYu4QiGWaAb6eZnNhUZ1vDeOl7d8O7DN5SGxN9cAwlwo2MH/SZ2IWF4zB0er5i0w7VS4
	RmyHTmGxc2qVFijDPPwc2CcFUJnvrX3thOjkFAySQGT3sKymGlHGBNDcBJW6EvESI3CePTX+JU0xb
	OR2UDQLk7KO0dAO9V3fTpZFfEOku5hznJ2UxZ1SD+BZxLV33rbgtKsCDd8XSu/G84axwm1iPEAmF2
	PPoLpumvzzUwlG6Nk4qDk//Me+bq5TSbleShXmux9ciovuJS2YrJUxw4YGTMkBz4n55/vKEWMxYHu
	Vi68/Bn+u2Rkl4/GxG9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSt9x-00E3hE-VW; Tue, 30 Aug 2022 04:47:34 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSt9u-00E3ep-Sj
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 04:47:32 +0000
Received: by mail-pf1-x429.google.com with SMTP id x19so8354305pfr.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Aug 2022 21:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=/b4XTCSmASmcmXWYN+QoQmuk6ptlc7NOGx3fVn0HIvc=;
        b=agLFlbQx6jF9QmcGj/HcN/B4W0gUvv3ONgKioHftXcDXr9GQWnQ4lraS+pn6hJTd0X
         x5YUfzKAGw0LIvoyZxC4nruig6UaCtZBV7xpRNsofBkNIlU1zSyUWTbKM7xRd8EsnSMR
         szEETqdqlGEcvWnl1W2ttzvrowZ8Y6GxHuJC49Y3AU5qWexqHLSH5uy+VYnbTLKagFUe
         JyCBosGdbmmmaFUubyhCoAjqdRP5+XBedaV9igQzPKWtKeJiglwjqtAmUR2MGzu3u4SV
         75taJTI2HvYQ2YLgQlMriGryHIoEGaG/cIpPNE5abQnj0KTU1YlXWM+f1FHtlM+J725d
         1BsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=/b4XTCSmASmcmXWYN+QoQmuk6ptlc7NOGx3fVn0HIvc=;
        b=si/GGqCv6JESQPgmpeqi6K54yj8QsNdv7PWsQO4wPjaRVRamOzDlCWy6uXSVGDAGwx
         qkLZPQr4d+Is7LzDevxGS36DuyosBBeCMslC9Z2oulxeYzerXpdEJARcgV7cQ9EpAi4t
         foYHIL27YY431LtUYIWuAf6ZUlNKG2Aa0G1vnOWBBIaFR5/Z+rouJrEFV00blSuoMi44
         pWesDorMdgdrCEm6/NjRAug7VBlxHafzmuIhycMO5Sxub0YMiTVz7JByugQEG2HjaYZx
         qnL0NDIbxlPWdjfzOF7ceU2SBPOYNOd/FuYcgx+1A66uNNob6a3ihIClERudqYAm4frl
         xeZQ==
X-Gm-Message-State: ACgBeo3JdWu3U8KeeV1wDDd7J/su99tyxwLaxK/y8h1RGmKKEXbYFQ93
	IX639OW+WXSNuBeMfxtvf9wq8g==
X-Google-Smtp-Source: AA6agR7CYibaFU7E3W+MayVq1XBf019nhVormO9jRUAcvfkWaUo2MBQRrD6wT+/Ii9xPcKDYzhQGsA==
X-Received: by 2002:a05:6a00:180b:b0:536:816b:f770 with SMTP id y11-20020a056a00180b00b00536816bf770mr20015644pfa.3.1661834849979;
        Mon, 29 Aug 2022 21:47:29 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.81.23])
        by smtp.gmail.com with ESMTPSA id y27-20020a634b1b000000b0041cd5ddde6fsm592240pga.76.2022.08.29.21.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 21:47:29 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 0/4] Add PMEM support for RISC-V
Date: Tue, 30 Aug 2022 10:16:38 +0530
Message-Id: <20220830044642.566769-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_214731_233810_0B957F12 
X-CRM114-Status: GOOD (  10.28  )
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

The Linux NVDIMM PEM drivers require arch support to map and access the
persistent memory device. This series adds RISC-V PMEM support using
recently added Svpbmt and Zicbom support.

These patches can also be found in riscv_pmem_v2 branch at:
https://github.com/avpatel/linux.git

Changes since v1:
 - Fix error reported by test bot
   https://lore.kernel.org/all/202208272028.IwrNZ0Ur-lkp@intel.com/

Anup Patel (4):
  RISC-V: Fix ioremap_cache() and ioremap_wc() for systems with Svpbmt
  RISC-V: Move riscv_init_cbom_blocksize() to cacheflush.c
  RISC-V: Implement arch specific PMEM APIs
  RISC-V: Enable PMEM drivers

 arch/riscv/Kconfig                  |  1 +
 arch/riscv/configs/defconfig        |  1 +
 arch/riscv/include/asm/cacheflush.h |  2 ++
 arch/riscv/include/asm/io.h         | 10 ++++++++
 arch/riscv/include/asm/pgtable.h    |  2 ++
 arch/riscv/mm/Makefile              |  1 +
 arch/riscv/mm/cacheflush.c          | 39 +++++++++++++++++++++++++++++
 arch/riscv/mm/dma-noncoherent.c     | 38 ----------------------------
 arch/riscv/mm/pmem.c                | 21 ++++++++++++++++
 9 files changed, 77 insertions(+), 38 deletions(-)
 create mode 100644 arch/riscv/mm/pmem.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
