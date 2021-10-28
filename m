Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9D4C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 22:33:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42FCA610FC
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 22:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42FCA610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1MHg9Y0hgSb5f5weixXGweRTILLQDn8rdE0E11OxOno=; b=wO8oavB8QmD12F
	JQZ2tL8IzSx8aUu8KS+UvvPYGg/fBHBeSjtZoUqvXozgH4pZ2DkqR/m0tM4q7HXI9tULVorY4IsOz
	TOg041hyjZlrTE8rZ5OjwgJX8sDjPj9IER7mURFj6WdeAtfY6yMIXnAOyxvuKW/jX2NUNQnKzwIia
	kdOtoXS+mfDJ9HoXWF4kam6bCt5sOUJK21K8sQtVRUlnwgep0RYx+q8GSwCjAP7xcRRYbUkIhdKq8
	xXy4yeixaNJjUWzpxeUwaKwVpsbRoMfEkHD2oWAkrHJ53Tt74374ndXRal4akWNojGsjtYJOeU5OD
	NQHzlqis5ut5sIcMQDNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgDxc-009FrT-FC; Thu, 28 Oct 2021 22:33:24 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgA3O-008rAK-Fa
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 18:23:07 +0000
Received: by mail-oi1-x22d.google.com with SMTP id z126so9485180oiz.12
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 11:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=huVvxmimD4yAH/A6Y9OLvaPoqMhARnPLJLBzkidypAY=;
 b=EpQ4Cgk/KRPsVZSO8XT8ym1bp9HATFUscqocrjA4GZjp4lO33ltGHl2qqr+IY6gN0N
 ROpNZ6dA/QQJStbTYEiiFsBbxTZZwCPftutLo7N9mIUY3DgpZvZRQ/yNxW4HGfJMYOFN
 QRJ4r78iauQY6KYGUB9ye/KMJTuxu8GfJKN0QXX6Z+wybNYVv3ysrLzPl4InXvB6MC0a
 QjD3UuLNVNYoPSvfVmy+2hyxTJdH5nvludTwp+qnqvFb3FwvfCft6WfsvrEKbJjeE1pA
 3F6YprS4hiWJv0sC5Z2myndgGNLYxuKSzTJaU7WltN4Tp9EPzqLq0BtGgDgM5PYeGyV/
 Zfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mime-version:content-disposition;
 bh=huVvxmimD4yAH/A6Y9OLvaPoqMhARnPLJLBzkidypAY=;
 b=hWtu4WxuuzSOgC4RjsagkTVSlZ8sss5mJkkk5+uXtxb/EcQ2t4y7agT6w5RPIuvs9M
 3f/pzzuLGKs/KHiSyrlNtFrfhe7zLFHC7l/8nlbmAGYoCyngHCyrBJ5KsYMyKR0MzS6f
 SoSwZV/tFDD2GnAMSQvh4fc0S5RbzogwFEZLLkpXp1lIImRrqKZ5l6GsDLhjT4HdAKfM
 HT6LtjRpZgsN6IIzBHyToiLvfqpKylW7Ahx2p3JlUbIGgBy0JxmQj3VijELcJLL3XmWU
 TcY681i2+AUpTDgpoi5/p3FzYWjAJEEog5d+Z3FipzwyJmXib4DcotB0rl1HTh0tObA0
 FUdA==
X-Gm-Message-State: AOAM533HAQqjFf1jlCGENPV+X2A/YHW2zhZrPMRgaCRLRQjrEvd3JrRU
 HJ7MOyQo15kSNC7qIac/sJ8=
X-Google-Smtp-Source: ABdhPJwkEkQDrdteZwRxlQLVHCdQqVNVv5YrcVd2q+VPWjeAB6rK9MlQsRU0SlhPiNEJB2b1u4qTUw==
X-Received: by 2002:a54:4f1d:: with SMTP id e29mr9931945oiy.179.1635445385247; 
 Thu, 28 Oct 2021 11:23:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 8sm1273422oix.29.2021.10.28.11.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 11:23:04 -0700 (PDT)
Date: Thu, 28 Oct 2021 11:23:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v1 1/1] delay.h: fix for removed kernel.h
Message-ID: <20211028182303.GA711390@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_112306_551143_7A2F7D1B 
X-CRM114-Status: GOOD (  13.27  )
X-Mailman-Approved-At: Thu, 28 Oct 2021 15:33:23 -0700
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

On Thu, Oct 28, 2021 at 08:01:43PM +0300, Andy Shevchenko wrote:
> To be folded to the commit 0d280a9fbbd9 ("include/linux/delay.h:
> replace kernel.h with the necessary inclusions")
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/riscv/lib/delay.c           | 4 ++++
>  arch/s390/include/asm/facility.h | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/lib/delay.c b/arch/riscv/lib/delay.c
> index f51c9a03bca1..49d510ba75fd 100644
> --- a/arch/riscv/lib/delay.c
> +++ b/arch/riscv/lib/delay.c
> @@ -4,10 +4,14 @@
>   */
>  
>  #include <linux/delay.h>
> +#include <linux/math.h>
>  #include <linux/param.h>
>  #include <linux/timex.h>
> +#include <linux/types.h>
>  #include <linux/export.h>
>  
> +#include <asm/processor.h>
> +
>  /*
>   * This is copies from arch/arm/include/asm/delay.h
>   *
> diff --git a/arch/s390/include/asm/facility.h b/arch/s390/include/asm/facility.h
> index e3aa354ab9f4..94b6919026df 100644
> --- a/arch/s390/include/asm/facility.h
> +++ b/arch/s390/include/asm/facility.h
> @@ -9,8 +9,12 @@
>  #define __ASM_FACILITY_H
>  
>  #include <asm/facility-defs.h>
> +
> +#include <linux/minmax.h>
>  #include <linux/string.h>
> +#include <linux/types.h>
>  #include <linux/preempt.h>
> +
>  #include <asm/lowcore.h>
>  
>  #define MAX_FACILITY_BIT (sizeof(stfle_fac_list) * 8)
> -- 
> 2.33.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
