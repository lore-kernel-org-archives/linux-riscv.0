Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12524C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 21:47:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6BC820693
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 21:47:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nO3m5Jgw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="Qp/vUUcL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6BC820693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=265LYrJAAC5w2p2fYmQxEs1+rlkKHrJDKMGJvgGMjuc=; b=nO3m5JgwQ6Dyo/
	LR1ELowgHA9hMeDGfCTCfKZ/2MF2lv+YGy7zLdPr3SXhDbz8vXqZ8EOBjvdJdYbGRK2OmIoqZrDZ/
	ro9uuTBc6B6UpGB0n8Hbo8LSE1LoZ9NaNF7DNrW/dYPSiAqOurb2xf/U096pQJrhTJXrEFw3nNXH/
	zHahIoqdWb+7hZUABG+Bsf72r/TOzIW2/l+hroBDK8JyZ0KFOF7SQGSpN8/3ZoR26H1qN04EaXx9l
	ZXckogj8IcSECppuLWgbYCFQoKdeWbhYYNxb5EPkYNrta1nBjaSVdFqhlrZLSWz5swmgw3KiltbDO
	s6Hk0SE+h8myVGcVAQuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8XRX-00006B-I8; Mon, 25 Mar 2019 21:47:43 +0000
Received: from mail.skyhub.de ([5.9.137.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8XRU-00005E-CA
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 21:47:42 +0000
Received: from zn.tnic (p200300EC2F098000329C23FFFEA6A903.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f09:8000:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 94C561EC0428;
 Mon, 25 Mar 2019 22:47:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1553550450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=N2kG+OvDK53RnL3J3VC/ntnRTrFWxo/9muYMeT6SK4A=;
 b=Qp/vUUcLUTJcf4ZPZKWTXI4D1N/hQ//kZcbvWHk79ZYv/9fuStKmKyPWoPZZ1rYquuoAOF
 jd7W0bRxYQx6ur8eiEgQZmUhiuisc4IdLw/AW6DpUZT+9T9fQjC8QvLrkDfQ1p91zZpkpZ
 oDLfzhe931LwIkp2y9srY+5XoLtk6tM=
Date: Mon, 25 Mar 2019 22:47:31 +0100
From: Borislav Petkov <bp@alien8.de>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 2/2] sifive: edac: Add EDAC driver for Sifive l2 Cache
 Controller
Message-ID: <20190325214731.GT12016@zn.tnic>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
 <1552382461-13051-3-git-send-email-yash.shah@sifive.com>
 <20190312092842.GC28589@zn.tnic>
 <alpine.DEB.2.21.9999.1903241705460.8028@viisi.sifive.com>
 <20190325065453.GC12016@zn.tnic>
 <alpine.DEB.2.21.9999.1903251211190.8028@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1903251211190.8028@viisi.sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_144740_602316_9AE736A1 
X-CRM114-Status: GOOD (  11.86  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 palmer@sifive.com, linux-kernel@vger.kernel.org,
 Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org,
 linux-riscv@lists.infradead.org, mchehab@kernel.org,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 25, 2019 at 02:18:39PM -0700, Paul Walmsley wrote:
> All of these drivers are for single IP blocks.  Mostly DRAM controllers.
> There's no "platform EDAC manager" IP block in these cases.

Maybe because they have RAS functionality in one single IP block. Others
like altera_edac, for example, have added support for more IP blocks
with time.

> So the EDAC "platform," if there is one, would be Xilinx Zynq, not
> Synopsys.

We have IP blocks sharing between drivers, see fsl_ddr_edac and
skx_common, for example.

> 2. We could create a platform driver for the "SiFive FU540-C000 EDAC"
> reporting platform that wouldn't map to any hardware block, but
> would call functions exported by other sources of EDAC data - most
> likely drivers living in separate directories. If, for example, we
> wind up using a Synopsys memory controller in a future product, we
> move the Synopsys code into a separate library, and move the Xilinx
> Zynq-specific code into a zynq_edac driver, etc.

Yes, librarizing is something we do already. So if you wanna share IP
blocks with other vendors, you can abstract it out into compilation
units like in the examples above. And then those compilation units can
be linked into a platform driver.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
