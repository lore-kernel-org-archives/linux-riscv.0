Return-Path: <SRS0=0BZE=KI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7409DC433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 13 May 2021 08:14:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC8FE61106
	for <linux-riscv@archiver.kernel.org>; Thu, 13 May 2021 08:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC8FE61106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9KDGzFLrpMRZisUv/IYmLHT44M5fzHPYjWHFGsYq+LA=; b=CL8GzKGonHnn3YVH+To84rHvM
	nWWZfk1YvVDq8uN3wlyOEkIWlKgqZBLpDFFcZd68htNHUS5CQv1E6Y3TdK3I5H2nowsbKwQe7LroT
	Amo2D9D7fsnLsBGWBXlaru+N5m++/mUVFNcgF7zcWViiXHqTZqnICLbfq2Sqh1hOGd5YA2vFw4ERd
	0am0RTO6uUjJzDMyNmXhnpfUsBk3yM8GoIbMkZ7HYfovyU3DS2x5SLjz5r4u5rKS8TyQQYGMddNiX
	5P6YWIQJC+AVALTe1GJfTZOdmzG0JC9xW+rnPssqLcMQl38qeA9+pryERN2MubijLfRXp6gCZvmEK
	3Las2y6rg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lh6Tz-0054d7-W2; Thu, 13 May 2021 08:14:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh6Tx-0054cy-P9
 for linux-riscv@desiato.infradead.org; Thu, 13 May 2021 08:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fdQjvampDreMTbFN7YQGjC8tN7QCrtiBNyMWZhV7gjc=; b=UdvEaviK9Y+1cCWnL0e9Mi0sNd
 /6uvChWU/AJdff4Qhs3RNSCiF+U4hYE3LmUpw2P4zrMjnKGnL6uqv+RcmfJ5VA+2ZAA7AZ64vHMEN
 tEXP2u9UszCQOgVfeCHMkb8FyCDC4q0cKQsVVExJT3sGbRmTCV1m91QrNhyowLQ79Qlpl/6RAYXDg
 BYVp/gg4OZ6GVlJnbE9O0WZ6p8p8ilMOpct5dEeVNXnBYCb4en2tecgyh8cUin+34KYu+hw2U19jl
 xXgaUAtc5QSunLE0SElF9OEzr8oBtyN8RSZvQygecOPzRRmspqnjzU+snU6NYQM/2vf3jp0MW9u5G
 RqIElmVQ==;
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh6Tu-00B6Ie-U2
 for linux-riscv@lists.infradead.org; Thu, 13 May 2021 08:14:08 +0000
Received: by mail-yb1-xb35.google.com with SMTP id q144so1635136ybq.0
 for <linux-riscv@lists.infradead.org>; Thu, 13 May 2021 01:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fdQjvampDreMTbFN7YQGjC8tN7QCrtiBNyMWZhV7gjc=;
 b=dl9Atk4qOCccN7LDFyrHBvQe6HThvviY8YJr/0u6mGlYRmfSqBi8vhXg/YodHgJYGs
 Cm4l47I1IHdrwg1VIO3nd+WcFJeQ6DKtEkyHNmxrzstn50W43JMOBaIMXEZzGoZT+DjL
 1ONa+MQp4Zecs5+ac1WiKlM0JEeoyFD/Z5Ph8TTSCcsvSTDV14ApFtvF5wIuTpG+3Pm8
 clnHXRfIGoaDPYdfucYUXHgZcMFMtSJbodbKu0UG4PNXROuiH6BTFjnwWJC5jvvU1IJR
 xGo+EQdCFmxc5r4cRMpCXNROYH2k04r4fnlXKoh8CvWlWcW9B1J02MliiGCRZrEGKrw6
 uYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fdQjvampDreMTbFN7YQGjC8tN7QCrtiBNyMWZhV7gjc=;
 b=eJFKfG2Bc3lnEKKpQ0KvFLZ66TmVCCPLEe/3UM804j7h0gUMclz4oeQVYXUuAyiRS9
 vAgQnHbzzlt0IPwvLqhKe6Qhd5UP1SvrY8HJerNJYsRbQ9smlrE7vb8IHwTixDYn/CLQ
 PCsVVJWTLj4X+SmRwLPikBB0nv3YgvaReUyuUSHlF02kUOjTeso8MvITOxyiRbqqFIbH
 RP1Y01HokseWP4JIsZxhwNZ9p5izH/uXlBt7/bi1Q4y7ectTYjjda+ojarzcNpjrf3eu
 f2JQsLMP1S3ai1oN/x4V4WuOWIGHhkQAxVmK8W0CpNTtc9Eftg3390ivQmCsj5ZjhKoA
 nD/A==
X-Gm-Message-State: AOAM533dAxMDQ0EusLS499lPlU2nAzvxVJHjayUQC0EdCIN9xZqnuNCK
 udts+X9HB1ryJTiPMr5OodoeQEv8YH6H3R0R9iu2qXd18y42Pw==
X-Google-Smtp-Source: ABdhPJwVUNbmqtVppeU9RZiVu6YT4YAW30ViuTqWmSCfSwUbc9qud96qQ5pIbT7Ry/Vq7NgozKaQ+GQU336tZmJOlu8=
X-Received: by 2002:a05:6902:1543:: with SMTP id
 r3mr21474668ybu.332.1620893645087; 
 Thu, 13 May 2021 01:14:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210216225555.4976-1-gary@garyguo.net>
In-Reply-To: <20210216225555.4976-1-gary@garyguo.net>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 13 May 2021 16:13:53 +0800
Message-ID: <CAEUhbmXPAEjozYuoQpATzjS4E6Yo2eRpF6DJzxO8Cumdm57J3A@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix memmove and optimise memcpy when misalign
To: Gary Guo <gary@garyguo.net>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Nick Hu <nickhu@andestech.com>, 
 Nylon Chen <nylon7@andestech.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_011407_011119_8F561017 
X-CRM114-Status: GOOD (  20.52  )
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

On Wed, Feb 17, 2021 at 7:00 AM Gary Guo <gary@garyguo.net> wrote:
>
> 04091d6 introduces an assembly version of memmove but
> it does take misalignment into account (it checks if
> length is a multiple of machine word size but pointers
> need also be aligned). As a result it will generate
> misaligned load/store for the majority of cases and causes
> significant performance regression on hardware that traps
> misaligned load/store and emulate them using firmware.
>
> The current behaviour of memcpy is that it checks if both
> src and dest pointers are co-aligned (aka congruent
> modular SZ_REG). If aligned, it will copy data word-by-word
> after first aligning pointers to word boundary. If src
> and dst are not co-aligned, however, byte-wise copy will
> be performed.
>
> This patch fixes the memmove and optimises memcpy for
> misaligned cases. It will first align destination pointer
> to word-boundary regardless whether src and dest are
> co-aligned or not. If they indeed are, then wordwise copy
> is performed. If they are not co-aligned, then it will
> load two adjacent words from src and use shifts to assemble
> a full machine word. Some additional assembly level
> micro-optimisation is also performed to ensure more
> instructions can be compressed (e.g. prefer a0 to t6).
>
> In my testing this speeds up memcpy 4~5x when src and dest
> are not co-aligned (which is quite common in networking),
> and speeds up memmove 1000+x by avoiding trapping to firmware.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  arch/riscv/lib/memcpy.S  | 223 ++++++++++++++++++++++++---------------
>  arch/riscv/lib/memmove.S | 176 ++++++++++++++++++++----------
>  2 files changed, 257 insertions(+), 142 deletions(-)
>

Looks this patch remains unapplied.

This patch fixed an booting failure of U-Boot SPL on SiFive Unleashed
board, which was built from the latest U-Boot sources that has taken
the assembly version of mem* from the Linux kernel recently.
The exact load misalignment happens in the original memmove()
implementation that it does not handle the alignment correctly. With
this patch, the U-Boot SPL boots again.

Tested-by: Bin Meng <bmeng.cn@gmail.com>

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
