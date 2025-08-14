Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB1ACA0EDC
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 13:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mOTuQd4QWp9QUaLTYxJaciRmPI1539QP52ZhxKUVP1g=; b=3vJH3eAvlEQho0
	Bzk9bTYWQyOAnJrG3vp0tQ8RSPQ6sQu5ChUibs1fUydhcKJt7jWBhLF5CzI1sF+utd9dQjuxwMy3X
	xYA4K9oinIx5SZ6+cg8DcgcNxsQeIZPCGetkpJ4M38ThatgQx2EN9k1h5xzDiIvQlgRmaHMc0N7/d
	WMqH0mLepDmL/9UzbE2eC2e5AtZ0GgPZEKwMHCoZ2Jx+9cq6eBuXeaxCavB8A/jqcD7GWbSRbbyqx
	x850nBsCmp1o28qU1wAY2Rw/xX3uUdDWqORc7z5vUiide2KsynXkhzm5f3qrGlW0prgxFd5RhjSmH
	fMLoncOxDBxZCuErRNrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXuk-0000000H2F5-2Zs5;
	Thu, 14 Aug 2025 13:22:42 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umWcf-0000000GnaD-0TCb
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 11:59:58 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-88432cbf3fbso64255239f.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 04:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755172796; x=1755777596; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VkZ6MdXAK8oUuFYjzHuswEeWUTNOi4hs6qI/H9CSMKA=;
        b=y7SRTTCwQrIqJD860dM2o5nuKvmRzLciorQ5yM85b34XMyuxpu/gNAXRRv3AttVECa
         KbS9R7BYbrNx0YOzX0nng4k4J18OQ8rSfFS4QEHY8EyUra5MbXWTtj4VVT3QXE6IrwSj
         6xf+eWv6p+05i3Bprh048AXK6r9hanfPcTksqhT5KDsSBGBoI7Sw6PiX7MKZ3tyOTw54
         3MeA1tfZt7UX5ylYOt58zxHbS1y1QPeZ4M1vwXp7kThjBjUZD3FVXaSP3nZDvTcioNKh
         5bbH7pMn8KwwoXxiDZPvx7d+O0taZ9lv8WfJhBFCplpeo/lb5SYMkRc/LJRbJkRPJADL
         IQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755172796; x=1755777596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VkZ6MdXAK8oUuFYjzHuswEeWUTNOi4hs6qI/H9CSMKA=;
        b=lCPuCsd90f1Jl7lQs0YWhfhD8L4Qt+ClBEXJbyQTem5BQn/yasKtOS9s+4fsclbnvH
         L0XO0hQPF3hZbROfpXo6pMpot7+QnfUeLGWcXbMWrwLjMm7DGzyBE9DP1z75ECtHXiPj
         gG2+KcMR9bTS1eSURBMC5JAFisU+FSHKeaxwzJTbexwM0Lnfkh+jYv6ez1eUtLW25P6K
         igZj+9zDLE97/ipfKOYpMRvtvpDLqS6VfYvO71VBXzrmUGMQFxY1gOGhH5I6jgr7q739
         xQHf8qWAwbEjZ3DeA2SPJU1Xj/JsQP2brUjN2VIDE0zci+bARcg0hvpeTnp/t1RZ8ELB
         m4Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUv8hQ2E6TnCzHgC7MaM/AfKlVXeO87NEKZOA2poUyzOb9OIdoTC2cprpxGq1SpA25yTy/2mLtBPaBwWA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7vLqb4WJmQwW1oEkS2jssBu54iesN5Y1b8c01v/p0tUv/1Y6Z
	pD08TvFsLtkmdVf49K1QH7Xs43EZxCzrrsOgeqB27LtzFW72eRoGCPyydvrDp3O1EDo=
X-Gm-Gg: ASbGnctSWDksv3lsHG3lmPj3e5cyKFeEv+vzoe9ciMfdCPHnVu/q+INsOK0RkpEnLQr
	5+g84vdTduecBVktBPfSLkrWJ0L+YYQsNoJrb8GursXNOFwjwRHfbTredaw/5kRF66ehIv4lgua
	xs67oAaKZHVbmjeMGyEiLlgje6wNsZ6pf14rucLcUKRppJoCLV9yDwisMatCiKz75ConN2fNpPk
	O6v+cyn/0Y8O5xCg85YXIoEmqee7p8nYih/H4Aivhtq3sZGtVar9VafsjFHmaUKBXnmGcRSMzpz
	B5VaMPvLxensaMWFOLGsTnE6MT1WCQ/iK7R0iJJMtsZXr8UK4pN5LLHOOFm0KA+UFJYfuNoHe/6
	XmlyTwk1G9eLpRoN9H045TmkSeByoxYEtD4edzuY110SUVqKVsVBJ/aBx6X0Ehg==
X-Google-Smtp-Source: AGHT+IE3y11zxXdSZ7xsXLUpghewNnJCpWK8G2mFkAzcKjVS5vSn5G3dmjKvLqQoKez3LPNe1hHEcQ==
X-Received: by 2002:a05:6e02:184c:b0:3e5:6daf:ddfe with SMTP id e9e14a558f8ab-3e57084ff05mr51337105ab.10.1755172795698;
        Thu, 14 Aug 2025 04:59:55 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9cbb659sm4480210173.93.2025.08.14.04.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 04:59:55 -0700 (PDT)
Message-ID: <86174012-fd87-41d7-9568-f9c0b544c1c4@riscstar.com>
Date: Thu, 14 Aug 2025 06:59:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: phy: spacemit: add SpacemiT PCIe/combo
 PHY
To: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, bhelgaas@google.com,
 vkoul@kernel.org, kishon@kernel.org
Cc: dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 tglx@linutronix.de, johan+linaro@kernel.org, thippeswamy.havalige@amd.com,
 namcao@linutronix.de, mayank.rana@oss.qualcomm.com, shradha.t@samsung.com,
 inochiama@gmail.com, quic_schintav@quicinc.com, fan.ni@samsung.com,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pci@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250813184701.2444372-1-elder@riscstar.com>
 <20250813184701.2444372-2-elder@riscstar.com>
 <22bd5b5b-ca06-4499-b21f-22c2ff202167@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <22bd5b5b-ca06-4499-b21f-22c2ff202167@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_045957_148247_2E8DD05B 
X-CRM114-Status: UNSURE (   9.28  )
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

On 8/14/25 1:11 AM, Krzysztof Kozlowski wrote:
> On 13/08/2025 20:46, Alex Elder wrote:
>> +                      "mstr",
>> +                      "slv",
>> +                      "global";
>> +        spacemit,syscon-pmu = <&syscon_apmu>;
>> +        #phy-cells = <1>;
>> +        status = "disabled";
> 
> You cannot have disabled examples. This also means it could not be
> checked/tested.
> 
>> +    };
> 
> 
> Best regards,
> Krzysztof

OK I'll fix that in both places.  I think I just copied in the
actual DTS content, but I now understand the problem.

Thanks.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
