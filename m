Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89179C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Feb 2022 21:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uscSAszAolddRTl6QtOfUaBWfP+39zTUnY+jXKEeFec=; b=ZVxnkNhsENCKdA
	qaKGOnqe2l5vGdUSeSccY8Dcc8V9QCeBIcU9PWPbn2adwSVLZuiJcgbyC7uosi0qmm8SvBmj0BSwl
	xSAusxlNXBHM/btX+CRFOLWAB+2N3jHoR/hkokl7QjQARw6I+bmzoGYQzf6IZQX8NmAV1tH/p1HZ8
	orKsmQWGgwwS7zs0IDZdYTCO7SSUvnL0ZyJgp/H3lpQJn5rM/pa06s/X6Cqk/rfL/QTlSORlIPg+r
	y10zyS7oayez65GHMYHcm592jIVN9egbfCffe4fVEER293oiayLyo7MUlPt6MZNRGgqsL0OO/amWr
	51XYRiCSkJ314+N0YCpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIHSO-0050rf-7L; Thu, 10 Feb 2022 21:58:28 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIHSG-0050ps-5M
 for linux-riscv@lists.infradead.org; Thu, 10 Feb 2022 21:58:26 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4JvrGW3Gdmz1s767;
 Thu, 10 Feb 2022 22:58:11 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4JvrGW04bKz1qqkB;
 Thu, 10 Feb 2022 22:58:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id P0Gm9oQZh0uW; Thu, 10 Feb 2022 22:58:09 +0100 (CET)
X-Auth-Info: K9Vgp8IFWJ4Z7781WVGKiz1IyIbMo3h9rBlVSRIGtFnKqw4w1utxrA8f7q6T64u9
Received: from igel.home (ppp-46-244-163-189.dynamic.mnet-online.de
 [46.244.163.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 10 Feb 2022 22:58:09 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 33DC02C3B35; Thu, 10 Feb 2022 22:58:09 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org,  Albert Ou <aou@eecs.berkeley.edu>,  Atish
 Patra <atishp@atishpatra.org>,  Anup Patel <anup@brainfault.org>,  Damien
 Le Moal <damien.lemoal@wdc.com>,  devicetree@vger.kernel.org,  Jisheng
 Zhang <jszhang@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>,  linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 5/6] RISC-V: Do no continue isa string parsing
 without correct XLEN
References: <20220210214018.55739-1-atishp@rivosinc.com>
 <20220210214018.55739-6-atishp@rivosinc.com>
X-Yow: I don't believe there really IS a GAS SHORTAGE..  I think it's all
 just a BIG HOAX on the part of the plastic sign salesmen--
 ..  to sell more numbers!!
Date: Thu, 10 Feb 2022 22:58:09 +0100
In-Reply-To: <20220210214018.55739-6-atishp@rivosinc.com> (Atish Patra's
 message of "Thu, 10 Feb 2022 13:40:17 -0800")
Message-ID: <877da2xu32.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_135820_391903_1E0C3A58 
X-CRM114-Status: GOOD (  13.18  )
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

On Feb 10 2022, Atish Patra wrote:

> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 469b9739faf7..cca579bae8a0 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -84,6 +84,7 @@ void __init riscv_fill_hwcap(void)
>  	for_each_of_cpu_node(node) {
>  		unsigned long this_hwcap = 0;
>  		uint64_t this_isa = 0;
> +		char *temp;
>  
>  		if (riscv_of_processor_hartid(node) < 0)
>  			continue;
> @@ -93,6 +94,7 @@ void __init riscv_fill_hwcap(void)
>  			continue;
>  		}
>  
> +		temp = (char *)isa;

There should be no need for this cast.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
