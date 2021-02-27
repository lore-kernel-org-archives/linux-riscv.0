Return-Path: <SRS0=iQdh=H5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76A6C433DB
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Feb 2021 22:58:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EE4164DDC
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Feb 2021 22:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EE4164DDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fzAkUhjlFiH52YGvbPeObtpsSCD9LlJoPtTCWpRD0lY=; b=Ce1kIeBAi4RN2RTKV62h33kUE
	0koN4+vPtpEV2GjpxWa1nB/j3lMD69FZRbx6wCikYa2K/YsjG76ezdMqJ4APnjIjHZ+V7uh8ep/nv
	EcnFWFc3IA4N/zs1yD35wtOFLO9OiVLeLOGYf6CPZLg53JvQt2byKLME0b2JrchogZZInvyZL64s6
	w+wLIcuw1GOT/M7sBuPhqUq3GdyFD+WSxF3XD1Aen/KiFx+nbFiwrhHhj6muwfA/CvH6Nt5NMXpTo
	94t1KZRVdfIO1m0Hpo3rfdq0X+x3eIttlyr2GW7dyThEWrYgan/KRYVr1qyTBZ8da0FHO2CgAiOO7
	yQz50AGmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lG8Xa-0002LI-3N; Sat, 27 Feb 2021 22:58:26 +0000
Received: from [2601:1c0:6280:3f0::3ba4]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lG8XX-0002Kj-6T; Sat, 27 Feb 2021 22:58:23 +0000
Subject: Re: [PATCH] tools: include: nolibc: Fix a typo occured to occurred in
 the file nolibc.h
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, w@1wt.eu,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20210227224435.21315-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3a9e310f-2a5b-9fc2-cd5a-222e2ed353e4@infradead.org>
Date: Sat, 27 Feb 2021 14:58:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210227224435.21315-1-unixbhaskar@gmail.com>
Content-Language: en-US
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
Cc: colin.king@canonical.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/27/21 2:44 PM, Bhaskar Chowdhury wrote:
> 
> s/occured/occurred/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
>  Stolen result from Colin's finding and share from the other places. :)
> 
>  tools/include/nolibc/nolibc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/include/nolibc/nolibc.h b/tools/include/nolibc/nolibc.h
> index e61d36cd4e50..fc998c359607 100644
> --- a/tools/include/nolibc/nolibc.h
> +++ b/tools/include/nolibc/nolibc.h
> @@ -1054,7 +1054,7 @@ struct sys_stat_struct {
>   *     scall32-o32.S in the kernel sources.
>   *   - the system call is performed by calling "syscall"
>   *   - syscall return comes in v0, and register a3 needs to be checked to know
> - *     if an error occured, in which case errno is in v0.
> + *     if an error occurred, in which case errno is in v0.
>   *   - the arguments are cast to long and assigned into the target registers
>   *     which are then simply passed as registers to the asm code, so that we
>   *     don't have to experience issues with register constraints.
> --


-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
