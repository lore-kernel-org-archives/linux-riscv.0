Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DB1C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 14:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ph9KW9Pzzp2r2iz+qOGXQ1DoUIYF/clPFDS07mNbg4w=; b=OwAb7lCFAHYtvj
	1i3sQcjj2M4Lh56tgvmjAwtRv4IVC2do7SoBlk5xO01aaCUvQ8qYT6nJzROEx7nq1CkFtXi95amkp
	7C4IJleBZRy3fryShXs/rU64+vEFozbCj+3TD1AYPFcVc3/We5JZD2vN4CQYYk00+7QSNXHXeM+in
	3JerNM+7+JJaLtDkSsy97diADLCMs3fxlN49kubNV1/SZMLTD1smUQCx5QjZ4iccAS2x1M2TnnlHS
	kHRqpo+5txL97t6vNJdY1C/R087LUyl+RiG2pYskHFzQTQ7RqP5rtNPdCPtOv8HOZ0ViC2CYzKPxK
	QEeJuf3zFv0xhZPogBDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OJO-00H13y-HY; Wed, 30 Nov 2022 14:43:46 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OJL-00H124-GQ
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 14:43:44 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p0OJJ-0002bh-3i; Wed, 30 Nov 2022 15:43:41 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, philipp.tomsich@vrull.eu, ajones@ventanamicro.com, emil.renner.berthing@canonical.com
Subject: Re: [PATCH v2 07/13] RISC-V: add auipc elements to parse_asm header
Date: Wed, 30 Nov 2022 15:43:40 +0100
Message-ID: <4939709.aeNJFYEL58@diego>
In-Reply-To: <Y4aXbBGT346eo/qG@spud>
References: <20221128102632.435174-1-heiko@sntech.de> <20221128102632.435174-8-heiko@sntech.de> <Y4aXbBGT346eo/qG@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_064343_591044_419ABF6F 
X-CRM114-Status: GOOD (  13.08  )
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

Am Mittwoch, 30. November 2022, 00:36:12 CET schrieb Conor Dooley:
> On Mon, Nov 28, 2022 at 11:26:26AM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > RISC-V: add auipc elements to parse_asm header 
> 
> This header is no longer called parse_asm ;)

With this commit moving more in front, the naming fits again ;-)


> > +__RISCV_INSN_FUNCS(auipc, RVG_MASK_AUIPC, RVG_MATCH_AUIPC)
> >  __RISCV_INSN_FUNCS(jalr, RVG_MASK_JALR, RVG_MATCH_JALR)
> >  __RISCV_INSN_FUNCS(jal, RVG_MASK_JAL, RVG_MATCH_JAL)
> >  __RISCV_INSN_FUNCS(c_jr, RVC_MASK_C_JR, RVC_MATCH_C_JR)
> 
> This fixes the build error that's been lingering for a few patches, so
> please re-order things so as not to break bisection :)
> 
> With the nits above fixed & assuming that this survives as its own
> commit:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

I've moved it more in front now and reworded the commit message
a bit.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
