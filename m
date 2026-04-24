Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D939DFED3EA
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 16:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hZ8iDXmU7akCkROzgXzJBudFRtd1oX8QJkXQFb4Bvs=; b=31pV5Uqia6WmVL
	ET6ynC3WsGWs/Dl4WnKgRKj0Pp1Zu3/fQFpoVP725QPUvqTYeuzvOQSdHkk6R6yFe7bCNmvoHxKer
	4dekoAM8L+PIAUquPJkHpZZAXFY9GqxkyZ0rtuGhlSDicHC+SQzk3tXY1uhvyH/VH+VokbQLElUgd
	8Od8j2rCMflvflbtPHCJgqGRwA4TFC7z9qtRtpg1bcqu0RFZM7xZORdj81WZP/l1kNNoL5lrpVZhu
	hoMmdrwN+1cPydpaXpYPos+R0OPhpXXAuQEZquxITct+sUVKwgThjMPxpeBy6zMBHJRWW6Oz5NqVA
	QNLIoA/CzJVWK/5E9hdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJKK-0000000DRq5-0PZj;
	Fri, 24 Apr 2026 16:24:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJKG-0000000DRpK-48WT
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 16:24:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777047858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bkHBfOVa4bz/wCbZfmwZYYdZCO/tCYPxae+JQxak4Yg=;
	b=eZl25zDnldI79cy46T99uOTd673DqSE3j2FysmQbJamPpWT1+bYhnhXu0ciAPPgimA2OcG
	Lwjqbk1m/+Fj2iobSg00wB8ywT39ue32rH3MCPB5qWPhjYtAyDBWfS9dESKDAbPzROkNcc
	HyPxpHf9CxQ494ziriMuyR2fcay6u+w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-sdlfENKTPr6jKY5VUABVBA-1; Fri, 24 Apr 2026 12:24:16 -0400
X-MC-Unique: sdlfENKTPr6jKY5VUABVBA-1
X-Mimecast-MFC-AGG-ID: sdlfENKTPr6jKY5VUABVBA_1777047856
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48a5adc141cso21313275e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Apr 2026 09:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777047856; x=1777652656;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bkHBfOVa4bz/wCbZfmwZYYdZCO/tCYPxae+JQxak4Yg=;
        b=BrfpCkigiZPJskcYW7j8aMcRL5bWw2Yz5DYXsmjtifDF3y75Bc8kXsqNIZisimMMHW
         9akhXTcZlt5CRD7wdTINWwR3P+ytDcedEKSRAJlQ5snq+YKpM39/S/eI6ESME+QM8kGs
         mUu1oCExUS5UlRt3A4y1jUZPTIvlMo0fZnEL5AVOqXgWaqcv/Vewu7i8r6+XhJbpxNNQ
         2kKLOkFWwiqiTCKK8BNOdzk7LmYq2uvwkKtgIUnm9R4e8CiYwaNzq2G6BNdYCheYbTIe
         WsQUYalqR0eI7z1IKS3W6fSQtI0hIorgEk9jOvrrGQN6kOmKvoyIl4ldihcMw5XnPNNl
         jD8g==
X-Forwarded-Encrypted: i=1; AFNElJ8SkzJTVwfq9yAnCgBg7u2FvQNBOy6PvNFD2MJGujpU2wNnqHTvMxz5n5mS0zpG1PKhqqx4qCEnmJ3KWA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPc+nNT4PDSw7ur5F7mv6kV/d1e93Q0xjrXX+i5FTSqpePykXm
	9312seCpNBQ+sLriA5h+rl+3AqYjmoaHtC23rMwi8tyBq/cKnr4CPWL3WXtAIC8CaPkEI0FZBT9
	HcxWot6WAYWcvM/sjN99JB67Sl26zQ2edLebEmYS1TOHF84FgHp0pRw+m3gsm49cBdyh+Mw==
X-Gm-Gg: AeBDiet+F7RFIe/EVf1y8lZaFbqZ2HotAB2r6/0ZV44Sc5OG3HNj8oI+lD/nYjGjlIL
	W8mYYH6nuG2trrhow+sJrYtrRrrDNDGdo/MmNlp310p1LejPdxFbW8JY5pVz9+1cwKc8oxG1xtq
	rPtZMTG5D9BF5tbZrg2uiGiZ8MFZ2e323DQxx0dq8Z6cW4x3dZVN25lwMlpm5PljhRS3y2jVNpI
	vgItWHhdgb3+yf80VuOwIr0sv3MmmbIux+TPgENiksRDOnVuHrxuw3DSCiJs4/Noel5FKDlNOM6
	PRnqwrvC1IvsNB6wIhZ1ja+LA5gf6zX1pvJ6ZXqtpZlxtK/a2D+47zhZlMo2ObIXxJRMME9l+Ue
	zpS+iQRy2pIRhmIOJ7N3jaeC1KlZaQJkDuDVoICsvkCzT+Aj6FpHa7jzjGbZuB+QlhWpdtdw1UP
	gZNR6knuo9nEjXRO8=
X-Received: by 2002:a05:600c:8b6b:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-488fb8859ddmr427762045e9.2.1777047855228;
        Fri, 24 Apr 2026 09:24:15 -0700 (PDT)
X-Received: by 2002:a05:600c:8b6b:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-488fb8859ddmr427761525e9.2.1777047854742;
        Fri, 24 Apr 2026 09:24:14 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a682588f8sm6272915e9.10.2026.04.24.09.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 09:24:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Ard Biesheuvel <ardb@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 longli@microsoft.com, Helge Deller <deller@gmx.de>
Cc: linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 3/8] firmware: sysfb: Make CONFIG_SYSFB a
 user-selectable option
In-Reply-To: <0156562f-5fcf-47ce-8fea-03345f2c3fe6@suse.de>
References: <20260402092305.208728-1-tzimmermann@suse.de>
 <20260402092305.208728-4-tzimmermann@suse.de>
 <78f76717-8f1e-41d6-92f7-261df96b84b6@app.fastmail.com>
 <3e466158-c2e5-4e23-934f-dcdbb71ad41f@suse.de>
 <d3d7c545-3b07-4881-a16d-45b6f039de19@app.fastmail.com>
 <001efe27-9cbb-4a89-8d2d-a1f3ae15e505@suse.de>
 <295a43ce-92fb-435d-a82f-d1cfa8f4f28d@app.fastmail.com>
 <0156562f-5fcf-47ce-8fea-03345f2c3fe6@suse.de>
Date: Fri, 24 Apr 2026 18:24:07 +0200
Message-ID: <87se8kjpi0.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U0COLrkKeJDvLFvU8D_JJFPIkDFfXs9CagVFI8R5vIo_1777047856
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_092421_099693_EF56D1C8 
X-CRM114-Status: GOOD (  15.86  )
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello,

[...]

>>>>>> On Thu, Apr 2, 2026, at 11:09, Thomas Zimmermann wrote:
>>>>>> I don't really like this part of the series and would prefer
>>>>>> to keep CONFIG_SYSFB hidden as much as possible as an x86

I tend to agree with Arnd here, I'm also not seeing that much value on
making this symbol user selectable. For now I would just keep it hidden.

[...]

>> Yes, I saw that as well and don't have an immediate idea for how
>> to best do it. I saw that you already abstracted the access to
>> the screen_info members in drm_sysfb_screen_info.c, which I think
>> is a step in that direction.
>>
>> I also noticed that efidrm is mostly a subset of vesadrm, so
>> in theory they could be merged back into an x86 drm driver
>> along with the drm_sysfb_screen_info helpers, and have a non-x86
>> driver that constructs a drm_sysfb_device directly from the
>> EFI structures.
>
> I would not want to have a unifed driver for all-things-screen_info. The 
> code that can easily be shared is already in the sysfb helpers. But I 
> don't mind adding a separate driver for EFI's Graphics Output Protocol.

I agree. It is much more maintainable if we have dedicated DRM drivers that
use shared helpers, than attempting to have a driver for different platforms.

As Thomas explained, the maintance effort is small on the DRM side and he has
done a lot of work to split simpledrm in efidrm, vesadrm and ofdrm.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
