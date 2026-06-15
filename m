Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99296CD98C5
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 08:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8i6NhK4K31pNpE/jiAL+Oc4hhZbv1kptMk3LZGlYw00=; b=iZF4tJyGGOUN+nCFpj5s0GFqr3
	Gi/t+9YEZtMIm9NaAFX19r/j0z/uBZtQbRE7AbYwg1z2Eessnv5RzcTiBHKliKL81iOVNKFlh9sn2
	+37+7jn4rAdpwTH6muEVx2WzhGWXPRfUc8sH6VLXSPzkao7OmGu3zK6wVaSRJ3sHA2FFBTR0M7rO8
	LQoZxbuS/42uFV9DlvEVxeW/x1rKkZm+NrDD+Oq9jIAsvrThZ2LjsTYkRCFCcGne4NLEFAOR9H5QX
	hwLL368AjqSiL28fKTKslDOuIY2h6omySKNUx8aKN+FovhRnZ7w/ljgV2ZdFdHptO1R9p1sPA+3ic
	wD1Lvx6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2Gf-0000000DpXO-0iEK;
	Mon, 15 Jun 2026 08:02:01 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2Gb-0000000DpWx-3uzy
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 08:01:59 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84236f9b638so1447808b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jun 2026 01:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781510517; x=1782115317; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dYd01TaLWp+b1weWv03OfjwDWGyIew+KlNl179rn/70=;
        b=JM78eqLMIcd2R3NWUUXhgdLp2fSgRcWw69sXOxwz2uYvRdt3kr8+RSEIk3rpfg7zwv
         Bx+wlgF5r2v96BgtXuZ8sMvCDBPm0btiXol7cWByANP7HBhF3qSjLJrMKnl84K5RZeIc
         K5lBfXUK5OIIEolniuJ1kd8cGXaMLYvW0f8fH9Ez79w6HvP9coqpZWWEzWv4kCP/0u9K
         SoJX7yiSe+MMpS/ym7+6U0hQ2XCtGAsYuY3mScVwoOHhaWIdXG//st52QIqT/uAieEIX
         /ROsAdHg2sqs9i0aYRKgt/zaVY/b539v7kzgltegNAmK807Fl8djFvf83j2Bx6LyJyhg
         n/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781510517; x=1782115317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYd01TaLWp+b1weWv03OfjwDWGyIew+KlNl179rn/70=;
        b=rSBeyKZq+BlD9kR2t5aEl/aMmeAVzm91OoWf++kudGvmmbcoJ8ift1ooDG4whnSYby
         fxo07VI0Oe2rDvzchQYwGb4Ql62TvPLNMMM4sQYAr6Z09GGwJOoPvDh27/3cz36iMx8S
         Tu81bPZ8iDL18iYn2I0E1/Alx64eRXCQT3rEv1hRQz0jhwsmka3Uwnvzmpkq3Kd3cIs8
         v3KxCTyIFfaOYnnDU3DxccMSoGV5qY3LKMvdXq9O0ekYVQT+9nO15LHCW2RIg28qgDU2
         oKvqSz7z9R8cI0Y0Gymsm9KHfT/lm5ChGZwojnm7tMAjCnYZVq0U/DYzWKpvGvsmWpYX
         VEMQ==
X-Forwarded-Encrypted: i=1; AFNElJ+jY4a+1KhJHBba10b8rf931vTNe7IOfDAwTd7yzk8W3xCni0KNY+UqUEojRE3A39vzi+fEfsaIR+R/uA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhQOS71Lah4K4e55g0KAZr3LaVzXetk0cYExeljUCEna6Uday1
	mLoM3jpueyC6mERqBY6vUsxSwQnjzVXrhm2UsJdfbwNr9olti58/x3Za
X-Gm-Gg: Acq92OG6bD6d0m6hRdOXjLwjQsLocm2CX6/GvzAI/FWrmUsoHGuSI4wf6WQlVnjTith
	1AE652o39XqBbFcYrKL48odxkzZgj9/p4VjbuWxrFVP3tkER4IHIf1TryelphnO44bk4yuyhtFj
	PlUkS5tpdz/80EZIX85Zp1yq6n5N3vgfYW/9Js1zWzgnGzSVsS0Fmi9AngzTQZk0AKOD8WZPThw
	q75+md4A0onbksFbdd7SnRYUt5lklSBMTHZZRLn7cMqMeN4tNhthPoqxw82eEiTjThUHoX8YBCs
	HWv14IiqiqFTeK8XogOxMtoFtvyOsH3urUr3dKiJOBIySwKE5cyMuCvJnCwhelNBIIQPI+5aLDF
	pTTgXJxDYVZV3dLnqKeGP6nB2j5ovWKw8MD7D2WhgngTq0HD3Rj4d+WSeeprcuSHWhJHwwXA=
X-Received: by 2002:a05:6a00:984:b0:82f:72e6:ed4 with SMTP id d2e1a72fcca58-844e1596c86mr10840924b3a.0.1781510516767;
        Mon, 15 Jun 2026 01:01:56 -0700 (PDT)
Received: from localhost ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b055095sm10890663b3a.57.2026.06.15.01.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:01:56 -0700 (PDT)
Date: Mon, 15 Jun 2026 04:01:43 -0400
From: Guodong Xu <docular.xu@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Guodong Xu <guodong@riscstar.com>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] dmaengine: mmp_pdma: fix wrong extended DRCMR base for
 SpacemiT K3
Message-ID: <4wo2ylvv2v2kmec4vzycgide3orx2zwjzdjunfm23t6pclknbl@pqtb7lw2parx>
References: <20260615-k3-pdma-fix-drcmr-base-v1-1-ee1af124199f@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260615-k3-pdma-fix-drcmr-base-v1-1-ee1af124199f@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_010157_976568_476F859E 
X-CRM114-Status: GOOD (  10.25  )
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

Hi Troy,

Thanks for the patch.

On 2026-06-15 10:53, Troy Mitchell wrote:
>K3 PDMA shares the same DRCMR layout as K1, where the extended DRCMR

K1 never touches DMA request numbers higher than 45. It's not K1 who needs
the extended DRCMR. PXAxx needs them.

>base address is 0x1100. Commit 6587b8661a0b ("dmaengine: mmp_pdma: add
>SpacemiT K3 support") incorrectly defined DRCMR_EXT_BASE_K3 as 0x1000,

The SpacemiT K3 datasheet still 'incorrectly' carries the base 0x1000.
Refer to [1], Section 16.1.4.6 DMA Connectivity & Assignments
which still states 0x1000 as the base:

0x1004 Request for SSP0 TxReq 0xD4040000
0x1008 Request for SSP0 RxReq 0xD4040000

I would recommend you double check with the SpacemiT team to make sure.
It's better SpacemiT can fix both the online document and downloadable PDF
as well.

[1]: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/16_peripherals/dma.md

>causing all DRCMR accesses for channels >= 64 to be off by 0x100.
>
>Drop the bogus DRCMR_EXT_BASE_K3 macro and reuse DRCMR_EXT_BASE_DEFAULT
>for the K3 ops.

>
>Fixes: 6587b8661a0b ("dmaengine: mmp_pdma: add SpacemiT K3 support")
>Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>---
>This is a minimal fix for the wrong DRCMR_EXT_BASE_K3 value introduced
>by commit 6587b8661a0b ("dmaengine: mmp_pdma: add SpacemiT K3 support").
>K3 PDMA shares the same extended DRCMR base (0x1100) as K1, so the K3
>ops now reuses DRCMR_EXT_BASE_DEFAULT.

Before we flip it, could you please confirm your source fo truth:
did you confirm 0x1100 on k3 silicon with a real DMA transaction,
or from the datasheet? It would help if you could share your
test setup.

BR,
Guodong Xu

>Best regards,
>--
>Troy Mitchell <troy.mitchell@linux.spacemit.com>
>
>
>_______________________________________________
>linux-riscv mailing list
>linux-riscv@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
