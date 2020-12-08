Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB2DC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 19:58:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78D6723B1A
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 19:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78D6723B1A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rT6XPLkXb00YFrd873SC3Z6n9BVTKZsOx9lBVCXZkZo=; b=LMxLPTmmgcr2AMYPzXZ0R6ewA
	o0T8A3Dr0gpUoOsKRnNLZFD2bM5fX042FpelcR265NGfJntxCXuKqC4z8T9CkNRs310+9f0xT7u0z
	cnXuF9wabg2d6D5leOrMJvQXCAipNsqau0VuHhojAGaBXin86l6HljQvILkbofJEVsqkN/WSPXdNN
	obQBJZstCIsZhQiRJqSlJ9eZ91c2YL8Jz7lH/EcejQJLu+BXwCj/0KS3qVkxblbi4EB7mkj/3Aydt
	8rn6xY3Ze9F0O5QMtw2I2ZNauWEitPBuXzlR7BkcBWF4G0fvwpQBbwNtuPDSLiolqVu/vS0BbKRmQ
	llpoSn+Og==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmj8D-00011e-SJ; Tue, 08 Dec 2020 19:58:41 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmj89-00010F-5O
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 19:58:40 +0000
Received: by mail-vs1-xe43.google.com with SMTP id z16so10168120vsp.5
 for <linux-riscv@lists.infradead.org>; Tue, 08 Dec 2020 11:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KksDPeWutRhl2xACgV90xOoRvAUNuB/xdjRuh3OGqZI=;
 b=P5vYhzOOWD8I6gSA+a5XyErnmd39EmGe2ziQEznTSC34ocQA6nP0hrUVtx30wcw+Tq
 7XB0LbTcIbrMIQIcRWbBTzW0DrWWVI4pOeIflG3c7CLCrMsnqfSM3cw31QVpAE8g8oPq
 Z3tWaCoJZ2PlOclONd7NWWc8flhCsoZhLOqaYL9kBhKWqyw600THzvmElKRROXl0khyI
 pbJ19ypih/Vhz7nSsJRgMdM5MI31r9BfLtIoJ4xHjT5eE1a+rWmtzIC6trX39tueoG+J
 Gb/gJ50UKZFROIr3jhCI76HXT2AVRurQwNJcX6eIKjUeKa8Tq7WhTZJoU17WV1lo/h/A
 jBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KksDPeWutRhl2xACgV90xOoRvAUNuB/xdjRuh3OGqZI=;
 b=OlDH7q2d8jv/1k0Km97wyNlUV8LxOakjUy+se9P0PpUScI1DAFU1DDXuTHZveZRMNF
 vavyZsEi1u/CnT0aFROyvi8f5Xo5KjP6z1e/+M8+mc3+cHHK6BAMzoGbv4lCufUkyHvu
 UAXGjj2SfDFK05wyPDtQIp+Oj4YS0CB6Ulth4CWMqBW/8cTKTdZFzCUm9H7J/9tUURZO
 +u8ulpJLM+msQVndRrooknZGkUHzrWjqRIHjqnv2TNpl0Bto09Xa8cvSwhM5YXGwVYbv
 z9u/0orq6bblbrBhg/FHAyOjxyz2omZqws4gSlbC9/+YcIrHH04YimtKTO9FhXGgigkn
 hm7A==
X-Gm-Message-State: AOAM531OsVkl8D10yb7a2vNz8i5vEcTn3pJ3puViegaOVbZ3vD1PA+0y
 305a1Sb06q/0rcRho4O1i4dbDMCP9MJBjnGqM4Q=
X-Google-Smtp-Source: ABdhPJyfCbcKrOYRJdnfbMWFnq6M7iLjXhIs1Nwn2K2AD+VjibcvpoUMU5l+qG+Wk2sAOPvdaXKnReB92CrLZn/FTC4=
X-Received: by 2002:a05:6102:a07:: with SMTP id
 t7mr18143495vsa.30.1607457515239; 
 Tue, 08 Dec 2020 11:58:35 -0800 (PST)
MIME-Version: 1.0
References: <1607455638-4436-1-git-send-email-jrdr.linux@gmail.com>
 <875z5ccc0h.fsf@igel.home>
In-Reply-To: <875z5ccc0h.fsf@igel.home>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Wed, 9 Dec 2020 01:28:44 +0530
Message-ID: <CAFqt6zbp56nOfnLvuieMMtpEi7TXuB67bGS_Y=offyiROc=etg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fixed kernel test robot warning
To: Andreas Schwab <schwab@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_145837_291666_D51FA99A 
X-CRM114-Status: GOOD (  12.01  )
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
Cc: guoren@linux.alibaba.com, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Dec 9, 2020 at 1:21 AM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Dez 09 2020, Souptick Joarder wrote:
>
> > Kernel test robot throws below warning -
> >
> >    arch/riscv/kernel/asm-offsets.c:14:6: warning: no previous prototype
> > for 'asm_offsets' [-Wmissing-prototypes]
> >       14 | void asm_offsets(void)
> >          |      ^~~~~~~~~~~
> >
> > This patch should fixed it.
>
> Or rename it to main, like most other asm-offsets files.

Few asm-offsets files named it as foo(). Does a rename to main() will
work straight forward ?
I don't know much about this area of code.

>
> Andreas.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
