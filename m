Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0957FCD6E6E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 01:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CqwXRyMJ3jhjNEjRF0a8bLP15atxYjvv54PcmiWLclo=; b=yneE3X4bw9ti9B
	bSmuC17mm4AZQsOPsYEhu9EIOhZqLFafoz+mJCbMPBdg5tBnV3NaW9BzV5BEqLdtEYFfbxPzTiHR4
	qN3dg5h7XoL+C5CF+bcL5Gr943dcgkYFFpdqqCHmPctxzEDiU/rCuMZA59nhOJs1gNXrNKSLQi1DN
	nVZ34C+9lWv0oVGBwu9UPpRWKTQ9JQ7g6GXI4jAMVARBOAv4a+6ImrF9OonxUuyixcCvXuYpD9j8b
	sraB134btPSLk6SZunBYi9Qk3ifsLlCoicv/BihwgYQwKVWef4NlpitfOMJf+jxMwwuc+4G1/yCXQ
	i0ro5aY+IsqNHVYX+mPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVJTu-0000000HWLZ-1HAP;
	Fri, 05 Jun 2026 01:36:18 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVJTq-0000000HWJk-0TUG
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 01:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1780623346;
	bh=JwsWwOBz5GX7EzuT7eXhUYnjRfE7WBBa6+EMLcf4a0g=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=TOCaJ2m6fTONOq09UHKVR+0nA6cQGX1i5VrSt0QRjocNV2VmMLug+QR7G6joVwSHO
	 o9Nn4bMwU/g5K46iUSh3Xwq5c9KXB5EZRy4AI2djamlRKIjNQq553Zk0KoMV+quXOO
	 Q5NpUSLA4y2QsRrJVpGb3+wdbLljk04MMNAhunBw=
X-QQ-mid: zesmtpsz3t1780623340t7e85ead3
X-QQ-Originating-IP: DsHQgpFhyT1HZD0HvIBfYZf7PkhmVnDeGfAxFHW0bsY=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 05 Jun 2026 09:35:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14962368755913038228
EX-QQ-RecipientCnt: 8
Mime-Version: 1.0
Date: Fri, 05 Jun 2026 09:35:37 +0800
Message-Id: <DJ0QAKGJE2SQ.DKPXWGPGC161@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Andi Shyti"
 <andi.shyti@kernel.org>, "Alex Elder" <elder@riscstar.com>, "Yixun Lan"
 <dlan@kernel.org>
Cc: <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>
Subject: Re: [PATCH v7 0/2] i2c: spacemit: improve clock handling and
 cleanups
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260508-k1-i2c-ilcr-v7-0-8c2dde5c3ed5@linux.spacemit.com>
In-Reply-To: <20260508-k1-i2c-ilcr-v7-0-8c2dde5c3ed5@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MjlOSqg8Riw0iDiF0Lg7G/6fjjsjtd7u5QcEiwikrdlsPAZrQyC9QAcg
	P4BsgAnI/sm+zUvOPg24z0PYSr7HOI2410Ng9PTzA81ajDBnZnCI+tDEcr9eOu6JFZLVFx1
	WpY8hgYidqyxJ3YiTK5+Oak5YbbyjxNN/2pzrZlfDSw86jxsw3EZRLGKDPXFCOvgDJA4QuM
	eTfZEQThx0SMDEWlpmSTy2vv/Mh73F+mWLEQmMZtxfo6WosUbRBW7DAmWKE1FYPvZvl2SNy
	ZOKtWLGDm/EBEn2HAT/UOKtI0ygP7whxdYRaQgZpW3c05n7dSPGl8k4tuzyzGefO2d9WTWH
	Ph4Gcp7FT7ynu5IAY6HUez2ncOhRbYxEZYqqNulTEt67j88af+gjvOvp9NyBqX6Zs/TL1G4
	42zF+l0kF/EF/55vNt/micZV5ulPBkgBlrc4Ka0Bg0HSz3WsIz7R44L9lf2MUX7dmmOWfAg
	ENiiRVwB0fyGdnpa1n1audffvCrwvor85ytonG8AE8rStSNNEjZA371pYC8SsIa26caTMJB
	a7JPCuqMrdrBpNPhBrxw3kvaKVZVQW3TbnS7Sz5/sFqzqjRWYqK+TSscTkLC3z6cfB02eHL
	F41vq4H9Wvd6/9V2Pxhd2G7q7UKU4wKsTMKLmKhJM1Q0a6q4fWUrfHuPyeg95kVUx5wlZZK
	PVVoYIOP85AipcufscpGlLlGE+dJ/691TP4vIrv1M90iK/44J5rS260tvEIpvh3ylBCcyEP
	f3DvQBXMqxBXXQXI5SXveCP8/X9YKuFKgjzeyozhLYzbKZ3PDrmG4yJADMLZrBSkMC72H7l
	S4rgq/wjxu/m70OpY4v0MbSla9Qm6IwSMeokWydREL4Q8JaWiCdRaoU+Esp3YEMGRv77lXn
	bj5ZRBHJdCVkaJnzWbM+cGN1uy4C/2FITbqEsQ7//vobl9ak0bj5y3NFu6y0HcZZrwovtgO
	sPocqLFzXXtTFV4fDKRwgPzl5YL5M13NikO6HNlXPMwyrr7LSK5xnRbktTsPKDUJdUU6HCM
	6Lm+ODN/c2sIOwBimjUyysEWKhueQ=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_183615_529480_9AD1BB95 
X-CRM114-Status: GOOD (  10.60  )
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

On Fri May 8, 2026 at 3:25 PM CST, Troy Mitchell wrote:
> This patch series contains a set of small improvements and cleanups for
> the SpacemiT I2C controller driver.
>
> The main change in this series is to improve SCL frequency accuracy by
> configuring the ILCR register based on the requested clock rate, rather
> than relying on the hardware reset defaults.
>
> The ILCR is exposed as a managed clock via the Common Clock Framework,
> allowing the driver to program appropriate divider values for standard
> and fast modes.
>
> In addition, the series removes a spurious warning when the optional
> clock-frequency DT property is absent.
>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Just a gentle ping on this series. 

Please let me know if anyone has any feedback or if there is anything 
I should update.

                                  - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
