Return-Path: <SRS0=Cc3s=UT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732A3C43613
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2019 10:24:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47A762082C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2019 10:24:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hz7xbSGM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="urK6zmBL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47A762082C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=2X0CMrMLzeNRdz7XgGzG47DBamxRxqqRLYk02I9+Se0=; b=hz7
	xbSGM5TECIRxar/NKBViCAYsuiqm/tt7iRwRValuIKptQNwc9d2eE3z22tTw4/jYlKpy6Q8NkV1yG
	JeAdP0fT+rKfOD+6YfzKsxVxWCv4FNi20ZzbXGjWULdlhcyCdRSn8WF9wAkxqFx/NkfYEkkP2cT8t
	E/6Hy+RGXF9/RPJdurZ+Gdae18q+5LB1R76V31ZnziPiNDrL4VeZOWS4uQIgzN5LnPNh3O/+uWNit
	+omtoSFbTGa4uzW6SPOSlmX80stmmGRdiUxehe2lzppAgag7XPipKGRltaLWQomZWl5uZzhG0kY+8
	+9LOFKVDzZh3kzEvaHSiGni0T0QI3sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hduFE-0003uq-35; Thu, 20 Jun 2019 10:24:40 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hduFA-0003tv-JX
 for linux-riscv@lists.infradead.org; Thu, 20 Jun 2019 10:24:37 +0000
Received: by mail-lf1-x12a.google.com with SMTP id a25so2063872lfg.2
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jun 2019 03:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=QJ8zoEdyf3GpBi6h0WbiGRKlnyJ4YVfurV/jTTE++jw=;
 b=urK6zmBL/q6VR69k7radcX4cP4zp/4dBDp9Jpx0D5MofO/MMOH0ijK1RnP26+ZepxO
 YEEcQ+hUeSBTH1LFCQyy1LyYc3CF1FMxpiJOIHDZlJFkXOymQQBPajf2s93v9ldXRmaT
 h2rXjZ6/kZkf3tC8G9MKW2tO1XgJkZKvqc3NK66sY8mhtWOiletxAYn4/gRiZTndCH3R
 c6HbPtgXEdsM4b8cwuPitub66m64aDIlHFca2LAmS3yozeyylUrWOmEM9ilC8UVVAlo5
 W1OtQQeC22O64RFxSD/tyKUOf2bLHIkcgY++6+PZ6VjPlgG0Nk36TvTwSkXME3xXGFgw
 OHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=QJ8zoEdyf3GpBi6h0WbiGRKlnyJ4YVfurV/jTTE++jw=;
 b=i8nqcy+xs8hAUzZcfG2+nrTPVT2QXKWESCqiuPPdnCEcmMT/WkOhL8OTdMnQ7RbuFD
 dS7VUv21LGglkHfXhjYivkse3rNFJ5Es4vEDpsWdeK9u0hRaqxHKDGk6YTokg4DP/dPl
 RHl1dQJ06d74+XbYdqMjP5g4r4Uvl3vsXH7AH7pntW4uubOy1qMLkni+tsgskBsy0kF+
 wtdpdU6dJwS69GhG9xl2c6JlDD8S3i5lcZWy/ZeUyN1ukAAOV+ZvdXXZepam3jObGIwp
 2nrqV9a3GFjTMRfNLfjPJcwJ7L2oLaV5XOFWXfOgS71aaGPHcbOXmRMRDHdTr+1wX02l
 qzPA==
X-Gm-Message-State: APjAAAX0RNlEdHI3nUW3qkAzVF7bn3YBX6Vp59xa1LpR4r6MrShGXVfC
 xbS7yMs0kmdYXzeT30o8HpDusinl47fCIBbfvq1GWnW5afg=
X-Google-Smtp-Source: APXvYqzlvGH5+vuesYqFqu1+gTvcsCIH4EvnSumrUV7KeBkh/xg2JNN7UJtXZwP3P8IgxFsXyqE7xOIFGUeA2qiWHXo=
X-Received: by 2002:ac2:4565:: with SMTP id k5mr8496083lfm.170.1561026274863; 
 Thu, 20 Jun 2019 03:24:34 -0700 (PDT)
MIME-Version: 1.0
From: Charles Papon <charles.papon.90@gmail.com>
Date: Thu, 20 Jun 2019 12:24:24 +0200
Message-ID: <CAMabmM+MSWtAFwpO+U9_mQt2RMg_1uSbtXjk37f722oSraDC9w@mail.gmail.com>
Subject: irq-sifive-plic + gpio-sifive break IRQF_ONESHOT
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_032436_677793_82FF6866 
X-CRM114-Status: UNSURE (   6.13  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

Was using a chip driver (W5500) which use a threaded irq with the
IRQF_TRIGGER_LOW | IRQF_ONESHOT flags and i got some issues.

The interrupt should have been masked to wait the W5500 irq handler to
be executed, but that wasn't the case.

As far my understanding go, the plic driver should use
handle_level_irq instead of handle_simple_irq, as interrupts connected
on it could be level triggerd.

Also, the plic irq_mask/irq_unmask should be implemented for two reasons :
- If they are null, it make crash chained_irq_enter calls from let's
say connected gpio drivers durring IRQ handeling
- the irq_unmask is very much required to handle threaded IRQF_ONESHOT IRQ

So maybe the plic claim release (writel(hwirq, claim);) should be
moved into its irq_unmask, and the irq_mask should be implemented as a
dummy function.


The same kind of issue appeared witht eh gpio-sifive driver, the
driver is using  handle_level_irq instead of handle_simple_irq and do
not implement the unmask, which break the IRQF_ONESHOT handeling.

Do you agree ? I'm not experienced in linux dev.
Thanks

Charles

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
