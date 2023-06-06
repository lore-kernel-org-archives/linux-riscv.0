Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08140C7EE24
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 18:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dAqHZDBVtXdmWyD7t8OIP7YYtw3ycFT55lJDZ/I3lvk=; b=m90EhrfqyKrS7R
	4DTyBc7FYCGA13/uKRQUfJKiUey/Nh4QxGGbTEZhgmbIwjvIqhn7+PoMlr9OIP+yFcjrJBT8d8Os/
	sbfjU+KEvLlqo+tN9acszEkRRT85ep3NGIh3NB1xMwKBbWUMI1vcKeEft6EV/sNRodNT9pNJeObLP
	XW0vkif9f8HfjtbgG2pQL44ewvA6dD4W0t266nyt61Xiu3JjnSfMZ2BrPCc1yb8cJYR5J2mJf1dl4
	ier/LurbnAnPgeoYuixW0BissxKtRzbJcH62yeh0yC6HLBjdPB65yKPuwSQZDhzmjhPnB41FjkhVF
	ZPG6Fl61yGLtg7Oby/+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6bYI-002mlQ-14;
	Tue, 06 Jun 2023 18:37:06 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6bYF-002mis-1I
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 18:37:05 +0000
Date: Tue, 6 Jun 2023 20:36:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1686076615; bh=OjRLqwrxR3FBsWW4XS2Cc09XFAFldwpVvvt9U+Wh0WI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jUN+GWhoyrtMbFAKRDwmRGykG90E96Ekg0Tfu8T7zUUwutFn9MeQJuZ2SLG3d6UDe
	 +LU5lzDLMfsmeBrCSWiGWbK7znlbqv0VHMFVPcppLKCCZ7dUOSXSU4kyKVpwZro48S
	 5oCiYmxg1TZDtAe01th4fdo17Nc0/TM9939V4HoQ=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Zhangjin Wu <falcon@tinylab.org>, w@1wt.eu
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/4] tools/nolibc: sys.h: apply __syscall() helper
Message-ID: <7e76f099-4198-421c-8157-430201970c4c@t-8ch.de>
References: <cover.1686036862.git.falcon@tinylab.org>
 <ee86e33d9f0031da5932b0de798f188535308dd7.1686036862.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee86e33d9f0031da5932b0de798f188535308dd7.1686036862.git.falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_113703_922532_B70B8C4A 
X-CRM114-Status: GOOD (  14.59  )
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

Hi Zhangjin,

On 2023-06-06 16:17:38+0800, Zhangjin Wu wrote:
> Use __syscall() helper to shrink 252 lines of code.
> 
>     $ git show HEAD^:tools/include/nolibc/sys.h | wc -l
>     1425
>     $ git show HEAD:tools/include/nolibc/sys.h | wc -l
>     1173
>     $ echo "1425-1173" | bc -l
>     252
> 
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  tools/include/nolibc/sys.h | 336 +++++--------------------------------
>  1 file changed, 42 insertions(+), 294 deletions(-)
> 
> diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> index f6e3168b3e50..0cfc5157845a 100644
> --- a/tools/include/nolibc/sys.h
> +++ b/tools/include/nolibc/sys.h
> @@ -108,13 +108,7 @@ int sys_chdir(const char *path)
>  static __attribute__((unused))
>  int chdir(const char *path)
>  {
> -	int ret = sys_chdir(path);
> -
> -	if (ret < 0) {
> -		SET_ERRNO(-ret);
> -		ret = -1;
> -	}
> -	return ret;
> +	return __syscall(chdir, path);

To be honest I'm still not a big fan of the __syscall macro.
It's a bit too magic for too little gain.

The commit message argues that the patches make the code shorter.

However doing 

__sysret(sys_chdir(path));

instead of

__syscall(chdir, path);

is only three characters longer and the same amout of lines.

Otherwise we would have syscall() _syscall() and __syscall() each doing
different things.

And __syscall does not behave like a regular function.

The rest of the patchset looks great.

Maybe Willy can break the tie?


Thomas


Note: If we figure out a way to build syscall() without macros I would
like that also :-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
