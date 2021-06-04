Return-Path: <SRS0=5Qc/=K6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3840FC47083
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 09:43:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB6DE613FF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 09:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB6DE613FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LHLhcboEKIIo2qQXRHFfkWikBBJ9M6/S77mS6Em3994=; b=o30reiG0ejVRGkQyfVVLrvsGFX
	v4H9rzlawQ2Wede4I0zou5qbxQVPvDKuaGBvWZhRfhatrSlM/eLn8gHc1kT98HQWg0emUZ+O+324s
	OSlGcyqxy8UebVd6TUc+adUuAasULfBA9CLtCGKATf8bM/nngsvpTLyJ0ngTCfq5PNs/+Wq7wGJvi
	Bjyf8qcBTmiRR6qfdhQ+qtr4+SwgmUsRdJXrdyom/9+IHlaFTJ36PSUKiWZDWjltAkdur4oLgxztO
	IwLp++z7brLPCwConXNj9DJyjZmldR67iP0Gok8lFXjjyfO4eluOFpU7lwOXLl7S8Mcp+W7J3BQnS
	loYs/PcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp6MP-00ChUr-MT; Fri, 04 Jun 2021 09:43:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp6Ki-00Cgwh-LC
 for linux-riscv@lists.infradead.org; Fri, 04 Jun 2021 09:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622799697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vInzNIEC7qJ5S09yd5rz53tVm0jzaytwZERB+pVm5Bo=;
 b=htpY4lpQguWBi3+PVNP6ZC6SycmRan5tqAwMpG7howyo7zqonwu8w7+zELF4U59lYYcK5/
 A927JroqudO7quVMDwkaVJuU/kmYpsYZaBXjBsUHta6pv8mZw4XC9swQkXMMdLS/dKyA+0
 K9p4hBtXYJKF1fMz/8cuxQjIAVG7stI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-OIabFf9lO66U9RnBGosx7w-1; Fri, 04 Jun 2021 05:41:33 -0400
X-MC-Unique: OIabFf9lO66U9RnBGosx7w-1
Received: by mail-wm1-f70.google.com with SMTP id
 128-20020a1c04860000b0290196f3c0a927so4357602wme.3
 for <linux-riscv@lists.infradead.org>; Fri, 04 Jun 2021 02:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vInzNIEC7qJ5S09yd5rz53tVm0jzaytwZERB+pVm5Bo=;
 b=bbguQx1nzndyJZm0l4IXG6l2PnASQ/u9hQatoMmj9WR2HrPp472n9HF/lFBKwUBTqd
 Pbtud3GBCLFpz61dtEmKCWneVrY4LHKoFDlIBV2Kd5BsJJtSZiX8OeZa9goVL17aPws+
 0k7yYpPDK3jeiwo1QcJYyY3ZzgvdibXjSD+I5F72W2jx2jzoxfVm10866gbHQkfx1hFu
 Yt6z7sFtxTKXRuwBFJT4REl0sH6O6zVIEWQaH8rua+Yq2PaT2EM0TkochRsKw0l9/J97
 1jZeARcdUnCkYtPVyjPMvr0JBQL2zNlAOuj8JaGoBl2h1wxCXAf3OHTzTnvV+MOhBoKR
 lw7Q==
X-Gm-Message-State: AOAM532rhT/vEO3+30bP/gOkNGuzyGUooHlMGaxorTIbKzhwtR+lNIGh
 bDJArEnH9WBRljDw+6Aop3Rk+0EP0vg1hIt7ZkDeajqBFLvtYVvOOwgLpWYD15/MfrvQrE2XlI/
 hVfT5rYuc00c4fG3Lo95lHBIFBU3/
X-Received: by 2002:a5d:4b05:: with SMTP id v5mr2924879wrq.330.1622799692506; 
 Fri, 04 Jun 2021 02:41:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhdTfU1nuBk4nI718hAXg7aCCY0AbwUXs0SHoQeG2N7oNmbQ2psiZjVGvncyM/3mEKj6kYbw==
X-Received: by 2002:a5d:4b05:: with SMTP id v5mr2924840wrq.330.1622799692240; 
 Fri, 04 Jun 2021 02:41:32 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id u16sm6643628wru.56.2021.06.04.02.41.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 02:41:31 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] allow simple{fb, drm} drivers to be used on non-x86
 EFI platforms
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Albert Ou <aou@eecs.berkeley.edu>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ard Biesheuvel <ardb@kernel.org>, Arvind Sankar <nivedita@alum.mit.edu>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Brijesh Singh <brijesh.singh@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Chester Lin <clin@suse.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Joerg Roedel <jroedel@suse.de>, John Stultz <john.stultz@linaro.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Juergen Gross <jgross@suse.com>,
 Kalle Valo <kvalo@codeaurora.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Russell King <linux@armlinux.org.uk>, Sudeep Holla <sudeep.holla@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 linux-riscv@lists.infradead.org, x86@kernel.org
References: <20210601145912.774054-1-javierm@redhat.com>
 <YLk7HjX2OnLhMt4V@zn.tnic>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <c48c6261-c9e5-29cd-8d43-6dbbcb2034ff@redhat.com>
Date: Fri, 4 Jun 2021 11:41:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YLk7HjX2OnLhMt4V@zn.tnic>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_024140_801234_CA233B66 
X-CRM114-Status: GOOD (  19.57  )
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

Hello Borislav,

On 6/3/21 10:27 PM, Borislav Petkov wrote:
> On Tue, Jun 01, 2021 at 04:59:10PM +0200, Javier Martinez Canillas wrote:
>> The series touches different subystems and will need coordination between
>> maintainers. Ard Biesheuvel said that can be merged through the EFI tree.
> 
> I'm always happy when code from arch/x86/ moves away so
> 
> Acked-by: Borislav Petkov <bp@suse.de>
> 

Thanks for the ack.

> Btw, for the future, please CC everyone on the whole patchset - I had to
> go look at your 2/2 on lore to see what it does because I had only 1/2
> in my mbox.
> 

Yes, sorry about that. I just used what get_maintainer.pl --git-fallback
suggested me, I'll make sure to include all people in Cc the next time.

> Thx.
> 

Best regards,
-- 
Javier Martinez Canillas
Software Engineer
New Platform Technologies Enablement team
RHEL Engineering


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
