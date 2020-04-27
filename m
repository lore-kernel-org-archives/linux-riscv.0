Return-Path: <SRS0=Khb+=6L=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC14C54FD0
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2020 07:50:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29647206B6
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2020 07:50:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sj7dzuRg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXWldtU0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29647206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nLVt4b+fM32Gwld7JwALzjuEAPd9/bc0f48gQAJLLOA=; b=Sj7dzuRgmPDCRk2nQoIPS7qtB
	LHs7lZMCUb4KlDGCE7DfOtq9ywPcO2wBVF3pN0RJAGsY9EI5p2/eurBIbSFgiA1+HoBIRaORm5YG2
	HxPkeWRnu7PPCXZspbhJ7MT4/3DUpo7tu797Z+OGQXxy5NP4RMApBfprwqysd4xXJNVuAy35Hp/iT
	ND4hcuubFckNjpoqXckH5lMQPw1poLuTmsP+a3I5Og0+e8lZSvd/7uzkt3Qui2s5V1j+zhytNRKge
	p42uTDRRFzQhOgyJTh5yPU2KVjbl6bajMdjmiseG4v87gfZsdAvXpb4waG6IReTDXA43w4G69hE0A
	9Zt75ARXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSyWx-00076U-AA; Mon, 27 Apr 2020 07:50:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSyWK-0004F0-E4; Mon, 27 Apr 2020 07:49:41 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ABACA206B6;
 Mon, 27 Apr 2020 07:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587973780;
 bh=/8brvwQoEX2EnJSv6s+0ZBz9o81uCnXLIWCUSBACy34=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XXWldtU0yIsdIb51ZeaGkI+YsJ1FlbG49AyQHS3oEZgGmj7s3bCk0di1gzcww/GQn
 eBjh7vgXsm2OgAvkbxmRGsFdBN2DqTIXOlEtLRiSFkAGKaLiSSjLnnsTAGN3EkEr0h
 wWXP6s+LUDwPK7gCoxbl50U3M3XheUkHvdEnWYqM=
Date: Mon, 27 Apr 2020 08:49:34 +0100
From: Will Deacon <will@kernel.org>
To: Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH 4/4] arm64: mm: use ARCH_HAS_DEBUG_WX instead of arch
 defined
Message-ID: <20200427074933.GB11787@willie-the-truck>
References: <cover.1587455584.git.zong.li@sifive.com>
 <e19709e7576f65e303245fe520cad5f7bae72763.1587455584.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e19709e7576f65e303245fe520cad5f7bae72763.1587455584.git.zong.li@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_004940_513990_292BACB2 
X-CRM114-Status: UNSURE (   9.30  )
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
Cc: tglx@linutronix.de, catalin.marinas@arm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, mingo@redhat.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, bp@alien8.de,
 akpm@linux-foundation.org, hpa@zytor.com, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Apr 21, 2020 at 04:17:15PM +0800, Zong Li wrote:
> Extract DEBUG_WX to mm/Kconfig.debug for shared use. Change to use
> ARCH_HAS_DEBUG_WX instead of DEBUG_WX defined by arch port.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  arch/arm64/Kconfig       |  1 +
>  arch/arm64/Kconfig.debug | 29 -----------------------------
>  2 files changed, 1 insertion(+), 29 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

