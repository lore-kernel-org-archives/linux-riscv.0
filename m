Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084AEC64EC4
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 23:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zE7juIouGdmqAJ8bOceUGsHsmCII1Wq2yMAIVM+hUkc=; b=CGBSUaBxtzcQh2
	Fd+8c1YxFPRuAcsTRSsf+GY3WFtXvWvfDpZaN33W7IExo/i6Gkb9EtOZrIorvP00OKcrEFPl5KsU3
	aJHyoREZMpZWfhSnccAtQ7vbHH+8rbQaGondqMdbFqVC4YrlJYeB0QdmscqV0V0QmiSXrH5IMWpiZ
	2mbBvKUzoqiCBMunhobadTx39n3t2xb8++UMu67PSdWq73VkopYCxOq8hn2O6cl/iT+xjAyYyIlVn
	EIUmf65GCO2f7NB45IRWT+mOdsUXE4XUZF6BuJJXbdM1TDtBokAb94eIe/6u8HmvfUcwpPerkadbq
	rmThbpgiTy/usl/9g8rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPtq8-00HBON-4p; Wed, 08 Feb 2023 23:27:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPtq4-00HBNu-Mf
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 23:26:58 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pPtpy-0003au-UI; Thu, 09 Feb 2023 00:26:50 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: palmer@rivosinc.com, Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 christoph.muellner@vrull.eu, ajones@ventanamicro.com
Subject: Re: [PATCH 1/2] RISC-V: fix ordering of Zbb extension
Date: Thu, 09 Feb 2023 00:26:50 +0100
Message-ID: <2135493.irdbgypaU6@diego>
In-Reply-To: <C32D5495-F772-4887-9CAD-66206ECCFC3F@kernel.org>
References:  <20230208225328.1636017-1-heiko@sntech.de>
 <20230208225328.1636017-2-heiko@sntech.de>
 <C32D5495-F772-4887-9CAD-66206ECCFC3F@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_152656_787297_EAE2DAC2 
X-CRM114-Status: GOOD (  16.14  )
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

Am Donnerstag, 9. Februar 2023, 00:20:10 CET schrieb Conor Dooley:
> Hey Heiko,
> 
> On 8 February 2023 22:53:27 GMT, Heiko Stuebner <heiko@sntech.de> wrote:
> >From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> >
> >As Andrew reported,
> >    Zb* comes after Zi* according 27.11 "Subset Naming Convention"
> >so fix the ordering accordingly.
> >
> >Reported-by: Andrew Jones <ajones@ventanamicro.com>
> >Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> The whole "getting it wrong immediately after fixing it up" ;)
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

I'm still hopefully that I'll learn at some point that "b" comes after "i",
at least with riscv extensions. Decades of sorting the other way around are
hard to break :-D .

> >---
> > arch/riscv/kernel/cpu.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> >index 420228e219f7..8400f0cc9704 100644
> >--- a/arch/riscv/kernel/cpu.c
> >+++ b/arch/riscv/kernel/cpu.c
> >@@ -185,9 +185,9 @@ arch_initcall(riscv_cpuinfo_init);
> >  * New entries to this struct should follow the ordering rules described above.
> >  */
> > static struct riscv_isa_ext_data isa_ext_arr[] = {
> >-	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> > 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> > 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> >+	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> > 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> > 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> > 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
