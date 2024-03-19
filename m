Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050CDC54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 00:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=axEQePkoyfVl9HV8MDE3pSHDvT3Im52p4S9ZR+C0I2k=; b=qhPrafH9LmXNnY
	PMiAvMG1GJbWlJlpHsnCARh+H8n72lkcM8qMneTdhi1jBkhwkbV7qB0nLQBlSjk9ajsL3/ZaPskln
	Hchqzf2Kli1/FEBeyrSl7IfpCkrfQDdaRzpWcBCdXky3iRKM9Uy1Aj9gD9ikqHh9w6njdqwsXYXdN
	OeMMYOxEZdzb4OCyV1RdqSQ+X0jnxN0aDtjvaZTJFzAGASNv4vHfh4ZKF5+EX3E10wbZ35WwzBQZX
	H8GVUgSpUw76J+NWXTPS5cHPDDMk3HjfH/d/g4EeOMPLAETx44AQ/SXqJ2YbZ0JH8cVhF9fQ64swA
	Wl+qc0uwBVn4r+nn64fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmNeS-0000000Aj9p-1orV;
	Tue, 19 Mar 2024 00:48:24 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmNeK-0000000Aj7x-3p0D
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 00:48:19 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6e6b729669bso4555610b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 17:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710809296; x=1711414096; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yoQC0dzBdtonSkqm/RtUnP1Za8zAV2tsPncdk5+FgBc=;
        b=EH7MLwFycVyawZDhiaJoq/kaMwrPOZs+mkXpj2WEfdD3S02OJCdDLU+gO+VQb+wrQW
         BESwsuYbTSn6fMmMYcBOcbj74T8wE/Cs7keVtlYmAqRj0L+6+JKnV1l5NE47IRRU0OKS
         WoAot8e+qCYtOPw27P346/yhMFTPT9vPYBSNeMK2Pk8GKciT4k6kWkEr1P/zp4tI4s2g
         /pXMPSDgMvugNsiYyn865WwiMBcQQoAtza0R5QTj5yDVE1hryHsOqoC7Sjoa/LQWTT5V
         3Wvap3wS/kBRWw2AHqSrqVWxsc6T6vrVzmVnLHotmgbwaThcxUMcRGWGp/4QiDi5ozgq
         fJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710809296; x=1711414096;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yoQC0dzBdtonSkqm/RtUnP1Za8zAV2tsPncdk5+FgBc=;
        b=wzFdfUyoon5W9qM5x+7TG8NgnFGbbfNnU8928FFEbStz5WEAtv5sWGdGcO0lr7xM1d
         DhYbvNYHq8K8ITKMeYgfpL13+jkIFTFYvPkQdNOQR91PpRLcO+mp7vPzzvdfLV+U4Sue
         cTmRtlymSZ1sGjQnWZY8+VmIR2MNcRvaxBfCEBI9TIH+ymG3UT9St1niKEgWYZwqVhbG
         IoLkl6lquXITiBf2ExOcsoKnc21Yidy+OSEbA5ytHG4VG6MkUlI9ak4I4f/hnUXYZa2C
         ExjTu0DqBJagqBYZ4ecSDKHHvw7eoradqh8i6VN/81DgEnSyfMelhNQ3im1HcVbnQufc
         5ELQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHw7zMRe92aau0TsO+CdbGYHShZaD6RkO0rdbXutWHwiHK0FA1wIkbEN9qcOgPm4QCeVFTFlojXw200Lwsq6LixVWZ/H+cqGkPc3//uJmK
X-Gm-Message-State: AOJu0YwNZXR5r0WebLgizkos7JBNFhryc95dzeWFUnykXyaoG6saRNCD
	ogAJdrbnnKwuCjGIZ8NbGe+ufsKPHVOBpFL1AaJj1sb2mVrYqBtJ5BrDUy/Il+4=
X-Google-Smtp-Source: AGHT+IEuPN5HwvdMgU8aQHpMHROerORefeOBu+IIEd/Fd3fiZr0d9mEL+ytjqsn/PNIW1v6NRw/lhQ==
X-Received: by 2002:a05:6a00:2386:b0:6e6:977e:6427 with SMTP id f6-20020a056a00238600b006e6977e6427mr1613276pfc.8.1710809295748;
        Mon, 18 Mar 2024 17:48:15 -0700 (PDT)
Received: from ?IPV6:2601:647:4180:9630::546? ([2601:647:4180:9630::546])
        by smtp.gmail.com with ESMTPSA id d1-20020aa78141000000b006e6c0080466sm8755569pfn.176.2024.03.18.17.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 17:48:15 -0700 (PDT)
Message-ID: <4bdaaff1-13ec-48c2-b165-6a8255784aef@rivosinc.com>
Date: Mon, 18 Mar 2024 17:48:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: RISC-V: fix IRQ detection on T-Head C908
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Inochi Amaoto <inochiama@outlook.com>, Qingfang Deng <dqfext@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>,
 Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240311063018.1886757-1-dqfext@gmail.com>
 <IA1PR20MB4953ECC3E32E95303872CD14BB242@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CALW65jZ+q8sDiRKgsRL9n+939HNUCnkKuO=YJjHB5Js=WYQeOg@mail.gmail.com>
 <20240312-evil-resource-66370b68b9b4@spud>
 <IA1PR20MB4953CE8999960BA71B46DE6CBB2A2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240315-73aa13079ef83a4559869084@orel>
 <2de56d8b-bc78-428b-9c09-4729b269fa41@rivosinc.com>
 <20240318-such-animal-bf33de12dc3a@spud>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240318-such-animal-bf33de12dc3a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_174817_015537_858162B0 
X-CRM114-Status: GOOD (  65.36  )
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

On 3/18/24 16:48, Conor Dooley wrote:
> On Mon, Mar 18, 2024 at 03:46:54PM -0700, Atish Patra wrote:
>> On 3/15/24 01:11, Andrew Jones wrote:
>>> On Wed, Mar 13, 2024 at 09:31:26AM +0800, Inochi Amaoto wrote:
>>> ...
>>>> IMHO, it may be better to use a new DT property like "riscv,cpu-errata" or
>>>> "<vendor>,cpu-errata". It can achieve almost everything like using pseudo
>>>> isa. And the only cost I think is a small amount code to parse this.
>>>>
>>>
>>> What's the ACPI equivalent for this new DT property? If there isn't one,
>>> then the cost is also to introduce something to the ACPI spec and add the
>>> ACPI parsing code.
>>>
>>> I'd much rather we call specified behaviors "extensions", whether they
>>> are vendor-specific or RVI standard, and then treat all extensions the
>>> same way in hardware descriptions and Linux. It'd also be best if errata
>>> in extension implementations were handled by replacing the extension in
>>> the hardware description with a new name which is specifically for the
>>> behavior Linux should expect. (Just because two extensions are almost the
>>> same doesn't mean we should say we have one and then have some second
>>> mechanism to say, "well, not really, instead of that, it's this". It's
>>> cleaner to just remove the extension it doesn't properly implement from
>>> its hardware description and create a name for the behavior it does have.)
>>>
>>> Errata in behaviors which don't have extension names (are hopefully few)
>>> and are where mvendorid and friends would need to be checked, but then why
>>> not create a pseudo extension name, as Conor suggests, so the rest of
>>> Linux code can manage errata the same way it manages every other behavior?
>>>
>>> The growth rate of the ISA bitmap is worth thinking about, though, since
>>> we have several copies of it (at least one "all harts" bitmap, one bitmap
>>> for each hart, another one for each vcpu, and then there's nested virt...)
>>> We don't have enough extensions to worry about it now, but we can
>>> eventually try partitioning, using common maps for common bits, not
>>> storing bits which can be inferred from other bits, etc.
>>
>> This is my biggest worry going forward. We already have a ever growing
>> standard RVI extension list. On top of that we have genuine vendor
>> extensions. IMHO, errata are bit different than extensions as there will be
>> few vendor extensions in the future but many hardware erratas :)
> 
> I dunno, I think there's going to be plenty of both. We may not see (or
> use) a lot of vendor extensions in mainline Linux, but they will exist.
> 

I hope that will happen. But I fear we will have lot of vendor 
extensions in mainline Linux. That is the "sad reality" I was talking 
about at the end of the thread.

>> If we start calling every hardware errata as an pseudo ISA extensions, we
>> will much bigger problem maintaining it in the future.
> 
> I've explained to you at least once already that this is not my goal.
> Where there are genuine issues with the implementation of an extension
> creating a "pseudo" extension is not what I am suggesting we do.
> I have no problem with with the approach taken for the SiFive errata,
> for example.
> 

Thanks for clarifying. But we have to define the rules what gets in as 
pseudo extension very clearly to avoid any kind of abuse in the future.

>> We discussed this earlier during the Andes PMU extension series[1] as well.
>> We have three types of extensions in discussions now.
>>
>> 1. standard RVI extensions
>> 2. Vendor extensions
>> 	a. Genuine vendor extension
>> 	b. Vendor erratas which can be described as pseudo-extensions now
> 
>> Keeping all these within a single ISA bitmap space seems very odd to me.
>> I think the feasible approach would be to partition the standard and vendor
>> ISA extension space as you suggested.
> 
> Let's be clear - partitioning the space is unrelated to the detection
> method. We can go ahead and partition the space and use "pseudo"
> extensions or we can have a unified space but use archid/impid for
> detection. Having a unified space is the simpler thing to implement
> right now, but it totally does not stop us breaking them out in the
> future. We could even gate these custom implementations behind config
> options if bloat is a concern - but multiplatform kernels are likely to
> enable all the options anyway.
> 

Agreed.

>> For 2.b, either we can start defining pseudo extensions or adding
>> vendor/arch/impid checks.
>>
>> @Conor: You seems to prefer the earlier approach instead of adding the
>> checks. Care to elaborate why do you think that's a better method compared
>> to a simple check ?
> 
> Because I don't think that describing these as "errata" in the first
> place is even accurate. This is not a case of a vendor claiming they
> have Sscofpmf support but the implementation is flawed. As far as I
> understand, this is a vendor creating a useful feature prior to the
> creation of a standard extension.
> A bit of a test for this could be "If the standard extension never
> existed, would this be considered a new feature or an implementation
> issue". I think this is pretty clearly in the former camp.
> 

So we have 3 cases.

1. Pseudo extension: An vendor extension designed and/or implemented 
before the standard RVI extension was ratified but do not violate any 
standard encoding space.

2. Erratas: An genuine bug/design issue in the expected behavior from a 
standard RVI extension (including violating standard encoding space)

3. Vendor extension: A new or a variant of standard RVI extension which 
is different enough from standard extension.

IMO, the line between #2 and #1 may get blurry as we going forward 
because of the sheer number of small extensions RVI is comping up with 
(which is a problem as well).

Just to clarify: I am not too worried about this particular case as we 
know that T-head's implementation predates the Sscofpmf extension.
But once we define a standard mechanism for this kind of situation, 
vendor may start to abuse it.


> I do not think we should be using m*id detection implementations of a
> feature prior to creation of a standard extension for the same purpose.
> To me the main difference between a case like this and VentanaCondOps/Zicond
> is that we are the ones calling this an extension (hence my use of pseudo)
> and not the vendor of the IP. If T-Head were to publish a document tomorrow
> on the T-Head github repo for official vendor extensions, that difference
> would not even exist any longer.
> 

Exactly! If vendor publishes these as an extension or an errata, that's 
a binding agreement to call it in a specific way.

> I also do not believe that it is a "simple" check. The number of
> implementations that could end up using this PMU could just balloon
> if T-Head has no intention of switching to Sscofpmf. If they don't
> balloon in this case, there's nothing stopping them ballooning in a

Ideally, they shouldn't as it a simple case of CSR number & IRQ number.
If they care to implement AIA, then they must change it to standard 
sscofpmf as the current IRQ violates the AIA spec. But who knows if they 
care to implement AIA or not.


> similar case in the future. We should let the platform firmware tell  > explicitly, be that via DT or ACPI, what features are supported rather
> than try to reverse engineer it ourselves via m*id.
>
Fair enough.


> That leads into another general issue I have with using m*id detection,
> which I think I have mentioned several times on the list - it prevents the
> platform (hypervisor, emulator or firmware) from disabling that feature.
> 

If that is the only concern, platform can just disable the actual 
extension(i.e. sscofpmf in this case) to disable that feature for that 
particular vendor.

> If I had a time machine back to when the T-Head perf or cmo stuff was
> submitted, I was try to avoid any of it being merged with the m*id
> detection method.
> 
>> I agree that don't have the crystal ball and may be proven wrong in the
>> future (I will be definitely happy about that!). But given the diversity of
>> RISC-V ecosystem, I feel that may be our sad reality.
> 
> I don't understand what this comment is referring to, it lacks context
> as to what the sad reality actually is.
> 
> I hope that all made sense and explained why I am against this method
> for detecting what I believe to be features rather than errata,
> Conor.
> 

Yes.Thanks again for the clarification. Again, I am not opposed to the 
idea. I just wanted to understand if this is the best option we have 
right now.

> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
