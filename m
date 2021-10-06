Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1280DC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 08:31:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7C1B610EA
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 08:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7C1B610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H42ZFNl34feXD10YrOG2ApkYXFmWt05Azlfvy+qedyM=; b=W4WC5Ad+rD5to3
	/VLoh30m9zF9DFza21f21TaG1Z77PpAYOx2/oelanzTaxak69pUKqKrpcZ06uAqh6GTFCPsuUJbeO
	kgmPE2vFeMRTGylpUgRwZVxwj/2HLEFhqhqxZwBMbUWlsPNYbrFmHE2IlHY6TXwS23CDpxSON/b91
	4qSewFOtAlqCgKYMHDIgsz2Rkx8tdNvSHdTy4rcbGPKH29zi9g48Izfd2z/qSzAHV+EAWRHmcYoEK
	VcaY+8SQHQ4JdkhBhiXpoSbubfRkHIuF9eimpq765MSIs12tVzdUCDbXum1HXHkQ2qmAAwurdSbg1
	gkkpwQmx/4rWUsSL57tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mY2K2-00DTZb-QF; Wed, 06 Oct 2021 08:30:42 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mY2Jp-00DTW3-MM; Wed, 06 Oct 2021 08:30:31 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1966TObt019907; 
 Wed, 6 Oct 2021 03:29:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=VYqS9ly4HxjYNM8Rb95ALzINC4C51eNq0bBG/A9hunw=;
 b=o0LXPBg9O/lVVWpIotmtJzmIjT495DOgkYZo/xT0o0i+AqnVpPm5nRqb8f3PGAj/azpd
 h0JZ2ctVu9fICGPR9SG2SJjA6HtyX4QQ5POth+QmzSNU/aFWEa/yo2lqqnQLbr2jrMD+
 4QQr6ELWHy6H0pnSSwQUSyHy9zkLeI9Rg6QinhB+SAW1Xtwp6Fhtw/y+lw2zJCwtkIcx
 08ZcykFEw6P4IvGY7ZAsHMXqN43Q+ZitP8gEI4RihERP7P4lgxtl2jhqNZdRnWoCdBqe
 yjj/gzmuX3FFtBmBtG0nVFurJXrDAPkHnj/TDTPyJxd9kyQuYnZR38ZzUz/v04lA1dgm YQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3bgrreh1qv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 06 Oct 2021 03:29:27 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Wed, 6 Oct
 2021 09:29:25 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Wed, 6 Oct 2021 09:29:25 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 47AB6B13;
 Wed,  6 Oct 2021 08:29:25 +0000 (UTC)
Date: Wed, 6 Oct 2021 08:29:25 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Simon Trimmer <simont@opensource.cirrus.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Russell King <linux@armlinux.org.uk>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Paul
 Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Andrew
 Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-ia64@vger.kernel.org>, <linux-mips@vger.kernel.org>,
 <linux-parisc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/2] firmware: include drivers/firmware/Kconfig
 unconditionally
Message-ID: <20211006082925.GK9223@ediswmail.ad.cirrus.com>
References: <20210928075216.4193128-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210928075216.4193128-1-arnd@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: cBaf488JNMuKplb9_5hsQVXi838DWVHi
X-Proofpoint-GUID: cBaf488JNMuKplb9_5hsQVXi838DWVHi
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_013029_877402_367C4CED 
X-CRM114-Status: GOOD (  21.45  )
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

On Tue, Sep 28, 2021 at 09:50:26AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Compile-testing drivers that require access to a firmware layer
> fails when that firmware symbol is unavailable. This happened
> twice this week:
> 
>  - My proposed to change to rework the QCOM_SCM firmware symbol
>    broke on ppc64 and others.
> 
>  - The cs_dsp firmware patch added device specific firmware loader
>    into drivers/firmware, which broke on the same set of
>    architectures.
> 
> We should probably do the same thing for other subsystems as well,
> but fix this one first as this is a dependency for other patches
> getting merged.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
> Cc: Simon Trimmer <simont@opensource.cirrus.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
