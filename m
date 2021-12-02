Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED764C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 17:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u9JrH+S3/JXDvNPTvtzRdezJlTAyQQdVvuYxoAwvnOk=; b=A9p8YL3fIr4eyy
	moEJNB2hTUtBmFxK/hsFX5QDwQ6o4ODLqH15aa/WtCNB+HCcqw4czS6NVidNwXiAznrDxYNon7AQy
	3cygyxAfU27g3eKnJn2yOhIp5jh4qa0BurgyzHF3USocGMAJQ3pxH8BZRvixY5oxMMuFXrZAkq6JG
	INYdAVtjLqhYaVYS8pzkN/na3dixtC2pwvkM3MyiyajaUI7AaP1FvIKwxIQ8/0//DHHj8izVqVMfB
	eNPogtH1MCK9hHRhoyoekbSc2tyHKWcokOQCiJb0/rwqfKG+J0hLAIqtvSZhIpjyN/BftCbLEGN1s
	1DKOMURu+lDNdcw09DeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mspVy-00D6eW-Vi; Thu, 02 Dec 2021 17:04:59 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mspVv-00D6eC-NK
 for linux-riscv@lists.infradead.org; Thu, 02 Dec 2021 17:04:57 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 531F34003E
 for <linux-riscv@lists.infradead.org>; Thu,  2 Dec 2021 17:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638464694;
 bh=esrqVKxhm6TOEhDLnZLdO7pRtsReb1PGgH4iNUaXA70=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=p8bdamksP8pWYkCmhIUumql7TT+yOyshUiWPwCsgO8cVDylkA9PnKecOf2C2ob/mh
 IWrJ7SYDfRsOKL+GblWvce781Llg3H2Kld+MlKp5vXPzKdML9SOzQc5W27rCeX5K62
 3MMaj6ojiACDldp8MiHNBsQp4C3k+yCrY+KinEXI0slYrNQxfU8M0tSmck31E2IkyI
 qVYov7jhmzULq5ySry8rb3vm8nUNtjbhKnF29uW+ru9JWlh0sGABzyB4PKobGuE1G1
 R34WQkVVH5sjEh2bP+Bu6O0gP8g6ZTlFiKIZiqv2n8dcs6Rv3GFxDtjM/D++vUE4/K
 CLOhsldda+12Q==
Received: by mail-wm1-f70.google.com with SMTP id
 v62-20020a1cac41000000b0033719a1a714so156638wme.6
 for <linux-riscv@lists.infradead.org>; Thu, 02 Dec 2021 09:04:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=esrqVKxhm6TOEhDLnZLdO7pRtsReb1PGgH4iNUaXA70=;
 b=WTr0zfO07NuMjCJaHdhU7oMTw65GHLIWIXrmJkfIURqiS3xk6m35FsYwCnFLMAZfGw
 5Vk9o/m3k7Bj2SWWbO5LQ/3O0sjZvl6jA5QNCGmGSpbeyazTHm4c/OPWtB9XrmtHo+i4
 bWbPXXrf6eGUFT9iX0v04NL27ZEHVn7eoW6fN24QH2qtM+O9FUKyd2q5FCr5mYB0KD1+
 gA7BkwcmcnusVGvnKCTrtlnOOWaLP+ELQ5A32qHiPDRxrFh4/cnqRzYuDdCRbhCXBEf8
 VdIOkZKGCwGCZY/ex7HH76oBONTQxa5uLevgwQ2lmk+7mysPhbfaWz7+ILDZcAhXm9BM
 t0DA==
X-Gm-Message-State: AOAM530hemFLm/AvkFLnNhNQa/5YqLw90amz3MCgtUyjqJHxnp437RuI
 Hml6/VEhn0bbcB8lqupKeztzTyJmMQ5Gyo73CISSfgnWwjrsTxkKyOD693HlKQ6GdTGnVYSsCW0
 d5t9Edd1WkMZAskhN1TQ3Lhosjt1+HQyZ/XfzQwqFsh8Dow==
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr15515344wry.347.1638464693850; 
 Thu, 02 Dec 2021 09:04:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyotJV6h8JvIsAnY2T71KuGHvWQZmvHdv3H61JtP/u0peR/M5p8CV90o1kGmHBkmhIz+Z5nsw==
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr15515314wry.347.1638464693648; 
 Thu, 02 Dec 2021 09:04:53 -0800 (PST)
Received: from [192.168.123.55] (ip-88-152-144-157.hsi03.unitymediagroup.de.
 [88.152.144.157])
 by smtp.gmail.com with ESMTPSA id m34sm2872533wms.25.2021.12.02.09.04.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 09:04:53 -0800 (PST)
Message-ID: <6d9f131d-b3e8-18df-a9b6-6aaac881eb65@canonical.com>
Date: Thu, 2 Dec 2021 18:04:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: Question regarding "boot-hartid" DT node
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Atish Patra <atishp@atishpatra.org>, Abner Chang <abner.chang@hpe.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@rivosinc.com>, sunil.vl@gmail.com,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Sunil V L <sunilvl@ventanamicro.com>
References: <20211202150515.GA97518@sunil-ThinkPad-T490>
 <CAMj1kXGJtMmcXLjHEG8xX0sSFNfdjj4A2_4DPcviEJ3=MARh+w@mail.gmail.com>
 <89d42547-ec36-5f84-88d1-fd65d891488c@canonical.com>
 <CAMj1kXG-VnhkECGewZPkUZLC2rb1bSDGdSpby9R=W_1d3FAsdg@mail.gmail.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <CAMj1kXG-VnhkECGewZPkUZLC2rb1bSDGdSpby9R=W_1d3FAsdg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_090456_022304_460109EC 
X-CRM114-Status: GOOD (  23.41  )
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

On 12/2/21 17:58, Ard Biesheuvel wrote:
> On Thu, 2 Dec 2021 at 17:53, Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
>>
>> On 12/2/21 17:20, Ard Biesheuvel wrote:
>>> On Thu, 2 Dec 2021 at 16:05, Sunil V L <sunilvl@ventanamicro.com> wrote:
>>>>
>>>> Hi All,
>>>>      I am starting this thread to discuss about the "boot-hartid" DT node
>>>>      that is being used in RISC-V Linux EFI stub.
>>>>
>>>>      As you know, the boot Hart ID is passed in a0 register to the kernel
>>>>      and hence there is actually no need to pass it via DT. However, since
>>>>      EFI stub follows EFI application calling conventions, it needs to
>>>>      know the boot Hart ID so that it can pass it to the proper kernel via
>>>>      a0. For this issue, the solution was to add "/chosen/boot-hartid" in
>>>>      DT. Both EDK2 and u-boot append this node in DT.
>>>>
>>>
>>> I think this was a mistake tbh
>>>
>>>>      But above approach causes issue for ACPI since ACPI initialization
>>>>      happens late in the proper kernel. Same is true even if we pass this
>>>>      information via SMBIOS.
>>>>
>>>
>>> It would be better to define a RISCV specific EFI protocol that the
>>> stub can call to discover the boot-hartid value. That wat, it can pass
>>> it directly, without having to rely on firmware tables.
>>
>> As discovering the current process' hartid is not a UEFI specific task
>> SBI would be a better fit.
>>
> 
> I disagree. The OS<->loader firmware interface is UEFI not SBI. So if
> the EFI stub needs to ask the firmware which boot-hartid it should
> pass in A0, it should use a EFI protocol and nothing else.
> 
> Whether or not the loader/firmware *implements* this EFI protocol by
> calling into SBI is a different matter (and likely the best choice).
> But that does not mean the EFI stub should make SBI calls directly.
>

The EFI stub does not need the boot-hartid. It is the main Linux kernel 
that does. And that kernel already implements SBI calls.

The main kernel could just try to read CSR mhartid which fails in S-mode 
and the SBI could emulate it.

Best regards

Heinrich

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
