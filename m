Return-Path: <SRS0=sGlk=O2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E496C43612
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 09:37:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8B1E206A2
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 09:37:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GUI7jx6L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="ukDxC+hS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8B1E206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TsMTOAy16BcsHdul50wOeI8hxGdlYLXQplpqRHsgQsU=; b=GUI7jx6LWSylOi
	/1euQRoxnKUeZ23Aa6I8BbR6uPNAxgwow9mvHHAp44FrzEhR5a7K1N1nhS4Mx2xIfW1VX9O1RbHET
	QbceVZDiDEL8uGHIYavGafJ5CBe5qd1oV2fXBhOhK7zTmNZk89+J7VlI+5cE+F02zVBQ59Gr3G6c9
	hsJbrSErT1iAjkMQPX6mljztCcdIwJ24lM5HvsNXHNPLn1BTG3pfXdKimi5Ia0eOmrgJUBEfYhmpK
	vSeeZEg2n5n4jh7B6WW918hArZdLQszUysGf+psft54hU5msPa3DfMc2FcmrRWmrmoPPLKXzov3JQ
	8XIa/bigrp3rFsKkxBow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gYpKp-0002V7-1x; Mon, 17 Dec 2018 09:37:11 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYpKn-0002U3-5Z
 for linux-riscv@lists.infradead.org; Mon, 17 Dec 2018 09:37:10 +0000
Received: by mail-wm1-x342.google.com with SMTP id a18so11888719wmj.1
 for <linux-riscv@lists.infradead.org>; Mon, 17 Dec 2018 01:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s8zZYYBpwYWn5hfJjNp5dCjaWNFjJl27s9MRtcqUbWw=;
 b=ukDxC+hScIdsBXLuSXzJ3JfvXOcaezdp/yDTHJpnEgX+qge6+JhxctNWpT40cT53Mk
 VdJT0EENh+hK8eWwtOvO5kiK5jUQ91AR8LiXtzsxM6nuyps404Dd0ncILrZNS9g4y3hJ
 KENf0dlKfpfU5KjIoli5IJPPRX6UL2wwYxopvKjcYmiCUD7OlAp/kk0fHOSuJ++vQ0M6
 /FUFDU8rGmyt08o9w1GGH/E9QoFdabrtLB/FYGFtVhAcIgSQa1+uBPiShUDHblpgWkFU
 2L1y4GQiRfmU/FH8QHKGByHGCxv+ZYElVGCKuesPi+wX49pUJ4z3NyHt5Lvc1cMjmSZU
 k+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s8zZYYBpwYWn5hfJjNp5dCjaWNFjJl27s9MRtcqUbWw=;
 b=DSu50GEkpMZhg+SjnTBgnpQ+VEXXswNLSS6LM2kvNoUkR0lpkNWNMV049iDkxfXlP9
 w8F4axv1zyxzOQDAlWeA5o9QwtqJCDReSH6r8d5CYCn3kpoIyQ46jJEeBjU1VCVHoAn5
 /0Cp/StXIdbCBYrbhIrGOttz8a5A21sLZO9sBw9bMaFkGU0ePlmq0x0MfVjmQf3Be01d
 doOK/5zbx9N5kqeWS1EPnnxh2x7ARwTvW2ZCfMZD1KYarbPNTbb8HGrKAjMeh3/9S/YA
 YM4QectWQUgQoKrpA1NkdOssQHQp+G6xU6z5v6aH3zr0zMcYvoIiiwGXu/jfeGeEijin
 eJIg==
X-Gm-Message-State: AA+aEWZg1G5tgKwp8yNHfj9eTuiBfcQkJ0sHj6rPZTuEZBKXUp1FlXaM
 VNBI0g2GQHwpe3og7l/oliG9KQUDo1oWUbulYd/p5uBP
X-Google-Smtp-Source: AFSGD/WayTs7+4YAKeVwDhjje6SQgEioUZRT4ssOYRLVkzC556m+b7SpabPA+eTnIDTytXMHo7B8Q6MGy4aA950gwhc=
X-Received: by 2002:a1c:1801:: with SMTP id 1mr11634200wmy.153.1545039416992; 
 Mon, 17 Dec 2018 01:36:56 -0800 (PST)
MIME-Version: 1.0
References: <20181126060802.19314-1-anup@brainfault.org>
In-Reply-To: <20181126060802.19314-1-anup@brainfault.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Dec 2018 15:06:45 +0530
Message-ID: <CAAhSdy1danjgviJ2WGGEANQXFkzZzXUdCj+04dZ4eLjcVOt14A@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Make BSS section as the last section in
 vmlinux.lds.S
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181217_013709_214125_45053104 
X-CRM114-Status: GOOD (  15.35  )
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
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 26, 2018 at 11:42 AM Anup Patel <anup@brainfault.org> wrote:
>
> The objcopy only emits loadable sections when creating flat kernel
> Image. To have minimal possible size of flat kernel Image, we should
> have all non-loadable sections after loadable sections.
>
> Currently, execption table section (loadable section) is after BSS
> section (non-loadable section) in the RISC-V vmlinux.lds.S. This
> is not optimal for having minimal flat kernel Image size hence this
> patch makes BSS section as the last section in RISC-V vmlinux.lds.S.
>
> In addition, we make BSS section aligned to 16byte instead of PAGE
> aligned which further reduces flat kernel Image size by few KBs.
>
> The flat kernel Image size of Linux-4.20-rc4 using GCC 8.2.0 is
> 8819980 bytes with current RISC-V vmlinux.lds.S and it reduces to
> 7991740 bytes with this patch applied using GCC 8.2.0. In summary,
> this patch reduces Linux-4.20-rc4 flat kernel Image size by 809 KB.
>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  arch/riscv/kernel/vmlinux.lds.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index 65df1dfdc303..cc99eed44931 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -74,8 +74,6 @@ SECTIONS
>                 *(.sbss*)
>         }
>
> -       BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
> -
>         EXCEPTION_TABLE(0x10)
>         NOTES
>
> @@ -83,6 +81,8 @@ SECTIONS
>                 *(.rel.dyn*)
>         }
>
> +       BSS_SECTION(0x10, 0x10, 0x10)
> +
>         _end = .;
>
>         STABS_DEBUG
> --
> 2.17.1
>

Hi All,

Any comment on this patch?

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
