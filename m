Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D2FC79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 14:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lAgAcCeJzZ/sL3ZrZvYACsst4maQxFZu5lq/x9GNr3s=; b=Q/uzBoxQVIV9Ie
	3cHNd916m+Dx9QfKDimDeqEHWRnRzlO8xCn0ml1Y/29dIi4Ak+Np7O5JtsHjVnTd9xUZGMMGfD46V
	ajwvNN7jFSW8QNwwSFsBoJ7x+CeEgHiGQZozstp7tA2kVI4sg10didOsKidYTX14MHpTizkqjQplg
	jv+eOOVKb3FYw40JEGRkU1X9tCYQHdfzfd0P6VHGVXkAOUhdbvDDezgY6IeenVpalqIW6+ffJw8VP
	+lmDBQmeWuHd0WfaoEBdq+784X1eHRcYISjKnIEFQSKUkLdlUNEBPrmDdXZpYl5D7kHXSLnBqdAi/
	Vp4SG6kC0kjtzUwyYDuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fTJ-0000000EaKa-0awj;
	Thu, 10 Sep 2026 14:09:49 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fTG-0000000EaK4-1dLD
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 14:09:47 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-8623e5d435cso806917b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 07:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789049385; x=1789654185; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=flauk2JAfyKEUjs5pcpTgaXIkDJP3xfV0YHLjD7hMCY=;
        b=e/3LhP+F4pJHyuqtlare6sm3ButR5DUPK9BvANULVPV/Z9HVVDwFNV9sq+ffKsIbaK
         fGXWZ0Q63JyVERIvBnA0ugxXT1VwoYz4B3oB/x+hpObW/BckXOo5DZ4XrswQUjvOCk5L
         jeBHOMUSX7S2JlzwBAjbEhxmT/QBZiYmj2D00ub+TPzm434vNBBKoA04g/41sWfJZHFk
         vteiUrUdhCe2EHHkIeYDNT3QTF9xpJybwexVw5ZJtpuMoRLuX74CNBJZyyPoh2vVdf99
         d7OEFNJzb5E/QU8r+pwpwbSHbwWMWwWhJOxDwe/z8F8I+zVpbjzpn4nQqeD9Gl5HKgS0
         OWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789049385; x=1789654185;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=flauk2JAfyKEUjs5pcpTgaXIkDJP3xfV0YHLjD7hMCY=;
        b=dyydpwRw2iLA2plqfUL/dgCmmgJilpAKoAnM6zvycZFJPtjL/LkXhdaD0NItJB4AKD
         DTyssTirWDDo5bBsoOWAIwhECg+J0yB1VSIjRJtd6hnWSr+2wGI+q8BYnIgGjHNWIFp4
         ueCvDTeAKuAIMrYKrPtgdSVsUi1Lhl9wO+Ke9bl0OAd5MSDUNAbNwcfXWDwUkoOH1aJ7
         Ki4CtBACR7pTxCsebCqTNjQBEV3uP/isjmR7YUkfFbwT/9r67zJmueSZWZ3OObXweGxt
         ehDNTLH3wLSzsHWCRcVyoADqqhjlGAZzH75t4aXgqouIfE4b9Jwfr2Z4eJy0kfbCz/4P
         tjfA==
X-Forwarded-Encrypted: i=1; AKwUvByTnY9FCXIxdpb5Z7fTLjyZer4ynIkQBJlR8ID5IQt83rbpxHsIjCdI0gdpWSFiFJhK4LJAFzSi59IUeQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nkYoNtU6lEHLl9PWrpq8QfyxgFcxjuib3k+NFRJ+dvR7Iw3TU2
	omBF/kDOYnJok8vyJPn69y/cM+W7S/S0Y6lc/y3G5D467P/Nw1xlPtM8
X-Gm-Gg: AYBFou3Pk+5jgd9lUr3IR0fCh1vvGEy5Jr6IX5D6H9mCM/qAb01qyMnqzclVzVDYkLk
	hIqCN0PItx9ZTfdS0bxtxdQ8d4UYIxc06JUQPPqilX6+BrCGreDUBr0B41/UZ5APxwENZxqfHkU
	Tp2xuRAggdNVAFzVoiB6Q5+5YHPrUBg3+88eJBkh46rsJO0gI3c8O8pHhfoq+9fsitYupLOsr3l
	ngF7bfhXgkS8Ky88Nl3kR//H2uSsN+Mg0qiWSFoBh1ocbhBfg+IPJ/S9bL5Ahvot+U5thz3niy2
	McXR/xMuEZWrhj9YElvSEBsGBL/04KPjP+FGlscBtoMsVEjUtUElw8bfxkNyPgyPHiCOGEKj4qa
	pBlJ1AKm3yUZvwtRyWNHHDzh6WOEOdmv1XrI0M+QDhV7F+kAJaPNOaAkZobqFKQA16cNcsKIkjQ
	Ac4+sUc55H6XOIkfbAfSqfsbj8qC8eQZxyZIgjflsuEjl4xavcPWsDTQ==
X-Received: by 2002:a05:6a00:1807:b0:869:44c3:c24b with SMTP id d2e1a72fcca58-869ad9ba9d8mr3437552b3a.0.1789049384734;
        Thu, 10 Sep 2026 07:09:44 -0700 (PDT)
Received: from localhost ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153f417f2sm8006059b3a.58.2026.09.10.07.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:09:43 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:09:37 -0400
Message-ID: <43ce274d284a4f94815ec25f5ca0604f.docular.xu@gmail.com>
From: Guodong Xu <docular.xu@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yixun Lan <dlan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v2] MAINTAINERS: add entry for SpacemiT reset controller driver
In-Reply-To: <my7qwtgrgph43hjxwmjm5hkeuxltlqjntnj5zdo7xqlrfrlffx@fp4mt7phdor4>
References: <20260603-b4-spacemit-reset-maintainers-v2-1-db0716d43a7f@gmail.com>
 <62e1781e127176294088cee9c120b3173359ec4b.camel@pengutronix.de>
 <my7qwtgrgph43hjxwmjm5hkeuxltlqjntnj5zdo7xqlrfrlffx@fp4mt7phdor4>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_070946_429954_E5410499 
X-CRM114-Status: GOOD (  11.08  )
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

Hi Philipp,

On 2026-08-07 19:51, Guodong Xu wrote:
> On 2026-06-03 09:34, Philipp Zabel wrote:
> [ ... ]
> >Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
>
> Gentle ping. All tags on this one are collected:
>
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Acked-by: Alex Elder <elder@riscstar.com>
>
> Could you take it through the reset tree when convenient?

Second ping. This is a MAINTAINERS-only change and carries your
Acked-by, plus Reviewed-by from Yixun and Acked-by from Alex.

If it is easier for you, I'd like to ask Yixun whether it could go
through the SpacemiT SoC tree instead. Unless you object, I'd suggest
we go that way if it has not been picked up by 2026-09-17.

Guodong

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
