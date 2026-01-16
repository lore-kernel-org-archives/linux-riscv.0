Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F044D4A607
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 06:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9Xpn2qCwcdATO1A3VS4fUrfdqFdEYR1e5JjWTNdlLQ=; b=DvaLarf67aVlEq
	4kP7xilwK/Sd2GMSuJbzTiOU/YqEaPi6Di5XdYTPSapE+k64mrmAKzAnYpqc352UNnHkDTQcy7HDJ
	3uLLWS8yn4wwt74FG5loppuYi2c036wmHkjhI3XdjORsb7KBCUcNVqZfejKGAF6S6lg4bndtQJbYT
	niS9iF+Mgf8uP+esLsjlWg9K0g6oD6oV5Yxa/uG2IhWWBicAIaxSGL464ghEo7GMKR93qcxUGglwJ
	A7QijLcZL3si/9izIm+NIvNNLKL22BmyvSQVG8TLd7rtOhBnx1KSM0JsPuYP7jQ0bPrhtGqyykIdy
	FpZylV41Ocl7bpEbjoVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgdic-0000000Dfsu-2D01;
	Fri, 16 Jan 2026 06:54:02 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgdia-0000000DfsO-0urS
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 06:54:01 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-480142406b3so7509395e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 22:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768546438; x=1769151238; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=slZGbouLqbJpfaVGGnHBou19vIILt1Y3clst8iE34bA=;
        b=JiVnhqsHhneHLts7ziM25nh8beT8oqefg08eYjzoJ9zcFiixCJc0omubG7QwRYlU6D
         ORYNNC0Qw8WPcFx/qzWrABOHSLKreUcmMzfbiJIZ8psYujQslUOXh1QsIty2daK2Ob64
         R+Mhxpk9G33h9m0HsarMa32po1moceoUpQly8/gVupujp1+PiGzIs2t2tLvtY5HURiB+
         Wg0o+l/GH3bjfyxFbX07axotYUdVoBTUa8MlffCcTUjAyb5ojOuhMIGKs1QySzmwx2DI
         TqGhDuZNZT5l8EAyGW1QVBhpRMYR7sx9holqtWD+1rJdSKIAMSTCLVp/5Un+OQPfPjeh
         Z+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768546438; x=1769151238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slZGbouLqbJpfaVGGnHBou19vIILt1Y3clst8iE34bA=;
        b=Vn9azEIWIHQNXTuiHqcxnJ9gZE3EKUtqzi/Pov5jYrNt/1pe7aSA47hO4x5bM7bewU
         zeewKvXLmm80uLxyKjnLt4rKTOmo4NCeeQl7wqltwHiKl5C3BpNOCWVerkCAR+vGhNVK
         9DciAIaM5SnCscJQeNnKaR0bGxBByUsPdBU6yCPCjGNhkUeI7zOzNIOa9oueWaObq4MV
         KCLbavBIhdPnCMsbuYbMtxlD2Bctpe8dGxhJO+Vy6KYNFa6kg/rX+k8AWuydH9ivBeiz
         i56f8EDUOV0eZU4fIXuA+qBW7oPXiriLsw9jV/dgR+yDCKj0MYPefaeNYnL7rdjoFw/w
         Ti3w==
X-Forwarded-Encrypted: i=1; AJvYcCWNrbGKWYDcnxk6dCcSvIt7k7TjISpJYeT327FK5O6iRWSsO5hFCN8JmZYo394iuwI3Usk06Jl/YD9seQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRsFSs41EvoH6OM1izkSUuE82OiT4qpGSjHrvM/yenEj3PATNt
	S1y6M8RpFS1QSwFiqpoRJMpJD3EvXMTlhqp84N+5NUtjmOd8+kNG9HquVi3Yo1Oeo20=
X-Gm-Gg: AY/fxX7DYaEUHe2SepiSJ5+NXjy+5OMmNRW6MutNxrcNGfnNEJLpIYkWeQm6anoA+2c
	2LdIa0spf56LYcow9j+M6usF4HBFVQVc/FzS1IDjWk8bFYq4DfLxthZxT6DRv1udkZMz2QVDCVY
	h6ehRqJoOsm+2fGQkdvoJFGfG0XCODVEiwDGblnqFbNpGEnBWL3i1v1tRnsXN3V6CWvrd69YsqW
	/CNLwDckgaKg9gq0GSSwRfyKyknojjNBOlnegBAntsuV2ujJOI39ZnXmjexbNtbZJNHfimQAuT5
	TsxKcKFJ+J3bO19eq3YXnljwEILvjbj/BOg8S3IQdOngfaM0Y5Pbx8vlPM2QEiRu+ORFAhINTCA
	SONq5D8eA/NaWECSwAUp9ePH4+Glp9YECwkRfVK2wqvCvDI1W+nnt0nAjbeM5SPTYo8IFG75uYw
	6GVmyodgfsCR86ApYCsQ==
X-Received: by 2002:a05:600c:3ba8:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-4801e34651dmr21491475e9.30.1768546438260;
        Thu, 15 Jan 2026 22:53:58 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356992201csm3448860f8f.2.2026.01.15.22.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 22:53:57 -0800 (PST)
Message-ID: <a35f22bb-efaf-42c1-9e14-1f9ba32a3a7b@tuxon.dev>
Date: Fri, 16 Jan 2026 08:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] pic64gx clk kconfig/binding changes
To: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20260113-snagged-blemish-52af3d00d88e@spud>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260113-snagged-blemish-52af3d00d88e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_225400_270133_9FDF9CEA 
X-CRM114-Status: UNSURE (   4.02  )
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



On 1/14/26 00:11, Conor Dooley wrote:
> Conor Dooley (1):
>    clk: microchip: drop POLARFIRE from ARCH_MICROCHIP_POLARFIRE
> 
> Pierre-Henry Moussay (2):
>    dt-bindings: clock: mpfs-ccc: Add pic64gx compatibility
>    dt-bindings: clock: mpfs-clkcfg: Add pic64gx compatibility

Applied to clk-microchip, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
