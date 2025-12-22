Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9FDD711D5
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 07:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m3zLbXsTJREXpIKMlQcpMoWhGj7y9APxvNHqHzi6G5g=; b=DM3HlFMaUvr4GO
	WnBKkwbyc1cYSWUIllvpYKRXZjDL4XsDm6UucpShlPsjoGLvYlIpCpmDHxQ8HySHlnCrkZrmD0aZ5
	/QVBviPvRnGx4ecf6i8MSxy/oPcDFkz2IBTiMhQdlSKIu/soIfDMuV/zXu8/u1Ndza81V/DV7B7Ql
	q/AqWPgiQRk7kZdo1AJ+8RrVlObXfWMq12oBxx7vaccI5eeibBgXwFc3g4ABtPpDG2rbye2afb5rY
	hEatl9ThVFU+yYKUo4P4EyVJE+vg4OH7LcQ+qcNe1OwDLp0mRx+6vGQHKKtLmYitmkh2RHnrrk/B5
	QkUOvKEGMbx1+48wF4Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZul-0000000DL2o-0D0a;
	Mon, 22 Dec 2025 07:01:07 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZue-0000000DL1D-3Ppf
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 07:01:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766386801;
	bh=cmmp6lLLUDdXVDTvW2oTdfXFjjrAm+H8jr1TXJEW55Q=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=vlKEaqmlifZYgozetLY+4rq7VSv2nHHRwVoi9hpdtNejoY7FPJv3csM6ZcXMYrQKY
	 us3i58EAb30cUvxmwx2ebOzz2+Ygua9KVIcdbYTEnHcIB9jiFKef6yeMjdp97otF+q
	 bLklw4nRIDyNStviK5Iv28DL/N5gymb7UcTNBdzU=
X-QQ-mid: zesmtpsz9t1766386799tde4ae350
X-QQ-Originating-IP: 6P/d1t6Kqo2N6X0v/AfK88dJ7gxquPj9VhH9hyQ5siM=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 22 Dec 2025 14:59:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16583592576228146802
EX-QQ-RecipientCnt: 11
Date: Mon, 22 Dec 2025 14:59:57 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/3] pinctrl: spacemit: k3: add initial pin support
Message-ID: <74FFF1F2D1BF3EFF+aUjsbTB607IkAY87@kernel.org>
References: <20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org>
 <20251220-02-k3-pinctrl-v1-2-f6f4aea60abf@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251220-02-k3-pinctrl-v1-2-f6f4aea60abf@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MAN6sKHDZ5xSwCe9B0jlrXsFepgbR5oaQuuM4uBI0jEp0GeiXhF1Jxez
	i6mEjyoNJAUL+qdD9r/+/fhCC9X3GadayVQU+7/ovXWewrN5G0p9StgxUNo/zcF/Wx7EQk9
	xeQqDKJRUAw73M8scK+9ixfHY50RRuV3fcbtgxs30mBjK9XYLFxy+Z8GudAEk+DuakwgV86
	lihdb4tctQjP2L8fivudc7qKY3+ISvCvAGrp/tAJw1NOEdPtnsq0EYiZ1HKHLd0f7aNKCrJ
	24oVabGAk91AdOkYOZunnxd0wzaRvXW0CS/K7gKEkz5/MiSDJjOF4QdW4NId42xjmJXF+aw
	MQ66D16ngX+gWIFQfzXuCI2bNgh2MyaylzRgGDisLkbsebRErEroS48GJirjxihhzZgKW3W
	Po0LbyuL1UEE9qNa3azc4GaolhdLpzbq3pGtnqKhuNiiyLSAvU+iIVbNidIRtRwKuTRgE0F
	BTsl/iNNQFUuwKnQUbon2EqLlIjbyag3Uct1ur6noav0dSA1EWyCsrSsdM2aKsEDOGXWsUx
	mKxVXHvHcDfnSWBXXHPfq+Wijobbf5QOsjsnBTfcHefnxYi2G96azAHpRpGpz3lEgGDwrdV
	Ys3BiveAvpkMcOoNgS87fx7QOAIR++OnvxVu5LaRHpieXFpTJBM1yB4UdSNMzSzVElIBT6j
	hSqN1E5HdC2Edm8N1RgP04x3VqsraouZPS8qFF+kneAg4Qo8A8WWJH8oPbMHWoyP5uZc2B4
	5K6DqWHfHSdP+KwsxyOtltNmQ3Q6+vf0v7GFitxHlqXFEhyrS8sK48C0CMk5NMJD4z933k/
	s43fyUOf0sLzR/VENMPtwhWAiWjWibfIAH/0CuDj+5ax9V7LR2tj5MXJJAlqu4rq72H9/In
	U/gg2pM7JnjmUuWVIAAKYDF8CnZvLsP9I1wMzpqCvM57yky6EgyUWZUgYN3lA7D0dyAV9mL
	WY2LzS5ySh/OSvQzA8B6zoCX7K32Jm5HB30U2kipU5FgKjP2prGoxmY3S1xwdn/F5PAoYu9
	KbrxQA1ZJcOufoJkPuNmsb4Rw6TzUuW0IVfssjc3RsXwSCkgJTZheEkfnKGPI=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_230101_623840_E38DCD1F 
X-CRM114-Status: GOOD (  12.84  )
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

On Sat, Dec 20, 2025 at 06:14:54PM +0800, Yixun Lan wrote:
> For the pinctrl IP of SpacemiT's K3 SoC, it has different register offset
> comparing with previous SoC generation, so introduce a function to do the
> pin to offset mapping. Also add all the pinctrl data.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/pinctrl/spacemit/Kconfig      |   4 +-
>  drivers/pinctrl/spacemit/pinctrl-k1.c | 354 +++++++++++++++++++++++++++++++++-
>  2 files changed, 352 insertions(+), 6 deletions(-)
> 
[...]
> diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
[...]
> +static unsigned int spacemit_k3_pin_to_offset(unsigned int pin)
> +{
> +	unsigned int offset = pin > 130 ? (pin + 2) : pin;
Is this necessary? I think it's hard to read. Why not:
```
if (pin > 130)
  pin += 2;

return pin << 2;
```
This avoids the extra variable and makes the code clearer.
> +
> +	return offset << 2;
> +}
> +
>
                      - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
