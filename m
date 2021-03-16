Return-Path: <SRS0=WRFO=IO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657DFC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 03:18:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C0326508F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 03:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C0326508F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3MvKwxp+GHdRYH9RhB+vFaTo2CuHmCYsm3ssWdRzJ5c=; b=Of2O8vP3pLRO4T0MPrnZdAY2Y
	lza79EneXkee7nJAaEWAufaIHtMxRrPRtsAv1L0lItfetHZZVkecCnBgotKbW0/ZK2WkHn/slRQUt
	8nRvpy9Gt5j7O+Ia5orcsu237gDCMhF83jx22ccFGTluxfHRbPhWtYksZsoOQyxep52oolwTWHw2r
	b8dA97MDbJO7SMv4dhnA1TI8SFSKT+LFqXG5BOhXTJ5wTtcaUkpZ59U06VVIuOnivwqR0dWAc7gPr
	z4njIplrVK2DD185F2lTeTRQ7zx88LZdEsYZOKZxvpbivzierMYYtg8fFItdsxVo+pwpSkADZs/7z
	3ZaqPdW5A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM0DX-00HItp-VZ; Tue, 16 Mar 2021 03:18:00 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM0DS-00HIt8-GX
 for linux-riscv@lists.infradead.org; Tue, 16 Mar 2021 03:17:56 +0000
Received: by mail-ot1-x32a.google.com with SMTP id
 h6-20020a0568300346b02901b71a850ab4so6162648ote.6
 for <linux-riscv@lists.infradead.org>; Mon, 15 Mar 2021 20:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1xDPeykeJpE8/53P0YWT3nntzZKV5Yu2PY4r8ou2l0w=;
 b=NrvAzJfu1kPoc+7FtqPoS3kwt9AcsTrp0EZQ1Yz1na1vRB50A5Udii0brdlenUvkMq
 TdRoXalnDlDbruitvGAzOegvv4o5hMGv5a15rU2bDeAhNugmYfJU83YKZEt4rbSi0FXT
 NkQ2LJM9AofS6TWE+oxMKaKxf9TjjcafEhuCcmmS/LKagOLcuIaPTsAuKTHGzIZzs2cR
 /24G0vhf9aD8YmsvRAa5hr/3oFBhzO7jtqpD3qd/ZRwMWo+GfUHHEI29YfKwunUtEASx
 Ol16acLj558ZjFso0+Gnyi2vEPy5mipuYTaFZRzfvN8cGtiLFV79Ob/3W9jSrfwV+wre
 jXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1xDPeykeJpE8/53P0YWT3nntzZKV5Yu2PY4r8ou2l0w=;
 b=BOGpoXIGZuKaRO1eIkkJyXzZKwW5BUwZTodKuVq+CNZtymi1mOEmgANLuX6ypb4NIS
 cv+VJ09SyY7DIVysIF3SeKYeP6kEx0J+XuMPVmYwK4L9Jjl2YDxBaE7j4cx45u3txcsd
 ZHl774KWuxagy8b6nzo7fs1hZHHDNY5c2jKEQ9tcrczxjb0Ag36hjlief+MCgj2YOy1g
 7WiLlUAmqcjbFWj+qSp/ne7GuN9lhQ8lXqjxhs634QA4wtHK6NVIPuGoR3YThiiLPRaC
 QHBHtHEqslqZi9+zO/wx6MqdK6bsWaoALmgxiok6L7ZQaXAxQgLd8zBN77tHEhpvcmhm
 9Thw==
X-Gm-Message-State: AOAM533MfUYc+DysrYo9HJdbEi7OZkpl2nhxfVMdxLDBsK7BXmMFuovj
 G0JGT/F1dMsqjCr7u+ni+ZakJtuZNX/s+HA2nYU=
X-Google-Smtp-Source: ABdhPJwE6z/CPX42yTFe1d1ufeTo1Kxv4eGUtNZTq7+WAI8U6L5zKma/b759NyahVXhiJ5lmgzqZRFpIy9ThpUR0cEU=
X-Received: by 2002:a9d:12a7:: with SMTP id g36mr1723395otg.304.1615864672742; 
 Mon, 15 Mar 2021 20:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210310062250.74583-1-liu@jiuyang.me>
 <20210316015328.13516-1-liu@jiuyang.me>
In-Reply-To: <20210316015328.13516-1-liu@jiuyang.me>
From: Yixun Lan <yixun.lan@gmail.com>
Date: Tue, 16 Mar 2021 03:15:05 +0000
Message-ID: <CALecT5iDxuzRPvPg8w=WmLT9XtWxOieDN=iRoY0nAdyhdLV+SQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Bug Fix for last patch
To: Jiuyang Liu <liu@jiuyang.me>
Cc: Andrew Waterman <waterman@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Anup Patel <anup.patel@wdc.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
 Mike Rapoport <rppt@kernel.org>, Greentime Hu <greentime.hu@sifive.com>,
 Zong Li <zong.li@sifive.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_031754_675704_0A41F414 
X-CRM114-Status: GOOD (  18.99  )
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

Hi Jiuyang

On Tue, Mar 16, 2021 at 1:56 AM Jiuyang Liu <liu@jiuyang.me> wrote:
>
> Sorry for the noise, Andrew gave me feedbacks, and pointed two bugs in
> last patch.
> 1. asid should be thread safe, which is not the intent.
> 2. asid extracting logic was wrong.
>
> This patch fixes these bugs.
>
> Signed-off-by: Jiuyang Liu <liu@jiuyang.me>
> ---
>  arch/riscv/include/asm/tlbflush.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index 4b25f51f163d..1f9b62b3670b 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -22,10 +22,14 @@ static inline void local_flush_tlb_page(unsigned long addr)
>         __asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory");
>  }
>
> -static unsigned long asid;
> +static inline unsigned long get_current_asid(void)
> +{
> +       return (csr_read(CSR_SATP) >> SATP_ASID_SHIFT) & SATP_ASID_MASK;
> +}
> +
>  static inline void local_flush_tlb_asid(void)
>  {
> -       asid = csr_read(CSR_SATP) | (SATP_ASID_MASK << SATP_ASID_SHIFT);
> +       unsigned long asid = get_current_asid();
>         __asm__ __volatile__ ("sfence.vma x0, %0" : : "r" (asid) : "memory");
>  }
>

This patch title is  too obscure to parse, it should clearly reflect
what's the changes doing here

my two suggestions
1) if previous patches have already been merged, then you probably
should fix title (the commit message)
 and re-send the patch? and maybe add a "Fixes" tag here
2) if previous patches still under reviewing.. then
  a) you can send an update patches series (can squash this fix)
  b) or maintainer willing to squash this fix for you?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
