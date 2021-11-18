Return-Path: <SRS0=Kh2H=QF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D9EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 00:34:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E77BC61078
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 00:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E77BC61078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+d8pf+R2dCDI+qr7zlGinbz/O6jBLEqHrsdGzBRCgOY=; b=ki1eXNWtPuBGjv
	O75wv/yQwGcMEZ9+2pvag9TfVi7dz/B/CHgu7jsAxiDQ2eEbbuY/hG7u7p1r0nurG0oufYrL1PTgg
	yrmBja6lULcwvS0V/eb9+ymNb5+yrb0ABWi/JtwM1OjD7soVD+tneOIf6Fhcppusaq2c42HWZw10F
	TO4nYtLmsDmU6uZPQYpulge2/AVniO83SXmJbv9/iSdzBK9I4l/m7MSM/3fC+grDtfnA3S6z45psM
	D4aDLsJwSUsEE8oaIRGSkor22+c7impkCj2JsTe84/+5qXLBfDQUjkCccU08cCbPam1YTadEEj1k9
	7Cn3cU2o5Wprrt53Kplg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnVNh-006dyV-4q; Thu, 18 Nov 2021 00:34:25 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnVNe-006dxy-HL
 for linux-riscv@lists.infradead.org; Thu, 18 Nov 2021 00:34:24 +0000
Received: by mail-pg1-x52e.google.com with SMTP id p17so3743995pgj.2
 for <linux-riscv@lists.infradead.org>; Wed, 17 Nov 2021 16:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1jZNtYupjDyRzj/OP9VMy9ZZOqtGQ1DuQYj3eJHdRhg=;
 b=S60j/kMrd3JzCK5gaccWBjkfG1JObTx3uBqcEh/Vg8AXySg+8rnQsBYuHZHUbAvlb0
 OhCDCZ/+fOw2jVpjSFFgTi5qAHPiwxwMeBfsN6zdbb9ciPSauGM62yDUZmPdF5G+F5nR
 n2gxbAx+B7wydPG5aZoJevWhD7b35vHdaQhc8fErrbdQiz3UQQleOVHB68tETnJNgZH3
 TBg/gNO2olctGJYxWslozAxssJ+1Qo4ZfpobXwaxbv3+T9/P3CM8Tx7Lp9hooDRoYvqQ
 6xeoyBnSamx6Y3SjU6KKQpk3sbf7fNU6pkMOqDmmnPkrC0OEYiY0u4LOIOls9pInWdua
 cF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1jZNtYupjDyRzj/OP9VMy9ZZOqtGQ1DuQYj3eJHdRhg=;
 b=D99mN3JKzLEMA6kNxUhzWaQYQTnO7y/OQe81bL7Zf5mV5BzAotTUr0TtOKjxuqY1a6
 42RZGBDX9z/baxbrrH7WmfKonBHn+hzZ48vaLgmcPsTOvUeg8GxD0/wwIQSI3SXfHuJB
 qCGY5v7NG8yWT5OxZ1TJJVPCKu8dX9jGcT+x3PegsOxjRpTMAFuiS4tWOK/H+AakKoGq
 HWlbd6OHm5yEMLX1HAKo3YbSWW14ug/nE1MCXT+EH7CyNuPT2SrX8mdomLJj/4LnqP/X
 ZY5AEveJripiH5upkBllYIkdDu1zeHh6u2kqGrMAfemOPAOHqhuqYsj663AwnQOpaeht
 2DkA==
X-Gm-Message-State: AOAM531lDbyGnQzn7a7YwwLAjP6Eg6jEyDEWgATcwViC2zA0cz9shjiX
 w84No2ubtsorTdqsJyZkVOU=
X-Google-Smtp-Source: ABdhPJx6X9YDfRHx6Yw5QdMFyy6Of4A5872CH3bPuN+uuxoN/VV1d8hdIGL4OAI3cgpyNIkW7CkTbA==
X-Received: by 2002:aa7:8dc6:0:b0:49f:c66e:2d55 with SMTP id
 j6-20020aa78dc6000000b0049fc66e2d55mr11121671pfr.81.1637195660976; 
 Wed, 17 Nov 2021 16:34:20 -0800 (PST)
Received: from localhost.lan (p4899162-ipngn25301marunouchi.tokyo.ocn.ne.jp.
 [122.18.9.162])
 by smtp.gmail.com with ESMTPSA id mm22sm711166pjb.28.2021.11.17.16.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 16:34:20 -0800 (PST)
Received: from localhost (localhost [IPv6:::1])
 by localhost.lan (Postfix) with ESMTPSA id 5D156900922;
 Thu, 18 Nov 2021 00:34:18 +0000 (GMT)
Date: Thu, 18 Nov 2021 00:34:18 +0000
From: Vincent Pelletier <plr.vincent@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Qiu Wenbo <qiuwenbo@kylinos.com.cn>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, David Abdurachmanov
 <david.abdurachmanov@sifive.com>
Subject: Re: [PATCH v2 1/6] riscv: dts: sifive unmatched: Name gpio lines
Message-ID: <20211118003418.2edd1913@gmail.com>
In-Reply-To: <1444ff08-24a6-afbe-1512-9ea24ad5b32d@canonical.com>
References: <bb7e8e36425a2c243cfbf03a23af525499268822.1637107062.git.plr.vincent@gmail.com>
 <1444ff08-24a6-afbe-1512-9ea24ad5b32d@canonical.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_163422_649999_F4612FB0 
X-CRM114-Status: GOOD (  17.75  )
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

On Wed, 17 Nov 2021 10:28:59 +0100, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
> On 17/11/2021 00:57, Vincent Pelletier wrote:
> > Follow the pin descriptions given in the version 3 of the board schematics.
> > 
> > Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
> > 
> > --
> > Changes since v1:
> > - Remove trailing "." on subject line.
> > ---  
> 
> This is not a correct changelog placement - you have to use '---' just
> like git uses it. Just test it yourself and you will see the problem.

Indeed, thanks for catching this.

Is there a recommended way for managing these not-for-commit-message
chunks automatically ?
I obviously compose them by hand so far, and put them in my local git
working copy commit messages, but I would be happier if I did not have
to make (bad) decisions on such mechanical detail.

On a related topic, is there a way to automate "git send-email"
recipient list using get_maintainer.pl (plus some more magic lines,
for example to exclude bouncing addresses) ?

While process/submitting-patches.rst describes what the result should
look like, it feels to me that it (or another related file) could be
more directive on what commands/workflows help to get such result, for
casual contributors like myself. Have I missed such documentation ?

Regards,
-- 
Vincent Pelletier
GPG fingerprint 983A E8B7 3B91 1598 7A92 3845 CAC9 3691 4257 B0C1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
