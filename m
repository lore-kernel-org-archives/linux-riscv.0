Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B450C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 16:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqVHRIcQhKFoGNErdvzZmnH1vqobY6WC4vF7cPW2q74=; b=w4jUTsRPX14qBR
	Y3EBRwnxTYAte0Or8PAWciLwIE6lRrrs9auWn+qnwcBbbQymsv0VrtsiVP48A3A9DRcv8Dbkhg+Qc
	irJfwiltwFaRYdNmcpbS+xeBdtLrY6pA9bTsK+Gqng819NhAoorU9mQQVMR2NPHddd12NZ1qQoPpf
	2FM0j8YfIfcjUebAyN2A0G4nobTfgdOnyKBqCKNiZT0poZlx9qgjJ+saUsfH2enyB7huGyzz4RV/C
	BeoO+IU10KwFBQ3FWK/RcaZVlfNKl1yFNirIGTr91P4rfvW8WNXvphHlTnd9ctjO+DJNPGiFfmKsm
	3R2bI2hYVDgTb9cA1KJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOJdS-000000043a2-3h4W;
	Mon, 01 Jul 2024 16:12:10 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOJdQ-000000043X4-2U8S
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 16:12:10 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3d565deea08so1752826b6e.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 09:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719850319; x=1720455119; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gf3a5Pnrja8AHiv3n1YZ7CSp9kh7PHpbQf65ENC5dlQ=;
        b=P65wwy8Vbr82CMjofpPQkEBSowRV/fYqeWvDBt1BRJoaMR/QMJ5OnPDwiZMWe88igT
         yRXPFsjdgdjQuAZKODaszgz0wvjXkYwi6cUUKkkARFyd73Wv2ul9lsl7rmWmvbTnXqPz
         IdOiLOU+e/BwyPAMhIeL39XeTGn/S4fXKpzHmCmpimlGOoEvX/q+dZicEdRe2cAldhC2
         0q/UOmgoZWcCtMN2v7P8C6lgl8qKB7aOdTg9y/6bffx0J7kbIs55ZnkByeBI+ki194lP
         zlQWgRv+NvFeo1WUQjpmT0SxpbhtKOk3GaEvY1mhEYcj6YWKlQa/KhKcWW+CPdZ7KATl
         L5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719850319; x=1720455119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gf3a5Pnrja8AHiv3n1YZ7CSp9kh7PHpbQf65ENC5dlQ=;
        b=pv+9pLBN/rZDZhcJvvZ2c4yV9mH/BuRlWI45xLJ+7omqkMPjwHYs2FxSBWNTNK2KC+
         eXwU1xbcO7r9YBq2vaSBoEhwJcCRvS/nMvj0nj0OPq+j2mfXdaHH3oZCPlz/R+H3gOTa
         v2F3jveTSAmExoad5jkO9K7fzIV+kuvx/dyIprbfi+rvbxBXZ0rjX+2lug/r0p9FKh/4
         u0T/Cm94xMqIoVCqY2MBIxyzZEOqLo66HWVTEn09RbYn7rkEKbnFArg2nv1eb1jPQdyM
         ivAMX4v5syn0F+gv8lZJK1DKw5LVG3oJeze83l5VPADj+UbWuVRb/4mGoL6Dt6p6ZNX1
         kQiA==
X-Gm-Message-State: AOJu0YxhHBBHHphzOa9uhjf5vRX/64yuqUq97bGM+jAFjt8eksLYHRRK
	IeUgOr/TSS8Kpsu8LQf1chZw5PlCUhRyK9tOR2hhAvImGxxm5ZLDS3TcTivxbTQ=
X-Google-Smtp-Source: AGHT+IEwPAYueYsYBU7iXqBEMRFmuAd1MLK051xLXmuVq1c5N6cvZaOPH+qJWxXVW1W7c7sUfLOy2Q==
X-Received: by 2002:a05:6808:211b:b0:3d2:16c6:651a with SMTP id 5614622812f47-3d6b568709cmr9465278b6e.53.1719850318992;
        Mon, 01 Jul 2024 09:11:58 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79d692945b4sm357969185a.57.2024.07.01.09.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 09:11:58 -0700 (PDT)
Message-ID: <7ab7d629-6993-4cad-b5b7-62bddfc74a49@sifive.com>
Date: Mon, 1 Jul 2024 11:11:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
To: Conor Dooley <conor@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>,
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, peterlin@andestech.com
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
 <20240619-xtheadvector-v3-3-bff39eb9668e@rivosinc.com>
 <0cc13581-5cc4-4a25-a943-7a896f42da4c@sifive.com>
 <20240701-prancing-outpost-3cbce791c554@spud>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240701-prancing-outpost-3cbce791c554@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_091208_639343_7C6AB23B 
X-CRM114-Status: GOOD (  27.33  )
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

Hi Conor, Charlie,

On 2024-07-01 11:07 AM, Conor Dooley wrote:
> On Mon, Jul 01, 2024 at 10:27:01AM -0500, Samuel Holland wrote:
>> On 2024-06-19 6:57 PM, Charlie Jenkins wrote:
>>> The D1/D1s SoCs support xtheadvector so it can be included in the
>>> devicetree. Also include vlenb for the cpu.
>>>
>>> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
>>
>> The other C906/C910/C920-based SoCs need devicetree updates as well, although
>> they don't necessarily need to be part of this series:
>>
>>  - sophgo/cv18xx.dtsi
>>  - sophgo/sg2042-cpus.dtsi
>>  - thead/th1520.dtsi
> 
> Yeah, I think I pointed that out before with the same "escape hatch" of
> it not needing to be in the same series.
> 
>>
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
>>> index 64c3c2e6cbe0..6367112e614a 100644
>>> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
>>> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
>>> @@ -27,7 +27,8 @@ cpu0: cpu@0 {
>>>  			riscv,isa = "rv64imafdc";
>>
>> The ISA string should be updated to keep it in sync with riscv,isa-extensions.
> 
> This probably looks like this cos I said that the kernel shouldn't parse
> vendor extensions from "riscv,isa". My rationale was that we have
> basically no control of what a vendor extension means in riscv,isa so 
> we shouldn't parse them from it (so marginally worse than standard
> extensions, where it means what the spec says except when it doesn't).
> 
> Given how we implement the parsing, it also meant we weren't implying
> meanings for vendor extensions ACPI-land, where we also can't ensure the
> meanings or that they remain stable. That change is in a different
> series:
> https://patchwork.kernel.org/project/linux-riscv/patch/20240609-support_vendor_extensions-v2-1-9a43f1fdcbb9@rivosinc.com/
> 
> Although now that I think about it, this might break xandespmu... I
> dunno if the Andes guys switched over to using the new property outside
> of the single dts in the kernel tree using their SoC. We could
> potentially special-case that extension if they haven't - but my
> position on this mostly is that if you want to use vendor extensions you
> should not be using riscv,isa (even if the regex doesn't complain if you
> add them). I'd like to leave the code in the other patch as-is if we can
> help it.
> 
> I added Yu Chien Peter Lin here, maybe they can let us know what they're
> doing.

OK, that makes sense to me. Then please ignore my original comment.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
