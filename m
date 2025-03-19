Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6D0C35FFA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 06:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nth02g5M04wK2GXPc4KetdTWSGuWlrxUOMhDjzSL+Yk=; b=yEUdrTz/bHbRHU
	rdxkh5nfGvRSq54fCSnMoPxoQGvYqI5dGoBQCv0MPUS+utzMIrheldYxO0B5Sd9Q9ljoyn5LI1zq7
	a5qmuHnWJTzm5Yl25E4SgHl/FimoXUlzLsem6+mBCOO0rMa1iWRtsbcKieVrBdAydjTdFf/9hwq72
	wivx4Gvj3zcJ9Ohf12b9CZG8vUqJiZDK30viNxSQF/ETQ9rt6Bk67YbdNUjRBYH/yr1aB9EHVmdXI
	QxnOysufE0OE6QTtyhRDDaVQaaaViVSk+Iebii8d1SmJy2dKuLHWsqMHy1hPO9N/UEZqGXFCCidug
	p31weNHkC+ecg4A9BtJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tunMp-00000008AHD-036X;
	Wed, 19 Mar 2025 06:57:31 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tunMn-00000008AGi-01HU
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 06:57:30 +0000
Received: by mail-pj1-x1043.google.com with SMTP id 98e67ed59e1d1-3011737dda0so5544469a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 23:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742367447; x=1742972247; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qcizybZfOtX7zd/8muYLl1W2Y9HegSIfPjr4unQ/52w=;
        b=jwSxJ4M4HemAa4rl9ne8cdA8jAKUCdhVAj6dTQQQirE4JIECMLmk6DkNQW3Y+4FSFC
         wJF8iyc97mmSav+DA4FbdMY3uh2bNT/RwhHUweCeB3QxSTVR03EbwS3X+5YPKcemwyEp
         YUsQ6Nq7H742oKkoxp+7+o7Lmp06LIKl3lCQm/93LPyOoD0PMir04FNxEsvRJI6J12uk
         qM95sVpVxUZiIzdcBJ0XJhynhjY/pnbZj1hk52xEX27QDYlftHPlv1bXc8Fp1vEmVvTy
         WRY9K0w5PWw2oAhoRbUC0VSVKDmisks5G4j9WFqn96s68FjFdgxBTACWXdJYmTw5h4V9
         Uf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742367447; x=1742972247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qcizybZfOtX7zd/8muYLl1W2Y9HegSIfPjr4unQ/52w=;
        b=V98UovYG4uXAMKbL1vvLCT/G39ZmBa8UbDnsOq8tvtAOkiuXHrjFE7daFmHhpBn00s
         EFcgnCRjT1izN5Xm8PEOaZY+tboBoUjpNXRj/6fiejgEmwQKMzJFR/sciJd0EvokfY2C
         wYjBAiJNqRiuLgqCNnhZf+TfiSMZuB0F3k51WIp4KH90/5JDjtqekuoYapmDihsxEbvt
         XhlkaeSawqD9zqKVqO9qayaigSC2nTGttORQ/QOHoXYBxOwp9/aULhEGNNck05ByeydE
         +M44AU8naiEcDHqFB0RwdNJfG+FcOBEZa3di4FpRcOOEuz50GXusU39KcVYNoPqI9ogM
         sOIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmHT1JFfyCVwIcn/s4Ue4Vs9z8Bljw6CsNzyJ3orvGrbncsgCgprtrzEtvsOJnlptaw4ubIDryVYbriw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxfTrGYyflL7Etb6kls7sM3x+vYGrb/31giAvG+xxjLI/xhwDo
	dwh8fRcw70aJgB972u+kRfpSyUGAS6Uw7C2QK7i0UTWn3ntAo+SE
X-Gm-Gg: ASbGncsLf8tUEiVB8C1A9oWK6+3xfZlNjpklzkw0jgTVjFjN2HfRPCUBSHkxCn8yjOQ
	ZEBvHxkS+cmRVWYk3Y6SVSouHO2i/2ApeD7/wLAH8pgActh3MXsHplJok+LmXq6eROXD5wbGNfC
	KwnVh16J+KKAcXANVfQEOruoMDvAeaDJ0me3eTRsO1hdNoYZCCqeF4n4WlWbdj32yQnN8f028jj
	r2EuEik+Dmzc/MwudkK5Amk9PNr1NwxelFgUzkptg6Aap2/C4NxRylzN//qj0ZmxBHVDNBAUEZ/
	w01UpXt0OZC4yIYRw8OrHSNInsO1dg==
X-Google-Smtp-Source: AGHT+IFFwhNQ/t6dDSlJCbtxQ/cI6+UzpKK0sAxbXmmxiGE86fdpdk9WXkOD2IVcXL9Kox7DXY3lpw==
X-Received: by 2002:a17:90b:2f44:b0:2f9:d9fe:e72e with SMTP id 98e67ed59e1d1-301bdf91cc2mr3092116a91.16.1742367447258;
        Tue, 18 Mar 2025 23:57:27 -0700 (PDT)
Received: from [172.29.0.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf5b81casm741412a91.37.2025.03.18.23.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 23:57:26 -0700 (PDT)
Message-ID: <fbd59e2b-1d9b-4585-85a8-aec79bc10dd6@gmail.com>
Date: Wed, 19 Mar 2025 14:57:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v7 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: Andi Shyti <andi.shyti@kernel.org>
References: <20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com>
 <20250316-k1-i2c-master-v7-2-f2d5c43e2f40@gmail.com>
 <na4oeypp3a3qfaolhzvmj5b4s24zbgaq4vwsvm4wf2mefpcney@wuzszlh4ct3o>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <na4oeypp3a3qfaolhzvmj5b4s24zbgaq4vwsvm4wf2mefpcney@wuzszlh4ct3o>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_235729_051704_1B90C5A9 
X-CRM114-Status: GOOD (  27.48  )
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

On 2025/3/19 06:18, Andi Shyti wrote:
> Hi Troy,
> 
> the driver looks good, I just have a few neetpicks to point out,
> that, along with Alex last comments, makes the v8 a good
> candidate to be sent.
> 
> We still have time, to get this merged in this release cycle.

Hi Andi,

I accept all of your and Alex's suggestions and will send v8 today.

Thank you both for your patience!

> 
> ...
> 
>> +enum spacemit_i2c_state {
>> +	STATE_IDLE,
>> +	STATE_START,
>> +	STATE_READ,
>> +	STATE_WRITE,
> 
> Can you please use the SPACEMIT prefix for these enume?
> 
>> +};
> 
> ...
> 
>> +static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>> +{
>> +	u32 val;
>> +
>> +	/*
>> +	 * Unmask interrupt bits for all xfer mode:
>> +	 * bus error, arbitration loss detected.
>> +	 * For transaction complete signal, we use master stop
>> +	 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
>> +	 */
>> +	val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
>> +
>> +	/*
>> +	 * Unmask interrupt bits for interrupt xfer mode:
>> +	 * DBR RX full.
>> +	 * For tx empty interrupt SPACEMIT_CR_DTEIE, we only
>> +	 * need to enable when trigger byte transfer to start
>> +	 * data sending.
> 
> Can you please rephrase this sentence to something more
> understandable?
> 
>> +	 */
>> +	val |= SPACEMIT_CR_DRFIE;
>> +
>> +	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
>> +		val |= SPACEMIT_CR_MODE_FAST;
>> +
>> +	/* disable response to general call */
>> +	val |= SPACEMIT_CR_GCD;
>> +
>> +	/* enable SCL clock output */
>> +	val |= SPACEMIT_CR_SCLE;
>> +
>> +	/* enable master stop detected */
>> +	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
>> +
>> +	writel(val, i2c->base + SPACEMIT_ICR);
>> +}
>> +
>> +static inline void
>> +spacemit_i2c_clear_int_status(struct spacemit_i2c_dev *i2c, u32 mask)
>> +{
>> +	writel(mask & SPACEMIT_I2C_INT_STATUS_MASK, i2c->base + SPACEMIT_ISR);
>> +}
>> +
>> +static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
>> +{
>> +	u32 slave_addr_rw, val;
> 
> please don't use the word "slave_*", use "target_*, instead,
> that's the new standard. Unless it aligns with the datasheets,
> but that's not the case.
> 
>> +	struct i2c_msg *cur_msg = i2c->msgs + i2c->msg_idx;
>> +
>> +	i2c->read = !!(cur_msg->flags & I2C_M_RD);
> 
> ...
> 
>> +static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
>> +{
>> +	unsigned long time_left;
> 
> you can move this declaration inside the for loop.
> 
>> +	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
>> +		struct i2c_msg *msg = &i2c->msgs[i2c->msg_idx];
>> +
> 
> ...
> 
>> +static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
>> +{
>> +	u32 val;
>> +
>> +	/*
>> +	 * send transaction complete signal:
> 
> nit: /send/Send/
> 
>> +	 * error happens, detect master stop
>> +	 */
>> +	if (!(i2c->status & (SPACEMIT_SR_ERR | SPACEMIT_SR_MSD)))
>> +		return;
> 
> ...
> 
>> +static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
>> +{
>> +	unsigned long timeout;
>> +	int idx = 0, cnt = 0;
>> +
>> +	while (idx < i2c->msg_num) {
>> +		cnt += (i2c->msgs + idx)->len + 1;
>> +		idx++;
>> +	}
> 
> nit: with a for loop you would save the brackets and the idx
> initialization.
> 
>> +
>> +	/*
>> +	 * multiply by 9 because each byte in I2C transmission requires
> 
> nit: /multiply/Multiply/
> 
>> +	 * 9 clock cycles: 8 bits of data plus 1 ACK/NACK bit.
>> +	 */
>> +	timeout = cnt * 9 * USEC_PER_SEC / i2c->clock_freq;
>> +
>> +	i2c->adapt.timeout = usecs_to_jiffies(timeout + USEC_PER_SEC / 10) / i2c->msg_num;
>> +}
>> +
>> +static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
>> +{
>> +	struct spacemit_i2c_dev *i2c = i2c_get_adapdata(adapt);
>> +	int ret;
>> +
>> +	i2c->msgs = msgs;
>> +	i2c->msg_num = num;
>> +
>> +	spacemit_i2c_calc_timeout(i2c);
>> +
>> +	spacemit_i2c_init(i2c);
>> +
>> +	spacemit_i2c_enable(i2c);
>> +
>> +	ret = spacemit_i2c_wait_bus_idle(i2c);
>> +	if (!ret)
>> +		spacemit_i2c_xfer_msg(i2c);
>> +
>> +	if (ret < 0)
>> +		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
>> +	else if (ret)
>> +		spacemit_i2c_check_bus_release(i2c);
> 
> Nit: this can all be:
> 
> 	if (!ret)
> 		...
> 	else if (ret < 0)
> 		...
> 	else
> 		...
> 
>> +
>> +	spacemit_i2c_disable(i2c);
>> +
>> +	if (ret == -ETIMEDOUT || ret == -EAGAIN)
>> +		dev_alert(i2c->dev, "i2c transfer failed, ret %d err 0x%lx\n",
>> +			  ret, i2c->status & SPACEMIT_SR_ERR);
> 
> dev_alert? Is it that bad? Let's use dev_err() instead.
> 
>> +
>> +	return ret < 0 ? ret : num;
>> +}
> 
> ...

-- 
Troy Mitchell

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
