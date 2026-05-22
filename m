Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8568FCD5BB0
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 13:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uSdKy3Xg1SIvXRjpTd8mUivUdvYKWJEssyr9u3spjA0=; b=2wlOt0DX7nSZLL
	4Ly8wpi5XMbZOjZnzXRVK8DAFIoKd7tnECo/XRHTgwlGdmPTtl1AuLEtFGyWJwuqbKxdxbZxg0YtK
	CZdIX/OYo0PEnp6Q/IU4G/QKccJVv74ryOEks8cpc4hrr71mP6GyqCnRzqFxOQtzTm0hQmgmUH5d5
	OTLLrA8b0+1ZnRPXKw+pF9trxyaesZ9o7jhK2mnipEQlY2l/TULvjZUA8NFQTjwubbmDd1Vk7zke/
	zK6Fi/pOBS/7cLC5VKtk6vRWc3zLSL8pRP6Yl4MPIGbqjTD6r8iQgcS3qVl68Q4hRxUJ05gzfI/e2
	r1up6xcC/E/3xUKTJccA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPm5-0000000AvxI-0nyf;
	Fri, 22 May 2026 13:18:49 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPm1-0000000AvvG-1WhA
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 13:18:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779455879;
	bh=4RACIIvqwwKv5OCUQdl3TRRl83JS4BtgYtRCpIVcu3s=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=pIKIhg09gROL4RrM6IF9QMiAOTuibpCjCOeDLpcmw/qk9+NlkEVtpXr1DVnpoxGk1
	 d/TSAkY6lHswwupW1gYVxg8DHHM2hpr/orzJsnXx2qDmya3jF9vWhG7gIvYYlc0WGe
	 Z9gsJa4wle7rRHHfFUWiYp3tU9XHrUZHgbv8o6t0=
X-QQ-mid: esmtpgz12t1779455870t569a11c3
X-QQ-Originating-IP: GqlVLBy8xuQxz5FB5yHZfEci69R+BINM8B+fRDdGZKQ=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 22 May 2026 21:17:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3995857162579613603
EX-QQ-RecipientCnt: 11
Mime-Version: 1.0
Date: Fri, 22 May 2026 21:17:47 +0800
Message-Id: <DIP8GKFQOKZL.9JA38OXBFMIA@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Mark Brown" <broonie@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Yixun Lan"
 <dlan@kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <jinmei.wei@spacemit.com>
Subject: Re: [PATCH v3 2/2] ASoC: soc-pcm: constrain hw_params when DAIs
 share the same BCLK
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260518-i2s-same-blk-v3-0-2ba1c4f41db9@linux.spacemit.com>
 <20260518-i2s-same-blk-v3-2-2ba1c4f41db9@linux.spacemit.com>
 <be91aacd-2e02-45d8-9293-e9551f688c68@sirena.org.uk>
In-Reply-To: <be91aacd-2e02-45d8-9293-e9551f688c68@sirena.org.uk>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mi0NhBPPe/4RLI2RuIhAfkCN6237JtruPC1Y0HM8JNh081CTP6BFBOEL
	B5EWbccDmtX38n7OWDfXe8sS0RUyC8XVsqq6GeuGIiHIW6BvjnchrXUAZ/icvRiyeeP5aGB
	fjq248nWBYALBn51JlW/cQMJ1UWaFu93f3hKEoaUJ59plpj2u++hAu1N7rc3CsBQrIE9wYJ
	yANDhlWsIR2BplIgfx3YMWvIMsGMdYThxc2EXS4gYZJPJJufPtGvnwErLOSnH/FZzYzs1R6
	PqkS6Eg9oasO5fuDizzAu9YS+MK+Lv1UAoJiaGFfLz5xBHWhEIno5kDJ8c2ehY2IF9wu5OV
	cwbPhgLkzHFawxtAzDYMc7UTW0wrHGEpGWEQc9uzfM5nxgUYPCv3yvz8mb0HKZN/AeVEyec
	y2nlU5RgR7LreONWwux8/SunxpaeRikBBwehvo4+qhuetbbOW7tOXUcW7zistLXqy3zdwCP
	R/PT+WDGBDj4nBUt8RRAMVC7xkZ9NEvhIW19ustPrC+ndhs0X8lqq1ud/y8ysvQrxId6SwA
	npsi6JMnTcgH2j8Pxl9rlyasjyqbU4Qqh8YCOzO2R4cRhXlG2i4DCjKo70nd9X8dc6oIw/p
	LKz8KIR2zhFoSGX8xT90m+ksjvnXUEfeswpi9OZScTKN7eO8ymFAdMSv6pINKVOtOU41hoD
	MOjOF5dcRcCIkGZief3tIu65E61hoDuF8XH45nN2SfbvPp+sDcvs/AKDvYsGa5WbAcK6WJN
	ej837wLU6yyz4whksGCa4wvn17wFZ+7w8T7dQjkD8Of6M2Rc1zjB/yH/ZxVKlYkcK4zUpAz
	RV64P22cbjsorrDoWwGkdzl18O34MSvRaWfhOvijADX7/D+KwhXYbK5GG4m/KdMSZWx4jcr
	r/YUuBgf9aR7SxxfzXVg20eTlHBKq0Dmmu6P+ZXBQ+mGnUFqxc595UGrREjJ1J1dpKHeURX
	ObpCMf/cCAjXpQYHhovz6Wiu/vSDgo+lFu0aQLp0YoG2pRq1Ahjpqq1EFuvCmUTxOYZXhTR
	vt0oIO5jLOs5XOYFSzqDDCcRkXur4TDOBry27nIRscYYSIT6HIqBAcgdtJAyIa7LniwZpeP
	8HcjL+9xNlb
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_061846_269370_E279FBF0 
X-CRM114-Status: UNSURE (   7.71  )
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

On Fri May 22, 2026 at 8:58 PM CST, Mark Brown wrote:
> On Mon, May 18, 2026 at 02:21:09PM +0800, Troy Mitchell wrote:
>> When multiple CPU DAIs on the same sound card share the same physical
>> BCLK, add a hw_rule during PCM open that constrains the sample rate so
>> the resulting BCLK rate stays consistent across all sharing DAIs.
>
>> +	/*
>> +	 * Protect the rtd list traversal.  No nesting: this callback runs
>> +	 * from snd_pcm_hw_refine() which does not hold card->mutex.
>> +	 */
>> +	guard(mutex)(&card->mutex);
>
> We have helpers for acquiring these mutexes which deal with some lockdep
> issues using subclasses.  Either use those or provide whatever's needed
> to have the equivalent thing in a guard.
Thanks for pointing that out. I've added a local DEFINE_GUARD wrapping
snd_soc_card_mutex_lock()/snd_soc_card_mutex_unlock() so it picks up
the SND_SOC_CARD_CLASS_RUNTIME subclass while still getting scope-based
auto-release. Will be in v4.

                                      - Troy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
