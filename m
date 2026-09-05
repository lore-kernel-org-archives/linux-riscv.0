Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9FBC79F82
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2026 00:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w7kT/l/2gPkG/YDmLhn+geqZc3OEIke36ATtMSuyo7c=; b=UHczO3guEy4HHg
	K/6lCjoXyd6QDv0FNXKs58kqo15KAXIsZu2QEQgHidO2vccADEMma0h+kUBihwASB4FjjXNbASZpg
	g3CmKEQck13Xd7Xlv+9/8iND33ckdUVFOPMRK4U3hZVIy6mOsqg/FjdTwvHVhQ9j4VBAMnCw13awf
	ydcPk25ouQWQrdEfRpLwS8PSZKS8W9WRGIGT8B/ZaczAgnAJ1Jgc+um0bZD2weNLz3kx1y4g/zCKf
	hZGPlWn6XGWlo+7yXTZEoyYJaV6nQD5rGDdpj2rS7WuFlnP1Fx81qns15XxdXp8XZkAkROw5Eqv4Y
	sPm7iS46iusEAHn1txRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2eYY-00000003Wpz-0AnF;
	Sat, 05 Sep 2026 00:46:54 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2eYV-00000003Woq-0VVb;
	Sat, 05 Sep 2026 00:46:52 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 46CE9C2AEE;
	Sat,  5 Sep 2026 03:46:41 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 46CE9C2AEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1788569202;
	bh=SwCh9Ld1JOdq2P1NYMKZndipV6XqTb9tvIWRkfYlK6g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=J96grHf2SOphrttK7FzcYLqiA882B2VNzMTii/hBrr345ASQqtHBDMTUkvNbT0aUA
	 4yDthPWWcLTeGrku7JDU0pwaDBud41inkc+RmsRtNv1pRD15x0h+q6Gdf53gTzFp65
	 9UCizr98DRVRJO9s6gaxjpiCKTvTiQLk4L2MCqOYHIyT7B7cCxhsRtQ3RknxubG2j8
	 BcEUtlmnCW9aS0py3srFk6Jyy2V4/3PhaOGzuhpE0vS+vo58SweQpT7lgP7ttuJeLU
	 wCqFvdPNK8iQepfVzwjkdmFv9MV9X4V1clIWRO1fugv6NfcpsjocyLDsKrHC5fUTsK
	 lWwk0eHh3uHDQ==
Message-ID: <bca904b69fbdb2a0bfa7afb1e3fd055184fa87b5.camel@rendec.net>
Subject: Re: Interrupt chip driver maintainence
From: Radu Rendec <radu@rendec.net>
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Paul
 Walmsley <pjw@kernel.org>
Date: Fri, 04 Sep 2026 20:46:38 -0400
In-Reply-To: <871pb9841j.ffs@fw13>
References: <871pb9841j.ffs@fw13>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_174651_504435_3B771DBB 
X-CRM114-Status: GOOD (  14.94  )
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

On Fri, 2026-09-04 at 16:49 +0200, Thomas Gleixner wrote:
> I'm wading through my inbox full of patches for interrupt chip drivers
> and I'm thoroughly annoyed. The way how this works today is not
> sustainable.
> 
> Patches end up in my and Radu's inbox and all we can do is go through
> them mostly on a formal basis, but it's out of our scope to look at the
> correctness vs. a particular hardware. In the past I just picked up
> patches when I had the gut feeling they are remotely correct, but I'm
> tired of this.
> 
> I've just marked about 20 patches and patch series obsolete due to zero
> feedback from the relevant architecture/SoC people who were on Cc.
> 
> And I'm going to do that from now on very consequently. If the
> architecture, SoC experts can't be bothered to look after their stuff,
> then don't expect me to suck all of this crap up and then deal with the
> complaints when it breaks.
> 
> I'm still going to pick up obvious and simple bug fixes, but for
> anything which requires deep knowledge on the underlying hardware, I'm
> going to just mark them obsolete when they molded in my inbox unreviewed
> by the people who understand it for six weeks.

I think that's fair!

For what it's worth, as a simple reviewer, I also consciously ignored
multiple patches that required knowledge of the hardware, simply
because I didn't have that knowledge.

-- 
Best regards,
Radu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
