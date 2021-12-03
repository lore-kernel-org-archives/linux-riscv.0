Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3FBC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 12:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LRV1up77cdaRRFjFnuKhiZKYTgBb96oK+Ze6/gsfqsk=; b=vANmLwVS8GQK5W
	3fHN6fhNu0pMCkVPea+l1lQjgjqPjuVz5EXLPHtlDaxfdwI/QCRpMdUoCAwNFlXhxepHM5g2ICAgZ
	Ucw6gpKLruioHtilpxXzWm66CqWjeNgNF2SHzZnwVK4wHW0UsfuGKrqudi5wusxRBbamcjuc6OP5g
	//ri2Pz0vKiyT9ZGEG9Q2cfdsu1a42nI153H5MsdYyb4DCFriQAffgebmzBm1COgWwy+OeUrghAjK
	A9nkKu6DdCiee4pYzDuCiIqDeJiR45YLqp/HxxAwRcTA1bSGUzqIuqp/+1mvnr27yfZkYTrBNw5Ak
	Tf4C1WfWtFXpCnpVRHFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt7tI-00FmLZ-JR; Fri, 03 Dec 2021 12:42:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt7tF-00FmJR-Mc
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 12:42:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so2111089wme.4
 for <linux-riscv@lists.infradead.org>; Fri, 03 Dec 2021 04:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qVxUZTA48fwXv3Wn0ogrdcDO6KHcU9G34XXI6zScy3k=;
 b=pSqANDTUS3mKwQ6erhSvkVg4ZEzzkjyx+o3qZM3kCJr6TXy6uSTMHytzkn8bhUEvx4
 XQwRoPPkfjinuY/islUOD3oiw2SyCV3KkYZ+oHW6fvNXE/ezyPRJi5iYF2Kua5YH4t2L
 ixSc5TBrsBBPoqlTPlP1vseZmWtoHoUeMLbrkq08K9yYzmaS3H4xKb80J3g9ClxIBtFX
 WUEW8RKqBFUyPDqwP5a7t9VQt1BH2RCRpYkY5MqroIarMhYnV6Iswzx31MuIQhGYWAA6
 H9IRXX2re7Smr0pYsZ0bhFWOX7CkJ8QzQUFiHGuaoWj3hn4ftpGEv8bxV9WI+YX3vTiz
 57EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qVxUZTA48fwXv3Wn0ogrdcDO6KHcU9G34XXI6zScy3k=;
 b=GNFcUk7ruPZBo+Mchc2LvxWaz5M92BuiyovkjUDG2kDTCnslzATwrrzB09j0XvtwYT
 NaR1CnNpHJejOKJWYtmjGeXo+5LG/gFrYnby65+C04yI7q3zZ2Htyy3O1O4EgiMl3FoT
 qFi6ajCq0ZZWJodaIgeFAf8v7G1xIjhMvgpJOZzgQIBj/7xGyaskdAZTSYGEY5ZpO9Gn
 zpJDrljWtunEYc6Sqj1jnmjEw2zxQAi0ssQWIuknkBenMLX/CRhjqnJbUoMT4zOVzFpR
 lCQoSrh3av94VaSC0MhfzzNhakSx73i0jAUecy4BNLEJ8qJVSOxRleFN01jdQRiF8Aoo
 FKvg==
X-Gm-Message-State: AOAM531vIC35tPwYfGbK/bt6v62YjqaW34TMDAIWvXSSpxj2I7ph7kiS
 tSWMbGNDhHPA9M8yA435gDGxkRq9p3eFHiQpy89pMg==
X-Google-Smtp-Source: ABdhPJy4KJ4UCDPG+oIVWlnscWS/tdV/WYUTDmpki1SQxXs5uGRrTAY9O/eZUHIboP0pxfWDG141mtM0NwWazl+Dk1A=
X-Received: by 2002:a7b:c194:: with SMTP id y20mr15092030wmi.61.1638535331744; 
 Fri, 03 Dec 2021 04:42:11 -0800 (PST)
MIME-Version: 1.0
References: <20211202235823.1926970-1-atishp@atishpatra.org>
In-Reply-To: <20211202235823.1926970-1-atishp@atishpatra.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Dec 2021 18:11:59 +0530
Message-ID: <CAAhSdy3jvmSUBjVm+YP3PBqRt50UUmq9ci68f7gZdOfXCoBQjA@mail.gmail.com>
Subject: Re: [PATCH v3] MAINTAINERS: Update Atish's email address
To: Atish Patra <atishp@atishpatra.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Anup Patel <anup.patel@wdc.com>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_044213_833371_54A18CD4 
X-CRM114-Status: GOOD (  14.62  )
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

On Fri, Dec 3, 2021 at 5:29 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> I am no longer employed by western digital. Update my email address to
> personal one and add entries to .mailmap as well.
>
> Signed-off-by: Atish Patra <atishp@atishpatra.org>

I have queued this for 5.17

Thanks,
Anup

> ---
>  .mailmap    | 1 +
>  MAINTAINERS | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/.mailmap b/.mailmap
> index 6277bb27b4bf..23f6b0a60adf 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -50,6 +50,7 @@ Archit Taneja <archit@ti.com>
>  Ard Biesheuvel <ardb@kernel.org> <ard.biesheuvel@linaro.org>
>  Arnaud Patard <arnaud.patard@rtp-net.org>
>  Arnd Bergmann <arnd@arndb.de>
> +Atish Patra <atishp@atishpatra.org> <atish.patra@wdc.com> <atishp@rivosinc.com>
>  Axel Dyks <xl@xlsigned.net>
>  Axel Lin <axel.lin@gmail.com>
>  Bart Van Assche <bvanassche@acm.org> <bart.vanassche@sandisk.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5250298d2817..6c2a34da0314 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10434,7 +10434,7 @@ F:      arch/powerpc/kvm/
>
>  KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
>  M:     Anup Patel <anup.patel@wdc.com>
> -R:     Atish Patra <atish.patra@wdc.com>
> +R:     Atish Patra <atishp@atishpatra.org>
>  L:     kvm@vger.kernel.org
>  L:     kvm-riscv@lists.infradead.org
>  L:     linux-riscv@lists.infradead.org
> --
> 2.33.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
