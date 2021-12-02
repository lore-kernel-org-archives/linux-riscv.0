Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1923BC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 16:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ysMKlygGoW5PVQXR24P3q3QcXhAEfJSpHkl1x9Yw71E=; b=JPPCL3tzyrr8tX
	vteL90izJal5V+NLwcgZbnaTcQu0qN/GUpWpFE/ToQ0FCrEVhAWvuRwR24+vit010mNCbdcNkWlDt
	OndSGs5Fo+Ff6qP0Jb9jJfpzVnq3/BnE8RMd6td8hYRdN7RQ6r/42cBk2CZABI4P/mhagrdfJwikT
	GCSyaSZ+72jTe0M459UMvIcYGqt/h/s3e8dCYdsyYcKMao+7ZzZoAPwH0HSK6g78Mif5K9kSWJwGP
	XthzGoSDR/nOUNwGa7Z+qqThvsdj884CyK92u+IP4zwtqXTzpqhvD2MFjoZ5ABp9seia3PShegafS
	2QWWhC6HDnFFWaBFTPkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mspME-00D5Jc-OZ; Thu, 02 Dec 2021 16:54:54 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mspMC-00D5Ie-4A
 for linux-riscv@lists.infradead.org; Thu, 02 Dec 2021 16:54:53 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 65FD73F1F2
 for <linux-riscv@lists.infradead.org>; Thu,  2 Dec 2021 16:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638464088;
 bh=jn+3hompXvT7kUrX35fa4aYYydFjtl2TqEIQDKfISxI=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=Ado2+alFG9srpLjPEXdcDt3UvSwCiVdabHl8Z+zZZv2AFf/g33GLXCZsbTyesfyuw
 fAj75SgOwhho6RQjWDzdBKAObsBl9B7xeB7GkObCHAcTESBXLjwKs7jaB8nAzP4E21
 pwUG0cqyA/OZrughNwL+n2IwFv7VhSXBFp5Om4xU+7kaq1+z8Z0Dd31F+d5fdZxlzm
 w77Uf8k8KuYLXUuqt0sJjDDzuoveVPC8k2HK9wDt2nckgLN4lKU855P3mgJ9z1TVa9
 +uQBxVZpW877B3JyKvoHeFhy8ZSAvCC3N/Dd+72R/5NdeKl0wixiSO69njLKKZ9hjV
 Tu6grzj+tVG/Q==
Received: by mail-wm1-f72.google.com with SMTP id
 i131-20020a1c3b89000000b00337f92384e0so1996176wma.5
 for <linux-riscv@lists.infradead.org>; Thu, 02 Dec 2021 08:54:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jn+3hompXvT7kUrX35fa4aYYydFjtl2TqEIQDKfISxI=;
 b=mhAh0n2WAuD3WZL8g+vLv2RTUTg3IACo/wP4JIlGQ38DBuOj/8tjGB0YCSPx27j0o1
 19nRlRybMyPu9sDvSFBpjeZ+K1x35W5IGcfPc7I/RViQFaXOfiKupYJriefoj8uwqFCJ
 8w+6rSExEKcXSm81JfnpTut3s8wblTOsp6AT9xxU8vItwLdx0WYWdz7sIU4yaTMIk1xZ
 GkiruNZAHPW7iG50mabG/M9/GBKJXACB4LnC2W7m+dWGNYWc3L8OjsMJg55ku9+lShQB
 vHMnrIBtaL1O3CX5b9BMyzTnRI2PP6nit9JQCBEOU7JZz9gfbjHQ+pZYeT11LYOUE10z
 e1iw==
X-Gm-Message-State: AOAM5313QXpJ3nsUwD503TIgJyTs/R55vXfBmXwBF8nX/eAUY5H7VjG3
 yg9uwCjnnr2YF+mLOhgoRpdi97sGst2JZqno3wZGip3oKunTTOlauDSYQg/huwkJ94i61cUANTU
 VghTkktjKktVBPEzsQL7IsrODxqrMvCFop3fIlh/mGgJb1A==
X-Received: by 2002:adf:dc0a:: with SMTP id t10mr15735781wri.8.1638464028092; 
 Thu, 02 Dec 2021 08:53:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEZjz+0GVIcWWxRCt9C9qH3pUyM85AxNcxzDJE2/2yr3n+5SnxhkM5+asw2F7RzzlMcTMDrg==
X-Received: by 2002:adf:dc0a:: with SMTP id t10mr15735762wri.8.1638464027837; 
 Thu, 02 Dec 2021 08:53:47 -0800 (PST)
Received: from [192.168.123.55] (ip-88-152-144-157.hsi03.unitymediagroup.de.
 [88.152.144.157])
 by smtp.gmail.com with ESMTPSA id o12sm255760wmq.12.2021.12.02.08.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 08:53:47 -0800 (PST)
Message-ID: <89d42547-ec36-5f84-88d1-fd65d891488c@canonical.com>
Date: Thu, 2 Dec 2021 17:53:46 +0100
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
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <CAMj1kXGJtMmcXLjHEG8xX0sSFNfdjj4A2_4DPcviEJ3=MARh+w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_085452_339585_396F68C5 
X-CRM114-Status: GOOD (  22.91  )
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

On 12/2/21 17:20, Ard Biesheuvel wrote:
> On Thu, 2 Dec 2021 at 16:05, Sunil V L <sunilvl@ventanamicro.com> wrote:
>>
>> Hi All,
>>     I am starting this thread to discuss about the "boot-hartid" DT node
>>     that is being used in RISC-V Linux EFI stub.
>>
>>     As you know, the boot Hart ID is passed in a0 register to the kernel
>>     and hence there is actually no need to pass it via DT. However, since
>>     EFI stub follows EFI application calling conventions, it needs to
>>     know the boot Hart ID so that it can pass it to the proper kernel via
>>     a0. For this issue, the solution was to add "/chosen/boot-hartid" in
>>     DT. Both EDK2 and u-boot append this node in DT.
>>
> 
> I think this was a mistake tbh
> 
>>     But above approach causes issue for ACPI since ACPI initialization
>>     happens late in the proper kernel. Same is true even if we pass this
>>     information via SMBIOS.
>>
> 
> It would be better to define a RISCV specific EFI protocol that the
> stub can call to discover the boot-hartid value. That wat, it can pass
> it directly, without having to rely on firmware tables.

As discovering the current process' hartid is not a UEFI specific task 
SBI would be a better fit.

Best regards

Heinrich

> 
> Note that you don't need any spec changes for this on the ACPI or UEFI side.
> 
>>     Do you have any suggestions what can be done in ACPI case? Can we use
>>     a UEFI variable with RVI specific GUID to pass this information? This
>>     will have the advantage that it can work with either DT or ACPI.
>>     Also, we may not need any UEFI spec update. Do you see any issue with
>>     this approach? Your inputs will be very helpful.
>>
>> Thanks!
>> Sunil


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
