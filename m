Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE87A606A320
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 15:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vW0PN0tY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TAbRIc3Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nacPGcyrnO2nhzDC20hcrn31MRNRQfjS5Ja8eXBlDyg=; b=vW0PN0tYmwgUFVnR0VJiv1xc9b
	/MiFObQ2HjxVK/uYsgLAQiuS3i46aNHmN9W34fXJ7sJaTBHHZubSviBMWP8n1G7WycxMg2fj+K3Ca
	lOkS/OaB1ICfoyYW3GTulHVyWQhfunTf4biT5auklluWxgdXO5hAnsPWZfm3mNRQU9aEk1SEJTXdo
	dsjD4lZJH/MdORMp9jkvJadpAzNdiuAWy4L6Go7K2Zpc5a5HnDuuMwOD7J56QwKKgKegnvrUZ/01p
	ygz+v2REcbx0y6qL2EOCM7GdCHKRrA1rva9Bi1rMriECfuB05VgcMxHEYzsczH6HpYe5WrMAxNOIX
	It8WttNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9o0-00000001ISR-1YOH;
	Sun, 22 Nov 2026 15:48:40 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9nx-00000001IRy-456Q
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 15:48:39 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4a357b1c649so1456832f8f.3
        for <linux-riscv@lists.infradead.org>; Sun, 22 Nov 2026 07:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795362516; x=1795967316; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OU/4coRrYrYEMovrLhotSeDgFsbxxM6k/RzNG1xiMj4=;
        b=TAbRIc3ZtNvrSyae4WqVStN45ySTE4peRC5QuHJBdz2NUHti23v1Y+2x0s6CPbPM//
         IZKD17BXBp07qgi5CPrLjQkDOdIdJN7IxuHKw6aPcSx2z4MUcutan4OakE3uFn56F+08
         +ndwjRE6C+dTf8YYnKfZTjg+iERukZ6G3+gBc7ZiPYt0Uqza8bTTesPPb3UgPnwvCn9U
         tVZOkktyYoNBy4MxzzFUVDQAtkWSwxOjL4IYmlmB9ZQjjtJ/kN3vqTgkuCb9mnO+0Zme
         qdp+RWpAuNYVLOh4dLHZkYMg7IjBHd8gl8bXuIgTxvI0S61RgEogSbX5e0edHJv+mRKZ
         NpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362516; x=1795967316;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OU/4coRrYrYEMovrLhotSeDgFsbxxM6k/RzNG1xiMj4=;
        b=Teb39/5JhQmmB6N3WYZrYTd76eiT67emjlhLd1xEUuMy23IbjM6du9Td0S+H3jaovK
         1FHnqavd00LRHyK4RkSXqH4629cpVqLAh7RiHz8y6BsK34MdmHkLdtm8KSKktg5/vqXI
         zl0Y3KGPbLHg61Uja/q45lRTHOdJzxim6xwWqzJoHdsDpOnhtiLkDrEhwR+AiF0dqN4O
         uuHZbQAl0CcUyx3Ahb4Ii9vayDckkrC7dxN8c0W8X301aWYqDO+WN+yscn0EI/+8Oc4G
         XzPgQyRruOTe7YPsp27vbaNL0YSWw7hpP/n93qHCOKffA4xnqExYts6LRJtVC5P/fYPQ
         3VQg==
X-Forwarded-Encrypted: i=1; AL+hErFjECcYuUY6T+SJZI1c45uOB/M0eXZy0DcMckOVEYTU46u98OfQhBZMj1KS5/uJC7t7Or2KtAcu5TUdhw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/gOZBRn9TSCZYXcyeSx0LXRW4N5RSMqALPKdvydxrAKE7LaROg
	Y0YGObaBKq0jyJVSIeRuFGK/ZkR1xEt10u/rFn2MQF9DMAToRGxBsDtMTFZ8unf+bqY=
X-Gm-Gg: AZFdTZcpzJXCIp1WChX3VNAraf+hbq0PZsgtR5yKB4e7wa0yEGpyDoDAlcA2Hf3x4Me
	0rqMaDmxl6DYNGMGPv0F2rkLj85gZjrA5IV+mD67QJSHrNInEOSSIoGUfz/4jALgTL8WuzMIY41
	eAD7uUxyk/io45q4ztPO0r6mrZxcWsepE26y4xf12suN3yU9iT3OhjCoZrfrkMkjLPTCTGEPxTt
	zLtUOODOo/XV8MUVsljGggCr58oEA2GD71/FG0GCGh4NeSYBu/d2KgyE0ljalEH1vEea0SGgAMM
	hbvQ2d49n3uzKpkFRaMeP4bmIoiFZEWAJutisudZ155+zT2VIaE3tMhelBb4jLLFEYCSkuwRrZ+
	mm+ofEkg0AYQJbnA2ScnCgWz896Vqxtc0kM9/OIOkTkHjgGobcdhQ7iSlNsGIlmKqEabcGWarfd
	F8497Z8vqMRC61oRjd/yacBCFdydzJ0z4CFL/z5xqgb1oohnJ/CGSqJbXHYLMO0Vgtm/5sXD4mQ
	2N170nBfrG5rszVk8/qc3Mh3XNvXDNZlwwbT11yWVdFrk2lNQ9CUVl3+2ctWBU7ks27YPoEY9se
	/1tDQecMcDIz5pVqvfSErKbO8f5+RZ+XWlHKMdjWhBBC6y5CjeFfERBnvJANQ/akDGKQXg==
X-Received: by 2002:a05:600c:a088:b0:4a2:1a:a120 with SMTP id 5b1f17b1804b1-4bb8880ac02mr185403945e9.6.1795362516062;
        Sun, 22 Nov 2026 07:48:36 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm279389115e9.2.2026.11.22.07.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:48:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 5/6] reset: starfive: jh71x0: Support discontiguous
 reset IDs
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <0ee6bfcc5bb62fcb0c9128168e9367254393eca3.camel@pengutronix.de>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
 <20261118100523.11395-6-changhuang.liang@starfivetech.com>
 <0ee6bfcc5bb62fcb0c9128168e9367254393eca3.camel@pengutronix.de>
Date: Sun, 22 Nov 2026 16:48:34 +0100
Message-Id: <179536251467.2728475.8360126735543701661.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3236; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=9+DCtU9MB3l+ZbzrrTv3gmLnvQYjcC8cHeWP8Lnbruw=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNnMfJdmLT80w3j7CVfpluD1enfZmBX0eRfuDfl8uJP74
 M9MaYO+jlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAExkWj/DP7W3sXWdLHfn/NDL
 NtvF0qLyP8s15nGl26pply9aezMeY2T4nysx89QUrcK6c4nddko6jeZeS+aG/+MX7Ge6lfb53Bt
 pZgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_074838_064395_73A94ABE 
X-CRM114-Status: GOOD (  23.43  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-18 11:39:56+01:00, Philipp Zabel wrote:
> On Mi, 2026-11-18 at 02:05 -0800, Changhuang Liang wrote:
> 
> > The reset IDs exposed to consumers of the StarFive JHB100 reset
> > controllers do not map one-to-one to the hardware reset bits.
> > 
> > Add struct jh71x0_reset_info, which describes the number of resets, the
> > assert/status register offsets and, for such controllers, a table of
> > hardware reset lines indexed by reset ID. Add
> > reset_starfive_jh71x0_register_with_info() to register a controller
> > described this way.
> > 
> > If a map is provided, install a custom fwnode_xlate callback that
> > translates the reset ID of the reset specifier to the hardware reset
> > line. The translation is thus done once when a reset control is
> > requested, and the reset operations are left untouched since they only
> > ever see hardware reset lines.
> > 
> > Existing users of reset_starfive_jh71x0_register() are unaffected.
> > 
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  .../reset/starfive/reset-starfive-jh71x0.c    | 60 +++++++++++++++++++
> >  .../reset/starfive/reset-starfive-jh71x0.h    | 24 ++++++++
> >  2 files changed, 84 insertions(+)
> > 
> > diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/reset/starfive/reset-starfive-jh71x0.c
> > index d410a5a0ded4..5c64d47fb530 100644
> > --- a/drivers/reset/starfive/reset-starfive-jh71x0.c
> > +++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
> 
> [...]
> 
> > @@ -132,3 +152,43 @@ int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_no
> >  	return devm_reset_controller_register(dev, &data->rcdev);
> >  }
> >  EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register);
> > +
> > +int reset_starfive_jh71x0_register_with_info(struct device *dev, struct device_node *of_node,
> > +					     void __iomem *assert, void __iomem *status,
> > +					     const u32 *asserted,
> > +					     const struct jh71x0_reset_info *info,
> > +					     struct module *owner)
> > +{
> > +	struct jh71x0_reset *data;
> > +	int ret;
> > +
> > +	data = devm_kzalloc_obj(dev, *data);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	data->rcdev.ops = &jh71x0_reset_ops;
> > +	data->rcdev.owner = owner;
> > +	data->rcdev.nr_resets = info->nr_resets;
> > +	data->rcdev.dev = dev;
> > +	data->rcdev.of_node = of_node;
> > +
> > +	if (info->map) {
> > +		data->map = info->map;
> > +		data->rcdev.fwnode_xlate = jh71x0_reset_fwnode_xlate;
> > +		data->rcdev.fwnode_reset_n_cells = 1;
> > +	}
> > +
> > +	spin_lock_init(&data->lock);
> > +	data->assert = assert;
> > +	data->status = status;
> > +	data->asserted = asserted;
> > +
> > +	ret = devm_reset_controller_register(dev, &data->rcdev);
> > +	if (ret < 0)
> > +		return dev_err_probe(dev, ret, "Failed to register reset controller\n");
> > +
> > +	dev_info(dev, "Registered %u resets\n", data->rcdev.nr_resets);
> 
> Does this really need to be this verbose? Otherwise,
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Hey Philipp,

With the comment above addressed, Is it Ok if we take the whole series through the clk tree ?

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
