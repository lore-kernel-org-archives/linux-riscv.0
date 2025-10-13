Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B99ECCD183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 09:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p2fo2FTnbT7Ba/qPlxxiDDIfnUCMTU4+wRjHu/QV8Ho=; b=GZk/TQSHW4rgmh
	Y0Hkpft8Pr92kev7FrqUc3d5pt2wGsZP42EvGDf82uQj/7SOIooEUaaXe6VsUOg8Nk44xbI/MR0tS
	d9l6Dkl4ZMMXfuTzIgVoWPYrr07i6ejcK/BC6JHAcQC49O7ObP401kkavY+sc8r/FCM6Wx8lCi+tg
	vyCVkykTBLiTYJ1WNGzTPIPxtqByHAlvQjB+jevWJWfaYTRjHg4lVvnG3h8fSm5hAGWwMW77A40aa
	fhBcSOHMiBrJH/Rc7iPRli5dI6cILz07gqlh6RKuI54mXMWXf8J8oQCkZZTBHfsL+zrLdjlhoAcfx
	sYNCx+hlS0jRVMI9boYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8F3E-0000000Clrl-0Nt1;
	Mon, 13 Oct 2025 09:41:08 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8F3B-0000000ClqC-2Lik
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 09:41:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760348296;
	bh=FKV5rcOU3NiQueOAKmsQZIMEQoY0gM/PgsfKPak6dIU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=pHT615/FCXAiftIPxTuitBhsyFRiGq6/a06RBpRXDFfTx2/mh4VpDZjk33XNZPxEe
	 dEY7vgmJrtW4jj1KvsgeHRUbtmz6WciYQrnq1nkjo4W7G1xXxx1F+E/jrDhmklex5I
	 PnAW7/R7+KEKM18kvO6M427lACUQzercKVYxY1fA=
X-QQ-mid: zesmtpgz6t1760348287t76bc683d
X-QQ-Originating-IP: 0yrPrwLnm0gGgvkYYE+D/xX95XiUkzU9yKkuKrbC1Gw=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 13 Oct 2025 17:38:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6530773640354334042
EX-QQ-RecipientCnt: 15
Date: Mon, 13 Oct 2025 17:38:05 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Ze Huang <huang.ze@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v8 0/2] Add SpacemiT K1 USB3.0 host controller support
Message-ID: <AB4F40590DDC4024+aOzIfRgZZpZc3HeH@kernel.org>
References: <20250913-dwc3_generic-v8-0-b50f81f05f95@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250913-dwc3_generic-v8-0-b50f81f05f95@linux.dev>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N7k3iE00JiuZQ0owHi8QC5hPWrgUyhMhyc9vWZSN46d/Wk8QgKwyWWv+
	fLyOfQgz1hkPnrnhD6GPcwRrnKykginJe33jt8ltaCTBNvanXkDndaLmDH+fpOkPNn9GmcW
	h3EJhi2j8aMbUenzLPZCwU4J71hCplsmygi/3XrezBnmwTpVbBM1N61X2X2emsa9dR8K2Yh
	5BRr4iHCktIJZ+RVQh0HvMyHW7JwpO7Cxh1pKwmBNNaghzEcE/DjpqAkRXgXxKt3cEDwX0R
	61qizcToXOw0cayeML4UtDaVmv5pXaylUTKo3S2wJ0J+Tb5/7kSN+nezG9FZsXNIH+8nzX6
	yeWvfU7AOyOqdAKuiDlkg2pGEciy1WZz6XXbq1y8PlTa8c9Xzui5Ci7+wxYiy9v6xz1FgxK
	E3wMwJenwwjz6HNhpGAomvro5YVH0cPQ6KF5drhftMx2Eo5Nx/RLNq+MdibYFdoIBEXeIDM
	sMyOI1tm4Oo0ZlQ34GTgCq1CdvS4f8J1B6ud0R6q5lRQJMQG0u9BY3PY8G/rwHoUgY1T79k
	4AZRNS2W5CUA+S4pO/6YfEGWr479NU+TXRk/+DaMu0VLG5uuMP2359lBwH6ifaTXsRNfrs/
	SiThF+fEKoPAc3iGVxsyKZfunfFnd55Yz12TcusDnq+ptd2Q2RaBkK5m3cJhuL7wFvDhG+0
	HWAC/CWVjwQKc6iZaVegiASHvY7IWgNdeVdwDsQIwYnarviOMf7Gdi1lrC9LoJkCpbswH/V
	eTtVm3HzLlKlb9dJnSt+4l66DL6kQLgGLzJzC2yMDLE5SDHd2kWiCjzjUvK+3mmRtjXloQO
	EsZTC2RassfxdXToTWQGtcUbXAw7fym9kEIgRcRFD1RRguGW06XPhciKuWGzsDiWe3JWlSk
	2FkK9n0OLVsX/TCIg24sVIAaZILjpv4nxvnfLNH63TDPllz/5T4KUVHcYiDnEC8A25VGd7X
	z0Mmb2OvA8Y9E233nsSNLdqe61YzEILPEVbmvfV4eODFaUJUQEncg9s/8sl8r5xP8kLo2a3
	8imEh+OHFFffZ4YxSEq/zWZ0SvvyPC6OZd1oO//VtedBAxWHv2N712Au8AULmhwsdzce+We
	hCEliAaocIc
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_024106_126745_F508576C 
X-CRM114-Status: GOOD (  12.19  )
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

On Sat, Sep 13, 2025 at 12:53:46AM +0800, Ze Huang wrote:
> The USB 3.0 controller found in the SpacemiT K1 SoC[1] supports both USB3.0
> Host and USB2.0 Dual-Role Device (DRD). 
> 
> This controller is compatible with DesignWare Core USB 3 (DWC3) driver.
> However, constraints in the `snps,dwc3` bindings limit the ability to describe
> hardware-specific features in a clean and maintainable way. While
> `dwc3-of-simple` still serves as a glue layer for many platforms, it requires a
> split device tree node structure, which is less desirable in newer platforms.
> 
> To promote a transition toward a flattened `dwc` node structure, this series
> introduces `dwc3-generic-plat`, building upon prior efforts that exposed the
> DWC3 core driver [2].
> 
> The device tree support for SpacemiT K1 will be submitted separately when the
> associated PHY driver is ready.
> 
> This series is based on 6.17-rc1 and has been tested on BananaPi development
> boards.
> 
> Link: https://developer.spacemit.com/documentation?token=AjHDwrW78igAAEkiHracBI9HnTb [1]
> Link: https://lore.kernel.org/all/20250414-dwc3-refactor-v7-3-f015b358722d@oss.qualcomm.com [2]
> 
> Signed-off-by: Ze Huang <huang.ze@linux.dev>
> ---
Tested-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Thanks,
Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
