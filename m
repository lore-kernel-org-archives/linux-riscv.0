Return-Path: <SRS0=X6bA=GR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D3AC433E6
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 05:09:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFF7A238E9
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 05:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFF7A238E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=QuGVcQg7CTX8Li+N59hYjqxzOLt/yAUMEdkCvf2mEHU=; b=qdy/7PaGN0kXSkOuwPt5P9vbw
	AS/RKbM2erBgHQ3vxaBatfi1ayZ/1aoocagYWXOzIOmhNIvzgyNbjqWrw3vKgZhuqDPNPRZXYcHkX
	KLsmd4gI1M/q476ncwZJ0ijeou0aiQ5MhtrZvhnyZvT8UcJgeomef/E5Jc4t+KBUtKr6RJrSAv5ZD
	Pp0IAzjvXEDXvHHevjnNomzhwCNYpDCyqlmTQTQcLDqx4/U/1DOf9FmVfibDuMJwzgiBh+DLg/tRj
	1XOiWOMJhYPHvxdA985grPrHCYhJAfePPD9whCTO6b/mwiqEv/6Ah3yQKvGPHECOM2HWUTTO1ysRP
	gCxOegWVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzutB-0002yC-60; Thu, 14 Jan 2021 05:09:41 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzut9-0002x2-0d
 for linux-riscv@lists.infradead.org; Thu, 14 Jan 2021 05:09:39 +0000
Received: by mail-pj1-x102e.google.com with SMTP id u4so2553279pjn.4
 for <linux-riscv@lists.infradead.org>; Wed, 13 Jan 2021 21:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=KcEA2nbzXx0jru83yIQ190/mImRN9DXek195EgNHMTM=;
 b=ItvMJreq/VrK59JsNEZhxHcD41LpU029J3ATPXNn4VP79v8smYm5CKi6tvsZLZ0IMN
 stLb6jdptaiX2p2VLSOmVluSITFwuKCpP5FEuqVCUWsrzyDAzQaAiyEuUV2piCLv2QlR
 Fm5le6VT20CABM5QMDgNso6BR/g9B1sbWPIG1OHXkQ1RD8NVb22molvVS5maGkslFNKP
 gKXjakFIy2btTOKIedtUM8ufKnw8YbY/bFCKaixINOyWVYxfvnLSg1M0N3B9YeyQRBJ1
 IJvNQ7bCH1ipvvL9LDC7WXNt6eKC+b/tvd/K3Aj5ZXD/pGgOJocHlq4MYdrYdzrDEQTn
 0Www==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=KcEA2nbzXx0jru83yIQ190/mImRN9DXek195EgNHMTM=;
 b=ugHsk7wxyRGQ0OX0+6oB+vRfVcj5zSCBjDtblR3ZnaSZyXHl1Pq1sn0+8eOfAt+7Ge
 DAM4ar/SI/Dw/LoW2dAB43Ex1el7k6AevvtCosaFgMqyQ6RJpYQ9H6fCrW+wJnstYDV7
 kjmSTjZNJDJRgB5DV1x2ZvaGtZQLDPsxfFrNN3ds2wIhUTjc95GMey/R2fjTBVkF7sQl
 1BRk8RJ+6Cd43CRxtZHeWDVoaj/vZ2Cb+g/W0OA+7P+Bja0QsAkOnfeqPwryFXdJjW61
 GiIBa0p13RdBXeYOPUvnrjcOpNK6+fP8S7+8Q4noIVlEt+B5/1qQV0INbWtJp/mwv+Zj
 NYVw==
X-Gm-Message-State: AOAM530HOSmMFiSOVvjroUu2NX+UwVAuKjJ81qN8UWhf7DFe6GsiVa0Z
 V2q5F/0rcitwdlECuQBi1Vm7qkin3mkfVw==
X-Google-Smtp-Source: ABdhPJw5w1qfQyweI0KL/cYR8X7oUo5hoLXAq5yFReqxbhNLHD/d8jUY4iz/0NIR9UIQwenjXQsvMQ==
X-Received: by 2002:a17:902:9a4a:b029:dc:435c:70ad with SMTP id
 x10-20020a1709029a4ab02900dc435c70admr5884019plv.77.1610600976917; 
 Wed, 13 Jan 2021 21:09:36 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id s29sm4277278pgn.65.2021.01.13.21.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 21:09:36 -0800 (PST)
Date: Wed, 13 Jan 2021 21:09:36 -0800 (PST)
X-Google-Original-Date: Wed, 13 Jan 2021 21:09:24 PST (-0800)
Subject: Re: [PATCH 0/4] Assorted fixes for RV32
In-Reply-To: <20210107092652.3438696-1-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-a7496321-17ee-4286-a31c-1474c80d4fce@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_000939_107467_38AE8EC0 
X-CRM114-Status: GOOD (  18.21  )
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
Cc: aou@eecs.berkeley.edu, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 mick@ics.forth.gr, akpm@linux-foundation.org, ardb@kernel.org, rppt@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 07 Jan 2021 01:26:48 PST (-0800), Atish Patra wrote:
> This series fixes various issues observed in latest kernel on RV32.
> The first two patches fixes an resource tree introduced in 5.11-rc1
> while the last two fixes the case where 2GB physical memory is used
> on RV32.
>
> There are may be better way to fix the issue pointed out in PATCH 3
> as it seems a generic kernel issue where kernel pointers can not use
> last 4k of addressable memory. I am open to other better alternate
> suggestions.
>
> Atish Patra (4):
> RISC-V: Do not allocate memblock while iterating reserved memblocks
> RISC-V: Set current memblock limit
> RISC-V: Fix L1_CACHE_BYTES for RV32
> RISC-V: Fix maximum allowed phsyical memory for RV32
>
> arch/riscv/Kconfig             |  6 ++++--
> arch/riscv/include/asm/cache.h |  4 ++++
> arch/riscv/kernel/setup.c      | 24 +++++++++++++-----------
> arch/riscv/mm/init.c           | 16 ++++++++++++++--
> 4 files changed, 35 insertions(+), 15 deletions(-)

I took all of them but that L1_CACHE_BYTES one, which I had a comment on.
Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
