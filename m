Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516EAC6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 17:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rDTkOm6ruH4s74/468I4sH1iKQOuT169TvhsSzbxAWo=; b=ZjLxTetosEERKN
	v3i7+6vK6TQExzD9T6DN8DRbl4JKMFqtBqxe0A9/vh46bwLUX+Yx+fGpWMi7Pife1LUQ0Arn5T0YR
	WqM5YdvpsHiAIxvKZrHamgI6Ahuq2rjKiWdl+Z5rvtKMb1Ef0ddKKFnCvkWnm7ESt/G8dCQAGn9hQ
	1ILotPH0iN8iDwUEdEneZlesovH3rxLA2lqRGI7VegDYarJba/SixDsChB+y7Od5A6UVWtaGmbcYm
	2W0YltCBDTZqND60a71nyIBMmtG61QEJpDS5Rg7EGDcFO2Noln6X43qslIKLo/CBAQQLHHsrmm1z9
	7/5dGqAVpAFtafzMbigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpACD-00000005cGf-3UIF;
	Tue, 26 Mar 2024 17:02:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpACA-00000005cEF-1NLg
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 17:02:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9C1C3CE0AC3;
	Tue, 26 Mar 2024 17:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8936DC433F1;
	Tue, 26 Mar 2024 17:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711472559;
	bh=roKL18Iq6vEkeHwH/EmIDwPxZ0jMl/Uc5dYGgsfMSO4=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=PUc5lWG6y39nmrM45vLSsOBbCL4CcdaA+LLN2nagKsdktRigY3tIilFdMWrdn9zXV
	 TvJ9HQEgMnZS/vvz6R/NKKoog/u/LDZ2FpoyzvuJ0qVLk7LQbKVcutHzM0EeyjTNYv
	 jCgdCnkLv5DxUqY1d31ztmUZDB/jPuLlED0ADog9NSzHg25zYzCirF/cDZCNI668vk
	 g3kD+QVXmilX0K610SW1kxN1kV7GViAQ/uaMXHyoWRftQKD443K96LqGf3RFs9kHMq
	 BuT9lK7yHN4Z8vrA4rNjwx+ghcXLh9SO/gT+PUFImATK/osoVVOfJWsW87JMY79qdq
	 66RCM0Vsebosw==
Mime-Version: 1.0
Date: Tue, 26 Mar 2024 19:02:35 +0200
Message-Id: <D03UDXV4OKIK.5HOOVU4LDW5D@kernel.org>
Cc: <linux-riscv@lists.infradead.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, <linux-modules@vger.kernel.org>, "Naveen
 N . Rao" <naveen.n.rao@linux.ibm.com>, "Anil S Keshavamurthy"
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH v5 1/2] kprobes: textmem API
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Masami Hiramatsu" <mhiramat@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240325215502.660-1-jarkko@kernel.org>
 <20240326095836.f43d259b7747269a7c0b9d23@kernel.org>
 <D03AL7A5G3M2.3UK4ASWILGBJS@kernel.org>
 <D03B7XJYRFC1.2L3I2TO5HNQD3@kernel.org>
 <D03PM9A6IS79.3D6BW7KBLH9C3@kernel.org>
 <20240327000520.ec13b2646ed1cd621e5b1d9d@kernel.org>
In-Reply-To: <20240327000520.ec13b2646ed1cd621e5b1d9d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_100242_569233_13025A61 
X-CRM114-Status: GOOD (  10.29  )
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

On Tue Mar 26, 2024 at 5:05 PM EET, Masami Hiramatsu (Google) wrote:
> > According to kconfig-language.txt:
> > 
> > "select should be used with care. select will force a symbol to a value
> > without visiting the dependencies."
> > 
> > So the problem here lies in KPROBES config entry using select statement
> > to pick ALLOC_EXECMEM. It will not take the depends on statement into
> > account and thus will allow to select kprobes without any allocator in
> > place.
>
> OK, in that case "depend on" is good.

Yeah, did not remember this at all. Only recalled when I started to
get linking errors when compiling just the first patch... It's a bit
uninituitive twist in kconfig :-)

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
