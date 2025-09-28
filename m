Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29182CAC5B5
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 04:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UbWlWvmZM10DNs2GrzqblU94JeBxbHOrgQaPP5kc0/A=; b=w875uD2JAkgW7p
	erEtH8Uiz7XeW+8IpHuEzl85ROSkeHJvjOJu/FV9GhHDqunzPd8kBjU5FpzQEd3e+9926Wy2EoVEr
	72jbsbUIozVSnXubA/dHQwoIUJEoQ0JehMUahHviXYv05+q0Hu5+bVNzfJ8hpinDUBXDYQIfwVVqZ
	T0aPQjX7PgUXCV4guXKLA/gB1p9z49R9rKpMsXYRCAo6av1UzQT1zJ9uKDEk8ewXkftmx4nx7sz7F
	5TPad3vadIZrvcv8u4k3EZoXuO11q2gB+IQpHUd0L0rdP+kl7Lr0pqW325SF7iR7ymiGxUFkAbgBc
	zizBFI3h31o2Og78Dxzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2j14-0000000DtgF-0k9a;
	Sun, 28 Sep 2025 04:28:06 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2j0z-0000000DtfO-2zy0
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 04:28:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759033583;
	bh=lRXKPu9rVdBrwq+A6fNuFBqeLF0wYvpKYrnWz46wPHc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=cgPbMU41hTLA3px7baAVox+J/6l/ceEdMMcYEQxmCKtQ/5rjxjDpTLgtYEGL9GtIb
	 p1JgkTR30DJgs0C/bZ6wZzngB+RNUGa1ncTUMl+uybWLU1yIU4MRomyck/hnCMfd3l
	 qQe/WD4QxsHgWng9v7hCdVeUfLMjLo82PGqxNrQw=
X-QQ-mid: zesmtpgz6t1759033580tdb211f7f
X-QQ-Originating-IP: cTWBXFkZ8w5X/RkyEMnZiFBP1OpMPA6Kf2dcxAHh1mA=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Sep 2025 12:26:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 914358563765765743
EX-QQ-RecipientCnt: 15
Date: Sun, 28 Sep 2025 12:26:19 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: riscv: spacemit: Add MusePi Pro board
Message-ID: <C16FB37F0982124F+aNi46yQc_e-gCIvL@kernel.org>
References: <20250928-k1-musepi-pro-dts-v1-0-64d0659dfdbc@linux.spacemit.com>
 <20250928-k1-musepi-pro-dts-v1-1-5efcca0ce3ae@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250928-k1-musepi-pro-dts-v1-1-5efcca0ce3ae@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MSjOaOtrDtXuk1xHFtM6YLERmB6iSGyxoboZ33IG3agdkWXVoIQ8Lz2I
	UysFx2ZHOWaYAbB7yqydJfVE/Ctw0aITSl8bbAhjCPbFZURQcvBMJJACzybwRnz1YnJcGEg
	p0J+cyvl8ATbxSqT02z20p+aiifi2lj1z5rjg6rluSX0ZjMAvDDqgICDlBUnca3meI0q84Z
	QSosrvuuIjgEqqy8PeqT5lLpEg+OVrEBByN/mnh/gDbzqmY8e02Z01tWvRvdN5g2o+QMJz8
	N8b1uX+2MgTCskZ9qIOk/hXOlXpv30fdzp+N9XMZ9Ayv2dq220zI+jnIgQycIMj9923Y2Mz
	ZQBQddQ/mGVoMk2NaPcQkOKZ6MTEE7QRrbpQrCpYmIyW/FI3v5m3kh9Hp4NkVFrB7Y7tzIz
	ipcxdAwl4eyB9cYvQ9pnXzk2NinHV1JGQImZTa9YhmQ51aCJjJEvl72p/KZbyb4IUksVSgA
	YLaTNzXHnKzMl2B0T26SChexpyjHSzYjR8Fr22qa2Ba4ep5G8f2PSw9wgm5qh3kLxGVIHt6
	XCog9DmNx3tZSLe0cA8AcEQPW6aq2rwnoWzNCfSXf6PKTeG93Dr0imx1HAIDPOsyZlDeNMC
	Pe3oEx3Bqy/piD0I7cv94wQDZA2nDfFnPfgiat7K4750k5Pt0M3CXW6TX//2A/78mPh4nAZ
	loh0l5O/zyC80EdvG3I6d0WFjLuqXzEwDWHlKL4JQkX/rD6aR/0y4I1SeGdA1JgXaOkyyHr
	MSvczhMqqEMRN+E6VuWa5N9Fz9Dew0l1qVDmC5Jnd16EBWtfpxlloIYE3qnTr3/LtHDkEGQ
	p1hXFesO4Nceps0FP6niRNO/ZOpgjciWbcswa9ye7ycyQzYQ53qRsudKUdCgxl8Gr6w14gU
	xut+gm3q4l65KFCFFcFNE7d3Rvdyr2TEKybhO682sSmRU4xi+YUZQ6fDUlZsi53tcieEjtV
	CnYt3i1bOmme/4rkGS+BUDACLchS7l/F+0QwmxlaQUgzYE0cI0fEyKnBafdxb4QrQ6HMB19
	UDk9vKDdBLuHPKm2M6BhGZZCC8yuPcOIg7po9El/wnRCdB+GhZaAbmBx6JJmc=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_212802_582174_76A4A639 
X-CRM114-Status: UNSURE (   6.91  )
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

On Sun, Sep 28, 2025 at 12:16:48PM +0800, Troy Mitchell wrote:
> From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>
My SMTP client messed up,
and both 1/2 and 2/2 were sent from the wrong email address.

                                         - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
