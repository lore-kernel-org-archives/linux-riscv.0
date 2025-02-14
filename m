Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41192C02198
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 11:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AR6uoisExszUzNsaUvHsHSSWYGk6SLK+Yl8EvShhxlI=; b=Nxzc7CFOVRB1nA
	cQNQrrQQbqLTE8LOhsqkVRC4bMmKhyBk1mk6QZVAeo5lkwEcX1MpM7lLKX1uFxbH7IF0UcYa6fTR9
	Tr2qBgMRlWanReV9ymIij6GNSMLaU0MsmVEdHsCgU0V73x4J/pT6GVvga43DCIH3kNVPYlpo12qiP
	lYPbka35UxRFE9PYFk02m7WDSUq/tPmm/d4IwAY3Cbyl3Wf+GHY/6Jp5oaIy+kcuzs53uEZ95OK2E
	8PXlJGxoqsz/Rgk0USEeHa6cChJGm/GYJY2M5CBifcYgL6wWUgS1cEJmYaCSsw6C7M714IVanKP57
	MYPW3ciNXgqXb5cjsZqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titSp-0000000EbD9-00Pf;
	Fri, 14 Feb 2025 11:02:31 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1titSi-0000000EbBR-3KzL
	for linux-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 11:02:26 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-6f6ae4846c7so16124807b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Feb 2025 03:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739530943; x=1740135743; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rzLryw/XAyJKRphNFTyQsyFqFFX/jhMAED6ZmtSxJ5A=;
        b=KvecfxH87AXAKcc9DOkY68ob7ptVh0hPn6JLLc5UU2Ifq10m6Qk9+fcyr2C9GWnt6s
         m7RQt+WyLUftTPzHTXr4oUyGQdu88I35oxwYv3Dwuh7g4oo4Xu3RzLWtYTzco+rfk9+X
         j3ArH1QHmxzgpM7jz6M8TDeB/QKGpYwKUGhBEid6L8wSq/+d0eduqPQ9dCsLgqppsBBT
         UAMUBXAv0mPFWvDVk2SDduSNFWxUsSWL8zew6CH+6Vx7ldRHNfe5UgpS6aYGU0iRoZJX
         RFFfz4Zl8izf32I1pPIvi0LUOFW9UpcQj2SZAdeKIofqr0EX1mhqKq9K48EM3kJsMdN9
         NJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739530943; x=1740135743;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rzLryw/XAyJKRphNFTyQsyFqFFX/jhMAED6ZmtSxJ5A=;
        b=n675iaX1CoMoYJAMI5MlfOr9S/1KVGga6P999GpzUyTB8MHrmsQNji9ytj0yEOGtFw
         QJAd9Ft/XRVAR7aIvM7ECMGXLXODTG6T8yx3ITvzVVIoamft7WjNjQDpSV8e/2CoFDUV
         +heOa1AV/7Jfmt12/gLfIpQvDaeni2ddBdGppuWgxSayFGazdN1HV9hfu13huUTFSgxk
         Qnd3dMxk340IeBCqpXhzTm2rQFcHZGFN98a5n//htipWjSxl+bG07fG0vO3ci8wccl7E
         /imV9TIZejEec0wdorP2D/IapOVCL8p9Fgo+5rOYMz7dA27WD7d2qC085aqhl9vavLgo
         KUnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdxhEgKobwvsHaCX1W0t72N43QYryKUQJp2EQp2OmwkoME4smWcrZovHAJ+vfH64uzPms5PR9TFO9O6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPl53kR+ZrciLIRAZQkbkwTNS+9DnbSH7B77Kxo0FWh3/AiFk+
	ioNh31j1JWUZbq46Rtawz7npgToTmBe+hRkrV5c2L1SsOfRae4iW6PhjIXGsF76vrDAFr8Pp90p
	4wj32tyyfFnJ4LhqbH/9oEi2PZIPa1MavfwyivA==
X-Gm-Gg: ASbGncuHzkYuHkpViS/vE6ex3IusdldahxuVq0q1pcOTfy4uEQbmE8tXHgDnGYxK5k+
	+8frOB9hl0ZNtQQHDtP5Z+Il8TRxwXsWYJ6KnHphCWMB4HvpGqVymxw/nJyzo1rrlwuqFM2A9gw
	==
X-Google-Smtp-Source: AGHT+IEKcq28b+1jm6W/qMPjV397BfFJUY6Ro0y3t74MU1oh8ipE5HyvHwkyR5H+34Nm6ywfG6DdYeLN9CCigPMkqzw=
X-Received: by 2002:a05:6902:11c7:b0:e57:4db7:6d51 with SMTP id
 3f1490d57ef6-e5d9f170324mr10340809276.32.1739530943472; Fri, 14 Feb 2025
 03:02:23 -0800 (PST)
MIME-Version: 1.0
References: <CGME20250128194830eucas1p134d566631b5622c85d843f5d811c3c00@eucas1p1.samsung.com>
 <20250128194816.2185326-1-m.wilczynski@samsung.com> <20250128194816.2185326-5-m.wilczynski@samsung.com>
In-Reply-To: <20250128194816.2185326-5-m.wilczynski@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 14 Feb 2025 12:01:47 +0100
X-Gm-Features: AWEUYZlteGTa4T3_RQ0f5ZiaQGtHVX2-gpRxvu_zXmJT0uvPZbTFwTKkU3epoaE
Message-ID: <CAPDyKFp6OTa07Lv+jsMy=Rn7U_NYFb_0MfNUXT3cjN_Gkwqs9g@mail.gmail.com>
Subject: Re: [PATCH v4 04/18] firmware: thead: Add AON firmware protocol driver
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, 
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com, 
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, jszhang@kernel.org, 
	p.zabel@pengutronix.de, m.szyprowski@samsung.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_030224_845863_80AC8C96 
X-CRM114-Status: GOOD (  18.06  )
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

On Tue, 28 Jan 2025 at 20:48, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> The T-Head TH1520 SoC uses an E902 co-processor running Always-On (AON)
> firmware to manage power, clock, and other system resources [1]. This
> patch introduces a driver implementing the AON firmware protocol,
> allowing the Linux kernel to communicate with the firmware via mailbox
> channels.  Through an RPC-based interface, the kernel can initiate power
> state transitions, update resource configurations, and perform other
> AON-related tasks.
>
> Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf [1]
>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

[...]

> +
> +static int th1520_aon_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct th1520_aon_chan *aon_chan;
> +       struct mbox_client *cl;
> +       int ret;
> +       struct platform_device_info pdevinfo = {
> +               .name = "th1520-pd",
> +               .id = PLATFORM_DEVID_AUTO,
> +               .parent = dev,
> +       };
> +
> +       aon_chan = devm_kzalloc(dev, sizeof(*aon_chan), GFP_KERNEL);
> +       if (!aon_chan)
> +               return -ENOMEM;
> +
> +       cl = &aon_chan->cl;
> +       cl->dev = dev;
> +       cl->tx_block = true;
> +       cl->tx_tout = MAX_TX_TIMEOUT;
> +       cl->rx_callback = th1520_aon_rx_callback;
> +
> +       aon_chan->ch = mbox_request_channel_byname(cl, "aon");
> +       if (IS_ERR(aon_chan->ch))
> +               return dev_err_probe(dev, PTR_ERR(aon_chan->ch),
> +                                    "Failed to request aon mbox chan\n");
> +
> +       mutex_init(&aon_chan->transaction_lock);
> +       init_completion(&aon_chan->done);
> +
> +       platform_set_drvdata(pdev, aon_chan);
> +
> +       aon_chan->pd = platform_device_register_full(&pdevinfo);
> +       ret = PTR_ERR_OR_ZERO(aon_chan->pd);
> +       if (ret) {
> +               dev_err(dev, "Failed to register child device 'th1520-pd': %d\n", ret);
> +               goto free_mbox_chan;
> +       }
> +
> +       ret = devm_of_platform_populate(dev);
> +       if (ret)
> +               goto unregister_pd;
> +
> +       return 0;
> +
> +unregister_pd:
> +       platform_device_unregister(aon_chan->pd);
> +free_mbox_chan:
> +       mbox_free_channel(aon_chan->ch);
> +
> +       return ret;
> +}

Rather than implementing this as a driver, I suggest limiting this to
a set of exported library functions.

In this way, you don't need to register a platform device, but can
instead let the power-domain provider driver in patch6, to be the one
that matches on the "thead,th1520-aon" compatible to probe.

> +
> +static void th1520_aon_remove(struct platform_device *pdev)
> +{
> +       struct th1520_aon_chan *aon_chan = platform_get_drvdata(pdev);
> +
> +       platform_device_unregister(aon_chan->pd);
> +       mbox_free_channel(aon_chan->ch);
> +}
> +
> +static const struct of_device_id th1520_aon_match[] = {
> +       { .compatible = "thead,th1520-aon" },
> +       { /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, th1520_aon_match);
> +
> +static struct platform_driver th1520_aon_driver = {
> +       .driver = {
> +               .name = "th1520-aon",
> +               .of_match_table = th1520_aon_match,
> +       },
> +       .probe = th1520_aon_probe,
> +       .remove = th1520_aon_remove,
> +};
> +module_platform_driver(th1520_aon_driver);
> +
> +MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
> +MODULE_DESCRIPTION("T-HEAD TH1520 Always-On firmware driver");
> +MODULE_LICENSE("GPL");

[...]

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
