Return-Path: <SRS0=6USs=L4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C006CC07E95
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jul 2021 12:13:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64E05613DD
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jul 2021 12:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64E05613DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FwmNdkcPpHXpC37W48uE4kq3EYIuZ+t7c/uM5zOaqpU=; b=wkokHMfgW2QzBB
	1NZCtyV9kysbw4J3GqzBunV2K3+qKCNne8iYIP+vMfoRTZVEUTGn6ccDkXtV+Kh96sPtOHslLYqb3
	8TFa6BjP58OXGMWDpIS/ov9oaZloR1QcS3CnlSVeI+hn3Ot7zjjY8zbseY/zdg2p7hWDKBZltRXy6
	75AS5GmBBYJdzeBV3qhUbAIeczLMxHToSaGgRNuVeO9DYtUrcduEJDufHEjF6/tmxvvykvePctDkc
	FxV9WyQLuMpPy3KePpXV4zdx7aYepSUpg65Dp7+W/ALR+LMWdt5wodcM1q4w5rsySR15z5bk/ixco
	nixt1CE3a0ChTI9CpPrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m00zm-006FKu-4q; Sun, 04 Jul 2021 12:13:10 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m00zj-006FKa-EP
 for linux-riscv@lists.infradead.org; Sun, 04 Jul 2021 12:13:09 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso9616828pjp.2
 for <linux-riscv@lists.infradead.org>; Sun, 04 Jul 2021 05:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=92ZUxIMc/a+sgPoJXMf03RmpGzSjEXisEf6oVvhUPro=;
 b=aViAY0shpwty7yzBDwfeMt/XUZAxWgvjF25Jzbnr6zVuLaG63YgWRO9zWT2frVnlR/
 mo7UISYr98cIsbpTfgek4uXlXwGBWnsQJnr24PuIaKWC6TtWVzCxHEEA4kXnIFrdvgtS
 QVOscW1xxof6rs7l5a2XmSMhaA86ovS623dj+PBOMJhlgyzpB6v4aooJOkVHiJpRD04q
 +VVALDMFCMRm+F3ufL1fhS/gF1+MfzMwJAJRdd3+cpV6uWqRcfUqt5evUvfs+6lYjsoc
 W5AJDfWHo80UAIKS1neXGomKoR/WVblG+u6gelJp+F4H7wgVFvhMH4RTfZIB3vGjC/dc
 lG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=92ZUxIMc/a+sgPoJXMf03RmpGzSjEXisEf6oVvhUPro=;
 b=IWiz5Yum0gFwJFsCEejVFCSXpJ9/xWIAskgbXFyW8uSGRBNbeokyRouGEsYBYuD8H/
 qf6sZRxbN0SA5M0H41w+dzQoIHhNMz4G6INLucRXH5cO0E3AweaSqypUmbknwXll/7/V
 NGICb4r+cTtfdhAEu8v31tVD6wzr4syLGer8bdF1lMzmCPe7J3pA7CCUptR+9uBbga3C
 KNZMkm8AiMi/wA1oR7HMlWgt8e4JTRdXHwBAFGxw9o9KvNNpIEZNSed5gewVpXodxUMs
 f8ws/oijSxxeMUg2MmmHbB8pS1b3AYxsd82Ak8d2WNifsT6GPz63otBQVvBkF0dQqKJG
 PDww==
X-Gm-Message-State: AOAM533Uh67aMmorgrYfiedEk/U+t2PEa1A5Ewj0K+qBE6fZC37B1q7J
 Xhz129YMhl/oK/92BmCHOTEbH7RBZ0/dfVS2
X-Google-Smtp-Source: ABdhPJy2PNZX3FwAjLBcBHa4eUiHfKkgk+OGsXurMBtP9l9oAYV3/aTof84XJ7+UHDOeDx1b3allpQ==
X-Received: by 2002:a17:90a:a798:: with SMTP id
 f24mr9560449pjq.8.1625400785930; 
 Sun, 04 Jul 2021 05:13:05 -0700 (PDT)
Received: from localhost.lan ([2400:4070:175b:7500::7a7])
 by smtp.gmail.com with ESMTPSA id d6sm10202889pgq.88.2021.07.04.05.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 05:13:05 -0700 (PDT)
Received: from localhost (localhost [IPv6:::1])
 by localhost.lan (Postfix) with ESMTPSA id B33679011C3;
 Sun,  4 Jul 2021 12:13:02 +0000 (GMT)
Date: Sun, 4 Jul 2021 12:13:02 +0000
From: Vincent Pelletier <plr.vincent@gmail.com>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: dts: fix memory size for the SiFive HiFive
 Unmatched
Message-ID: <20210704121302.3aa8eedf@gmail.com>
In-Reply-To: <87eece7838.fsf@linux-m68k.org>
References: <20210704083441.256097-1-qiuwenbo@kylinos.com.cn>
 <87eece7838.fsf@linux-m68k.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_051307_561328_4D12EEC5 
X-CRM114-Status: GOOD (  22.01  )
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

On Sun, 04 Jul 2021 11:15:55 +0200, Andreas Schwab <schwab@linux-m68k.org> wrote:
> On Jul 04 2021, Qiu Wenbo wrote:
> 
> > The production version of HiFive Unmatched have 16GB memory.
> >
> > Signed-off-by: Qiu Wenbo <qiuwenbo@kylinos.com.cn>
> > ---
> >  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > index b1c3c596578f..2e4ea84f27e7 100644
> > --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > @@ -24,7 +24,7 @@ cpus {
> >  
> >  	memory@80000000 {
> >  		device_type = "memory";
> > -		reg = <0x0 0x80000000 0x2 0x00000000>;
> > +		reg = <0x0 0x80000000 0x4 0x00000000>;
> >  	};
> >  
> >  	soc {  
> 
> https://github.com/sifive/meta-sifive/blob/2021.06/recipes-kernel/linux/files/0003-riscv-sifive-unmatched-update-for-16GB-rev3.patch
> contains more changes.

Here is what I learned on this topic while poking at the regulator part
of this devicetree:

While these extra changes match the board's schematics, they are
rejected by the da9063-regulator driver:
- some channels are merged on the board, but the devicetree does not
  show that: they have different names, with different maximum current.
  The updated values exceed the single-channel maximum, so the driver
  rejects them.
- 3 of the regulators are further configurable in overdrive mode on the
  board, allowing higher maximum current, but the driver does not
  handle this.
  Similarly to previous point, the updated values exceed the
  non-overdrive maximum, so the driver rejects them.
  I've submitted a tentative fix, but its logic is backwards: it
  detects the overdrive bits and increases the maximums, whereas it
  should see the higher maximums and as a reaction enable the overdrive
  bits
- also, some voltages fall in-between possible values, which causes the
  driver to reject as well (ex: vdd_bperi is at 1.05V, but the chip can
  either do 1.04 or 1.06)
- ...and likewise for some current values (ex: vdd_bpro is at 2.5A, but
  the chip can only detect 2.4 or 2.6)

So from a pure system behaviour perspective, these extra changes should
not matter either way (at least in my understanding). At least not with
the driver in its current state.

OTOH:
- the changes missing here are more correct than current master
- not including them will probably make meta-sifive maintainer's life a
  bit more difficult
-- 
Vincent Pelletier
GPG fingerprint 983A E8B7 3B91 1598 7A92 3845 CAC9 3691 4257 B0C1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
