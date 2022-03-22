Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27347C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Mar 2022 00:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=r7Ew775SDC1OxYrn+0VP1poVtv4FW5uChSGoah7+ppc=; b=Ncq71T1KEnna/rDiuohI3fkbT8
	Ur4aqOrolwTPRFedU9fwOIvJC+jcopOL2zsEdPZSPEIkjT3zj2i1cpVmuS9nmw7XBV4uhPHoddoQp
	QFVx1ApOeON4Mc/Dx5HJo0v9Ueu0+26XyKhOz3vLpY1MGYuixmVjNXuYxXVQCKV+QcnriELwVlJYG
	c7bKVjBTOMPCmd5zlA9WoYeLK8M/dCXG0t5SWzumV03p30KTYoQato7YWSLxnzwesLIH75ikaao/B
	MCt8IrrArK2gy32BO9UvDEZATkPqg/tVqN9zd9fX8hndp1J8W+KspTVIus1Ga0iNzL01mZsOZ5aMF
	/AipALFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWSQh-009WDW-B6; Tue, 22 Mar 2022 00:31:19 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWSQd-009WCV-6n
 for linux-riscv@lists.infradead.org; Tue, 22 Mar 2022 00:31:17 +0000
Received: by mail-pg1-x531.google.com with SMTP id o8so11468681pgf.9
 for <linux-riscv@lists.infradead.org>; Mon, 21 Mar 2022 17:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=XM+TgxL8NHgpPQL8bNe7xChjlBYLCqdsfBPXoOydz/4=;
 b=s0Fu9HWt/+zWpGu6X8LA5mlRPC2raz0O4wG31dfI7nUvlDL2JyI/6eG2SfoilMIQeP
 lIt+3IRsR7pVtUmx4lATqbzn2hxjETQo3aHqxVfmbngEo/nEHMLfbhL3zEk/MS59fuyx
 iNf5UU8g4GEL9+4zTuIjJk6sJLKPsR2hmCKFBsjbmWtSv23OOInMbj1tfjN/Y9cSD6vl
 ewtGEB6JK6D4eWQOgHc5GI4ANOdgFiLWQ6w4uKssd7XSNcal1uz8qb2ywUgvxkFXTXRi
 AhZUG7/LE82C1zlMGtoQkoWedXeMKAGXd5wTBgmQACiG7XvTixbV4b/tNffzdkNVfRch
 2RAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=XM+TgxL8NHgpPQL8bNe7xChjlBYLCqdsfBPXoOydz/4=;
 b=MB79zuBuTvFlu2BnnTN7ucj9iIIp4wM7kGq2GkEqFKIO3MUP4b7dF0I6kJtOYoJ94i
 pdpD/g+8nIUMyClYz89NdsFMwpnMZ4ahQhVJncUBqRur+opPeyrBoSSI0BTnjZ8HmUvo
 EolVzn8z3wga2wnBj1mkOny3quoHRBlviyt+NlglL/P42oiEkNg46xdZg5veJiVOq8Pv
 hhMVxXxCsWndqQZJrwPYVeu8QxkltNfyGqgRf+T066FVBSYFQHAK9wdaK1mWOGO7JPnD
 eMloC9skUXwqv+5kO7dSIA0o9u3wrbPDlslBOfCVRVMGVY3hdE7IM5kqKRTPlE7ZnZ6d
 teCA==
X-Gm-Message-State: AOAM532SVDKithjZLIrWvwSQrOzZ3UMEmatosPtbH9fCsq88s4YBVo2p
 SrADwQmDXafX7QRS7PeAGv+a+scPQnpfUg==
X-Google-Smtp-Source: ABdhPJxf8rrrAYGNrfInbsQntDvoeDQOh3KjS8VS/BtItwV2lILWmyam/HWUReGDbcNmSPGzvmDCwA==
X-Received: by 2002:a63:1248:0:b0:381:54c9:1a1a with SMTP id
 8-20020a631248000000b0038154c91a1amr19652958pgs.185.1647909074036; 
 Mon, 21 Mar 2022 17:31:14 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 lp4-20020a17090b4a8400b001bedba2df04sm535823pjb.30.2022.03.21.17.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 17:31:13 -0700 (PDT)
Date: Mon, 21 Mar 2022 17:31:13 -0700 (PDT)
X-Google-Original-Date: Mon, 21 Mar 2022 17:31:11 PDT (-0700)
Subject: Re: [PATCH] MAINTAINERS: sifive: drop Yash Shah
In-Reply-To: <ef965982-0c21-9cc7-1e5a-69726671ba1f@canonical.com>
CC: linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, 
 aou@eecs.berkeley.edu, p.zabel@pengutronix.de, sagar.kadam@sifive.com,
 linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: krzysztof.kozlowski@canonical.com
Message-ID: <mhng-9e915473-a905-42ef-908d-2d84b08a3023@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_173115_273314_41C5964D 
X-CRM114-Status: GOOD (  17.96  )
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

On Thu, 10 Mar 2022 23:33:54 PST (-0800), krzysztof.kozlowski@canonical.com wrote:
> On 11/03/2022 04:14, Palmer Dabbelt wrote:
>> On Mon, 14 Feb 2022 00:23:49 PST (-0800), krzysztof.kozlowski@canonical.com wrote:
>>> Emails to Yash Shah bounce with "The email account that you tried to
>>> reach does not exist.", so drop him from all maintainer entries.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>> ---
>>>  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml     | 1 -
>>>  Documentation/devicetree/bindings/pwm/pwm-sifive.yaml       | 1 -
>>>  .../devicetree/bindings/riscv/sifive-l2-cache.yaml          | 1 -
>>>  MAINTAINERS                                                 | 6 ------
>>>  4 files changed, 9 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
>>> index e04349567eeb..427c5873f96a 100644
>>> --- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
>>> +++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
>>> @@ -7,7 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>>>  title: SiFive GPIO controller
>>>
>>>  maintainers:
>>> -  - Yash Shah <yash.shah@sifive.com>
>>>    - Paul Walmsley <paul.walmsley@sifive.com>
>>>
>>>  properties:
>>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
>>> index 676b2160bada..605c1766dba8 100644
>>> --- a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
>>> +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
>>> @@ -8,7 +8,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>>>  title: SiFive PWM controller
>>>
>>>  maintainers:
>>> -  - Yash Shah <yash.shah@sifive.com>
>>>    - Sagar Kadam <sagar.kadam@sifive.com>
>>>    - Paul Walmsley <paul.walmsley@sifive.com>
>>>
>>> diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
>>> index 2b1f91603897..e2d330bd4608 100644
>>> --- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
>>> +++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
>>> @@ -9,7 +9,6 @@ title: SiFive L2 Cache Controller
>>>
>>>  maintainers:
>>>    - Sagar Kadam <sagar.kadam@sifive.com>
>>> -  - Yash Shah <yash.shah@sifive.com>
>>>    - Paul Walmsley  <paul.walmsley@sifive.com>
>>>
>>>  description:
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index ebf7a75a6bec..87eeac970ca2 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -7090,12 +7090,6 @@ L:	linux-edac@vger.kernel.org
>>>  S:	Maintained
>>>  F:	drivers/edac/sb_edac.c
>>>
>>> -EDAC-SIFIVE
>>> -M:	Yash Shah <yash.shah@sifive.com>
>>> -L:	linux-edac@vger.kernel.org
>>> -S:	Supported
>>> -F:	drivers/edac/sifive_edac.c
>>
>> Looks like that leaves this unmaintained?  I'm happy to volunteer, I've
>> got the boards lying around somewhere and sort of feel on the hook to
>> keep this stuff alive given that whatever's in there is partially my
>> fault.  That said, I'm happy to stay out of it so if it's OK to have
>> otherwise unmaintained EDAC drivers that works for me so
>>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> The patch was already merged. EDAC SiFive is now covered by generic EDAC
> and SIFIVE entries. Feel free to restore the entry with yourself.

Sorry for being vague there, I'd seen it get merged.

If having it covered via some generic MAINTAINERS entries is OK for the 
EDAC folks then that's fine with me, I just don't want to get into a 
spot where this driver is going to get removed because nobody's more 
explicitly maintaining it.  These SiFive boards are still the only ones 
that run a normal-smelling upstream Linux (at least until we can get the 
D1 issues sorted out, which is hopefully soon) and I'd hate to start 
dropping stuff if we don't need to.

So if it's fine for the EDAC forks to have things in the state the are 
after this patch was merged, that's great for me.

> Best regards,
> Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
