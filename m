Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F66CD4F54
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 06:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KvU4WUvmMicajVaEbJa4byaPy8ae35PAqy/fN/QG46w=; b=eSFvey7uiM9S9M
	eiKzYh0m3g9GEs/daVO427nB7Eojri2givmMAWuzGrD3mXNaqa0SYPN3VSPMjAq9S/6DB6SZf0Q7l
	Dw7sffmOWITOZ88HA2BxsaYL3RhnJ05IzlOGNEWfd2vOnHGaoUOsY2Hhz9FTjMGTQwpvBMKK5Cqlo
	H5smE05oiFuZRoyN7yVIJ20QPwFePKWenuWmHtwwkybVONE2xl/8h9tu39zJB7LSe+Qt0R59GAoua
	oJc+Hc6MLArpxtjXsBqq0rr3ToKTcDjgB4RhlBwwTiTNl1VSptxGJ7by29GSCW+qHvZZA8SFZ5puZ
	ticvpn0Y8EiWo5jBYv3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPaHm-00000003dpi-1DQj;
	Wed, 20 May 2026 06:20:06 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPaHg-00000003dm8-1hH9
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 06:20:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779257949;
	bh=hg5KK2xUCyB4FLoYLYP8YswpRDV5uXbEMujGSGVHGUA=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=a1tTMgD6pTfjaggmgL42RSaT4YhHoLKTs0wYqvr0xnhj3x0tx+wMEpBACCqwxgPb+
	 l15qc8pd57Q+lIO4khmpkVi9gcRNSn/m3qPDycREwbzMb6OqIgNnpveqA8KMYeBWgw
	 ch3qtxd1kJ2klhCiyixHE8cdoQmw6We6GPLSkUo4=
X-QQ-mid: esmtpsz11t1779257947tda20d2be
X-QQ-Originating-IP: 0xEUe3OK3WD/fOJoDhBLmRz2RyrACzSv+nYtYCmdgDQ=
Received: from = ( [210.3.135.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 20 May 2026 14:19:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9958252558601639694
EX-QQ-RecipientCnt: 12
Mime-Version: 1.0
Date: Wed, 20 May 2026 14:19:03 +0800
Message-Id: <DINAAUZDL8PS.3KJXPTIHPXQQY@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Han Gao" <gaohan@iscas.ac.cn>, "Linus Walleij" <linusw@kernel.org>,
 "Yixun Lan" <dlan@kernel.org>, "Hendrik Hamerlinck"
 <hendrik.hamerlinck@hammernet.be>, "Anand Moon" <linux.amoon@gmail.com>,
 "Junhui Liu" <junhui.liu@pigmoral.tech>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Cc: <linux-gpio@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Han Gao"
 <rabenda.cn@gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: fix NULL check in
 spacemit_pin_set_config
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260519164007.122574-1-gaohan@iscas.ac.cn>
In-Reply-To: <20260519164007.122574-1-gaohan@iscas.ac.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N1ZgNUtaKtmxFhz/8yV8b59Rf/Xjd5V4g197HXPXFy8kmwrfWjtJ1eLK
	3AH+Khnk+xT4mCC0EnLVgIOAA/dy0hvU/uCH0qp7dcypvu7uNBmL5MHreik9gzPPiqaXC73
	orfJ1tesQBQOVlx0vDg4TeCB7O72Yw0FmvFSjrFSxXw/D6sui1sUCNS3NQbsNi7qG9lWr72
	ujoNKA5DXgWGwpl247SUH1JeyghyBxYjDq9EACVjPDHQS8Ptoef0H1QI6M4MfoGPjAvbqRv
	0mDxEidEwMS5gcrJafSzOhuV2+tXuElJE17LHovA9RMStUf+kTh95AgC2GMmCTYCcbYq8No
	8B2Mcvzh8v880nF4QHzwQ29N3yrZPjUrOJ/Kk8lrY05JUszC5EFROD2YNngFVSeMWQaT5rs
	qaw+0QyzW8mXsOdgJL1YyHYCMtllFHcZeAyyjCcbIEPbJ4f0p1BWzZ8wE97j+fMD1iaqLt9
	opgD18PY1qN91fvHPls/piU5sT9HVMnoCLaoKurj2u+nP7+q6PJjcaxtH3/JgoN4suHYUHh
	HEMWdtuzZYI3cIX15Soax1OPqzcQiHB8QY+qv6jx6ogwhpmi4IuPxUElKYfBrBOj437nDbK
	49sO2j2yZkwKxI5DZTqdKtsW7dXGqizZxFXVn+SnhE7kOcJdQ8EGM2Bw4hfiUzmiiN08gBc
	7ObzDJQWFR0rb+elKWhNTQcjz1BMe2hBlfGaht6oh1Y/v5A/Rz3jJkbGMfmb4aG77lDDn32
	NQ9yWNcplVXEBP/jEoWp9TaTpQCqncjs1nzDN+4OyueK253ged24JXTE6/k4ipbKwZM0P1/
	BUCU8YZR1+UZWxfdeixFTvZt9DJRuZwzQZ5urRoBc+rn7Wmf4K0a6fwX8jaVrOBJDcQGSyI
	wjHx5koIndeiU4d8/daoPgLvqpV+yuz235GeKjQzPU9GnzrhhKjuHjzzCNIU+wFQU95eG3V
	KkE+r+5KUk4/HQJwxNBtAXcgxi90CW92rrOvc20lZ6abyKpYSb2LChg4YPiyTLyHroLLDuO
	T99UBsz7HAn/5BBSKJ
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_232001_474584_A3D2B809 
X-CRM114-Status: UNSURE (   8.99  )
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

On Wed May 20, 2026 at 12:40 AM CST, Han Gao wrote:
> spacemit_pin_set_config() looks up the per-pin descriptor with
> spacemit_get_pin() then checks the wrong variable for failure:
>
> 	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
> 	...
> 	if (!pin)
> 		return -EINVAL;
>
> 	reg = spacemit_pin_to_reg(pctrl, spin->pin);
>
> pin is an unsigned int pin id, where 0 (GPIO_0 / gmac0_rxdv on K3) is a
> valid pin, so rejecting it here drops the PAD config write for the first
> pin of every group. On K3 Pico-ITX the GMAC RGMII group lists pin 0 as
> its first entry, so its drive-strength / bias configuration was silently
> ignored.
>
> The intended guard is against spacemit_get_pin() returning NULL when the
> pin id isn't in the SoC's pin table. Check spin instead, which both
> restores PAD setup for pin 0 and prevents a NULL deref on spin->pin.
>
> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
Thanks.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
