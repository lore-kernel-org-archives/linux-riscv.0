Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C235C54E67
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2024 00:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MgTih3XY8RGh0cgFLEICIpMOodHja1YATEyXr07WSp4=; b=lI5zxHvW32l3tw
	4D622QNLxPFA3nTBgmlv/Q4nw532l1kkVdoN+cHwniihRUER4/rR8y4cm4ZKpciBXM++aVNtV01PP
	GHqUqEHdMMr0s/Q8nX0dJ2RVd1PMJZ5iw/uyjKNq/h8ZidD8orJnvBF8HW4iu8F9aBO3xVF0kzhO7
	XwwbY4wDbNj7tv/1aYstwktbkKjkSlP9U7Vsw52OcETmlPGGbiE2aImBFjgzL3OLCOkl83Fuyd9Cw
	iQDEQsCH0B2/J2PsXsBJCLKJgv1kTlefNFOxrrKJL+i8kSmj/cAlCm+mkJdu5jCziSxuOIMZoEF9m
	7Juf6VONvgutwBVSyCMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roBrb-0000000BTiY-0Ck0;
	Sun, 24 Mar 2024 00:37:27 +0000
Received: from [50.53.2.121] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roBrY-0000000BTiB-1PUq;
	Sun, 24 Mar 2024 00:37:24 +0000
Message-ID: <40c96057-4bd8-4743-bea1-5d848f0e0c84@infradead.org>
Date: Sat, 23 Mar 2024 17:37:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arch/riscv: Enable kprobes when CONFIG_MODULES=n
Content-Language: en-US
To: Jarkko Sakkinen <jarkko@kernel.org>, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 "David S . Miller" <davem@davemloft.net>,
 Masami Hiramatsu <mhiramat@kernel.org>, linux-trace-kernel@vger.kernel.org
References: <20240323232908.13261-1-jarkko@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240323232908.13261-1-jarkko@kernel.org>
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



On 3/23/24 16:29, Jarkko Sakkinen wrote:
> +config HAVE_KPROBES_ALLOC
> +	bool
> +	help
> +	  Architectures that select this option are capable of allocating memory
> +	  for kprobes withou the kernel module allocator.

	              without

-- 
#Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
