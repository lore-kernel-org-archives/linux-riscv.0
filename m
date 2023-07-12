Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73271EB64DC
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 02:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pF3PWSSz//L4As+VStnKbd0qZPe35uyUR4A555E9sog=; b=wRlEE1zBYu3SED
	OPARNEkmhnV8SSsYpIeCIQsNVLNdKpsCMAU5tGELwrLo1yS7IVq/k5OgH1/fQVfJJCJhkhvNzU5CP
	lU89NwOVr93cfgfbPNrC6lSknwzY1w81x5yx8sF94nzJbI1ID4j0v/tK5TY2QnzZzJReb01gFu6Yc
	yJac1FLEs7eSQyxm9ZJ734V4ObUD7oG9FgGf6YIFH2jU2Sq8wFKUh5P6c5Sr0tOvImhA3RCDG+FcR
	HJ0dIFAVT4q+d3svfa/1eulyV9bY+vgCLnVjjaoRsVj/Xk32SH2U5PMteJym8B4KQxkfUx5Pg/WXG
	ANkr6pvoLKIHlH1N9+ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJQ2k-00GKbn-2k;
	Wed, 12 Jul 2023 02:57:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJQ2i-00GKab-37
	for linux-riscv@bombadil.infradead.org;
	Wed, 12 Jul 2023 02:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AfW10e7/b7hTfisQybHcu+WC1w6y3STKEv6tpxe1+eY=; b=D3ULv1StT6sD3+4Efvx4UgCjGG
	S0mg+jPTd4pj5cAtq2YYTztRIzgtEelmA8TyAyeTaPrZMGSCKtPXQP+0+uP2m6WZ7pRxMMppmHbmj
	bhI8UXQC1QYnd+UMTKxFi5FZSMv4iW5WK4tTqNUdPgc0ULcvwAx7ILzTMNXZ3r8LicpZDntN8jORP
	xzA9dB9g7AZwkWt9C4qKMP2T3MS6lRchNCrqsT4njG4f0j+1BepnGhxv9czWDqOV4CZSwvq73Qu9G
	dorzXhLxXJcvpO4o48WscUqYVJP/6wtPe4QOthHI2Wcl2FwuYipYgVitwfWhgk9AdQIMU0cTUiyP1
	NZT4ic1A==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJOsY-002ZwM-0Q
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 01:43:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6090661640;
	Wed, 12 Jul 2023 01:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B788C433C7;
	Wed, 12 Jul 2023 01:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689126167;
	bh=HcjfZVS5j2QnPWisyqJiHTOrvnNm8k6hX0Manu9q8/8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B8aJ2GG+y/4t3XEzdp/waPtP6ocY9E6lnlx+ug/lldeFATlh4BTecbXjwUztC3TsF
	 0t/o0sz1LQYlj1fuwN7s+qUApGcfv0OUrSSaPwXG0+V9LYGvpU4/4OCWhbV80N7Diu
	 SlJlcjxd72USrsutUGUgLJU7XDjkaag1HdohcoO0NFzeW5zbeXwouQTBVNXqUczuEA
	 4J1vcFyqHgT9uNnFHrKG+rw4FVTUAUxGXHvzUmFu/wINpnzVhhPEXiIGQ/lAWwCO76
	 dT22G2bIVPE13YaOZc+2xINJbiJ3n4pqsYEBHmpNd/3Or9lSl9nVv/G0JORAAQpbPk
	 1rRYYWLJMAJ+g==
Message-ID: <a7885677-68ef-59c8-0639-579a688fcdad@kernel.org>
Date: Wed, 12 Jul 2023 11:42:40 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] riscv: support the elf-fdpic binfmt loader
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, palmer@dabbelt.com, viro@zeniv.linux.org.uk,
 ebiederm@xmission.com, brauner@kernel.org
References: <20230711130754.481209-1-gerg@kernel.org>
 <20230711130754.481209-3-gerg@kernel.org> <202307110852.E093C93F@keescook>
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <202307110852.E093C93F@keescook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_024300_044260_1AD11773 
X-CRM114-Status: GOOD (  13.28  )
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

Hi Kees,

On 12/7/23 01:53, Kees Cook wrote:
> On Tue, Jul 11, 2023 at 11:07:54PM +1000, Greg Ungerer wrote:
>> Add support for enabling and using the binfmt_elf_fdpic program loader
>> on RISC-V platforms. The most important change is to setup registers
>> during program load to pass the mapping addresses to the new process.
>>
>> One of the interesting features of the elf-fdpic loader is that it
>> also allows appropriately compiled ELF format binaries to be loaded on
>> nommu systems. Appropriate being those compiled with -pie.
>>
>> Signed-off-by: Greg Ungerer <gerg@kernel.org>
> 
> ELF stuff looks fine to me. If the RISC-V folks are happy with the rest,
> this looks good.
> 
> Acked-by: Kees Cook <keescook@chromium.org>
> 
> Please feel free to carry this in the RISC-V tree. If you'd rather it go
> via execve tree, please let me know. :)

Thanks for the feedback, much appreciated!

Regards
Greg



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
