Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE41C44529
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 11:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cnm7GMi/ciV6VXcSUjM4+708BkL+/pNuXAsQZ//1sdM=; b=qWy8fk121JsIgk
	BGIj/H2LSy0oxJ7qedKiPv3Syy9QjF56u2CptdOvgAuXUjHa6UIh1No4SUpu7Cx++Lizz54ye0rg7
	yb2k0hjLLyqI8BScXVME87vOlryps95vXgyGcIuR4JPnSJIfD2Ky5IphhvrRa3eviMonHw/WwcAq+
	o8IjOzY8QJea33wh1sWYXDrTFqd2PmDPB3w55wOd7JVhHnMdbKbntOt1VG6xkB8bDC6X9T7T2axxn
	GXpf7tMnvlclp87jsrRp/q/qYHQLpXa/lYaH9u2UBc0jefJrNgmsIHzv2J9zsr/P6Nh0QLESQ/9V/
	AYSRgbGo2wH/jxrZhTNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm91j-00000009Lpn-0uhr;
	Tue, 21 Jul 2026 11:52:47 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm91g-00000009Loz-1QUm
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 11:52:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784634761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ztkuwDQ88U1nWd7JbtRXsUpUUy9QB7MYF8hpKbkABIQ=;
	b=qACJvlEgENvt+CPMwYacc4vTMOPS0UPeyhultL+5KrkDylnrMT/ITzMnl+JU9Ki12/bC82
	D+5PMyJ/CedXJDSf2AwNGYA8JOPth40bScw5t5G+y6mRhenBcdJTTB4CuqrAuwueFoS7YA
	d1/fvgoV/nkVvvlyMb9lj5UY5+2BkpA=
Date: Tue, 21 Jul 2026 04:52:34 -0700
Message-Id: <DK488087JL3G.2007ORR9MUHGW@linux.dev>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 5/6] riscv: dts: spacemit: Add K3 I2C6 pinctrl state
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
	<20260721-ctl2301-v2-5-ef5fb342872a@linux.dev>
	<20260721100039.0E6A41F00A3A@smtp.kernel.org>
In-Reply-To: <20260721100039.0E6A41F00A3A@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Mutt-References: <20260721100039.0E6A41F00A3A@smtp.kernel.org>
X-Mutt-Fcc: =Sent
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_045244_520950_9EA9F6A1 
X-CRM114-Status: UNSURE (   8.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2026 at 10:00:38AM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Low]
> Is this drive-strength value supported by the binding? The value 18
> doesn't appear to be valid according to the SpacemiT K3 pinctrl binding
> schema (spacemit,k1-pinctrl.yaml), which triggers a dtbs_check validation
> failure.
>
> Since the driver's spacemit_get_ds_value() will silently fall back to the
> next highest valid value (like 21mA or 25mA depending on voltage), could
> this cause an unexpected mismatch between the requested devicetree state
> and the actual hardware configuration?

Good catch. This pin group uses the 3.3 V power domain, for which 18 mA is
not a valid K3 drive-strength value. The driver rounds that request up to
25 mA, so I will use 25 mA in the devicetree to describe the configuration
that is actually programmed and to satisfy the binding.

                                            - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
