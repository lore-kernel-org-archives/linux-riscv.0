Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C1EC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 15:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xInLXet/B78LWKX31Q4aWnnUjtX1YRwXyXDIZJMVIdg=; b=s/pqs+Ra3TlQ0v
	mIjyho5/SPjjAvK36i5zxvy51X2blCXS0O7wus6+7RU6X1+n4GOttYmbXF1eSlocyOeBU/qmWiZdT
	uIxh8ZvswIIfUBnFkGI99OwmL1j+SASVe5dzjzPl4KbIf4n6spknQHR1EUU8IbdyeMTeYXQdGI3vB
	GvhT87gFQbuRJEgEHGinnlVyrGRQrJ78qX/D4nkiewgl0iqb9w1CKiBhmG5wfl2IDTI9rL47ZbWbq
	QgHTtxdGzW312K08quf4TKRqZRLVX7bVCLbEHKTr6KkADnX2LqCh/sge6fpEt7+nbpFHdabWsDMDK
	SPHhuqDBY301wFn9tNRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msoSt-00CtEz-Vp; Thu, 02 Dec 2021 15:57:44 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msoO5-00CraX-NH
 for linux-riscv@lists.infradead.org; Thu, 02 Dec 2021 15:52:47 +0000
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 292823F1EE
 for <linux-riscv@lists.infradead.org>; Thu,  2 Dec 2021 15:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638460364;
 bh=MINWVJfgQaMIuxl9xLsdWx4HURiBs1kX71J3LxRh86Y=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=JErMt7w2xaiwfvpU8dzAAwTRoPB/C39PNp95YUS4SHV+Q9n65xilQ1yicaz0teuF3
 Ga0gDkC9lhpO6Ue91BMk0A3a3aLRqYsOdcicVkP0dapUUbR3Ig63lD7G4cnFBmNnzZ
 v4omO2D3R4lI7NXhy0NCBlQKAtHnFktWF1jELC6b+uiBYz4aWBM9iL3hRiHJceVqma
 lrZWhktm4DNYeOkda3/X79dQox5JzX2YFtT97xIL9bjQo87K2YGBXeuecW2hzsGB9o
 aiQlZvjA6QXchKpJDuHzcWeRGlEDKeIBLXx1qISe9Q04Naq+rCEoLZk0HLJuFd3YV8
 WO0rxLgJ2VVIw==
Received: by mail-wr1-f69.google.com with SMTP id
 q5-20020a5d5745000000b00178abb72486so5154316wrw.9
 for <linux-riscv@lists.infradead.org>; Thu, 02 Dec 2021 07:52:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MINWVJfgQaMIuxl9xLsdWx4HURiBs1kX71J3LxRh86Y=;
 b=N1zrQUp2DcsmTZoB5iPkW9t+DnLBWZw1aBeJJt4XcgetY8mmYwpuyAAaNy4kRVdoX/
 r0sKQwr9Lr+blGwDPzGNkM0ZJ9JpR9ijTjNvFdheQlPxa0I+HK6ox/LPTp8ophKQnURg
 ro8jE6NIOFDtzLCl3yYdu6HB9o549Wq+c5nQukX5rFM7bJ3cBxSijHDMf5tPqJMkBvES
 NZxAIxP3CYYkiuk1Yj1SWwWaMBZj6yCrHx7iWKSEKi1tc+gDKaLWrrJu2EZ2+6tanpBr
 oqbkF90e2J6j2UHXf94gLdTWUxpk61hfjzAVnb7xfhlucSPok1R1anTjmCFkRqSp3sq3
 d5XA==
X-Gm-Message-State: AOAM531wYzOY4JtsbYeTdGpiSSagDjPxz5cZy/CaFAmxMB24uyJa1YbN
 tlifCAml30qPeCBpuGFLxV80XLQYGugwUbT6Nfd6I3kRSv5vYza74YMd2nbnYv8q5kvlbSsKCM/
 SZv7Pzi1mKraU0Nil9/QHxs7v7RRwDLIbOL4UwsNrbu5weg==
X-Received: by 2002:a05:6000:15c6:: with SMTP id
 y6mr15446525wry.422.1638460363869; 
 Thu, 02 Dec 2021 07:52:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbP7iLsZ0/KB9HaSR0w4WFZ1mKgmYEp9vYsUiuK2ucdNATGJ9VfPrlNUKWrEbOUc4MhrJrjg==
X-Received: by 2002:a05:6000:15c6:: with SMTP id
 y6mr15446505wry.422.1638460363623; 
 Thu, 02 Dec 2021 07:52:43 -0800 (PST)
Received: from [192.168.123.55] (ip-88-152-144-157.hsi03.unitymediagroup.de.
 [88.152.144.157])
 by smtp.gmail.com with ESMTPSA id h27sm2772637wmc.43.2021.12.02.07.52.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 07:52:43 -0800 (PST)
Message-ID: <d2885863-a9be-2853-a3cb-86af7f1c25cd@canonical.com>
Date: Thu, 2 Dec 2021 16:52:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: Question regarding "boot-hartid" DT node
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: sunil.vl@gmail.com, linux-riscv@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>, Atish Patra <atishp@atishpatra.org>,
 Abner Chang <abner.chang@hpe.com>, Jessica Clarke <jrtc27@jrtc27.com>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@rivosinc.com>
References: <20211202150515.GA97518@sunil-ThinkPad-T490>
 <7e978e9a-344c-42dc-786f-8f21854ac316@canonical.com>
 <20211202151723.GB97518@sunil-ThinkPad-T490>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20211202151723.GB97518@sunil-ThinkPad-T490>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_075246_030439_D399A5F0 
X-CRM114-Status: GOOD (  19.83  )
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

On 12/2/21 16:17, Sunil V L wrote:
> Hi Heinrich,
> On Thu, Dec 02, 2021 at 04:09:34PM +0100, Heinrich Schuchardt wrote:
>> On 12/2/21 16:05, Sunil V L wrote:
>>> Hi All,
>>>      I am starting this thread to discuss about the "boot-hartid" DT node
>>>      that is being used in RISC-V Linux EFI stub.
>>>
>>>      As you know, the boot Hart ID is passed in a0 register to the kernel
>>>      and hence there is actually no need to pass it via DT. However, since
>>>      EFI stub follows EFI application calling conventions, it needs to
>>>      know the boot Hart ID so that it can pass it to the proper kernel via
>>>      a0. For this issue, the solution was to add "/chosen/boot-hartid" in
>>>      DT. Both EDK2 and u-boot append this node in DT.
>>>
>>>      But above approach causes issue for ACPI since ACPI initialization
>>>      happens late in the proper kernel. Same is true even if we pass this
>>>      information via SMBIOS.
>>>
>>>      Do you have any suggestions what can be done in ACPI case? Can we use
>>>      a UEFI variable with RVI specific GUID to pass this information? This
>>>      will have the advantage that it can work with either DT or ACPI.
>>>      Also, we may not need any UEFI spec update. Do you see any issue with
>>>      this approach? Your inputs will be very helpful.
>>
>> What happened to your suggestions in
>>
>> https://linuxplumbersconf.org/event/11/contributions/1099/attachments/781/1602/LPC_2021_ACPI_RISCV_Sunil.pdf
> 
> The challenge is, the EFI stub part which comes very early even before
> proper kernel starts. If the information required in later stage of the
> kernel, we can use ACPI tables.

What I have never understood is why the core calling the EFI stub cannot 
identify it own hartid which is stored in CSR mhartid. The missing piece 
seems to be SBI support to read this piece of information. That way we 
could get rid of passing the boot hartid via a0.

Best regards

Heinrich

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
