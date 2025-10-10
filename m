Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7524CAC5BB
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 06:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25vL5aUVxARKPc0B0F42AUU0JcjbSWAIW1V882RMPco=; b=b8TLnXS4DZmJ4i
	z7AAQk8Et909tcoiUjLy3Ah7Ri/c0mbIWpWaOqZAmWm8FpNbyZ4LnqS6ijStoRVHiLWhwTg1f4BYB
	X0shgdtF66IbRf51ppK7Ng2siUdh78dnNzGtLnvZY39qLeoF9282kqtGAfanBOt9Xu3dYSVOBbFiD
	lMHdJ9k+smnlIEKTiEjOWxtazVlvQq7YDL83W/0vKhshP+F02Y+Imbummecq8vOy/2lta2sgN4sro
	R4Dsbt1Sa+6miwD/IhXbcYkMg/LzT7fUgFCwzdFcFBfUxH+tsfkMYC3ZCYF8M7Z39Ou0DBLA7XZTv
	AFm3QyyBF3XlHUCpHs8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v76Yg-00000007lZS-1jIW;
	Fri, 10 Oct 2025 06:24:54 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v76Yd-00000007lWw-171h
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 06:24:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760077399;
	bh=tm/lUilTBDw6IsADQJ8KkEhhEKSkPxGsACAkHAwgEOE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=ZxnZfrlu/HmH2kW00Mo6vKjneLX4/OgS3i1OavtrcXxIig2pCvkM7oDQoT+4rQ+E7
	 8QoZKFpYlPUsS4gF1Usu9grzeS04glQdt0ud9iz21s9g3lIw5Kb7WkwdtD+RzFLjH9
	 rsK0igmeuUQ7L4yqW8PfvI1iaj1RI6OvC65rLS6M=
X-QQ-mid: esmtpsz21t1760077390td7701a8d
X-QQ-Originating-IP: oxK7XddsRt6IDGptzNKloTsRDPkLDF3OKx8EF4ZwQ8Q=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 10 Oct 2025 14:23:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14211931734184312409
EX-QQ-RecipientCnt: 15
Date: Fri, 10 Oct 2025 14:23:08 +0800
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
Message-ID: <08298B8B17A59AAE+aOimTFhG8DqrtfH0@kernel.org>
References: <20251010-k1-musepi-pro-dts-v2-0-6e1b491f6f3e@linux.spacemit.com>
 <20251010-k1-musepi-pro-dts-v2-5-6e1b491f6f3e@linux.spacemit.com>
 <a02aec9a-976a-4b63-86cb-126b8ae71185@iscas.ac.cn>
 <f968ca77-6fc0-4485-a13a-2ed83a7e6617@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f968ca77-6fc0-4485-a13a-2ed83a7e6617@iscas.ac.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MbvU6/58K7Xo6ckxyJYt254pR63bN5OGr/OYJBIWzUP/oxpionKY/0v8
	1xvvmkOjlTdRp5uzZNWx5KyvEgAKL3W9G0ZF3UvmSZQqjm1QVAiK0tKRkVw2O7SBJVoBAHr
	Hu9DB4BV6wzIe94L4xBDsL0uqYHT13tEpDcaQKX34ZWPOHn7xZ/DM9BJHkFM1BGNe2CXiEC
	8wbNMZe5i6wLHdqaIQiNNdD+zmEvWChBFnezeFPzv4jkeyMh2/tUPSWPvAAkFUdVO8Adjrv
	tLVrtodz5e/z55bREcfWuQTF/7SEbngnEreCs7p5I9BgZPvFgCURVIZOZPtbZt0s3bkiMhA
	Et1XNcXx40rrmK/9ajs0VonawDvZ1AvyEwOojz8394Ap48oaNnGzp1T+A4q3A6WetYjdeJY
	+rJPXIyt6Mq8PDleMtM4YXpwB4XIw3mOHxzfnbACCvC1lRP05INgsonK9kywNZ2bUEoVBK2
	dDFCVADdhnWGq2p7wt3j9ztl9wYbb/qQp5+Abfn4j6hLCUiTxu788K3UIuj3CBXvnYet07c
	hRvpHUzV+A2Ho3cNk98aCsrCq/R/9SsSlUZBCK0QrAaHTNjahzcN4sATnr5pEiL+Jjjqt+j
	4/N0wbNZmr/NKWiRhHwNGKlhRNT/UCLX4ToUOlawHf/3ejDP4FFoAtUrnPEUEJPbfNYvF+F
	A17fJO/soeijGFwe6l8j6deY+quDhiYTnOfWA4RGD8suC55AjpYnVDC1AIpwW8BeSi3wtM+
	pdfoXXr8fYgnLal3iz/ozOPN6JBlT3U7RGpI6IOQAZQl7Ryo30m/i0OARuDllZITOUfUBTQ
	GyYnD/Jot3zjL3CFD5DARL4jVPCahATzHx5VLoA5S0OQLuMmiT49c6A7CxmU+k9ZdenD9MJ
	lOPJREmhoAOOmx2sk/bctj5OnaZg7bMo6837l+OnG/a2Lt56FWrRGKYcyyghoQpKpSjrWeK
	Bjxlh8eJDycLSrxql5AwVP2rE3fPwQggD4fzVz3jbS5nr+LxIPNCPH8F9XZmG+MvhvSMK5B
	W2Q+QHwIehpMQJO7dnf7qoS2xkQuhV1i30CPynZvR42Yb+KSUEPFG62CPWoCdB+yq+2owhs
	jp7QI6Lvb+nWPMfbS2q3EodYCGB52ntQd09mMDDuya/u7Go98uW2Mi5FmeKuXTzQA==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_232451_657508_3A6B6D72 
X-CRM114-Status: GOOD (  24.75  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Oct 10, 2025 at 02:20:50PM +0800, Vivian Wang wrote:
> =

> On 10/10/25 14:13, Vivian Wang wrote:
> > On 10/10/25 09:56, Troy Mitchell wrote:
> >> MusePi Pro features a single RGMII Ethernet port with
> >> PHY reset controlled by GPIO.
> >>
> >> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> >> ---
> >>  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 23 +++++++++++++++++=
++++++
> >>  1 file changed, 23 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/ris=
cv/boot/dts/spacemit/k1-musepi-pro.dts
> >> index 89a35914710bfd15c6ad27cd8d0de7ccf62e2309..e9a53dc7a417117c82f3e4=
67677290bdaeffc845 100644
> >> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> >> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> >> @@ -47,6 +47,29 @@ &pdma {
> >>  	status =3D "okay";
> >>  };
> >>  =

> >> +&eth0 {
> > For node orders in board DTS for SpacemiT devices, usually we follow
> > node name order because there's no unit address to go off of here, so
> > for what we have here it should be emmc, eth0, pdma, uart.
> >
> > See e.g. arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts and previous
> > discussion [1].
> >
> > Also, personally I think it would be fine to just add the whole
> > k1-musepi-pro.dts in the same patch instead of splitting it up like
> > this. I feel it would be easier to manage this way. For previous devices
> > these nodes have been added piecemeal mostly because the drivers were
> > being developed in parallel, but if you're going to base this on
> > v6.18-rc1 there shouldn't be dependency problems.
> ... and also almost missed: this should have an ethernet0 alias. In the
> most common boot flow it's read by U-Boot to set mac-address so that
> both U-Boot and Linux use the same MAC address. This allows U-Boot to a
> persistent MAC address rather than having to use a random one.=A0=A0
Yes, I forgot to add that.. I'll add it in the next version.

Thanks!

                    - Troy
> > Maybe Yixun can chime in about this as well.
> >
> > Thanks,
> > Vivian "dramforever" Wang
> >
> > [1]: https://lore.kernel.org/linux-riscv/CAH1PCMa35n4dnJ94-EHGrJyU3kztQ=
YO8_v2CkD=3Drid466zv3+A@mail.gmail.com
> >
> =

> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
