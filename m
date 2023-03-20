Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA893C6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 23:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=E0aceVGsHpnqeJgP2fut9tO1DSnozV8KmgbFhLe+MvU=; b=ExrAcwJ2dTkEI6w08NVrdiaJu3
	KGK1f9nyeZKQdJWkzu946dWFZz6f2zqWyWIE/d8/C+TKoQnj92CrgfdGDzxrXzd0/mUInMXCUkFAq
	I+5enVG+PRT6bOHr7kNlG/z2XvNPtjWTvW2Bycc0wy7VhIU0p3n2yy7RgIkQjT4T6ANlDbXKJpBu6
	CfvcyDvKIRSAxT4ixIep0APM0gKtSEVW8jhYu+akfAdR5890nA71ORkvhuQgAKz++YwtQtU6SmDOj
	VwzX59MTz8nn+gtMSCl+DgxAjIvQ5I/2BV6xosGIO1VcLuOYdMKFcF9jsij3Jk6sA1SfIKFmf6V7R
	2Yk5/uKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pePD1-00Ap19-2G;
	Mon, 20 Mar 2023 23:46:35 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pePCx-00Ap0B-2K
	for linux-riscv@lists.infradead.org;
	Mon, 20 Mar 2023 23:46:33 +0000
Received: by mail-pl1-x636.google.com with SMTP id ix20so14233959plb.3
        for <linux-riscv@lists.infradead.org>; Mon, 20 Mar 2023 16:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1679355989;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CVD5kdtXy54YH3zU4G6cezFVCE0kWaOWnyh3a3H/fVw=;
        b=gqS4hwId4OLnZEQgJI+kyIQkdjmZZrN+nyj53I24mqFbKwumRa3syzV+0mkcoQUlbp
         I3AgRwMOV5tpdFgxUwMOdyobSn6YGJLq5ce4Okpmp1xF8WMyk+AYS/fECsmmnrjwBbvh
         m416ye8JJBLiaMGKdPSU4vq6gcd8bwzfYtt4uBxxudYPXhLppUa4BnHpOAHtMLbQfY1m
         MgvnWpRfkoiw5QiNdjNC8e97mTNXbNTRxWG+QQNHRgAgPLzHdXjluPpcHMXjwu63j5tq
         +AkQmONBFJpyV0p6OQzwTmHpFlFVOZSZARJD9iWGVFgf52pT57vGrjmsDw1ywIryYuNH
         Cqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679355989;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVD5kdtXy54YH3zU4G6cezFVCE0kWaOWnyh3a3H/fVw=;
        b=yg814QC+NQGGC2xnC5AwfPe+JQ1W2FqlZ51cbCO9eMVNEYoniYH+aXNxekPQIGeHSI
         H9F22H81TOM+UIjlPHo++QR/BBbkosvuj1SAnicPD/cEGNhpQI0SWox+cmu83wBHulC9
         R9hNRYbpj6KNWEuI4TZTUOoTSBiBM5j46meezaFLVoamwHKR9liKd8oo6YmJjWUHmKe9
         a0j8Xg13OlnL3em2nDuPKOphh9C6NpBQNhDfJjHMQsgvxCquE8XH7ni184eTD5S5kdO0
         qNbF8V7CRXKR4phA7e9yRdYijpYNN1w3+bfBzZMQtkbXE0bxTlZobLyr6xkA4qBCzMq+
         j/xA==
X-Gm-Message-State: AO0yUKVx1q4zntQNXMvFXZQfXND0FV4tC9neTxm6CaunDX/AxFuwPlQV
	L7GqBRU/90jqcIZ6wQ8mvheDrw==
X-Google-Smtp-Source: AK7set+Eo6dVqOrcG8rwMRvHa6vfuVju4SycRcGmgII+64sM2O1goAy6bcstJI4WTVXmjXHmb/WVRA==
X-Received: by 2002:a17:90b:1e43:b0:23f:9fac:6b31 with SMTP id pi3-20020a17090b1e4300b0023f9fac6b31mr367842pjb.25.1679355989349;
        Mon, 20 Mar 2023 16:46:29 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id 30-20020a630c5e000000b00502fd141ffbsm6756689pgm.49.2023.03.20.16.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 16:46:28 -0700 (PDT)
Date: Mon, 20 Mar 2023 16:46:28 -0700 (PDT)
X-Google-Original-Date: Mon, 20 Mar 2023 16:45:32 PDT (-0700)
Subject: Re: [PATCH 01/12] dt-bindings: riscv: sifive-ccache: Add compatible for StarFive JH7100 SoC
In-Reply-To: <Y+vxw28NWPfaW7ql@spud>
CC: cristian.ciocaltea@collabora.com, lee@kernel.org, robh+dt@kernel.org,
  krzysztof.kozlowski+dt@linaro.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
  kernel@esmil.dk, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
  richardcochran@gmail.com, sagar.kadam@sifive.com, yanhong.wang@starfivetech.com,
  devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
  kernel@collabora.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-49aaa4a3-0280-4401-ba33-7fe2f3b79534@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_164631_961204_E73AC14F 
X-CRM114-Status: GOOD (  25.58  )
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

On Tue, 14 Feb 2023 12:40:35 PST (-0800), Conor Dooley wrote:
> Hey all,
>
> On Sat, Feb 11, 2023 at 05:18:10AM +0200, Cristian Ciocaltea wrote:
>> Document the compatible for the SiFive Composable Cache Controller found
>> on the StarFive JH7100 SoC.
>> 
>> This also requires extending the 'reg' property to handle distinct
>> ranges, as specified via 'reg-names'.
>> 
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  .../bindings/riscv/sifive,ccache0.yaml        | 28 ++++++++++++++++++-
>>  1 file changed, 27 insertions(+), 1 deletion(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
>> index 31d20efaa6d3..2b864b2f12c9 100644
>> --- a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
>> +++ b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
>> @@ -25,6 +25,7 @@ select:
>>            - sifive,ccache0
>>            - sifive,fu540-c000-ccache
>>            - sifive,fu740-c000-ccache
>> +          - starfive,jh7100-ccache
>>  
>>    required:
>>      - compatible
>> @@ -37,6 +38,7 @@ properties:
>>                - sifive,ccache0
>>                - sifive,fu540-c000-ccache
>>                - sifive,fu740-c000-ccache
>> +              - starfive,jh7100-ccache
>>            - const: cache
>>        - items:
>>            - const: starfive,jh7110-ccache
>> @@ -70,7 +72,13 @@ properties:
>>        - description: DirFail interrupt
>>  
>>    reg:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: control
>> +      - const: sideband
>
> So why is this called "sideband"?
> In the docs for the JH7100 it is called LIM & it's called LIM in our
> docs for the PolarFire SoC (at the same address btw) and we run the HSS

IIRC it's both: "LIM" is the memory, "sideband" is the port.  I can't 
find any proper documentation of "sideband" outside of DT and errata, 
but there's a hanful of references to it in the bootloader for the 
fu540: 
<https://github.com/sifive/freedom-u540-c000-bootloader/search?q=sideband>.

It's not really clear which is more correct here: sideband accesses are 
only useful when the cache is configured as an LIM, at least for general 
software.  IIRC the accesses to the LIM only go through the sideband 
port for the E core, but I might be wrong about that.

> out of it! LIM being "loosely integrated memory", which by the limit
> hits on Google may be a SiFive-ism?

Yep: TIM is the SiFive version of Arm's TCM (tightly coupled memory), 
and LIM is the flavor that's farther away (L2 instead of L1).

> I'm not really sure if adding it as a "reg" section is the right thing
> to do as it's not "just" a register bank.
> Perhaps Rob/Krzysztof have a take on that one?
>
>>  
>>    next-level-cache: true
>>  
>> @@ -89,6 +97,7 @@ allOf:
>>            contains:
>>              enum:
>>                - sifive,fu740-c000-ccache
>> +              - starfive,jh7100-ccache
>>                - starfive,jh7110-ccache
>>                - microchip,mpfs-ccache
>>  
>> @@ -106,12 +115,29 @@ allOf:
>>              Must contain entries for DirError, DataError and DataFail signals.
>>            maxItems: 3
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: starfive,jh7100-ccache
>> +
>> +    then:
>> +      properties:
>> +        reg:
>> +          maxItems: 2
>> +
>> +    else:
>> +      properties:
>> +        reg:
>> +          maxItems: 1
>> +
>>    - if:
>>        properties:
>>          compatible:
>>            contains:
>>              enum:
>>                - sifive,fu740-c000-ccache
>> +              - starfive,jh7100-ccache
>>                - starfive,jh7110-ccache
>>  
>>      then:
>> -- 
>> 2.39.1
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
