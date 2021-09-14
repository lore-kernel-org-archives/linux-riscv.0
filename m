Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEEDC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 08:30:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCABE604D1
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 08:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CCABE604D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++GLR6LSD/l9lDNKSw3Hs8wuRUe0PWvrmohkbVSLo5s=; b=13zTaS9OE+sKqZ
	G6VtSS5rGI6MJE15Q/5L+gJdB7qHnCmdqpLcB0d9O01O7BShm8BImQ41JG9JVU0Zpl9qZCgADhNdS
	ULyXXWw2XyNMSZdWC9fhiuXb8L1O260RyzNjW0quutA5LruS/Qj1mV0TU6hwRkhtImMH3SQmOIOC6
	TxL4XizXu2bjnCe2d1whoinuIupHDVXyJYlPdpp162QRlZU3+wL7Zn5FguERY9wVDixKQFgV+naqi
	hK2w/tI6aMxyxGk+OUMuzEFCUO6CzCnM/n0v/TbbGtfdbeItB3S5RmswlfaOst4Ju3QZAbAaFhlGF
	rzUnm1cuUfftebbuX19w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ3pd-004ggI-VP; Tue, 14 Sep 2021 08:30:22 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ3pL-004gXw-Eb
 for linux-riscv@lists.infradead.org; Tue, 14 Sep 2021 08:30:04 +0000
Received: by mail-vs1-xe36.google.com with SMTP id a25so11067125vso.5
 for <linux-riscv@lists.infradead.org>; Tue, 14 Sep 2021 01:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9SfYqEgYuhGjmpKp+8qsm/+IR4JBWTK40kNQ4OdfOh0=;
 b=csnaULio9miwWi3mxFy1WKWbVSnfdg/nwldFHmBIxPqOz1WLHX3d+SRzVG0rlV4Kyh
 dWZ1DeqZnchItRJwwpNQfoIcxZy1zqmjMtpvHd5UQiyzk8T7LBXYZcy8ncdtcSFd6VwP
 WpyXRbaeLyocF1/lBh577OLssYc79HO3C5y7qJh5MfKa2CrT3Di1pPJBLwpfKFHqdB+R
 j0VUA7cqgozL8BrrNstJeaDIJ/cSunavWhABMoEXg6tNJDqiJppX57fuh754MOiGjd7h
 evvkbHZ4P5v2njaY/Smx5tMZ6Rh8nrOfDR3cMgMH+G3kWgFh6L5oH/W9+9bSFuMZ/Fxa
 m93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9SfYqEgYuhGjmpKp+8qsm/+IR4JBWTK40kNQ4OdfOh0=;
 b=5o8/NrRMykarteijTo6NQj/FjP8vOyhzDqXdEPjIDfAFEjKwiSwJW1ZUQmMHwoWrNz
 TeedcvLVpA3ixYAFk7eqnro6i59Shjbt3yrn3H8abWVXZhVXvMekibZNaaNEDduB8fJH
 +QCVZuY4HyveWyMzkOe4DwGNxpfjDYE9O5+cNU5CrwKQrdRlBvKEaAgKf4oAs6lKmGHv
 lzpXo1iUOwMHIWmFVIA44oJavEYS7XsKHTX/OgP0xLPg2ftwLrTxHWt4H17pqRl2mTOG
 AYPlTVt6IzV8AYIgDfhWsfx2ZEj53eVEBnGp+HxdViBskvNH0iMpzZ6KX2irCF0bZyAR
 wDUg==
X-Gm-Message-State: AOAM533c9kefyEmYmlK4MKLtIN/MLH72PT7CEgkHLHrNIFCLSyuuKgSj
 m37eOh6uFQJ9adB1PArUZE3HvGqd56+vDW3Q7ZI=
X-Google-Smtp-Source: ABdhPJycHurFqjM9bo5/WXeY2QeFe7n1tG6NRMOd1bUnNb8FyWsi/Rv5pnO7Ag76m5y/XVWj3Z3VA8vOnPUPhMuNAA4=
X-Received: by 2002:a67:ed86:: with SMTP id d6mr5241863vsp.38.1631608201390;
 Tue, 14 Sep 2021 01:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631121222.git.greentime.hu@sifive.com>
 <33c485ee595aff1e19a0e43074da59779f58d105.1631121222.git.greentime.hu@sifive.com>
In-Reply-To: <33c485ee595aff1e19a0e43074da59779f58d105.1631121222.git.greentime.hu@sifive.com>
From: Ley Foon Tan <lftan.linux@gmail.com>
Date: Tue, 14 Sep 2021 16:29:50 +0800
Message-ID: <CAFiDJ59nbV_opZRxfsv2kj8ObSguT75GJUKhA6Zd3+BpQOynjw@mail.gmail.com>
Subject: Re: [RFC PATCH v8 15/21] riscv: Add vector extension XOR
 implementation
To: Greentime Hu <greentime.hu@sifive.com>
Cc: linux-riscv@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, aou@eecs.berkeley.edu,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_013003_577192_F6191E85 
X-CRM114-Status: GOOD (  17.53  )
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

On Thu, Sep 9, 2021 at 1:49 AM Greentime Hu <greentime.hu@sifive.com> wrote:
>
> This patch adds support for vector optimized XOR it is tested in spike and
> qemu.
>
> Logs in spike:
> [    0.008365] xor: measuring software checksum speed
> [    0.048885]    8regs     :  1719.000 MB/sec
> [    0.089080]    32regs    :  1717.000 MB/sec
> [    0.129275]    rvv       :  7043.000 MB/sec
> [    0.129525] xor: using function: rvv (7043.000 MB/sec)
>
> Logs in qemu:
> [    0.098943] xor: measuring software checksum speed
> [    0.139391]    8regs     :  2911.000 MB/sec
> [    0.181079]    32regs    :  2813.000 MB/sec
> [    0.224260]    rvv       :    45.000 MB/sec
> [    0.225586] xor: using function: 8regs (2911.000 MB/sec)
>
> Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
> Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/include/asm/xor.h | 74 ++++++++++++++++++++++++++++++++
>  arch/riscv/lib/Makefile      |  1 +
>  arch/riscv/lib/xor.S         | 81 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 156 insertions(+)
>  create mode 100644 arch/riscv/include/asm/xor.h
>  create mode 100644 arch/riscv/lib/xor.S
>
> diff --git a/arch/riscv/include/asm/xor.h b/arch/riscv/include/asm/xor.h
> new file mode 100644
> index 000000000000..60ee0224913d
> --- /dev/null
> +++ b/arch/riscv/include/asm/xor.h
> @@ -0,0 +1,74 @@


[...]

>
> +extern bool has_vector;
> +#undef XOR_TRY_TEMPLATES
> +#define XOR_TRY_TEMPLATES           \
> +       do {        \
> +               xor_speed(&xor_block_8regs);    \
> +               xor_speed(&xor_block_32regs);    \
> +               if (has_vector) { \
> +                       xor_speed(&xor_block_rvv);\
> +               } \
> +       } while (0)
> +#endif
>
bool has_vector is changed to has_vector() function now, should this
change as well?


Regards
Ley Foon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
