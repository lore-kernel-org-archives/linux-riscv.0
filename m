Return-Path: <SRS0=b3sz=MI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FAD7C43382
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 17:31:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 575CD2152F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 17:31:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I/4Qt6C3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oHraBigd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 575CD2152F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=opCgMHxfxQzA4gG1xYOAVj0J2NT1yo0Tk95OE+tLdzM=; b=I/4Qt6C3HQuG8Y
	VEisP/5YZW3+M5BcPpI95FDYO/4+JSnr5vQ+9WG+qvajGXNQGXMdsB88vMvOGOpzrH8kyl7ux70+u
	whsEPZ46kYEZ3rtexHzZZkPdxYCDWvdkCdIGjgr3+Lehm0iFv6YlubC4i1Qr6QYJH/+/ULlMIatzQ
	XR/otwCqmW3c57u18OV+8ptaCFlfboy5ym0+6ek84l6OqZWLNd+nV13CR8PN7en3e8arzJLbpfm6t
	zI0nM5a8mk+lfivhZV1xtNkjU+NHbw9xNfaUOPkutVTcT+eAZkG1sXVIioEJ5WAWl6HRMH3Co0Z0m
	CyigEAMqJFlKO6+P1XCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g5Df6-0008TU-Tg; Wed, 26 Sep 2018 17:31:44 +0000
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5D9o-0005va-31; Wed, 26 Sep 2018 16:59:28 +0000
Received: by mail-it1-x141.google.com with SMTP id c85-v6so3852688itd.1;
 Wed, 26 Sep 2018 09:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sk4phsQMsWm/uLqtYjyTCCVZkWmOftfD6xEiXH8xJ4U=;
 b=oHraBigdw5BEX0LUXs9GlUBIE7zHK53SIga1HWIx81sxIHv+NoQQonTbfj0UDv0Z+J
 EQSG24+ZrTq2bjXRoMcoLR9rgJsgajjfUmZPLqE2bDOYvYgnz360+UkBGbEDzcJnF0tq
 6K5wSTz3jRyehlYV6yPMPvwuOsdYapx5l6cpXY8Mkbi6V3d1SE8CtJm9K5lGwAdAUrlN
 acztf9YRzQth69K5a8XlkVNbBBuLDtkA07DrDWyTfFom8LBLIbsW7dzc+R1LcNm7lpk9
 76Exn3TO6BvTde5ueWmipdKNRWdyh+ywfJROOPd3cOVszLtHI3cLSo+bqjdR/FhrC/tH
 cEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sk4phsQMsWm/uLqtYjyTCCVZkWmOftfD6xEiXH8xJ4U=;
 b=M/O1wHTBoaDyHgXW5yG71iy6ASqSapiftY31av2yQmdM9lnPTIFwFXHHsT/QONAELL
 mCF957dE84tcE3SumjQcxbewWoTVKkNHadb0UF9NJD3S0ccvIhyLzeLUhraKmx5mxLYd
 RtosIQvj4ZA37qXO60W8eFok7/a0KQm7Mkj9g4IQzrcShmshgGHiqp0OkKM7Ee16Xwku
 sVcZGImyuL2KJZVNJnMqKjndSoeedCovaN8ASz9WyuKlicedOCYELorB68Xhry3PV4lQ
 //gAMLFZ8fe0/aelnkct6Gv6eyjopd3p15UaXkskHd5NgIV8/U/5ijOnUvUBELWVa6Hs
 SmWw==
X-Gm-Message-State: ABuFfogQCDLzh0JPYvW4PDkmQ3ymGor76Vho2jgU+ig6j99ul26i5XK6
 /cIyirQKNi8jJC9WH3U2MzU9WKpC5nHV6gN6GFA=
X-Google-Smtp-Source: ACcGV61r76+3aUI+rvs9VbR2N0bAv7M/QbDxsEezQCK5N1Ftrt8LN0aVWm4RPYDKt2cA/F5iz5Vl4HGEmxZqV8pRXgw=
X-Received: by 2002:a24:9a83:: with SMTP id
 l125-v6mr6225072ite.76.1537981132489; 
 Wed, 26 Sep 2018 09:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <1536927045-23536-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1536927045-23536-4-git-send-email-rppt@linux.vnet.ibm.com>
In-Reply-To: <1536927045-23536-4-git-send-email-rppt@linux.vnet.ibm.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Wed, 26 Sep 2018 09:58:41 -0700
Message-ID:
 <CAKgT0UdP=78RsWHMxFu4PD8a3AhA3eNcG68Z_9aGY0vhOKf7xA@mail.gmail.com>
Subject: Re: [PATCH 03/30] mm: remove CONFIG_HAVE_MEMBLOCK
To: rppt@linux.vnet.ibm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180926_095924_170589_31D38A7C 
X-CRM114-Status: GOOD (  12.61  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-mips@linux-mips.org, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, palmer@sifive.com,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 linux-mm <linux-mm@kvack.org>, dalias@libc.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 jonas@southpole.se, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 mpe@ellerman.id.au, jejb@parisc-linux.org, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, msalter@redhat.com,
 mattst88@gmail.com, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, green.hu@gmail.com,
 nios2-dev@lists.rocketboards.org, Thomas Gleixner <tglx@linutronix.de>,
 gxt@pku.edu.cn, linux-arm-kernel@lists.infradead.org, chris@zankel.net,
 monstr@monstr.eu, Tony Luck <tony.luck@intel.com>,
 linux-parisc@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, fancer.lancer@gmail.com,
 rkuo@codeaurora.org, paul.burton@mips.com, vgupta@synopsys.com, richard@nod.at,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, lftan@altera.com,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180926165841.6CFzIB54sNaWKf9YNmgTx5v3yLRDFqljb2inI9L78J4@z>

On Fri, Sep 14, 2018 at 5:11 AM Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:
>
> All architecures use memblock for early memory management. There is no need
> for the CONFIG_HAVE_MEMBLOCK configuration option.
>
> Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>

<snip>

> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index 5169205..4ae91fc 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -2,7 +2,6 @@
>  #define _LINUX_MEMBLOCK_H
>  #ifdef __KERNEL__
>
> -#ifdef CONFIG_HAVE_MEMBLOCK
>  /*
>   * Logical memory blocks.
>   *
> @@ -460,7 +459,6 @@ static inline phys_addr_t memblock_alloc(phys_addr_t size, phys_addr_t align)
>  {
>         return 0;
>  }
> -#endif /* CONFIG_HAVE_MEMBLOCK */
>
>  #endif /* __KERNEL__ */

There was an #else above this section and I believe it and the code
after it needs to be stripped as well.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
