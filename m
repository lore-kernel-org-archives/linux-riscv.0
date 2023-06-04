Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C241C7EE29
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 19:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LCYqYoq5G6HVqWrC6WHbuk61zewF9mVCiC+qOGHvtH0=; b=ptrluiAWIEmjL0
	jBSSLBJdppRxRqmev6X1q6oDf0ljn3a4l4lLsdePfHKuAqANyG1Fa5uS4+rC8k7hM4sUuiFs38gA4
	Uhse7RQMH8XZQdPeRHxwOMtbVXkhJ0Eopib5hSalSkEwxNoYpIMDw4KEsZuEmPSeLx9y5sgsjK1rL
	OT/JuBswIas+gUuG0ylqa7Nade1bXnj2oU9fR/G9UmfrOTHZOpUzppIDiewELZylScNT6xN6vkr1V
	3b3clahNRrRn0wbXfdAZk1Ahaz5cr6E5Ph2AYIY41rzPtpzFK0jPeyibMRq9PH01R6MB7D1fMLyKK
	Bw9ObOw3x3JoOeIndmdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5tHv-00Csm7-23;
	Sun, 04 Jun 2023 19:21:15 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5tHt-00Csky-0M
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jun 2023 19:21:14 +0000
Date: Sun, 4 Jun 2023 21:21:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1685906469; bh=1UClnzbPKFLgB8+m4Ye4NhmglZ0eNYJbm+haocS29Dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MHF1QbHZGPslYjUKOjgngaUKFdFNWbjneJMTIO4Dx43CHu6UxHzxKpry/lClXyJ46
	 B+i7Qp5tyXzU3frQnpC5kEegItHMHDnt+hA4FcENSbs9tIhkbXpWVcTtcL7QbldFEs
	 uo7Im8wBP/JfQph7F8Vf3H024I4lnFrqYV0HHSRA=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Willy Tarreau <w@1wt.eu>
Cc: Zhangjin Wu <falcon@tinylab.org>, arnd@arndb.de, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/4] tools/nolibc: unistd.h: add __syscall() and
 __syscall_ret() helpers
Message-ID: <ea4e7442-7223-4211-ba29-70821e907888@t-8ch.de>
References: <cover.1685856497.git.falcon@tinylab.org>
 <f549b27981484b429b7c7f98e212bf3c5561724f.1685856497.git.falcon@tinylab.org>
 <ZHyKoeSMaOHtSr58@1wt.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZHyKoeSMaOHtSr58@1wt.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_122113_313541_7EF82D4D 
X-CRM114-Status: GOOD (  28.31  )
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

On 2023-06-04 14:59:13+0200, Willy Tarreau wrote:
> Hi Zhangjin,
> 
> On Sun, Jun 04, 2023 at 01:34:29PM +0800, Zhangjin Wu wrote:
> > most of the library routines share the same code model, let's add some
> > macros to simplify the coding and shrink the code lines too.
> > 
> > One added for syscall return, one added for syscall call, both of them
> > can get the typeof 'return value' automatically.
> > 
> > To get the return type of syscalls, __auto_type is better than typeof(),
> > but it is not supported by the old compilers (before 2013, see [1]), so,
> > use typeof() here.
> > 
> > [1]: https://gcc.gnu.org/legacy-ml/gcc-patches/2013-11/msg01378.html
> > 
> > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > ---
> >  tools/include/nolibc/sys.h | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> > index 1d6f33f58629..937a8578e3d4 100644
> > --- a/tools/include/nolibc/sys.h
> > +++ b/tools/include/nolibc/sys.h
> > @@ -28,6 +28,21 @@
> >  #include "errno.h"
> >  #include "types.h"
> >  
> > +/* Syscall call and return helpers */
> > +#define __syscall_ret(ret)						\
> > +({									\
> > +	if (ret < 0) {							\
> > +		SET_ERRNO(-ret);					\
> > +		ret = (typeof(ret))-1;					\
> > +	}								\
> > +	ret;								\
> > +})
> > +
> > +#define __syscall(name, ...)						\
> > +({									\
> > +	typeof(sys_##name(__VA_ARGS__)) ret = sys_##name(__VA_ARGS__);	\
> > +	__syscall_ret(ret);						\
> > +})
> 
> Well, I personally don't find that it increases legibility, on the
> opposite. At first when reading the series, I thought you had dropped
> errno setting on return. I think the reason is that when reading that
> last macro, it's not at all obvious that __syscall_ret() is actually
> modifying this ret value *and* returning it as the macro's result.
> 
> If we'd want to go down that route, I suspect that something like this
> would at least hint about what is being returned:
> 
> +#define __syscall(name, ...)						\
> +({									\
> +	typeof(sys_##name(__VA_ARGS__)) ret = sys_##name(__VA_ARGS__);	\
> +	ret = __syscall_ret(ret);					\
> +})
> 
> But I'm interested in others' opinion on this, particularly Thomas and
> Arnd who review a significant number of patches. For now I prefer not
> to take it before we've settled on a choice.

While I see the value in factoring out this pattern I'm also not really
happy with the implementation.
Especially the magic delegation to "sys_##name".

What about something like this:

static inline long __ret_as_errno(long ret) /* or some other name */
{
	if (ret < 0) {
		SET_ERRNO(-ret);
		ret = -1;
	}
	return ret;
}

This avoids another macro by using a normal function.

Syscall return values should always fit into long, at least
extrapolating from syscall(2) and the fact that they are returned in
registers.

It would be a bit more verbose:

int chdir(const char *path)
{
	return __ret_as_errno(sys_chdir(path));
}

But it's clear what's going on and also just one line.

Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
