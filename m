Return-Path: <SRS0=QO1u=BC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BACC433E8
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 20:27:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D328D2065F
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 20:27:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mbF+HCSl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D328D2065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0SNAq+Q4OYgGai/ISJGw41byhgy7GXdLDYfpzwKBuww=; b=mbF+HCSl8MXjiwenWEEhW3ElI
	0orxgUM28gtn2yIImKoWgUXHK7FSJe+OXmLNZ1028xCIMpAOuXNbL0LFslh5REFyFGTL/CqUTmebV
	x6TZjkFErXJtfC/gxcfbONITt7NimurL7qMMd0RQJ/vLxlACYXXe4/BqaUJg7Hon6bgo/8128qIfm
	+jHN34cgyqCUXksVZgh+fIeW+U2+bh1mnLlupEp9gSCgiwuHYN27+OCUacjobac1JCX86DtjD+x4G
	fS8gsYe39Oc+m5KBT6br8t4x1eV1v0bJYz+wnXclWnIhsyxmUI8i3amtR1xGdsd8xIzBBFKSgxHU8
	LjmTWvEBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyhnn-0005aG-G6; Thu, 23 Jul 2020 20:26:51 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyhnk-0005Ys-3G
 for linux-riscv@lists.infradead.org; Thu, 23 Jul 2020 20:26:49 +0000
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 6EE382BA;
 Thu, 23 Jul 2020 20:26:45 +0000 (UTC)
Date: Thu, 23 Jul 2020 14:26:44 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: Re: [PATCH] docs: process/index.rst: Fix reference to nonexistent
 document
Message-ID: <20200723142644.5dd89bd4@lwn.net>
In-Reply-To: <20200718165107.625847-5-dwlsalmeida@gmail.com>
References: <20200718165107.625847-1-dwlsalmeida@gmail.com>
 <20200718165107.625847-5-dwlsalmeida@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_162648_408909_B7F73AD5 
X-CRM114-Status: GOOD (  13.84  )
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
Cc: aou@eecs.berkeley.edu, steve@sk2.org, keescook@chromium.org,
 jkosina@suse.cz, gregkh@linuxfoundation.org, paul.walmsley@sifive.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, tyhicks@canonical.com,
 clang-built-linux@googlegroups.com, palmer@dabbelt.com, jpoimboe@redhat.com,
 tglx@linutronix.de, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 18 Jul 2020 13:50:59 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> wrote:

> From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> 
> Fix the following warning:
> 
> WARNING: toctree contains reference to nonexistent document
> 'process/unaligned-memory-access'
> 
> The path to the document was wrong.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  Documentation/process/index.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/process/index.rst b/Documentation/process/index.rst
> index f07c9250c3acb..dd231ffc8422d 100644
> --- a/Documentation/process/index.rst
> +++ b/Documentation/process/index.rst
> @@ -32,7 +32,7 @@ Below are the essential guides that every developer should read.
>     kernel-enforcement-statement
>     kernel-driver-statement
>  
> -Other guides to the community that are of interest to most developers are: 
> +Other guides to the community that are of interest to most developers are:
>  
>  .. toctree::
>     :maxdepth: 1
> @@ -61,7 +61,7 @@ lack of a better place.
>     botching-up-ioctls
>     clang-format
>     ../riscv/patch-acceptance
> -   unaligned-memory-access
> +   ../core-api/unaligned-memory-access

Applied, but the right solution is probably just to list it in the
core-api book rather than here.

Thanks,

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
