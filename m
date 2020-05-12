Return-Path: <SRS0=nRJq=62=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3E4C54E4A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 May 2020 14:47:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C08C206A3
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 May 2020 14:47:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MC+nf8z5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C08C206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ND4dqFNzgG6KhpOedutNN1D0LuXDB5OkiLZG0ckNLe0=; b=MC+nf8z5Fgb9r9
	Kmk18xaxlX0M2NnJTffTThrsMUQZha2WReCNJ+t1V8zMjcRdQxjAeWw/KOgnPHS9WT8jcizXWyOUy
	oLEYdsHGA4H0ChFnY9h0qXotALstmz1IHsV/kGeJyklCR3IWtruQZg0yIcKuXN21HnrfOdW93D31K
	sUeqke0MzfrTzoQ+QcLrygy88eQ2j8/Fil9Hs7NLPeruCLBFytYFYy+5Nd+6K2YanRRv3gEdFSjoy
	iC+bABxz9bgcnkRLqsmDXV5EGb9Xv7gFvnAa5RVA5GpgBuT9KfQmW/2GfZv7VNvs9DvIMCdBBL5z0
	xkQhc32D0kgH22y1L9lw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYWBh-0005rJ-RO; Tue, 12 May 2020 14:47:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYWBX-0005hP-8O; Tue, 12 May 2020 14:47:08 +0000
Received: from [10.44.0.192] (unknown [103.48.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5779E206A3;
 Tue, 12 May 2020 14:46:58 +0000 (UTC)
Subject: Re: [PATCH 29/31] binfmt_flat: use flush_icache_user_range
To: Christoph Hellwig <hch@lst.de>, Andrew Morton
 <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
References: <20200510075510.987823-1-hch@lst.de>
 <20200510075510.987823-30-hch@lst.de>
From: Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <484af2c0-2450-b40a-8322-e691495c45aa@linux-m68k.org>
Date: Wed, 13 May 2020 00:46:55 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200510075510.987823-30-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_074707_319074_248D2CC4 
X-CRM114-Status: GOOD (  15.43  )
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, Jessica Yu <jeyu@kernel.org>,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Christoph,

On 10/5/20 5:55 pm, Christoph Hellwig wrote:
> load_flat_file works on user addresses.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Greg Ungerer <gerg@linux-m68k.org>

Regards
Greg



> ---
>   fs/binfmt_flat.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
> index 831a2b25ba79f..6f0aca5379da2 100644
> --- a/fs/binfmt_flat.c
> +++ b/fs/binfmt_flat.c
> @@ -854,7 +854,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>   #endif /* CONFIG_BINFMT_FLAT_OLD */
>   	}
>   
> -	flush_icache_range(start_code, end_code);
> +	flush_icache_user_range(start_code, end_code);
>   
>   	/* zero the BSS,  BRK and stack areas */
>   	if (clear_user((void __user *)(datapos + data_len), bss_len +
> 

