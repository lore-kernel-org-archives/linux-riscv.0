Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604E4C83F03
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jul 2025 07:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QCKs47ZdAHVhRgy51jUem7tqRlaIJ7FdfPMhYnh+Rmo=; b=HsE3gNhEzpxhiy
	ZeDWki+SDXWFMAezNa0IBj4MkBwaJx/JKQHFCYRZ0Kg9/xa6Ad+JAepQ48TwEg59s+1GiIOJp87D4
	l9/SH58TpkEIhiuMV0vVRlj3GGey6CUq99qqqr2avAcZAtgqeyKpjFiIGtCscZHCMl8vWHndBJNl9
	d1Gj3m2dhHaFtkYe83mv+hgoRqDy2tgPXmSTFpWtWoP7RcdaU0ZFcE/V9opTtd5OEPp98iYQVnu7j
	Z9DH2KuZJQU30lRN98Gfr0IrhNkIFhOjuEEKfU+9lpA7oHWW+nNWg73Zq7HHJ50ZeJxB8uGcFuFr5
	PiRI8GH8aVJWtv7PLEDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYKER-0000000HXUC-3NHY;
	Sun, 06 Jul 2025 07:56:15 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYKCW-0000000HX4X-46p4
	for linux-riscv@lists.infradead.org;
	Sun, 06 Jul 2025 07:54:18 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a4ebbfb18fso204653f8f.3
        for <linux-riscv@lists.infradead.org>; Sun, 06 Jul 2025 00:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751788455; x=1752393255; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gY+1w/IpSjoLelrC9L08nmljWaMiTWqrIdpFXYu9vp8=;
        b=mZdtyebY5+NJ4QscJB/3fZjjp70MSECqI9gbFEA+JZRloY5Fa+uP4BaQfCi/pbn5xu
         vLyTbd9LKKl/EA98StroB3Olu5bhNFzWeXwS7pGcTZGzVOicpvage9eqGbxbxwrUtWkt
         cMntzZKOAyZMq3D8yp7agUjAZ5FnuhED0vRM12zqfkMpZ7zQ2yi0M+JH5OyHEU47w/7X
         et0/VC9k/GnAc2z8uPym1s0VhXRMVeq+QuKGJ5tqG1Z8eyH/ezDuiuB37Axxk4SEkSpZ
         +/p9z7B1Pim72HLWnU30psoHbKWfmKCUnM/1SVMCPEGyOrEzyWrhRY/uIFaGt57okoEB
         Q9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751788455; x=1752393255;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gY+1w/IpSjoLelrC9L08nmljWaMiTWqrIdpFXYu9vp8=;
        b=Kc+nszTT0b8SrFg0D+vUK6m6Yh1jegKFL+aR+xi9dQ/VQVPwurp/RnowOtRsAu51j7
         +FburLVuhZlylA85/IJqhj92WZZRt8996YcKWynW0D9fE2BEkUyateJx4Dm0HHjNVvQX
         I5Kxop6Dw4cvj00op8lrlT36XC80AdxwwnVYQJ5xwUtQ+PiDvN5S8HjJGoDvJUCB8HEE
         U6vMvghPo8ektMFiP2mnWNxYDwr3xjNS1V5EShmHzB+DkWcZpUVmQA7d5PU4ST4d+JPU
         SMAhVamUk4aBl26ge3ZlACka507vEA83VGLT9ZgzUczXdOOpeeGIT0y7Vu8YzY2KN0zJ
         WEjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVhjg+1PBMR1RaHjYYUsK3R2hofJk4nYcrCZ1hBbDukdkCZaaPNRJEr5NMpUTpxeOwDzgBf8NpnFaiiw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxL3J/hekyfslIwb9i6sP/uaPAM37GWdPjSp1i0IXnqM5HpxZ5h
	EKJE8zVqm9DmuDWSjm+gRlpsBQSzsrl37S/eQMzdOJQdvsdqnlCuBEIVLsZ4RA/90VM=
X-Gm-Gg: ASbGncuGL+6+VtcTeN4zAfUX2kBJyvSLujb3U7iXfFg1z0FdI/xh1Eir1C3EZkw5i84
	Ha35isIUVWO88m3XzmQbFbHwghiCnUlQetsTdpSJXLml+Jds2dBDS4HRuz6pu/REd360IfuaX1Y
	DyqcE7vfVO3jU4MWkRhEZvnVUY2FkLVrpgGPpxjXuB+AroWtY2b0Iag/acgq8c8iISubxlfps0g
	NwpUfBmchbCluWeVVtcafthzwLu+u7HUZBlaSBM7bl6VHK5DvsW65iTiXB3DUgzZgoXQA64rERy
	/Ehj9blYlZyUY/ykY6pNegpd09rBz23IUiLD+0mtqN6EKOsfgvPda7qrkZZhnxlrbnzkwHvZqce
	2TlhIGQ==
X-Google-Smtp-Source: AGHT+IG4TA19oJA/4NLEDCAtZNYyk5/Fvf1KUNRsATQ8NH8vXDbyFQpNYkvW01WeN1E9t9+6gYU+yg==
X-Received: by 2002:a05:600c:1552:b0:453:6332:a98c with SMTP id 5b1f17b1804b1-454b35ef640mr26770155e9.1.1751788455272;
        Sun, 06 Jul 2025 00:54:15 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bde35dsm103473235e9.30.2025.07.06.00.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 00:54:14 -0700 (PDT)
Message-ID: <9320092b-548d-4870-8d5f-d007a3713a81@linaro.org>
Date: Sun, 6 Jul 2025 09:54:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: dwc3: add support for SpacemiT
 K1
To: Ze Huang <huang.ze@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250705-dwc3_generic-v5-0-9dbc53ea53d2@linux.dev>
 <20250705-dwc3_generic-v5-1-9dbc53ea53d2@linux.dev>
 <aGkkKEMyY1JG7Z80@monica.localdomain>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <aGkkKEMyY1JG7Z80@monica.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_005417_032866_5CA8C424 
X-CRM114-Status: GOOD (  11.77  )
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

On 05/07/2025 15:10, Ze Huang wrote:
> On Sat, Jul 05, 2025 at 09:01:25PM +0800, Ze Huang wrote:
>> Add support for the USB 3.0 Dual-Role Device (DRD) controller embedded
>> in the SpacemiT K1 SoC. The controller is based on the Synopsys
>> DesignWare Core USB 3 (DWC3) IP, supporting USB3.0 host mode and USB 2.0
>> DRD mode.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Ze Huang <huang.ze@linux.dev>
>> ---
> 
> Hi Krzysztof,
> 
> I kept your Reviewed-by tag, as this version only includes minor updates:
> - Dropped the `interconnects` property
> - Updated the `resets` property to match the latest convention from Alex's patch
> 
> Let me know if you have any concerns.

It's fine, thanks.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
