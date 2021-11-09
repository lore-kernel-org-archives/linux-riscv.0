Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884DFC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 12:54:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 516036109F
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 12:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 516036109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xx+50Hj9iiNWoE71poMafqDWZcvCmB85ltm/KOmwo1I=; b=r72TcdBHcLrE3D
	MCTtiVpslhEcHF1VaCR8y0exuI3XaRVNzcznsniiHgKiRTxWORAFn189QE4JmMq3HFqzcOAj1vqyP
	tSprmQumLyxh7GDp1RIogG/lpWbqFmb2ZoPXjSDudrTP77Doaz2bpxmY3/MVoD4klERZ1ENnQ5Id0
	SL3pUHhhb/6zg1uRRvfYrGaa6NUVhSns9XTmdAk8dvMfdp7uwrieFp/SlT0l8RIElIl7DtjP3Xf+R
	OFjPeLEqJqa+qOn2FAooOSJ9FFfK7mmHwYJ+UUEgBGVFfPHsMdygoQ9XqkR8cpoP0WoaDm/ASQsjU
	ZqWJTS0Vvb/MM7K4Ax6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkQe1-00291L-Tp; Tue, 09 Nov 2021 12:54:34 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkQcy-0028Em-D6
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 12:53:30 +0000
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 33A0A3F19A
 for <linux-riscv@lists.infradead.org>; Tue,  9 Nov 2021 12:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1636462402;
 bh=j5tko5riuXms3JFEWKNcXt/poyacQNf52vuml9R0vAg=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=O6JRxo6dBfipYpSvNoaIBYoID05hGx/gA56XQjZu117joPlyBzp5Vu2sXlJ0cceEi
 fktSajCu5Ww16aIOG+znuHeN+v0MUuPSTYCabBhGWkiUCioAbbSpX2vg8OW9rzlekg
 xjwXavLG4UtOx6XWLWnraAwj380xpCtSMXztdseZeE9YIBODrAJunBtQmKX7RGk2O2
 XloIMvpF7/RjXUHaXon0Ts66rGe5KJ4YNuqojoY72ihZSq+iLjIdt5Bf6t2B+Wu0pC
 vVFNdk40XnbFWbEXJH+/O2M9JfSWfKxmf6i/0t9ELfTzv/a55XkKNHQX3yTvr1oKH4
 qe2nXvYCGgY5A==
Received: by mail-lf1-f71.google.com with SMTP id
 bq29-20020a056512151d00b003ffce2467adso7995295lfb.3
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 04:53:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j5tko5riuXms3JFEWKNcXt/poyacQNf52vuml9R0vAg=;
 b=j1APEddxRWivPyiHx8e9m6DwJ/ckslmllOwM0/Nh7zSq8v7rHDE91hjOvUP5oQXg0x
 yJMzwQjUn1ilk1E5xAaTfA38ej42PthqvDAngjyjLiuud8OwCv+0LVQfx4y3FYDK+W5R
 gVSCCXIp4LFOL1jqPqIWpoIvGuGTdFvPcIso1r9OXgomFDBh3dg1j7+nicP5SzUdD9EA
 TxvJuBkv1c278u07QcWWUhr0nIYpdDiMhhBQ/oh8EMuhlKsnwMw0g0JP0gvGufP7EBgP
 QNtXyl0Ek35OypwTPAZuTZZu7mYu7gnGnytITILQi0Hx/oUyEELS0xtH5RtIGT81yxi4
 CiEg==
X-Gm-Message-State: AOAM533/BKhRe/pNwmIOjrDCtObmOJD9qjXF1Nus0k6IQFZgyDaje9fw
 NdumT6alRSc/pizohRp/86oFQqayZzKO7pkjDnCecfswEPY/RtLFB7gZpjj9gsT+t/dDD930US8
 EdZnGFSSRwXv4c8ITU4OPRuQ1zaQQmkFtEvRHQhsW/fXC/Q==
X-Received: by 2002:a19:9148:: with SMTP id y8mr6510847lfj.512.1636462401700; 
 Tue, 09 Nov 2021 04:53:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxj8OuRHAShyPuiff/xoQ2+ShAhXkJXJ57MKAdkVyp0FJ2HQRhii/EaQs7fi9Q9gr6wclBnKQ==
X-Received: by 2002:a19:9148:: with SMTP id y8mr6510816lfj.512.1636462401453; 
 Tue, 09 Nov 2021 04:53:21 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 i6sm2136859lfr.163.2021.11.09.04.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 04:53:20 -0800 (PST)
Message-ID: <0d996393-20b9-4f16-cbd0-c9bff2b54112@canonical.com>
Date: Tue, 9 Nov 2021 13:53:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 10/13] dt-bindings: spi: add bindings for microchip mpfs
 spi
Content-Language: en-US
To: Conor.Dooley@microchip.com, robh@kernel.org
Cc: robh+dt@kernel.org, gregkh@linuxfoundation.org, linus.walleij@linaro.org, 
 linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 paul.walmsley@sifive.com, linux-usb@vger.kernel.org,
 Daire.McNamara@microchip.com, linux-spi@vger.kernel.org,
 geert@linux-m68k.org, devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-gpio@vger.kernel.org, broonie@kernel.org, palmer@dabbelt.com,
 bgolaszewski@baylibre.com, jassisinghbrar@gmail.com,
 linux-crypto@vger.kernel.org, Ivan.Griffin@microchip.com,
 atish.patra@wdc.com, Lewis.Hanly@microchip.com, bin.meng@windriver.com,
 alexandre.belloni@bootlin.com, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, a.zummo@towertech.it
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-11-conor.dooley@microchip.com>
 <1636430789.935637.743042.nullmailer@robh.at.kernel.org>
 <96005893-8819-1d76-6dea-7d173655258f@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <96005893-8819-1d76-6dea-7d173655258f@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_045328_758760_C92533EC 
X-CRM114-Status: GOOD (  16.17  )
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

On 09/11/2021 13:16, Conor.Dooley@microchip.com wrote:
> On 09/11/2021 04:06, Rob Herring wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On Mon, 08 Nov 2021 15:05:51 +0000, conor.dooley@microchip.com wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> Add device tree bindings for the {q,}spi controller on
>>> the Microchip PolarFire SoC.
>>>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>   .../bindings/spi/microchip,mpfs-spi.yaml      | 72 +++++++++++++++++++
>>>   1 file changed, 72 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
>>>
>>
>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> Documentation/devicetree/bindings/spi/microchip,mpfs-spi.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
>>     19 |         #include "dt-bindings/clock/microchip,mpfs-clock.h"
> Rob,
> Should I drop the header from the example or is there a way for me 
> specify the dependent patch to pass this check?

The error has to be fixed, although not necessarily by dropping the
header, but by posting it. How this can pass on your system? There is no
such file added in this patchset.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
