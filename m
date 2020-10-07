Return-Path: <SRS0=wFsd=DO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B8EC4363C
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2020 11:40:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 700C420782
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2020 11:40:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gybfbx24";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lL6tR969"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 700C420782
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5ZTZ876UDkFc2TtyzPe+GyCJyYdl/bIpcwmBCwq2snU=; b=Gybfbx24amMkV4a9SXQ7opIH/
	Ozh9UPZ0xik1FBeHvlfEfPZjXx08yZUIf5kzRHhoG27vkjnIW5qizH4kRzW2LkLbKnIXUZr39lnU+
	cPKIgQP2j8jOqq0JEfy/0opZkxPpNvcDusSV92BaxCZyk7PNzS862gzype5yu7NQOpdd754SYECY4
	0hcqLCPtlqlxTTB+Y3PxCVcFhVm71ZFfX3SoNTtxITdxSjRShUuhdkT1TeX0d2pZgALsuAYsmC0hb
	RJAtjYTJakee3u0698nQ54wHDpzAvJiRAqQoyAOMCytXoB6ow3yCn27wqFmeYkHPO3Zlw/6R96SKT
	aZVuLZ7Qg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ7o9-0004fG-9T; Wed, 07 Oct 2020 11:40:33 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ7o7-0004ea-5Z
 for linux-riscv@lists.infradead.org; Wed, 07 Oct 2020 11:40:32 +0000
Received: by mail-ed1-x541.google.com with SMTP id cq12so1819899edb.2
 for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2020 04:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=k0aeJ1aYDeTbfQgHa1bFP6cUwbAIO3u/WkE2x9DvX8Y=;
 b=lL6tR969hOKqmM8s5zNN//ayAtdv7Ochna4uq6PZS54QF5l4MU+t4smAXv2EhtFOqi
 0nBsyOoRstNSS4yzZ0OpGMCmjhoDIJprstf5+YlImipSM6XjE3oqFGtuX/iLdMrQ/heO
 zAm7Vec+A9T6Dl9ep+/AgFwyns8sTn5gRSSp62jRC/It1TbFyx+Mm+gkpEK0kMY3k1hX
 acrMmRVLwp7XiIzJ8ADtFKlnpsGI1Lkqv8/5bm5xPO6d5h7uosjpQcP/5RLaC7pMcQMC
 uzBZofb6QC1JUw3n/1DJJ90EGnn2ZXzGMfR6Yxzk9H9S0EPphVCovR8pf9hEisWrqtIV
 PxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=k0aeJ1aYDeTbfQgHa1bFP6cUwbAIO3u/WkE2x9DvX8Y=;
 b=CkQOFn19WxSq3fn/3Bigrc4CrnfXO1SUxAkR9XFCQMThl/aLFiJigYapr4DedHJHqO
 XJ6OfiIRKCrNpl+yST66MvK3vyGoPVIQGVQwCzVwDHUU7Ril9YQe8kM8OlM0o6T4uq6G
 GQVDpYiov2I0i3srWciY6fgqLF/S331091w/I2pT7ru/l7VUdp9CDkmEK4nFoauvO3/g
 c7z6WmNqx1G+f3Qmnd+g3+NdkAh1GmR5NeMd5pM70A4uivUys9XmS9FaoBoiG6ONxfPs
 DA4h2OUmkM5VdtnBmoSEIacxDzMFcbq5bZbX4h6zEODDFAXeJT5e3zuUCdf/LST9NeRc
 Jb0g==
X-Gm-Message-State: AOAM530suhSk3syUS/SubJrBrmvmzPPM63sD8DPQ5QJKH1J+AT663biZ
 ACdVsGikMcNLVjEaDxrWsK8a9AWWhkQ=
X-Google-Smtp-Source: ABdhPJwJ9X8Pq8LdGx1IPQXF6Ck6Bt3s9OPFOqe1bc1uSKlyPS0JUsrgQKWA19ob02V6jsPNKYXNvg==
X-Received: by 2002:aa7:dbc5:: with SMTP id v5mr3195373edt.54.1602070828096;
 Wed, 07 Oct 2020 04:40:28 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 r21sm1319295eda.3.2020.10.07.04.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 04:40:26 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1kQ7o2-0002tm-0t; Wed, 07 Oct 2020 13:40:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH 1/1] i2c: ocores: fix polling mode workaround on
 FU540-C000 SoC
References: <1602006796-273724-1-git-send-email-sagar.kadam@sifive.com>
 <1602006796-273724-2-git-send-email-sagar.kadam@sifive.com>
Date: Wed, 07 Oct 2020 13:40:26 +0200
In-Reply-To: <1602006796-273724-2-git-send-email-sagar.kadam@sifive.com>
 (Sagar Shrikant Kadam's message of "Tue, 6 Oct 2020 10:53:16 -0700")
Message-ID: <87imbm4639.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_074031_239262_A6388AB8 
X-CRM114-Status: GOOD (  25.40  )
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
Cc: andrew@lunn.ch, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 palmer@dabbelt.com, linux-i2c@vger.kernel.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

>>>>> "Sagar" == Sagar Shrikant Kadam <sagar.kadam@sifive.com> writes:

 > The FU540-C000 has a broken IRQ and support was added earlier
 > so that it will operate in polling mode, but seems to work only
 > in case interrupts property is missing from the i2c0 dt-node.
 > This should not be the case and the driver should handle polling
 > mode with the interrupt property present in i2c0 node of the
 > device tree.
 > So check if it's the FU540-C000 soc and enable polling mode master
 > xfers, as the IRQ for this chip is broken.

 > Fixes commit c45d4ba86731 ("i2c: ocores: add polling mode workaround
 > for Sifive FU540-C000 SoC")

 > Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
 > ---
 >  drivers/i2c/busses/i2c-ocores.c | 22 +++++++++++++---------
 >  1 file changed, 13 insertions(+), 9 deletions(-)

 > diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
 > index f5fc75b..4405244 100644
 > --- a/drivers/i2c/busses/i2c-ocores.c
 > +++ b/drivers/i2c/busses/i2c-ocores.c
 > @@ -686,17 +686,21 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 
 >  	init_waitqueue_head(&i2c->wait);
 
 > +	/*
 > +	 * Set OCORES_FLAG_BROKEN_IRQ to enable workaround for
 > +	 * FU540-C000 SoC in polling mode.
 > +	 * Since the SoC does have interrupt it's dt has the interrupt
 > +	 * defined but it should be bypassed in driver as this SoC has
 > +	 * a broken IRQ, hence update the master_xfer to use polling
 > +	 * transfers.
 > +	 */
 > +	match = of_match_node(ocores_i2c_match, pdev->dev.of_node);
 > +	if (match && (long)match->data == TYPE_SIFIVE_REV0)
 > +		i2c->flags |= OCORES_FLAG_BROKEN_IRQ;
 > +
 >  	irq = platform_get_irq(pdev, 0);
 > -	if (irq == -ENXIO) {
 > +	if (i2c->flags == OCORES_FLAG_BROKEN_IRQ || irq == -ENXIO) {

NIT: flags is a bitmask, so i2c->flags & OCORES_FLAG_BROKEN_IRQ would be
better, even if there currently doesn't exist any other flags.

TYPE_SIFIVE_REV0 is also set for two compatibles:

        {
                .compatible = "sifive,fu540-c000-i2c",
                .data = (void *)TYPE_SIFIVE_REV0,
        },
        {
                .compatible = "sifive,i2c0",
                .data = (void *)TYPE_SIFIVE_REV0,
        },

Are both affected by this issue? if not, we will need to extend the code
to handle them differently.

Other than that, it looks OK to me.

-- 
Bye, Peter Korsgaard

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
