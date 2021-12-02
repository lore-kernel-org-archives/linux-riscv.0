Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BEFC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 15:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G4/s7otOi+Fe98wc6GSOC4tRmgmt9JNxfasrULshHIY=; b=MhKfCdg86IsFRx
	WmY2VZwQ/dLV9Xc0qqKrctPzz/qk4m0J1y7WKjknan/JmbA7ADloFtXb6XEec0Bfq5x0Z3P4KJBMd
	VHx8C81rk+O+7AWylVRw7Pa0knROPUaFCEnQs6L5XLRvv8JaGhJqXYZtrROUi5R9fCf/me1qlsmeu
	VJ4KLr52Dnv5Z0rGIIzSqyTHDLOOgn34LomxVtzdpugpQdJ0Y29i0wcAamrV0hJO7Km/TSq4r3UjD
	bLzeweDIMDvHhhu6ztkMkYZwahPYDOpWp4lvkOBOxviNAqu5qTdWtEeRzOYKzogwfHEG4V9QGgkVK
	fQdsQtw6gPo5GCg9DiIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msniZ-00Ci3L-Ec; Thu, 02 Dec 2021 15:09:51 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msniW-00Ci2c-06
 for linux-riscv@lists.infradead.org; Thu, 02 Dec 2021 15:09:49 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E991840036
 for <linux-riscv@lists.infradead.org>; Thu,  2 Dec 2021 15:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638457778;
 bh=/YE+bo41cAJI7l8WQ6N05YC97AzD/OE7MHcOvq6Z7hQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=lifTwScwV9qZB92gsZPTPq61fJvhucOntdSNJHgJRTIO3gtNGqkVb7XDadoR1r+6Q
 ifRHLOWy1HoM4SkI/5QbCljU0jX3PdZ+CVr30pMbyZr9JjRu4A1Sa7ILNAuDJZli7r
 OneJg7l7Z4D1HN6iXar6d+lsgR2yzbcK80wG0A122JWBSeWQavR8vOUBH+odMRM4Sr
 2WJvp7c/K3Aspm7T3V+tkOZ+3DygFg2uZbCuDaQ3sQZ16EqLsiNHeRecNQnQuYLUjC
 MnAFRLEREJBoYb9L3dbUsYDIrbNr8GTIXM5rp42WQEg7HsMxnSCxvV8wyHSQ86EInE
 9M6upVCSTC19A==
Received: by mail-wm1-f72.google.com with SMTP id
 v62-20020a1cac41000000b0033719a1a714so14139962wme.6
 for <linux-riscv@lists.infradead.org>; Thu, 02 Dec 2021 07:09:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/YE+bo41cAJI7l8WQ6N05YC97AzD/OE7MHcOvq6Z7hQ=;
 b=CHHkoJB1dPzUiZG2Fz5V9AbFfAZz+QqlK1qccPc9fO8B/utWdEwEB87iLaSmxbfIwe
 OogNQhb5nisewPvqJJlTE8Wa9sRNQ7GX1IGYZ8Iq2kwam3ytZWQgXpNC+c6Pp58FpyHr
 njGGMNa7hIcfL/aPtI+7tbYz16Xixl9fC0wET6sHxpIjfJ2bkBNbXJ+U0ORP0S6ee6Kw
 +tJbIz9FCK/6VsW1mqbBA6FiCAkO2em7QOYSsSvpH45WPl/KWGv9Dz2Rv0F5gbFnodHW
 4LzieaUfXtpcLyHcailzlAhtRowkDw9mytWYwyUPBOf87JZhknhEtO41+03rR59t8FFk
 7Etw==
X-Gm-Message-State: AOAM5303I6HHbbH9SHg2VjIu+OL13rodRMfCUDyLk4ByrYJpthlTVfp/
 h7TEwgqRtZGm7U2KR0rQdREgVoGydBUfKkYdGhia0TVP/DbaMwvNl7Ep5VCEU7KYdZhil5A02C5
 U7iBp2EMT7q34OJweRP1Pr0W37iHO9waSnpja0XTQeMOZcQ==
X-Received: by 2002:a7b:cd02:: with SMTP id f2mr7047648wmj.115.1638457777650; 
 Thu, 02 Dec 2021 07:09:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWBGmyiUy9FN3kKDmHQoXlhVE2/F8L3wejnIgYL5Nep/x0vEccUbidkBJ4Kpmj3xuf/NUPlw==
X-Received: by 2002:a7b:cd02:: with SMTP id f2mr7047505wmj.115.1638457776515; 
 Thu, 02 Dec 2021 07:09:36 -0800 (PST)
Received: from [192.168.123.55] (ip-88-152-144-157.hsi03.unitymediagroup.de.
 [88.152.144.157])
 by smtp.gmail.com with ESMTPSA id az15sm19217wmb.0.2021.12.02.07.09.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 07:09:36 -0800 (PST)
Message-ID: <7e978e9a-344c-42dc-786f-8f21854ac316@canonical.com>
Date: Thu, 2 Dec 2021 16:09:34 +0100
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
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20211202150515.GA97518@sunil-ThinkPad-T490>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_070948_304897_05BB438A 
X-CRM114-Status: GOOD (  20.03  )
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

On 12/2/21 16:05, Sunil V L wrote:
> Hi All,
>     I am starting this thread to discuss about the "boot-hartid" DT node
>     that is being used in RISC-V Linux EFI stub.
> 
>     As you know, the boot Hart ID is passed in a0 register to the kernel
>     and hence there is actually no need to pass it via DT. However, since
>     EFI stub follows EFI application calling conventions, it needs to
>     know the boot Hart ID so that it can pass it to the proper kernel via
>     a0. For this issue, the solution was to add "/chosen/boot-hartid" in
>     DT. Both EDK2 and u-boot append this node in DT.
> 
>     But above approach causes issue for ACPI since ACPI initialization
>     happens late in the proper kernel. Same is true even if we pass this
>     information via SMBIOS.
> 
>     Do you have any suggestions what can be done in ACPI case? Can we use
>     a UEFI variable with RVI specific GUID to pass this information? This
>     will have the advantage that it can work with either DT or ACPI.
>     Also, we may not need any UEFI spec update. Do you see any issue with
>     this approach? Your inputs will be very helpful.

What happened to your suggestions in

https://linuxplumbersconf.org/event/11/contributions/1099/attachments/781/1602/LPC_2021_ACPI_RISCV_Sunil.pdf

Best regards

Heinrich

> 
> Thanks!
> Sunil
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
