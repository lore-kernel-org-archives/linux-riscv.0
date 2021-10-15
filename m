Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9AC0C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 11:54:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69BB261027
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 11:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69BB261027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xf2xagpHaYN7ehSRCxeidTrlI9XAY59v75Own4c05fE=; b=kCdeTZrZA5F12o
	arMfcN89pEHDkcAfYudfK/RfU1yOlUYjaaoKqb2hw2ZvRXijP/o/LRnVezWFFK31nLCHWYYMIqrc7
	RElq0yPhGw892ljLKb0AZaZXXnCOkhlo+sgTX5swt6xciuXUY0S/xsxANbav7wXZeoH9qkZ29QZNp
	WMYNcfuKht3hbV5IxAnvQHyofm/SYtNNWSehKWkT7Ij0vsZlODoF2v8qXDPToMmbJ5USCeuEvxfb8
	0yELcr1kITQhUTEJJe4b9Q+S8g8NUFwicisCFpPc+avKhEfuoJ6KF3tyWzqF90TQKdcNQoGfqWAD6
	jvFrBgGHb4ozRdDu4sQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbLnG-006ob9-2I; Fri, 15 Oct 2021 11:54:34 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbLnC-006oa5-SI
 for linux-riscv@lists.infradead.org; Fri, 15 Oct 2021 11:54:32 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8BA9D40000
 for <linux-riscv@lists.infradead.org>; Fri, 15 Oct 2021 11:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634298865;
 bh=c9jh8Oug06AKc57muwkesbMnQqm4YikcwhqDP8QKSX8=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=mkKg5OQbSywb0OSiOY/run2jL9iViaDEVss/9GUisJm3zdVrvUjfXnWZmNaeiXyX9
 u05SG/XaGOrCj5CArSpdnmZwy9WPeWFCDqBGsHQroGXm6PJDN97HpyRmvMsPz5kvL1
 dIbOC7yw5zsFQ+i5jQjckIuRw8Zy8EztOtfHX4fscz9L2LzT5m8jaFinC0+2wZyGyU
 KXn1QtJmbY250od8VIzrnItUCDTSl0advX/smiQCUa1qutFqhJYcW3097t4xhXiICc
 jsnP+3z4gxZJ0WTtSNs5fDElQSwaKsbFzE5ipa9exFuAY4CCbcUXgTi7hdSg4W8gq8
 gWHia6a8+c5sw==
Received: by mail-wm1-f69.google.com with SMTP id
 f123-20020a1c1f81000000b0030dbb058338so789249wmf.1
 for <linux-riscv@lists.infradead.org>; Fri, 15 Oct 2021 04:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c9jh8Oug06AKc57muwkesbMnQqm4YikcwhqDP8QKSX8=;
 b=tUEkDnCClcCMzecz10Pu7erqNjNLSiPbUsBTDwZ58wgQSy0sBS/jEkxR1usoNv6DX3
 D22GSar5Fzn79Fgpx7VEyaBtdsl803ri86hfmkgMCQJavAw1nwT6TKkcwIquMfqrUB51
 ay9HgkHXxgyT83VctW8XfSbinMkPakOudxBCNqFoWtzVY0T4veltS7F1vXzi04BwTBgU
 JNOnlgPL1ZfN82UkmfP9DoxbmAA9ykbz1XbTylrkqei7HpHyEGmiRs9QFSrGZGbD3QBg
 c2IgXd7qfzV+LJ566UCgBEpWqinVf0NBE7tDgncjfTnwWFYT1DbzpamSXBF57BazxPrC
 yxLQ==
X-Gm-Message-State: AOAM532McT5L4ExJ1HmsegmqpHfzv7Yl7nigKxt5PJPeKqfcXZlgUcZC
 AmgcJwIriTtR4pYSSwSNUj4cVGo+FHY/odOQKONBFbsgEePtCKqxVKRDWCLBd8UBEP/gObLNuPQ
 2Qz9itnKbzQH15NTfhtOF4zTBRvi7UseMaQ8xZqLeaCnKkQ==
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr12195413wmg.35.1634298865219; 
 Fri, 15 Oct 2021 04:54:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrsgC8rHPMRvubvnpUIbMn2Nt0B3IBm9IRtB1R9WUWCgSJvYa0cPdXCvYF+Pd0OXvt+Lspfg==
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr12195376wmg.35.1634298864992; 
 Fri, 15 Oct 2021 04:54:24 -0700 (PDT)
Received: from [192.168.123.55] (ip-88-152-144-157.hsi03.unitymediagroup.de.
 [88.152.144.157])
 by smtp.gmail.com with ESMTPSA id d8sm4931663wrv.80.2021.10.15.04.54.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 04:54:24 -0700 (PDT)
Message-ID: <49af3dc8-0d1e-e82f-6df2-2bf8338acd3a@canonical.com>
Date: Fri, 15 Oct 2021 13:54:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 1/1] dt-bindings: reg-io-width for SiFive CLINT
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Guo Ren <guoren@linux.alibaba.com>,
 Xiang W <wxjstz@126.com>, Samuel Holland <samuel@sholland.org>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 OpenSBI <opensbi@lists.infradead.org>
References: <20211015100941.17621-1-heinrich.schuchardt@canonical.com>
 <CAEUhbmUSmi9mbiHpatBjGgRjrtyJPms9BRmyBPs5BWeVb7n1Nw@mail.gmail.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <CAEUhbmUSmi9mbiHpatBjGgRjrtyJPms9BRmyBPs5BWeVb7n1Nw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_045431_086723_F7EE6700 
X-CRM114-Status: GOOD (  21.74  )
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

On 10/15/21 12:14, Bin Meng wrote:
> On Fri, Oct 15, 2021 at 6:09 PM Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
>>
>> The CLINT in the T-HEAD 9xx processors do not support 64bit mmio access to
>> the MTIMER device. The current schema does not allow to specify this.
>>
>> OpenSBI currently uses a property 'clint,has-no-64bit-mmio' to indicate the
>> restriction. Samuael Holland suggested in
>> lib: utils/timer: Use standard property to specify 32-bit I/O
>> https://github.com/smaeul/opensbi/commit/b95e9cf7cf93b0af16fc89204378bc59ff30008e
>> to use "reg-io-width = <4>;" as the reg-io-width property is generally used
>> in the devicetree schema for such a condition.
>>
>> A release candidate of the ACLINT specification is available at
>> https://github.com/riscv/riscv-aclint/releases
>>
>> Add reg-io-width as optional property to the SiFive Core Local Interruptor.
>>
>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>> ---
>>   Documentation/devicetree/bindings/timer/sifive,clint.yaml | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> index a35952f48742..266012d887b5 100644
>> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> @@ -41,6 +41,13 @@ properties:
>>     reg:
>>       maxItems: 1
>>
>> +  reg-io-width:
>> +    description: |
>> +      Some CLINT implementations, e.g. on the T-HEAD 9xx, only support
>> +      32bit access for MTIMER.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    const: 4
> 
> But this is not a "sifive,clint" anyway. Should there be a new
> dt-bindings for T-Head clint variant?

I assume by new dt-bindings variant you mean: Add a new compatible 
string in Documentation/devicetree/bindings/timer/sifive,clint.yaml.

The vendor Debian image uses:
compatible = "{allwinner,sun20i-d1-clint", "sifive,clint0"};

We could add this diff in a future version of the patch:

--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -26,6 +26,7 @@ properties:
        - enum:
            - sifive,fu540-c000-clint
            - canaan,k210-clint
+          - allwinner,sun20i-d1-clint
        - const: sifive,clint0

      description:
@@ -33,10 +34,10 @@ properties:
        Supported compatible strings are -
        "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
        onto the SiFive FU540 chip, "canaan,k210-clint" for the SiFive
-      CLINT v0 as integrated onto the Canaan Kendryte K210 chip, and
+      CLINT v0 as integrated onto the Canaan Kendryte K210 chip,
        "sifive,clint0" for the SiFive CLINT v0 IP block with no chip
-      integration tweaks.
-      Please refer to sifive-blocks-ip-versioning.txt for details
+      integration tweaks, and "allwinner,sun20i-d1-clint" for the Allwinner
+      D1. Please refer to sifive-blocks-ip-versioning.txt for details

    reg:
      maxItems: 1

Best regards

Heinrich

> 
>> +
>>     interrupts-extended:
>>       minItems: 1
> 
> Regards,
> Bin
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
