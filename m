Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0D7D3B7D2
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 11:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kDeljxGfRQhYnC4vS7+MCgTHrvAKV4tj2GANuRr5yXs=; b=37H9074TQs/6bz
	tn4NTC0ajXy9nSJ62z9PO/vBnm/Hzi7fMeZRLkjrYDr8f9rtSUxu59lTKOlFMbhOxMR4TZtI7hM4b
	srchKU3popRXH9JFbu/0yBngbfE+E/JxJO9gsLUz6SspVEr17kJfLx6WIFyeTMA2W0o9zEh30eHbC
	pwVS2+EmcYwWcI9NrZVOYbfOi3y6aiid0Jod9WoY8nBg6hKbKMEU03qXFS7RmkRwKaPn5QvEu3Ds+
	yozlgHc7/q3AgrEPSSx00cxGXw/tnojbQvYW5wKVnzpPSISRfwlVRkdppVFiBrHpxy/NtLbI6Xoo8
	kRcSyI72xtShdBixfr7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRqKc-0000000ArYR-3jXY;
	Sat, 06 Dec 2025 11:20:06 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRqKa-0000000ArXU-1F3p
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 11:20:05 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-42e2b78d45bso1376430f8f.0
        for <linux-riscv@lists.infradead.org>; Sat, 06 Dec 2025 03:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765020002; x=1765624802; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yq9rhuNEa0+4uQkglFFSVr44v4sksoXrRImSR0Ne2k0=;
        b=nztCoxzdTed07J7r3C5sJ46FOR2C0wo9OE65gEmBgKgwD+XzXl0yiSgRZRxwUVJ7R1
         JxFcmcHyjMPNdli2nVjZMDMFbMZZ7CH46wkONQL1/tqIHsRKHPLgZXGYZH8v0Q0zGpFU
         ObR4T2zO9WFjDQG4/ibxbz5TFQl7vP2Q8fwzrRJBvS8u3RG7jcM6ZAPf0/BmoJ+Ej0/d
         XMrDwcN3HPtH3I/o2Mmv0LSMSjaUbhhhBPUd6B2OqaCeseBbj+8cjXfnNOhVjIcRM90L
         IRrAliExo7wNg11kq2DsyR8/BNboz7Z5PoCdg5vhYOY5rGKbllSZSejvdxZBsXkWXnQi
         NRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765020002; x=1765624802;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yq9rhuNEa0+4uQkglFFSVr44v4sksoXrRImSR0Ne2k0=;
        b=uEh0EUzlQSEnRHkVP+dYZca6+k6Sc7fDecxdnfy3k/dOYebIgULtNa/LzeA8vCF/lu
         eUcHhGW069Cgk0LdhyUddYsidxAd07VI9kVAknGwRw7eAp8k053bgIPH47jcq8+yo5lX
         n+9AB0AxDXx48XL512ATdx5mQPr2IBPUxJi+Cx0lTkxVMZmDUHlQZBJa4654oNOVzUgY
         JbDOH24u+vxb2KD90eteN/TdFUjrSvemV9pZrSQPL+S8pDXZeWlchucogpmqRi+XXBkN
         wGkmhF1laeZ0EKkKuNynOlxTs8iN+7xdBywxmrZ/NAVjUETeVw/SWlp0qD9UQ2i4DE5t
         wxAw==
X-Forwarded-Encrypted: i=1; AJvYcCWqDv00iaG6gIaayJMIs7Kd3m3MOaF7ykAFZ6wQW9oPTI210SUTds+EdVP2w122jVzQ8y8F02D+bTP4Fg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrgjt4Q8/OosHSGr0ryFPiLRY6DWrnkBNwvTeFvABuwgPLDDhy
	zI8e0tDJXKsENr6RQPbM+v34ikG2J3FzPndJ5w/avFIKxAepboNGPABUyQjeJtDd+40=
X-Gm-Gg: ASbGncvUjEIKTSeKrABRjTkxntWVOZCebnWQpdryJTadhdJlpvhliaZKBMXsrLTKstF
	km09biGhznBVeSQKduXbYlpCUJcqh70G9sCd3q7ef5vGc5KFI4goAOdJ4N4Lpl5pYsaN5PXApIr
	tx3pdC2YXqwk5fnlttOrTodL5ZjXsrv65ok0oh1PpkqqbVscz0yGnAwRtWcB09e0CMyj9uXFo/H
	VTU1Ib/9639A7rT3WBNqzS5QgGGdW62IpwEh3SNyQrh/4kvpyAJOvkSCeq7O1O5TytrLOeVFn/c
	aSv1zH9buHo0ktTrwCdeUtE+GGrkAXmBy7ZFKQxr9kxOQurXHR6Acxq7yqtl7cUvTmgyuORkWz8
	ZuWL6IYYVIJgUidhEyFdz6W7kb96Tn3945DHUvg1qhZqJI90Rrg4uX/Cyb5lIyJkH3gqUXpOfeW
	E5Ow3ZAfqx2OO5rArCpH8=
X-Google-Smtp-Source: AGHT+IFEgphPkYo9atYAEhSGN6ZsRn3wGRyDsC5dsg5UTtGzf5Qa6Sl3JSqY/PLn1LaGeX69E7opig==
X-Received: by 2002:a05:6000:2384:b0:42b:39d0:638d with SMTP id ffacd0b85a97d-42f89f1036emr2447913f8f.28.1765020002426;
        Sat, 06 Dec 2025 03:20:02 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353f80sm14173665f8f.41.2025.12.06.03.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 03:20:01 -0800 (PST)
Message-ID: <b303c634-cb2a-4e92-a833-0e3e70c7d56e@tuxon.dev>
Date: Sat, 6 Dec 2025 13:20:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dt-bindings: clock: mpfs-clkcfg: Add pic64gx
 compatibility
To: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
References: <20251121-tartar-drew-ba31c5ec9192@spud>
 <20251121-unclip-shabby-a7a16e865146@spud>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251121-unclip-shabby-a7a16e865146@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_032004_348977_16392664 
X-CRM114-Status: UNSURE (   5.35  )
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



On 11/21/25 15:44, Conor Dooley wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> 
> pic64gx has a clock controller compatible with mpfs-clkcfg. Don't permit
> the deprecated configuration that was never supported for this SoC.
> 
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
