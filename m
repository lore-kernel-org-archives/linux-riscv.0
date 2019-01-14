Return-Path: <SRS0=bHpB=PW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8094C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 14 Jan 2019 15:51:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7668A206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 14 Jan 2019 15:51:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KVjGz4v1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7668A206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/cweJrs+jrx5A2eP5Y3EXGGxIg/8bIrn/8/XY3s3d9Y=; b=KVjGz4v1gcj4nB
	jqzNn0HirhEUKImHdlFHGCVU5ScwQ9iCdJz2EHMq0pBW9wn0YuDGZmSJwAg+tgO6O48NhcKeldC/B
	4ivu0XPA/Oum2/KcV7p87NRiqFbPPGPVCNyPgVNJuvNVOEEVzAQ7tSRd6DPyTZP7Tau5sDn/hxuaZ
	JAqYc6+0UvGrsP0n5ZoBr5hXqfAyevB2mEgKxqG2QgRmbIWADbWjDEG8VaM8AHUIsuR7OCd9YmfX1
	IsXR2m9LPlxIlxBT6y50bL3SsS8+u72S3JtQpkFeoWO3MSSSfA+le94ly330j8zYhR5e06eJpERPu
	nqIVI10wFfYjFs/HS5XA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gj4W4-0005ch-EH; Mon, 14 Jan 2019 15:51:08 +0000
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gj4Vp-0005Qd-Mg
 for linux-riscv@lists.infradead.org; Mon, 14 Jan 2019 15:50:59 +0000
Received: by mail-lf1-f68.google.com with SMTP id y14so15920839lfg.13
 for <linux-riscv@lists.infradead.org>; Mon, 14 Jan 2019 07:50:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=31z+XEMzJ6K5/5aQETRHBYXsxTO0tFnzs/8KDuSnm1o=;
 b=f3dUdYFiS8PIgX/ygG/kOBxHJ3oNG8ty2zo7CfruFyGaoWPHU668510cfnIu2W4M0/
 G19uczS2uuam34jVL3gdFYn9FW3d7Jjkip3HMOSJmqo9aVvxgB76qXUMgw+gBfwaA2u3
 q6jdIu3/RABg77xLvKiRa9x+fqBVBgfDgbovfwXRY8e+YBCw8oXCkKOCAWIvqpQfGXae
 7nQWH3JYt2LS5KfxITn3QHbooQaRDy/ipQS/YLhG/bxPk+DGDl3Rkbi7VWvIlnrj1GGu
 ifGphCD24dr+ekfxIS4nIn41wqSby0x9Wwp5kC7AxgriIiBWX/nUWId5aWs8ZJFZepWb
 BWyw==
X-Gm-Message-State: AJcUukd9iU+tDzuG1KLj5ID2jtN2WgbwCwpQsMDkUf6SJhdprF0j73ZH
 Ou4haBDB5lj4SM4gh5m0BNRXFEIjgtiz3Vc771szng==
X-Google-Smtp-Source: ALg8bN5txqcWH3KBN3VoGeUeW3+QHeURZnmU0Eso/D3tnH22waYzfYP3ty/L2QT+uI5i27K+O4hWHkLJc7cF20VJOfE=
X-Received: by 2002:a19:750a:: with SMTP id y10mr13446847lfe.43.1547481048577; 
 Mon, 14 Jan 2019 07:50:48 -0800 (PST)
MIME-Version: 1.0
References: <20190114125903.24845-1-david@redhat.com>
 <20190114125903.24845-7-david@redhat.com>
In-Reply-To: <20190114125903.24845-7-david@redhat.com>
From: Bhupesh Sharma <bhsharma@redhat.com>
Date: Mon, 14 Jan 2019 21:20:01 +0530
Message-ID: <CACi5LpPb5Mkk-AQARm96mHJ6S5KLKkSswP-=4z9oPYzK0-knEQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] arm64: kexec: no need to ClearPageReserved()
To: David Hildenbrand <david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190114_075053_846325_6E352832 
X-CRM114-Status: GOOD (  14.79  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-s390@vger.kernel.org,
 Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org,
 Dave Kleikamp <dave.kleikamp@oracle.com>, linux-mediatek@lists.infradead.org,
 James Morse <james.morse@arm.com>, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi David,

Thanks for the patch.

On Mon, Jan 14, 2019 at 6:29 PM David Hildenbrand <david@redhat.com> wrote:
>
> This will be done by free_reserved_page().
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Bhupesh Sharma <bhsharma@redhat.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: Dave Kleikamp <dave.kleikamp@oracle.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Matthew Wilcox <willy@infradead.org>
> Acked-by: James Morse <james.morse@arm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/arm64/kernel/machine_kexec.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
> index aa9c94113700..6f0587b5e941 100644
> --- a/arch/arm64/kernel/machine_kexec.c
> +++ b/arch/arm64/kernel/machine_kexec.c
> @@ -361,7 +361,6 @@ void crash_free_reserved_phys_range(unsigned long begin, unsigned long end)
>
>         for (addr = begin; addr < end; addr += PAGE_SIZE) {
>                 page = phys_to_page(addr);
> -               ClearPageReserved(page);
>                 free_reserved_page(page);
>         }
>  }
> --
> 2.17.2
>

Reviewed-by: Bhupesh Sharma <bhsharma@redhat.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
