Return-Path: <SRS0=OMI1=QP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D663BC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 09:11:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 966BA2147C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 09:11:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L4XGtaxT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 966BA2147C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zelIkCKOrqt8F/UVoTHmf3/lo9I6d7P0Ry8nykYpPUQ=; b=L4XGtaxT3b5dhW
	Wamkz2/eksHKKCT0g0AYNlMAgAFWgjcno0k1S5wbKHIYv8BWXKNSPrzWsNoR60sKIV2Wb9fifjS5/
	I3V9iN+21pKAHFHpbTdQMo6E2hf2P/eCRkNwbVtsNl9lCxodjeIb+LWFdsb5iPVXIfcFuR+jdZkbD
	RXYpJXJFSjWMWq6m3e7su0MmmJfNU7+cXJSj79tAZtBUB12yOSCZaUEK/2U+XuzdoHalQxzfVFRws
	qwAK7tGLurxmAXyFmQWqBKnCzd2RElkgDRBbnpKM+RTgRvygSlKjaE6Oy/MuBijUoYUJGZffPZd0f
	UZZxtpHaOABo05Rz3x6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs2C7-0008AI-HV; Fri, 08 Feb 2019 09:11:35 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gs2C5-0008A5-9d; Fri, 08 Feb 2019 09:11:33 +0000
Date: Fri, 8 Feb 2019 01:11:33 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [v3 PATCH 8/8] RISC-V: Assign hwcap only according to boot cpu.
Message-ID: <20190208091133.GD16932@infradead.org>
References: <1549590681-24125-1-git-send-email-atish.patra@wdc.com>
 <1549590681-24125-9-git-send-email-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1549590681-24125-9-git-send-email-atish.patra@wdc.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Patrick =?iso-8859-1?Q?St=E4hlin?= <me@packi.ch>, linux-kernel@vger.kernel.org,
 Marc Zyngier <marc.zyngier@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andreas Schwab <schwab@suse.de>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Zong Li <zongbox@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

> +	 * We don't support running Linux on hertergenous ISA systems.
> +	 * But first "okay" processor might not be the boot cpu.
> +	 * Check the ISA of boot cpu.

Please use up your available 80 characters per line in comments.

> +		/*
> +		 * All "okay" hart should have same isa. We don't know how to
> +		 * handle if they don't. Throw a warning for now.
> +		 */
> +		if (elf_hwcap && temp_hwcap != elf_hwcap)
> +			pr_warn("isa mismatch: 0x%lx != 0x%lx\n",
> +				elf_hwcap, temp_hwcap);
> +
> +		if (hartid == boot_cpu_hartid)
> +			boot_hwcap = temp_hwcap;
> +		elf_hwcap = temp_hwcap;

So we always set elf_hwcap to the capabilities of the previous cpu.

> +		temp_hwcap = 0;

I think tmp_hwcap should be declared and initialized inside the outer loop
instead having to manually reset it like this.

> +	}
>  
> +	elf_hwcap = boot_hwcap;

And then reset it here to the boot cpu.

Shoudn't we only report the features supported by all cores?  Otherwise
we'll still have problems if the boot cpu supports a feature, but not
others.

Something like:

	for () {
		unsigned long this_hwcap = 0;

		for (i = 0; i < strlen(isa); i++)
			this_hwcap |= isa2hwcap[(unsigned char)(isa[i])];

		if (elf_hwcap)
			elf_hwcap &= this_hwcap;
		else
			elf_hwcap = this_hwcap;
	}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
