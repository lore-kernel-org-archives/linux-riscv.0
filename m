Return-Path: <SRS0=wr6O=IR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF77C433E2
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 22:25:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 391986196E
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 22:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 391986196E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+j53uVpmKoevGfgpqhbtItlwEfyriGjgCQjQfhpL/w4=; b=dCevwd1Fp9ZoEsuDjeR2ygFyT
	Oh8uJcC4SkfwaMAMvgQe8UECPWuQMl+xjeqx5YM7+JjKViH5BnUG/5g7dvJ1eoTdx4QSNKD+wInhG
	6ZWtRXRMLeiar9+id8FqBXzPxKMc+eI0PqKZBL+bbQg4HyUiTR652cJYjnYk2Ng/ZAb+7AcN/Fz34
	IKi/f3hUGuZ03CaQI//S/LGNiOMHvEQJQCbVE+yGWhDr23FpE5v85bClq5V31S051Z/AKGwBgo+Xh
	qFpiwAg3kRtru0H4OpjEE3ZpcuhlGmXowQd8TgkIeFUDhl7PK0GNuYjJezxeK+CkX6Lp/v5S6pMut
	FP+ntZvOg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNNYs-008GHP-Jx; Fri, 19 Mar 2021 22:25:42 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNNYo-008GGn-At
 for linux-riscv@lists.infradead.org; Fri, 19 Mar 2021 22:25:40 +0000
Received: by mail-oi1-x22d.google.com with SMTP id a8so6382045oic.11
 for <linux-riscv@lists.infradead.org>; Fri, 19 Mar 2021 15:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LgipKyceb0j7HbNt9olK50Ew2nFId355eSf3DWbsDmQ=;
 b=E6/aX0SLolulg/q7LAu0QP1FMSFpvbaBMRIf9T6qOFCEjH+UH9fnjyxj+R9H4ehxd7
 fnGauzMNsDJ/02/zhevr1MYpgEI733eE6mLgZtqY2Ql/DbPadCcIF0j07YdmeV3P/rZV
 zTTO4G3AOdSIoXKUfRtV/HElHpo+zojTxAm/xLPctwjTSxqvRJxcjdXwaI38Areqw/cu
 wm7kTumtERUY6SDOZ0w4EjpxTeSMvxz3soDokNKGAqyv5GW9zGSgktKklujvR2qVtoh3
 EQR8c5lfU0zVnomy6KrhKUjthIDdi7FE5Y3bNivXflPAWQVT46zouimmBkTbRYsNtwzG
 Iusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LgipKyceb0j7HbNt9olK50Ew2nFId355eSf3DWbsDmQ=;
 b=ODOOUUiUm6/S4n/kdGtAMT2PU4PbLBgSmFTRB2BBv2udse7W1JkKcwQrL0pcljoNCD
 B9qEQwc/nHBzON9k2gC2kltPt+6RYzIos9J3XogwJxrN7dTNRGj1xG7YkHHN6DNoeUbD
 nX6R6/jrNBJjrv2m1rH0bH2MI4rOYMfdIE6eWR/OztNA4IH6p7iJnBOIGC+gHjs8/eZM
 rF9DhU/d9PgCUDrAUQa98YIvT/f+PXEHE18blO4KnVRyHpiBSkIpnEaseX4a9+JAD+m1
 wJrgFQoEOOu1muE4Rl4LKwuKilXtp2uFCvFS7kL/jchweKW9dpz07ndKfxlX926OXGzX
 gM9w==
X-Gm-Message-State: AOAM5310bGVbNvFA8TJ8REUG+ec1uRpgmB96hb+MGtHssQ0wD2Ufsjha
 PTFPA6QNn4iWQWn4AwdX8HgGn49scQdZXyMZqdE=
X-Google-Smtp-Source: ABdhPJx0vrAXgauF/H5vmgAfB1ALItNG5X+bPhGv5vZ7jCmD3Gv2pIN4yWiGQReurrOVrA8yNX8JUV3Y+jlC0y53t48=
X-Received: by 2002:aca:a9d8:: with SMTP id s207mr2570191oie.18.1616192735280; 
 Fri, 19 Mar 2021 15:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <87tupl30kl.fsf@igel.home>
 <04a7e801-9a55-c926-34ad-3a7665077a4e@microchip.com>
 <87o8fhoieu.fsf@igel.home>
 <CALecT5gY1GK774TXyM+zA3J9Q8O90UKMs3bvRk13yg9_+cFO3Q@mail.gmail.com>
 <87h7l77cgn.fsf@igel.home>
In-Reply-To: <87h7l77cgn.fsf@igel.home>
From: Yixun Lan <yixun.lan@gmail.com>
Date: Sat, 20 Mar 2021 06:25:24 +0800
Message-ID: <CALecT5jFGr+QtEWgD3M5JCH0d7O6N7PokaNbQaisyxgEU6fx=Q@mail.gmail.com>
Subject: Re: macb broken on HiFive Unleashed
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Claudiu.Beznea@microchip.com, 
 linux-riscv <linux-riscv@lists.infradead.org>, ckeepax@opensource.cirrus.com, 
 andrew@lunn.ch, w@1wt.eu, Nicolas.Ferre@microchip.com, 
 Daniel Palmer <daniel@0x0f.com>, alexandre.belloni@bootlin.com,
 pthombar@cadence.com, netdev@vger.kernel.org, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_222538_508301_D7A9A378 
X-CRM114-Status: UNSURE (   6.34  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SEkgQW5kcmVhcywgWm9uZzoKCk9uIEZyaSwgTWFyIDE5LCAyMDIxIGF0IDQ6NTEgUE0gQW5kcmVh
cyBTY2h3YWIgPHNjaHdhYkBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4KPiBPbiBNw6RyIDE5IDIw
MjEsIFlpeHVuIExhbiB3cm90ZToKPgo+ID4gd2hhdCdzIHRoZSBleGFjdCByb290IGNhdXNlPyBh
bmQgYW55IHNvbHV0aW9uPwo+Cj4gVHJ5IHJldmVydGluZyB0aGUgZml2ZSBjb21taXRzIHN0YXJ0
aW5nIHdpdGgKPiA3MzIzNzRhMGI0NDBkOWE3OWM4NDEyZjMxOGEyNWNkMzdiYTZmNGUyLgo+Ckkg
Y29uZmlybSByZXZlcnRpbmcgdGhvc2UgZml2ZSBwYXRjaGVzIG1ha2UgdGhlIGV0aGVybmV0IHdv
cmsgYWdhaW4KdGVzdGVkIHdpdGgga2VybmVsIHZlcnNpb24gNS4xMS43CgpZaXh1biBMYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
