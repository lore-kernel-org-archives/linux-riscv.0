Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBE9CCD185
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 21:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xexU+v0nGBCK3fEth0aGvxVWG4/pInTMKOINY7Sja8=; b=RftqOkpKd0yrRf
	MS8s09ftBc/jQ+iOHRxNDWCgnKrSjJQCve1RFKDrL75Wy11+FGupRqkuOhSp3YhiHwCSVDUCkJhYJ
	u7mZmgJQgm8/QNYno8xo+KhfKB+8b7Hco9MmhG9hjds4sj4nzeNdy9nLgvieTz0Zmx7US+gf3ZsqB
	fjsXhBaXDi8SWEXCuQVAAO12/M6ivv7zweKXBBY50fpMmvtVcuD99RGJYJivE4V30Zg4HPisBbWyC
	jBE8yOOm/+MNWfC6oWpwlsQrWjEOdPFcY7xKgqMgw5pvlmBrGPQapTXqlMFBU3m0KL1q86aMDv9av
	XKZUaO2kiKqUaT5ob3vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7L5p-00000009R9Z-1mvA;
	Fri, 10 Oct 2025 21:56:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7L5m-00000009R8n-3avP
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 21:56:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DC5349D4C;
	Fri, 10 Oct 2025 21:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BB6C116B1;
	Fri, 10 Oct 2025 21:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760133362;
	bh=t46kjDiMah/zekXRjDSdXOUOoGpyx+/Cr/l+MUXLY2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JjIavNT6UwXft3fPGYaDZegvMKYz7k1JTExmOJxuY2GHFkxK3+P1IF43CEAgpsW8r
	 B9vhEvi8TGbAcG2tlmWcIvRf0JDg5Da9goDcUmaqveQx1c8JPyqYojIXAHjpIRdKUR
	 nsKDBzD/vYVXCxfJ1nin7+bADQwh1MO8lWoSqp6SVgbNhdDtMrZuIAT6wC0czf9rP1
	 LJazopt5R6e0qzH9j1ETdj1Db2ig1vzyozO7zToh3qL2QUDQf52M13GMRfLqcZvkZA
	 fGcsyhxLrid9YbehH7WfhnQOQb9udnaBlMsQf6BkC2ShRCY9S9dGNqX8+NB0SriV+O
	 W2FnDW5kd7cGQ==
Date: Fri, 10 Oct 2025 14:56:00 -0700
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	James Morse <james.morse@arm.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>, guo.wenjia23@zte.com.cn,
	liu.qingtao2@zte.com.cn, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [External] [PATCH v4 0/3] RISC-V: Detect Ssqosid extension and
 handle srmcfg CSR
Message-ID: <aOmA8DNt/y+WxT97@x1>
References: <20251007-ssqosid-v4-0-e8b57e59d812@kernel.org>
 <CAEEQ3w=3pte5=CR9-R3rmCGFZ9ErJ9YcWS9i=JwPUb1Ty3ipwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3w=3pte5=CR9-R3rmCGFZ9ErJ9YcWS9i=JwPUb1Ty3ipwQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_145602_952294_B07DA167 
X-CRM114-Status: GOOD (  20.32  )
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

On Fri, Oct 10, 2025 at 08:23:50PM +0800, yunhui cui wrote:
> Hi Drew,
[snip]
> > I think it makes sense to first focus on the detection of Ssqosid and
> > handling of srmcfg when switching tasks. It has been tested against a
> > QEMU branch that implements Ssqosid and CBQRI [6]. A test driver [7]
> > was used to set srmcfg for the current process. This allows switch_to
> > to be tested without resctrl.
> 
> Could we consider submitting the entire QoS functionality as a single
> integrated patchset (indicating the upstream branch that the patchset
> is based on)? This should include the content from
> https://lore.kernel.org/linux-riscv/20230419111111.477118-1-dfustini@baylibre.com/

Thanks for the feedback. I had thought that submitting Ssqosid
separately would streamline the review of the parts that most affects
existing arch/riscv code (like switch_to.h) before adding code for CBQRI
and resctrl integration.

But I have gotten similar feedback from another person too. I can post a
complete series that adds Ssqosid and CBQRI support including the
resctrl interface. I have a cbqri branch [1] on top of riscv/for-next.
I need to clean up some of the code, and then I can send a series with
ssqosid+cbqri.

That cbqri branch just has device tree support in order to demonstrate
the resctrl functionality. However, I did also work on support for the
ACPI RQSC table earlier this year for a proof of concept [2]. I have
been thinking that I will hold back the ACPI support until after Ssqosid
and CBQRI support is reviewed. It also depends on some improvements
regarding the ACPI PPTT table that James Morse is currently working on for
ARM MPAM support [3].

Thanks,
Drew

[1] https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/log/?h=b4/cbqri
[2] https://lf-rise.atlassian.net/wiki/spaces/HOME/pages/433291272/ACPI+RQSC+Proof+of+Concept
[3] https://lore.kernel.org/all/20250910204309.20751-1-james.morse@arm.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
