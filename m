Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267B8CD5BB0
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 11:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NuvvlCrBOCRfrH6y93UUy0gNCp0Bekex/pyVVc9HrK8=; b=fF9hYDg0wTV1Fx
	fOepSND7JJEIZr1dXd9TY3TgwXdc0QlnLWfUcJ3fG8AubQEuFKY0dhg4dOp3mB0x2FxuPTLKMzUB5
	p6k57bRX0hCnv5Wu1ZFG08soRZkD505F7duiUnjtNyKpZ4s1uXz6UeXWekJ2EVCD/A7E+G66OEFvP
	aSsDnEFgrZ5Vy4+kSTbRa104G2IQmvf76oSyV6RhKDudc/eqmL34m7esm11Q54QVndgGBH6aohQNj
	ROhpGWrvLd/wPyC2yCDNVtYBrm9eS1SsKBZcvrp7snXS9lZF1IVomTX8ej2QwbYQ7Hf+IDaKh/0YS
	PBtwxP5lnuRf2juDZLnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQO1j-0000000AdFK-2rkT;
	Fri, 22 May 2026 11:26:51 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQO1f-0000000AdDm-3xvL
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 11:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779449176;
	bh=OvxAnjWqfX8/3mvrcZM41btS8w192cJEjZBEPQD+Gq8=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=aBjSySEfSdA1oWaXSWJwh9rn41CboTkcRTOZxzkmmD8pCS/6jTLuwNDgIUki07ifm
	 7I5rZGGOBCOZkPTkViJBkyjXooOQg+uMC4YMUFBL9ezc4vr7z1mTOzjbjiXlM6+0fI
	 5C1MngXOLAHB468OQ2H0017qEIqYWrxLWZJQotkU=
X-QQ-mid: zesmtpgz4t1779449175te4f3fae4
X-QQ-Originating-IP: Mbr/bW5duuFzrge2MVl7tFpLMVUsqkao2DoNemluwGw=
Received: from = ( [210.3.135.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 22 May 2026 19:26:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1712237719727841820
EX-QQ-RecipientCnt: 9
Mime-Version: 1.0
Date: Fri, 22 May 2026 19:26:10 +0800
Message-Id: <DIP633RAN8PQ.3CCYARBCPZ1Y2@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Conor Dooley" <conor@kernel.org>, "Linus Walleij" <linusw@kernel.org>
Cc: "Conor Dooley" <conor.dooley@microchip.com>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 2/4] pinctrl: add new generic groups/function
 creation function for pinmux
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260519-germinate-ageless-631033d22797@spud>
 <20260519-storm-karma-e457ea68904a@spud>
In-Reply-To: <20260519-storm-karma-e457ea68904a@spud>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OK/duGulb+LdcRRoLjUQXebGMLgxBHZHgZ7E4OdvXrZxjy5ezwUkiz4A
	JXQPqh1viePtlGWTJN66gVO9v35FsRIBqlcgwd+lPJ83jBEb64MOXcWD47IEnWIGD1SAtq1
	ZR/MQ/DhLfZTGRHgY0IQLb6K+kY/ebg1WQx0Nd4tHZkdgujpSmgO4y1nCMrtmGMWzCoAnPg
	o4jF2pR3/9IRglVpmJ9AeWfXKgeZclkD8T7Y8ze0XPRRIQ1TL5J1iD+D7fcA1G3xLm3SCep
	cIW54/AFj4sEkatxOyaP0S6e59R6++eMvP3rxYx8Q3ndCSiKtTQD/FSgQuefH7m/h+zNj1V
	sD8BJd2pWPagndLY8PaldC7NG2iUmAQgMxlWhhB+xE5CsBpIh0Ar+2nAKIFHIGDVzz/06Io
	qO6TAjELFq6lxH9nFtKWBWnJj5ikOKT2OyzCohJlz9qPkmX8imXy+qEjfif4oAGb+g87hY5
	4TRBuFTkITfjlGtQ6yzuCr6F9J/zij720h3foakliNOrp+BG3QFW8psXqr9W3ICT3HD+XMj
	4u14gshOXOYW37lvCSrIAvqZQ23Uluqe5G2/h4iLBygWYQQUR80amjpH8/pdq6ggW9+sIz8
	jtSu+I3bZIjwroxGvJxRJ/OVNXpSDkIuQhbhzOmDIERkOP8LtIsbw/jFoLvl31QLtA5c6x5
	kabmlbA1Gqc2GfBhpJWnrsdZ+julfZCNiKXpfGW4gwB163FLzo2iZ2DtZGHy/gtOI9SjzE1
	Q6FtI6j99QC9QOWj0KZsF3oSjjt0TY6EwLMhEmZGhDMPyiw6KeKJSwqpptsKmRoJ1B4qA/i
	PSizcUr56vXt91zr4H3Uczxi1fdo62q+ERB3HAGEXkGHOJKj4cYHicfbXReFM0PqpISY+pN
	3lk0eGAEDV+Y/ZKHf/KxQN7wpQy6mCeeT9RisK+xlTd/PsIpXVXBG6XGlhNvLOT30kzHDjd
	Q3Eger/beu/yWz9gkqu+b1Qwt0KwPPxblM4YkG3gXBwA2G+KKpCdt0dIti4ZvAVYSvTOSnp
	qvB/QgJ19jr3f/Z7WPtFgzQvrjb57kaSGhYfuF8Zq6t7UP5WJv7L7GXwU0oBw=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_042649_096551_E56FD1EB 
X-CRM114-Status: UNSURE (   4.11  )
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

On Tue May 19, 2026 at 5:37 PM CST, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>

[...]

> +int pinctrl_generic_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
> +					  struct device_node *np,
> +					  struct pinctrl_map **maps,
> +					  unsigned int *num_maps)
> +{
> +	return pinctrl_generic_dt_node_to_map(pctldev, np, maps, num_maps,
> +					      &pinctrl_generic_pinmux_dt_subnode_to_map);
> +};
Nit: stray semicolon after the closing brace of the function definition.

                                  - Troy
> +EXPORT_SYMBOL_GPL(pinctrl_generic_pinmux_dt_node_to_map);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
