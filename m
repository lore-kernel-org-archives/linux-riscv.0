Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE010C19F2B
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Aug 2022 22:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rHu2XTRSfC2LVjX9+0A28kSLGopq88GoXtRjz7abkms=; b=VfiroKsKA+qbXe
	mx5W5cYRlEXGKVSI6kc6BCRwYFW+8TBMik+uEgNtMRByRHefo7sM2RbyqGm+xsLaRtftBDwA+Usxb
	ZOOkKowQErCic4cMFF0bzvK1YrVf9UdMXU8Cv3MgkUw/K6HQ3sxO+7bTGYWvG/5k8B4LEK51vzP0F
	+hjpHrmw/iUkUxTwlLtTzIfl+FMttgk0L2Hl+MxWRcNcV4/YeIgInXY1lW1DU4RsI7OgRlPjLrPhh
	osZK46G18raQcXXEy7dS3+AtqE4tQxT4bklifZIY30aluLkS6dJCi6G3tJIGOKtVdrnVm6TZoGvnv
	zQzrtRaqZb54KktEgA7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJMqg-00AMQB-Gb; Wed, 03 Aug 2022 22:28:18 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJMqe-00AMMb-1Z
	for linux-riscv@lists.infradead.org; Wed, 03 Aug 2022 22:28:17 +0000
Received: by mail-wr1-x430.google.com with SMTP id j15so15024820wrr.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Aug 2022 15:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=zEkoao7zYU+WcR7kSm6nBvQaMYVp8naAyd32jCLqH0E=;
        b=OY37iNsm9roYuI5Moxof5r+o8pf2Q1qn+8QLwRr4MTgwsttoZDEkjnOSv8j/NYJIeG
         KxKOLZM8GT/VyFVqo0/v8dO4twI9bFmgrawsf4B5eXGxPSzsINYXoq4ZI5o/43WOm4Sk
         cPQQ47hJjjnf17PAsWD6DCZ54oQO5dbtWWFU8G8u7IVeHiLaaLavZ9vPIsmrJ9XH+OBe
         TXg5jdSbGGlTFzywMkudScDF6wWaKbmq4/G1GveRbxLw89wibZae5O4TlfptnKxyJC+y
         A8eJDknbu2XM+gW8bHpVmb9hFOAdSharsg/+faTM0+tGZDmqR8y+XWYo0FJGUTZMt8T9
         zvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=zEkoao7zYU+WcR7kSm6nBvQaMYVp8naAyd32jCLqH0E=;
        b=HWYuejah0o2ckwY/lrga0A94WJKHHf4U6XKIZ+SHvObHFqexwKNdKbhpGZtfZIJ83A
         QcUdXuaBHdVsfTuFgHw2g0kbi1p7M9CJoIv7ee1SafR0cIizzZ5YfAQM1F/i+oGuAJe0
         JKqidMA/0qZcWetChaeta7VfVAQxYyaeY/2Fa3K2dGJcuEAY6r5JMNmEqhGDlhnD+UxM
         nNA47ovBf9f7RceaIrJU2zxqaTvfWNxVZnUhsChtPsz3SW9mOsinC8Uypb2xQYiPdMlb
         gtNZLNeR1UlZcCiaNWzGxg3f6Qdyoso0rB4PPuqPi6WptmkU37BAoGN1FnAQR7FN+dva
         WxUw==
X-Gm-Message-State: ACgBeo1gX6qVJgazl14JD49CfjHSWxDnLyRXoiibeWhE/Zk9rE9W9DRN
	AyzpBqvufPxj/tyJt5w0JfJzUQ==
X-Google-Smtp-Source: AA6agR7PNg/Odstt713wfGffYsv2eg5MMIZWjFU6weO1GXug4XZYRpKQy1TDxMimIbF9Ge9HuXobpA==
X-Received: by 2002:adf:de05:0:b0:220:6c9e:5fd9 with SMTP id b5-20020adfde05000000b002206c9e5fd9mr7382563wrm.260.1659565693477;
        Wed, 03 Aug 2022 15:28:13 -0700 (PDT)
Received: from [192.168.2.222] ([93.107.66.220])
        by smtp.gmail.com with ESMTPSA id u10-20020a05600c19ca00b003a3187a2d4csm3980993wmq.22.2022.08.03.15.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Aug 2022 15:28:13 -0700 (PDT)
Message-ID: <1a9c0ecb-f841-e73e-1c43-eb4e262b9f4a@conchuod.ie>
Date: Wed, 3 Aug 2022 23:27:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: DT schema warnings on Risc-V virt machine
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20220803170552.GA2250266-robh@kernel.org>
From: Conor Dooley <mail@conchuod.ie>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org
In-Reply-To: <20220803170552.GA2250266-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_152816_143020_06DD2089 
X-CRM114-Status: GOOD (  18.60  )
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

On 03/08/2022 18:05, Rob Herring wrote:
> Hey folks,
> 
> FYI, I ran DT validation on the Risc-V 'virt' machine and these are the 
> warnings:
> 
> /home/rob/riscv-virt.dtb: cpu@0: riscv,isa:0: 'rv64imafdcsuh' is not one of ['rv64imac', 'rv64imafdc']
>         From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/riscv/cpus.yaml

This one is party a QEMU problem & should've been fixed - but the fix
was never applied:
https://lore.kernel.org/qemu-devel/20190813225307.5792-1-palmer@sifive.com/
I think this just needs a rebase & a resend which I can do.
I think kernel-side we need to add a new string riscv,isa string but it
is not the one in your error message - it's either "rv64imafdch" or
"rv64imafdch_zicsr_zifencei_zba_zbb_zbc_zbs". Palmer, what is your
take on that? Is only the short misa meant to go into the dt?

For the plic/clint related warnings, documenting the
"riscv,{plic,clint}0" variants seems to be to be the right thing to do
as they're already in the kernel in drivers. I'll send patches for
these.

BTW Rob, what version of qemu were you using? I saw more errors on
QEMU's master branch - like the following from a dump of the virt
machine:
/stuff/qemu/qemu.dtb: platform@4000000: $nodename:0: 'platform@4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml

Using a platform bus seems to be a core QEMU feature, used on multiple
archs in hw/core/sysbus-fdt.c - but that violates the schema. Not sure
what to do there.

/stuff/qemu/qemu.dtb: soc: poweroff: {'value': [[21845]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-poweroff']} should not be valid under {'type': 'object'}
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
/stuff/qemu/qemu.dtb: soc: reboot: {'value': [[30583]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-reboot']} should not be valid under {'type': 'object'}
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml

These two seem to be that the creation script adds them as subnodes of
the soc bus not subnodes of the syscon. A QEMU problem rather than a dt
bindings problem.

The rest seem to be a variety of incorrect names being used in riscv's
virt.c in QEMU. I guess I'll send fixes for those too..

Thanks,
Conor

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
