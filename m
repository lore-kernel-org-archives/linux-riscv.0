Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD07C54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 16:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aMor5R9gDgRooIlX6IwvI2rYVUMmOpnZGvM6p3yvxRM=; b=qPs4IIgX/graC8
	FN9Bn+s7SCtPrO/WWCRp7D2v5DeTTYkARyCidmsyVPawPJnSGl5ZSfOk1+qNnPZz3XNnpsU1ZHVke
	1WXs7jeVZZ0fB+5kPD/Ebwhx6VIYnzM0iHk+PGHM7U0+q2FkRCJgAp5Wq48PGdHTIHdO/o5NyFlPT
	gFPcAy3HWWazokT+ST6o83/zrFm/jC+XjtjZ5Jw9CUKzVzP0IXVN/DEx34KRThYSwm/5gRmvo87h6
	/EdvJbBCkasdZGPNMV8LVyLFzCsjEswDsKrBDAycHacUBYaRxyueZMSNcKc3oURkUqx+NzAbzTpXs
	KMP5gM8OGwx8BXKAgAbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWKNW-005mgo-9v; Thu, 08 Sep 2022 16:27:46 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWKNT-005mbZ-IN
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 16:27:45 +0000
Received: by mail-lf1-x132.google.com with SMTP id bt10so28640563lfb.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 09:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=3t8eO6TrPLunxm/ZNbaRq3mczu/6c1Oc/NxBX2KRXH4=;
        b=GWgpBm78RlMWnyJ/irGaYihsJ3mDOF7/rXdbZg9UgWza5qlyN091Z5QcURInV65b23
         ZUKVKjG5xLepFcfIyJFbg/DHl9Kc5yGwFvdrPoZWcEULbYGDIhYudGrTPJTr+bkQcS2C
         uLTv1oDWmL5sVhFGWFNaaVNh9Mte4K9U1ejmzfXviDqiQHhDqsq3ztD6u3qY0lpz7qlu
         CTR/CFQSNVnxrsTtEo99gdMJc/JDyM9pG+aJuKJjB4+pNgTX5aSyvW+6pQSpbZ7I6Q/w
         n8vYHlqvhI/nID5aVJzAnKqCrO3Fr8Sof/cp3cRjSFSMNykmpuxN1yn4VaQxVbqBHrEf
         iciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=3t8eO6TrPLunxm/ZNbaRq3mczu/6c1Oc/NxBX2KRXH4=;
        b=SyvTmW3N8ksDZv5meBSmccWdWm3EfnskPwHzZDMs9huIMup/FNs1GiV2jUoUAW0dop
         wulwpFh8rPExi8dOGVY0vtw5F97nB+6q6tZk97/qgI28ie2C8pFcc5B3kMz1VqF91A2V
         c4hhFD0NnLo1k7hSxkybv5Q98t9fIr7v8l7K6/2Lddsb0Vi0c+Pk71DKly+9lI1aFgTe
         2OVlLfOVdjBUSpQLprnfKc8K/UCk+zxQZnNLyOhbztzEm29K/GZqMivER6s9P/I5Czty
         89KQ7NTxldfaFnoFEAToltC7HXRWCYL7eRxU0Hbe5sM2k99xTUgB468hq2lL1p4wrKXQ
         /Yjg==
X-Gm-Message-State: ACgBeo2S6k3YOktcMsGZ16XFJrvXv3Je+7ircD8GXq+zb7UucGbYSsoL
	QWNyXBNyli3Uclg/NyWlqOGZsMjmrUrR7C7LSK4sMA==
X-Google-Smtp-Source: AA6agR7omRywjZirRBmZDGvfii9XD988RyhNFhSLDgoOFrn+8Ukwt/2iyM7jz70fct6R5sFzcdS5W2JieqWpVwy+VZI=
X-Received: by 2002:a05:6512:401d:b0:496:9971:78c5 with SMTP id
 br29-20020a056512401d00b00496997178c5mr2814007lfb.337.1662654460667; Thu, 08
 Sep 2022 09:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220908144424.4232-1-zong.li@sifive.com> <e56b67a3-4721-638b-a3d6-54e4d407598d@sifive.com>
In-Reply-To: <e56b67a3-4721-638b-a3d6-54e4d407598d@sifive.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 9 Sep 2022 00:27:30 +0800
Message-ID: <CANXhq0qAsYTeU8sLYUiAXq5by35RcURMihYb6DLv6okjS3YZow@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Use composable cache instead of L2 cache
To: Ben Dooks <ben.dooks@sifive.com>
Cc: Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Greentime Hu <greentime.hu@sifive.com>, 
	Conor Dooley <conor.dooley@microchip.com>, bp@alien8.de, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-edac@vger.kernel.org, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_092743_674784_EA059A47 
X-CRM114-Status: GOOD (  22.05  )
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

On Thu, Sep 8, 2022 at 10:51 PM Ben Dooks <ben.dooks@sifive.com> wrote:
>
> On 08/09/2022 15:44, Zong Li wrote:
> > Since composable cache may be L3 cache if private L2 cache exists, we
> > should use its original name "composable cache" to prevent confusion.
> >
> > This patchset contains the modification which is related to ccache, such
> > as DT binding and EDAC driver.
> >
> > The DT binding is based on top of Conor's patch, it has got ready for
> > merging, and it looks that it would be taken into the next few 6.0-rc
> > version. If there is any change, the next version of this series will be
> > posted as well.
> > https://lore.kernel.org/linux-riscv/20220825180417.1259360-2-mail@conchuod.ie/
>
> Is there a change log for the v2..v3 versions of this patch series?
>

Sorry for missing that.

Change log in v3:
 - Merged the EDAC patch into L2 rename patch
 - Define the macro for register shift and refine the relative code
 - Fix some indent issues

Change log in v2:
 - Separate the rename and diff to different patches
 - Rebase the dt-bindings based on Conor's modification
 - Include the patches of Ben for refinement of printing message

> > Ben Dooks (2):
> >    soc: sifive: ccache: reduce printing on init
> >    soc: sifive: ccache: use pr_fmt() to remove CCACHE: prefixes
> >
> > Zong Li (4):
> >    dt-bindings: sifive-ccache: change Sifive L2 cache to Composable cache
> >    soc: sifive: ccache: rename SiFive L2 cache to Composable cache.
> >    soc: sifive: ccache: determine the cache level from dts
> >    soc: sifive: ccache: define the macro for the register shifts
> >
> >   ...five-l2-cache.yaml => sifive,ccache0.yaml} |  28 ++-
> >   drivers/edac/Kconfig                          |   2 +-
> >   drivers/edac/sifive_edac.c                    |  12 +-
> >   drivers/soc/sifive/Kconfig                    |   6 +-
> >   drivers/soc/sifive/Makefile                   |   2 +-
> >   .../{sifive_l2_cache.c => sifive_ccache.c}    | 200 ++++++++++--------
> >   .../{sifive_l2_cache.h => sifive_ccache.h}    |  16 +-
> >   7 files changed, 151 insertions(+), 115 deletions(-)
> >   rename Documentation/devicetree/bindings/riscv/{sifive-l2-cache.yaml => sifive,ccache0.yaml} (83%)
> >   rename drivers/soc/sifive/{sifive_l2_cache.c => sifive_ccache.c} (31%)
> >   rename include/soc/sifive/{sifive_l2_cache.h => sifive_ccache.h} (12%)
> >
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
