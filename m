Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9156BC28B30
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 13:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Snpi+a9ohSpo/dNK5hnmKNidpNdrFR81qQzcvAsmliU=; b=Dy88jsf/tenMm6
	lNl3Xc3gv4e8RHKL6lJFZpJJzZPm1oCYYOdQ5SaAbEIwkp12yaNIDueHzWdRwu8ZxcYINFxft2thW
	6nKSdxgJWDHQD84TnnBRAqmq+ki7rgNmOctkLTxxI59sj3zlC4CuHVTO+qJuB8JMQqZ4cN5iUjpgo
	1tLHmgMS6P34c3ZgkJqvBWAPRTsiVtODJHlQEoYXWlhUZV3rfaqSP5LPW2MsV1DrKxg0kU5YNBLc6
	GaQt48EmG1tOIntWpOpsx4/Zw4UKVNBjO7ezTnPfujidwaa03l/OYQLPLU9cDPHofhZSTAr1W+exX
	Ut9vcTNDTxFCNBmfcWBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLpd-00000008WTy-2t4r;
	Wed, 12 Mar 2025 13:09:09 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLZx-00000008TA7-1bnp
	for linux-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 12:52:59 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-4394036c0efso40048215e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Mar 2025 05:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741783975; x=1742388775; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nwgfY0bA7bSuiMHyspTu5vv4LRFssjPln36pp6aa5Co=;
        b=PVm4KVJ/sbHIgiZYOJ4qeKrJJp3+0sY20CNK0VjkWNrsRH5ey24KuugMGo1XAfB3Gb
         Dc2xaTL9GCGxfLH+suzpaD57kmQLbF4RCGiB3WpYFCy+hvwCn5VBkcIyZPCQaZvGSM2w
         +NbSYZmo5y5BPLW/v6BKb2EHrm5h7KZNscADwftgMwHBizLQyVdsJXjyvbtCk/drTkRO
         KTW0bXFnZQoGbHTlGG+Ar7o4aU82ZP7I1Ct4h3UYDuxiY/AkcBs49nDDKQyyRseQt04c
         BWnHGPsSUiNl4kvwTa0f7SAYIA6da53nHCFU0t1C0rlR0bq5FjQtpxcBkq3DQisEWD7p
         sG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741783975; x=1742388775;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwgfY0bA7bSuiMHyspTu5vv4LRFssjPln36pp6aa5Co=;
        b=jMMwtOzc/umtZl88SN1++B6q/qDJvPHtH3aCGiPtEbJW4lvUtcsIRsoxnFY4EILSs1
         nxzGLmvxmIbh4PE83qQhgOuKKEChHPGRiEAlDcwZY5ezJ6kwqOlqVWNsItlPoL4hFFHP
         h2f48ZoLDYzjHoJSTWvnBYZzNp0GTmAdpZI9KgrJ/uD8ZyHxkbO8EEYeZtPGXJ+OhWg2
         FqJr0yAAfUH9wlyUb4NkSCTDrWLzK87LIXte/xvfZYwvyuXfiE+BH5bg69dnUeKeFmaB
         gqNO0ARwMVk4kJv7VWpTiChr4y8btw8aILC9lZGnJSBtSDtETCXJNF/9pH8OQP26bKHa
         4g/w==
X-Forwarded-Encrypted: i=1; AJvYcCW47aMGeK4N6EMs/Esd4ep0HWV7BpOWxUHnLHHPs+3/aJsGZb/zjMaiuYIktGiXbg4QF4dxCEBVtjcpaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUk2hAu9yfWhp29yr1M3VDHqwrZXComFovBdWFMr2a5MRcVrCe
	PFRgMxjePnotYLA/HdVvbHWMUAuYX0B6gZS1anCK0aJYzxlCTRZCk7boQr4vgFQ=
X-Gm-Gg: ASbGncvkVJaioMR64zX7O0I7dDHz92csd9q659A3WzKDLkxaAfBnOFO05p8zAs01hZ/
	N9ajio89UIFHkyfnjIOY6wVEcF0JjYjuB5EoWLhz4+WPRsSW+9H+52QVRSZvfcbWO7UHN3cmopx
	db8NKmnZqYxV3MDozWjwUS36Dxyuc5ulPsk6c0rI8MXcJaNQN3z1AZd7UfMG5Q8jYMMIOVnM08P
	g7W+6Cx6czpbT2DSxV++50WZEKIngp7gyBvvltjr3nautFTRHKkuhSnU0pwDJ/jinGBiHgmlePi
	sLDxahBII1E0xwSFRWyqJqnWQu2lfwlnurhEMk92zS28nmHKb9KNiuu3rcxDheLMwtrW4uvJsxB
	e
X-Google-Smtp-Source: AGHT+IFoNwU6jrRyqYUKTwKTf0luECKdhiR/vKm+lodvkimjAahJBv9bVwtF43mm4/BByxpK4rSIQw==
X-Received: by 2002:a5d:47a7:0:b0:391:29f:4f87 with SMTP id ffacd0b85a97d-39132da905cmr14902396f8f.49.1741783974656;
        Wed, 12 Mar 2025 05:52:54 -0700 (PDT)
Received: from [192.168.0.19] (81.172.62.104.dyn.user.ono.com. [81.172.62.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c015a29sm20599776f8f.42.2025.03.12.05.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 05:52:54 -0700 (PDT)
Message-ID: <31f8a6a7-7f12-43ca-a4cd-4fef1ab9f0fc@suse.com>
Date: Wed, 12 Mar 2025 13:52:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] dt-bindings: riscv: Add SiFive HiFive Premier P550
 board
To: Conor Dooley <conor@kernel.org>,
 Matthias Brugger <matthias.bgg@kernel.org>
Cc: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Min Lin <linmin@eswincomputing.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>, Yangyu Chen
 <cyy@cyyself.name>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Yu Chien Peter Lin <peterlin@andestech.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Kanak Shilledar <kanakshilledar@gmail.com>,
 Darshan Prajapati <darshan.prajapati@einfochips.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>, rafal@milecki.pl,
 Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
 <20250311073432.4068512-5-pinkesh.vaghela@einfochips.com>
 <Z9F3_Zb4RvHLvgSd@ziggy.stardust>
 <20250312-unloving-shamrock-babbedab8cbe@spud>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20250312-unloving-shamrock-babbedab8cbe@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_055257_430486_CE9ACA09 
X-CRM114-Status: GOOD (  14.05  )
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



On 12/03/2025 13:50, Conor Dooley wrote:
> On Wed, Mar 12, 2025 at 01:03:09PM +0100, Matthias Brugger wrote:
>> On Tue, Mar 11, 2025 at 01:04:26PM +0530, Pinkesh Vaghela wrote:
>>> From: Pritesh Patel <pritesh.patel@einfochips.com>
>>>
>>> Add DT binding documentation for the ESWIN EIC7700 SoC and
>>> HiFive Premier P550 Board
>>>
>>> Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
>>> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
>>> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
>>> ---
>>>   .../devicetree/bindings/riscv/eswin.yaml      | 29 +++++++++++++++++++
>>>   MAINTAINERS                                   |  6 ++++
>>>   2 files changed, 35 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/riscv/eswin.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/riscv/eswin.yaml b/Documentation/devicetree/bindings/riscv/eswin.yaml
>>> new file mode 100644
>>> index 000000000000..c603c45eef22
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/riscv/eswin.yaml
>>> @@ -0,0 +1,29 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/riscv/eswin.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: ESWIN SoC-based boards
>>> +
>>> +maintainers:
>>> +  - Min Lin <linmin@eswincomputing.com>
>>> +  - Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
>>> +  - Pritesh Patel <pritesh.patel@einfochips.com>
>>> +
>>> +description:
>>> +  ESWIN SoC-based boards
>>> +
>>> +properties:
>>> +  $nodename:
>>> +    const: '/'
>>> +  compatible:
>>> +    oneOf:
>>> +      - items:
>>> +          - enum:
>>> +              - sifive,hifive-premier-p550
>>> +          - const: eswin,eic7700
>>
>> That should be the other way around. You could have, let's say eic7701
>> with different peripherals but smae p550 IP core. I don't expect a new
>> eic7700 with a CPU IP other then p550.
> 
> No, this is correct. The SoC is made by Eswin (eic7700) and the board
> (hifive premier) by SiFive. None of the compatibles listed here are for
> the IP core.
> 
> If there's another SoC with different peripherals and the same p550 IP
> core, I would expect a new SoC compatible /and/ a new board compatible.
> 

Right I mixed up CPU IP core and SoC, so:

Reviewed-by: Matthias Brugger <matthias.bgg@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
