Return-Path: <SRS0=Gszz=O4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0008DC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 11:02:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B847B60FC1
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 11:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B847B60FC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tO0XxnYi5v1K4M1Kmcp8a5qxKDpimZg2AWurdsg5ZT4=; b=sO178XRPghDi8Q
	CjsCt9ajbKEB6iK6D3RjLGug4T4etk1eJxp6k3BDQkhA9d8Uq7xFJkInjZQjZrjQYiFKz4ILvWL+N
	Ab9NBxwgUFA9l3ejYipb5oz9v685pkFt4DYplqVREttn9fXKF8dvkP5hy3QBUvXGYU0QeGfmxLWjJ
	g3cfbDzffpRTbtGyhUXXLBKgVzZ+KRgRocZoD1NfdM5gJNFjzXlkXTORXBrMUnZAR3L+e791mg18K
	XDx03MmgzSdWAGi1qimTxT+0mv/VGbUxHr/YS5fd/tsTLwj2JJN8KBEPHPdsPqG77Zbb/X4uBFtOE
	LbNWLq/l8jhXGGPmFYtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYndQ-002UuR-4X; Fri, 08 Oct 2021 11:01:52 +0000
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYndD-002Usi-5h; Fri, 08 Oct 2021 11:01:40 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HQlcH5cyHz4xbV;
 Fri,  8 Oct 2021 22:01:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1633690887;
 bh=B4qzHAigKKJHhzM+dPDATq6BWHA36ShynfcFOX354Uw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ecgb6jGX08YbAx5B1reNn4h/kU3Gen7kievibOO69w+92xKGfimzG9blAbi2wPVuT
 bzRQvpw1Gsq6L5OISVmfgRGEMrtpfffTD3SxPCSAMjCA7BaSe9z1Uwt8UhxvwagCXt
 RG8jZ9yVbHmz/oZlWgdyytG8dpN+zilnWPdwvHzOrKK+z9cUFtnbh9EiaF6DvYThDq
 y+nA3s2Jr7OnqG1H9G2arDaiYJ9T+Ocn4v009hMVegWkEyhfV3tBa+fnPnVWJ1bKT9
 NTxKKbhG9DIb5b2JYg+QufFs7CUHZN2G28KnkHe3XTX54qxanjx0qe1ihehNmLNt3p
 OX9W1GxfbYAzQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
 James Morse <james.morse@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, Jonas Bonn <jonas@southpole.se>, Stefan Kristiansson
 <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 07/12] powerpc: Use of_get_cpu_hwid()
In-Reply-To: <20211006164332.1981454-8-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-8-robh@kernel.org>
Date: Fri, 08 Oct 2021 22:01:15 +1100
Message-ID: <8735pbok5g.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_040139_384171_8F449781 
X-CRM114-Status: GOOD (  15.88  )
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

Rob Herring <robh@kernel.org> writes:
> Replace open coded parsing of CPU nodes' 'reg' property with
> of_get_cpu_hwid().
>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/powerpc/kernel/smp.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 9cc7d3dbf439..d96b0e361a73 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1313,18 +1313,13 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
>  int cpu_to_core_id(int cpu)
>  {
>  	struct device_node *np;
> -	const __be32 *reg;
>  	int id = -1;
>  
>  	np = of_get_cpu_node(cpu, NULL);
>  	if (!np)
>  		goto out;
>  
> -	reg = of_get_property(np, "reg", NULL);
> -	if (!reg)
> -		goto out;
> -
> -	id = be32_to_cpup(reg);
> +	id = of_get_cpu_hwid(np, 0);
>  out:
>  	of_node_put(np);
>  	return id;

This looks OK to me.

All the systems I can find have a /cpus/#address-cells of 1, so the
change to use of_n_addr_cells() in of_get_cpu_hwid() should be fine.

I booted it on a bunch of systems with no issues.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
