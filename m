Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A08EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NWw9Sx5QXtswS3YNLbfOfOFyKziZ4Cr8w1zR4/FVj3k=; b=pHA8R+8AstTAaR
	kqq32tvftdWI08GWx+vMKdYBfh6Z3X80oxHy6BQv2IEjiNTXPAkyAFT2rex4ASlGFloAnNkyTtHEd
	spRbA01/1sQcwLzyjtaPUZddXkGf7WGehaT6tWwmvdUPiphXqq6uXV6O/sIHq6sXdk32B0pYTe5eH
	jldxgYeu0KBPftvh5PzQSm3PV4KaT+eh9I5sPM0ojAQRWFo38jmbt0Jbixx1b2ecmhYxGmPj3gAsa
	XS+eP5Zv1EddIzaXcDkfwMljgdKWMubIQxiwop+o8AbVHpxjgsIIjBrxZae+xzjh6g/Y/9sVW2eLo
	WPIifwHBgLFofZjiWMwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0if-005lJq-18;
	Wed, 19 Jul 2023 06:31:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0ie-005lJ9-0q
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=30q/j1MQT4qtJOvwBOYcXWTJPTqDu7jZJcQei2p4I7E=; b=M7XxhKeishgYGjrQFKwRjrgysG
	twSBPwLuozospZYPXECD1L6XO9eISTvK4dccDdiEyKabbeEVI9i9lG3Y105UlmRL26cNmcBcgIzG4
	OSbeNh84KEh6GfMax+WdKvG22z7NqxlwfSvcF3U5vLFl0pA1IMGDQ3hDCegq6M33TaEUAMapnS60g
	ED7eQDKgDO4jt7LX2qRZsMsdXgvpVN7tBfNX4b8arz9qjM0kRyE5RINfVIRMz5fnBXS+o5cSzAWsJ
	Z97CFahEsbZJUg4Qz1Husr2+MZfgtQDHVW0bm30x172yolRqtrO5YRof9KCcp7X/PwHHLXK+unO1P
	M7Zu5cJw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLsyM-00C99Q-1j
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 22:15:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5E35F60C73;
	Tue, 18 Jul 2023 22:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165B0C433C7;
	Tue, 18 Jul 2023 22:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689718505;
	bh=2Eab4SU5ZrkW5P4w373zamoOL6oOuQGhERItFpuL4Qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RGdExfIIdbIaKLN73wYPRyKRQClz5N8LUPwGKnCMuMIUy/OAaP18ydXCF9/dkWpzd
	 Yoxr8g5QlT3kLegkUbqdOGNOjDY4SjZpFs8YsaBq4m5GIg51lUvXbNdskPo1u6AL1t
	 1OfqwhmJWMth4hek8k5MfHX0y2JYQcUX4Jk/dyB7xYzLPMhAd2vhDub6bEPEEEcZhg
	 Tg0gR2toTaqcydGkviD13oYaVPKlIp+CG9vNVt7WTcZNU30bWmptnus9jgmLkRzgql
	 vQYAsDE1CY4ydj0TTx5BQnlLXH7u53pql8p+WJrIkLg1n9A89YYc+ZNUwu6mhzycXQ
	 Q++KD3Yc6rI6Q==
Received: (nullmailer pid 2035108 invoked by uid 1000);
	Tue, 18 Jul 2023 22:15:04 -0000
Date: Tue, 18 Jul 2023 16:15:04 -0600
From: Rob Herring <robh@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Jookia <contact@jookia.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-can@vger.kernel.org, linux-riscv@lists.infradead.org, Fabien Poussin <fabien.poussin@gmail.com>, Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 0/4] Add support for Allwinner D1 CAN controllers
Message-ID: <20230718221504.GA2015343-robh@kernel.org>
References: <20230715112523.2533742-1-contact@jookia.org>
 <96641e09-c676-2702-149c-885002f45a64@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96641e09-c676-2702-149c-885002f45a64@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_231511_278770_CCD65030 
X-CRM114-Status: GOOD (  11.73  )
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

On Mon, Jul 17, 2023 at 09:00:47AM +0100, Ben Dooks wrote:
> On 15/07/2023 12:25, Jookia wrote:
> > From: John Watts <contact@jookia.org>
> 
> It would be better if you sent your sending email to be the same
> as the from, I think you'd technically need a signed-off-by from
> "Jookia" as well.

The email needs to be an actual person. 'contact' doesn't appear to be 
one.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
