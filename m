Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A98EC83F26
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 06:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SYEDV00P3t0QjQCLESt3eBQPShw080fYMQ7qYe9NKgE=; b=vnoiyhY4LRYOxh
	iVc8+2Etu6tZ2Yr+FCVETf+3N/4WD236s+aouY4WaTE/2wi7W0gP0EpgWmosVynOKrQM170rIiiJE
	D6fn2CRJrCtX2bkrloIuSzW7i8qB4q6ubiJlOX6LunX/PlGdKJs+DYjSYi+l4SVeRDMzocALudhKo
	XIdBuCxKaL+I69LWNqPALxTUZi69dpybofO/RERjUu6hcoctqvlr1ClZiWCGCq0uyLEkXAERAGIw6
	v3rieoehydwO1DPUsbMQgnxnSpC2483TxrNsm6LHIVgpVTRojHdl3mMzkf3JY41vkH+uXvCoiuTL/
	PNjj0MKcyC43N1L2pWEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugdfL-0000000G0Xk-13Ym;
	Tue, 29 Jul 2025 06:18:23 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugdfH-0000000G0X6-2Vqa
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 06:18:21 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3b780e4fb03so158873f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 23:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753769898; x=1754374698; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iojwzruvvVhAQ7wvF6ZE60oEZ08ONaB5lYxNaGGz2NQ=;
        b=vr/kRcoTg5oMZ+HY/0vqVS6bz933vE7umxQLD/0Q2J+8y4pzTxOX/rc+dFojZ6DcSK
         ONWFSWzqr0f+pwfQlNFlQeKPvpoCDzc8e/DB/uFLb7wz32cJBoe5jQMx8X4CvMbKMDrA
         IPQXk3TbdQJP+d0FacLLzzIyvBy1sc2R7dETOOgnSkEPBl/iZMKqbxhE/v6LojcJrtNl
         CtZz+NF77sZQJfSc8LPPABWUEuP96LBki75icl/8OpOtD3XBk+e9LuG6Aeq02doj/EZM
         c5Xm9yQQVoZdAXOKN55R5pMReZhQGnB9NwD0Yk9+bmQHkMkbu0iHoWPHQ/MlqYLOTEMG
         g8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753769898; x=1754374698;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iojwzruvvVhAQ7wvF6ZE60oEZ08ONaB5lYxNaGGz2NQ=;
        b=L1sJZNFKRsNYbg8nCPieNHwJccTqammkLVXrBYEP3/auC3M6j2W9yhv4AXubogETeR
         uxNyFJ5UtixlkFCf6HS+Eb8BXmB01dz6JdzOOnETYqcHUQvA4GcbehGjG28acFobTRLM
         B21QN4Logby7xaHXUDuS4JOuD1HoW30LxAEKqVwhBa9skcXGw0Z0IInlLvQmuPUg4og8
         r0+0eJaTatRPQXiEZqzEdwgxGYNkZ+8zinFL7FFekN0ZNIkfruJLdqbESpL6IPEkB6Vy
         caPMrQKCj+O1NIgiP/B6g5Ib1kXo6vF8JuNJD/ROtzF/eJgzTyNRq5LL88/NAoxfhSy4
         DfVg==
X-Forwarded-Encrypted: i=1; AJvYcCXsrRa9tB+WEdCM+CblHeUtyhSfuXzhxNO77x+og09l8rpyeE4yEEvmKShc7f96RIqMFeVlpm73mX9baQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8H0phf1ghettQxuZnGAlCk6jb+XhQY+ugr/Tis3BjfzJFQ5j2
	9tt3qGd3q9idXbuXJNxZyeAuxl+EdWrK3Zu7FJyjJ3oaN7y06KwDRLiijfC2kE69Ecs=
X-Gm-Gg: ASbGncu0BYSPwLobdmwY7lw4v4EBpFc7Sh7D6Mw4BMFwEnojqzKWUByg6pW1M3jpBFM
	iFEkZDEnhnIN2X2b2b4ml7b3QG+8qU99y8Ai41knpwD4JAVAeW4/pcvK7tpF64XvP1reBEoDUH+
	gnN667OvYD/MNv8C9urzkh3S/TitIPcgTUPJ76KH+psIip54m8hAOPFezIo5CO9S5zM3cuGNRV7
	FgTZaCiDneiZKa2f59Ce7VyEjBQpxgHncYyQ8PasjIT+tJXkWYdgRoNC9fEQpJYLj0W+l34Y6dP
	wxFO9sXPcPtlyDNjPD4Qg8uL6GZtuTlIiiM+jmeuf3rpnElzdtZtDI/tpAjkzdbs9PjTgM9mPS5
	jVMhKxXhsqj1SP/RegNFDvE47MkMq+e70mv7TGnc8TX0=
X-Google-Smtp-Source: AGHT+IFKMbXWi0CwmnHyn3tgyLCZQgSOUQBMZIij8kI76/pdZpcK3Rh2CaXNNCukSuKoaxDWztBswQ==
X-Received: by 2002:a05:6000:40cc:b0:3b7:8b43:ac7d with SMTP id ffacd0b85a97d-3b78b43add2mr1376216f8f.3.1753769897578;
        Mon, 28 Jul 2025 23:18:17 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778eba0e6sm11065009f8f.25.2025.07.28.23.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 23:18:16 -0700 (PDT)
Message-ID: <6479ef96-b7d3-40f6-aafc-a7a8a4177c41@linaro.org>
Date: Tue, 29 Jul 2025 08:18:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: dwc3: add support for SpacemiT
 K1
To: Ze Huang <huangze@whut.edu.cn>, Yao Zi <ziyao@disroot.org>,
 Ze Huang <huang.ze@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250729-dwc3_generic-v7-0-5c791bba826f@linux.dev>
 <20250729-dwc3_generic-v7-1-5c791bba826f@linux.dev> <aIgmrQ7afSO5sjB_@pie>
 <aIhi9JKZvuYh2Rz_@cse-cd03-lnx.ap.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <aIhi9JKZvuYh2Rz_@cse-cd03-lnx.ap.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_231819_680087_A61FF016 
X-CRM114-Status: GOOD (  15.59  )
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

On 29/07/2025 07:58, Ze Huang wrote:
> On Tue, Jul 29, 2025 at 01:41:01AM +0000, Yao Zi wrote:
>> On Tue, Jul 29, 2025 at 12:33:55AM +0800, Ze Huang wrote:
>>> Add support for the USB 3.0 Dual-Role Device (DRD) controller embedded
>>> in the SpacemiT K1 SoC. The controller is based on the Synopsys
>>> DesignWare Core USB 3 (DWC3) IP, supporting USB3.0 host mode and USB 2.0
>>> DRD mode.
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Ze Huang <huang.ze@linux.dev>
>>> ---
>>>  .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 124 +++++++++++++++++++++
>>>  1 file changed, 124 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..7007e2bd42016ae0e50c4007e75d26bada34d983
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
>>> @@ -0,0 +1,124 @@
>>
>> ...
>>
>>> +  resets:
>>> +    items:
>>> +      - description: USB3.0 AHB reset
>>> +      - description: USB3.0 VCC reset
>>> +      - description: USB3.0 PHY reset
>>> +      - description: PCIE0 global reset (for combo phy)
>>
>> Why should the USB driver takes care of the PCIe stuff? This sounds
>> strange to me.
>>
> 
> On K1, PHY depends on the clocks and resets it shares with the controller,
> and the controller driver is guarantees that any needed clocks are enabled,
> and any resets that affect the PHY are de-asserted before using the PHY.
> 
> RESET_PCIE0_GLOBAL reset is necessary during, and only, the calibration stage
> of combo phy.


But this is not PCI! Why would you call it "I need to reset PCI" while
you describe the USB device?


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
