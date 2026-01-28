Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E63D35697
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 09:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhQ9ldrDOXlyv1YCEVeZDPYpZZe9dl1KR97wUYdAucQ=; b=vzexd3rSN93hbv
	Z7ATQPcKbP9EwnL2+mDkDO5dlwT9qRRZi//gKAkVMqvSi4TjfV4EYjm+im/NbZct4i05BNKJigReX
	4yL67LSDsRFyVpYUEcDp7vVHPfNb5TBV1tZCC6RVcrDB0tKrIBgn5raMpgVacieqYhDpq5gH5GG2O
	4KqEP8LvihWGNZ92EbLRbhUsbYAy/H28N7B7rqluFL5Ha3aLmrvye4/tWeevRhb0I847y9DvXKAGS
	O3IRmV0HFQp1o3stLDcjpynkDPUBS3oeX0znaDy7c2LLGPakCTza/GLHneJSyqezLQYvU0vkH+M6P
	Ok/J7n/RNftEzZcU7kyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1ve-0000000FkrT-0Kx4;
	Wed, 28 Jan 2026 09:33:38 +0000
Received: from bg1.exmail.qq.com ([114.132.64.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1va-0000000Fkqh-26Ag
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 09:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1769592767;
	bh=YqgQ7XTWnwiLqJRqmob5IA4FpJiapKMV3EHIEwmKLvk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=ZUGWTyM8Me+1zINdg/FP/yCjoNE8+anpE72BrxAcA8kyh9YZh75xWRTWmrXGHfDDi
	 hVJiGgtySfMegzlGyVabx4Re67DuHIDMvmwepRsbBG7y9UfdfNWLkCqRF+oD4AoQzy
	 mL6YDYSv75/9Rsx+wQD1C3KoEd8TP5kPkg9a8Gd8=
X-QQ-mid: zesmtpgz6t1769592759t9b968819
X-QQ-Originating-IP: wSV2IFKiia32OYtniGlD6DAAqZvlSdHLzBCZK1/Wp0o=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Jan 2026 17:32:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 319744168602380696
EX-QQ-RecipientCnt: 11
Date: Wed, 28 Jan 2026 17:32:37 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Vivian Wang <wangruikang@iscas.ac.cn>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH] gpio: spacemit-k1: Use PDR for pin direction, not SDR/CDR
Message-ID: <85EFBB88D70FB64F+aXnXtS35RG_U6MeC@kernel.org>
References: <20260127-gpio-spacemit-k1-pdr-v1-1-bb868a517dbc@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260127-gpio-spacemit-k1-pdr-v1-1-bb868a517dbc@iscas.ac.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MKzYG8XJzx27luHda+8viI9Zbcs2SNIwmBWR31bLVy7d4Whz+EeimKQt
	21JWgfTV5aWJfNYrs5hIzjlbfdFAJNmO+kKSWq3c60VgLJHpKNvj/jFVe6kftITNL9bkrAh
	031kqQQnf5Vhxi3kBExh4upNU2DFx1WIeRKDwlrqEIz8QlygV68APMK8C2OC0UAfgxNWwbO
	sPp6MqDF/InNLzc++z/7gNJV/aeqij3+f7Y0rDCiahKEr8im+QQRY0tO5VUt6dVwl0ecErR
	KWHwpQ5W/StWgR9OycHFys4kgXX334Rmwl/iBzRkwcLCUbC62DchViSXVJMRFe8x3nRxgbW
	DyQAe2Us1zdyIAiLRDwvR7C7yn+i/xqXVjsSLkf1oMuJixziWdq2WxDQ9ZfK29DVVEvtswP
	/jxjeXwtGtSO3yk3rnPA/MXjPm5CtRz8PAHpLm5xU9qyj4NG/gzQVV0JT7Aa2AEJPdely5q
	L1HcvJjxfT05s7vTJVC+uQwG/tXx1SGd1K87xneFERYV1C0xHcnCcmphRRas8DZ881gQ7WP
	5YqU8bWc1CNJwdHlFDqmLwwTnNIKiVyHhOJ+jq8jWYJqPogcdGQU54tl0A+mYt+APwZrgfp
	zgLRjS5wug7HeWw3DIFf5EVgWECmQ4LVLqSK5X7+dwGlHMLu7FYFz+KVNyfIHGR+CzzhuFs
	nH/8GrZ+hPgKqUe/n5VyVWzbyaYYGc486b+YpcopQYW6wlBDHVz0wl2oFSjQZcgdcYWd5rj
	lxW3ze0k+PCUwGoMw1Rs9uzEYEKqmTj7j4HiSI3SOBLKqROidZRfe81zMtFOBBDouxSfgfv
	LcdZFmGEEr6p8fAZKOJyGuofmTwVlvsVp8yhGJoaZMATVAwWbHdNrNpaywjAlUbN1szajyq
	jcHthvKySi5BJnEHuqBvAYTYYBYTzq4WQlHasIQBZ10SX0BDH/91Qd7Tu1gw8NuiTKMCkJ+
	km3W2kirXQ4MM+htGZRNlYwQya+JooAGecFIQYluhTuImB988QCv65howFD81CQwOKlJsda
	YX7Tzhf2G9oUIV5+/UX8Hwt8RKUuSQXLQkAKl7Zenog5UTi3vdWYnzwEvX1JNbE3owAbzLj
	3n/Bb4AsiRB
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_013335_384267_52673C25 
X-CRM114-Status: GOOD (  13.80  )
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

On Tue, Jan 27, 2026 at 10:58:49AM +0800, Vivian Wang wrote:
> On the SpacemiT GPIO controller, the direction control register PDR is
> readable and writable [1]. Therefore, implement direction control by
> using PDR as dirout, and don't mark it as unreadable.
> 
> The original implementation, using SDR as dirout and CDR as dirin, is
> not actually a supported configuration by gpio-mmio. The hardware
> supports changing the direction of some pins atomically by writing a
> value with the corresponding bits set to SDR (set as output) or to CDR
> (set as input). However, gpio-mmio does not actually handle this.
> 
> Using only PDR as dirout to match the expectations of gpio-mmio. This
> also allows us to avoid clobbering potentially important GPIO direction
> configurations set by pre-Linux boot stages.
> 
> Found while trying to add PCIe support to OrangePi RV2, where the
> regulator (controlled by GPIO 116) turns off on boot while some other
> GPIO pin in the same bank is touched, which is not desirable.
> 
> Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#18.4-gpio # [1]
> Fixes: d00553240ef8 ("gpio: spacemit: add support for K1 SoC")
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
> Tested on K1 only - help with K3 testing would be appreciated.
Confirmed that PDR is also R/W on K3. Thanks!

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
