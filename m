Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F40AC6FA82
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 22:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D1bTSMSW1mgcXv2geYvU7eUNyhRSv4gIYYTAYoT7vsw=; b=opUAB4RjgcbRdw
	wFfSZsQU7UB2dv0r2FUa+uW64RUcHMG+4YxhGMEarUDBIECxcbBUqnyqxJD8f/DNmS9rWuQHwCN71
	m2ghmB3mryLLIQkf64YznTgpoer4AWmkX2pohTi8xKb+JfdEUWGlEBzZo4Phaytq0StLzsfNcTnZW
	qelw/Hw+MWubZEcAo2X9QvhE76ZlvCgOuYjK6ZZiO7CTpsQQz4pFbENjnDBulhqlt5QPXqkC0SsoO
	aUuv/qv1pb9jC9NPJDpY7jAK9M1vckwQmFAbdVrA1PsnM7HLh5G38LFtkqnBg9Q4kZSe5UKiX8DcD
	KeN/1Tq3b/O73gOC+Log==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYxXG-001Hxw-Ka; Thu, 15 Sep 2022 22:40:42 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYxXD-001Ht9-8u
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 22:40:40 +0000
Received: by mail-wr1-x432.google.com with SMTP id b5so33103273wrr.5
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 15:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=PVkvDcs5B55lPsyOSCnEvKpynvpMcBlSH4X5N0oNFYw=;
        b=gRt1AkHz797KUWc/T/+UBcNeA1d+rSFR0fBJW9HeAr/jWJf6nqlR5TdJ+mIZeuX8UI
         yJgVN4dflkmmgB2YMdBZLCn7grder4SPehiVTE4btXlWsIIkpeopEa4dpiG2mZrlm0l0
         0w6VUpfTRpozUh0xAXVW+7vmdEIFTVdFhK+m5JCy+b3Y4PMWavijSoSFENWJ4B3jfMjX
         /085Ceh+Pf28BCHvuApHW1KzNop4Cv9fAUQeIjMEz+whZj5zJE9Jjjm7IGatgWSWuqFd
         43N4YNgTI0Wq/37whV86XVx6esV/L7jA9A1tnEvQe73qLKa1qwpNlikpgQ+hA/XD+gKI
         2hAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=PVkvDcs5B55lPsyOSCnEvKpynvpMcBlSH4X5N0oNFYw=;
        b=EcwKzSpiClVd0kmhzH5o5ii0wUQPAN0F/kV8Xqx+WMSYYEsJwf/cWhafkIugV7fiM5
         p5MNxH1AV319q3wGC15Z4TAUMUfEDB1868w9xGOQ33bYl9msKcZHTy92T7CAxBk/iwyu
         W0+WxKa66vyiFoa2ymehrna+QneVToDRLta+fBkY5i1sSbNA9zyDr3czX+T3heyioV2i
         c9DXhEYOWpUKqRvP88sIZzpdaoJ3UWjdGcuAXerbausBK+ZO/vFP6dhdVhBqf5ixm3j/
         tj7C/ljAEADCcveVHQpZ15rvA8tvmUPwRlWAvY261ztAYH4MTvq0j7ux5D+FbKltlLOS
         tvlA==
X-Gm-Message-State: ACrzQf3VSe31U7xrQE8QVNgdNvkCiTUrZJ6MIawsLeusk3rI9BqKpjlb
	6QJnbF8fUvI5B6B84Kyrhzn7sw==
X-Google-Smtp-Source: AMsMyM6/ENjFaotvxFYS+1ydpbwHLtW1hKAX0fr6Of+2WoS911b5ZDjhHxgEBnOwssRrZthyt817LA==
X-Received: by 2002:a5d:58d6:0:b0:22a:c38c:d2c8 with SMTP id o22-20020a5d58d6000000b0022ac38cd2c8mr1084920wrf.604.1663281636090;
        Thu, 15 Sep 2022 15:40:36 -0700 (PDT)
Received: from [192.168.2.222] ([109.76.158.112])
        by smtp.gmail.com with ESMTPSA id i17-20020a1c5411000000b003a63a3b55c3sm356513wmb.14.2022.09.15.15.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 15:40:35 -0700 (PDT)
Message-ID: <e15f3e2a-2761-84d9-c5c9-118717e0bb83@conchuod.ie>
Date: Thu, 15 Sep 2022 23:40:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 07/10] riscv: boot: dts: r9a07g043: Add placeholder
 nodes
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Conor.Dooley@microchip.com
Cc: geert+renesas@glider.be, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, heiko@sntech.de,
 atishp@rivosinc.com, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, biju.das.jz@bp.renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220915181558.354737-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <3693a3a1-5a2a-4cc5-fb55-f6ad9a4b3f72@microchip.com>
 <CA+V-a8u87tqhC69qGD2zq_gT9jc_cSWd+NRn_u0bPTdmmk+j4A@mail.gmail.com>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <CA+V-a8u87tqhC69qGD2zq_gT9jc_cSWd+NRn_u0bPTdmmk+j4A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_154039_370387_105C125D 
X-CRM114-Status: GOOD (  18.94  )
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

On 15/09/2022 23:26, Lad, Prabhakar wrote:
> Hi Conor,
> 
> Thank you for the review.
> 
> On Thu, Sep 15, 2022 at 10:36 PM <Conor.Dooley@microchip.com> wrote:
>>
>> On 15/09/2022 19:15, Prabhakar wrote:
>>> riscv: boot: dts: r9a07g043: Add placeholder nodes
>>
>> nit: s/boot//
>>
> Will fix that.
> 
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>
>>> Add empty placeholder nodes to RZ/Five (R9A07G043) SoC DTSI.
>>
>> Can you explain why do you need placeholder nodes for this and
>> cannot just directly include the other dtsis?
>>
> Since the RZ/G2UL SoC is ARM64 where it has a GIC and on RZ/Five SoC
> we have PLIC for interrupts. Also the interrupt numbering for RZ/Five
> SoC differs from RZ/G2UL SoC hence we are not directly using the
> RZ/G2UL SoC DTSI [0].
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/renesas/r9a07g043.dtsi?h=v6.0-rc5
> 
> For the RZ/Five SMARC EVK I am re-using the below files [1] (SoM) and
> [2] (Carrier board) as the RZ/Five SMARC EVK is pin compatible.  Since
> I am re-using these when trying to compile the RZ/Five DTB I get
> compilation errors since the nodes dont exist (and there is no way
> currently we can delete the node reference when the actual node itself
> isn't present) hence these place holders.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi?h=v6.0-rc5
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi?h=v6.0-rc5


If this method is acceptable to Geert, this explanation 100% needs to
go into the commit message.

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
