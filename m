Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD51C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 04:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n//aFUuegCz2TuyfXaq11STHcuIwlO1fG4cSKEL15g4=; b=xtV2rl2YmV4+PE
	aDCmcLvEVHgzidRWhpmmh/NEg8kyWKUBPC55i34o5D3SRc4u7KN5bQsrl/z7Qo9bAgxxmu7vZ66j0
	I4gadfMOsjccozAs+QhmLVeY/kCoKm76XYk2rT08d16PEa2uz0YgVSTQ8yXrRyWHNOsjmy1pxJ/aS
	pFPdiiM+pngH/e18TpFJ3ntuzU3vE9b0KjraBPa7TBQSGKtBTgLsMTSygAhvZ1ZM8AbxlEgBAJjXO
	717IIj2bYdwN9BetzYZI6zRnTep0ItnDp4bXmc1vjl4+ZQuW+4QxseKjePja+YrNSP9MdfxbdumEX
	x1wwqs0aihF1KNLuVlyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfDsY-008OPK-Li; Fri, 15 Apr 2022 04:48:18 +0000
Received: from smtp83.cstnet.cn ([159.226.251.83] helo=cstnet.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfDsU-008ONH-HJ
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 04:48:17 +0000
Received: by ajax-webmail-APP-09 (Coremail) ; Fri, 15 Apr 2022 12:47:22
 +0800 (GMT+08:00)
X-Originating-IP: [124.16.96.42]
Date: Fri, 15 Apr 2022 12:47:22 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5r2Y5bqG6ZyW?= <panqinglin2020@iscas.ac.cn>
To: "Anup Patel" <apatel@ventanamicro.com>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, 
 "Paul Walmsley" <paul.walmsley@sifive.com>, 
 "Alexandre Ghiti" <alexandre.ghiti@canonical.com>, 
 "Atish Patra" <atishp@atishpatra.org>, 
 "Alistair Francis" <Alistair.Francis@wdc.com>, 
 "Anup Patel" <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 "Mayuresh Chitale" <mchitale@ventanamicro.com>
Subject: Re: [PATCH] RISC-V: mm: Fix set_satp_mode() for platform not having
 Sv57
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2022 www.mailtech.cn cnic.cn
In-Reply-To: <20220412033335.1384230-1-apatel@ventanamicro.com>
References: <20220412033335.1384230-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Message-ID: <4c4c7a.17284.1802b8c14cc.Coremail.panqinglin2020@iscas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: swCowADX38_b+FhiWqMBAA--.17675W
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiCQoRDF02bFOQ6AAA
	sy
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_214814_985298_B213392D 
X-CRM114-Status: UNSURE (   4.40  )
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

Hi Anup,

&gt; 
&gt; When Sv57 is not available the satp.MODE test in set_satp_mode() will
&gt; fail and lead to pgdir re-programming for Sv48. The pgdir re-programming
&gt; will fail as well due to pre-existing pgdir entry used for Sv57 and as
&gt; a result kernel fails to boot on RISC-V platform not having Sv57.
&gt; 
&gt; To fix above issue, we should clear the pgdir memory in set_satp_mode()
&gt; before re-programming.
&gt; 
&gt; Fixes: 011f09d12052 ("riscv: mm: Set sv57 on defaultly")
&gt; Reported-by: Mayuresh Chitale <mchitale@ventanamicro.com>
&gt; Signed-off-by: Anup Patel <apatel@ventanamicro.com>
&gt; ---
&gt;  arch/riscv/mm/init.c | 1 +
&gt;  1 file changed, 1 insertion(+)
&gt; 
&gt; diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
&gt; index 9535bea8688c..b0793dc0c291 100644
&gt; --- a/arch/riscv/mm/init.c
&gt; +++ b/arch/riscv/mm/init.c
&gt; @@ -718,6 +718,7 @@ static __init void set_satp_mode(void)
&gt;  		if (!check_l4) {
&gt;  			disable_pgtable_l5();
&gt;  			check_l4 = true;
&gt; +			memset(early_pg_dir, 0, PAGE_SIZE);
&gt;  			goto retry;
&gt;  		}
&gt;  		disable_pgtable_l4();
&gt; -- 


I find it that the set_satp_mode function is in .init.text section which begins at 0x80800000.
And its pgd_index in both Sv48 and Sv57 will be 0. So it may not be necessary to clear the 
early_pg_dir when the kernel find Sv57 is not supported? And may I get the steps of reproduction
from you?
 
Yours,
Qinglin
</apatel@ventanamicro.com></mchitale@ventanamicro.com>
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
