Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F44C25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 20:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VyFv65O0FyCS2yA6Tu7spAo9Tj2w4l4TGQlyxt5HNIo=; b=E6nnRnb+CwaQmW
	E0fhkdta822n5nl/hz+irfPo2D1dFjRZFCDneEwn0D5FxlGkJhKFH/k+VvdzQ+IedzhfbYg0D7SpV
	EoKeULzgqfSjgst6SqjHJFMyS/pr8vDNAtwuz8aropWZAq8OUxD0GuBsU6N9GI1MwE7RRDiK1lTp8
	5i/iefUSxrYj7CaNDiTj0+7ecMtkGA/0ivgEMKluwy3M6fpj+zWaSeNpijLs7x6uM+AcDU48BH8+U
	XHDZ+41nNxpBtxxMulmZ/X5z5dfznqeSsPscbcYEoDx6JAZAVqg49dAi9E82JcNwbBlg3GKMNlqYp
	kKRaIE0OVuCeTCbIdSWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPJl-0067g1-Fe; Wed, 17 Aug 2022 20:07:09 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPJh-0067dP-TQ
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 20:07:07 +0000
Received: by mail-wr1-x42b.google.com with SMTP id a4so5675016wrq.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Aug 2022 13:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=B62d/4sJXmri44gHYwQ72W46oaIsl+XdBEnlOkM1PHU=;
        b=JCGzxJkhrzEuo9lQLIBPfriafnUTtMKhcXyomBG1zeRPPUlTkwDKY5JRBY+EDYavmF
         BsdQGNi8C55VRRp77LZ8wlt4703ixan9kmNazqozc+kwPgnT8zB4aPQ051E6JW9XP2RI
         NHUCTUehoNye9Lg8oIapURtqtL5zok3j3zJ5bip5b5e7iW8FXqtoXRwoi7cwkJkMEDl8
         /aBf00PGTBcXpy0j6P8J1vs//QIOKYOSMSfBM1qxzYvJP9xzTg0Opow4VDXIRmeHgDNB
         7ZQ5Hrr5PmhpnYcZBqHOh3nkar8K4lT548wgQS5ScJd1/z0T8tFiNSDIUoEYgf6o9+5O
         udIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=B62d/4sJXmri44gHYwQ72W46oaIsl+XdBEnlOkM1PHU=;
        b=dtBd9ZaJFDU9INsY5tLrifHRbYZdv0V/1Fx0ZuXqDRnkbXHVNQyi4wIPjelLBHt6D9
         UIK9k9mC7+2en+AuCoLAGqFNeeB7TK1/w2YgANgH+Q4MvR0jyMap4En0pZbSQCRuWNnr
         LOVMXojy9uN6O6EjR2FgPXpVQ5j3MEsU8JgBVdBnzxliAqFK91jr9/W0/mCMpdGzoCrq
         8Vw3zlrxu1+FPrCxlcatirC2hSqHWM8ZRsqT9cdp/kTLjzmkmoOogZdlmpv0yV0V5CHS
         7GVHWoypGfdh7qV8qJmuqWOecrB3uNYCX+JrYgYMdoiNAWIeb/dDvgwVNVoHIIBnk8UT
         sFOQ==
X-Gm-Message-State: ACgBeo35hYpzS94YPRGdOWI04z3p3Ez9voht1uWQSxrxLgeXst1RKFif
	clARHZ5T8wmgbRjDYbQKK8CdMTF2yN/F2Bzd
X-Google-Smtp-Source: AA6agR7qoZmJnmLkrdfATQ1ZiPYo4Z3sqFiUIuZIK+EsCYgIyc4Zluwktxa718RJyfLz+JhYNmY+1Q==
X-Received: by 2002:a5d:47c6:0:b0:225:fd3:f0c0 with SMTP id o6-20020a5d47c6000000b002250fd3f0c0mr6828257wrc.308.1660766824704;
        Wed, 17 Aug 2022 13:07:04 -0700 (PDT)
Received: from [192.168.2.222] ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id q6-20020a1ce906000000b003a342933727sm3106958wmc.3.2022.08.17.13.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 13:07:04 -0700 (PDT)
Message-ID: <9a4eabe8-6fcf-f146-7803-3f8e0fcb29e9@conchuod.ie>
Date: Wed, 17 Aug 2022 21:07:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/4] Fix dt-validate issues on qemu dtbdumps due to
 dt-bindings
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>,
 Guo Ren <guoren@kernel.org>, Sagar Kadam <sagar.kadam@sifive.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org
References: <20220817200531.988850-1-mail@conchuod.ie>
 <20220817200531.988850-6-mail@conchuod.ie>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220817200531.988850-6-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_130706_001104_B852EC3B 
X-CRM114-Status: GOOD (  16.55  )
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

Please also ignore this series, I accidentally had too much in the folder.

On 17/08/2022 21:05, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The device trees produced automatically for the virt and spike machines
> fail dt-validate on several grounds. Some of these need to be fixed in
> the linux kernel's dt-bindings, but others are caused by bugs in QEMU.
> 
> Patches been sent that fix the QEMU issues [0], but a couple of them
> need to be fixed in the kernel's dt-bindings. The first patches add
> compatibles for "riscv,{clint,plic}0" which are present in drivers and
> the auto generated QEMU dtbs. The final patch should be ignored for all
> serious purposes unless you want to wash your eyes out afterwards, but
> JIC the versioned extensions ever come up, it's there.
> 
> Thanks to Rob Herring for reporting these issues [1],
> Conor.
> 
> To reproduce the errors:
> ./build/qemu-system-riscv64 -nographic -machine virt,dumpdtb=qemu.dtb
> dt-validate -p /path/to/linux/kernel/Documentation/devicetree/bindings/processed-schema.json qemu.dtb
> (The processed schema needs to be generated first)
> 
> 0 - https://lore.kernel.org/linux-riscv/20220810184612.157317-1-mail@conchuod.ie/
> 1 - https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
> 
> Changes since v1:
> - drop the "legacy systems" bit from the binding descriptions
> - convert to a regex for the isa string
> 
> Conor Dooley (4):
>   dt-bindings: timer: sifive,clint: add legacy riscv compatible
>   dt-bindings: interrupt-controller: sifive,plic: add legacy riscv
>     compatible
>   dt-bindings: riscv: add new riscv,isa strings for emulators
>   dt-bindings: riscv: isa string bonus content
> 
>  .../sifive,plic-1.0.0.yaml                     |  5 +++++
>  .../devicetree/bindings/riscv/cpus.yaml        |  9 ++++++---
>  .../bindings/timer/sifive,clint.yaml           | 18 ++++++++++++------
>  3 files changed, 23 insertions(+), 9 deletions(-)
> 
> 
> base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
