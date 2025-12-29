Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8133EE784BE
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 00:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mFE33qEBVL0K8fwgugqdC2jGvbYL/ALIu3OZVgBEgHw=; b=vAq3rYxopjR1UH
	SY572pALTTx1yjSkyxkjfBLz6i/OnJO5R+tf7DHBpMx17fjk9iIQqijOP7QYa02vjK3cyaB8VmN9U
	4pyAH1FOp/MSA/4fmlnsMdKmbF/TXFpijzpAiPyaagolggC9N4rQp8w0/xba7Tji3kdxBCR2XX/x0
	xEByEMUnCZV+eot4S1cd5WeFjFPlI4uYTyxl3w3QD5FEFX3o/30sjbO3xV6F+FZ7eFB25qZsbfVR3
	3NgpwzVsSQHRL8vv/AHE7ZH1aUXjr2KyYkKAdgDaOKmNxdkn/K8neJzvOtgb7dEQkPfdxXo+QdDvV
	DF6xt87l9KFzes/GzOkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va1aI-00000003AFX-3LNo;
	Mon, 29 Dec 2025 00:58:06 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va1aG-00000003AEz-0fLm
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 00:58:05 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8b2ea2b9631so918322085a.3
        for <linux-riscv@lists.infradead.org>; Sun, 28 Dec 2025 16:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766969883; x=1767574683; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=udz/Ywp00lT4GZoeinIo9QMm0ZTiY0IiwK5PiD3CPXA=;
        b=S41JLeXvMT3/TPDVpDLD0T5X4xTv0U32lgWo4F3ZYiN4LfyNGZXfQ1xW1hpjPpbavt
         5ZwlAqQbI2KqXoAiaXCJZH49Wa2OGhdSSeU1dnkMwQGjnQsW+Ow+qZqsFyYwLTjaSBeo
         icjguD4rWQ9zL7DdTX7Ze4peFRMusvvXADdEHRv8mEDtg7D+fzIuequJIoQwaoo128N9
         Wv/IW7b4s5qDy3nSqDNhN/nLPnMeJrrve6uCLET/n/WdDRdYbm1ZzPGAlzpEMA8PbvE8
         cYIml1L/S/iG/kEhMhDkkm2mFnPMvk5ImPiV0ppHbPZmFMdf94WcdIyYdtO9Pf2LBlYh
         0cDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766969883; x=1767574683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=udz/Ywp00lT4GZoeinIo9QMm0ZTiY0IiwK5PiD3CPXA=;
        b=sAr3rwqkCmsARVzo/63T1jp1/mqnkPSsBACRbakKNNMpPC2+tE2KIz4ZdPnwLcEklD
         GHVJiv8oAK6QuG2ygaUq6JfmthAFUWHV8b93nETLm1JH7FyfStA6qdYLBJeD79loSIqd
         fhvVWgEx1oh8w5j1EqrUL78lVWvjIG4r3Z8dt272OU5uvDJTSWxTsDPzXMLN6UgLsS4n
         VaThOWxr6mofVXPPkagtI2PtoYRWBtWnHzsshaB07NZrLJvF/Bdkfhh9HHtSw3yOBQmM
         jeA9yFafIdULEPVpP7xqwmbieEkRAEALcGjMEgvM94bb1WeDH06YGMnNfE6U4Y02AV1g
         URaw==
X-Forwarded-Encrypted: i=1; AJvYcCX5SrwvVyJd56uRDZP2WAI2DFTh7YfU48PgWjrJoNCabpIdMMXIYJ0nusR3ij2Ohl4Z7Nm0xFWyyb1Oxw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+MdfEsr4PAk1rS+5BAA/bnGaR02SKJ3/HI3pdo1S95gSxdKjF
	heEoMzI0ojQfXiL/O2/yf5qTrft6Xc0KTq5qFCErFZFX826xwydcrecFCYUKLmHpka4=
X-Gm-Gg: AY/fxX40rc5yflQJ/Kbsa0+RFZ5CCETx7rtxkA28kSO2YgaL8UQ6+tW00lpE1kW3Awp
	12T1U5goF6m1xc4tmeMd8Bm8s1gnujbaubP0vI7+ZKuNdy9CL8VvlWUPhqd47DnX/DwRbV8eMA1
	oLzUmRfcJm7yIHVSdZzeSVQPtyKFGPlRG2s+uw7P8qgH/imTzpKMb0PXLZxicfN6PhjUG9IX5WA
	cmZv/lFnDu1Ry6xhv/jLNmIzTqTTP/63he6RU+iGqqR0QNGsw0/h4h2cr3SUt3RUEqNcsZcDpm4
	g9MBNbF+Q9Zm1gD4kxfMvKzG64z8NdiO1mqpQBntoWodKvAD60zm2T0iTDQOM8eq4XQcN5TWhEO
	p7HJzQXocSN6VziuGZjTucjoslhVBJTKP9hQETPDFXWX8gdGYEz1j+mRw86CCZwH0rjvgqI0TiL
	C9f3npiYVTCyGFOdIyHU/IrHdJjlDPDYLw994f5p8L6Jex5cP+bIQ=
X-Google-Smtp-Source: AGHT+IHrk3/Wb1Ax/7CDf4gB7goVnIoiHZHZswEwc447eGOnME6q7KBjOR0207MAY/FczYBzti0BEg==
X-Received: by 2002:a05:620a:4706:b0:8b2:ec00:7840 with SMTP id af79cd13be357-8c08fbde57cmr4105632385a.27.1766969882882;
        Sun, 28 Dec 2025 16:58:02 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c09689246asm2268104285a.20.2025.12.28.16.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 16:58:02 -0800 (PST)
Message-ID: <4a76e9bf-926e-4b77-a2f8-ee4a72b2f1dd@riscstar.com>
Date: Sun, 28 Dec 2025 18:58:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] i2c: spacemit: configure ILCR for accurate SCL
 frequency
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-1-8839c5ac5db3@linux.spacemit.com>
 <81eca0ab-47a3-4b12-98ae-fbd46a15ff93@riscstar.com>
 <BD74A47E5BB66010+aU4j6CgGxebcBV5I@kernel.org>
 <569E6DA87DE510D5+aU4-1Jl9XxjAWQq4@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <569E6DA87DE510D5+aU4-1Jl9XxjAWQq4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_165804_235835_4A8E9B64 
X-CRM114-Status: UNSURE (   6.88  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/26/25 1:52 AM, Troy Mitchell wrote:
>>>> +static int spacemit_i2c_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>>>> +				     unsigned long parent_rate)
>>>> +{
>>>> +	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
>>>> +	u32 lv, lcr, mask, shift, max_lv;
>>>> +
>>>> +	lv = DIV_ROUND_UP(parent_rate, rate);
>>>
>>> Would DIV_ROUND_CLOSEST() give a more accurate value?
>> I'll test it.
> Same result. So I'll keep it.

Is that true for all clock rates?  Anyway, it's not
a huge deal, but especially when the number of rates
isn't very high this can make a difference.

					-Alex

>                          - Troy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
