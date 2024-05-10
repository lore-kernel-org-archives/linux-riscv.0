Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA9CC25B10
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 06:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZXPOskRY+jAjAkYmv+uPqQ7/zX+hYeopkIJi7AROY+E=; b=iTLSsXhuG1L1tO
	QfLvJHaBB2cbkrBopK03K1Ic32OxeUcachMlR2OIPrPSi+hUu4llTaN9nyQDvm66hykYc0GBl6j9o
	KVaolkEnGxPci79BFEw4l4jMimMHZQ8CsuvbOPyhaRB1qSvuIx+Y8MD+3YnpwfdxYfFk02JTg1pCx
	IwUSxAV+o/2Wb1lO0+ZOO12yHx33eKbUxtcSWeNPW5Sgf94nvL7dvErifC3LBodSIHbfmUd88Lh43
	C4A7jbW/+CHs0Tsp52O41RBExfUkc9N1HXk57xTT8w8TikuY78Ip846gb2Tx/9+uaYHl1LNuI0c0X
	cg4z3yXSOsGlN3gIOsPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5KCx-00000004Hgc-1uDz;
	Fri, 10 May 2024 06:58:19 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5KCt-00000004HfH-4Ao3
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 06:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1715324286;
	bh=ze4zdjo0fbz33aF2z7EukPA4jLCJ45hoe9ptXCI2FWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LoPMsBkp+4SADwS6jrdQNBJGi7DCW73il17aUnDwIa1oyXji8Q/4pc/iKFIzJLY/c
	 Q+z//3FFDHszb0g6PtGL5I026GJFKPn+JmHgnAvadcY419eX/foh0ynFGckgalFFOq
	 HLg577n8fZ8bMgT8eQfvMVA4UfdUCoQF6nttbLmM=
Date: Fri, 10 May 2024 08:58:05 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Edward Liaw <edliaw@google.com>
Cc: shuah@kernel.org, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Christian Brauner <brauner@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Willy Tarreau <w@1wt.eu>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH v4 37/66] selftests/nolibc: Drop define _GNU_SOURCE
Message-ID: <b2ed9fed-0263-405d-9e5a-71c49421619a@t-8ch.de>
References: <20240510000842.410729-1-edliaw@google.com>
 <20240510000842.410729-38-edliaw@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240510000842.410729-38-edliaw@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_235816_229645_FBD84F56 
X-CRM114-Status: GOOD (  12.28  )
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

Hi Edward,

On 2024-05-10 00:06:54+0000, Edward Liaw wrote:
> _GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
> redefinition warnings.

The nolibc tests do not use lib.mk.

This change breaks "make libc-test", please drop it.

> Signed-off-by: Edward Liaw <edliaw@google.com>
> ---
>  tools/testing/selftests/nolibc/nolibc-test.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> index 94bb6e11c16f..a28813f4367f 100644
> --- a/tools/testing/selftests/nolibc/nolibc-test.c
> +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> @@ -1,6 +1,4 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -
> -#define _GNU_SOURCE
>  #define _LARGEFILE64_SOURCE
>  
>  /* libc-specific include files
> -- 
> 2.45.0.118.g7fe29c98d7-goog

Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
