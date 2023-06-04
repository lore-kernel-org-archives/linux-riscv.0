Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8165CC7EE29
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 12:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MayPmsT3rdQ0aTWHj4+K0ssNM2FqNtMKs7QSJuIJGyg=; b=NkiGw1scGCVe5a
	vu4pAPD8a7KFeuNfzenM3kG7IQqQa7G0XEoOhJQj7jawAFRldQk0G9LJhWElHBPZQfIp07rck0nf2
	j7PeCzhbIm8ocDfHyhAWj+mTyUPJ8KpRhCilIKeiJ5jG0AB7tqsM+p94MFp4w+KxfDX+GHWGiDnmJ
	5EwUYSc3riR+j/rPRBtCLT6diB5j6jLGJ/Eo182oY/Y3N8CwsBszSiE0qAsNU4fxuGmXVtyxoCCIv
	sBJbCyqBcq9KnemK32jPXgCpy5ByISdZEsVdq+/IymseMgA5P1ntl00PgmjfJT7nWKYaOrsqPAZur
	NOI/h/VtHu1tNt1aVKKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5nKK-00CBYP-0Y;
	Sun, 04 Jun 2023 12:59:20 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5nKG-00CBX0-2A
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jun 2023 12:59:18 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 354CxDHH002392;
	Sun, 4 Jun 2023 14:59:13 +0200
Date: Sun, 4 Jun 2023 14:59:13 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        thomas@t-8ch.de
Subject: Re: [PATCH 1/4] tools/nolibc: unistd.h: add __syscall() and
 __syscall_ret() helpers
Message-ID: <ZHyKoeSMaOHtSr58@1wt.eu>
References: <cover.1685856497.git.falcon@tinylab.org>
 <f549b27981484b429b7c7f98e212bf3c5561724f.1685856497.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f549b27981484b429b7c7f98e212bf3c5561724f.1685856497.git.falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_055917_005158_E9A23566 
X-CRM114-Status: GOOD (  21.74  )
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

On Sun, Jun 04, 2023 at 01:34:29PM +0800, Zhangjin Wu wrote:
> most of the library routines share the same code model, let's add some
> macros to simplify the coding and shrink the code lines too.
> 
> One added for syscall return, one added for syscall call, both of them
> can get the typeof 'return value' automatically.
> 
> To get the return type of syscalls, __auto_type is better than typeof(),
> but it is not supported by the old compilers (before 2013, see [1]), so,
> use typeof() here.
> 
> [1]: https://gcc.gnu.org/legacy-ml/gcc-patches/2013-11/msg01378.html
> 
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  tools/include/nolibc/sys.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> index 1d6f33f58629..937a8578e3d4 100644
> --- a/tools/include/nolibc/sys.h
> +++ b/tools/include/nolibc/sys.h
> @@ -28,6 +28,21 @@
>  #include "errno.h"
>  #include "types.h"
>  
> +/* Syscall call and return helpers */
> +#define __syscall_ret(ret)						\
> +({									\
> +	if (ret < 0) {							\
> +		SET_ERRNO(-ret);					\
> +		ret = (typeof(ret))-1;					\
> +	}								\
> +	ret;								\
> +})
> +
> +#define __syscall(name, ...)						\
> +({									\
> +	typeof(sys_##name(__VA_ARGS__)) ret = sys_##name(__VA_ARGS__);	\
> +	__syscall_ret(ret);						\
> +})

Well, I personally don't find that it increases legibility, on the
opposite. At first when reading the series, I thought you had dropped
errno setting on return. I think the reason is that when reading that
last macro, it's not at all obvious that __syscall_ret() is actually
modifying this ret value *and* returning it as the macro's result.

If we'd want to go down that route, I suspect that something like this
would at least hint about what is being returned:

+#define __syscall(name, ...)						\
+({									\
+	typeof(sys_##name(__VA_ARGS__)) ret = sys_##name(__VA_ARGS__);	\
+	ret = __syscall_ret(ret);					\
+})

But I'm interested in others' opinion on this, particularly Thomas and
Arnd who review a significant number of patches. For now I prefer not
to take it before we've settled on a choice.

Thanks,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
