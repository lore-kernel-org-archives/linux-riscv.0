Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FD5C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 07:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SyePCLH05K8OzJKYZi3c/6TX9hHB2f5gF/vb/W01GtI=; b=fmCNi5kREcSR+H
	CGYdMax2vw9zvL291VeneiLCk6s0d4rVJUDOTuKZyZEX45/XXiAyAjyTfVHMWrdKzfYM2WfB0RgzF
	/GB0Z4w8osbRfgmC32knOqx1xld8cjwN0GJ258IPxZ/pMbygvH6Byr1XLjtdljJxAKGg3BOqUZH6g
	DBu+Ux3TBfd1ZKO8gEJ8KuhejJzdWmnrbrPmcltbwXUxB6grHoFPUyetOldnDMwYmh73mhZ7yLJ0H
	avmC6/BLEsbZru3XW7fyaeFlg0Fqm6lrYFtdcbueQof9saxg3RBqDuljIyDTI9346Z5kdUy9Tr015
	ucxZmF2sysUgVao/+wRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osJ15-003QtI-0d; Tue, 08 Nov 2022 07:27:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osJ11-003Qse-JA
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 07:27:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1667892443; x=1699428443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6Vt3J4Mn7GkFJJO5BFUFxQ3kzvBVb6hwR7aE8anuX8s=;
  b=ne6g88SOq7BvDYqHxwLeCrNw5wnBaWzskDY9TAY+A+OhEqbUdmvm1ueh
   8PpInRhrOmij89j7u75HAn+F4H/Rty3MDqPYbaDN+WWdXTasr2vBrwXIx
   LuUF3CWIR+itFNqneZMku0eIE8JkCwelzU6vV9PkYeOdxCPYHaJSobe6W
   2wpV2kB2QaZXhcH3Dlnsadzj0i1+GDxqHjiDDZCaK3xuBKLqTZ7oWdcRb
   U+DSP8IcOMc/24Ofr6i0ya0B1y5x6rU403+JUsj8ay/jL/AByo30WHyYz
   LS771HIuKufVm/gNLYsltKOyHg77eWuvepqXUbTemERUVYrxeYm509XOu
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="198854919"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2022 00:27:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 8 Nov 2022 00:27:19 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 8 Nov 2022 00:27:17 -0700
Date: Tue, 8 Nov 2022 07:27:01 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Evgenii Shatokhin <e.shatokhin@yadro.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Daire McNamara
	<daire.mcnamara@microchip.com>, Anup Patel <anup@brainfault.org>, Atish Patra
	<atishp@rivosinc.com>, Nick Kossifidis <mick@ics.forth.gr>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Valentina
 Fernandez" <valentina.fernandezalanis@microchip.com>
Subject: Re: [PATCH v1] riscv: fix reserved memory setup
Message-ID: <Y2oExSUbPoziPyjt@wendy>
References: <20221107151524.3941467-1-conor.dooley@microchip.com>
 <497c057d-4e7d-0dcb-fd4c-2c7ef6efb573@yadro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <497c057d-4e7d-0dcb-fd4c-2c7ef6efb573@yadro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_232723_660614_309A2FAC 
X-CRM114-Status: UNSURE (   9.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 08, 2022 at 12:40:19AM +0300, Evgenii Shatokhin wrote:
> Hi,

> Thank you for looking into this!
> 
> As I wrote earlier, I ran into this issue too, while working on a remoteproc
> driver for our RISC-V-based SoC.
> 
> The proposed patch fixes the bug for me and seems to have no problematic
> side-effects. So:
> 
> Tested-by: Evgenii Shatokhin <e.shatokhin@yadro.com>

Apologies for forgetting to add the T-b tag & thanks for re-sending it.
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
