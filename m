Return-Path: <SRS0=2wW0=KX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006EBC4708C
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 08:03:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBD39613B6
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 08:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBD39613B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RfVtPNFemAVb56EGQMgk6UNWLLKKcLiZTKJZmOxj7Xs=; b=btLalNkN8SebKXagBM86Qeu2lP
	yX6rM+i8KrSMzGJp1wkCENVFbWjUa0I1W9izFQuIqVobQhNR1BLiGzL0cjo4JvSmgNG/m/MYIl4T4
	j1o78fDO9Tri8FZW7tYdHoTDmVcqPCVjJp+5BjMxYQHlD89Oq6iVfMTQwY3BqDSayp+ge6uVCPsgD
	syR/bS2GA4x84r/fGh7p4pF12ZdJ74fYt1ZaKJg+n5gYSqyPK3Jw5bjqEqg4+PjrXAH9+iL4K1Ymb
	osUEbgoEHc7RpJI2G+AqY5MY2eCCiI3QgJ7sSRpetLynTMp+6Xgg8KGN+rRaO2a9hmOoljZelg2+s
	ixgL5p3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmXSi-00DExy-JE; Fri, 28 May 2021 08:03:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmXSa-00DEtY-VN
 for linux-riscv@lists.infradead.org; Fri, 28 May 2021 08:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622188989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0IXbcSm8mT+lhuVdC+CT+mjkkm7+PBeCbiBVe/0dKys=;
 b=Hmqw1AX7S4zXvvDEq7bHmAyX0gvtM9YfkZOYDL0Mv6CnmA16va4hEKEh4/DTTx8wjAQDSO
 68OR8uw+M607F+nmDTTjpn5VWgQiJtp4fbpsk/5q7YzHn7CuoCyYmZLil7Nm4B+DJR6cXq
 pQx6k9qng0oApZpQE8HhGd7OsLs2h6o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-9lQOe8EJPsS4khUpLLRd0A-1; Fri, 28 May 2021 04:03:07 -0400
X-MC-Unique: 9lQOe8EJPsS4khUpLLRd0A-1
Received: by mail-wm1-f69.google.com with SMTP id
 x16-20020a7bc7700000b0290192662a64c9so1078814wmk.1
 for <linux-riscv@lists.infradead.org>; Fri, 28 May 2021 01:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0IXbcSm8mT+lhuVdC+CT+mjkkm7+PBeCbiBVe/0dKys=;
 b=EyPs0ntjM/tPHEtZQzHLpKhd3hKmncDZDLmU4Wh0jOEyxKF446bBe842gAecSdcTZI
 DsbzFMCYlX1CG7Pn/JjcRnSCivFlV5HszgyGd/dP+6vExdtydGpVGfZmzUPQfIJTGEtg
 eBOxUgAain25gNC7qSYgKVkQ5YBFsZtvK2P5uYL8Rdm9XvIZeWnvSC6LqnZyaaV4SR4+
 X4my5hMJ2/NaGGVO6mCLDW1I3/anvXDhOl4Sya5AGtT01YpdAlMJ+0DGHKioeib7pcR/
 ZZE5CKKPeUbmqBv+TJDg4nizzdv/FN1Kfvi5IsEHbQm0H2aR23pp7O6Zef1ZonUl0vh5
 hP9Q==
X-Gm-Message-State: AOAM530uk6gMBDxCdLEVw65mSfEIgJYz2r8dIU7hrhFkNwgTz9Icfj8Y
 cw9VqtoylJ/URLkbsWg5wNfe05Jf3jhyawo8asCNxOGTE4DuitBlkfOKtUemEctvnzA9pQNhbTY
 dNhiUOzC5S91v3i7ilFoEHtKK08dW
X-Received: by 2002:adf:fdce:: with SMTP id i14mr7029838wrs.303.1622188986613; 
 Fri, 28 May 2021 01:03:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+e8iRBOPicMDS91UKoWmjw1Ow4Oln/9p2aaPMHWdMTZ3KKJsPjuaTgqaOu1DwibvjoXOU8Q==
X-Received: by 2002:adf:fdce:: with SMTP id i14mr7029814wrs.303.1622188986368; 
 Fri, 28 May 2021 01:03:06 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id q20sm2949464wrf.45.2021.05.28.01.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 01:03:05 -0700 (PDT)
Subject: Re: [PATCH 2/2] drivers/firmware: consolidate EFI framebuffer setup
 for all arches
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, linux-efi@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Robinson <pbrobinson@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20210521193704.3042024-1-javierm@redhat.com>
 <e23a44ba-5e9d-d27b-b5e8-0cce3b158ed7@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <c6c6b686-6e13-2f1a-0310-b558428304c1@redhat.com>
Date: Fri, 28 May 2021 10:03:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <e23a44ba-5e9d-d27b-b5e8-0cce3b158ed7@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_010313_141702_8D0B1FDB 
X-CRM114-Status: GOOD (  15.26  )
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

On 5/22/21 7:14 AM, Thomas Zimmermann wrote:

[snip]

>> --- a/arch/arm/Kconfig
>> +++ b/arch/arm/Kconfig
>> @@ -127,6 +127,7 @@ config ARM
>>   	select PERF_USE_VMALLOC
>>   	select RTC_LIB
>>   	select SET_FS
>> +	select SYSFB
> 
> Don't select this as part of the architecture. Rather make an option for 
> SYSFB that depends in the architectures that supports it.
>

Thanks a lot for the suggestion! I did this by making SYSFB's Kconfig option
to be default y and depends on the supported architectures as you mentioned.

This not only is a cleaner approach but also will allow to not touch all the
architectures platform code.

I'll wait for a few more days in case someone else has feedback and post a v2.
 
> Best regards
> Thomas
> 
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
