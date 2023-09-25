Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4411ECE7A81
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 15:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=sd5gC2qkH5WmRNedoHm2An2J9Vw7Ir+I9h+D5gWbGfw=; b=FG95vg/zUDqb8C4g39wS2ISwRg
	cYc9lzv5ooXq4oOxStHKWOqGhfvwdk+dGALjehwFJ8uLk/O/9QqUCd+V+Sw9Nx6jCW+WsH8A89vnF
	A94LmY3+8MhH2TFVh2vUQSwspjWAKPu61PnEmpAgGbY5gRfL3fJ9vEHSQ7A/dmxPWqv5kSAGq8gId
	K1zs6FwCuLckJMc7oYdAplClizgBfNU3EOP+PaWcJqCidDPufR3g3BdHBz8Ok7uBx1HX/lbMg5Kay
	1eGbwJ0ykxy1UjvTN/m9LUUUlS9W3pGfh40mSPRMW9lSs9/a7L+Q0WuXc9D2tZe5ZO41shYO3cUyS
	nIQXfZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qknGC-00EWPn-31;
	Mon, 25 Sep 2023 15:12:32 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qknG9-00EWPD-0x
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 15:12:31 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bdf4752c3cso44196055ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 08:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1695654746; x=1696259546; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gd9lB28WxwZB0dqNOOTqC48++TaSLY9Nj/r9d6foOYg=;
        b=PtIrycKmcX4PD/O4SiB5T+Pa9SUHCIF1TJnX1+gH7H/GzoUkKkFiD8rIJ4Oc4ChsNp
         lSZuQ9IarbTFH4YXKawYXeMETHmh3BXCC50tzqftDHx5xBYDzEO0gil+j95yQdkGVysv
         ab3Ugm0KBxxXzHb1mdGL2EWXjlAeWXmIspK65inzanVmPtrXO0pUExm+0uePZwYBiLEm
         umGP4MxDKez4t/46mD9ftojxPhcwX94T4NIOGA+D9JxnNur1wi+kDXNXG3nE8t5Zl+Sk
         GMKZ330rQbFM7AGCjGcoLkRpAwx9vnvNAR27fnAPKpF9vZ3YbRZbV3LMv5q4E+9qcMZo
         E+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695654746; x=1696259546;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gd9lB28WxwZB0dqNOOTqC48++TaSLY9Nj/r9d6foOYg=;
        b=nKCxcX47Xpl1aCPeJZEMrYfYalVSd+gXvNDKq+cFMMxblaNGicIZ2Kw8KQIesGLfgc
         mN6WhldRjYI/kcvMRiRHiVS/ToZdS6wDB1VB3rth/kKsi4OvJh/fTzkEEIx8HwXN/Mds
         dqjglqnaH0TyV6nXHK38UN+ygTyp7a/BWFtp34a98L5TBM/CIS4O88hL7NowMMUyhKLp
         RwJPuDzSj1NLWwqBr3qaz/bVFFbxcfsNnRDysaZkqPPzQpw3lX6jKukfFfMlqsjH0Fiw
         aD8SFaRfGmJ5KgfSI0zScZ4tT7tfnLyAjvjze2Bj9v8LzlH6YJay/AaA+SXVGMkUNjW6
         e+3A==
X-Gm-Message-State: AOJu0Yy0Fqz1UU4m6rdUsaxDdtg105S2cspOXNuRKocTHTRaNxzWP79s
	A7QuWJ1UlBQW1yXu/rOIvI4V4le48VcxcZYW+Xz+Nw==
X-Google-Smtp-Source: AGHT+IELw4O+lw3N3CYwP07fsNrBFiYVb0Fad3mxOxJhjtOhX9aKqyz7Osft0HDYv+IynbdaR/y7BA==
X-Received: by 2002:a17:902:ea0f:b0:1bf:557c:5a2c with SMTP id s15-20020a170902ea0f00b001bf557c5a2cmr5655783plg.44.1695654746108;
        Mon, 25 Sep 2023 08:12:26 -0700 (PDT)
Received: from localhost ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c25500b001c61073b076sm3163799plg.144.2023.09.25.08.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 08:12:25 -0700 (PDT)
Date: Mon, 25 Sep 2023 08:12:25 -0700 (PDT)
X-Google-Original-Date: Mon, 25 Sep 2023 08:12:21 PDT (-0700)
Subject: Re: [PATCH v5 0/1] Risc-V Svinval support
In-Reply-To: <20230623123849.1425805-1-mchitale@ventanamicro.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  mchitale@ventanamicro.com, atishp@atishpatra.org, anup@brainfault.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mchitale@ventanamicro.com
Message-ID: <mhng-f799bd2b-7f22-4c03-bdb2-903fa3b5d508@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_081229_520120_6CF9FD63 
X-CRM114-Status: GOOD (  15.67  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 23 Jun 2023 05:38:48 PDT (-0700), mchitale@ventanamicro.com wrote:
> This patch adds support for the Svinval extension as defined in the
> Risc V Privileged specification.

Do you have benchmarks (like we asked for here 
<https://lore.kernel.org/all/CAN37VV40msnohyJqkwW_YkUmXmEL1yztk+ZQhTeA6feS-W0S2g@mail.gmail.com/>)?

>
> Changes in v5:
> - Reduce tlb flush threshold to 64
> - Improve implementation of local_flush_tlb* functions
>
> Changes in v4:
> - Rebase and refactor as per latest changes on torvalds/master
> - Drop patch 1 in the series
>
> Changes in v3:
> - Fix incorrect vma used for sinval instructions
> - Use unified static key mechanism for svinval
> - Rebased on torvalds/master
>
> Changes in v2:
> - Rebased on 5.18-rc3
> - update riscv_fill_hwcap to probe Svinval extension
>
>
> Mayuresh Chitale (1):
>   riscv: mm: use svinval instructions instead of sfence.vma
>
>  arch/riscv/include/asm/tlbflush.h |  1 +
>  arch/riscv/mm/tlbflush.c          | 66 +++++++++++++++++++++++++++----
>  2 files changed, 59 insertions(+), 8 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
