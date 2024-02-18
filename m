Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AABC48BF6
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Feb 2024 15:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9vvry6EPSHdj1HuOPjzSVKlZAiwggkvYB/yn7TeWQ6M=; b=oPo529sk7/P6SB
	JQv7EK1RnePnQo9DweRswtgIVLIYNaJBxK1WRJsazXAcOMRy4rWEtVDwDLv8tHwZY2a/b68PIeSFA
	xb/onF4LqjC93EFW0f3ibXq5Z/r2lj02CDjybWXCLexWLwmOJsE/sUO7b9s5V2p8C0mWK4TUx32Oy
	f2yREqJeWtlzr3gCH5am46xYiw7Q+WQASJoijmGx4YIZtf2i4Yn6SVHLTSPVO9cMAqnd/lEAhY0Gi
	lwpk3vV3AMtLXMpVBYOODMIMYDxiqKgOL2Bc46Cp7hC7xvMJLGI4wjSTO713B9VC50b41CweCjdfn
	HpR742YI+AiQ0KI5HEPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbj6V-00000007xS5-0TMJ;
	Sun, 18 Feb 2024 15:29:19 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbj6R-00000007xRG-3bYY
	for linux-riscv@lists.infradead.org;
	Sun, 18 Feb 2024 15:29:17 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6818a9fe3d4so22889976d6.0
        for <linux-riscv@lists.infradead.org>; Sun, 18 Feb 2024 07:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708270153; x=1708874953; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sA/SDVQnKOxW6UupKa+w/g4FZh2wW67n4R63yMQWkV0=;
        b=NSosUhyUoOSHtLWwei5913MPzrvJaEh7BDGQpJp5F+DCVJAa0jcVA+ORRcBNGHx1RF
         4dxInBdJIE6cFQ/FgqHP57SD1IewWqls2PcBAewo9haAX7WqnmuZn2RqkV4SaljirO3H
         hgnvaleqjLeo6FFubYVP+dXlkswtkNphi5Cjc99bUCmZB9j2lAI08sEmU1fRDaNjzjyW
         HVgu6+L4pMfPDqyUafYy+makmMvcyTYPPuyfqVG9V45QWjjL1Tz3CHwuuMs/Fi4mHhfk
         hgrUJ1wbxjGXmfy7p1uNqxnyTKqdN1w43u/SHwp4uHZz/2UB8eh+Z1oT1euPnnU5e5eg
         ioZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708270153; x=1708874953;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sA/SDVQnKOxW6UupKa+w/g4FZh2wW67n4R63yMQWkV0=;
        b=DCk0HHyq8JpcYWW5KAJusGv9mdQ8zOqAK1P427xsnFo/pGIMir09XMpmnpJFG0uBZd
         o+2blwMuDMReWAmCx4WwDynnEFFLFzGwYjy9hYS3VwrpIGEhO/ljM/9WERF8QgUDJFUm
         +vKpdyGRUtXqlYQvHw8W5kri8cr1sKAiZRynuS1JVM4GBrUX2M2qsFZPSEDRQBIbw/7x
         LQfbnbo4kI+gCuVvNhhTJwhxL68Evpf3X0lJpG3yziMJTJgvEVIU0ZblRMONSUrzzYiN
         7DPoMPAL150jNOkj8wGC4QHEeAqnUvuifJNSdznr/cjyLUm2imBkwZ335AhCtbMvA18m
         76xg==
X-Forwarded-Encrypted: i=1; AJvYcCWptxpdUmW1KvHzstbQBnFHCU9mLlz5x9YzoOMdU4kB4PgGehjlJvt2oHYbrUzRiO44m/mmVhwFnw6hsIUTmffLnjB8db1ocM7qUj5AhoUR
X-Gm-Message-State: AOJu0YyNa0WEkMe9/IM+qySbRSOP3iCRn7hR4D5kHenOctRd9v4S4CXP
	qfXYdyCLKRC8e9F5ehNAHdgQ/DsPW/AH7/oU1jK6Q0ci676LhDQYYTWNK3PzNPI=
X-Google-Smtp-Source: AGHT+IFYjEWHXZNGVIdDOUHife0DwAl47pjuT11DGcHdgJFzG89QSi8SN5G0rSimAf7gcq/tXvbxJw==
X-Received: by 2002:a0c:dd91:0:b0:68e:fcc4:cb22 with SMTP id v17-20020a0cdd91000000b0068efcc4cb22mr10908385qvk.35.1708270153536;
        Sun, 18 Feb 2024 07:29:13 -0800 (PST)
Received: from [100.64.0.1] ([170.85.8.176])
        by smtp.gmail.com with ESMTPSA id lq2-20020a0562145b8200b0068f4659b8d0sm1741150qvb.107.2024.02.18.07.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 07:29:13 -0800 (PST)
Message-ID: <72221da1-4a1a-4947-a202-9de203032f5c@sifive.com>
Date: Sun, 18 Feb 2024 09:29:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] dt-bindings: cache: Document the
 sifive,perfmon-counters property
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Eric Lin <eric.lin@sifive.com>, Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org
References: <20240216000837.1868917-1-samuel.holland@sifive.com>
 <20240216000837.1868917-2-samuel.holland@sifive.com>
 <eeb2331d-10e6-4902-91ba-85896a8f0ee1@linaro.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <eeb2331d-10e6-4902-91ba-85896a8f0ee1@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_072915_949896_CB49AFF5 
X-CRM114-Status: GOOD (  12.32  )
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

Hi Krzysztof,

On 2024-02-17 3:00 AM, Krzysztof Kozlowski wrote:
> On 16/02/2024 01:08, Samuel Holland wrote:
>> The SiFive Composable Cache controller contains an optional PMU with a
>> configurable number of event counters. Document a property which
> 
> Configurable in what context? By chip designers or by OS? Why this
> cannot be deduced from the compatible?

This parameter is configurable by the chip designers.

The information certainly can be deduced from the SoC-specific compatible
string, but doing so makes the driver only work on that specific list of SoCs.
When provided via a property, the driver can work without changes on any SoC
that uses this IP block. (None of the SoCs currently listed in the binding
contain a PMU, so there is no backward compatibility concern with adding the new
property.)

My understanding of the purpose of the SoC-specific compatible string is to
handle eventualities (silicon bugs, integration quirks, etc.), not to
intentionally limit the driver to a narrow list of hardware.

Regards,
Samuel

>> describes the number of available counters.
>>
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>>
>>  Documentation/devicetree/bindings/cache/sifive,ccache0.yaml | 5 +++++
>>  1 file changed, 5 insertions(+)
>>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
