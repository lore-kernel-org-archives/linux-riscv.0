Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEDAD59D99
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 06:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ttpjP47YFKknJFH4Im/nUoA4tu37Lo24ZG/k81bEVAU=; b=CGL76FMUSrdt6N
	MrIfdWleGTT1qP0j/0Rv1RqSnRhhcDX4J2+X6x0+1SPIpM6pkjN7ZZPZOqHL4/2E9Br4DZ2CTsvR7
	qT++enYTzSaHbdgGaNvlIkmP1dysPz3mha8HMIB9+WxCZv2PC2wek7oNE+AqpilOMh5Sb3si4XpJM
	dgB6TbRkBHjT201WTG2hvQS9CN2RVli6yQbTmOzv/lD9a3Cdiko5MDNaBBl6YHyF2aqk8YvEhkQo9
	qI3/kspte93/6t+OEeN+04OkXSnKeP44AE3TQUtZrUIR0Jf+qbDnpTUX8fQKzLgJdeMBrgq1QqdW1
	Te5JKZy2dWab97Of21Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV1dG-000000038H8-1yzg;
	Mon, 15 Dec 2025 06:00:36 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV1d3-000000038FQ-0hVT
	for linux-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 06:00:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1765778368;
	bh=PP435k1Moi0z4EBkvJTCU/m8kmHq4QkYw+IJYkzPe0k=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=tPGsXD6RiQlgqnNtqs7mCdm609wygOmXEoeu/1CRAF96ubTWWDZsinZJBuHcjI+tl
	 QL78HR3YVYYJuubCjflORyVTCt0COJa74h7lNvxEZ8Q2dt5JilxTHyI73TMk4HssMN
	 Cit53pHBDUP31kNsc1ttVu0kBaFhSHUCfL7mIzHQ=
X-QQ-mid: esmtpgz14t1765778359tc591a1ef
X-QQ-Originating-IP: 20VGHZWwzR4r0y0UU+Vj3zPW9VBggOnuciFqjjlx1IM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 15 Dec 2025 13:59:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11468608574858049404
EX-QQ-RecipientCnt: 9
Date: Mon, 15 Dec 2025 13:59:17 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v4] i2c: spacemit: introduce pio for k1
Message-ID: <6ECB2C39812D3E23+aT-jFKR-o5RsJxD9@kernel.org>
References: <20251009-k1-i2c-atomic-v4-1-a89367870286@linux.spacemit.com>
 <613db920-6025-43cb-a733-d58f65363caa@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <613db920-6025-43cb-a733-d58f65363caa@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MfLoTunDQXERLBdsYlJ+bBOwPuLE7UVXxS+9x68wt0TON9ctqQQl8f7H
	7e+TJoXk0nMH0zJVbH85piG7565BH+EalNtM26EO+2yBrlFYPwToEHglwCAzoYKkpmncc+g
	qliRdtpNMdg/aglNrpgG+C5sRexPYKk0DmC+yofOmciEuWqyzZUSjyO/soWfAvd5w2xpYYx
	vks8qS9ZZSAaTi19l562JW1JxbBURqzGnB5IsoZwqVZoyvsAG15uOWERRTI9JfbXAQZmhI4
	gpN0TYnBkWS2qfkA5/J1mUNEXAJcsohwcdXeKKjlyrVmoCOgvkbthyVKcnShC3A0WpDoSRu
	YEoSFiQf6ExEiT21QspsRy1zawhOFZY/+bY+Mb9E7Ua4mMJJbsjjhxr4YFJqKxw0S1lL3a3
	2rHqQf7iMRokUqk6fQiW+nC2Z17CDnksuUFy1foZAXfxGPOKR+O1ofU3BWzy3i+G8i+QJTe
	YK7ozm47DKMhL6aOF+TUq/wlABbuwrEdmrIWWXmO+oFtDbQpSVqOSuv/sOolepWU0bg6D2q
	YcAqefSp+V9R4rMdPWYEF0M1/DeA6wzmYPpXIpNSqLAQzNlLBFG5SmA/fhmj+NP7eNvNv+D
	M4kvznXnpUbSZKr4f2si4eu5Xk6Ykf75RbKhb7+Ml5fD8AZG0fpH30fiLP4GlnwtOVFe5qB
	rdoDCkHnmwfCcky23nywgi0sNX/0oLE24tX4pUwVSGdCdfCC008gOyj8WnwD1NUe63A6atA
	gJb/wHrcC4cEXdVhqcsCUI6EQFvekmTgxXZqakR0N7QODjHNtkCbpR0v+S3/nJU0hMnKbso
	m4dMrWdjFYKkOP5qpDSNJxFRKR2K+m3MxG2S1aIYXKOohXmFCbKk0KMN3Bn/v6SGpu+g5eb
	5q+uNxMNbBM/NEI3FXpB+QRsoduRfcfvQ6NMd710a3yvmgjeosvb+I2Oxy19J9kO47IT0Xh
	afA+g6zv1EVypZC8Ezyh6YcO6/ksKsBYTh6yZvs7zclDG6UySgImmy8bKIOSXLmksW09gMq
	/H6ixfwMFbVBfjxlh4mdkJGikCx9NllHu9UD/XYhB0YuKAG0uvwOoMYYDc7hL4rsAV7QIeJ
	qmKdbp0RHTyha7wYbMksx/8gWV2jhS/WRXynwuw0LMG
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_220020_195458_5FE58BD6 
X-CRM114-Status: GOOD (  11.26  )
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

On Fri, Nov 07, 2025 at 09:50:26AM -0600, Alex Elder wrote:
> On 10/9/25 4:59 AM, Troy Mitchell wrote:
> > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > enabling the use of I2C in atomic context.
[...]
> > @@ -125,10 +127,14 @@ struct spacemit_i2c_dev {
> >   	enum spacemit_i2c_state state;
> >   	bool read;
> > +	bool use_pio;
> 
> This is fine, but you could maybe call it atomic (to match
> the callback funtion name).
> 
> Actually, almost all uses of this field are negated, i.e.:
> 	if (!i2c->use_pio)
> 
> Maybe you could use a name that doesn't require negation,
> like "can_block" for example.

Most of the negation is unnecessary; it's my code's behavior. I'll
modify the code behavior, not this variable. I believe this variable
directly reflects the hardware behavior. Therefore, I won't modify it
here.


                                  - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
