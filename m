Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E41C9EC6C
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 10:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tU9Yqgy4tjrXzmlVChNETQWjjM0aHHj8L+izsgPqbis=; b=l0s7rb3/8q4j/S
	0wWKeviZgN4Z/7Xm4l5VBO+YTouD3usFYdlhY4qBzi/sU8xvCJhhtwufeBpGqisLhtWiizMYQMfQF
	HXiOzPPrB48KJLSx96KVFWpGuflpaNXJXz8ACAe+H4xzekH85nLO4hevGGRiVQDolfbQlMujqxT7N
	/pd8qWLUpmfbFVgmYHTtFPzDgXD6KX3UG1pzSO1HoJ51LkGlPjMxNHBpM3t6B9CsyAIVgeraKSSne
	gVNv6e6oiIsSERDUookTmdG4/F2Wh5i8ZgoYCQDHNSUDHwOl8JyaKB2WWmJqpjhn4bI8ij1UlFvlu
	nVvhNW/UeMY+N08kC0mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFT4-00000005CND-3qe3;
	Mon, 12 Jan 2026 10:48:15 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFT1-00000005CMm-3GVe
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 10:48:13 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-64669a2ecb5so5653386d50.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 02:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=summations-net.20230601.gappssmtp.com; s=20230601; t=1768214890; x=1768819690; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tYqnD643rP0xFCjQr1d58+6MQqBgB19G/KQFekbT4n4=;
        b=tPCjoLnhskObpqA/CCZdPkk5MWWCcwXSU/GOy0Z4w7pG0D0ZZrT/fYB9zqZravbUaK
         8n7XFJxWx3N2ug0oKU57+s4B0ZfIgXV5qI1+ekhZY/mUhnqo9iV4zeDmj9OSUzqz/EZd
         +LkgaPdoCnLHIInnqCH9/KRnxCptwkq3oGNqsTjiG6aCjcJ+sE7i7WgmkH9FQXBWS+17
         ZxEIubc4g5C8fBbKWuRz0nez9wMBfVfZ/252wpOYq3NoVaGnlPNSq3dbGMi8+LAlRWbk
         eFI12Ft86IvmFHfp5wSmc6zYdkq4C/6jhucaoHU2DiN9hBXOMdrMCgbJ7tKuK13NuP5F
         Pj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214890; x=1768819690;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYqnD643rP0xFCjQr1d58+6MQqBgB19G/KQFekbT4n4=;
        b=EmnELpDpGQlGkwwGKdcndkNklFHRJ6yz5Dkoo7biH2MuE0HCLNRPcQr8w9ET0b0wEV
         7k7alxaSYW6GW8SNugehWxBQgO6FqovtlnQLgljoZqLF9OmkBu1yPv0NYXauO2D6OjOK
         MahWi/b75w4fggqwb4zAn+HCEm6zZID9SAOaSgVEGpCTc0Rt9s8HKh+0sC8BzIzfO+ig
         CSvAr729MxqpzP3SSM6YDX4dL6dSpNtiU0I1PG5QFWrZ3xlJyY8ScEiCkIklyjGyDV4b
         b/syZsHZkAFRX0Yoa3rKYUfSy/fqQnWh6JAb7QxaAk1MlD0MTyqUp0VM6efGtkldhf8L
         xSew==
X-Forwarded-Encrypted: i=1; AJvYcCUR00UXYjyjdOg6C+QS1DRhevPQrBn7B8HbKw4uAPSLqMxid/QSuoG/DUaBlvShgH7c6dxpIqxGpA/VIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZkq9njpTE4s3aNGs3vKrg71H5QrWjGzaPNWUuVhBl3sD+h+Ep
	6leR62naca8LPZkg1U/gIaeScA/3lQuSUcQQPq+p8fs9nYpvvzbqCkyE4nzFivpxsfbQtJxvtG6
	oUQetAYHq7efL3jb9WZouobzVjAk7/zOP8nWIBDNyWWo=
X-Gm-Gg: AY/fxX5Ljl8EDQM6asan1nwUEY9qXO04x7AWnAyi7dbYkVTTFgMRB4CzZyMwf5b/tU+
	a5JbS4Fp8j85hUSg2fdAzYSnO+LNBNJwXMavaMvfMt9TekqHOO2AugFroI0iGb2FNXXdU9M8ukP
	cryCIOO5Gb2xOtaKp+fw8e8QSwzLIoUvc3vKHZqoRFAYcwKqwbBm9swZY8L2ZAW+7ckqIbEWNoK
	HA3gSP6Ia6ZT78TV7BKtlDLZMe/nRkr8hZSC2b/TrU0u4AYpP1jQPOp107kzrI/GT54bXNJoRF6
	Szq73OBelVIxbVh/wyNYmppEVbo=
X-Google-Smtp-Source: AGHT+IGSd6S45oI12lA93B0VdFuPS8wsqAp/AtTqvdaME97V+b32RqcikLawp2CIt2dWylh/hgMjUjHf3u3+tihHgL0=
X-Received: by 2002:a05:690e:1209:b0:645:54a9:11d2 with SMTP id
 956f58d0204a3-64716657fdcmr12415884d50.14.1768214889924; Mon, 12 Jan 2026
 02:48:09 -0800 (PST)
MIME-Version: 1.0
References: <20260106092117.3727152-1-joshua.yeong@starfivetech.com> <20260106092117.3727152-5-joshua.yeong@starfivetech.com>
In-Reply-To: <20260106092117.3727152-5-joshua.yeong@starfivetech.com>
From: Rahul Pathak <rahul@summations.net>
Date: Mon, 12 Jan 2026 16:17:59 +0530
X-Gm-Features: AZwV_QioIQXKqToGHL2PxilyAAbfzG3wtMScBzGleyYaV375JeLJ3r4qOh6p77M
Message-ID: <CABdD5xmVVkQu6rYzF52V-JrsdL=NOQa9N9i8PsMgfaOh3GT-Bg@mail.gmail.com>
Subject: Re: [PATCH 4/5] cpufreq: Add cpufreq driver for the RISC-V RPMI
 performance service group
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: anup@brainfault.org, leyfoon.tan@starfivetech.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, rafael@kernel.org, 
	viresh.kumar@linaro.org, sboyd@kernel.org, jms@oss.tenstorrent.com, 
	darshan.prajapati@einfochips.com, charlie@rivosinc.com, 
	dfustini@oss.tenstorrent.com, michal.simek@amd.com, cyy@cyyself.name, 
	jassisinghbrar@gmail.com, andriy.shevchenko@linux.intel.com, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_024812_069161_C92A6443 
X-CRM114-Status: GOOD (  14.57  )
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

> +
> +static int rpmi_cpufreq_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct rpmi_perf *mpxy_perf;
> +       struct rpmi_ctx *mpxy_ctx;
> +       int num_domains = 0;
> +       int ret, i;
> +
> +       mpxy_ctx = devm_kzalloc(&pdev->dev, sizeof(*mpxy_ctx), GFP_KERNEL);
> +       if (!mpxy_ctx)
> +               return -ENOMEM;
> +
> +       /* Setup mailbox client */
> +       mpxy_ctx->client.dev            = dev;
> +       mpxy_ctx->client.rx_callback    = NULL;
> +       mpxy_ctx->client.tx_block       = false;
> +       mpxy_ctx->client.knows_txdone   = true;
> +       mpxy_ctx->client.tx_tout        = 0;
> +
> +       /* Request mailbox channel */
> +       mpxy_ctx->chan = mbox_request_channel(&mpxy_ctx->client, 0);
> +       if (IS_ERR(mpxy_ctx->chan))
> +               return PTR_ERR(mpxy_ctx->chan);
> +
> +       ret = rpmi_cpufreq_attr_setup(dev, mpxy_ctx);
> +       if (ret) {
> +               dev_err(dev, "failed to verify RPMI attribute - err:%d\n", ret);
> +               goto fail_free_channel;
> +       }
> +
> +       /* Get number of performance domain */
> +       ret = rpmi_perf_get_num_domains(mpxy_ctx, &num_domains);
> +       if (ret) {
> +               dev_err(dev, "invalid number of perf domains - err:%d\n", ret);
> +               goto fail_free_channel;
> +       }

The domain space in RPMI performance for CPU and Device
is not separate and a domain can be either CPU or a Device.
How the driver will make sure that the domains which are returned
are CPU only and not the device.

> +MODULE_DEVICE_TABLE(of, rpmi_cpufreq_of_match);
> +
> +static struct platform_driver rpmi_cpufreq_platdrv = {
> +       .driver = {
> +               .name = "riscv-rpmi-performance",
> +               .of_match_table = rpmi_cpufreq_of_match,
> +       },
> +       .probe = rpmi_cpufreq_probe,
> +       .remove = rpmi_cpufreq_remove,
> +};
> +
> +module_platform_driver(rpmi_cpufreq_platdrv);
> +
> +MODULE_AUTHOR("Joshua Yeong <joshua.yeong@starfivetech.com>");
> +MODULE_DESCRIPTION("CPUFreq Driver based on SBI MPXY extension");

NIT: CPUFreq driver based on SBI MPXY extension and RPMI protocol   -
something like this

> +MODULE_LICENSE("GPL");

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
