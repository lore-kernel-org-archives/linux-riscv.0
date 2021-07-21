Return-Path: <SRS0=vm5i=MN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45286C07E9B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 05:10:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8BF160FED
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 05:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8BF160FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t1pcudgIm/8/Q+ZKGBTEMGk2NYbuHPVcLqkhNc41Nks=; b=Y28ZepXQC57Uhua8MwwDK1R9km
	9bpPA3gDbRc61dyxu1cxD82xQG4WdylNz1l03bgHcCchnVD8Jn2AGVoMVHAKHRgJm4URO63uLh1Ug
	nAhfLqfr6mtN1njqmyXTwOLjLZFyl+BmdGsXULZ5xu2aXXp4HjvxToGmnUeHFFA1lDLOlre19IJNu
	IMNhNekcjBoi16YzOj45HcYGc1dAvfD6F4zX3rlbBFpPOKETxw5Hc5ywMbNQHLA1dwJcVoFwGhe1V
	dmEy78Gcuf68nO1OmWIzIOql1q6IkbDLP5Uu67JJSvmvLxuGzJxOhN/X/DLJU3a4Ql84HjaQj9iow
	epupn5Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m64UL-00ESC4-7S; Wed, 21 Jul 2021 05:09:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m64U7-00ESAK-Fs
 for linux-riscv@lists.infradead.org; Wed, 21 Jul 2021 05:09:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626844169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+zWfy2tC40xUQfOhENAkA+DP5zrQupivowwlpIU07g=;
 b=OKvQMBfJdOMJzGla1xXeLHAtj4kHE/ygi2s72aJf/7lRxWF/gVycMHi7Wwj8MJKvAUnRBH
 47oeUp6V4Uheu25aj9ej3rvcFZMRke6yRQZm04PVlHVFORP7/TMlcvBJ5URYCWi1WSQjwb
 XdEA7jKEhWxophxmjn9EX0gKAE1LNk0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-X4H9SXHZPYmvohFOCAUDKQ-1; Wed, 21 Jul 2021 01:09:27 -0400
X-MC-Unique: X4H9SXHZPYmvohFOCAUDKQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 a4-20020adffb840000b02901304c660e75so409965wrr.19
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 22:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S+zWfy2tC40xUQfOhENAkA+DP5zrQupivowwlpIU07g=;
 b=IfjDoO5kT3mzrtahIAjS+PSBLTePUX3goLzyS7UuhpRWNDNkjYwn03HEJOYJ8CsS2t
 G24RrOnYfTSPRu/URiwMHUUf3WkGoWy79VzSfyJqspZC3TPBVxjzqs0ZYQS9hkYNIOsx
 bq8JfHUpVVoLcG7hi90JE3W1CmvKL5o3CGNB3s72E3HSclBZIYpTVbsg+TA+fobmZ1YD
 iYLWT7sCdCTei6ad5hIPcBrNcW5BcYE4l4rog5AUPeOjsb4COaeaVk33J8nNOEp1gFCs
 VYKXEKG55rF4dc3TWYmKR6TfQmVgEobhUadaXx34CMAyY+ESFS8Rn+AB+F2W7SImMQ1N
 YNpg==
X-Gm-Message-State: AOAM530xjfN6HdMBgdruyrYCLUbwfDkxlBO/3wi+P/ma4ZwQonlKoho4
 sjtxborFoMxlUDXPPZrhItr2gO+lO0dXbZvuADCTiXjXzH82KCeKC+7QM4X821rZjFKHY6tZ/a2
 XYzaKrxoL46+pgE1a5gdW9IFBhkht
X-Received: by 2002:a7b:c747:: with SMTP id w7mr2031970wmk.148.1626844166634; 
 Tue, 20 Jul 2021 22:09:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCxXonukubT9gJL2Rc7x0XVeUSko96/DCQuDEhTryxASNBDgCxR12O8zMwgWe3dBuGqn9kQg==
X-Received: by 2002:a7b:c747:: with SMTP id w7mr2031926wmk.148.1626844166269; 
 Tue, 20 Jul 2021 22:09:26 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id k24sm26722409wrh.30.2021.07.20.22.09.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 22:09:25 -0700 (PDT)
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
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <44a75f18-e3a6-f764-b0ec-ce3ac05805a9@redhat.com>
Date: Wed, 21 Jul 2021 07:09:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <37e05f02-b810-0cb1-cc4f-95711cd148d9@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_220932_196725_A5992566 
X-CRM114-Status: GOOD (  18.83  )
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

On 7/20/21 8:38 PM, Thomas Zimmermann wrote:
> Am 20.07.21 um 15:59 schrieb Daniel Vetter:
>> On Tue, Jul 20, 2021 at 03:42:45PM +0200, Javier Martinez Canillas wrote:
>>> On 7/20/21 3:01 PM, Daniel Vetter wrote:
>>>> On Mon, Jul 19, 2021 at 09:10:52AM +0200, Ard Biesheuvel wrote:
>>>>> On Mon, 19 Jul 2021 at 04:59, Dave Airlie <airlied@gmail.com> wrote:

[snip]

>>>>>> Can we just merge via drm-misc and make sure the acks are present and
>>>>>> I'll deal with the fallout if any.
>>>>>>
>>>>>
>>>>> Fine with me. Could you stick it on a separate branch so I can double
>>>>> check whether there are any issues wrt the EFI tree?
>>>>
>>>> It'll pop up in linux-next for integration testing or you can pick up the
>>>> patch here for test-merge if you want.
>>>>

This is what Daniel said...

>>>
>>> Thanks a lot Dave and Daniel!
>>
>> Oh I haven't merged them, I'm assuming Thomas will do that. Just figured
> 
> Can I simply put the patches in to drm-misc-next? There was some talk 
> about a topic branch?
>

... which AFAIU means that there's no need for a topic branch, since the
patches will be present in linux-next. And the EFI folks can use that to
check if there are any integration issues or regressions caused by these.
 
> Best regards
> Thomas
> 

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
