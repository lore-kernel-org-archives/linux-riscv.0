Return-Path: <SRS0=jEvo=KT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E32C2B9F7
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 23:23:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A52D6140B
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 23:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A52D6140B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+FGrUP7w8DnliLox7K4bM45KYIYXyAbQemZs9w/ODo0=; b=2H+arnqUPaH8AI6OibNKSslfiQ
	FAma28bZFPtJhnjp9Kz4UbAZq9lUDp2WldJeDq1XXgyLjUgDYcj+wHuvDSNKm91OSOUawRhCqT3fk
	A0LArzbIR5sBidhU6MZrPJNVmW9ZwfP1QOmAc2iz8At0VWiXEbbMYXLZ8WAP1GkozwHxF9EpogTsG
	A935s/XRxgNZlOHZGrk/QD3BWcdoNQey3Ti7079Z7BU57L/7SlcCbmqx3rNOY8YiUzWR8ZJfh6wo5
	nZHQcjj8rQ//xz9uJhJC8Uyst3nkSre3Y7BI6ChNRNh2xaDHc1fpAw5rpNxwocLlu6kDfH5un15zn
	ZJ8WMSdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llJus-002KJW-Dk; Mon, 24 May 2021 23:23:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll8Cn-000qVE-Nf
 for linux-riscv@lists.infradead.org; Mon, 24 May 2021 10:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621853576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HFtn2RHOEYss0CsLYkuce8tbA8oq7IWTJChBbEjpcfU=;
 b=Yh/fv3i3Gw4GXtx8KiC4TbYJQcg+oYWqOFneqqsRY4JQdrG42I4nXTmDdIIvWUrHGFjvhI
 trKjDw3WokDVe04cjNSaDrkJxhvQUE/AntMt+jeGgEezE0JS192f5gt5dAAVG1K4jJkV5e
 jDk/Lzn19+ZBHN/iwG3QFHEZeutF8UQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-cNIuMZaiNSqhuqm1ZcnYaQ-1; Mon, 24 May 2021 06:52:53 -0400
X-MC-Unique: cNIuMZaiNSqhuqm1ZcnYaQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 g3-20020adfd1e30000b02901122a4b850aso4917685wrd.20
 for <linux-riscv@lists.infradead.org>; Mon, 24 May 2021 03:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HFtn2RHOEYss0CsLYkuce8tbA8oq7IWTJChBbEjpcfU=;
 b=H+LgU52xxIPzHGWLDNNJPiYx/xcn3v21mUlN1u9GRbSh5ZwkINfQauTpgSJ41kurX8
 7w181cZlxb9aRXMdM55QIF2KcbKUczvbIF/mF3zCNfe0wnwidzo8zlcnBaBO1N8aWmnM
 pi+QECtUWB2rOTC6qwDb3DMJt8faMVg5LdpAaouDuuizTol8FXEg7aCRJGJ2MuRNp2Xm
 dJbVN2og+xC2FwloKNlS6FAWYwFi38pckysXhShnc5g/PMayWTLNWE2rX+BrdnIDlLMf
 OHG82gvMj0slPZr5iSUrCnYW0e5slNy7MIhylfRmoKihzgH1XydIP4FEzQA+EaBvP5M+
 lkiA==
X-Gm-Message-State: AOAM530L1Of1hi9J14/PEW3laRvG4oAB4BWHHxCf/oH5lIjIjg3tVfER
 Ca8nopt0TKkdXJpm0FYtm4ciuQ1zymtHzTJZO/nQOt+ApR4YilJj0on2XSpg5eLRHPbvSaA71eO
 +vvVfjdnSl+Nx5pahbVdtwsxlEg87
X-Received: by 2002:adf:cd0b:: with SMTP id w11mr20622271wrm.178.1621853572523; 
 Mon, 24 May 2021 03:52:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBBAfkXTMs2YQFUS4bUXgvPMEgtCieGtjpbUoBA1QSYRX/jn26s0lewHHOil8Ex/lxYcBBJg==
X-Received: by 2002:adf:cd0b:: with SMTP id w11mr20622252wrm.178.1621853572312; 
 Mon, 24 May 2021 03:52:52 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id r11sm11966441wrp.46.2021.05.24.03.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 03:52:51 -0700 (PDT)
Subject: Re: [PATCH 0/2] allow the sysfb support to be used in non-x86 arches
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Peter Robinson <pbrobinson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Hans de Goede <hdegoede@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Russell King <linux@armlinux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 linux-riscv@lists.infradead.org, x86@kernel.org
References: <20210521192907.3040644-1-javierm@redhat.com>
 <CAMj1kXGrDm5yN5eRZJ0YAjCde=0Xw7hobC9Oz5CNovo0sWuM+g@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <0613bc6b-31b4-93f6-b111-4692778f76c0@redhat.com>
Date: Mon, 24 May 2021 12:52:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAMj1kXGrDm5yN5eRZJ0YAjCde=0Xw7hobC9Oz5CNovo0sWuM+g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_035305_861686_35BECD77 
X-CRM114-Status: GOOD (  24.08  )
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

Hello Ard,

On 5/24/21 12:24 PM, Ard Biesheuvel wrote:

[snip]

>> Since this touches both arch/{x86,arm,arm64,riscv} and drivers/firmware, I
>> don't know how it should be merged. But I didn't find a way to split these.
>>
> 
> We could merge this via the EFI tree without too much risk of
> conflicts, I think.
>

Great, thanks.
 
> However, I'd like to see a better explanation of why this is an improvement.
> The diffstat does not show a huge net win, and it does not enable
> anything we didn't already have before, right?
> 
> 

I mentioned a little in the cover letter but you are correct that wasn't that
clear. My motivation was to use the simpledrm driver instead of efifb for the
early console, so I could boot without using fbdev at all.

The register_gop_device() in drivers/firmware/efi/efi-init.c only register an
"efi-frambuffer" platform device, which means that it will only allow to use
the efifb driver for the early framebuffer on EFI systems.
 
The "simple-framebuffer" platform device is only registered by OF if there's
a DT node with this compatible string, but it won't be registered for EFI.
 
So the simplefb or newly added simpledrm driver won't be matched and probed
with the current EFI support in aarch64 or riscv. In contrast, the x86 code
does register a "simple-framebuffer" device that uses the GOP framebuffer.
 
One option is to add the same logic in register_gop_device(), but that would
require even more code duplication. Another option would be to make the simple
drivers to match against "efi-framebuffer", but that would be an ugly solution.
 
But even without taking the lack of "simple-framebuffer" into account, I wonder
what would be the benefit of keeping two code paths that do basically the same.

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
