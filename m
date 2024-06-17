Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519DBC2BA1A
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 17:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6jIBFW5fjJvrvlNm2O9bJ2ZePuDTBb/+rKL5iTq/hwQ=; b=2yT7eqWwOPEF8Z
	EezlZEmQScXX/El9gsU2OwBk9FpVgYUh8EHZ/h6TtI3n5sD7P09nrFqD26Oawg8pxy/iWcdEPY4g4
	zMRYWzdHDMnIwTu0dpTRSzlL9B68LSsNQegRkOSGfh0dfPqyOXldqIVlzOsRbTiuCHmHxx3LldJbO
	5vOGPUfr+ZZYn7rTvKNeKGy/70lzxJiC1vkYgrhXCLm6gkp7GF7zpZnLPTQ8kvBOV0T4l/z420aaM
	GmgOgA8obXVEBKQgXmXqrQz0N2kwhoDWyHpYkkaFdwSlL7unFiSt97PeYLm0fic7Xygvn3G5tBvkF
	qy9ZFf8nJrQ2jHljm1yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJGNw-0000000BzeJ-2zbh;
	Mon, 17 Jun 2024 17:43:16 +0000
Received: from out203-205-221-221.mail.qq.com ([203.205.221.221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJGNq-0000000Bzcu-0MhY
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 17:43:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1718646170; bh=lSfFb7+k557rhRi20IR9VIL7t+SDEJaWgmE3dAg5WgI=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=SAhK5VBde2T64fNrLWvWccGoLTP5DjkcfUz0ZB/GrM3qrz4O5datINT8YmC+OUuH6
	 k4UT3j/hqitidSNeSaqcIrvrlBLkgA6L0iMLmzk382HvTEuou+HiBMiAnZIKJxafTl
	 Tfmi3lIlTXpdx1HEAP9iGyZpQ7PhWk6qiU29wEAg=
Received: from smtpclient.apple ([2408:8207:18a1:9700:9c85:7ae:3ee:45fe])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id AAE8FC0D; Tue, 18 Jun 2024 01:42:46 +0800
X-QQ-mid: xmsmtpt1718646166t17e0u07v
Message-ID: <tencent_53226D39C76ADCAA1883109DC6213E5EC107@qq.com>
X-QQ-XMAILINFO: OKKHiI6c9SH39YSGtA2DuQ1+IsvjerQWoRzDVzuacvLBMv26KpHergvu9Ti+QK
	 /xNryMTLRsr8MZTplkDQJXfxq8QGCo8ChBXf9pacuNdnNyVHnUbSNdzDWvHBL7gyO9cDrAf9b3C+
	 6T6VkSaIN6bsywuMTy/hVi3HP15/6mC6EK7en0iKYX8jD+bTYA1Fgg3aaBUIVqZmAoOj9II/vHHT
	 4GlKtbgWE+EgBxPMJz6eSXSiTE67eItWvyUqLhmsV5FItVlhZrzP1LYHkR8J4qQCqWxeR6NIekfW
	 o9gJNfmfeyLY6+qaHchOK9iOsqoTdv3CjeK2a5ibIenncxr/W1xBqas9nUomJ5u3GKe5OsMQK6wB
	 9Wml9CYCTvUO5b89aVue/R/csfWfS1s5qkgZH9YOskAevqFkKnDrrzlcfFEDaQbdsUIWhKVM9iar
	 QiQMb/PHK+1mWIRM6WBjQVNR7NunK+y0N5skHnJBKV1dapCuA0ckWctCMuwZAEpvrE6LcBMi3Mfh
	 +MDl//+Lvazr71vT/Tmshup5BkGPIS//K43W9gG1W6JlfIf0ylof7Pbdr5FDNE++PJCeRGPihUOT
	 Ak/cZd5ZjcYO3dq37EfkDPce8ANQITJb5UPsEvxJeRWhS1wl/6EeMRdX5v/8WGr9eyM3Ej06MCQO
	 aw65nIBCfE8JW1Ho+SAmMoK48KG4KNu7zlZqtthvwGKmFTb9b3rvO6AB11LwmcXfbwNzkAYNwoko
	 5BlHPs+P/Riv8eWtuITwmDDTbNrskgGMHGFzRFplLs+p6QuFOxOsLa4WOo8SoHvPwkRrcWIDyGM/
	 x2EdqohEPCOf07CDnBGmpEvil6/gwwBj1T/52EFZGI33h9XF/sMHNoNSfR0q0JvP0JOFAAsFF8Hy
	 gSuy5M3KOyZHWd2d01f659w5pDisw7yvgaVDQ7uqID/Xj70xCwEuQ/AkTloih4Vau0AtzVhGrqcJ
	 EGV6P6W5HkzVuifQxtKL9+79zXfjAdo+ln+NRBSXbN1MA7kcUqBYipJa+jbAn8svfXwzIhp1U=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v1 0/9] riscv: add initial support for SpacemiT K1
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <20240617-connected-avoid-82f0bdc05cdf@spud>
Date: Tue, 18 Jun 2024 01:42:34 +0800
Cc: Jisheng Zhang <jszhang@kernel.org>,
 Yixun Lan <dlan@gentoo.org>,
 linux-riscv@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Anup Patel <anup.patel@wdc.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jesse Taube <jesse@rivosinc.com>
X-OQ-MSGID: <99CEE9EB-EEC2-4538-9378-D9AAD8CD240B@cyyself.name>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <20240616-exorcism-computing-e11e26084a62@spud>
 <20240616224811.GC3983622@ofsar> <ZnBEBQjTQtFs-fXt@xhacker>
 <20240617-synapse-carmaker-0a59c7c6edb7@spud>
 <tencent_26E7381EE1F6C5188428359AF3F908CA680A@qq.com>
 <20240617-connected-avoid-82f0bdc05cdf@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_104310_615674_2008A4E3 
X-CRM114-Status: GOOD (  13.56  )
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



> On Jun 18, 2024, at 01:14, Conor Dooley <conor@kernel.org> wrote:
> 
> On Tue, Jun 18, 2024 at 12:39:30AM +0800, Yangyu Chen wrote:
>> 
>> The vendor uses a special intel pxa uart driver, marked deprecated
>> in the kernel and incompatible with ns16550. If we use ns16550 in
>> the dt, the behavior of uart is like the uart has no interrupt and
>> stops working permanently when fifo overruns, making many developers
>> not know how to start unless they use the SBI HVC console, which
>> needs to turn on CONFIG_NONPORTABLE.
> 
> This I just do not understand. Why did they use this IP? Is it free?
> Did they use it before for something else? It's a rather strange design
> choice to me.

I don't know either. However, PXA is a subfamily of XScale. The
kernel also probed the UART as an XScale. So, using XScale compatible
string is OK.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
