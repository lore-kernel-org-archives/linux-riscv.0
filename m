Return-Path: <SRS0=kiTD=LR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE39EC4743C
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 11:14:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7F476108E
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 11:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7F476108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=d+XZUTibO4RxbIir5sQcha6EuiR3hd7XubeXCXYmxO4=; b=TXCdA7CZnRtQlVFUGLeEEUYtSV
	ZTbO+sUCzqjcDiIvEma6KTwFFq7rNlChnqF69f3Md7GErkZnfVQARUtk0jiCnYC4JMuNF2gzkoYJo
	9nlkpqF0091f+PyKUkgUQPzV/+PNBilaI+dFofeuEC8ERtoVtOBMfZzKC9i/dxbCDzMaCQOsawSzr
	SnwXbYgGLHtbzZDSyAwoKDS1rdBV3wnb5gl8mA1mQY9T26hf273jO0XPlyfx80yFNkAbFvV8O90ub
	PiLkaT9Wl6DgjYG4GeTIceyoDf2E6/RH/5D0lYGDFqZUay+iW5Y/TiQDXXHF5McTaGx5eDeT51m6b
	L4HBflVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw0pF-00APkk-5w; Wed, 23 Jun 2021 11:13:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw0pC-00APjc-EH
 for linux-riscv@lists.infradead.org; Wed, 23 Jun 2021 11:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624446820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jnl2/rIg/QPDzGy+KJkBUGcAxtR6X5tNt16GwqYV2Ik=;
 b=IKzGp+PW+29AoQ7FUcLGm6Jak7VGE8NY790c9GbmQJ69Uz9OWuMkTVLFVEiL0PiuWs4/Vl
 ZAzul1Za4VaPlzoCraoeFYQyOT7pk3LVoSdx5c4OujSHNF7drUiVWTTeu++G9NggFW04AM
 qPQY/2/6PgPOXh+9oaCbPj0eBpF+sJU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-4vrziaTEPkW_dp2_UBR1aw-1; Wed, 23 Jun 2021 07:13:38 -0400
X-MC-Unique: 4vrziaTEPkW_dp2_UBR1aw-1
Received: by mail-wm1-f69.google.com with SMTP id
 b11-20020a1ce40b0000b02901e5309e25ebso154403wmh.9
 for <linux-riscv@lists.infradead.org>; Wed, 23 Jun 2021 04:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jnl2/rIg/QPDzGy+KJkBUGcAxtR6X5tNt16GwqYV2Ik=;
 b=W2k1u89Cr6GvwFf+xvNcCu8VbAwTzjiccoWOMReXlDvUJiQCI3qMOslrGZm+1v0uAT
 UpLH5fseyXiI2tKOb6a5EDoj2HlTuaL8cqnVdPWdY6yzdddtz5i8Htavw3LrALLSy0lI
 nmCqysn+lm/bUzt0qMxVt123ux6dm37RMedfcQvMEKHXXUe+hIVCoJR8OX3CT289IMDE
 x6GacY1lRvLT2pLaHd79AVhJcSAdCIF4S7jAlP4uHikouZpppmQVp1S+2aTrXbre+qJm
 7lPzASj3cE0PWr97NF8osjoPwOnRlmHFdP6KJivqedPPByO2sxdGO0zNOfdVu7nY6JNh
 YdCw==
X-Gm-Message-State: AOAM533Alaeu7TQHRreiAAfGH+Cg8yj6AdPZIKF73dC+ccGPG8Oa+pNP
 3Oc1LUSp4HxeZ8FRTOjTUeSW79ywc/UvtFNwSh5Csit5bUFp9ZQL2Wx90Dtev2OBDypOy1ZUsIS
 Tx8pdkr08rfl0jkdigoD701w4TCMq
X-Received: by 2002:a1c:7510:: with SMTP id o16mr10132939wmc.137.1624446817644; 
 Wed, 23 Jun 2021 04:13:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJwLzoKoz8r+R/xKXeF7Lx7jZ0y9cE2C6Y8Oc0j2T+kzzTfX0/iX0JS/L3nt4PZRaysvKkkQ==
X-Received: by 2002:a1c:7510:: with SMTP id o16mr10132910wmc.137.1624446817467; 
 Wed, 23 Jun 2021 04:13:37 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id i6sm2590861wro.12.2021.06.23.04.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 04:13:36 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] drivers/firmware: consolidate EFI framebuffer
 setup for all arches
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, linux-efi@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Robinson <pbrobinson@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20210601150017.774363-1-javierm@redhat.com>
 <9700697f-747c-fe36-d480-69762e845f30@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <07745425-8d1b-5c0a-1622-cb08828d396c@redhat.com>
Date: Wed, 23 Jun 2021 13:13:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9700697f-747c-fe36-d480-69762e845f30@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_041342_611445_3497FBBD 
X-CRM114-Status: GOOD (  22.14  )
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

Hello Thomas,

Thanks a lot for your feedback!

On 6/23/21 12:06 PM, Thomas Zimmermann wrote:

[snip]

>>   config SYSFB
>>   	bool
>>   	default y
>> -	depends on X86 || COMPILE_TEST
>> +	depends on X86 || ARM || ARM64 || RISCV || COMPILE_TEST
>>   
>> -config X86_SYSFB
>> +config SYSFB_SIMPLEFB
> 
> You should also update the help text for simpledrm to reflect this 
> change. See drivers/gpu/drm/tiny/Kconfig.
>

Indeed, I missed that. I'll update it in v3.

[snip]
 
>> +
>> +__init void sysfb_apply_efi_quirks(struct platform_device *pd)
>>   {
>>   	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI ||
>>   	    !(screen_info.capabilities & VIDEO_CAPABILITY_SKIP_QUIRKS))
>> @@ -281,4 +348,10 @@ __init void sysfb_apply_efi_quirks(void)
>>   		screen_info.lfb_height = temp;
>>   		screen_info.lfb_linelength = 4 * screen_info.lfb_width;
>>   	}
>> +
>> +	if (screen_info.orig_video_isVGA == VIDEO_TYPE_EFI &&
>> +	    IS_ENABLED(CONFIG_PCI)) {
> 
> We have a 100-character limit now. This should (?) fit onto a single line.
> 
> 

Oh, I didn't know the character limit was extended to 100 chars now.

[snip]

>>   
>>   	/* if the FB is incompatible, create a legacy framebuffer device */
>>   	if (si->orig_video_isVGA == VIDEO_TYPE_EFI)
>> -		name = "efi-framebuffer";
>> +		pd->name = "efi-framebuffer";
>>   	else if (si->orig_video_isVGA == VIDEO_TYPE_VLFB)
>> -		name = "vesa-framebuffer";
>> +		pd->name = "vesa-framebuffer";
>>   	else
>> -		name = "platform-framebuffer";
>> +		pd->name = "platform-framebuffer";
> 
> You're allocating the platform device with an empty name string. And 
> here you're overwriting the pointer. Can you rearrange the code to first 
> detect a proper name and then allocate the device with that name? It 
> takes a few bytes more memory, but seems in the spirit of the interface.
>

Right, I'll change that in v3 as well.
 
> Best regards
> Thomas
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
