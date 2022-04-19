Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27303C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 10:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5F9Ttf7jBaGCrApFrQBfakaUavj3adbq7NKwG5MAwSg=; b=pQ9h5g78+ax979
	hbHZnGJuaEmTwxPzhPaWxJF8fzKY/0Z7RFjxJQkqWVHFh2k2OZCZY8phPYZQACMa7UQODCjLyniep
	xUEOR40oV4aJDop+Egj+4AzdQqdk9sa4LfOjw4X4qO5JOITNpmAPxmIAsO53gPV6DPrh2oXG5Or2M
	VMjsksVeILrXEzotT4Q1NvcwMMefWWoBpXJN8jLDOxd/xozqpUDZE5XnNvSJt2To7H483okVfDUqE
	Yz45j6CYR5E9EIhsdINSvERxGvBFzq9CEW2pdK1vY5h8h2QKqV8MVeU/TKOydqgEXBA9oB7tBZDxm
	Tr5rviAkuxdtG/XETy0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nglZn-002xqI-40; Tue, 19 Apr 2022 10:59:19 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nglZi-002xoO-1P
 for linux-riscv@lists.infradead.org; Tue, 19 Apr 2022 10:59:15 +0000
Received: by mail-ed1-x52b.google.com with SMTP id t25so20742699edt.9
 for <linux-riscv@lists.infradead.org>; Tue, 19 Apr 2022 03:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=O5CBBgo2XmuqRHrX5N+WoSNjs6N4HhMETq+ywg7Z0Yg=;
 b=GwQsMWFyaKqitOw2K4ERs71CebQ9j1lhJey/Ao6nQts3Wc6SMEgn4CdC0WON4y0Vrm
 i0yLF+4KbXWY7wiXOwo5nwO1XBJHRDKbNCdT9k2sQw7zbLTdP5rHacXzTeEcXBmkkh7g
 LxOftPR7vhQqeOA/C/0Mxj9IrFGcP7MUx298tHlp5QiSf2M8rCwHc+TVL1A2oqF2aQrZ
 b4pPubgl+bMvC1s/E4Y9g03d3nwBBmm/KSCdcNoQCO2cP43OFyK1UUKzvc/meCcBFg+i
 2/fTeTRXNzm4KPH9ZUAt7CG4JI+lDp4IAjPYS8jJJWr+28pRQWHEdHfPu/R3RxtLoFZQ
 XQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O5CBBgo2XmuqRHrX5N+WoSNjs6N4HhMETq+ywg7Z0Yg=;
 b=UfJET68HTbb3vKFBCSyT0hLE8l0Wf7hq8dkeaqrPVx4t8mPGKIBtf47yqyjUYgEHzt
 mKTo2yMOhJNmzJCUR2b430z1s4ngXqgj61ecfxLHpSxpBVJBMFL1FFjexFhhSTkoKC6F
 xvy65tDaYDycerwjqEetjPSNwizB5IYieeOoui1qWdoqMA4b9vGDkSSe/1Q+hGOoHmCg
 ru0gG39LeryPROrXrXhTHAW9lkttzsb7N8yRdxDIzebKypEqLJOGGtHAviXCZb8dIgqL
 gXi9wr3pVGvPE4aatL/eiYC3y+CUfRtv3OQSugWD1FdRnymXm0R+nNpShPuEkLM8+6Z2
 myFA==
X-Gm-Message-State: AOAM531P5+sogot1gwaSv8YiZUkvvWVrUfawujdYpfY+OXaBF72ahagV
 NvtUpT+M3k9XKoNSV59kk/BsIw==
X-Google-Smtp-Source: ABdhPJwtQ1BLQn620Xz+U8W+fow3tkpwQwbmB9aa9f+Wmx3sMsqJkjgv/5hgcw5cHgx5EnIoTMeDAw==
X-Received: by 2002:a05:6402:1e8c:b0:424:1d6:1b71 with SMTP id
 f12-20020a0564021e8c00b0042401d61b71mr2007309edf.211.1650365951850; 
 Tue, 19 Apr 2022 03:59:11 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 k15-20020aa7c04f000000b004229daeaf37sm6311685edo.40.2022.04.19.03.59.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 03:59:11 -0700 (PDT)
Message-ID: <20b63bd8-b527-43e0-884d-bf9fe3cacb19@linaro.org>
Date: Tue, 19 Apr 2022 12:59:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] riscv: dts: sifive: fu540-c000: align dma node name
 with dtschema
Content-Language: en-US
To: Conor.Dooley@microchip.com, green.wan@sifive.com, vkoul@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, geert@linux-m68k.org,
 alexandre.ghiti@canonical.com, palmer@sifive.com, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220318162044.169350-1-krzysztof.kozlowski@canonical.com>
 <20220318162044.169350-2-krzysztof.kozlowski@canonical.com>
 <a8c5d574-c050-bbc3-efa6-9b45f5f27524@linaro.org>
 <03e28a55-d3bd-f3e1-f418-557306d65505@microchip.com>
 <61923e45-6594-6dfc-5e2f-e808af99e7c1@linaro.org>
 <9f8faffa-0b0e-2fba-7f2c-56c82ec7936f@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9f8faffa-0b0e-2fba-7f2c-56c82ec7936f@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_035914_131191_59200A25 
X-CRM114-Status: UNSURE (   9.81  )
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

On 19/04/2022 12:57, Conor.Dooley@microchip.com wrote:
>>> Not sure that this one is actually needed Krzysztof, Zong Li has a fix
>>> for this in his series of fixes for the sifive pdma:
>>> https://lore.kernel.org/linux-riscv/edd72c0cca1ebceddc032ff6ec2284e3f48c5ad3.1648461096.git.zong.li@sifive.com/
>>>
>>> Maybe you could add your review to his version?
>>
>> Zong's Li patch was sent 10 days after my patch... [1] Why riscv DTS
>> patches take so much time to pick up?
>>
> 
> Oh, my bad. I incorrectly assumed that that patch was present before v8,
> I should've checked further back - sorry!

No problem :)

I don't mind Zong's patch to be taken although in general I believe more
in FIFO (or FIF Served) style.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
