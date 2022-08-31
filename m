Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2B9ECAAD1
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Aug 2022 08:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SLzpiNMaL/rzQCA4LZ0aTsgrdWlNf2tOcZ/actZOFJ4=; b=z+O0j5Er3vOC/m
	jWkd09wCc8/Kjuma8YDlEc2YCNCn4kSuhjwG9Z7POXJGJTcQunujfW8zVwaILgiZGptWgQjzF0f8p
	X9tPaHXGAOw++amBZbI7rNRdBq39buhA5t7MCyjDtar+ArLyIp7yG7A/wQEUYSCdYk2/kZDyoXAIC
	WD+vAuJwsZ8e3Hw/aGPUcckJWuel0w4GzOFZ5jSa0zSv1h4Xz1WqrxHfHhKvUXsHL8c+hvtfzvzkO
	UcJhv2LPXxEZgV7+V3bRFcPANBh8itS1D6F9PMsn84vTyMVmLh5X/dy8Iojc6AnAEGpjr8Cx3YWjv
	I6TprnJ5b8Pp9QB5u/ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTJ5I-004wwE-Be; Wed, 31 Aug 2022 08:28:28 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTJ0R-004uYD-5V
	for linux-riscv@lists.infradead.org; Wed, 31 Aug 2022 08:23:32 +0000
Received: by mail-lf1-x131.google.com with SMTP id p16so873299lfd.6
        for <linux-riscv@lists.infradead.org>; Wed, 31 Aug 2022 01:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=K2zp9Wv42L7eKkkxe8UYiRlilcrS8JYkof7pXKJ4D9s=;
        b=OdF/JF9THdr/kxnPREDGNkd6h6ZtQwV0dlHtgVVLKG6sdsjYN1jHdM42ZJdBYuZJRf
         GB331f7n1Uai49IrHpA2DQPsq1YpdMiKfl7Df7Y0JwDhQVrL9boPAJdSD1eO+r8Qcj9c
         zE9ZsPC5r5WruxA/AEXra7vAAjdnkRYANYh1+W2HRVV0fzcyFdv38zm96rrwirJylwXg
         YcYGnJ8IjR/N+K4fwVvDq/7mZkaQecimVKPyFBKg1YL8BD/xWWkjJ14fw5rfybyUDuiq
         mABb+8uN0oJT/TLqXRgf0Svj3qR7Hah5p92bT71ePnPiyv8jqoGqwRVnM+ViVzQAlIGJ
         f81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=K2zp9Wv42L7eKkkxe8UYiRlilcrS8JYkof7pXKJ4D9s=;
        b=MnMCccVP/optZ8OiHxFVbb2vbY4AhLppi7+gUJIzHNn5Bu2q/dYD66kF4Y51pDtdqh
         3Osj6o5UTTdQY7Nj3ZVHa2Wwe3p+TzaQlO5iGc4mu4ncCEwSI4qnAE4sMoM3T/JGViMA
         /Q1uGJLOT61BohoyW2q59KV4qH7GNoitDY9qVGuT/peLrBsE7ztbtv/DpFBzjEozCoXG
         jciElSuB5AQ/hQ2Hey26tzMFikGpjNXOhXp6oAwLC+cDxom0mPRhChezpSpaQqveyIlS
         U2QNziW2JEknf7MZw3mbr5EQqsK2gRZlzbC/WYaCbxaxbtzdJW8dbofVkzsjd6ESxFgw
         yz+A==
X-Gm-Message-State: ACgBeo2P1at0hClKJ8KdWJcqWeYY7BFHOmBZ/tWmexgEaj9YpYRvIxrg
	7JQPPDu88qGaK5Gx42Mqrwq4D2P1ggeeNOjTp8gMjA==
X-Google-Smtp-Source: AA6agR6h/pDYy+tHgwAZf1tLfVmjf3aCROZaJyd3xuvEi4KwYV4H1SlYEe1bfUo4drWQJY6IY+X724hMk9q69YRHsVc=
X-Received: by 2002:a19:640a:0:b0:492:8df3:f29b with SMTP id
 y10-20020a19640a000000b004928df3f29bmr8378687lfb.306.1661934203634; Wed, 31
 Aug 2022 01:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220829062202.3287-1-zong.li@sifive.com> <a0425472-00ed-81dc-e98d-fbccc1e95575@sifive.com>
In-Reply-To: <a0425472-00ed-81dc-e98d-fbccc1e95575@sifive.com>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 31 Aug 2022 16:23:11 +0800
Message-ID: <CANXhq0rbMmARbjpijH7G_eFbQsQOb4Hsupoj-OOccrPiG8PY=w@mail.gmail.com>
Subject: Re: [PATCH 0/3] Rename sifive L2 cache to sifive CCACHE
To: Ben Dooks <ben.dooks@sifive.com>
Cc: Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Greentime Hu <greentime.hu@sifive.com>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_012327_362143_78AA4CCE 
X-CRM114-Status: GOOD (  20.28  )
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

On Tue, Aug 30, 2022 at 3:59 PM Ben Dooks <ben.dooks@sifive.com> wrote:
>
> On 29/08/2022 07:21, Zong Li wrote:
> > Since composible cache may be L3 cache if private L2 cache exists, we
> > should use its original name "composible cache" to prevent confusion.
> >
> > This patchset contains the modification which is related to ccache, such
> > as DT binding and EDAC driver.
> >
> > Greentime Hu (1):
> >    soc: sifive: l2 cache: Rename SiFive L2 cache to composible cache.
> >
> > Zong Li (2):
> >    dt-bindings: sifive-ccache: rename SiFive L2 cache to composible cache
> >    EDAC/sifive: use sifive_ccache instead of sifive_l2
> >
> >   ...ifive-l2-cache.yaml => sifive-ccache.yaml} |   6 +-
> >   drivers/edac/Kconfig                          |   2 +-
> >   drivers/edac/sifive_edac.c                    |  12 +-
> >   drivers/soc/sifive/Kconfig                    |   7 +-
> >   drivers/soc/sifive/Makefile                   |   2 +-
> >   drivers/soc/sifive/sifive_ccache.c            | 221 ++++++++++++++++
> >   drivers/soc/sifive/sifive_l2_cache.c          | 237 ------------------
> >   include/soc/sifive/sifive_ccache.h            |  16 ++
> >   include/soc/sifive/sifive_l2_cache.h          |  16 --
> >   9 files changed, 253 insertions(+), 266 deletions(-)
> >   rename Documentation/devicetree/bindings/riscv/{sifive-l2-cache.yaml => sifive-ccache.yaml} (92%)
> >   create mode 100644 drivers/soc/sifive/sifive_ccache.c
> >   delete mode 100644 drivers/soc/sifive/sifive_l2_cache.c
> >   create mode 100644 include/soc/sifive/sifive_ccache.h
> >   delete mode 100644 include/soc/sifive/sifive_l2_cache.h
>
> Is this series available on a git branch anywhere, I have at least
> one other cleanup I was doing in a similar move to rename and make
> it usable as the l3 cache.
>
> I gave the series a quick review and did not find any issues so far.
>

Thanks for your review, I don't push the series to a public
repository, if you needed, I can push it to somewhere.

> --
> Ben
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
