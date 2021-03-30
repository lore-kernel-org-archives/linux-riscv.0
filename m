Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A32D6C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 17:27:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D0596196C
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 17:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D0596196C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=cisco.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+zABfrcNuAWIP8fvhsLVUWOiJIkq+bCCPg5FFnz6UOc=; b=ASDILX69SaGIrHpJM2qQl+ZrL
	l0O65dgiqm2vrb8wqhmh9CUqNvnPVdS6G/UBGTHZG7okCBHezI2oGeCBUNI8vDqsTYudWOxkfzR+V
	kHeKrmbRr0m1lrBv185jy+VLDskNBAWqi7bgD+1y9R65fNciPSqk9m+8MPSME470Sf0MeLKRKtbiu
	YAzP0HPTNYz6fnlWERyIjTCPnVRKI8CyLDx+7YkI8HDQogdxv1H6UY15hR2dthAf3gEt99TlD+b2s
	WGCqo9ceG4dm091pkwZ1d7TW/zQRUSYt5LOe96mrULqYspQseLEDx0WFaAtrWsr38F7Xv0LMAJs9d
	+7XWm239w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRI9M-004Rg0-OK; Tue, 30 Mar 2021 17:27:32 +0000
Received: from rcdn-iport-6.cisco.com ([173.37.86.77])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRI9D-004ReN-U3; Tue, 30 Mar 2021 17:27:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=1640; q=dns/txt; s=iport;
 t=1617125244; x=1618334844;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DLlq6Eg2HUUvE9Fdg0Ebob6Tw5pX5R4uRXQoNV4sDwc=;
 b=AZ/drV3Wsv41owZ2NuZOdxoA8nTddNyk+eV/sp/13WYgrgFBYjT5oEwC
 6eczwoU1uQdLWtDyPcr6e5wKY1DN0A2EGJMXo3TxAQizmdTfZXj0ZKCT7
 SvAywcgfgOQ+rtfU/zG6BUD9omFdFLEu+Nf54mvwZ5eDCzABulq2MT1W3 8=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AoTmckqE8NgKcaaN3pLqEVceALOonbusQ8z?=
 =?us-ascii?q?AX/mp6ICY7TuWzkceykPMHkTL1ki8WQnE8mdaGUZPwJE/035hz/IUXIPOeTB?=
 =?us-ascii?q?Dr0VHYTr1KwIP+z1TbcRHW2fVa0c5bHpRWKNq1NlRiiNa/3Q/QKadF/PCi0I?=
 =?us-ascii?q?SFwdjT1G1sSwYCUdAC0y5cBhyAGkN7AClqbKBZKLOm6sBKpyWtdB0sB6zROl?=
 =?us-ascii?q?A/U+fOvNHNnp79CCRnOzcc9AKMgTm0gYSVLzGk2H4lPw9n8PMF7XXPlRD/6+?=
 =?us-ascii?q?GFtfy2oyWssVP73tBxhMbrzMdFCYi3rvUtbh/oigquee1aKtq/gAw=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BhAABKXmNg/4UNJK1aHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQFAgTwHAQELAYIqgUwBOTGMZYkukAgWikWBfAsBAQENAQE0BAE?=
 =?us-ascii?q?BhFACgXoCJTQJDgIDAQEMAQEFAQEBAgEGBHGFboZFAQU6PxALGC48GwYThXi?=
 =?us-ascii?q?rInWBNIkLgUQigRcBjUkmHIFJQoESgm4uPoo2BIJHgQ6CMCyeTZwigxGBI5s?=
 =?us-ascii?q?2MRCkQrgSAgQGBQIWgVQ6gVkzGggbFYMkUBkNnQchAy84AgYKAQEDCYkfAQE?=
X-IronPort-AV: E=Sophos;i="5.81,291,1610409600"; d="scan'208";a="880406225"
Received: from alln-core-11.cisco.com ([173.36.13.133])
 by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 30 Mar 2021 17:27:19 +0000
Received: from zorba ([10.24.8.123])
 by alln-core-11.cisco.com (8.15.2/8.15.2) with ESMTPS id 12UHREPN013894
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 30 Mar 2021 17:27:16 GMT
Date: Tue, 30 Mar 2021 10:27:14 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: will@kernel.org, robh@kernel.org, daniel@gimpelevich.san-francisco.ca.us, 
 linux-arch@vger.kernel.org, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, microblaze <monstr@monstr.eu>,
 linux-mips@vger.kernel.org, nios2 <ley.foon.tan@intel.com>,
 openrisc@lists.librecores.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, x86@kernel.org,
 linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org
Subject: Re: [PATCH v3 01/17] cmdline: Add generic function to build command
 line.
Message-ID: <20210330172714.GR109100@zorba>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
X-Outbound-SMTP-Client: 10.24.8.123, [10.24.8.123]
X-Outbound-Node: alln-core-11.cisco.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_182724_401204_E39CB165 
X-CRM114-Status: GOOD (  21.15  )
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

On Fri, Mar 26, 2021 at 01:44:48PM +0000, Christophe Leroy wrote:
> This code provides architectures with a way to build command line
> based on what is built in the kernel and what is handed over by the
> bootloader, based on selected compile-time options.
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

Append or prepend ? Cisco requires both at the same time. This is why my
implementation provides both. I can't use this with both at once.

Daniel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
