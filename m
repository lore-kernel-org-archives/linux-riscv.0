Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A24CCD1BF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 13:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qm7+Bk3CFZpLENik92vLSUo4JPz7IXf39+9CTHe4z5I=; b=IZPtWEkic4peH/
	ZY6Wall3qCG216RZ0uNcDeRZ5DQ6aYVkvRpLDPU1hlDLJ8PSLnQPQ3eQ1O4nqXu+rk2xrrRgM8Rti
	pNJ4CfhKgXJjT8c6JRNt+eROqOP7vh0v4KPE55kMHhaS6XA4ELUaYAgOaEmdmg+vis98yr1lDamgZ
	oOV0t0Q+8Xo1jzdvNizZqnZMto/bYfR7wk9gWsyxxfc3ebOXLtNsGHDMf2Cj2n8AjHXUOHeJ0LrOn
	5XuatCVM0Xl6DD+1nYjX1q/opsCVdYxWdUOpLjOXJYHXlWWeqi2GccRKSEH0oH+klxqz6AlOFkC6n
	qdf5NAd6wwXFSHFEqLeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDjzV-0000000G19F-1nUA;
	Tue, 28 Oct 2025 13:44:01 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDjzS-0000000G18D-0HdU
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 13:43:59 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5A36925E06;
	Tue, 28 Oct 2025 14:43:52 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9W7edxZGJM9z; Tue, 28 Oct 2025 14:43:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1761659031; bh=0eCX2hzh9/rOQP2c5dwLPKKJYD0q5MTnLSDk5aNZX9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HGrqsDy1K11pC3XvY+UZFFi197y53VLfS+CJS6xLRum+crvECeY6OPwkQBtfYtcOh
	 GcPYq9q3DZX6yTZZlQTTMfFQngnCXPBt3Gndm3D17Ns4SK64RSz5lQuv4KfcQ/cwAO
	 ewuXsBpwxr603WwRlQQi6qNeB5mGGgbmOkCLu1RuoEIEmLx6d+Kxr2qfvGWc/cTtps
	 ILwYJgqk1ezpSICZbqnfp8pXh6+sjSBiX/UL4eZb3fDxOKejmXkTKMEC2s9NISpLzw
	 EcF1oXDYcUunXpNHckT5wCMczVYYVo5OU9viNmHQ/pZi2ZK7vpg1Mh/8RKClDwDUR9
	 lJEs4Dq+2yUeQ==
Date: Tue, 28 Oct 2025 13:42:44 +0000
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
	Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>,
	linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Subject: Re: [PATCH v3 5/5] riscv: dts: thead: Add reset controllers of more
 subsystems for TH1520
Message-ID: <aQDIVJNX0fOTbp7p@pie>
References: <20251014131032.49616-1-ziyao@disroot.org>
 <20251014131032.49616-6-ziyao@disroot.org>
 <aP9d3-deezGtCbHr@gen8>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aP9d3-deezGtCbHr@gen8>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_064358_517379_741DBA9E 
X-CRM114-Status: GOOD (  20.45  )
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

On Mon, Oct 27, 2025 at 11:56:15AM +0000, Drew Fustini wrote:
> On Tue, Oct 14, 2025 at 01:10:32PM +0000, Yao Zi wrote:
> > Describe reset controllers for VI, MISC, AP, DSP and AO subsystems. The
> > one for AO subsystem is marked as reserved, since it may be used by AON
> > firmware.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  arch/riscv/boot/dts/thead/th1520.dtsi | 37 +++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> > index e680d1a7c821..15d64eaea89f 100644
> > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > @@ -277,6 +277,12 @@ clint: timer@ffdc000000 {
> >  					      <&cpu3_intc 3>, <&cpu3_intc 7>;
> >  		};
> >  
> > +		rst_vi: reset-controller@ffe4040100 {
> > +			compatible = "thead,th1520-reset-vi";
> > +			reg = <0xff 0xe4040100 0x0 0x8>;
> 
> Is this intentional so that the first VI_SUBSYS register, VISYS_SW_RST
> at offset 0x100, will have an offset of 0 from the thead,th1520-reset-vi
> reg in the driver?

Yes, it's intentional for both VI and DSP subsystem. As you could see,
excluding these TEE-only shadows, the first reset-related register in
VI_SUBSYS is at offset 0x100. For DSP subsystem, it's at offset 0x28
(and is the only reset-related register).

I want to keep the first 0x100 bytes in VI_SUBSYS, and first 0x24 bytes
in DSP_SUBSYS free, because they're clock-related registers, and should
be reserved for clock driver introduced in the future.

In TH1520 SoC, only AON and AP subsystems have strictly separated reset
and clock register regions. For all other subsystems like VI, VO, VP,
MISC and DSP, reset and clock registers tightly follow each other, but
they don't interleave.

This series follows the way in which VO clock/reset controllers are
modeled in devicetree, where the subsystem region is split into two
nodes, one for clock and one for reset. This will lead to less regular
address/size values like what you noticed, as the registers do stay very
close.

> [snip]
> > +		rst_dsp: reset-controller@ffef040028 {
> > +			compatible = "thead,th1520-reset-dsp";
> > +			reg = <0xff 0xef040028 0x0 0x4>;
> 
> Similar to rst_vi, is this intentional so that the first register,
> DSPSYS_SW_RST at offset 0x28, will have an offset of 0 in the driver?
> 
> Thanks,
> Drew

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
