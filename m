Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2271C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 06:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejK4lILvMKRElaNjEYBvh6oyza1FLBzww1hhOwf6jtk=; b=FIEpM/iVChIbbf
	4yjP1YLUwSFxMemXcskLhmIyez/g4WZzNeOL9I8PaqDo+/YUf4vaA52DEZHbknymDk2gD+h02865N
	ZO59U0Uou8z+8/hLQ9O9Ve66oEKffsADh39A7JFQ1dgiOhB8uxuFC9PrdtQODPyKlZJNXUC9aQuLi
	GdH6YrqnLcOah3yiigGnB+oqGI52EXElceXBXH1rNfv1pVAqvuIMwRpwP7qzBZ7yYpJjlqxk2bmOj
	Bz7wvSDOb1jAotGh6URPCecSsV0TYnA9YZxBvn3MxNSuTO92cpFMQCycp4Mmva0Cn2sjEFBVMOMrb
	lYUfUUyi6lfwdmhgnlCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNSEz-00AVPs-2H;
	Wed, 10 Jan 2024 06:39:05 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNSEw-00AVPJ-2U
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 06:39:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F13091C0004;
	Wed, 10 Jan 2024 06:38:48 +0000 (UTC)
Message-ID: <4e0da12a-62ed-47fa-9f75-a7de10bd8dc0@ghiti.fr>
Date: Wed, 10 Jan 2024 07:38:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Fix an off-by-one in get_early_cmdline()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
References: <9f66d2b58c8052d4055e90b8477ee55d9a0914f9.1698564026.git.christophe.jaillet@wanadoo.fr>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <9f66d2b58c8052d4055e90b8477ee55d9a0914f9.1698564026.git.christophe.jaillet@wanadoo.fr>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_223902_977275_8DBDC428 
X-CRM114-Status: GOOD (  13.59  )
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

Hi Christophe,

On 29/10/2023 08:20, Christophe JAILLET wrote:
> The ending NULL is not taken into account by strncat(), so switch to
> strlcat() to correctly compute the size of the available memory when
> appending CONFIG_CMDLINE to 'early_cmdline'.
>
> Fixes: 26e7aacb83df ("riscv: Allow to downgrade paging mode from the command line")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   arch/riscv/kernel/pi/cmdline_early.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/pi/cmdline_early.c b/arch/riscv/kernel/pi/cmdline_early.c
> index 68e786c84c94..f6d4dedffb84 100644
> --- a/arch/riscv/kernel/pi/cmdline_early.c
> +++ b/arch/riscv/kernel/pi/cmdline_early.c
> @@ -38,8 +38,7 @@ static char *get_early_cmdline(uintptr_t dtb_pa)
>   	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) ||
>   	    IS_ENABLED(CONFIG_CMDLINE_FORCE) ||
>   	    fdt_cmdline_size == 0 /* CONFIG_CMDLINE_FALLBACK */) {
> -		strncat(early_cmdline, CONFIG_CMDLINE,
> -			COMMAND_LINE_SIZE - fdt_cmdline_size);
> +		strlcat(early_cmdline, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
>   	}
>   
>   	return early_cmdline;

This looks good to me, you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
