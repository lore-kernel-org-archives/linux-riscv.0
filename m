Return-Path: <SRS0=jEvo=KT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC8A1C2B9F7
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 16:20:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75B73613FC
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 16:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75B73613FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XFTouVcHcHSF412t7NWtCj1E8cACQju4Tjp7EJ6A0bQ=; b=g1xO/zJnZoXyXm
	Yp/WS95QbxlkrywA6Y628iM74/bppsXb7ykEUpsVLpZkgzkNK0jlkSDNHOgYY6OWbBEiw1nHmeOWo
	fVhGNzE5HzBEut2NWzOGRinZK+FCndOFxfm04yb6dlYtnj6bMuy9whw2pnpldGLhND6OPnsqtCn+d
	X6xOME4J+luTjIpBjHOYLyq38rq1+i5xyQrHdCR6MKhVZeD6T4HoTGDofZk99untqAJ5z8RFA1NEa
	fVqpacio+X3+LOWlMIWGVXODrXXS9v1pqry1VPd1Yt8duVhNSZdpYRmgJoMqFChJzkFnqC1J+775h
	8hUSfSbZBFg1t2Pwd+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llDIx-0014Hu-Bf; Mon, 24 May 2021 16:19:47 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll5Yc-000l3c-Mz
 for linux-riscv@lists.infradead.org; Mon, 24 May 2021 08:03:28 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 f6-20020a1c1f060000b0290175ca89f698so10891867wmf.5
 for <linux-riscv@lists.infradead.org>; Mon, 24 May 2021 01:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l+lXZOkJT9ztp2JCl1bPRf8G039aIWHo+Vabd2KIAvY=;
 b=hE15bhqpuXbPdzqAazrfGMf6jpdb7Plfzzuf8Tg3BA6zCx8evuNi5OahN0lBSi6jy0
 gmL2pDkRxR+V6YGQV9V5IG0mTSsDV2iuox0/5/1IQawdULfqWvOg6DWh4BJg4fEGeK2E
 J2AQpGvMaXThT16y4SiEJuhqSbiUyYR3D+56Ik012/2/YQXTxBpjo/ebQAUY/pqFLjxY
 BcdjFYg6YKXxY2YcIZEYYwL+gRPsD5CEaNAlKZvfXvlhshNwe8bLJc/Nr73JUMDjdOQK
 ParA5bj6PXKxhEZ0fHTy1lfN+l7xXY9cQCLdHYnZ95OIjte1+fWjOUXB5M0A8iL1NkqS
 qU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l+lXZOkJT9ztp2JCl1bPRf8G039aIWHo+Vabd2KIAvY=;
 b=O0mGPIHv+H5hvmibA9mkW1fi6IbqUbRijKdmTD5q2e4H9/D3/oaX/78mmcosDG+Dfh
 CFWbutfel63MBW4FJedpxTq5FdlEVLl+WW6oJV7PiyEEZsAMR5nbF5q0KNahpattNYaK
 uDRVhp2eq5aH5cVpe2uRxvVfP3wZuhlDuSv5LgNYKxS5SAdpdeJRZHhUVxzrAzhtWQr0
 ObET+sGMEPVdcjqk9ikxHDEyJKfmLh7qAN11zKARkbDY4/YGzI2TjbPjsMFIMpNGes2+
 Zigs6IFKxrFQUBAL0Dz+amAYPe+7HmILLCHdnDLnbfG5EZY7o16mCACvowIF4z7s+HmX
 6auw==
X-Gm-Message-State: AOAM533Fuc7LjlQ2xTokvJwQ4JTi4ZyWOZBAclceustATv+Mpz38qCFc
 S7nPKMPtigoo3G9L4pUfqkZCd0a+MdvkgH5NQcd68Q==
X-Google-Smtp-Source: ABdhPJyeURrTyE53pS9rjIrF1XyAYSlM5EIDZxsof/N3+lCkEYOm64yTb06OT7Z706TpnIKNx0pnoQ13EAD6f/Q4bPA=
X-Received: by 2002:a05:600c:b44:: with SMTP id
 k4mr19148969wmr.152.1621843400672; 
 Mon, 24 May 2021 01:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <1621839068-31738-1-git-send-email-guoren@kernel.org>
In-Reply-To: <1621839068-31738-1-git-send-email-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 24 May 2021 13:33:08 +0530
Message-ID: <CAAhSdy3ORUGqyL-9oMQCKYCXnG8M=xrZ8q+AiWg8s+v6zsk=_A@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: Fixup _PAGE_GLOBAL in _PAGE_KERNEL
To: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_010326_774757_8B89CE3F 
X-CRM114-Status: GOOD (  17.37  )
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

On Mon, May 24, 2021 at 12:22 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Kernel virtual address translation should avoid care asid or it'll
> cause more TLB-miss and TLB-refill. Because the current asid in satp
> belongs to the current process, but the target kernel va TLB entry's
> asid still belongs to the previous process.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>

First of all thanks for doing this series, I had similar changes in mind
as follow-up to the ASID allocator.

I went through all three patches and at least I don't see any
obvious issue but I think we should try testing it more on a few
existing platforms.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/pgtable.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 78f2323..017da15 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -135,6 +135,7 @@
>                                 | _PAGE_PRESENT \
>                                 | _PAGE_ACCESSED \
>                                 | _PAGE_DIRTY \
> +                               | _PAGE_GLOBAL \
>                                 | _PAGE_CACHE)
>
>  #define PAGE_KERNEL            __pgprot(_PAGE_KERNEL)
> --
> 2.7.4
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
