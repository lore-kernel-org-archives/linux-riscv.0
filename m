Return-Path: <SRS0=E47g=33=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A704BC352A2
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2020 11:00:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BED621927
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2020 11:00:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MBMrlRPz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BED621927
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:To:From:Subject:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g45UVKj/sbR0VFtVjENGgy+CS+CaX23k1N7JQHmw8q4=; b=MBMrlRPzMIs6XUfmxDt72GK3qg
	lE7qfuNr5rnqitESPT+jnIMB7josAxpvr89OBlgoIUOx+TDYcJMWiH7GMNQo2J37gFGgQoq0G/D4T
	wjRrZzfv8MOFasfO2vEGsSH/T9vxyktaysKfDW6WVLnsfwHZRaZItBoq86pMIJvEMK6SJ25Elw6bd
	ziCEgPpeR7yYtWiQZWSatEHgv2eQd8bTZolJQwKMiv39XT1nv9WFhyJitRrHabWPIXpkrGK0migEv
	qHzxeUth+g6IjevjCVj+izDOLfWHHECXR84oFOWE+WwQA5rXDkIQ4HBq1IjSd+KNKLwdLt+b3c9Bb
	G7aHWvOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j01Md-0001jx-Vc; Fri, 07 Feb 2020 10:59:59 +0000
Received: from smtprelay0061.hostedemail.com ([216.40.44.61]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j01MY-0001iT-S8
 for linux-riscv@lists.infradead.org; Fri, 07 Feb 2020 10:59:58 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 49042182CF666;
 Fri,  7 Feb 2020 10:59:39 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: unit22_19eb947281c49
X-Filterd-Recvd-Size: 1521
Received: from XPS-9350.home (unknown [47.151.143.254])
 (Authenticated sender: joe@perches.com)
 by omf02.hostedemail.com (Postfix) with ESMTPA;
 Fri,  7 Feb 2020 10:59:38 +0000 (UTC)
Message-ID: <fdcfd8548707e2d6c61fc9739bc91c6720673c81.camel@perches.com>
Subject: Re: [PATCH 2/2] riscv: adjust the indent
From: Joe Perches <joe@perches.com>
To: Zong Li <zong.li@sifive.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com,  aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Date: Fri, 07 Feb 2020 02:58:25 -0800
In-Reply-To: <20200207095245.21955-3-zong.li@sifive.com>
References: <20200207095245.21955-1-zong.li@sifive.com>
 <20200207095245.21955-3-zong.li@sifive.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_025954_966375_C1F2E02E 
X-CRM114-Status: UNSURE (   5.13  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 2020-02-07 at 17:52 +0800, Zong Li wrote:
> Adjust the indent to match Linux coding style.

trivia:

> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
[]
> @@ -86,7 +89,8 @@ void __init kasan_init(void)
>  	unsigned long i;
>  
>  	kasan_populate_early_shadow((void *)KASAN_SHADOW_START,
> -			(void *)kasan_mem_to_shadow((void *)VMALLOC_END));
> +				    (void *)kasan_mem_to_shadow((void *)
> +								VMALLOC_END));

could also remove an unnecessary (void *) as kasan_mem_to_shadow
returns a void *

	kasan_populate_early_shadow((void *)KASAN_SHADOW_START,
				    kasan_mem_to_shadow((void *)VMALLOC_END));


