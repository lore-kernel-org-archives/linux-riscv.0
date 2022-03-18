Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95B6C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Mar 2022 03:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=COIVzDXOIkEl96Kgi90tkZxqlr91MFfN2A1p9Q8wPN8=; b=xJ1cjtoi8dGfVI
	t/cviPhefZF+sFDDMHFa8ewbHsSfFEVPNrmXZJSQ0DjVlhy3cIEY312nEj5kEEmjrFyj6Ve1xExLQ
	rCrlOHOfxdJn57opOR9Pb8fg8Zcxhes3Bkvr4zNESTXlmW3vrTZJT/yLwCrsHnseaitu1IJG736aE
	IHmkGYW7dwbVb5uiBs9HP3k1V+GC76pWKAXSLKaYiG7iVdAqlgfK/ro+q2/Yvwvl3OBuBggvdqkpq
	I91mWkHEflAkYw0wQbsIunp/i9bpbRyA56ZawiagHLVd7OHLd7uk4VBb2hjSorIJ9vhi/Vh5jYhND
	BKWNtBuicdB4qS5B/V/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV3US-000HQu-Ci; Fri, 18 Mar 2022 03:41:24 +0000
Received: from relay.hostedemail.com ([64.99.140.27])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV3UP-000HPe-IV
 for linux-riscv@lists.infradead.org; Fri, 18 Mar 2022 03:41:23 +0000
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay02.hostedemail.com (Postfix) with ESMTP id DB49224938;
 Fri, 18 Mar 2022 03:41:17 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf05.hostedemail.com (Postfix) with ESMTPA id EB7FB20015; 
 Fri, 18 Mar 2022 03:41:09 +0000 (UTC)
Message-ID: <4b017a7c75d6422b3e68df1d0aef49adc31ae991.camel@perches.com>
Subject: Re: [PATCH v6 1/6] RISC-V: Correctly print supported extensions
From: Joe Perches <joe@perches.com>
To: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org
Cc: Tsukasa OI <research_trasio@irq.a4lg.com>, Anup Patel
 <anup@brainfault.org>,  Heiko Stuebner <heiko@sntech.de>, Albert Ou
 <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, Damien Le
 Moal <damien.lemoal@wdc.com>,  devicetree@vger.kernel.org, Jisheng Zhang
 <jszhang@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 17 Mar 2022 20:41:08 -0700
In-Reply-To: <20220314203845.832648-2-atishp@rivosinc.com>
References: <20220314203845.832648-1-atishp@rivosinc.com>
 <20220314203845.832648-2-atishp@rivosinc.com>
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: EB7FB20015
X-Stat-Signature: 9uui7t67w9hsd4frdre6zgmamcg8n3ho
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19pvWiJwU890RydAIIWBwsRim9FvyFTerA=
X-HE-Tag: 1647574869-14430
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_204121_722400_09390EA6 
X-CRM114-Status: GOOD (  10.50  )
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

On Mon, 2022-03-14 at 13:38 -0700, Atish Patra wrote:
> From: Tsukasa OI <research_trasio@irq.a4lg.com>
> 
> This commit replaces BITS_PER_LONG with number of alphabet letters.
[]
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
[]
> @@ -133,13 +135,13 @@ void __init riscv_fill_hwcap(void)
>  	}
>  
>  	memset(print_str, 0, sizeof(print_str));
> -	for (i = 0, j = 0; i < BITS_PER_LONG; i++)
> +	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
>  		if (riscv_isa[0] & BIT_MASK(i))
>  			print_str[j++] = (char)('a' + i);

probably better to add braces for the for loops too

>  	pr_info("riscv: ISA extensions %s\n", print_str);
>  
>  	memset(print_str, 0, sizeof(print_str));
> -	for (i = 0, j = 0; i < BITS_PER_LONG; i++)
> +	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
>  		if (elf_hwcap & BIT_MASK(i))
>  			print_str[j++] = (char)('a' + i);
>  	pr_info("riscv: ELF capabilities %s\n", print_str);

and here.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
