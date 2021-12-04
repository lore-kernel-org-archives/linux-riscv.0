Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B3AC433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Dec 2021 08:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KWiE2PTv73r7nb+66yoMu/hHp3wBtrKibUlavtEbEc=; b=dVKVh7IAYmhqb9
	waVgRdg9G8f8hhIVGAv6KcuPdwiGrvMHeT2lrt9SC1xo+10Z06m4j3MU169yk41SkCRPH3O+jk9sD
	xGPd3nUa4TGYpxjn8wX3A5c8u4ElJgk6aZKdYTVVIdUw5KPE7mH9ym9fIKAzQeQBkYvep2GkCEFDK
	212fUgkaBvzEBIqPeXQD54hAoI/nhgFkPt/Lqk+oojHm7MKpAhB0iD241W7kedFnrHKgNIcf9IILw
	aLmAmN5B0kcBn3TiB5RKSLpR5e27krvJ3oteFrs3muQ3TUMMWZ+EV2kJnAO/txcDV4qZNNV3QThkW
	Jce2Hgbxa979jgifv/TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtQZS-0007YB-6K; Sat, 04 Dec 2021 08:39:02 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtQZN-0007Xi-EM
 for linux-riscv@lists.infradead.org; Sat, 04 Dec 2021 08:39:00 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AD10040036
 for <linux-riscv@lists.infradead.org>; Sat,  4 Dec 2021 08:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638607129;
 bh=nTpaxcHyHDwT4Ex6B4Za39BOWdMccS4pvVZyvybuAVs=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=VkyvHzmzmQXgEpr/yMFCqFvbUrqoS5i+sN72XFC3tsVXHhabes9Mev5y10QRZ9klR
 X456TV3b8CRsHdf/S9X8rPboFByn9JNTOSleQ6RLioO99nJNBloZXM2D58OgabhtHE
 7ZmS2oIM5ORmR7+FOibM93dxDrfiPCnF6g9/oc47fkYGbW7rLVMJCSI0Tyfz+bQSYR
 HnS4JWI+mujvOCk5Nl0xpJk2K92I2LTUapveZ0TkA3Mry+1z+lfv7c37MhWd2uAmII
 Ajnq5aYRuNWDKfST0AtJyj0H1w/TRFbC9xfV4I1ke9Qi+NWpn3YQo6eu4V6mce0nz2
 FfC4v+Q+KAjQQ==
Received: by mail-wm1-f70.google.com with SMTP id
 a85-20020a1c7f58000000b0033ddc0eacc8so4751987wmd.9
 for <linux-riscv@lists.infradead.org>; Sat, 04 Dec 2021 00:38:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nTpaxcHyHDwT4Ex6B4Za39BOWdMccS4pvVZyvybuAVs=;
 b=TDB+DwaZt3uArxE/K4EjBG3m7laEvg8mBTHg6bDpClKo+FCnF2U5uCKg2zUpQFvbur
 HDjmMUUcv+YkHE8DPEyZWNbQscM22XnM4HfB4fo5ngDWPu/KZzKrxARpirCsNYV3VQlj
 wJc0S5stjwAbjcjdsKjjrVSKeUvYZkuBjR+mJIzxXbbtrbtFCaQ9h+A/ybYIuCH9iC2k
 WEEkiijJvnbAdhvNM0njK3grJuASEC/EKC+hq0f92vEdMhefHlbJMtogf/CRB43eD+Is
 5Gzbjyyf72qqx19NSsb4DaYEc88f+ss/HKANr/HP5H45sU7PDqgINzZwpTT8v+RNhdHH
 imNA==
X-Gm-Message-State: AOAM532gOcj8/9yiwvpC0K4NyzoMvVMhpXsKRjGdCLoV/4VcWE5mnraa
 agBd9/2DJ+RdzVB/4RVOOsmC03IdokOXs1uWLazM7elMQKfHJyCxAkeVjrdKt5l3hfYdOLjOiId
 n+ViR5xBL11TshcmHN+BC7SM1WnTLDLFIzCgIcxa+QqEk7A==
X-Received: by 2002:adf:e286:: with SMTP id v6mr27796729wri.565.1638607129194; 
 Sat, 04 Dec 2021 00:38:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzox1Zuq5dnwb9vj+Fv0bltzbI2igsK9dl3ZpSUXjZaUG+Vj/Nl6zQLQNqqHNQsPirUzHslPA==
X-Received: by 2002:adf:e286:: with SMTP id v6mr27796696wri.565.1638607128803; 
 Sat, 04 Dec 2021 00:38:48 -0800 (PST)
Received: from [192.168.123.35] (ip-88-152-144-157.hsi03.unitymediagroup.de.
 [88.152.144.157])
 by smtp.gmail.com with ESMTPSA id r83sm7526206wma.22.2021.12.04.00.38.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Dec 2021 00:38:48 -0800 (PST)
Message-ID: <c7ae9067-977a-225f-bd97-28ab361a2117@canonical.com>
Date: Sat, 4 Dec 2021 09:38:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: Question regarding "boot-hartid" DT node
Content-Language: en-US
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atishp@atishpatra.org>, Abner Chang <abner.chang@hpe.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Jessica Clarke
 <jrtc27@jrtc27.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 sunil.vl@gmail.com, linux-riscv <linux-riscv@lists.infradead.org>,
 Sunil V L <sunilvl@ventanamicro.com>, Ard Biesheuvel <ardb@kernel.org>
References: <20211202150515.GA97518@sunil-ThinkPad-T490>
 <CAMj1kXGJtMmcXLjHEG8xX0sSFNfdjj4A2_4DPcviEJ3=MARh+w@mail.gmail.com>
 <89d42547-ec36-5f84-88d1-fd65d891488c@canonical.com>
 <CAMj1kXG-VnhkECGewZPkUZLC2rb1bSDGdSpby9R=W_1d3FAsdg@mail.gmail.com>
 <6d9f131d-b3e8-18df-a9b6-6aaac881eb65@canonical.com>
 <CAOnJCUJfEpW6TtBPFGZ9TfNJeb9r+-L_8BddsxxejAd9Fe8VHw@mail.gmail.com>
 <CAMj1kXHGPZBfaiMCPYt7tYe+5wt_jn78Qdih9U-XLDba5sfqtQ@mail.gmail.com>
 <6fccad4e-b579-25ed-6bf3-2fb2a968b243@canonical.com>
 <c758bae4-3578-f062-edfd-f5835ae525fe@gmx.de>
 <CAOnJCUJ6Aoh7881HOSifQTc61+vCTVjxnYORfWM_WGLJQCugRg@mail.gmail.com>
 <7416157e-50d1-3664-7df0-2a45e29cd8c1@canonical.com>
 <CAAhSdy1DOnEGpxPQF7juUSyBTyx9W8KsH8exTpOmTLOnNCMJqg@mail.gmail.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <CAAhSdy1DOnEGpxPQF7juUSyBTyx9W8KsH8exTpOmTLOnNCMJqg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211204_003857_931012_A6757DC3 
X-CRM114-Status: GOOD (  52.70  )
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



On 12/4/21 05:24, Anup Patel wrote:
> On Sat, Dec 4, 2021 at 7:17 AM Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
>>
>>
>>
>> On 12/4/21 01:44, Atish Patra wrote:
>>> On Fri, Dec 3, 2021 at 10:45 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>>>>
>>>> On 12/3/21 11:53 AM, Heinrich Schuchardt wrote:
>>>>> On 12/3/21 11:13, Ard Biesheuvel wrote:
>>>>>> On Thu, 2 Dec 2021 at 20:29, Atish Patra <atishp@atishpatra.org> wrote:
>>>>>>>
>>>>>>> On Thu, Dec 2, 2021 at 9:05 AM Heinrich Schuchardt
>>>>>>> <heinrich.schuchardt@canonical.com> wrote:
>>>>>>>>
>>>>>>>> On 12/2/21 17:58, Ard Biesheuvel wrote:
>>>>>>>>> On Thu, 2 Dec 2021 at 17:53, Heinrich Schuchardt
>>>>>>>>> <heinrich.schuchardt@canonical.com> wrote:
>>>>>>>>>>
>>>>>>>>>> On 12/2/21 17:20, Ard Biesheuvel wrote:
>>>>>>>>>>> On Thu, 2 Dec 2021 at 16:05, Sunil V L <sunilvl@ventanamicro.com>
>>>>>>>>>>> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>> Hi All,
>>>>>>>>>>>>         I am starting this thread to discuss about the
>>>>>>>>>>>> "boot-hartid" DT node
>>>>>>>>>>>>         that is being used in RISC-V Linux EFI stub.
>>>>>>>>>>>>
>>>>>>>>>>>>         As you know, the boot Hart ID is passed in a0 register to
>>>>>>>>>>>> the kernel
>>>>>>>>>>>>         and hence there is actually no need to pass it via DT.
>>>>>>>>>>>> However, since
>>>>>>>>>>>>         EFI stub follows EFI application calling conventions, it
>>>>>>>>>>>> needs to
>>>>>>>>>>>>         know the boot Hart ID so that it can pass it to the proper
>>>>>>>>>>>> kernel via
>>>>>>>>>>>>         a0. For this issue, the solution was to add
>>>>>>>>>>>> "/chosen/boot-hartid" in
>>>>>>>>>>>>         DT. Both EDK2 and u-boot append this node in DT.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> I think this was a mistake tbh
>>>>>>>>>>>
>>>>>>>>>>>>         But above approach causes issue for ACPI since ACPI
>>>>>>>>>>>> initialization
>>>>>>>>>>>>         happens late in the proper kernel. Same is true even if we
>>>>>>>>>>>> pass this
>>>>>>>>>>>>         information via SMBIOS.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> It would be better to define a RISCV specific EFI protocol that the
>>>>>>>>>>> stub can call to discover the boot-hartid value. That wat, it can
>>>>>>>>>>> pass
>>>>>>>>>>> it directly, without having to rely on firmware tables.
>>>>>>>>>>
>>>>>>>>>> As discovering the current process' hartid is not a UEFI specific
>>>>>>>>>> task
>>>>>>>>>> SBI would be a better fit.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> I disagree. The OS<->loader firmware interface is UEFI not SBI. So if
>>>>>>>>> the EFI stub needs to ask the firmware which boot-hartid it should
>>>>>>>>> pass in A0, it should use a EFI protocol and nothing else.
>>>>>>>>>
>>>>>>>>> Whether or not the loader/firmware *implements* this EFI protocol by
>>>>>>>>> calling into SBI is a different matter (and likely the best choice).
>>>>>>>>> But that does not mean the EFI stub should make SBI calls directly.
>>>>>>>>>
>>>>>>>>
>>>>>>>> The EFI stub does not need the boot-hartid. It is the main Linux kernel
>>>>>>>> that does. And that kernel already implements SBI calls.
>>>>>>>>
>>>>>>>> The main kernel could just try to read CSR mhartid which fails in
>>>>>>>> S-mode
>>>>>>>> and the SBI could emulate it.
>>>>>>>
>>>>>>> New SBI extension should be added only if there is no other way to
>>>>>>> solve a generic
>>>>>
>>>>> I am not sure this feature would be implemented as SBI extension or as a
>>>>> CSR emulation. Cf. sbi_emulate_csr_read(). But anyway it would require
>>>>> an update of the SBI specification.
>>>>>
>>>>>>> problem. The boot hartid issue is very specific to efi booting only.
>>>>>>> Any system that doesn't require
>>>>>
>>>>> The boot hartid is not EFI related at all. A firmware running single
>>>>> threaded does not need this information.
>>>>>
>>>>> Information about the boot hartid is a general OS need.
>>>>>
>>>>> I am wondering why S-mode software should not have a generic means to
>>>>> find out on which hart it is currently running.
>>>>>
>>>>>>> EFI booting won't need it. Even for EFI booting, we have other
>>>>>>> approaches already proposed
>>>>>>> to solve it. That's why, SBI extension should be the last resort
>>>>>>> rather than first.
>>>>>>>
>>>>>>> I think an RISC-V specific EFI protocol as suggested by Ard should
>>>>>>> work for all the cases.
>>>>>>> Is there a case where you think it may not work ? U-Boot & EDK2
>>>>>>> already stores the boot hartid.
>>>>>>> They just implement that protocol and pass the hartid to the caller.
>>>>>>> We do need to support it in the grub though.
>>>>>>>
>>>>>>
>>>>>> Why would GRUB care about this? The EFI stub will call into the
>>>>>> underlying firmware to invoke the protocol, GRUB is just a loader with
>>>>>> a fancy menu that allows you to select which image to load, no?
>>>>>
>>>>> This is a related discussion:
>>>>>
>>>>> https://github.com/tekkamanninja/grub/commit/be9d4f1863a1fcb1cbbd2f867309457fade8be73#commitcomment-60851029
>>>>>
>>>
>>> Yes!! Thanks for refreshing the memory. It seems after 2 years, we are
>>> still debating the same topic :).
>>> Let me summarize the thread. There are multiple ways for EFI stub code
>>> to retrieve the boot hartid.
>>>
>>> 1. EFI variables - This is what Henerich proposed last time. Ard
>>> suggested that EFI configuration tables are better candidates than EFI
>>> variables.
>>> 2. DT modification - This was preferred over the configuration table
>>> at that time given because RISC-V was DT only at that time.
>>>                                    We already had all the infrastructure
>>> around DT. Thus, DT seemed to be a natural choice then.
>>>                                    It works now for existing setup
>>> however, the DT approach will not work for systems with ACPI support.
>>>                                    Adding a similar entry in ACPI tables
>>> is possible but adding ACPI support in EFI stub is not trivial.
>>> 3. SMBIOS - Only for platforms with SMBIOS support. SMBIOS is not
>>> mandatory and adding SMBIOS support in EFI stub is not trivial.
>>> 4. SBI         -  As I mentioned before, this is an EFI specific
>>> problem because EFI stub doesn't know what the boot hartid is. Thus,
>>> it should be solved
>>>                         in an EFI specific way. An SBI extension for
>>> such features may not be acceptable as the non-EFI booting method
>>> works fine without the SBI extension.
>>> 5. RISC-V specific EFI configuration table or protocol: Ard suggested
>>> EFI configuration table last time. Earlier in this thread, EFI
>>> protocol was suggested.
>>>                         My personal preference has always been one of
>>> these as it solves the problem for all EFI booting methods
>>>                         for platforms-os
>>> combination(DT/ACPI-Linux/FreeBSD) in an EFI specific way.
>>>
>>> @Heinrich: Do you see any issue with the EFI configuration table or
>>> protocol to retrieve the boot hartid?
>>
>> There is nothing technical stopping us from implementing either option.
>>
>> We could simply reuse the EFI Device Tree Fixup Protocol
>> (https://github.com/U-Boot-EFI/EFI_DT_FIXUP_PROTOCOL) implemented in
>> U-Boot and already used by systemd-boot. Pass a devicetree (which may be
>> empty) to the Fixup() method and it will add the /chosen node with the
>> boot-hartid parameter.
>>
>> The EFI stub anyway creates a new device-tree to pass the memory map to
>> the kernel in the ACPI case (function update_fdt()). Calling the EFI
>> Device Tree Fixup Protocol could be easily added.
> 
> Are you suggesting that DTB (skeletal or full-blown) will always be there when
> booting the kernel as an EFI application ? If yes then we are
> indirectly mandating
> skeletal DTB for UEFI+ACPI system.

The boot-hartid uses to be the hartid of the current thread. Are 
operating systems supposed to support boot-hartid to relate to another 
hardware thread then the current one? If the boot-hartid can differ from 
the current thread, what would be the source of truth? Is there any 
formal specification defining what the boot-hartid is and how it shall 
be used? Is there any formal specification which defines the transfer of 
the boot-hartid in the boot flow?

I only found this in the OpenSBI documentation:

The DT properties of a domain instance DT node are as follows:
* **boot-hart** (Optional) - The DT node phandle of the HART booting the 
domain instance. If coldboot HART is assigned to the domain instance 
then this DT property is ignored and the coldboot HART is assumed to be 
the boot HART of the domain instance.

The only piece of software that cares about the boot-hartid property is 
neither the SBI nor the UEFI firmware nor the EFI stub but the main OS 
kernel. Carrying the current hartid from boot stage to boot stage via 
register and DTB entry looks like a poor design decision. Instead of 
relying on a chain of transfers it would preferable that whoever in the 
boot chain wants to know the current hartid requests it from the source 
of truth.

The source of truth for the current hardware thread is the value of the 
mhartid CSR. Unfortunately this can only be read in M-mode. It could be 
made available via the SBI. I see no reason why the operating system or 
hypervisor should not see the hartid of a software thread at any time.

If we decide to make the current design more complex by using an EFI 
protocol, we have to decide if we want to reuse an existing one, or 
introduce a new one.

We already have an existing protocol in U-Boot which could do the job 
and which uses a dtb as transfer format. Internally OpenSBI, U-Boot and 
Linux always use a device-tree. But this does not hold true for other 
software like EDK II. We could instead define a new protocol which uses 
a uint64_t parameter and does not require support for the flattened 
devicetree format.

My preferred choice would be getting rid of multiple transfers and 
letting the piece of software that needs the information read the 
boot-hartid directly from wherever the source of truth is.

Best regards

Heinrich

> 
> Regards,
> Anup
> 
>>
>> Best regards
>>
>> Heinrich
>>
>>>
>>> My only concern with the RISC-V EFI protocol is that Ard suggested it
>>> doesn't need a modification in UEFI spec.
>>> Where should we document it in this case ? We can't document it in
>>> Linux or EBBR.
>>> Because, this is a protocol that server systems and other non-Linux OS
>>> will also use.
>>> We can define it in the RISC-V platform spec. But that's not the usual
>>> place where somebody will look for the definition of such protocol.
>>>
>>> Wouldn't it be better to standardize it in UEFI spec ? The UEFI spec
>>> already has ARCH specific protocols/config tables.
>>>
>>>>>
>>>>> If GRUB loads a devicetree it will anyway have to call into the firmware
>>>>> for fixups. These will include adding the boot-hartid.
>>>>>
>>>>>>
>>>>>>> @Heinrich Schuchardt
>>>>>>> I vaguely remember you proposed something similar when we discussed
>>>>>>> this first during FOSDEM.
>>>>>>> I can't recall why it was abandoned in favor of the DT approach which
>>>>>>> works. But,
>>>>>>> it is not an ideal solution considering RISC-V ACPI support is already
>>>>>>> on the way.
>>>>>>>
>>>>>>> Do you have a link to the older thread where this thing was discussed ?
>>>>>
>>>>> Unfortunately I cannot find anything.
>>>>
>>>> I assume Atish referred to this thread:
>>>>
>>>> https://patchwork.ozlabs.org/project/uboot/patch/20200205055334.4072-1-xypron.glpk@gmx.de/
>>>>
>>>> Best regards
>>>>
>>>> Heinrich
>>>>
>>>> _______________________________________________
>>>> linux-riscv mailing list
>>>> linux-riscv@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>>
>>>
>>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
