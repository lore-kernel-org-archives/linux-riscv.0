Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA6EEB64D9
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Jul 2023 18:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r5iwuMfHbN9r7eFHYvAa9sclGxeSWtdO/jdF6vOGOsk=; b=L0tHm2eFEGYBmT
	I07nIY9qVi6lm7sJk8SYc7B9CCMnhou/PD+ApyHRET6L9OqcRl9bltU7fIt5Vpdd+giGKHG9badIS
	3WpLMD+zQma5CvFY1z2Zhw7tVbOgZoA7yLLVLON8E/siX+agOcc2tBLdyK3T3lXJrIUfLSwKlJ6SV
	vpV7qs70/g3ClGMt/+u//DXxU2C9rgK1Np5BUW5ynB8X5r/jbAtDI9wmWfXDPqmmRCrvj1otiCOHA
	Q3Z9tBxN5KNsoMWZfsW5SKc0pfILsq5KZkO9TJqpuhEtao2J9r4x0uwx30uv9suPe/Koa/BTV7KhN
	6DKrp9J56SttoCI4rQYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG2A7-008Nia-1w;
	Sun, 02 Jul 2023 18:51:07 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG2A4-008Ngu-07
	for linux-riscv@lists.infradead.org;
	Sun, 02 Jul 2023 18:51:06 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 362Ioxts017366;
	Sun, 2 Jul 2023 20:50:59 +0200
Date: Sun, 2 Jul 2023 20:50:59 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: thomas@t-8ch.de, arnd@arndb.de, david.laight@aculab.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 07/14] tools/nolibc: arch-loongarch.h: shrink with
 SYSCALL_CLOBBERLIST
Message-ID: <20230702185059.GG16233@1wt.eu>
References: <cover.1687957589.git.falcon@tinylab.org>
 <a906a8e5bb39d88fee89be8f2bca8bf62307d468.1687957589.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a906a8e5bb39d88fee89be8f2bca8bf62307d468.1687957589.git.falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_115104_916789_43C67DA6 
X-CRM114-Status: GOOD (  14.47  )
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

On Wed, Jun 28, 2023 at 09:22:21PM +0800, Zhangjin Wu wrote:
> my_syscall<N> share a same long clobber list, define a macro for them.
> 
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  tools/include/nolibc/arch-loongarch.h | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/include/nolibc/arch-loongarch.h b/tools/include/nolibc/arch-loongarch.h
> index 292d6a58dc87..fbb4844f7993 100644
> --- a/tools/include/nolibc/arch-loongarch.h
> +++ b/tools/include/nolibc/arch-loongarch.h
> @@ -23,6 +23,10 @@
>   */
>  #define __ARCH_WANT_SYS_PSELECT6
>  
> +#define SYSCALL_CLOBBERLIST			\
> +	"memory", "$t0", "$t1", "$t2", "$t3",	\
> +	"$t4", "$t5", "$t6", "$t7", "$t8"
> +

That's a good idea, but please be careful when adding macro definitions,
we're in code that is used by user space we have no control on, and we're
polluting the end user's macro namespace with plenty of names. While one
could argue that it's unlikely that some program already defines and uses
SYSCALL_CLOBBERLIST, actually with low-level code it's fairly possible.

Till now most of the definitions were for stuff that user-space really
needs (e.g. STDIN_FILENO, various integer limits). If we start to declare
random macros for internal use, at least we should probably prefix them
with _NOLIBC_ or something like this to avoid the risk of collision.

Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
