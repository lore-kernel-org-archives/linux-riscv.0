Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0071CCD1BF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 01:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fGnydqHJdKFDkwinCKk1D9Km/80drZXOTj4CZTLL3GM=; b=qp/ekZN8s/i00p
	zeLE7AgeMR4//KCoEWiVqLnQlMaq+fLq5A4keflETkZ9/c9teB84UVZ/HGXuOpKl4EmZ32V9k1IGd
	XroJjzoTwGyXtrgAf7tS6rYUXbL1+eqbcYbwe0MRQHRzycWEgRmimkecX3vcpGdZp2QeNBhl4nJNT
	uk6RJx65rI2nm1fnw1RU8YDMsJTgoJ/ZKf7R83CYz9h8xMQGD2kBhSukW/tijygzdg1DYmszUptDJ
	r5DwD6CBKiCmhkiXHMAaF5ZPSUkQglm+3OSAm96cWzCcXfGYmVPuTLTii/IVP2QXlGeXcDMP9kksc
	UojtIt+NB9LvjWrkwLsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDucL-0000000GtlQ-4APh;
	Wed, 29 Oct 2025 01:04:49 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDucI-0000000GtjJ-2u1p
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 01:04:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761699826;
	bh=WhJq3Ipi1fnHde+8mqcuR7GcMe5QQYJXmTD2tu08/bk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=fuf3whdFbHh6qrUHjLsaIs5jmpVY42jdMsHK8hMiW51zk4xaHisUDNbGj92mM1TOj
	 wLO94+iGZHGmpCblqSpKzzHAwIhq0jBE+ZmjPu1bw/rPKrDDGNu6XxNewU2Qfr2V8N
	 kWgd0sMxx/sz3AmQj/TmLIEuxHQXmq7prORw7BQE=
X-QQ-mid: esmtpgz14t1761699818t16bf4f72
X-QQ-Originating-IP: 4PI68DuhWu4P70idAW3AQJNj1pCz19XsCYRw2ixuntQ=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Oct 2025 09:03:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11185435277983628578
EX-QQ-RecipientCnt: 9
Date: Wed, 29 Oct 2025 09:03:37 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Encrow Thorne <jyc0019@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH] clk: spacemit: fix comment typo
Message-ID: <B07B2D0180A31C0F+aQFn6XlzuhgGRnWq@kernel.org>
References: <20251029-b4-fix-ccu-mix-typo-v1-1-caddb3580e64@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251029-b4-fix-ccu-mix-typo-v1-1-caddb3580e64@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: ODcDgdcDagQK0jLi0Idn8OOQ9rSlepOuej7hvMXc4bjdk5Yui8m8tUy+
	cJOIZERoNVpe/jtWHzbVw00LpDJREvFZcEsSmzOVxwdvwj8mTE/wRNmnaLa2jTJQTukw1Hc
	OVyPjYBPaeHZEyLTcCfBJuqtU5jXJwUXK5gGGixygfTD2EN9J38hiicIwMkDFyVc+lbFZCv
	p21JZc95IZf1Uv0QZtw6HzM5DPwxDIAW+Ocfl3P/I6G6g4T1BNlYNRKzjsqmESr1nreYESd
	f4d1FAeCvY4wRzduKULyuJ+i7ebefj6IPtQl4Aj0VT8iKXn1wlIxHF8CK/Tem3U31vxGuIJ
	AoYO4Y1gEhNPpaLTvNowvo7btvEjtvML8K38uvCQ7nxsFejmiGffQ5nR3pmvctpb8tKeqkR
	rIYAESlU/D3r3wwd6+sf4tZyWb9B4uwdzifHMyaMk5Ngg6pLTkGQbJNQByqAs8gUIxTjQ7j
	BzPR1Bnb/c9Dp1SfsK0kt12lgy2/BlM2dcgD/jTQ5TS4+sBt/fEaLxXPZQ56O9rn/YIidxc
	lv5oDiPBncbJZ74E4akd+oxr/2QziAM8WlZNq/5xKXU3fTN6QxB3KYpmM+70+GArn2i7ReG
	7EODMVWRz0omCyVVeJvivhBisVGJ+87aUc0zo7Kz6PgDQ1RZtDg66hvYe4XtufUQSzPqej7
	1Tdeu9bxwviEwvc0xqINLQGYgpc5MXeyOjSwyz44J5Ke7RVQIvv7E7E/eHP7ClfaGtF6VjS
	yR181FenqW6naMwMCvf720DGPnnrnZvLLxA17Oqf4x3OQDzAET6M2EjzC4YpnO773ONgekv
	bGTjWuzQ99itpwXuOvTao5+MHbub8+kN6fVtuIL1PlQtLEBP+BhygoWu+OXXIMx6+IM7eNh
	j878rfnZqNxOMs0UfshFgx8x7jiLvZGm90Efn1x5wHfLPgU6nQSw7uB29JTAVm8M/VGhpYW
	HCHLoxKp9ROyh29mdKscTqqHk9pdUNiji2/RtUWM8eQ29Pk4KtkHZZ5zAML/lVoJzSeAwlw
	a3K3/jUSJjZVfm0judYBiqOySdpVo=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_180447_349125_69E4DA60 
X-CRM114-Status: GOOD (  14.16  )
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

On Wed, Oct 29, 2025 at 12:05:39AM +0800, Encrow Thorne wrote:
> ccumix.h was copied from ccudiv.h and the comment after #endif was not
> updated.
> 
> This patch fixes the incorrect comment to match the filename.
> 
> Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> ---
>  drivers/clk/spacemit/ccu_mix.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
> index 54d40cd39b27..c406508e3504 100644
> --- a/drivers/clk/spacemit/ccu_mix.h
> +++ b/drivers/clk/spacemit/ccu_mix.h
> @@ -220,4 +220,4 @@ extern const struct clk_ops spacemit_ccu_div_gate_ops;
>  extern const struct clk_ops spacemit_ccu_mux_gate_ops;
>  extern const struct clk_ops spacemit_ccu_mux_div_ops;
>  extern const struct clk_ops spacemit_ccu_mux_div_gate_ops;
> -#endif /* _CCU_DIV_H_ */
> +#endif /* _CCU_MIX_H_ */
There's no reason to discourage beginners from starting with comment fixes.
Nice catch! Encrow.

Reviewd-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
