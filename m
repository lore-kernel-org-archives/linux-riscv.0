Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A2AC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Apr 2022 22:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ucIoTNMXNiXuhN1dGkVU2QTlPAjBcBmpuum7ppcrvTY=; b=ZaxdKc7IRL8N1l
	hLMInqE/03Ou0R8ZeV8yJmO3PWWX6ebbVIfz45JgXKOkyFAtCzxgI6jD/wl4pz+84+b4tdqZOgIyf
	iv5YB8ux3ZFVFXkbmDSwU2IhRu8Pw8dnuo2S+gMtnNWz2GqglJmJL/ry2xZHtRFD3ROUY0kaMzNtj
	duaav/Dk15SSLK46QE5FuetLGUh7UGBi9zEbZ7dc2vefguMITydoOLkrHRXIhfQP8++WVYXTksipO
	zVeMjcbpRmLPUSAiR9ysMsX0/rC8ja8aoVJLyLRu5gZmJfq1tsa4kUMugMI8LRzszu2xDiAeE8lPl
	eaFoad9ex7cMtoMx932w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni1pa-002jLw-TG; Fri, 22 Apr 2022 22:32:51 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni1pW-002jKm-Kh
 for linux-riscv@lists.infradead.org; Fri, 22 Apr 2022 22:32:48 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 u17-20020a05600c211100b0038eaf4cdaaeso8853698wml.1
 for <linux-riscv@lists.infradead.org>; Fri, 22 Apr 2022 15:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QjDGFJQ5+1+ljveXxjlk6iDPqQSULywPpuzcwSFf81I=;
 b=GzBxg70l/bOHPRVWxgyL2QxnrcNVvHr2+e8esQjVjta19VNcNKBIYPwA6HNkPep8z3
 Z3xQoYeA6gLP4hM5bFKR8V8U1RChQXKTgc6tVLccT2QDWkZqgBSRqN65rNxQcuKbF0HP
 dgAoSDRlqrv/3vq+DUN50Nh7LS3ZZoDN2dMhr3dsknagGLrRS6u3xJgyP7IeUcgWelin
 voZAHwBeV+N+4o43re+HKF8SgDrzhNYUS6We95HjmUxW2V6qG7TR4W/Op2JFU9AjMU6c
 j1PCgHLP4uTp6geEHSoC2ZRP8z3nLoVJ3CL69t1BpgHeLgDE7cL+8a3jFwScZdfDjnaV
 F1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QjDGFJQ5+1+ljveXxjlk6iDPqQSULywPpuzcwSFf81I=;
 b=4S+eTUZId+HkEaVFjmtl3mDIVy+9w6Ox9aPdlEb2pc56YzbdHhpTQzGyAXd00J1nho
 ZJHhdRg/NyiKbN+pTJECIhFeizEzzLmNRYAazJxzthfMjk5IxTyScqHmFMjuxSpTwT6E
 D0HrSdSmF4SNmjAj94K8UufX2edt9OCrRIr+vMAlbJZA6aX2DFrHurIJ0HJuOW4yx85M
 zjj7R0qNpqq7hLDHHxpXCmW5PDD/o8w5f/cex5UF6bX73+ommqeiyORUor3y2Ol9Pc1T
 M5cMulgDXdY11Q59ZTLP1oxGJ5mbaYuFa7odeTybYx7hSXJgLJ1//N6Q8Ea4NWW2ZI5o
 WGCQ==
X-Gm-Message-State: AOAM532OxKvyWJeH/ie2FYxidC4XjeAK4h0I/XwFZLuTIbJgXK3RlEma
 MIoWEDxk0hIze+2vJMKGCrXYwA==
X-Google-Smtp-Source: ABdhPJwPi/GQDOa8NP7gyEDIAvUeuE6yGVBDKV31z32nXAT4dfyCH+cdIGbkqNxLyDROau+EGU45gw==
X-Received: by 2002:a05:600c:1584:b0:38e:c80e:b8b5 with SMTP id
 r4-20020a05600c158400b0038ec80eb8b5mr14901989wmf.99.1650666763976; 
 Fri, 22 Apr 2022 15:32:43 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.209.28])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a7bcc0b000000b0037e0c362b6dsm2572514wmh.31.2022.04.22.15.32.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 15:32:43 -0700 (PDT)
Message-ID: <c12b44ae-9d8a-c0dc-880e-fd960715e519@conchuod.ie>
Date: Fri, 22 Apr 2022 23:32:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 0/9] More PolarFire SoC Fixes for 5.18
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>
Cc: atulkhare@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Conor Dooley <conor.dooley@microchip.com>
References: <mhng-185e3a61-0634-4671-adfd-a1cc223920cf@palmer-ri-x1c9>
 <0f99ec7b-0c2f-cf6c-162d-af615eb73373@conchuod.ie>
 <CAL_JsqJpd1dBNmWcsbLQZAWj=0am_98ztonOxEgGjXBGddfiNA@mail.gmail.com>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <CAL_JsqJpd1dBNmWcsbLQZAWj=0am_98ztonOxEgGjXBGddfiNA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_153246_729366_3491BA0B 
X-CRM114-Status: GOOD (  33.89  )
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

On 22/04/2022 22:52, Rob Herring wrote:
> On Fri, Apr 22, 2022 at 2:59 PM Conor Dooley <mail@conchuod.ie> wrote:
>> On 22/04/2022 20:39, Palmer Dabbelt wrote:
>>> On Wed, 13 Apr 2022 00:58:27 PDT (-0700), conor.dooley@microchip.com wrote:
>>>> Hey all,
>>>> After the clock driver for the PolarFire SoC was accepted I started work
>>>> on the onboard RTC & found out that the reference clock for the rtc was
>>>> actually missing from the clock driver.
>>>>
>>>> While restructuring the clock driver to add support for the rtc
>>>> reference, I also noticed that there were some problems with how the FIC
>>>> clocks were being used. The FIC clocks are the cpu side inputs to the
>>>> AXI fabric interconnections & are not the clocks for any peripherals.
>>>>
>>>> This first three patches in this series fixes the problems with the FICs:
>>>> - the fic clocks incorrectly had the AHB clock as their parents
>>>> - the last fic, named differently to the others, had not been set as
>>>>   a critical clock
>>>> - some peripherals on the fabric side were incorrectly using the cpu
>>>>   side fic clocks, resulting in incorrect rates.
>>>>
>>>> The second part of the series fixes the missing rtc reference clock.
>>>> There are three main changes:
>>>> - Changing the reference clock in the dt to the external 125 MHz
>>>>   oscillator rather than using the output of an internal pll. This has
>>>>   the added benefit of not requiring changes to the device tree if this
>>>>   part of the bitstream changes.
>>>> - Adding a new clock into the driver that sits above the existing
>>>>   configurable clocks & has the external reference as a parent. The new
>>>>   clock provides the parent for the AHB/AXI clocks which formerly came
>>>>   from the device tree.
>>>> - Adding the rtc reference clock to the dt bindings, device tree and
>>>>   clock driver at the configurable clock level, alongside AXI and AHB.
>>>>
>>>> I kept series separate from [0] since that's tied to the CONFIG_PM stuff
>>>> & fixes a specific problem.
>>>>
>>>> Changes since v1:
>>>> After speaking with Krzysztof, I have merged the rtc reference changes
>>>> [1] with these fixes for 5.18. This was done since the relevant drivers
>>>> and bindings only arrived in v5.18 & there'll now be no issue with
>>>> breaking the ABI.
>>>> Backwards compatiblity with the device tree from before 5.18 will be
>>>> broken by these changes, but the board did not boot then anyway... If
>>>> that is not okay, please lmk.
>>>>
>>>> The patch renaming sys_base was dropped since that's not a fix.
>>>>
>>>> Version 1 would not apply without [0] & that should be fixed too.
>>>>
>>>> Thanks,
>>>> Conor.
>>>>
>>>> Changes since v2:
>>>> - Wrapped text in dt-binding changes at 80 cols
>>>> - Ordered the clock defines numerically in the binding header
>>>> - Fixed the Fixes tag on the last patch and added the second tag
>>>>
>>>> [0] https://lore.kernel.org/linux-riscv/20220408143646.3693104-1-conor.dooley@microchip.com
>>>> [1] https://lore.kernel.org/linux-riscv/20220411072340.740981-1-conor.dooley@microchip.com
>>>>
>>>> Conor Dooley (9):
>>>>   clk: microchip: mpfs: fix parents for FIC clocks
>>>>   clk: microchip: mpfs: mark CLK_ATHENA as critical
>>>>   riscv: dts: microchip: fix usage of fic clocks on mpfs
>>>>   dt-bindings: clk: mpfs document msspll dri registers
>>>>   dt-bindings: clk: mpfs: add defines for two new clocks
>>>>   dt-bindings: rtc: add refclk to mpfs-rtc
>>>>   clk: microchip: mpfs: re-parent the configurable clocks
>>>>   clk: microchip: mpfs: add RTCREF clock control
>>>>   riscv: dts: microchip: reparent mpfs clocks
>>>>
>>>>  .../bindings/clock/microchip,mpfs.yaml        |  13 +-
>>>>  .../bindings/rtc/microchip,mfps-rtc.yaml      |  15 +-
>>>>  .../dts/microchip/microchip-mpfs-fabric.dtsi  |  16 +-
>>>>  .../microchip/microchip-mpfs-icicle-kit.dts   |   2 +-
>>>>  .../boot/dts/microchip/microchip-mpfs.dtsi    |  10 +-
>>>>  drivers/clk/microchip/clk-mpfs.c              | 191 +++++++++++++++---
>>>>  .../dt-bindings/clock/microchip,mpfs-clock.h  |   5 +-
>>>>  7 files changed, 211 insertions(+), 41 deletions(-)
>>>
>>> Thanks.  These generally look good to me, but I don't see acks from everyone.  I'm perfectly fine treating these as fixes and taking them through the RISC-V tree, but looks like it's mostly clk stuff so
>>>
>>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> Ye, hopefully they go via clk. Stephen replied to v1 or 2 so
>> I figure they're in his queue :)
>>
>>>
>>> in case someone else wants to take it.  I've put these over at palmer/riscv-pfsoc-clk but haven't merged that anywhere, I'll hold off until at least next week to give everyone time to chime in.
>>>
>>> On a somewhat related note, I'm getting some DT schema failures
>>>    /scratch/riscv-systems-ci-fixes/check/dt_check/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: /: memory@80000000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
>>>            From schema: /home/palmer/.local/lib/python3.8/site-packages/dtschema-2022.3.2-py3.8.egg/dtschema/schemas/memory.yaml
>>>    /scratch/riscv-systems-ci-fixes/check/dt_check/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: /: memory@1000000000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
>>>            From schema: /home/palmer/.local/lib/python3.8/site-packages/dtschema-2022.3.2-py3.8.egg/dtschema/schemas/memory.yaml
>>>    /scratch/riscv-systems-ci-fixes/check/dt_check/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: soc: syscontroller: {'compatible': ['microchip,mpfs-sys-controller'], 'mboxes': [[15, 0]], 'status': ['okay']} should not be valid under {'type': 'object'}
>>>            From schema: /home/palmer/.local/lib/python3.8/site-packages/dtschema-2022.3.2-py3.8.egg/dtschema/schemas/simple-bus.yaml
>>>    Looks like none of them are new from this patch set, though.  Atul's been chasing down various DT schema failures so they might be fixed already.
>>
>> Ye, I do know about those. I meant to try deleting the clocks
>> property but didn't get a chance, just been busy. It's not
>> related to this series nor does it matter if it makes it prior
>> to 5.18 so I was going to submit it on its own.
>> The other is in my list-of-things-to-ask-Rob/Krzk-when-I-know-
>> for-sure-what-my-question-actually-is...
> 
> microchip,mpfs-sys-controller doesn't have MMIO registers, so it's not
> on a MMIO bus (aka simple-bus). Move it to an appropriate location
> (top level if not part of something else).

sys controller is meant to have a qspi flash too, which I hadn't added
yet as it does not work with sample silicon.
I'll send a fix for both warnings Monday.
Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
