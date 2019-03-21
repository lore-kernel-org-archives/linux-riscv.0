Return-Path: <SRS0=NLGL=RY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDFAC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2019 00:06:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 818B5218D4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2019 00:06:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KJ5T5oeb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8iOOEek"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 818B5218D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lshupn6MQwj7sLBl7VAeYD23AeNVk+mrL2ghXFaXMCE=; b=KJ5T5oebHR/oJd
	vTlXC0Zu6QYX4ZQNbSbDJStQjViWqyBRlRec1CCrUQckkCxbfbm9ocG3V/MaLtnk7DcYYjYXFo6og
	LFJINrthJ/SQ/V+d617QngsLv8Un9Q62ErgMN2eHHuB33ltgdKXD0sd0NMEHOdnFCfD0rzVzhTEMN
	PegldpYhYpov1LZGfUm3VyEI25bXQzBFK9SCQIHwc22JtlEDMWiWfcQlDqJfThb/vA7cf6oKHM1ew
	BV6n+wojXH0VnnHSL/O2JFmdJHqMgIhWU+Y9Z7/NIdy1DRTz9QFra0Y3Q8MrpwMmCWSJOcCi2MxoH
	VzCiu6coF9kzjIaQsFyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6lDw-00075t-Cj; Thu, 21 Mar 2019 00:06:20 +0000
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6lDt-000754-RB
 for linux-riscv@lists.infradead.org; Thu, 21 Mar 2019 00:06:19 +0000
Received: by mail-it1-x142.google.com with SMTP id m137so1810307ita.0
 for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2019 17:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dh9fCMe2mWRn4e3r3SY5rwjfjf9hXTgBN1Jt8Yv2+eU=;
 b=E8iOOEekIO1ptMLiPC7XsMtIT4WVZ0FhFpulfFF0IceuSuAEpfEYOc6fzeW8yoz0EY
 yl+7DoRvvXmYMK0wg9Z73ihtM2NKJkv6onR0afxAvRrbRQbd1m+Uf8VpZjOWdsZup5gq
 7E5JnHyEwtlSAjXgtOleMXLGHckgoiCgOgKxzXa3e+MxM8hubP0uyQfOHphHgZUOgVAs
 xmMHoFnkXjkkdwOb49ZEtwSlA1hrwindh4ZpIf4UDn3NqglmfakEwSulp7gCNeKVXl6p
 FXkrMqdZIK7FTjdAuwtd32uhjYgz0xnXHs82AsLlGc59x6baW5KYe3pXxrDktxKYJ4Ml
 bO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dh9fCMe2mWRn4e3r3SY5rwjfjf9hXTgBN1Jt8Yv2+eU=;
 b=XOdWfYKyWlM2MDeR+AyjxvO4dxk+sYWytLWxcr/oUYrlTlekLz8Tiu4GvlgQSOc6dN
 eac7veSiRfAWynuAe+lO1XtWm63lc+qYFLLNSpS0/ysyqEOHlmMyHrd/aV6gcEwQLXWA
 qsfOQBPirEHIFgEnxtC/CgJ+LXmCu0/LCRvmb7+IDYuL7fsMjO6Bzxyv9WYHCs7gWiWC
 qkCCqJKeIdIGcfZ9JMi8K0DvxD+OXoMDHTbeVxx+LTMXSM5d2WIYq5X+jNIzhFkTEhgl
 dN5UeMrfQ3YonbAtpLpVWGFap5OxraAtS8+z1rMBJ1qj0ZnZIxAYg68wDlM/SjPPNMLe
 yUXA==
X-Gm-Message-State: APjAAAWcSbhHLxh+P1r7G6iNEi4ORteyKhc0HerR50VrFQWHCL1cRq8J
 dayVzvNTVziVJ/t/fCpxhUxPzPgttCZKLXBYxjo=
X-Google-Smtp-Source: APXvYqzbzFYVcbG0juaVYRJb2UiLITSDjsCg2MDfCM9emG34mUKz5MhZIcWz1/01H9/qQxzDpE59h0djKnsnhM5MBPo=
X-Received: by 2002:a24:32d0:: with SMTP id j199mr777582ita.71.1553126776327; 
 Wed, 20 Mar 2019 17:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190320223853.1209-1-alistair.francis@wdc.com>
 <20190320234858.GA5304@infradead.org>
In-Reply-To: <20190320234858.GA5304@infradead.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 Mar 2019 17:04:58 -0700
Message-ID: <CAKmqyKPsoi7F_NNLKcm269=VAgdvsUV7HdF3dtkpMBzaKbHhtA@mail.gmail.com>
Subject: Re: [PATCH] irqchip: plic: Fix priority base offset
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_170617_905128_0A752378 
X-CRM114-Status: GOOD (  11.29  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 20, 2019 at 4:49 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, Mar 20, 2019 at 10:39:52PM +0000, Alistair Francis wrote:
> > According to the FU540 and E31 manuals the PLIC source priority
> > address starts at an offset of 0x04 and not 0x00. To aviod confusion
> > update the address and source offset to match the documentation. This
> > causes no difference in functionality.
>
> Well, it starts at 0x00, but the first one is reserved.  If you think
> that is too confusing I'd rather throw in a comment explaining this
> fact rather than making the calculating more complicated.

It doesn't mention that it starts at 0 when you look here:
https://sifive.cdn.prismic.io/sifive%2F834354f0-08e6-423c-bf1f-0cb58ef14061_fu540-c000-v1.0.pdf
(pg. 61).

I agree that it's the same as starting as 0 and reserving the first
one, but this means that the macros are actually at the wrong address
and we need to remember not to use 0. This ends up forgotten and I
have seen bugs in OpenSBI and QEMU as they have a similar
implementation. It's possible some future code update will forget this
as well.

I think it's much clearer to define the correct values and just
subtract 1, the calculation really isn't more complicated.

Alistair

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
