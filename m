Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69537C77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 21:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SWEjicTD7X5Blk6oGkT2xZx3kK0qmsQD8HogWfarVas=; b=YT52WN+fX8DbCE
	5h3r8GvumO22fIEcx+owf/TCtNd3CJdW8VkjAZ3yW2Dh+B6RHQgcEsuCUb4/TRvLJ/sn57MGThr6a
	lWbMGhfYi/CmMkqvrB+9r+WfgP3uP1ztTK2Inj+ks2aLtmo6U9LJZZAQR09BeAzUnBOUqOK29royp
	SrbKnaDs7BHNLOLZB5hvbLB5e3nyC0lyaCETxYwj3uLhvmZfx7/48VYJlkLmbUuVLSZM2GeFuAAqe
	rK0EAETGbytSDxAFcCzVRb4W3k/dycQeapYonaBY9df79LujMgd901rVq8nK6seka5GEq40pQy0Pt
	2TMuWjKql0o8Ea0wr+Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3kaF-00BkHH-2z;
	Mon, 29 May 2023 21:39:19 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3kaC-00BkGO-29
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 21:39:18 +0000
Date: Mon, 29 May 2023 23:39:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1685396352; bh=KERa37f1jCecyGjPwDTuzqnl75Mz6w4gg8XNi9sny+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EsjZvZNlKzIeZ/C1NZ0oNAsYZo+76a2qugPQ+dERKwf0VIJ+gZT7N2+56s/ZcfWch
	 kE7kbdQKhvkOFnUNSjZZQXdRJ05uafQpIdadfpI3d1t14QZtF+K95m9AeNtuRfnmFc
	 GNOJ025pHOfgaS+mUQmYx7ubLMC/Nm2Tw4J0FVio=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: w@1wt.eu, arnd@arndb.de, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 04/13] tools/nolibc: add missing nanoseconds support
 for __NR_statx
Message-ID: <3a3edd48-1ace-4c89-89e8-9c594dd1b3c9@t-8ch.de>
References: <cover.1685387484.git.falcon@tinylab.org>
 <4cd637be248b5bfad6f2a01b82a9fb6f3fe4c6fa.1685387484.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4cd637be248b5bfad6f2a01b82a9fb6f3fe4c6fa.1685387484.git.falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_143916_881037_B150A413 
X-CRM114-Status: GOOD (  17.40  )
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

On 2023-05-30 03:50:34+0800, Zhangjin Wu wrote:
> Commit a89c937d781a ("tools/nolibc: support nanoseconds in stat()")
> added nanoseconds for stat() but missed the statx case, this adds it.

Welp, I should have thought of that.
At least the testcase seems to have been useful.

Thanks for the fix!

> The stx_atime, stx_mtime, stx_ctime are in type of 'struct
> statx_timestamp', which is incompatible with 'struct timespec', should
> convert explicitly.
> 
>     /* include/uapi/linux/stat.h */
> 
>     struct statx_timestamp {
>     	__s64	tv_sec;
>     	__u32	tv_nsec;
>     	__s32	__reserved;
>     };
> 
>     /* include/uapi/linux/time_types.h */
>     struct __kernel_timespec {
>     	__kernel_time64_t       tv_sec;                 /* seconds */
>     	long long               tv_nsec;                /* nanoseconds */
>     };
> 
>     /* tools/include/nolibc/types.h */
>     #define timespec __kernel_timespec
> 
> Without this patch, the stat_timestamps test case would fail on rv32.
> 
> Fixes: a89c937d781a ("tools/nolibc: support nanoseconds in stat()")
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  tools/include/nolibc/sys.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> index 154194056962..98cfa2f6d021 100644
> --- a/tools/include/nolibc/sys.h
> +++ b/tools/include/nolibc/sys.h
> @@ -1175,9 +1175,9 @@ int sys_stat(const char *path, struct stat *buf)
>  	buf->st_size    = statx.stx_size;
>  	buf->st_blksize = statx.stx_blksize;
>  	buf->st_blocks  = statx.stx_blocks;
> -	buf->st_atime   = statx.stx_atime.tv_sec;
> -	buf->st_mtime   = statx.stx_mtime.tv_sec;
> -	buf->st_ctime   = statx.stx_ctime.tv_sec;
> +	buf->st_atim    = (struct timespec){ .tv_sec = statx.stx_atime.tv_sec, .tv_nsec = statx.stx_atime.tv_nsec };
> +	buf->st_mtim    = (struct timespec){ .tv_sec = statx.stx_mtime.tv_sec, .tv_nsec = statx.stx_mtime.tv_nsec };
> +	buf->st_ctim    = (struct timespec){ .tv_sec = statx.stx_ctime.tv_sec, .tv_nsec = statx.stx_ctime.tv_nsec };

I would prefer to split the compound assignment into two single
assignments, though.

buf->st_ctim.tv_sec = statx.stx_ctime.tv_sec;
buf->st_ctim.tv_nsec = statx.stx_ctime.tv_nsec;

>  	return ret;
>  }
>  #else
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
