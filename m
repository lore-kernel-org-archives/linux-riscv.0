Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921E1C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 10:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bGghCC2u1tiYp7kp8ERGs5a7qU3DAvvFkQkATrBkhdE=; b=h1OTk0jdKcUg13
	/OU4V2KuFObc0x2qZyDoZchMkX3tAJcXzd3TatR4QcOhtR4dhNhYX+RweUGnERQcoAw+JdeknLnyg
	KLJQKjrXz51f0I4IcFJ1yf/qB0LwnA0We+GFvE1hnTIknOYOhlRa02ECbyIPRsSagYayfY2nDYfId
	4DwCB/c9z+qE56Xn7asW1nSQTQpIb6tesx75qwxutYSUZTEO40MmEQlHpdoJXTKXfcLCjlLlDTh2E
	W/n5vFC3tTUBftd1Hx1I+Wp/ZSMnWoykE9MXhnqcNOohMNGytnGmev9eIxwoum2RQid9Q0JaKQdGl
	8S9z1Fb1enf3Ry2e7rvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt6CU-00FHCv-Hm; Fri, 03 Dec 2021 10:53:58 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt6CR-00FHB9-3i
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 10:53:57 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 56E753F1BD
 for <linux-riscv@lists.infradead.org>; Fri,  3 Dec 2021 10:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638528829;
 bh=KPG+2pWHa3lCO4JLzyco/bmTTasvbX6cW+v9eYyjLqo=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=rHIdDHWtGCgRa43hvQN1akmOuePnJWbQcfCHaNJsBfbfjzrsdvrdCA1Av/oR8XzfH
 QjlnKWjya+OOPOeURBRZqYc28MOBi5UD9yrOulVN0zjKnQLjp6R3b+++LHr+/cj7xz
 LFWzuA6HXnfn2xE4F+AmPXF6S+vV63Ti2vYjgBNsvsxdGPGtslCYfvPE4VUlJnv4dR
 dFsAj9Sp/AKiPV1rHiD4cSkFtE/s6hE7qVTkK2+zmlunMRjgqfOJ604F4Pg/+fwM8n
 c3RY5xwj1answhEpfeGySyYk1pyq4Jlj4w0sctHlOqIgn4gJDo9F3RygMrrqhSFcpK
 m1CD169FJkCiA==
Received: by mail-wm1-f72.google.com with SMTP id
 n41-20020a05600c502900b003335ab97f41so1201207wmr.3
 for <linux-riscv@lists.infradead.org>; Fri, 03 Dec 2021 02:53:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KPG+2pWHa3lCO4JLzyco/bmTTasvbX6cW+v9eYyjLqo=;
 b=vhP0kHa+hoDA3RsuhdxDx4BRVwKojyQa7DCXdRCpt22afKSrnR/nUkAUD+7s6VfHzv
 Hm5aPj72GLISLVtHPPPxXsE6bufrjUPfpQIj6yRyeupQa2j0Di0kPas7rVQDmETu5cdc
 7d2qg/bYZMAQQLh2yxokfQjFu84hiArQprx6NTStZ2N3F8pY7vHGYaJuFJQeKm39DmAB
 xWz4dkJJwp4gutdze9sfTJQlyuKwu6xmvth/A7xFlttVKzYyjFITY30WrD0t5O9vPpxG
 IdFzzzuENhDzU2e3W1Q3Jq/jW8HI0Csk+TOROGpdQZhvmUAhswZsiaySEzkpMdicwA7I
 IoNw==
X-Gm-Message-State: AOAM531N5OxeNtF2V7L4V3ISBwvNkaw+16cUThY2DB6qX31J8t+PqrGJ
 4OWGS0Zu9gnvcLBmxLSdDtWxQ5/KpPkoJ7mQEPlWT/qUp5oKk/tkFeELpeRvrCIALAUOc/5fsgl
 LMgzsysEQf6gStrAJMOv49vR0RlEgaE2znUO6cz6L5kKHhA==
X-Received: by 2002:a1c:4b07:: with SMTP id y7mr13709230wma.188.1638528829002; 
 Fri, 03 Dec 2021 02:53:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxByiYz09gJSpcj6WAIRBrR/JIjfDBtJvmznWX3Trk0Z5vVORCER/QFSJLq+dPQeotxN/8AVg==
X-Received: by 2002:a1c:4b07:: with SMTP id y7mr13709208wma.188.1638528828760; 
 Fri, 03 Dec 2021 02:53:48 -0800 (PST)
Received: from [192.168.123.35] (ip-88-152-144-157.hsi03.unitymediagroup.de.
 [88.152.144.157])
 by smtp.gmail.com with ESMTPSA id j17sm2748603wmq.41.2021.12.03.02.53.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 02:53:48 -0800 (PST)
Message-ID: <6fccad4e-b579-25ed-6bf3-2fb2a968b243@canonical.com>
Date: Fri, 3 Dec 2021 11:53:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: Question regarding "boot-hartid" DT node
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>, Atish Patra <atishp@atishpatra.org>
Cc: Abner Chang <abner.chang@hpe.com>, Jessica Clarke <jrtc27@jrtc27.com>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@rivosinc.com>,
 sunil.vl@gmail.com, linux-riscv <linux-riscv@lists.infradead.org>,
 Sunil V L <sunilvl@ventanamicro.com>
References: <20211202150515.GA97518@sunil-ThinkPad-T490>
 <CAMj1kXGJtMmcXLjHEG8xX0sSFNfdjj4A2_4DPcviEJ3=MARh+w@mail.gmail.com>
 <89d42547-ec36-5f84-88d1-fd65d891488c@canonical.com>
 <CAMj1kXG-VnhkECGewZPkUZLC2rb1bSDGdSpby9R=W_1d3FAsdg@mail.gmail.com>
 <6d9f131d-b3e8-18df-a9b6-6aaac881eb65@canonical.com>
 <CAOnJCUJfEpW6TtBPFGZ9TfNJeb9r+-L_8BddsxxejAd9Fe8VHw@mail.gmail.com>
 <CAMj1kXHGPZBfaiMCPYt7tYe+5wt_jn78Qdih9U-XLDba5sfqtQ@mail.gmail.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <CAMj1kXHGPZBfaiMCPYt7tYe+5wt_jn78Qdih9U-XLDba5sfqtQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_025355_403721_24AE8301 
X-CRM114-Status: GOOD (  32.48  )
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

On 12/3/21 11:13, Ard Biesheuvel wrote:
> On Thu, 2 Dec 2021 at 20:29, Atish Patra <atishp@atishpatra.org> wrote:
>>
>> On Thu, Dec 2, 2021 at 9:05 AM Heinrich Schuchardt
>> <heinrich.schuchardt@canonical.com> wrote:
>>>
>>> On 12/2/21 17:58, Ard Biesheuvel wrote:
>>>> On Thu, 2 Dec 2021 at 17:53, Heinrich Schuchardt
>>>> <heinrich.schuchardt@canonical.com> wrote:
>>>>>
>>>>> On 12/2/21 17:20, Ard Biesheuvel wrote:
>>>>>> On Thu, 2 Dec 2021 at 16:05, Sunil V L <sunilvl@ventanamicro.com> wrote:
>>>>>>>
>>>>>>> Hi All,
>>>>>>>       I am starting this thread to discuss about the "boot-hartid" DT node
>>>>>>>       that is being used in RISC-V Linux EFI stub.
>>>>>>>
>>>>>>>       As you know, the boot Hart ID is passed in a0 register to the kernel
>>>>>>>       and hence there is actually no need to pass it via DT. However, since
>>>>>>>       EFI stub follows EFI application calling conventions, it needs to
>>>>>>>       know the boot Hart ID so that it can pass it to the proper kernel via
>>>>>>>       a0. For this issue, the solution was to add "/chosen/boot-hartid" in
>>>>>>>       DT. Both EDK2 and u-boot append this node in DT.
>>>>>>>
>>>>>>
>>>>>> I think this was a mistake tbh
>>>>>>
>>>>>>>       But above approach causes issue for ACPI since ACPI initialization
>>>>>>>       happens late in the proper kernel. Same is true even if we pass this
>>>>>>>       information via SMBIOS.
>>>>>>>
>>>>>>
>>>>>> It would be better to define a RISCV specific EFI protocol that the
>>>>>> stub can call to discover the boot-hartid value. That wat, it can pass
>>>>>> it directly, without having to rely on firmware tables.
>>>>>
>>>>> As discovering the current process' hartid is not a UEFI specific task
>>>>> SBI would be a better fit.
>>>>>
>>>>
>>>> I disagree. The OS<->loader firmware interface is UEFI not SBI. So if
>>>> the EFI stub needs to ask the firmware which boot-hartid it should
>>>> pass in A0, it should use a EFI protocol and nothing else.
>>>>
>>>> Whether or not the loader/firmware *implements* this EFI protocol by
>>>> calling into SBI is a different matter (and likely the best choice).
>>>> But that does not mean the EFI stub should make SBI calls directly.
>>>>
>>>
>>> The EFI stub does not need the boot-hartid. It is the main Linux kernel
>>> that does. And that kernel already implements SBI calls.
>>>
>>> The main kernel could just try to read CSR mhartid which fails in S-mode
>>> and the SBI could emulate it.
>>
>> New SBI extension should be added only if there is no other way to
>> solve a generic

I am not sure this feature would be implemented as SBI extension or as a 
CSR emulation. Cf. sbi_emulate_csr_read(). But anyway it would require 
an update of the SBI specification.

>> problem. The boot hartid issue is very specific to efi booting only.
>> Any system that doesn't require

The boot hartid is not EFI related at all. A firmware running single 
threaded does not need this information.

Information about the boot hartid is a general OS need.

I am wondering why S-mode software should not have a generic means to 
find out on which hart it is currently running.

>> EFI booting won't need it. Even for EFI booting, we have other
>> approaches already proposed
>> to solve it. That's why, SBI extension should be the last resort
>> rather than first.
>>
>> I think an RISC-V specific EFI protocol as suggested by Ard should
>> work for all the cases.
>> Is there a case where you think it may not work ? U-Boot & EDK2
>> already stores the boot hartid.
>> They just implement that protocol and pass the hartid to the caller.
>> We do need to support it in the grub though.
>>
> 
> Why would GRUB care about this? The EFI stub will call into the
> underlying firmware to invoke the protocol, GRUB is just a loader with
> a fancy menu that allows you to select which image to load, no?

This is a related discussion:

https://github.com/tekkamanninja/grub/commit/be9d4f1863a1fcb1cbbd2f867309457fade8be73#commitcomment-60851029

If GRUB loads a devicetree it will anyway have to call into the firmware 
for fixups. These will include adding the boot-hartid.

> 
>> @Heinrich Schuchardt
>> I vaguely remember you proposed something similar when we discussed
>> this first during FOSDEM.
>> I can't recall why it was abandoned in favor of the DT approach which
>> works. But,
>> it is not an ideal solution considering RISC-V ACPI support is already
>> on the way.
>>
>> Do you have a link to the older thread where this thing was discussed ?

Unfortunately I cannot find anything.

Best regards

Heinrich

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
