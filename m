Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7889BC982FA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 01:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=07RkuDKFCIkN9/KcVT/b+fZlaHAvD08iNdsGpYIuras=; b=lS9fJHY7o0ukVA
	aAvaEi74PB0ZZWzqpnO9b37EC8O6F8PPni0GyJ+gLbEAzHVB+1h1DVF+5mh1QXY5/8I9Wex2CD7ut
	XlRWXNHNt2StnulzVChzq2OSljs59Wbvd16Qr0Eh1HZUahbyRBhejnYnk439799CHxOVM9DoV3fNI
	KwvnAFmYkYpgNQVpc/XyNXOX1GqIZZ9x9tOY4I6P7upp4hHIMS6Tl+6jcixCtKx5t8qzK07uIa/Xd
	XtkpRpimUN8VVX8QmyFWTTAHYfLxpSQAOYb9qJw7gED0Yui5DXS4HqNJ5AP76XRmF8k04wKjxftnJ
	0YKuuPdDThECrjaUZjKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ByD-00000006rtv-2FaL;
	Wed, 23 Sep 2026 01:40:25 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9By7-00000006rrM-2MkZ
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 01:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790127559;
	bh=9a1MU2/CDQgQTTa7WOxBZit45Y2o1Lnsh9hi2FH1r94=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=R0itZLS4u918KwOmOS9huX9NucjhyWQXY8xIUZRNjkxqoAKoIy62gDbfUYgPHWlrP
	 BWk1SEXbJvZJ4xRklntWf3s4hfpv7juVS9GbciPMDryrMJnH0i+0kpOrq6tXWjSj2l
	 s2luZHmPV/UE4HBzJFMf3d+gjem+U28fIC/yrcUI=
X-QQ-mid: esmtpsz16t1790127556td68b5a6b
X-QQ-Originating-IP: is8yxHjnwoMn4IwMqRzIakXosdwaURxV7jhMysF5Vas=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 23 Sep 2026 09:39:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18217622928680533914
Message-ID: <CE261C82D3A29A3C+1dca40d8-c022-4120-a3a3-a812a34cffef@linux.spacemit.com>
Date: Wed, 23 Sep 2026 09:39:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/14] gtrace: Add RISC-V Trace ramsink driver
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ian Rogers <irogers@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup.patel@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-10-mayuresh.chitale@oss.qualcomm.com>
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <20260810152223.3946743-10-mayuresh.chitale@oss.qualcomm.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MfQnJH+7WKv6eY/NckF+X2sgJ3DEpJjNxDRiMu3XRZ08HBw5MunUdB+Y
	beHpGky8cOob5w0hAD1VAgCgNO7ZUcIfI4ebM7/N36PTU8+5mP5raXjBtYV5uvDgOc46HXE
	DXWWvonFjcwKNPC9+Y2CW8Wr5tK5BcMVcJKsx2lmdKmyVoemA/W1u2NwJi0k/gsPMmrUXeO
	WETR1oPb/Nsejqb0mI0TJX9DvDYx3PD7XRQONjj0DUKDY9qPdpckC3SuRPw8FMm4xVMflAg
	dIamK2YzQkhSbYflfMjkG3KmplRZZNpkV69n+1fC2IkIXJmLP34Pl6+N1QT4ShgK405iPa3
	XGrIPf3aBrOVNXvKTD7PzkbZSBcexXI1GXBeTkW+Z08HOqz5mZi/4o5PPb/IXvpa3LHMA7y
	MPn/10x3yFWVuryHGOqT9CxiSEiGzx5BkSnN7vsolao5DQsp+kyGRXAExv1BQkGQqeSU0uM
	o+sGa0apRUT2H73sf3AuyYnTMeCcRTiPSJsTBSM6AmA2UB80Tm7t0DMHvwMoeee6iuB5ELf
	KSJHW+iq240qvm6iV9Si9DyQ6ICrHR9p1yWJmX9QkrAg1HhShfQ+GM/38nvQ59BSvUHdORH
	FgBWvearHT+FTs2lXDfG8OhCWDi5Hf1WS6cfn6sXhy73GI5VKiJIbs7vGH3kFI7n/hUbylu
	RAUO9u8EPky/MjWMmAR2N8FKX1u4WKN/c9Ev0Q/VzmTe44PAy8LCLEidqdZvxvyFvCbp4Ck
	eHvfYvJKKHNKDN4KXT8033teWNb9tuv+TzSG8Dxd4OdFBPpDnoDKL7DWtWXKmfX2KJXr1KK
	Y29EouSHgJc9vitkL1NMG7qfCqC8YhTY8ycedurz+h3nJEHb+B7Uy9PRxucXrueiYUXXPmG
	nfUyUujk1sN/yEH5T5jiK/yP+63IMcmR0BUXOQsGGOi6OgK8UxRq3JwGgZrokT3nE3gJPiQ
	EBxfin4QVSIfn4otmOlAs06G4aP/djXIh0apXefAAR+RVb5ziEDjS7MHHcVvdZXrzcGJAK4
	qVSexW1Q==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_184020_478033_490E6E1D 
X-CRM114-Status: GOOD (  13.39  )
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


On 8/10/2026 11:22 PM, Mayuresh Chitale wrote:
> +static int rvtrace_ramsink_setup_buf(struct gtrace_component *comp,
> +				     struct rvtrace_ramsink_priv *priv)
> +{
> +	struct device *pdev = comp->pdata->dev;
> +	u64 start_min, limit_max, end;
> +	u32 low, high;
> +	int ret;
> +
> +	/* Probe min and max values for start and limit registers */
> +	gtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTLOW_OFF);
> +	gtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTHIGH_OFF);
> +	low = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF);
> +	high = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTHIGH_OFF);
> +	start_min = (u64)(high) << 32 | low;
> +
> +	gtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	gtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	low = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	high = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	limit_max = (u64)(high) << 32 | low;
> +
> +	/* Set DMA mask based on the maximum allowed limit address */
> +	ret = dma_set_mask_and_coherent(pdev, DMA_BIT_MASK(fls64(limit_max)));
> +	if (ret)
> +		return ret;
> +
> +	priv->va = dma_alloc_coherent(pdev, priv->size, &priv->start, GFP_KERNEL);
> +	if (!priv->va)
> +		return -ENOMEM;
> +
> +	priv->end = priv->start + priv->size;
> +	priv->prev_wp = priv->start;
> +	if (priv->end <= start_min || priv->start >= limit_max) {
> +		dma_free_coherent(pdev, priv->size, priv->va, priv->start);
> +		dev_err(&comp->dev, "DMA memory not addressable by device\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Setup ram sink start addresses */
> +	if (priv->start < start_min) {
> +		dev_warn(&comp->dev, "Ramsink start address updated from %pad to %pad\n",
> +			 &priv->start, &start_min);
> +		priv->va += start_min - priv->start;
> +		priv->start = start_min;
> +	}
> +
> +	gtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_STARTLOW_OFF);
> +	gtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_STARTHIGH_OFF);
> +	gtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_WPLOW_OFF);
> +	gtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_WPHIGH_OFF);
> +	/* Setup ram sink limit addresses */
> +	if (priv->end > limit_max) {
> +		dev_warn(&comp->dev, "Ramsink limit address updated from %pad to %pad\n",
> +			 &priv->end, &limit_max);
> +		priv->end = limit_max;
> +		priv->size = priv->end - priv->start;
> +	}
> +
> +	/* Limit address needs to be set to end - mem_access_width to avoid overflow */
> +	end = priv->end - priv->mem_acc_width;
> +	gtrace_write32(comp->pdata, lower_32_bits(end), RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	gtrace_write32(comp->pdata, upper_32_bits(end), RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	low = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	high = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	end = (u64)(high) << 32 | low;


Suggest introducing gtrace_read_pair/gtrace_write_pair/gtrace_relaxed_read_pair/gtrace_relaxed_write_pair API,

They should be used frequently.

> +	if (end != (priv->end - 4)) {
> +		dev_warn(&comp->dev, "Ramsink limit address updated from %pad to %pad\n",
> +			 &priv->end, &end);
> +		priv->end = end;
> +		priv->size = priv->end - priv->start;
> +	}
> +
> +	return 0;
> +}
> +

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
