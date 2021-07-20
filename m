Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8359CC07E9B
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 13:43:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3642D6113C
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 13:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3642D6113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jwPMW0E3cALQgWSgVrrCxE8BSB5WRDtO7tJJ5XbdfsE=; b=nvx14osKEgITzTQ5DyKPCNCHeH
	gpnALgfIuuTemXJBgUmQgY1N43e+AtqbOuFKDVFT4+aq+SMp5CKvS8kEA2mEynkLBtUlIqBOEdndg
	cyUqwHx17Se9jnTDHd8tv8NvO/CwTGWm4X1p9zYLVlWxK1r/B04znqkJFQtAZrUK/eGT3+hG+yakI
	H94ftWqYmK1wZFsmrqSbhegzOuGvuR2i8tkQNdsHMmG911MfP0kMoYVBD0SDr+7DNv2jD4gHArQ9L
	dCA9ZkueP5EDxSjKI0xsK2zCC0iOMW/qKQ1pR2v/b1PGhK6y081wOXKNSmWYQSKXFYoX/oJk6Qq39
	QcS7p+sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5q1b-00CyVj-TB; Tue, 20 Jul 2021 13:43:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5q1N-00CyRu-Dx
 for linux-riscv@lists.infradead.org; Tue, 20 Jul 2021 13:42:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626788570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wm1/1+rm0pNTec68SF0ULMEoMpPgTZgtvpTbWM+bk38=;
 b=fG+LIy8oP1CN1RjxGLffxzgglVKC1l4Zx7+1f/r/Aik039kNwmQn5rtXoGGSFVyKQEMoyx
 2oCLF742VwGBFDuwj22DjX7z9YGxPIMUq9eXbVd1MRhzg+y8AbAI8AEgeU8lPWmcQZ83UF
 3wQ/vDC2VBpH7Qvx0td5OghcJDsHLQI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-TVJhIRdjPLuhHuNOLnHohw-1; Tue, 20 Jul 2021 09:42:49 -0400
X-MC-Unique: TVJhIRdjPLuhHuNOLnHohw-1
Received: by mail-wm1-f70.google.com with SMTP id
 b26-20020a7bc25a0000b0290218757e2783so1262258wmj.7
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 06:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wm1/1+rm0pNTec68SF0ULMEoMpPgTZgtvpTbWM+bk38=;
 b=sH3B05SfDJMK1owHmAzlf2qrkVLrN3o671/VkQo8c3xDeTJmBtdzBCNqqhy9uuPBgn
 CIQmpXHSh2gXm8JwkABF1XY43Ml8h9Wco+SKeDqT/ncT0e1x7B+OSbXk6YbWDwMyW/Hg
 lztroK9G42asK/8TYJCGlBt+2FE1471RDHvzSKcymSoHt8jQbKILuyqEbdqeryx1uYpY
 8zg2XrRLVHdzExDySnoEtf1qFwZUYbx42j6stvbjaodx1+VKziGBFCYES6wUr5kGGqvT
 NmZp4x28vyh4tFF25JTikvvAnfXG0+Zshq9E2q7xaW5RH3scAHDyKNDHMSl+iEHg397i
 LBBw==
X-Gm-Message-State: AOAM530ZJFIRnGS20PiETWr73B7O1G5Op22/3NogzdqJVExT17EkEhXe
 V04vq4MZ7ATPk4E0EnIc1WGiXgZQQ0Hh1oINTh8DWWJi+wq6jUBB3nFcSxa8rp8fW8zotsOyCCV
 Puld8FwR0wkQdKu50kpyzmRH9CsqG
X-Received: by 2002:a7b:c844:: with SMTP id c4mr37859302wml.107.1626788567977; 
 Tue, 20 Jul 2021 06:42:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPDFoW1ztyceGEmsvaxxt+vRNnwbErZ3TkLOyCXvoT5YQ2hwIH+j61ex10oljV9GpyUb7Cpw==
X-Received: by 2002:a7b:c844:: with SMTP id c4mr37859268wml.107.1626788567798; 
 Tue, 20 Jul 2021 06:42:47 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id g15sm19533112wmh.44.2021.07.20.06.42.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 06:42:47 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] allow simple{fb, drm} drivers to be used on
 non-x86 EFI platforms
To: Ard Biesheuvel <ardb@kernel.org>, Dave Airlie <airlied@gmail.com>,
 linux-efi <linux-efi@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon
 <will@kernel.org>, the arch/x86 maintainers <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Peter Robinson <pbrobinson@gmail.com>,
 Borislav Petkov <bp@suse.de>, Albert Ou <aou@eecs.berkeley.edu>,
 Hans de Goede <hdegoede@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20210625130947.1803678-1-javierm@redhat.com>
 <e61cf77c-6bff-dfcc-d3df-2fb6b48e5897@redhat.com>
 <8dd26141-a09c-39e2-5174-4cad8d21c49c@suse.de>
 <CAPM=9tyfNPa2f5PDBLm4w_H_riEQ5P3rEhX73YGE1y_ygRox+w@mail.gmail.com>
 <CAMj1kXErHteZ+MKYvp=yYmwVxV3A=vjtnG351hZHV+3BPwDQvw@mail.gmail.com>
 <YPbJJ/0tSO/fuW7a@phenom.ffwll.local>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <03f0edef-e54e-8a2a-4b50-683d3d42e249@redhat.com>
Date: Tue, 20 Jul 2021 15:42:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPbJJ/0tSO/fuW7a@phenom.ffwll.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_064253_582928_4B863FCD 
X-CRM114-Status: GOOD (  17.69  )
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

On 7/20/21 3:01 PM, Daniel Vetter wrote:
> On Mon, Jul 19, 2021 at 09:10:52AM +0200, Ard Biesheuvel wrote:
>> On Mon, 19 Jul 2021 at 04:59, Dave Airlie <airlied@gmail.com> wrote:

[snip]

>>>
>>> Can we just merge via drm-misc and make sure the acks are present and
>>> I'll deal with the fallout if any.
>>>
>>
>> Fine with me. Could you stick it on a separate branch so I can double
>> check whether there are any issues wrt the EFI tree?
> 
> It'll pop up in linux-next for integration testing or you can pick up the
> patch here for test-merge if you want.
>

Thanks a lot Dave and Daniel!
 
> And since Dave has given a blanket cheque for handling fallout he'll deal
> with the need for fixups too if there's any.

I also plan to look at any regression that might had been introduced by these.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
