Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F743C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 05:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uo/CecDYc+FtlWjbPSShdsJpmcYx620yz0tYbOIXYPI=; b=fflOGh33FmjXDk
	0j2E2WZkcce5rjN8qhQDoJXwqK9vtjWdhpvNOA5/SNmTSUFgqaFJ7HoMpckkY4Sbo4m787pLJTC1m
	4SdoopXSFzvbeV5bNCsde5Ls4fdrprbKDpFQFKZ2hvDrG9HN/9HiGrVnVM9sLUE91I0UfjN9NsRLM
	/8VbrDJH79bSLU/4pnzLUK5L9wnvxvqjlbcgEhpzJzrf8Nq92p+TeXyZ5Fy53gINwIeRkS0DH7jNl
	IA8+ErNGCuCg/9nxcoxCwM7tLfx9PH48f/7QKeRLGEmfBElLn8g/fvoYvycMhG8/TpfblbLSpWf8u
	CMSZZot5FPl68sQfIJMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ro1-00CSey-0v;
	Tue, 30 May 2023 05:22:01 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3rny-00CSc8-2n
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 05:22:00 +0000
X-QQ-mid: bizesmtp86t1685424093t09pbsru
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 13:21:32 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: q+yjhizk/eK4Twfz5/tkrE7vplCQXvJ4uATWgDp4FlclbHqgTQzECLOaM/5aW
	ciP3qrlZXDUOoqXXgEGPnefG1bscVwQQcb7SNzzTIUIyuSYUnjA8MKAIs/4DWDkTv1UZ/hm
	RMJH3jBhaBXbW+jZobqHikfj6kgNNqri+YL8Wf/avB5c+itkx6m82TmJENM86el0C6f/Hah
	qDPSYwt8xGHJ0WHIxeW8UvilJGfwXk5SfSfWmTbHMizcoiuPY/0TCVlG/oPymB/LEqFCkxa
	jd4aj/2GFDHuQnp5eeriEYwyGxXrr+Y3YlUbxdCrz7RaTK2mcAvBq2mBB0Fb9NGSN+dEcTt
	TpvzNke228KrB4bPGDkzB13vfe9pBxTtmH12H0PsMyn3IJ2toM=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6904062556633079927
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	arnd@arndb.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 04/13] tools/nolibc: add missing nanoseconds support for __NR_statx
Date: Tue, 30 May 2023 13:21:32 +0800
Message-Id: <20230530052132.364685-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <3a3edd48-1ace-4c89-89e8-9c594dd1b3c9@t-8ch.de>
References: <3a3edd48-1ace-4c89-89e8-9c594dd1b3c9@t-8ch.de>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_222159_204069_DC04665A 
X-CRM114-Status: GOOD (  20.89  )
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

Thomas, Arnd, Willy

> On 2023-05-30 03:50:34+0800, Zhangjin Wu wrote:
> > Commit a89c937d781a ("tools/nolibc: support nanoseconds in stat()")
> > added nanoseconds for stat() but missed the statx case, this adds it.
> 
> Welp, I should have thought of that.
> At least the testcase seems to have been useful.
>

yeah, your testcase telled me this issue.

> Thanks for the fix!
> 
> > The stx_atime, stx_mtime, stx_ctime are in type of 'struct
> > statx_timestamp', which is incompatible with 'struct timespec', should
> > convert explicitly.
> > 
> >     /* include/uapi/linux/stat.h */
> > 
> >     struct statx_timestamp {
> >     	__s64	tv_sec;
> >     	__u32	tv_nsec;
> >     	__s32	__reserved;
> >     };
> > 
> >     /* include/uapi/linux/time_types.h */
> >     struct __kernel_timespec {
> >     	__kernel_time64_t       tv_sec;                 /* seconds */
> >     	long long               tv_nsec;                /* nanoseconds */
> >     };
> > 
> >     /* tools/include/nolibc/types.h */
> >     #define timespec __kernel_timespec
> > 
> > Without this patch, the stat_timestamps test case would fail on rv32.
> > 
> > Fixes: a89c937d781a ("tools/nolibc: support nanoseconds in stat()")
> > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > ---
> >  tools/include/nolibc/sys.h | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> > index 154194056962..98cfa2f6d021 100644
> > --- a/tools/include/nolibc/sys.h
> > +++ b/tools/include/nolibc/sys.h
> > @@ -1175,9 +1175,9 @@ int sys_stat(const char *path, struct stat *buf)
> >  	buf->st_size    = statx.stx_size;
> >  	buf->st_blksize = statx.stx_blksize;
> >  	buf->st_blocks  = statx.stx_blocks;
> > -	buf->st_atime   = statx.stx_atime.tv_sec;
> > -	buf->st_mtime   = statx.stx_mtime.tv_sec;
> > -	buf->st_ctime   = statx.stx_ctime.tv_sec;
> > +	buf->st_atim    = (struct timespec){ .tv_sec = statx.stx_atime.tv_sec, .tv_nsec = statx.stx_atime.tv_nsec };
> > +	buf->st_mtim    = (struct timespec){ .tv_sec = statx.stx_mtime.tv_sec, .tv_nsec = statx.stx_mtime.tv_nsec };
> > +	buf->st_ctim    = (struct timespec){ .tv_sec = statx.stx_ctime.tv_sec, .tv_nsec = statx.stx_ctime.tv_nsec };
> 
> I would prefer to split the compound assignment into two single
> assignments, though.
> 
> buf->st_ctim.tv_sec = statx.stx_ctime.tv_sec;
> buf->st_ctim.tv_nsec = statx.stx_ctime.tv_nsec;
>

Ok, will update it in the v3 revision.

And further, what about removing the other !statx parts
(__NR_newfstatat, __NR_stat)? just like we are doing for the other 64bit
syscalls (llseek and time65).

Best regards,
Zhangjin

> >  	return ret;
> >  }
> >  #else

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
