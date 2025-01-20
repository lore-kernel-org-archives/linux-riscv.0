Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F77C02181
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 12:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dc746sWMPmXSc2ppRmdsjFxLjnwB2h7ZnAGGNgGXd/E=; b=diyf6uenNnF6rg
	6KfGjeYX9nYS2j0uQtov9zznZ7qv+/ySW7TbY8XLNVtJX/P0lGlmFcx0dFTw1J9XBIAcxRqRG2Tm9
	xbv5C3ZNtdTl4RS90CgJ8Ti4YDqG7Z7z0N0yrGXuXtOX1qp7ehxneRH8G2jWJe/BwIAOjbi+AST9g
	CR3s935UOsFQE/9IiYHuth8kNMWhBXevs0xeo8zVbTqLZPu7x18FGc5z5xa00io6IEtRZQMS2odAe
	D503uOIWmo6yIV08aKydn7PWsN0VGU4H3xa7sIXyttSZyFAP6gSC1DDHFUX5hIKQs8Xg4v0C6NDSK
	aUimnJD5+DA2b9xyJx6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZqlB-00000005XKQ-11XS;
	Mon, 20 Jan 2025 12:20:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZql8-00000005XJz-2VYm
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 12:20:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C3D2B5C4BE9;
	Mon, 20 Jan 2025 12:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3E9C4CEDD;
	Mon, 20 Jan 2025 12:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737375601;
	bh=1UabhrlEpjbeUPG49KvAEtfAp6W8RWy99z6tVDsNLr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fq1CcgYdsz+V1sav98PyNnmCJuJ0RN7FLnE12ydu/LkB/g+cUaL/lFkD/IeN5zdYS
	 onqqEEaO0IH4cqowCMAnEvYUVTKAqlXrstWdjTXiXN8hlkgWmCt0jx+KuBzpsJA9C6
	 7hzUIvX8dR7uuo/x/5KTCrhxWGskwd81tOa1I+CYCMudMqdxEjMxDj/SdkFbGggnKR
	 sEwUfMu79iDNNPijVqKKMZZ38hVrTbIZtasTQsMx7cDkqgOPlUgwmZ5Z5WwTjS+PaU
	 dgu5mqiikQLztJJUHATvyawoseQneFNENrevTsLt9wyzgnuKHzpu/jnN06NbuL5GCb
	 q51e5wHzXLOPA==
Date: Mon, 20 Jan 2025 05:19:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: jassisinghbrar@gmail.com
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, conor+dt@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Subject: Re: [PATCH v6 0/4] Add Microchip IPC mailbox
Message-ID: <20250120121955.GA3525889@ax162>
References: <20241217113134.3508333-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241217113134.3508333-1-valentina.fernandezalanis@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_042002_767081_48A2D6BB 
X-CRM114-Status: GOOD (  15.84  )
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

Hi Jassi,

On Tue, Dec 17, 2024 at 11:31:30AM +0000, Valentina Fernandez wrote:
...
> This series adds support for the Microchip Inter-Processor Communication
> (IPC) mailbox driver.
...
> Valentina Fernandez (4):
>   riscv: sbi: vendorid_list: Add Microchip Technology to the vendor list
>   riscv: export __cpuid_to_hartid_map
>   dt-bindings: mailbox: add binding for Microchip IPC mailbox controller
>   mailbox: add Microchip IPC support

I see this series is now in next-20250120 but you only applied patches 3
and 4, so the build is broken:

  In file included from drivers/mailbox/mailbox-mchp-ipc-sbi.c:22:
  drivers/mailbox/mailbox-mchp-ipc-sbi.c: In function 'mchp_ipc_sbi_chan_send':
  drivers/mailbox/mailbox-mchp-ipc-sbi.c:29:42: error: 'MICROCHIP_VENDOR_ID' undeclared (first use in this function)
     29 |                                          MICROCHIP_VENDOR_ID)
        |                                          ^~~~~~~~~~~~~~~~~~~
  arch/riscv/include/asm/sbi.h:436:56: note: in definition of macro 'sbi_ecall'
    436 |                 __sbi_ecall(a0, a1, a2, a3, a4, a5, f, e)
        |                                                        ^
  drivers/mailbox/mailbox-mchp-ipc-sbi.c:121:25: note: in expansion of macro 'SBI_EXT_MICROCHIP_TECHNOLOGY'
    121 |         ret = sbi_ecall(SBI_EXT_MICROCHIP_TECHNOLOGY, command, channel,
        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  drivers/mailbox/mailbox-mchp-ipc-sbi.c:29:42: note: each undeclared identifier is reported only once for each function it appears in
     29 |                                          MICROCHIP_VENDOR_ID)
        |                                          ^~~~~~~~~~~~~~~~~~~
  arch/riscv/include/asm/sbi.h:436:56: note: in definition of macro 'sbi_ecall'
    436 |                 __sbi_ecall(a0, a1, a2, a3, a4, a5, f, e)
        |                                                        ^
  drivers/mailbox/mailbox-mchp-ipc-sbi.c:121:25: note: in expansion of macro 'SBI_EXT_MICROCHIP_TECHNOLOGY'
    121 |         ret = sbi_ecall(SBI_EXT_MICROCHIP_TECHNOLOGY, command, channel,
        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  drivers/mailbox/mailbox-mchp-ipc-sbi.c: In function 'mchp_ipc_sbi_send':
  drivers/mailbox/mailbox-mchp-ipc-sbi.c:29:42: error: 'MICROCHIP_VENDOR_ID' undeclared (first use in this function)
     29 |                                          MICROCHIP_VENDOR_ID)
        |                                          ^~~~~~~~~~~~~~~~~~~
  arch/riscv/include/asm/sbi.h:436:56: note: in definition of macro 'sbi_ecall'
    436 |                 __sbi_ecall(a0, a1, a2, a3, a4, a5, f, e)
        |                                                        ^
  drivers/mailbox/mailbox-mchp-ipc-sbi.c:134:25: note: in expansion of macro 'SBI_EXT_MICROCHIP_TECHNOLOGY'
    134 |         ret = sbi_ecall(SBI_EXT_MICROCHIP_TECHNOLOGY, command, address,
        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  drivers/mailbox/mailbox-mchp-ipc-sbi.c: In function 'mchp_ipc_probe':
  drivers/mailbox/mailbox-mchp-ipc-sbi.c:29:42: error: 'MICROCHIP_VENDOR_ID' undeclared (first use in this function)
     29 |                                          MICROCHIP_VENDOR_ID)
        |                                          ^~~~~~~~~~~~~~~~~~~
  drivers/mailbox/mailbox-mchp-ipc-sbi.c:420:35: note: in expansion of macro 'SBI_EXT_MICROCHIP_TECHNOLOGY'
    420 |         ret = sbi_probe_extension(SBI_EXT_MICROCHIP_TECHNOLOGY);
        |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Can you please fix this? It is a little frustrating this is happening
just as the merge window opens...

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
