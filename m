Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E6BD5C0F4
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 09:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c3iV958fGA6kumfDhRGozoLRJVXdqeinJHPP4KdPF6s=; b=YFrLJQ15TnZoQ4
	rc3Kjk27e+duQ52raXrN/O2u5yGL5p5pXjTiqhf5oWtazXycO4R2ns+G/qleCsj+Ms/kIeFM0LukA
	+TDH/QX7tgT001cBx8711Of9oBW0At0RbmHRHZOvpuitRSFI5Tki1s6SOdRsppfduxUu6+g+fPE+D
	Yirh8fGK1eoNZPQ9PMm85WaoHCrZo9RO8JlZpJGAD2Dfk3DygtdVKNW4OP+yQxiUlSHEJTQTzqcun
	KJvdc1YUKyuRSmo4MrGv3uIFJs7Kpxo8TXRxjd0fPs9jifU2fjrQ0laO196lU/pbyNwUZbphsOVvw
	cAUvcHIanUP6PWm7UyfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQuR-00000004xbo-2nfT;
	Tue, 16 Dec 2025 08:59:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQuN-00000004xb5-12vA
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 08:59:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765875588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=smIh+5mEfwRp/VCJn7PI/sDG6WFCEcopmj3bu7mRfhk=;
	b=Ihd5U+JZN3cPufSsatxxMIk2KYKio4Kb/ceVFa8cCTg8snQ2nPMss6cdC/QhTP8q+SRxpU
	Z865QSP1KYg4dNwn6G3y07FrpskazizA4VGXvDuMrQTEbyFYNksJE9+FaB5zDshPtAsgoo
	YMOnMtLebC0Ph4UoYqo5qvEqOd0rXF4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-V3hS-sVCOO6PH3nDFeUalQ-1; Tue, 16 Dec 2025 03:58:17 -0500
X-MC-Unique: V3hS-sVCOO6PH3nDFeUalQ-1
X-Mimecast-MFC-AGG-ID: V3hS-sVCOO6PH3nDFeUalQ_1765875496
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4775f51ce36so35609115e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 00:58:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765875496; x=1766480296;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smIh+5mEfwRp/VCJn7PI/sDG6WFCEcopmj3bu7mRfhk=;
        b=oI0fXd2mheuqWtFwMZvj+AwsvlwjutpwR90lbC+9H7U4tpz1AXIek/by4C68Agd96q
         H6dENAypCxMBgOweM7alvAUZeZOTE6e7N8BMmZWDHztdV2TY2XwXcpZyFphdRHHJv3Yw
         Gb46QXFpFtXlaf9Xofxliv63Zd6VOyB7b8CcNJAoAcr6o9jb5VcRFZfaW89iI8miQ2Jv
         ECxnDk/cRtpa0H/TLSKIFX2XGHXjTN1FDrX0hP9rL4hjJS8RB/0PUCMHz8n1nBH9wn7f
         nYahkJ/B/bn3i34nIe/Ya9lxr5OEe6Yf2S0MkT/9MhLyTkR9EQIuH7qnOnTytc92n8XY
         qAVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmFZAF6EeBbc0RebrilqZosh4D3MpVJRt9qPQhR3aiv4Ay4xUWlv46y82MBNlVUHMFrbNJ161lfqbVrg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9Rk03WWnFg9gjM9JfVIZflySILD4rVu+t7prlfWkWo3SDb0it
	yuO2AzuKxbJDDBJmJtOX1riznwC/04sBaCXcfkeSIv4lLO/epDw6/xvCanCKFKZzO0Z5pisLrZG
	ttD0JxxyPzfHETwaMMOJLiC25V5CChgGsPz+xNHtzq7jh8SBv6NcUsldf+8Dt8LzCr3gNxA==
X-Gm-Gg: AY/fxX6ALcur5h78kIchCuLH1iDZqMHyoSDttKRrEvQMv822+5J/5N/wxl+iGSRtmb7
	z3Oip3OxtXTwhZwmdq9VNQXu8rv3QdOTAKsESx9dt0rphefTfQMTRDqKNXAcqXOhRLLca250j6V
	qbipuXKWiTLVEeAGu6ya4RUE+hdujU5Yi0JYE0sOA4csBv5smwDoTeneKyHIDj05tRt+ZMO8QCg
	IMjqv50x8e+SJ0v+9yPKl2Je7gSZDckQorvry52jJGZOZTA4w+QvpKflcBUawqU07iknnxTtwgS
	WTFQkVJHWIb/2M1MKoeoyOIxoS23TObF6/+rK2bnJHL5lND6jAAK3mU4THZm2d07iAUST0RG8Kt
	WERi/2KImR9/YDaQf7j9XSKpawY1vp1BBysMyPaePk8BEUmwuDV7IxCdxbmc9o9iVqpxc
X-Received: by 2002:a05:600c:4e09:b0:477:9976:9e1a with SMTP id 5b1f17b1804b1-47a8f89bc6cmr149957655e9.6.1765875496506;
        Tue, 16 Dec 2025 00:58:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjWkmMYEf67W1YCZcgSloFqkbCuOswTF4JodEbbnfpJ+BFJ/SH99M+jkvcimr1IpbsGAY3/w==
X-Received: by 2002:a05:600c:4e09:b0:477:9976:9e1a with SMTP id 5b1f17b1804b1-47a8f89bc6cmr149957445e9.6.1765875496061;
        Tue, 16 Dec 2025 00:58:16 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43009dfe5b3sm22487329f8f.39.2025.12.16.00.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 00:58:15 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>, Yixun Lan
 <dlan@gentoo.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Binbin Zhou
 <zhoubinbin@loongson.cn>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Michael Opdenacker
 <michael.opdenacker@rootcommit.com>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
In-Reply-To: <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
Date: Tue, 16 Dec 2025 09:58:14 +0100
Message-ID: <87cy4els61.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z6qvC4lJwghdwc0TCsD0K58zLbzK8snAaeO4mrIoA-k_1765875496
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_005951_362300_FA87A6E3 
X-CRM114-Status: GOOD (  13.59  )
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

Michael Opdenacker <michael.opdenacker@rootcommit.com> writes:

Hello Michael,

> The OrangePi RV2 board exposes i2c2 and i2c8 buses
> from the Spacemit K1 SoC.
>
> This declares devices present on such buses, in particular
> the at24 eeprom to store MAC addresses and the regulators
> attached to the PMIC on i2c8.
>

As Yao explained, there is still work needed to make the MMC work on K1
based boards. I also tried the same on my Milk-V Jupiter and found issues.

I believe though that this patch has merits on its own and could land
regardless of the MMC support. That's why I also posted a similar change
for the Milk-V Jupiter board:

https://lore.kernel.org/lkml/20251206134532.1741648-1-javierm@redhat.com/

My changes are identical to the Banana Pi BPI-F3 and I see yours too, so
it seems all these boards are based on a K1 SoC reference design.

> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 166 +++++++++++++++++++++++
>  1 file changed, 166 insertions(+)
>

Personally, I would split the changes in separate patches as I did on my
series. But I guess it is also OK to have it as a single patch as you did:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
