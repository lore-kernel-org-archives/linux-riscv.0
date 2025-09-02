Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DC8CA1002
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 01:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8/Ul/mnHFviKPhWt24FaFAdzfrHwFlt7ivc8mzVPik=; b=kEBkdbO9wApL10
	CFrzDeSA02ud0d+6zgAQ9lpq9iGiub1TbQpPAYMb0hoKdAMnl2i4IUIpBezP7gHbDpGJVD1TG2Fpv
	JqNR5spyXhW91juidJdaIY7V/cBLHbMfDqcgR4GxHUwoj6zzfjkLvLfvLPwYNsaI8KzDSUrdK8I+r
	LL9jLDoereFOIJXYNH/EyMXKWNMrghqfQIfhUFquyeTwKe65LO8pMhWI5iAzmFjdb9uHVMZ2dw30c
	cA1KXrrplg0fKN/yyuJjLlscTtJEProSHn7Jr6jJOTNXa6BO3RL1rSbtJzd+FgRnzTypfsT3Dgr79
	BtLNKFEh3NZZNrUDxCVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utG0h-0000000EjMq-3imF;
	Tue, 02 Sep 2025 01:40:35 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utG0f-0000000EjEz-2qLY
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 01:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1756777189;
	bh=Wx6uFFrlOYm1QT1WpGuIUZOo6tC3AIX9NR1xVvEN+A0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=wyS7bbF/5ngMZJsCNh6GJqibAtoDnt+jULiUPL5JUSqh87OfSYXTraJBe6L5Id7uk
	 6xDa/UDwM47trUZizPuSHMI25v0/TexfJanWZfk0Oi1tGzRX6eaRh394Yb8KV/GqYx
	 SXOiPD8cVJLeDC+rwzauYlF0vCAlKtis5ydVqo/c=
X-QQ-mid: zesmtpgz1t1756777182t6b1f51f6
X-QQ-Originating-IP: hnb0EBq5kdR38t0NCC6tWx42nt3/po6TjNAAMjiMEw4=
Received: from = ( [14.123.255.17])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 02 Sep 2025 09:39:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7662810495034026138
EX-QQ-RecipientCnt: 16
Date: Tue, 2 Sep 2025 09:39:40 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Mark Brown <broonie@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jinmei Wei <weijinmei@linux.spacemit.com>
Subject: Re: [PATCH v2 2/2] ASoC: spacemit: add i2s support for K1 SoC
Message-ID: <C855339EB347C5D6+aLZK3D678QUDB8hA@LT-Guozexi>
References: <20250828-k1-i2s-v2-0-09e7b40f002c@linux.spacemit.com>
 <20250828-k1-i2s-v2-2-09e7b40f002c@linux.spacemit.com>
 <aLAbk_0emidBCJBn@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aLAbk_0emidBCJBn@finisterre.sirena.org.uk>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OSUW9vQLVhiZ7WW+uZZjtQFz++ZsfmwhSi2kQzzCdtf93NABFspHbAHe
	Ft+CDeMgys9wMIP1zjKbh/1wu+UQ1azcgeJmIRGwZBZEV+yF3XZTM9eeruaO3jR0yN8HFUw
	RCY28ql0AfzX8Rl9XFD6YtoUuTZQPS5XBEV6nw/wPewmYIrKsUk5Zh5uD4nKQdFFHhnywi5
	Pnsi/S3d7+wNt1qdoJr1vvR2H5GcMfIWKlvlagECO97Pk3w4Y6Hu0jJ3RgTZ2AS7zUlkX2O
	MXpgddJoAl+F7FoI5r+yPLSLNk2xUoPuVaNfGTATkCHeje+2LsQu+KTgZq7q0pDoZdE4BnF
	z3fdBpJdLFtC0WfCXEF367vZs9tbjTH1g5gcPU9gAhPQesH+OqOBf9VB65OtZb1y4H9qQ6v
	PIEAKc0/9j+Mv6yk2amVYgkRmptIjcEuNE9KBeZb98MACzvRPRTC9Lgkk5Za7W9DKuGnTo8
	zCLIfQ3ysSfhN1hfm/1SCnoOWnJSLz1ShDDD1DzwlU0A7HtaLdWtmr9+1a3y9qLEXJ6/LoT
	MF/13eJIbqCqXjyrgW4F1naaORUTD2mPj24exJEBMXEhSuCCuDrW87T/ToKY6OsXugDVezq
	XXMGwRLZanPC/jOwtWzWPvxE1SdPfPo8NHgLRMIisXN/fJnRr6lqcWWwU4jiMcJwmLBuFte
	SmlGqErdzW/GlzTeXTKNyvgmKqsZpq3J9QHgBajeu7RxrRr+lFTGtbi+DfDAXaKpWSB27xm
	8+EZRN9jcgmLj+RDXJfln8fnMzpgTqMoTgreo2LERRMFmCBa0VAYZO6jDFqVyc9WsCVN5lI
	QC6z7kWF79Z111atkP5p9ZlGp5ETDy6pcJZXWWkm6/AcZVOgNbBIGDC5IvHMjN3k6pFLjGs
	sYdpRdZxtJwew8wD4iTxP8lBUZQbfPWVktXrUZW0ZF+g81t81mb8814lGD9gIIaTF3v2OiN
	qViL83Qd6pm8TP9KmwF8br/d0au7s61xY2PzfHUshQJUXH4Yc5F0VALKYJXcBdiizUkBSvs
	s9jEx3BXpnsG8pbD2A011hBLlWcJ3IxlKAjNOXeSJMEvrEj5I4
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_184034_162862_61D3203C 
X-CRM114-Status: GOOD (  13.35  )
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

On Thu, Aug 28, 2025 at 11:04:19AM +0200, Mark Brown wrote:
> On Thu, Aug 28, 2025 at 11:37:33AM +0800, Troy Mitchell wrote:
> 
> > +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> > +	case SND_SOC_DAIFMT_DSP_A:
> > +	case SND_SOC_DAIFMT_DSP_B:
> > +		cpu_dai->driver->playback.channels_min = 1;
> > +		cpu_dai->driver->playback.channels_max = 1;
> 
> > +	if ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) == SND_SOC_DAIFMT_DSP_A)
> > +		sspsp_val |= SSPSP_FSRT;
> 
> It's weird and confusing that this isn't part of the above switch case.
Thanks! I'll change it.
> 
> > +static void spacemit_i2s_remove(struct platform_device *pdev)
> > +{
> > +	/* resources auto-freed by devm_ */
> > +}
> 
> If this can be empty remove it.
Yes, I will remove it in the next version.

Best regards,
Troy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
