Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B3FC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 02:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bzn3jAQ4SaDz6qu3x7eFmEkZi8/4n+V60+CDrgfojb0=; b=Ew5xJEpTPKlFLP
	JVkVcXziMBgumJqqKkksJ5xcgu8vVO4Z8EsdyfxtI9eALzWRtJYQuWf89dzr/gS2DghIYQ1tJx6Cj
	765IJdAw6qViwx5OCZUHL/e6poRjlLOQd1WvYnHTbRvvkZvvXMk1HsSpQ+4szRAT1ToKkdi51f/s1
	HUsnYKrPbZ3KARj8/LqGSRbTQXpeEsqo8BWxvQjIcYx8dznbux5PJE8pTktfjc588sQBxQGngEl8C
	IxJ4ZeSmL0bqzDgdY9wSqoH3rJAizC0YwifZ1kjEpGLwioUhgaPgfUCjh4kcoiqWjkv8e5Phd7i9g
	+uXDY5+Y569vAld+LWPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndkA2-006KnO-AX; Mon, 11 Apr 2022 02:52:14 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndk9z-006KmW-HI
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 02:52:13 +0000
Received: by mail-lj1-x229.google.com with SMTP id bn33so18415663ljb.6
 for <linux-riscv@lists.infradead.org>; Sun, 10 Apr 2022 19:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oKaNytCrnwRly85Cf4rMP6kv73OcecChjT7UHRYi0pY=;
 b=foU1Pomdt1fSDC1+Vo7+ND9Fu80KDnPA26WJ6965htPY3McsZwzjuN5iS1aJSmS/2e
 c0bzdfE1d1aeur800axp47kax1MwU/ItdIQ48aO+x7f6q14qTO7FouaXMUew5eR39Qjz
 wxT0pL0KlELChxAByT+Cy8RYGO66VavKzSZonGJg5yLbMduZp/sntcIf5zDmhHXzCPLM
 IpcVenUyQ/9RAaYt4B2RIiL5Ssz0dcqz+b92GuO6CmPFyu6Y7BpBEUObsG/K1lEwKhVc
 2cOuKb0CePD1Jnm1oeR0BJQZv5ClNsw58kaSgkK7JuDUfqsfqDXeCcOoudlg7zsmKHql
 c6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oKaNytCrnwRly85Cf4rMP6kv73OcecChjT7UHRYi0pY=;
 b=yphaGp0r+ySIYT1FuCZBcgc/BKWvZayIAFikKZVVyUA+v5X2MkVSTnin+dM9NtJZZk
 51zr3ZQW5BdOI9ybTqOkqlTOqNaxS2xDdxDxg/mr25A1Z0TeMF7h92W4v4cWXwWEG4z3
 1Kfbwq1IGY4eUsnBS7fsQBSoSGXwmVYfbB+4WmTo3M7V1sGNv9qjF1ml3ilyzxNP8NYn
 sgKkBiElY1PvrFREwtyq/FR+pH5yxvskU2sAIZSfy6f+Cd9TnZRGaOye98l02yqftphb
 EiV1/CA9jPQ769rfKM+S+u1g1mUKZDw8ZZiWJOhuGhVx6WipHCWiE9jUn3vmyP07/2cW
 QWPw==
X-Gm-Message-State: AOAM531pBLNwdkId3JPtkrMpFUYOgmWuhb+cMFPzOdkcjhVRPFe+8065
 ASv9q5JOgC1yplSNMy7fflEowxBfcHnhPB3cu5wIwQ==
X-Google-Smtp-Source: ABdhPJze/vdOb2Ppa73SdqfmkL8HEWn9w36G2tkOYs4HJBUnTuZaOZgaU3/KS+dpOWgdaEdvtAFQmU/3GlJ89pUlBI0=
X-Received: by 2002:a05:651c:544:b0:249:9db6:2472 with SMTP id
 q4-20020a05651c054400b002499db62472mr19462133ljp.516.1649645528693; Sun, 10
 Apr 2022 19:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1648461096.git.zong.li@sifive.com> <YlA1DwdIMoQ1dXZS@matsya>
In-Reply-To: <YlA1DwdIMoQ1dXZS@matsya>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 11 Apr 2022 10:51:56 +0800
Message-ID: <CANXhq0ramPvr=CL2oPsPAnWiF9X0eYVt8HGAVWPE9mZ5PfhG7A@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] Determine the number of DMA channels by
 'dma-channels' property
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Bin Meng <bin.meng@windriver.com>, Green Wan <green.wan@sifive.com>, 
 dmaengine <dmaengine@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_195211_648244_18C6B9DE 
X-CRM114-Status: GOOD (  11.27  )
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

On Fri, Apr 8, 2022 at 9:13 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 28-03-22, 17:52, Zong Li wrote:
> > The PDMA driver currently assumes there are four channels by default, it
> > might cause the error if there is actually less than four channels.
> > Change that by getting number of channel dynamically from device tree.
> > For backwards-compatible, it uses the default value (i.e. 4) when there
> > is no 'dma-channels' information in dts.
>
> Applied patch 1 & 4 to dmaengine-next, thanks

Hi Vinod,
Thanks for your help and review. For patch 2 and 3, does it mean that
we should go through the riscv tree?

>
> --
> ~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
