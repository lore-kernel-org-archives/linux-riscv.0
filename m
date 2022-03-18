Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91150C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Mar 2022 14:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FxyyW67ClNTt2azKoyTOMG4PYkpYzbDMAaokdpTQgV4=; b=Tdr7waAOFtUyNN
	/FzKwKsw/8H7Bn1pU3RNpJ/6FRlbvgoJTk6P7Cz8LJR91kHggTjxP1rzQyNWu7rD8ZNGWlGMMnthN
	U0OtUxeTvsNSEJmV8E8hBHUIK/4CINQnhDNLla0x85vfHh9n4rG2gr78DDPKtF6DoSBbTTK5we9ja
	g4wYmqBFVMnxOSdvHOFBh0xq/SzjgFa9xBMwM2z26+AD6oVfwWS7mG2254fmJeZbszU7UgSa4XFK5
	ZaSG/nH1DKYxUirHnOE8eYmmQAVq8ejuaPNn5qsUXDi0ZrfaxE4h1pW2GyWIKXH3z733uAwNZ0v51
	fUwrufrtfcD5y3Inu0DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVDso-0023KT-IM; Fri, 18 Mar 2022 14:47:14 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVDsf-00239c-E6
 for linux-riscv@lists.infradead.org; Fri, 18 Mar 2022 14:47:10 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=[192.168.0.21])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1nVDsT-0000OB-7s; Fri, 18 Mar 2022 14:46:53 +0000
Message-ID: <f1079093-54db-bd20-3342-b06d069c5d1f@codethink.co.uk>
Date: Fri, 18 Mar 2022 14:46:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] RISC-V: Increase range and default value of NR_CPUS
Content-Language: en-GB
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel
 <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220317035542.272547-1-apatel@ventanamicro.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20220317035542.272547-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_074705_505857_F4E40E6D 
X-CRM114-Status: UNSURE (   7.08  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 17/03/2022 03:55, Anup Patel wrote:
> Currently, the range and default value of NR_CPUS is too restrictive
> for high-end RISC-V systems with large number of HARTs. The latest
> QEMU virt machine supports upto 512 CPUs so the current NR_CPUS is
> restrictive for QEMU as well. Other major architectures (such as
> ARM64, x86_64, MIPS, etc) have a much higher range and default
> value of NR_CPUS.

What's the memory overhead for increasing this?

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
