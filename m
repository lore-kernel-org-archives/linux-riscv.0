Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA01C38142
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 08:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DkGGj0aqWqBRjeC5GHUUljnfevRo7c+tj+z/iatWIXk=; b=GinHP5rEL4oK9j
	nWhB/X7dCSYtHPHSVZmgASz08VuBkFf/SEVMFQU5zTKfR04JfllyvXdoQe7RB0sZQgUN2FMrQKXO7
	3INGNz2W7p33dqdf/q9prEMIEp9vVjBvXoQWhI0WrVUNrytzxZe0KLuCHxZox6Vj5kjCfvCT82tzN
	1+PsMwSXDkLdK+DtKAHs3YSYvSWPN6iw3I+qew+q24HEAEJMPg2qkp/4Ar5xZreIgp1x2fd+Odz5N
	tkVOJ9m8MyiUXQsZr0KMz61vDgtKrIUM8OVDGXF9FZYfGo8iFJy1oY64o9SRDhuKTFDMPG2zF9HVX
	SsGKoUIfwKuwDEExl0pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLKAU-00DWMC-VU; Fri, 27 Jan 2023 08:33:06 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLKAQ-00DWKl-TY
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 08:33:04 +0000
Received: by mail-wm1-x334.google.com with SMTP id m15so2881454wms.4
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 00:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mNDzzLve1QZpQMH586QRx6794jByHtxqf4nlX323e/M=;
        b=wr/faRojnYtopasMYIZ7X5nKWJvOwIFDt6H3ZwcJFlrglXBSFYxDO20pRk+2obypGw
         lp6sclR+UR+EHorIMkUXCu8LDlgnas4SNpc653G4SjJSFR1rb/7X/I3yuiJXCETM3EDr
         83A6hXp1UGKXUu8nI40pGKALkiqAnnJSwTfoe6hyBxm7uiUuR3xsh9+osuJIJb55MYPm
         xywXnOVLUbpg5jrSC6ADmSw5oxb91f64hNGPIz4Cicrdjt0iCGcC4T9y2P5LyHewgFxn
         l/6Pay8nOL53WWvAYGjjlZhjdln3wsBScLS8KjDf2HPqdzZ2rbkWVTiShk6sY4zXS+1N
         4Jkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mNDzzLve1QZpQMH586QRx6794jByHtxqf4nlX323e/M=;
        b=vShIkegbTHawraciRidrlVeaQJX3FZiXd7hEalGqfiD/NdrpFiZpOvTR0VQd5RXBKR
         TSqAl49g5OJO0f/P2MNXQrLHnpLPCG1ijpCrlT01Ra9HaB7Eqqf9Jl+VTNZrsTiBOgIS
         Xgoxzhf+bd4CrR9p3nGMgPKB/5jLkxorqzVykl2hUlXLrEewC1Gz3BD94dp1CROwi3gY
         muzt9KVEAGTpGSgNCuZFOb2sREORVKaK3zC0jLune8069WbcZWkMUUoK6PKS2uXBUzX8
         D6QxhkKmCMDZK/vDePRh0H6CJMR4UAhCGBGsiSLymouTIDFshaSu4u/RnPwKQ3AGNXPe
         9a6Q==
X-Gm-Message-State: AO0yUKW/QEA6b8vjZC7Z+P/PPXz2B0PbWNGSVpl3genxUBy4Ev1mhhwK
	I/tk7QA6BAQ3s+sf2AThVWKWAA==
X-Google-Smtp-Source: AK7set8AUVYQ3DMEqB5mb5eVqgQNd79NxSGC2QpLaYfkKjZyelI9gwbfI++aOYEpI1mjO/SKh2lGNQ==
X-Received: by 2002:a05:600c:1caa:b0:3dc:4042:5c30 with SMTP id k42-20020a05600c1caa00b003dc40425c30mr177420wms.10.1674808379017;
        Fri, 27 Jan 2023 00:32:59 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b00287da7ee033sm3318241wrs.46.2023.01.27.00.32.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 00:32:58 -0800 (PST)
Message-ID: <348c3416-be44-b912-98ef-7f394bd408c0@linaro.org>
Date: Fri, 27 Jan 2023 09:32:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v2 02/31] Documentation: Add binding for
 kalray,kv3-1-core-intc
Content-Language: en-US
To: Jules Maselbas <jmaselbas@kalray.eu>
Cc: Yann Sionneau <ysionneau@kalray.eu>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 Oleg Nesterov <oleg@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>,
 Christian Brauner <brauner@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guillaume Thouvenin <gthouvenin@kalray.eu>,
 Clement Leger <clement@clement-leger.fr>,
 Vincent Chardon <vincent.chardon@elsys-design.com>,
 =?UTF-8?Q?Marc_Poulhi=c3=a8s?= <dkm@kataplop.net>,
 Julian Vetter <jvetter@kalray.eu>, Samuel Jones <sjones@kalray.eu>,
 Ashley Lesdalons <alesdalons@kalray.eu>, Thomas Costis <tcostis@kalray.eu>,
 Marius Gligor <mgligor@kalray.eu>, Jonathan Borne <jborne@kalray.eu>,
 Julien Villette <jvillette@kalray.eu>, Luc Michel <lmichel@kalray.eu>,
 Louis Morhet <lmorhet@kalray.eu>, Julien Hascoet <jhascoet@kalray.eu>,
 Jean-Christophe Pince <jcpince@gmail.com>,
 Guillaume Missonnier <gmissonnier@kalray.eu>, Alex Michon
 <amichon@kalray.eu>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <git@xen0n.name>, Shaokun Zhang <zhangshaokun@hisilicon.com>,
 John Garry <john.garry@huawei.com>,
 Guangbin Huang <huangguangbin2@huawei.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Bibo Mao <maobibo@loongson.cn>,
 Atish Patra <atishp@atishpatra.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Qi Liu <liuqi115@huawei.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>,
 Janosch Frank <frankja@linux.ibm.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Benjamin Mugnier <mugnier.benjamin@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-audit@redhat.com, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-3-ysionneau@kalray.eu>
 <d4d998ee-1532-c896-df25-195ec9c72e3f@linaro.org>
 <20230126161032.GH5952@tellis.lin.mbt.kalray.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126161032.GH5952@tellis.lin.mbt.kalray.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_003302_988222_2E84D849 
X-CRM114-Status: GOOD (  23.78  )
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

On 26/01/2023 17:10, Jules Maselbas wrote:

>>> +  reg:
>>> +    maxItems: 0
>>
>> ??? No way... What's this?
> This (per CPU) interrupt controller is not memory mapped at all, it is
> controlled and configured through system registers.
> 
> I do not have found existing .yaml bindings for such devices, only the
> file snps,archs-intc.txt has something similar.
> 
> I do not know what is the best way to represent such devices in the
> device-tree.  Any suggestions are welcome.

You cannot have an array property with 0 items. How would it look like
in DTS? There are many, many bindings which are expressing it. Just drop
the reg.

> 
>>
>>> +  "kalray,intc-nr-irqs":
>>
>> Drop quotes.
>>
>>> +    description: Number of irqs handled by the controller.
>>
>> Why this is variable per board? Why do you need it ?
> This property is not even used in our device-tree, this will be removed
> from the documentation and from the driver as well.
> 
>>> +
>>> +required:
>>> +  - compatible
>>> +  - "#interrupt-cells"
>>> +  - interrupt-controller
>>
>> missing additionalProperties: false
>>
>> This binding looks poor, like you started from something odd. Please
>> don't. Take the newest reviewed binding or better example-schema and use
>> it to build yours. This would solve several trivial mistakes and style
>> issues.
> I am starting over from the example-schema.
> 
>>> +
>>> +examples:
>>> +  - |
>>> +    intc: interrupt-controller {
>>
>> What's the IO address space?
> As said above, this is not a memory mapped device, but is accessed
> through system registers.

Sure, but then you cannot define a reg which was confusing...

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
