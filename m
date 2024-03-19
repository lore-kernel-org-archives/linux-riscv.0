Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77D8C54E71
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 20:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oN5pOUKRThplRZv1I5slRWLx0Q5il6HJyfjhMU0hshQ=; b=eoB6inLtPlhoTB
	BatWkGiRaVg1rCixoUEozSkIwjyRx2AfCzIRwJ2oK5L+PUm02M3BQPuwIc6YB0Qto7ofcSdA9T506
	Y+CE7m1U3IGVI+oxrt404h6t17FC0pQxRP2tOYdvLlab5noyBLmx2KsLAH6EoBQ/yUuNZUe1dAcrZ
	MHXAIJNlhj5q1FvrJOA1qXPEPb4wg0TppvxX9IlQpkP0Bt3I+otnKGC8ERiHjkWlMbIeZ08O/U3D9
	e3tmOzkZySiAq59Yy6xIs6Qf8W0PiWPN2GCpU6Wn89x1tGYanSS6x0LE5cpFtI+2fPeFOG4N7qyLY
	uGmVFWuDpR5B472+AYyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmfks-0000000E4wm-06Ni;
	Tue, 19 Mar 2024 20:08:14 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmfkp-0000000E4vy-1BHp
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 20:08:12 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6e73e8bdea2so1478466b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 13:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710878889; x=1711483689; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rkJNwgrN4VGR1zn3PD/9c77pYyUa8kTmpK0GxF8tfOI=;
        b=VRFbUAlQYEAidlkLGRaympHoR/adJNvi8uWv+dh9IQQ1tBhwQ9EhN5v5UzV9AUE1P1
         4oJE7ZnzxEoR+PoATRXoKcyEvfssTBPNOulT7wkYrIgRHHXwcIBkSNN+xHpZ3DLkYn+U
         Pn4Eq82LFYJwMeCRKq3B5/coK+wJj1k/k2t8+cguvcSogdN1Ai12xadAn9TTEmB+E7vN
         k5KE8IN26NAnRPvupiRig15LNYuyBexM9toa3w8IqVGov1/Ve5v5qbWaXHfPvOXjBVvl
         M39CFHVJD7GNZ5LobqfxiKQvssgC9CiMZQ+5gkRbJQrGHpv/bMCcIhFxNBn/DFjJ9FFm
         9gAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710878889; x=1711483689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rkJNwgrN4VGR1zn3PD/9c77pYyUa8kTmpK0GxF8tfOI=;
        b=DgDN/NSeK4KCdWBDFSdVqlgzRpkam6tsk/9vcspa+8+4SnYI6/4l0ugMCsM8yIqazK
         XYh4zAy4QGG1DlhHD2znC94JJEu3CVNwe15Nm9uu8Zej5UKeHFZPQaXgPqbQAbHY8B9A
         XXx0ZsytCVHwYv6ydY5iYnTZJrPVnH3waH12wQl4GQ/yB+BTSiltpcC38Ag545AGwVOj
         R2/05tCuYn5u1F7m5PSw6qUiITRsoVvnRHuy5lj3h4xLVD6jaBf1ZaEekyr1PO6iJW3y
         3bc644q7it9wUVdDESzQdjxk9hG81VwGiwp6z2KvnUZdfBkYasoxZN3LmwxZ9XcaS0r2
         Hrow==
X-Forwarded-Encrypted: i=1; AJvYcCU5Qm0PxDySv8KPfLoq2669cQPFd1UVUlYYzpN9OY1Bfssk9Tn0tYkB8s6ZHyew5GHw0mcbeuFxdzB7j9ElZIjGctLFboiNhmu247NFVMpV
X-Gm-Message-State: AOJu0YzqZjexSS5OIOH8BCdDos+8QDnn8r1NoMBItoUHP1qWT4bMhHSr
	AW+oFTgMR3ECI4MXVKF3sT/F5cyrnhP8cGQsHIl0iXVDZfpKSIoMHKylKwnATKE=
X-Google-Smtp-Source: AGHT+IFLDgkgB2Z+3MM5ozahctRfYEQK4iTv6Z1gFhsYoXzCN7xONabavfEBjWDcNHY5t6EsiIzgfw==
X-Received: by 2002:a05:6a20:179e:b0:1a1:8c80:4336 with SMTP id bl30-20020a056a20179e00b001a18c804336mr108506pzb.21.1710878889358;
        Tue, 19 Mar 2024 13:08:09 -0700 (PDT)
Received: from ?IPV6:2601:647:4180:9630::546? ([2601:647:4180:9630::546])
        by smtp.gmail.com with ESMTPSA id y1-20020aa793c1000000b006e6795932a4sm10276999pff.80.2024.03.19.13.08.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 13:08:08 -0700 (PDT)
Message-ID: <f7a44b1a-a53e-4a43-aa94-d6fddbed4b81@rivosinc.com>
Date: Tue, 19 Mar 2024 13:08:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: RISC-V: fix IRQ detection on T-Head C908
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Guo Ren <guoren@kernel.org>
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
 <4bdaaff1-13ec-48c2-b165-6a8255784aef@rivosinc.com>
 <20240319-worry-video-66589b3ed8ae@spud>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240319-worry-video-66589b3ed8ae@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_130811_460708_7F364649 
X-CRM114-Status: GOOD (  49.49  )
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

On 3/19/24 02:06, Conor Dooley wrote:
> On Mon, Mar 18, 2024 at 05:48:13PM -0700, Atish Patra wrote:
>> On 3/18/24 16:48, Conor Dooley wrote:
>>> On Mon, Mar 18, 2024 at 03:46:54PM -0700, Atish Patra wrote:
> 
>>>> For 2.b, either we can start defining pseudo extensions or adding
>>>> vendor/arch/impid checks.
>>>>
>>>> @Conor: You seems to prefer the earlier approach instead of adding the
>>>> checks. Care to elaborate why do you think that's a better method compared
>>>> to a simple check ?
>>>
>>> Because I don't think that describing these as "errata" in the first
>>> place is even accurate. This is not a case of a vendor claiming they
>>> have Sscofpmf support but the implementation is flawed. As far as I
>>> understand, this is a vendor creating a useful feature prior to the
>>> creation of a standard extension.
>>> A bit of a test for this could be "If the standard extension never
>>> existed, would this be considered a new feature or an implementation
>>> issue". I think this is pretty clearly in the former camp.
>>>
>>
>> So we have 3 cases.
>>
>> 1. Pseudo extension: An vendor extension designed and/or implemented before
>> the standard RVI extension was ratified but do not violate any standard
>> encoding space.
>>
>> 2. Erratas: An genuine bug/design issue in the expected behavior from a
>> standard RVI extension (including violating standard encoding space)
>>
>> 3. Vendor extension: A new or a variant of standard RVI extension which is
>> different enough from standard extension.
>>
>> IMO, the line between #2 and #1 may get blurry as we going forward because
>> of the sheer number of small extensions RVI is comping up with (which is a
>> problem as well).
> 
> Aye, I think some of that is verging on ridiculous.
> 
>> Just to clarify: I am not too worried about this particular case as we know
>> that T-head's implementation predates the Sscofpmf extension.
>> But once we define a standard mechanism for this kind of situation, vendor
>> may start to abuse it.
> 
> How do you envisage it being abused by a vendor?
> Pre-dating the standard extension does make this one fairly clear-cut,
> but are you worried about people coming along and claiming to implement
> XConorSscofpmf instead of Sscofpmf rather than suffer the "shame" of a
> broken implementation?

Yes or just use this excuse continue their old implementation in a newer 
chip which was designed after the standard extension is ratified.


> All this stuff is going to be pretty case-by-case (to begin with at
> least) so I'm not too worried about that sort of abuse.
> 
>>> I do not think we should be using m*id detection implementations of a
>>> feature prior to creation of a standard extension for the same purpose.
>>> To me the main difference between a case like this and VentanaCondOps/Zicond
>>> is that we are the ones calling this an extension (hence my use of pseudo)
>>> and not the vendor of the IP. If T-Head were to publish a document tomorrow
>>> on the T-Head github repo for official vendor extensions, that difference
>>> would not even exist any longer.
>>>
>>
>> Exactly! If vendor publishes these as an extension or an errata, that's a
>> binding agreement to call it in a specific way.
> 
> I don't agree that we are bound to call it the way that the vendor does.
> We should just review these sorts of things on a case-by-case basis,
> committing to doing what the vendor says is abusable.
> 
>>> I also do not believe that it is a "simple" check. The number of
>>> implementations that could end up using this PMU could just balloon
>>> if T-Head has no intention of switching to Sscofpmf. If they don't
>>> balloon in this case, there's nothing stopping them ballooning in a
>>
>> Ideally, they shouldn't as it a simple case of CSR number & IRQ number.
>> If they care to implement AIA, then they must change it to standard sscofpmf
>> as the current IRQ violates the AIA spec. But who knows if they care to
>> implement AIA or not.
> 
> What kinda "worried" me here is that the c908 implements /both/ Zicbom
> and the T-Head CMO instructions and /both/ Svpbmt and their original
> misuse of the reserved bits but they do not support Sscofpmf. Maybe it
> just was not feasible to migrate entirely (but they did for vector) or
> to support both interrupt numbers and to alias the CSR, but it seemed
> like the opportunity to standardise a bunch of other stuff was taken,
> but this particular extension was not. That's why I was worried that
> we'd see some ballooning in these specific checks.
> 


This is the exact abuse I was talking about. A vendor can keep churning 
new chips with incompatible extensions because Linux just allowed them 
get away with it by calling it a Vendor Extension.

+Guo: In case he has any insight behind this decision from Thead.

>>> similar case in the future. We should let the platform firmware tell
>>> explicitly, be that via DT or ACPI, what features are supported rather
>>> than try to reverse engineer it ourselves via m*id.
>>>
>> Fair enough.
>>
>>
>>> That leads into another general issue I have with using m*id detection,
>>> which I think I have mentioned several times on the list - it prevents the
>>> platform (hypervisor, emulator or firmware) from disabling that feature.
>>>
>>
>> If that is the only concern, platform can just disable the actual
>> extension(i.e. sscofpmf in this case) to disable that feature for that
>> particular vendor.
> 
> Right. Maybe I wasn't clear that this is a problem with using m*id for
> /detection/ of extensions and not with using m*id to work around
> implementation issues with the extension. In the latter case, you're
> applying a fixup only when the actual extension is communicated to be
> present, which leaves that control in the hands of the platform.
> 

Hmm. I guess there is no way predict how vendors will include standard 
extensions. Let's give them a benefit of doubt hoping they realize 
abusing the system won't help anybody. They will try to adopt the 
standard extensions if it is possible and creates erratas for genuine 
problems.

>>> If I had a time machine back to when the T-Head perf or cmo stuff was
>>> submitted, I was try to avoid any of it being merged with the m*id
>>> detection method.
>>>
>>>> I agree that don't have the crystal ball and may be proven wrong in the
>>>> future (I will be definitely happy about that!). But given the diversity of
>>>> RISC-V ecosystem, I feel that may be our sad reality.
>>>
>>> I don't understand what this comment is referring to, it lacks context
>>> as to what the sad reality actually is.
>>>
>>> I hope that all made sense and explained why I am against this method
>>> for detecting what I believe to be features rather than errata,
>>> Conor.
>>>
>>
>> Yes.Thanks again for the clarification. Again, I am not opposed to the idea.
>> I just wanted to understand if this is the best option we have right now.
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
