Return-Path: <SRS0=vm5i=MN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDEBAC07E9B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 10:15:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFB0360C40
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 10:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFB0360C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JYHeP0UgthBV9y8mvkbImmAovb5CwF5SOkFToBzjdUQ=; b=cu7pWWBcZ4TqndvCeBvkbi/GTD
	fzbFso+o0ytRxJcr+rBpMOwSh21uurTVEmOcRX5iSiiUTl/aosIq133K/IZWn6lTkTeH0YsntnTG1
	B5BhnGZMLSJMRJ3muJwkaplKIPGn8qIx1mBsW1feFpt9SC2sNo2fYNKmtXUiL1ujljMBMQPJWf+I6
	PPIclyL6TMnS0gEFhTmu6Ka2QmOEUtfODN1ZNBvxWePOqPggVY7W7vrkPS62A+IqM8byzauJrR4BK
	ajvxxYMSERS/ROFD9iaFlnC4dwknvhrACogrsqXnIB7mpgpVFMC9vdxuWm6P53MxFXtSMcDRTSMKc
	7LOKTNMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m69GP-00FD5p-Bd; Wed, 21 Jul 2021 10:15:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m69G4-00FCyc-UZ
 for linux-riscv@lists.infradead.org; Wed, 21 Jul 2021 10:15:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626862519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RyyvPAEl0RGdNpzC1zqJ6kwCJCutA9fkHO+0d42bF1M=;
 b=SGf0ipT4nKSwczZoQlUO3B/qQyGJY1T6xOFdh0/LSTswMyjA+US9lKWHpBI48yJtylSHVG
 6hJ+H2rzZ61tWMFnSOs+hBdsAyROPF396Rje9VUrLJhe5Pkp7lLZ1qEZs205ncKEBUDqf7
 nV+EokoEc6khTIZHMYB4mOfWibRXsmk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-ASEqaLSHMzSqxRlt71WIwg-1; Wed, 21 Jul 2021 06:15:15 -0400
X-MC-Unique: ASEqaLSHMzSqxRlt71WIwg-1
Received: by mail-wm1-f70.google.com with SMTP id
 o21-20020a05600c4fd5b029023448cbd285so404472wmq.2
 for <linux-riscv@lists.infradead.org>; Wed, 21 Jul 2021 03:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RyyvPAEl0RGdNpzC1zqJ6kwCJCutA9fkHO+0d42bF1M=;
 b=Wy9E8ys4BDG7hF5o765SaryvoU/244ewL8jY28dpgh/Trj0Olbe+q0IZesZyQu5P26
 5l6aQHTDJFHp9c6/uTXy6Tjf2FuT78LBCptEZcX6N74EkGoMj5+sbHVrrA944pSrFMWB
 /GAUnlwzkB7JqKC2HGQLVP0UkipUYa2gYOR/fGjgTE4EW5u1SY18UrFJJQjvyKta1gFb
 3Yh8n50do7dWX9Rx2C2lMP3jmrAN0kv8zYZ4vRa5391zr/b1LYTobTzYBbQQIfTr8uoC
 Kthscds+tvJVwOQASuy4ytabSz9SQrpKnKwlwjMYXFr+lIA5N1RIAVB2BSj0nHbOk6TF
 Pc3Q==
X-Gm-Message-State: AOAM533ycNYxgbTEnrdQnSWG+ZF4+aDcbBzJJqDDDNyas77WwLIdMWwz
 cdxNDLptjQUFABRaFQn+9rr7BCck7SdzwAZEj0K9VfRhwKQeYnhdpbWBFbmmOZ8+JgXEF5fH+eD
 oiJWo8K2YPMQ3LwffcSyEIO63CiIK
X-Received: by 2002:adf:e40d:: with SMTP id g13mr41478955wrm.12.1626862514805; 
 Wed, 21 Jul 2021 03:15:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIFThd2tj7VfPp04ezzlehuYz0UUfR8kKnkyo/eLPDFM6dUDBcvPZYMmqeK3YnHEpOoz/6Nw==
X-Received: by 2002:adf:e40d:: with SMTP id g13mr41478916wrm.12.1626862514626; 
 Wed, 21 Jul 2021 03:15:14 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id a8sm26534248wrt.61.2021.07.21.03.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 03:15:13 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] allow simple{fb, drm} drivers to be used on
 non-x86 EFI platforms
To: Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel
 <ardb@kernel.org>, Dave Airlie <airlied@gmail.com>,
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
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20210625130947.1803678-1-javierm@redhat.com>
 <e61cf77c-6bff-dfcc-d3df-2fb6b48e5897@redhat.com>
 <8dd26141-a09c-39e2-5174-4cad8d21c49c@suse.de>
 <CAPM=9tyfNPa2f5PDBLm4w_H_riEQ5P3rEhX73YGE1y_ygRox+w@mail.gmail.com>
 <CAMj1kXErHteZ+MKYvp=yYmwVxV3A=vjtnG351hZHV+3BPwDQvw@mail.gmail.com>
 <YPbJJ/0tSO/fuW7a@phenom.ffwll.local>
 <03f0edef-e54e-8a2a-4b50-683d3d42e249@redhat.com>
 <YPbWrV/cIODdgu6A@phenom.ffwll.local>
 <37e05f02-b810-0cb1-cc4f-95711cd148d9@suse.de>
 <44a75f18-e3a6-f764-b0ec-ce3ac05805a9@redhat.com>
 <1e85fae7-ef95-b2f7-3463-e90958e54684@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <0ad257ce-44d9-beea-8afb-c879146c523b@redhat.com>
Date: Wed, 21 Jul 2021 12:15:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1e85fae7-ef95-b2f7-3463-e90958e54684@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_031521_138934_8B53E1D4 
X-CRM114-Status: GOOD (  15.29  )
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

On 7/21/21 12:07 PM, Thomas Zimmermann wrote:
> Hi
> 
> Am 21.07.21 um 07:09 schrieb Javier Martinez Canillas:
> ...
>>>
>>> Can I simply put the patches in to drm-misc-next? There was some talk
>>> about a topic branch?
>>>
>>
>> ... which AFAIU means that there's no need for a topic branch, since the
>> patches will be present in linux-next. And the EFI folks can use that to
>> check if there are any integration issues or regressions caused by these.
> 
> Merged into drm-misc-next.
> 

Thanks a lot Thomas for all your help!

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
