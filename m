Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA9BC64EB1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 18:45:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D36A82082D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 18:45:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TCMNgKbM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ZZVrDpHf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D36A82082D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=uTqBuHsV9lHFMFMdPI4vcAXD/rbXjdkVTyGMmeddqhY=; b=TCMNgKbMxCQVNFnx8jmJxtYYM
	voLa/W3vW+62UuzwgKT9E7zGWUyvj572CizxREobJupPd54kfFsF6dKZXGlRSGhJyH4mDfWtlaSKC
	4nqtVKaJ1XNCjKbYU0MGkR68cjfg3vvjhTLBO5g5jKcu299/l/NCMXc/TEpupgu/QzF0tCFtB2maw
	a4pIsLCGSfEVgBQMdsXz43rcRS6+OLMUP6dxF7i/J7HnXOivA6Goqrw1rNdlBjFJhC+rpvJEzH+OE
	58s+rihQiJydMW7jQdRDFCYn+cs0kE9m94cOQ+V7uJLQbH2YxNNqKFRqXPNrZ6VUapIdQ4sMdngPE
	dwUxgYydw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVL7w-0002Lu-NX; Fri, 07 Dec 2018 18:45:28 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVL7s-0002GM-D4
 for linux-riscv@lists.infradead.org; Fri, 07 Dec 2018 18:45:25 +0000
Received: by mail-pg1-x544.google.com with SMTP id w6so2085896pgl.6
 for <linux-riscv@lists.infradead.org>; Fri, 07 Dec 2018 10:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=klopY/IsuJEDowTc4qrt4dyez0fGpBDt1xs5/j2mVbY=;
 b=ZZVrDpHfZs52iuETgv3m44IeOtThlIBsuU8+93Vxx7aBcyIR3CfRT2lS31h8wJewmV
 Tki/oz/jT6A7N4MGx481OP3Ps6TfITealhGoP+JTLC5p3O6m82JGXuTjm4MWJPiDDJCd
 9EM9eqL6VYHHdGU1Bbtl+2lYmINTz3fkchPJj6pBGjTeh2ZntnCGYTTqejWBvjffftmA
 toRKjgdsx+CHfywJWPgM5ghK05Brr0Nyal9TZfyhadDDwN7cBZzDrkwfdK203vs0gGwr
 AjaKi368ZuHFSEclC49QQ0orgjY0eyXcBcs8mUkDr49hFKBs8OxYP3kz6S111fXbWDUC
 Z4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=klopY/IsuJEDowTc4qrt4dyez0fGpBDt1xs5/j2mVbY=;
 b=pMVHtkc0nKlw2De3cVt+F8ag+YnPIDdbPhG0/xwvPrr9GaXUIXOBpdYDraL8/XcVGa
 MwSOvwsC5+pSdqc5xWuu71d4ECi0ywZiNehafBBz/nwfImRDSEWkFv8NXauHFmU+2cg7
 4Tscuxy9BixaE38oC5VBHFoRACIJjMp8fBWPeO+XMZ7FrAA4TGxGbDwFKZ8JlLgZ3XYw
 O1FyBiUcdKQvJjzLnfCOw/V0BaENs090kQaPhVacoiIPOoZ092uupGa9cvyMn9jOM614
 NaO5KMdmVvx06ZghL8vpE6E44QcowcSFMJBfYdSjmVVaHtj5FEEhfRstXA0NQc/Wtar4
 HqxQ==
X-Gm-Message-State: AA+aEWaSt8peKhcF7qrFbRmzbdElSa+opAfN+bU0rfESxl6faMSErEpB
 pvtSs5m0VLlUelzKvw5oNcWsgA==
X-Google-Smtp-Source: AFSGD/XwDgPF73po7jcMK0WLUnbQk9jaegnMO7Qp7EVNMCgsiulHRkkPkb3v6ey4N4xdmNlmrKTYkg==
X-Received: by 2002:a63:f515:: with SMTP id w21mr2938694pgh.220.1544208313756; 
 Fri, 07 Dec 2018 10:45:13 -0800 (PST)
Received: from localhost ([216.3.10.7])
 by smtp.gmail.com with ESMTPSA id y89sm6257168pfa.136.2018.12.07.10.45.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Dec 2018 10:45:13 -0800 (PST)
Date: Fri, 07 Dec 2018 10:45:13 -0800 (PST)
X-Google-Original-Date: Fri, 07 Dec 2018 10:44:39 PST (-0800)
Subject: Re: [PATCH RFC 4/7] riscv/vdso: don't clear PG_reserved
In-Reply-To: <20181205122851.5891-5-david@redhat.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: david@redhat.com
Message-ID: <mhng-3e6b4869-d5d7-42f4-a9d8-789a6772f52a@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_104524_461455_1D893EFC 
X-CRM114-Status: GOOD (  16.24  )
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
Cc: linux-s390@vger.kernel.org, aou@eecs.berkeley.edu,
 akpm@linux-foundation.org, david@redhat.com, linux-kernel@vger.kernel.org,
 willy@infradead.org, mhocko@kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 tklauser@distanz.ch, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 05 Dec 2018 04:28:48 PST (-0800), david@redhat.com wrote:
> The VDSO is part of the kernel image and therefore the struct pages are
> marked as reserved during boot.
>
> As we install a special mapping, the actual struct pages will never be
> exposed to MM via the page tables. We can therefore leave the pages
> marked as reserved.
>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Tobias Klauser <tklauser@distanz.ch>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/riscv/kernel/vdso.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
> index 582cb153eb24..0cd044122234 100644
> --- a/arch/riscv/kernel/vdso.c
> +++ b/arch/riscv/kernel/vdso.c
> @@ -54,7 +54,6 @@ static int __init vdso_init(void)
>  		struct page *pg;
>
>  		pg = virt_to_page(vdso_start + (i << PAGE_SHIFT));
> -		ClearPageReserved(pg);
>  		vdso_pagelist[i] = pg;
>  	}
>  	vdso_pagelist[i] = virt_to_page(vdso_data);

I'm going to assume this will go in through another tree along with the rest of 
the set assuming everyone else is happy with it.

Acked-by: Palmer Dabbelt <palmer@sifive.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
