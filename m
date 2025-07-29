Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA59C87FCA
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 21:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JRW0ZucWIoxb2DOlrVeXD4t3XOYI3dGuB03qdUMse/k=; b=hLUOeVQTPtRsau
	Lscptla4Iw0xhYTfLoxesslRvL6IIIjeBFQpkIKMRgMaYXenH1r9h2D+y5nWzFLHEMCDFYNHY79i/
	y3tXIaTnAvaapXJgm3wHZntXZGpIyPMotD8/0HgDm4xDPQH45grJ9H65P+tw1nnvgpDPT/zrVjHba
	gIp1WnA+kwVx2eZlJ/StM1VOMciufLId84+pLjp2gEhLWEAGkLPacI5e4izVGyl65ckL9P3x7H1T7
	+ZtQae41S+XIqjjHHwWjSYFbIZ+jxUG6WM6f4arz6r0HtM5HJ5UiAngISs/OogZVGKBilAtXZ6VCq
	+oUeHt+B668L0TKqkH3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugrVa-0000000061t-4BwZ;
	Tue, 29 Jul 2025 21:05:15 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugrUW-000000005vz-2G5N
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 21:04:10 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-87c0166df31so416918139f.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Jul 2025 14:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753823047; x=1754427847; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dm0B5M26cYOXX5KrUOLsQ5vTboaxWnLdzB6XMUX6uWQ=;
        b=dFdIbH5gogXF6xXMPc3TMFOk9CfGXq7rWaOt40Emd+FdAUmHjAloOR3wsSsUNIQGr8
         tE1gMpgTtTlRaI8V8hxg8KYjkGRYOAa6JWMYlLnG+jrsu1UL6GbjrwonVEE9wIAmVTX0
         KIRFMYhke/csbeQLtUT244Q5ogWwix6vLVu/+YWK9IKoKPbIXxxAXPbcra7my2RyDqhG
         h1kOJSDPaEj8X/FlLCCNNBjmfArxAvYqvl06Xeb9NDovi7XCXnqJRrvrtv+pnZrInIS5
         8yZaKY5nMfG/p/cdnFezQLm3IsFivvwncpLnKVUFYlPOy89j5/dK4PhhxVGocnG7YmwN
         jyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753823047; x=1754427847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dm0B5M26cYOXX5KrUOLsQ5vTboaxWnLdzB6XMUX6uWQ=;
        b=emfDwCknXtL/j6u1PzDcZ+5AxA3kFwS0W9KDVDfe2ZWRg/bX5aMSPwx+QSm6GJx7XI
         QK/mnQVyn+V5euTFHTzOIQ6I1v5cj3RzAqPMfURT6KnZwX0+wpOvMnAx196xq7GcwUVl
         0qMQRPV4b092CDOyqhu+HHJrojtxHrKWmyYqVCukB1NkUFlsFrvcsv96uQIhoWpBffx3
         erdVKvixSr6k9HWPZ7w1vBFsSXQMT/xJn46VIc8B7o4EMGIBHYsWZpLFV02ac87ahTo1
         dJ++qvYGHy1w8p96NpPKrPibH3hT4C8BBfS5pAaH/rErFFLBlbxx/70p/+YGcsvGsdD2
         TvDA==
X-Forwarded-Encrypted: i=1; AJvYcCWUbUNDYqEvkrUU+MOlDCYZl826yhjOR3ekJHSqI0lvH8yEynoQjW8FkkQm4J3ltc7Deva7QcwDjM5vxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMJ1Uk+TgnDJ1or4/fjKF0eOGyqNH9lqaGZ5UelSqptwqFLrud
	HY6vb6A8Z1herNKYSUY6lmIIp3LNeYu5QUe9bxoYFlhkbckDQuVRZDmgcXr6ohGhicw=
X-Gm-Gg: ASbGncvldUohhGbGBmZEuxB4PBB/eVHs/IikGUKvm8zi1IfelC9rBYNjebM4H2nO2e+
	Rk10/KaFIdBm4ojuui72e3/tHBVUHhgtGVWDhTXb9U+maC3w/yIBfk7dzA5b4qwUJPnfkYtPIDO
	NWUMP2x8fj5e/MwlCvqsS6k0Cnozb+dfWBwtxC96lWmaGSPpMiby0GXaS2mpgEpb6qItLj4WSlS
	V4efAycKKLFgjd89Fs2r66zMBN2Ch9LLhLETM6W9HiyEG4m5G0XGouSnuMzHbJQgD+nrSpec106
	CZrmozLxa9RibsMlRQqwy9J2WYdnH/nMUFUjM9y9mpR5DBFEgKMsfZSSNoHOEvT42uUpTDor334
	qVJaQ+qaryvE7MuU7unuvbAs4e1ysQkw4Q4UQ4TnZ7LUbEK6xMdskIFgMt00J8A==
X-Google-Smtp-Source: AGHT+IEYsNZGToVFKqEpDm8h8KviUj+EbfOPDQ9fzvNi2gdCmg29FQdC20eQLL41P+j0nBILREZn0w==
X-Received: by 2002:a05:6602:7501:b0:879:c9db:cbf0 with SMTP id ca18e2360f4ac-881374c295emr155676739f.2.1753823047163;
        Tue, 29 Jul 2025 14:04:07 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-508c91f1dcfsm2827976173.47.2025.07.29.14.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 14:04:06 -0700 (PDT)
Message-ID: <5c3f9f10-6a9d-45b4-80c0-09402b35bf47@riscstar.com>
Date: Tue, 29 Jul 2025 16:04:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: serial: 8250: allow "main" and "uart" as
 clock names
To: Conor Dooley <conor@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, lkundrak@v3.sk,
 devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 spacemit@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20250728220002.599554-1-elder@riscstar.com>
 <20250728225319-GYA900803@gentoo>
 <20250729-reshuffle-contented-e6def76b540b@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250729-reshuffle-contented-e6def76b540b@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_140408_657710_4C6CC9AC 
X-CRM114-Status: GOOD (  19.39  )
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

On 7/29/25 12:54 PM, Conor Dooley wrote:
> On Tue, Jul 29, 2025 at 06:53:19AM +0800, Yixun Lan wrote:
>> Hi Alex,
>>
>> On 17:00 Mon 28 Jul     , Alex Elder wrote:
>>> There are two compatible strings defined in "8250.yaml" that require
>>> two clocks to be specified, along with their names:
>>>    - "spacemit,k1-uart", used in "spacemit/k1.dtsi"
>>>    - "nxp,lpc1850-uart", used in "lpc/lpc18xx.dtsi"
>>>
>>> When only one clock is used, the name is not required.  However there
>>> are two places that do specify a name:
>>>    - In "mediatek/mt7623.dtsi", the clock for the "mediatek,mtk-btif"
>>>      compatible serial device is named "main"
>>>    - In "qca/ar9132.dtsi", the clock for the "ns8250" compatible
>>>      serial device is named "uart"
>>>
>>> In commit d2db0d7815444 ("dt-bindings: serial: 8250: allow clock 'uartclk'
>>> and 'reg' for nxp,lpc1850-uart"), Frank Li added the restriction that two
>>> named clocks be used for the NXP platform mentioned above.  Extend that
>>> so that the two named clocks used by the SpacemiT platform are similarly
>>> restricted.
>>>
>>> Add "main" and "uart" as allowed names when a single clock is specified.
>>>
>>> Fixes: 2c0594f9f0629 ("dt-bindings: serial: 8250: support an optional second clock")
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202507160314.wrC51lXX-lkp@intel.com/
>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>> ---
>>>   .../devicetree/bindings/serial/8250.yaml      | 19 ++++++++++++++-----
>>>   1 file changed, 14 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
>>> index e46bee8d25bf0..cef52ebd8f7da 100644
>>> --- a/Documentation/devicetree/bindings/serial/8250.yaml
>>> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
>>> @@ -61,11 +61,17 @@ allOf:
>>>               - const: uartclk
>>>               - const: reg
>> ..
>>>       else:
>> would it be better to drop this 'else', and moving following 'if' block
>> to the same level with "nxp,lpc1850-uart"?
>>
>> the reason here would avoid too many indentions if add more constraint in
>> the future if other SoC uart need different clock-names..
> 
> I agree, it's more typical to do it that way I think to boot.
> 
> Also, why is there a k1/lpc conditional bit that is not part of the
> allOf in addition to the bits in the allOf? Can that get merged with the
> allOf please?

Are you talking about the blank line here?

     then:
       oneOf:
         - required: [ clock-frequency ]
         - required: [ clocks ]
                            <------ this blank line
   - if:
       properties:
         compatible:
           contains:
             const: nxp,lpc1850-uart
     then:

I didn't notice that before.  It got inserted with commit
d2db0d7815444 ("dt-bindings: serial: 8250: allow clock
'uartclk' and 'reg' for nxp,lpc1850-uart").

If so, yes I'll remove that as well when I update the patch to
get rid of the else as Yixun suggests.

Greg won't take this for a couple weeks so I'll hold off sending
v2 for a while.

					-Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
