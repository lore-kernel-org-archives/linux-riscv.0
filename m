Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B12CCA476
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 06:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=whp7Ee0t3Qz2wnQ1CMAcYz4YBwpBEG3GIiUFusKTHxU=; b=EleHlGkx9zYf+v
	3+yLKTPUWwWmvm6J6h3tNKVGZQ/hxzgV2HI3mxrpDUnMk9r8e1COXA/ggA5ukb98XYzYpJwvXoY6Y
	1QA0lEcrySMunKCEgnf8tPo/ps/ugAm6D8Pr7T+f4ksd7EZCmyRqclEEPFTaVHVAJO1z/JqSc5pt5
	w1lgJzCZ0L/8JnwMwgvX1N3kroTBldCwHU6IDXlHlYnZY3fxBOuouWxAowcYtNn47IkqYqMAXLHUo
	x2r3z9eHvXdh595adQ0bw7f3+hNQrjVXe5hfFtkciVGIEj25aa2aZuCE/OyaDaEcLypA+I63pwE/f
	r4Nb9udY2D1q/kWf+cKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v76Vc-00000007lFU-3lEX;
	Fri, 10 Oct 2025 06:21:44 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v76VY-00000007lCP-3Vxz
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 06:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760077223;
	bh=fY5GWREGM1F0WN0Uk0IHs1MX+GE6gCX44IiriVQy/ls=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=ukVJIHkVPxjdc11XyPBgjnwxcF79PO5gB85SBVqZr4wV4t53/PL6NSK1jUZ6KyxHD
	 KFhg/Mzh6f/0GwrEzj9fTvFM/H61pfC0eI4xq0IUMrFOPnxjVjBpEXDAmewa63IDEw
	 OqYi0DhKm/PQHfAL0KrRsaRt/r8L4OMw68bCG+qo=
X-QQ-mid: zesmtpgz4t1760077214t21b1d401
X-QQ-Originating-IP: 1O0RQKLiP8/EwcUIGSXn7afoUGmd0envjFBUs20JX6E=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 10 Oct 2025 14:20:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2431771121863430806
EX-QQ-RecipientCnt: 15
Date: Fri, 10 Oct 2025 14:20:12 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Vivian Wang <wangruikang@iscas.ac.cn>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] riscv: dts: spacemit: add Ethernet support for
 MusePi Pro
Message-ID: <59657BBB86F7B678+aOilnA5Z-QL7xF9O@kernel.org>
References: <20251010-k1-musepi-pro-dts-v2-0-6e1b491f6f3e@linux.spacemit.com>
 <20251010-k1-musepi-pro-dts-v2-5-6e1b491f6f3e@linux.spacemit.com>
 <a02aec9a-976a-4b63-86cb-126b8ae71185@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a02aec9a-976a-4b63-86cb-126b8ae71185@iscas.ac.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OLsBWtCIHsg6BDQjHi6LbISIF+JRl9FZBdY2C826UFz8EAFADcLMWgWT
	y3QWdEeF7FucvQNloE5F/up9z0MG2caLSvsOSrWVslfYqVydB4t2t2mrAr9KovPrDOSl98l
	jLMeM05wRAVRD6xi2pnEn0cuSQYwiPq5HMGYm4VyNGAhoa/Q1ymZHCGuBl3ZfTu8KOOnoRB
	BxmwJWOGANm9brXNMiwNHecU+4OFLYVlpK6RDxZZvX/72JrSWNTLx+9MDI9E9qYqKsl5hRF
	f4/Bz9wzsx0EiIW4hxb34o0K3eweoA3klSlaIhwrqTe7t/6zx1+72ZTZU4MM5/KukqMlTfC
	RQPjOnPqj5gMeWEd1jYjJXB+QggUI6FHcKncchU9sMzfsk6JjrHEes8+5mGBsXEayKbecDc
	A2VMQ16+tO43yjtht+01MtryNJ8d58Ft7aG/v1HV3nZYnrOTp0TYpF0IGpq8g6+9tqsHfZy
	OehqYwvgqhQdgODlHjmoMP3jPzm9yl++M4JW0LhuXFO8c/xN+afzAQrFUa8+SiLg3UqC/Cz
	g+ql7ePPSBapntXswV/3rD6YrIyEK1nuIXhb/5oXEdAv2ih5Oo7Smu/5Tns74adcv3TxRMt
	M/Ko+y63mHkQ4NZ2gpB7e8ieVr+rwDCoouCrOhnmSRK6CMpOr6FgyKQhH0h0n7HRthSY5iN
	U0QDWTd1PKYoQPboErMGCP1DIJ0eOwMOXFM0l0CHJTrg0lSmdZn/iEjWfunyJZiRxwJQPvG
	0DylASHX+f9+FYNbWQHH1cVxivqujITVVbi/Dv2hJmS2yv+DAu6DJ/Y4UL0wNXd096fIyhN
	rk2BBOXHK7qgR9htyta3jmsfKv4eMoNhapgSgDB9mqzM0QCHI5wNQtyxCbPCXZ/feHIIucr
	VuhzxBe6qd5r9fQxx7gFXr5IG4IBgwSnkDxgd7Z/Qo2neAJMMLSO5M7fDGD8x8WA5l13x71
	+RdUMu+SeDzzt7VcoUx2NGqZamRLo93WQHz9uUr7xmNXNwmYiTM4DhORy+9UsUBHzrDro6Q
	AMVs2WIWtpzFQbxKkUB4JlVdo2jLOvtlb/OPrNM9es7hNn74ep8WicXldYxB7z3Qm2FDTnc
	hHSWJwGuFVn
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_232142_396142_AA160D0A 
X-CRM114-Status: GOOD (  21.01  )
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

On Fri, Oct 10, 2025 at 02:13:31PM +0800, Vivian Wang wrote:
> 
> On 10/10/25 09:56, Troy Mitchell wrote:
> > MusePi Pro features a single RGMII Ethernet port with
> > PHY reset controlled by GPIO.
> >
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> > index 89a35914710bfd15c6ad27cd8d0de7ccf62e2309..e9a53dc7a417117c82f3e467677290bdaeffc845 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> > @@ -47,6 +47,29 @@ &pdma {
> >  	status = "okay";
> >  };
> >  
> > +&eth0 {
> 
> For node orders in board DTS for SpacemiT devices, usually we follow
> node name order because there's no unit address to go off of here, so
> for what we have here it should be emmc, eth0, pdma, uart.
> 
> See e.g. arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts and previous
> discussion [1].
Thanks for you point out!

> 
> Also, personally I think it would be fine to just add the whole
> k1-musepi-pro.dts in the same patch instead of splitting it up like
> this. I feel it would be easier to manage this way. For previous devices
> these nodes have been added piecemeal mostly because the drivers were
> being developed in parallel, but if you're going to base this on
> v6.18-rc1 there shouldn't be dependency problems.
> 
> Maybe Yixun can chime in about this as well.
We have talked here [1]

Personally, I think splitting them makes the commit history clearer.
I'm happy to merge them if others also think it's more appropriate.

Link: https://lore.kernel.org/linux-riscv/35C0EFBB84167959+aNj6K33fl7utuqcf@kernel.org/ [1]

                          - Troy
> 
> Thanks,
> Vivian "dramforever" Wang
> 
> [1]: https://lore.kernel.org/linux-riscv/CAH1PCMa35n4dnJ94-EHGrJyU3kztQYO8_v2CkD=rid466zv3+A@mail.gmail.com
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
