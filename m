Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0118DE784A6
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Dec 2025 07:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cm2Zax6c5kyeCWItSS9K9Hi/OkcwhP0lajYgNT37XGA=; b=Fi7bJOvzIzxW4p
	5gy69GdPx/G3nrSQyuwS+aKTXYgF5G9qPsrDxVGO9WyGyJX9s70886aqfNOBsjCiIoQQ5SGnQV3Ax
	NmHcnrUnQsptVMIXHMvUYt8GvuB8Xk4qfpKWesUTO4UcDcWa7TTp9xCHpoE6XT+JfOHONnmJTptW6
	fzHsjXYOvoIyWtlowXEozTAeuxSto23/WUSq8H3Wd9rFCAzJZRXreYh+Q45lHeri7Kek3j6u7dIL2
	rVeR9h+GUB3BCaKMokQBGhLmS48l2Plk2PhojrBvsceCTTmSKuRNEfWWxvfIoyz+J6lzjW5u/CONH
	IAKVP0BEk5OOlsvLzgSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYfSF-000000009xx-1PuP;
	Thu, 25 Dec 2025 07:08:11 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYfSC-000000009vz-2bzz
	for linux-riscv@lists.infradead.org;
	Thu, 25 Dec 2025 07:08:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766646462;
	bh=WQahqT1T14f9AEri4m6AgEL6eE2ksV0PYPoD24EWkJY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=W41aODLGr/RM1n97KVI7K6GKXS4XHjvFojO61kU/V0FKFcXDfZQUsZuak4G+mEpsg
	 Ks/vuv81bGt2LYhfxmiJqAfFr7lE0mxa4t2OO2Xpu233c8wqcCtOddCMtDKuQhMjKB
	 7IKVOLmVyJ7QqAEImCYMEqiGv5ermj/x8HR+ZBcw=
X-QQ-mid: esmtpsz20t1766646456tda004313
X-QQ-Originating-IP: 4hfJ50aJrTyB36UCUQrb27WLy3tNtjF32BK8e7hmUz8=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Dec 2025 15:07:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1149935882015170328
EX-QQ-RecipientCnt: 17
Date: Thu, 25 Dec 2025 15:07:33 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yao Zi <me@ziyao.cc>, Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: spacemit: support I/O power domain
 configuration
Message-ID: <47781E30EC71C60F+aUzitZG78aGBxHOG@kernel.org>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>
 <aUpirQFWf3w-5PQ2@inochi.infowork>
 <B479B24A35F8D731+aUpl0JdKOziIH14S@kernel.org>
 <aUqTH_fis1-g42SU@pie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aUqTH_fis1-g42SU@pie>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NPR7uEA6bBhoIN2duqPMQGd/RUtsedVkMTFHhnewZ6ZeZkV+AVO3mvA6
	us8SrD6simzAQvZb075yfrdTA8kwlMg891rOtJf6omJLT8RqAxU3NBvY2KIqH841McIFnsC
	3UZMThkQrfwHuMgBO1CdtdyxxhkfRAra75Oyy4JFH6rYW24bh13VvA8ktAsw2GPCpcr2PjO
	HBN+1eSvvTpD4MRgCNi/j2IBuWlOrv4D217qCZIhyeqa7+OSZSLgJwWj+8JweycsCeM1BY8
	wA/lmtCbJnNgF88Fje06Ji1kpCCDNNc4E+Z5jinZHFkv6Z98V9Q9+E5CNJpdje+UBPFhH/J
	eXwVGZoVoSjHYaZENkUcXH2WYtLMV8NPasBPUBlKvGviidrqNrqOE/XlrxV65qutpRvciUl
	QnBZkbop0QrSVZYLkeIiNFZlJKzN3fpj8z91z7CY/bsejvoYOabkbMhgXWna3ju1FVq5WSj
	TG2ofR2BEBpgpIGaY0Pm3Z2M+MWtX52zk4ZgoFnHdrk5U3fEkbzJEiamIbnx2ppWzLql6TJ
	gcEA4AYwPpiM5ryhjBmNUsbKLCi6xHS6KmuCJ6KXGW6rocNNr4P8XQv6fgnM/JYC2+F1bPk
	8KmSPlYUR1v9rUysoeTHqxEAq5PgNYRK2P1ShAa+qVhd6IzcGLECdMO/FFMcnwkngZx1wnw
	rHXQHrTJbcOMDnGiktLftAv/5QczG+AdqvEKdjC1lloPR3NC1fukvqT/r6E3DSsXqlBx6mD
	1GA7FjV1okKwAfGhXzIqBVCX7ukb2ulZCNkdROrT8DxMH6supwKdaIfXaWkANgD/+8X0OM0
	RAPOy2siyYAbOZ82zHYMKL/iYkPERuuvaRaFr4Q648yNo7eWZuLPTak5zLR3qAHjgsu0+oz
	BC2kFQDz0R1jUfoVL7hRzRzoEQ9hjvLHAv+vAWzkVhuIAqqfUcPiGEvYgBFmeMqcDH1OG/U
	SOnjsalKIh8r05DHtdd2PavF/rcBOCNbYhcJkR7mrCfWKBuX8UvcSCy1X3zLWEduaybcK7a
	jnKknNzUGf/W1uqwjZ4pXsG1SMUHsWlIFdtO2XNHyPsf+xGcCe
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_230809_695536_EB4E104A 
X-CRM114-Status: GOOD (  28.58  )
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

On Tue, Dec 23, 2025 at 01:03:27PM +0000, Yao Zi wrote:
> On Tue, Dec 23, 2025 at 05:50:08PM +0800, Troy Mitchell wrote:
> > On Tue, Dec 23, 2025 at 05:42:26PM +0800, Inochi Amaoto wrote:
> > > On Tue, Dec 23, 2025 at 05:11:12PM +0800, Troy Mitchell wrote:
> > > > IO domain power control registers are used to configure the operating
> > > > voltage of dual-voltage GPIO banks. By default, these registers are
> > > > configured for 3.3V operation. As a result, even when a GPIO bank is
> > > > externally supplied with 1.8V, the internal logic continues to
> > > > operate in the 3.3V domain, which may lead to functional failures.
> > > > 
> > > > This patch adds support for programming the IO domain power control
> > > > registers, allowing dual-voltage GPIO banks to be explicitly configured
> > > > for 1.8V operation when required.
> > > > 
> > > > Care must be taken when configuring these registers. If a GPIO bank is
> > > > externally supplied with 3.3V while the corresponding IO power domain
> > > > is configured for 1.8V, external current injection (back-powering)
> > > > may occur, potentially causing damage to the GPIO pin.
> > > > 
> > > > Due to these hardware constraints and safety considerations, the IO
> > > > domain power control registers are implemented as secure registers.
> > > > Access to these registers requires unlocking via the AIB Secure Access
> > > > Register (ASAR) in the APBC block before a single read or write
> > > > operation can be performed.
> > > > 
> > > > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > > ---
> > > >  arch/riscv/boot/dts/spacemit/k1.dtsi  |   4 +-
> > > >  drivers/pinctrl/spacemit/pinctrl-k1.c | 131 +++++++++++++++++++++++++++++++++-
> > > >  2 files changed, 131 insertions(+), 4 deletions(-)
> > > > 
> > > 
> > > > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > > > index 7818ca4979b6a7755722919a5958512aa11950ab..23ecb19624f227f3c39de35bf3078379f7a2490e 100644
> > > > --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > > > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > > > @@ -565,10 +565,12 @@ i2c8: i2c@d401d800 {
> > > >  
> > > >  		pinctrl: pinctrl@d401e000 {
> > > >  			compatible = "spacemit,k1-pinctrl";
> > > > -			reg = <0x0 0xd401e000 0x0 0x400>;
> > > > +			reg = <0x0 0xd401e000 0x0 0x400>,
> > > > +			      <0x0 0xd401e800 0x0 0x34>;
> > > >  			clocks = <&syscon_apbc CLK_AIB>,
> > > >  				 <&syscon_apbc CLK_AIB_BUS>;
> > > >  			clock-names = "func", "bus";
> > > > +			spacemit,apbc = <&syscon_apbc 0x50>;
> > > >  		};
> > > 
> > > If you insist on a new reg field, you should change the binding as well.
> > Yes, I forgot to modify the binding.
> 
> This will also break ABI compatibility with older devicetrees, I
> strongly suggest against a new item in reg property.
> 
> Furthermore, it's unreasonable to describe d401_e000 - d401_e400 and
> d401_e800 - d401_e834 as separate memory regions. TRM claims the region
> starting from 0xd401_e000 with length 0xc00 is "Pad Configuration". So I
> think this separation neither simplifies anything nor matches the
> hardware.
> 
> > > This change breaks binding, can we use something like <0x0 0xd401e000 0x0 0x1000>?
> 
> If the TRM is correct, we probably can and should.
I have double checked. Inochi is correct.
I'll fix it in the next version.
Thanks!

                              - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
