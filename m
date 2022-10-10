Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F98C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Oct 2022 18:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXskvCMAOv/MU/7f71deUp8qES7UhV29r4bBHRDf5Zc=; b=j597OSwCSSi+j2
	aMJMiNLwjTQKxkX6m76mEJI/oyLGPCLiGlm3y7pztpgf8Jt4KDCg2EqLvBI7D8oo7LAZ1Mr3VRsTE
	WPmdwlJUHO7NhgX79+taf0xTZLmfrflndBNJYBbb/g+7PSBgokyn76kBh+eW6Nhmm3/rluePQHEDb
	HWX1j/1Ii82rFJNsLfOa5MQBZTBZUORlmV6XKv6yQSv/jLhJRXpOkzCWC8jLk2zizWTbiwM9T99mU
	2iolgOLv19AcLMpjcRMqEKWjgmJKHpasNcufukpX9AIJLxnHkuipE09vo7kA0JyvWQJVZLlMBckHl
	UkOM54V7Sp+2EJr68aSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohxrl-001rG7-Ni; Mon, 10 Oct 2022 18:51:05 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohxrj-001rFM-6g
	for linux-riscv@lists.infradead.org; Mon, 10 Oct 2022 18:51:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CE142B810B9;
	Mon, 10 Oct 2022 18:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E6CC433D6;
	Mon, 10 Oct 2022 18:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665427860;
	bh=N5QrBTmFnyH8xUhHqZQhuPDkgjqzP+EJBJyGyVpO7xQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IX4kLR7VLMCIqktJr4p7CbiD1V4erh7c3CJL8lG7LZAUiOwugl898pvsuXCIpkiDo
	 o+IpElOmPEwrpcNJxByELqokCtfI7Hc26oWEGPTcKudBNDm+yMxQsszcNwAFWcnhrY
	 /ibJMUmsQhnYW+jSklSbQFiwfbmB7QgPgo/JV7ktv6EC+Kr3aUiZR7D51DeI51+6uY
	 aOCKMYWY4W+odHniiWEHktFZSQVDUS03mk9/TMl5Em+H4sD3sxe6k8agisLZD0lGJt
	 /sgaiB0PAV5ILzSWpUIK3GP/WltxqFn8QJVr3PqZ8gU62Hq17sUWVo+65/wknQ4dfQ
	 jJfYHvcGijW4A==
Date: Mon, 10 Oct 2022 19:50:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Cleo John <waterdev@galaxycrow.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: fix styling in ucontext header
Message-ID: <Y0RpkI66dwEKD9Kw@spud>
References: <20221010182848.GA28029@watet-ms7b87>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221010182848.GA28029@watet-ms7b87>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_115103_410198_64AD4F28 
X-CRM114-Status: GOOD (  27.35  )
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

On Mon, Oct 10, 2022 at 08:28:48PM +0200, Cleo John wrote:
> Change the two comments in ucontext.h by getting them up to
> the coding style proposed by torvalds.
> 
> Signed-off-by: Cleo John <waterdev@galaxycrow.de>
> ---
> In my opinion this also improves the readability so I think this is a useful change to do.
> Please also tell me if you have a different opinion.

I don't think it is all that /important/ of a change, but it does make
things match between this file and the other headers.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks.

> 
> Changes in v2:
>  - change the styling of the top comments too
> 
>  arch/riscv/include/uapi/asm/ucontext.h | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/include/uapi/asm/ucontext.h b/arch/riscv/include/uapi/asm/ucontext.h
> index 44eb993950e5..516bd0bb0da5 100644
> --- a/arch/riscv/include/uapi/asm/ucontext.h
> +++ b/arch/riscv/include/uapi/asm/ucontext.h
> @@ -15,19 +15,23 @@ struct ucontext {
>  	struct ucontext	 *uc_link;
>  	stack_t		  uc_stack;
>  	sigset_t	  uc_sigmask;
> -	/* There's some padding here to allow sigset_t to be expanded in the
> +	/*
> +	 * There's some padding here to allow sigset_t to be expanded in the
>  	 * future.  Though this is unlikely, other architectures put uc_sigmask
>  	 * at the end of this structure and explicitly state it can be
> -	 * expanded, so we didn't want to box ourselves in here. */
> +	 * expanded, so we didn't want to box ourselves in here.
> +	 */
>  	__u8		  __unused[1024 / 8 - sizeof(sigset_t)];
> -	/* We can't put uc_sigmask at the end of this structure because we need
> +	/*
> +	 * We can't put uc_sigmask at the end of this structure because we need
>  	 * to be able to expand sigcontext in the future.  For example, the
>  	 * vector ISA extension will almost certainly add ISA state.  We want
>  	 * to ensure all user-visible ISA state can be saved and restored via a
>  	 * ucontext, so we're putting this at the end in order to allow for
>  	 * infinite extensibility.  Since we know this will be extended and we
>  	 * assume sigset_t won't be extended an extreme amount, we're
> -	 * prioritizing this. */
> +	 * prioritizing this.
> +	 */
>  	struct sigcontext uc_mcontext;
>  };
>  
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
