Return-Path: <SRS0=uLWX=IY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90D3C433C1
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 15:43:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 925DE61A24
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 15:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 925DE61A24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CuUq6KYKTFUjtmdL151B0GyriNrJ2orUbCYvAeJl39g=; b=GNHD8lhFE/3yzB5g634x/fTEp
	SXIk2YOhSsZfBnXAKPLSDz2E28aL5ZQeDuccGt4A3s8/1eMvSInIU4FkBBW9gFKhjrZyFJNjXFvI4
	pgKG0qFdOuOK1y+DbZa0B/7FayMCvYKD+O9iuwQY2oBLGPPudxKDIp6ELqKF79ERe/9xGYoAoUkYL
	GHAiikPy0wc5spKHZ84D3umRH7HQQJFYFdUzIOPyTb50t+FnY1cl5YfokhFaHAbUXvCLwqe1t78iE
	cpDIXTHKPolHnZ91Pa5DlyX+a2FDUsziMhGCA3UBdSo0g7fWgQT+5kLWWRTvlnO3totAgZ2Ug6ymt
	E+Ly1Ei1Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPoc4-003u90-Qa; Fri, 26 Mar 2021 15:43:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPobt-003u7I-AQ; Fri, 26 Mar 2021 15:42:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F82E61A2B;
 Fri, 26 Mar 2021 15:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616773369;
 bh=vsTZ/vYOkJZ+dX5RIeYP0sX4VHZ0dMLJGNZeZ1Bm2LQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DUfi5ugO3VGJM2909lBb9UInMPNrDa6EKQqVta1cIaa0jmi9PW3AK/KjrURwAztbo
 i8x5fBqV0zqtki7tKp5qsvRSp+6JN+/eJ6Ieou5FWpav1oVdXzMR9PQmnDp1YWOfOs
 rjJ3avEH5azOsGiVuuyxYhIiIBwrj4oZjmpnUvQIneHge5J52ma4iOUznrC66JY4V8
 tPmhAAColcWAlYEXk93IiPpU/VFt/H+KOGM/w6qxjuUILfYJP2A9DdngmKH0rgvYm1
 Dqclqe/hpH6HH+86ckSN06JT8aWetb7V0wJymW/nFAsU2yRrYVduN9qA2/Ow3crzZ9
 +c/utZ5v2WmJQ==
Received: by mail-ej1-f52.google.com with SMTP id ce10so9084392ejb.6;
 Fri, 26 Mar 2021 08:42:49 -0700 (PDT)
X-Gm-Message-State: AOAM531U3Ulbl7/EZ2nOQXqqR6VQQN3dcn2fdNeSnfEq9oKxmiDXI3nP
 /0oCnYGtVRw+tjGLBBf0ywzTqnKcmCGTiOaaKw==
X-Google-Smtp-Source: ABdhPJw290YYi5Bn9eJbiCdu+yLMROaG22thNNy/WhodM/XBcUW19HUG6/I3aYcxY0qwZKx/hSfuN8oDM18cKkgl6sQ=
X-Received: by 2002:a17:906:7d48:: with SMTP id
 l8mr15784305ejp.108.1616773367877; 
 Fri, 26 Mar 2021 08:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
In-Reply-To: <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
From: Rob Herring <robh@kernel.org>
Date: Fri, 26 Mar 2021 09:42:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKr3xekKSo3DtQvOOw_VoGC=FUTagZGY5g=CGGGdUZSMQ@mail.gmail.com>
Message-ID: <CAL_JsqKr3xekKSo3DtQvOOw_VoGC=FUTagZGY5g=CGGGdUZSMQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/17] cmdline: Add generic function to build command
 line.
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Will Deacon <will@kernel.org>, Daniel Walker <danielwa@cisco.com>, 
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>, 
 "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 devicetree@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 microblaze <monstr@monstr.eu>, 
 "open list:MIPS" <linux-mips@vger.kernel.org>, nios2 <ley.foon.tan@intel.com>, 
 Openrisc <openrisc@lists.librecores.org>, linux-hexagon@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, X86 ML <x86@kernel.org>, 
 linux-xtensa@linux-xtensa.org, SH-Linux <linux-sh@vger.kernel.org>, 
 sparclinux <sparclinux@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_154253_711495_90F46C9A 
X-CRM114-Status: GOOD (  26.10  )
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

On Fri, Mar 26, 2021 at 7:44 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> This code provides architectures with a way to build command line
> based on what is built in the kernel and what is handed over by the
> bootloader, based on selected compile-time options.

Note that I have this patch pending:

https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210316193820.3137-1-alex@ghiti.fr/

It's going to need to be adapted for this. I've held off applying to
see if this gets settled.

>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v3:
> - Addressed comments from Will
> - Added capability to have src == dst
> ---
>  include/linux/cmdline.h | 57 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 include/linux/cmdline.h
>
> diff --git a/include/linux/cmdline.h b/include/linux/cmdline.h
> new file mode 100644
> index 000000000000..dea87edd41be
> --- /dev/null
> +++ b/include/linux/cmdline.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_CMDLINE_H
> +#define _LINUX_CMDLINE_H
> +
> +#include <linux/string.h>
> +
> +/* Allow architectures to override strlcat, powerpc can't use strings so early */
> +#ifndef cmdline_strlcat
> +#define cmdline_strlcat strlcat
> +#endif
> +
> +/*
> + * This function will append or prepend a builtin command line to the command
> + * line provided by the bootloader. Kconfig options can be used to alter
> + * the behavior of this builtin command line.
> + * @dst: The destination of the final appended/prepended string.
> + * @src: The starting string or NULL if there isn't one.
> + * @len: the length of dest buffer.
> + */
> +static __always_inline void __cmdline_build(char *dst, const char *src, size_t len)
> +{
> +       if (!len || src == dst)
> +               return;
> +
> +       if (IS_ENABLED(CONFIG_CMDLINE_FORCE) || !src) {
> +               dst[0] = 0;
> +               cmdline_strlcat(dst, CONFIG_CMDLINE, len);
> +               return;
> +       }
> +
> +       if (dst != src)
> +               dst[0] = 0;
> +
> +       if (IS_ENABLED(CONFIG_CMDLINE_PREPEND))
> +               cmdline_strlcat(dst, CONFIG_CMDLINE " ", len);
> +
> +       cmdline_strlcat(dst, src, len);
> +
> +       if (IS_ENABLED(CONFIG_CMDLINE_EXTEND))

Should be APPEND.

> +               cmdline_strlcat(dst, " " CONFIG_CMDLINE, len);
> +}
> +
> +#define cmdline_build(dst, src, len) do {                              \

Perhaps a comment why we need this to be a define.

> +       char *__c_dst = (dst);                                          \
> +       const char *__c_src = (src);                                    \
> +                                                                       \
> +       if (__c_src == __c_dst) {                                       \
> +               static char __c_tmp[COMMAND_LINE_SIZE] __initdata = ""; \
> +                                                                       \
> +               cmdline_strlcat(__c_tmp, __c_src, COMMAND_LINE_SIZE);   \
> +               __cmdline_build(__c_dst, __c_tmp, (len));               \
> +       } else {                                                        \
> +               __cmdline_build(__c_dst, __c_src, (len));               \
> +       }                                                               \
> +} while (0)
> +
> +#endif /* _LINUX_CMDLINE_H */
> --
> 2.25.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
