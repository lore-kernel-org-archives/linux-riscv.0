Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E87CD6E5D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 21:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQThfNUuy4x9fNDWE39b4v9tjHsvhFYKwuO52GEMK0I=; b=0mq46YIpxlGL8+
	SvzA4DbshJhzuscAeaNVYhMt9qnp8WEDdlmmjCPyBVxWv00Bd3kt2o77NNTtcav8dEkSC9TA5yQX2
	WkqLXf7rCGRXEjjvYZR48QwPVYbuU3PUYiniocJTqGk+ztkxOVmYb38vqaxWxEMASZGwg+ZbcpSGh
	i7L9Z7DU3PPBwQ/Sa15VBKck/d9N/BwWhTYaCg1Rl0Lg7fByw7AVINZAF1NTfTjLhK4zxxUawM/Ex
	dwQjKjUitA7GTGPPJoBcv8JIgBsD08i+q/KgESC6w5EI6I1NeSrNi10EBylg7I1z8tAFDU0uEjJu3
	FrZcNhCUqn7U1JA7A9bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWt7-0000000DqMy-3MkU;
	Tue, 02 Jun 2026 21:43:05 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWt5-0000000DqMD-3AV9
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 21:43:05 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7e61e251966so5366427a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 14:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780436582; cv=none;
        d=google.com; s=arc-20240605;
        b=cpXBgJKHCD1AbN6W4NH+PgyqslW/nenVojODmagjkXdKEnWhYOXn5V9zJTH1mHpuoB
         Qdoh437qCA35TbG8JsTgy1Pgi3OZvdGojoPP+tjWeUW9dUK1c02Fzy3sQ8Mv/ezO6aq+
         XXkVzeeCMz4Z1tE7tPoSr6bACTbBcEwQKpFPBNq8w4ls7thJurvNZGxMqW0kttsc0hDH
         1brsOHOcf852UaqvazQCRVEZv+APYaXJ0HYQCo2VMcYQ1LqnTrrmIQmwUAaeZleL9+PL
         rEEG0STJUDz6qhpokHxCn44E6gMi+qCNstoYMoiEuqVxlcBDEqnOpDdVvJYGSiqz/f9j
         II9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t4tKC8tTqtar0OSd/aKDG59lS9LLkPQiuXg2Vsq3cJY=;
        fh=u1IxgJfG5GpkZWHKn4Jynwx9CMTSdz+b/WYrr7JsKok=;
        b=e1v/BIKWdqThUNhYaP0y74J94ljOAIXuJ5MAGapufuO7MCgSwaxzFySbFCQppWYRp6
         IUokJAnANE0B3rxepiZpXz4lK4SzeksGPxMI4B+DmCGe9bc45KsQK9sNlQ0pC8R4RoAe
         8qJWQWMPsi2uPaBu4T7vLxOWH8t+wtYzMC/7SBuD6tA5r1fgZlEiNcHHAXbqRai3l1G/
         3JwBWmITH0B3RcnuBfqN+7hh9qsH6/RSyafbSFiyuffBqquWv/cwO7ElRCteLnzot6wK
         nUBabuG7bw/P41OzVZq9dN5kUAaC4X+c9pYSv/M1EK3AlWThE69bTmG0QKuL+wUzWAQb
         tu7g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780436582; x=1781041382; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t4tKC8tTqtar0OSd/aKDG59lS9LLkPQiuXg2Vsq3cJY=;
        b=Q4bVDnpUDzxy4j0dV76IlhgWlDVWqRXs6V42o/jCda4l7UIBm6TLR+SXkl+qO6EY6h
         mcO2JcbAnLHTZ04jofyrFyDt5xIHe+REVHwvOt3gbwY9ZdrhPz1sZgFFxaGSG24splJJ
         Rz34pIBwL1zsfx7mKMJOGajStmZzWcBHReoZxjNbX3Rg7KS9Ju//TFgVpSUtHeA4zVFv
         gRS22pbZRtLUScecLUz2EGLsFXMgK4ni9Ko/BgY9ZbDIdYM/9n8RaVks/DlmqS6oiWi+
         3CrcPp24vDbmhHapgIVIjGGrIJyJkP3WVfv08fInSN8EWVvIQmdAC0wKHBSxOUKfxzLX
         A02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780436582; x=1781041382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4tKC8tTqtar0OSd/aKDG59lS9LLkPQiuXg2Vsq3cJY=;
        b=PZVD2KVWpIVOAUGZw2bKCrJv1VaampUUbAXrj4JHWcLWTK/2GvqrBgiG7EqAABewQ/
         GtUptGTn9FkkqcWsej/k0hcHDlM3fGaOlUbk6p6nkqdJFFNAkT4Av9f2pVb1fy0Vlqq/
         mxz4CLmdtINTxtZ8d0KgfFR16Ic2iOVUdKOHNEbq3RUslonUCJsFszfgcWeWDe6Es3by
         tXgMork21iZh9JvBoKPoxdWKztl/LARzHJbuvzzc11AGyWadwuuHuEot2mV8yiHMGGCQ
         4RPcBYm48SjbmY6uxD4AQ+44W7Ttueq2aYw4h2FbPYM1Gms9dom138sswNE2nx+tj3ib
         TkLA==
X-Forwarded-Encrypted: i=1; AFNElJ8PwLPMCcgTza/o/h3HmjS8ti/HEN+NjYtu6bUzzMCPfaKjv+pxbvtRylVDjcrJS7npnoyEz43XgsHXCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8Dxv3mWu8eScYtbBt4PxZ6VM9m25IZgOEl5CPSCfEaQmEea9r
	tS3DPxF0C+mFiE+q3jeX5rDcjjSnUxhvg277iR3Jkt+6yk438xPdTWX+qxtYzwufl9E8fucSOjc
	4V9DWrfHyvsQ/i/vKG28nq7wvYBagabk=
X-Gm-Gg: Acq92OG0zyxWixnu1rQzdUjigvcwHGli/h/nepMqIOeNVXLVb+4ypWIBtq1huDlWifT
	1vRO+/MltE3n+w9l4Mmi8giGy7QI1SxpgFXsaLfG9qECksZZd9E8CXfkLbD52s6QqKiV1PNGCXd
	05e9dwBOzHOil0Jy85gwTubkN6GYsYr6Bh3wAOzYdVPi6/Up5xVgfqMwWTDSfdSg06vsChgCGpE
	+n4XFxm0wXkm1fmH9sg2sI72rmLkPoku1A2ZWGbei3kjDyXamoYiZoqgjL5hPzMWC0wBjGZexwA
	fbfkRdGJhKKd6ybxbP9dwoA=
X-Received: by 2002:a05:6820:2082:b0:69d:a224:6ee7 with SMTP id
 006d021491bc7-69e480f3a64mr536219eaf.54.1780436582388; Tue, 02 Jun 2026
 14:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260601-b4-spacemit-reset-maintainers-v1-1-1ab3014e9a35@gmail.com>
 <20260602061734-GKD3815935@kernel.org>
In-Reply-To: <20260602061734-GKD3815935@kernel.org>
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 3 Jun 2026 05:42:51 +0800
X-Gm-Features: AVHnY4LQ6lzq__rT7CAOcTBxcODK3EXVz8CNbmDQAi0qqWOKUZdVQOQ0Up1QUNk
Message-ID: <CA+Ck9FZH=b8yc=d=s3n5k7dO5keZDQBxOJVc+ms4A8e_rVDDNw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add entry for SpacemiT reset controller driver
To: Yixun Lan <dlan@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Philipp Zabel <p.zabel@pengutronix.de>, Alex Elder <elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_144303_802645_7670DE5D 
X-CRM114-Status: GOOD (  12.60  )
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

Hi, Yixun

Thanks for the review.

> entry, the whole point of adding a didicated entry means someone
> willing to put effort in future maintenance, to help review/refactor/fix
> you can emphasis on this, and I just want to make sure we algined on

Right, that's the part I should have made explicit. I do plan to keep
maintaining drivers/reset/spacemit/, K1 and K3 now, K5 and K7 as they
land. I'll keep up with review and fixes, and reword the commit message
to say that.

> done), I'd personally prefer not puting them into commit message, but put
> them below "---" as background introduction if you still want..

Sure, will move that below '---'.

>
> > [1] https://lore.kernel.org/spacemit/20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com/
> for the convention, suggest to use more formal format like
> Link: https://.. [1]
>
> >
> also no blank line above
>

Agree, will do.

> and I'd still sugest to add spacemit mailing list explicitly

I will add that line:
L: spacemit@lists.linux.dev

I'll send v2 with these.

Thank you.
Guodong Xu

>
> --
> Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
