Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2C6C48BE8
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 15:14:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BA2C60FDB
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 15:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BA2C60FDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a7JfEGSoB9tm3aw7f/T7tnBTnD+W88OqJyWgnAgw+aA=; b=iGAM3/SyrVgzjf
	pbD9oVHh3LQqTxXsF3Yh9hkpKPpOxqrfGM021NFyT+ftlJbevV1icUh02VZcNBgU7U44V2qkCeACw
	1EBPaw198XWfoVCb0LgUjwKy91vdUfBSOVr34O3U7cPwXMuqxVM+pTnCOMBARZd9gy3tXB/iFI2Tv
	gOTZ9iZ6fOZZEaza2gmpI1IKgD6MXyMsWs9bwQjDNjsZaurt9SQffngjliXbibGAPrEChfZxqUV5Z
	fxnTTx5uRptWUXm5Reqxh4CifzfXx8ygM7XbS7eeaYYXuTTily1fgFrBsBtl9JrtmtYw0jJbxRGwj
	c92uF0h0KXr4hLWkvVzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltXFG-006qdk-89; Wed, 16 Jun 2021 15:14:22 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltXFD-006qcS-Cq
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 15:14:20 +0000
Received: by mail-lf1-x12f.google.com with SMTP id p17so4923221lfc.6
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 08:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WCUe9yfJi8lButFYN+6DXnGgFGVFnjhGmS6IdUFM/PE=;
 b=P9gYjuYuzTOvvhKnAnjxUs0opTMMss9J94gjjllmYV1996b99XjsTVEPKMyuyQ2Csw
 ZZl8Nun3vnmJqQSmBwIjjfm/mswaE8JDT8eNnZ5zxV0MI0hoyrYQiqJycTji6C3DdWr2
 4H05z1nOd217vS0ByxBD0jtVLzXyDWwemSFbAKy6XrS1MNXbD8RYNHHgdV05OVU9lm08
 xNXJwIH1H7hYnt8eJTRKZumddevouP7wQzaHIDQa0gKR3/cNv4wdGIyrXBtHJXaXiQRc
 +0h37BsuW36iMqOk3Cy78yDO/SNdFoEOydZh9z/Kd58BlMAuuxtz1+WHZSfkI0UzqywC
 jtwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WCUe9yfJi8lButFYN+6DXnGgFGVFnjhGmS6IdUFM/PE=;
 b=hlGhYgQ09kzkgnKtwnedIdL8WBn+nb8hVMzZ+J9iEKy/tv6wAqNEV5NCX2INB1m87C
 wlEOqdQ8O5iOotmg1UD6PqpADrQvAXLCLaJzoSZaWEBtCdlJLw/7VouWdwxOhMuWyEYR
 TZfBJkbT8NKf2pzDc3VVEq1O1UDc9nsRkqx1HbzZpNMvkobCfRZcTF7F1eByI829lscx
 PHqzLCL4tsDeNW9Suq0HbJK0uqPlGBD7GFzO07ivQl1QItbnNXlb4P3GVVdJY9e0mSLT
 +Fsm4wzH5fTU28fdFEfC3WgQ1Jemi6sD9bqTEPlwQB09qrwR0iGnE9uKl3LA5IpswWa+
 H5Mw==
X-Gm-Message-State: AOAM533HiRwIfErAUXcN6SGRFdxes6leaAsfU7oWaBiMWWJl4l06LJn6
 NnPPu0Qh2PYjx6SmvZCEQUPndjSef9i3WjY8opo=
X-Google-Smtp-Source: ABdhPJwIpMycqjcQSuT4OYUHdF/dfwOWq9xQzFw5rA040gQQSFuud2r0vCT1k8gg8ncNYf6VPFmHVufU57mjRtx+qcI=
X-Received: by 2002:a19:4086:: with SMTP id n128mr140101lfa.464.1623856455921; 
 Wed, 16 Jun 2021 08:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <1592308864-30205-1-git-send-email-yash.shah@sifive.com>
 <1592308864-30205-3-git-send-email-yash.shah@sifive.com>
 <CAEUhbmXKdukBwd0OL2ApOD67aQ9ytSPns3z=COtXTSP_mm3wvQ@mail.gmail.com>
In-Reply-To: <CAEUhbmXKdukBwd0OL2ApOD67aQ9ytSPns3z=COtXTSP_mm3wvQ@mail.gmail.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Wed, 16 Jun 2021 18:13:40 +0300
Message-ID: <CAEn-LToZODMPLpsbKJcJXpksJSxTk0WSNpaR9N7uMekNriC+bg@mail.gmail.com>
Subject: Re: [PATCH 2/3] riscv: dts: fu540-c000: define hart clocks
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Yash Shah <yash.shah@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Sachin Ghadi <sachin.ghadi@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Green Wan <green.wan@sifive.com>, Atish Patra <atish.patra@wdc.com>, 
 Anup Patel <anup@brainfault.org>, Alistair Francis <alistair.francis@wdc.com>,
 lollivier@baylibre.com, deepa.kernel@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_081419_499558_9CF97509 
X-CRM114-Status: GOOD (  16.38  )
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

On Wed, Jun 16, 2021 at 6:17 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Jun 16, 2020 at 8:01 PM Yash Shah <yash.shah@sifive.com> wrote:
> >
> > Declare that each hart defined in the FU540 DT data is clocked by the
> > COREPLL. This is in preparation for enabling CPUFreq for the
> > FU540-C000 SoC on the HiFive Unleashed board.
> >
> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > ---
> >  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
>
> Any idea of why this patch was not applied?

There was a decision not to upstream CPUFreq stuff for Unleashed thus
the whole series probably was abandoned. Not all Unleashed can operate
in a stable way at 1.4GHz. IIRC other issues could exist. See Palmer
reply for the whole series.

david

>
> Regards,
> Bin
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
