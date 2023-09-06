Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DF3EB8FAE
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 02:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2K7bQQK6k7257AUzX5UkgrkoXDahCAkrgUH/YThhQVI=; b=s190GmucyYREfD
	EVoLsBHxUjyB+yj/RZPJEYuJRsiBm6S0vEx+4235948WEnXNU3J4mzycl0MWPTeRTnHwhIVaC+qss
	QnH7JrmeAEOHImfqn5vY98krYH/vWlB0M/zvgItBTs9nBW45SdQUBIlygNhWU6C7GX4tSLkiWCDMe
	NJzPyeDX5rcjNRxIYKCFx9PfKztZ0fRLUTPx9Fp+HvSUBbcN6ZB/mR98Afdmv79vua7dKSj9Lqxdr
	I0S9H9pjwo4ZJ+zNb/w9K8/RkMD38UqaQnCh4AkMooGHFi7kNB1u5Wt9Niu/mWWEpQX8NGnwZb3iI
	umYMPtoyK10c5o8XtCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdiZQ-0075u7-1N;
	Wed, 06 Sep 2023 02:47:08 +0000
Received: from out-213.mta0.migadu.com ([91.218.175.213])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdiZN-0075sn-09
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 02:47:06 +0000
Date: Wed, 6 Sep 2023 12:46:19 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1693968412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VHfD1siejuFfvAeKP3/DP7NOiriyePjucPZcxImIuXo=;
	b=htl8/RL+wFkHtHTJephAZFm4zLDHo0zIzf0usoGMjPKWHxg8GtY90XbJxlS1RAQ9d5BzaK
	gKYQXdUxTmKcSf/grLIMwgYUT722diAQXj9AkJYxmmmqNjURvVtpSI/XvjsayXE02gzUzI
	ialFsaH4oxyF3fTj7sOrgwhTdj1adRWzMns7Q5fOOGV7EaHL6RJVg5SeO4n0476Wz7ydy4
	I920EyYh6j5yxQUz88m0ioNX9vgSj/j3OHx7MLNYzBlx29Gl4swFZ30fI9S3eb31JHC2FW
	XIXzuYww44oqx6a/u6EGtCX6y4XQJyiRtSx4vgGgVb0uTzs3VzSY5JSBDrVRHw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Aleksandr Shubin <privatesub2@gmail.com>
Subject: Re: [PATCH v6 0/3] Add support for Allwinner PWM on D1/T113s/R329
 SoCs
Message-ID: <ZPfn-0OAL7-3DCmt@titan>
References: <20230824114038.891493-1-privatesub2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230824114038.891493-1-privatesub2@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_194705_254160_FF7AE72F 
X-CRM114-Status: GOOD (  10.38  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Aug 24, 2023 at 02:40:24PM +0300, Aleksandr Shubin wrote:
> Hi,
> 
> This series adds support for PWM controller on new
> Allwinner's SoCs, such as D1, T113s and R329. The implemented driver
> provides basic functionality for control PWM channels.

I have tested this patch and earlier versions successfully on a Mango Pi MQ
Dual and verified it outputs a PWM signal.

John.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
