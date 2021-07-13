Return-Path: <SRS0=hRw5=MF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B323C11F67
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jul 2021 17:00:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A9ED61249
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jul 2021 17:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A9ED61249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=j3boL8nmfykQwpQ7lrF1LMK7ahej4BZc7IT0ZWnCqPw=; b=pcUu+h3zB+k3AF3kX9cemkxYBm
	2rx0bmcDXJ8k4FzLxGQ8UBP3OnXrl9U9FSHcG5+yNJX2Ow2ZATilEbFc9C60IttAeXSaOSfz40X/G
	hwfpjdZ0oQLb/YrCGp27S/FRErhEujPU5kPtCT/DFPCTldjV4P1qd1k+gQSjglUKgd3SWTzKEN0rb
	QKPO8pS61YWPaXQ0bP8xyikneDGH/atT6aMh35JqhO6ml26g/lYrxs23jRFPJ6WVpVcsxp7vVk5pq
	2Malmv3xdpJ1gkBW0NZFLximD+QuWNT1Jwo/MNkc5aaFvsQ/QhSis+FIPsRsnjQY9mfGlTqRZtbm8
	y1FOz4MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3LlV-00Azo7-R8; Tue, 13 Jul 2021 17:00:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3LlI-00AziV-2Z
 for linux-riscv@lists.infradead.org; Tue, 13 Jul 2021 17:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626195596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XTHdlYNv/a9BuVPGjnPy+dQ/mQjufPe+yKG6ndLoXU8=;
 b=eX0vNDQetw4M4XvuzdRcpzZcTe4FtS5+xgrR+G5VXPhCmc0t0q/NkkDd+By1EFfppUZwyA
 j+0h4jpvRagFIp8303DxtzUj1YkYvw13WZsOOQGn4Jl4jrLAfIy0ZKR3eZwWWbnZr4HAVg
 wN0h7kqIAlJJ8TlEVQGTw3NU2rn9dCk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-KttEkAE9NE2q-1ciCFYYYA-1; Tue, 13 Jul 2021 12:59:55 -0400
X-MC-Unique: KttEkAE9NE2q-1ciCFYYYA-1
Received: by mail-wm1-f71.google.com with SMTP id
 7-20020a05600c22c7b0290227b752f429so885960wmg.4
 for <linux-riscv@lists.infradead.org>; Tue, 13 Jul 2021 09:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XTHdlYNv/a9BuVPGjnPy+dQ/mQjufPe+yKG6ndLoXU8=;
 b=RXmydYOx6bPZr5ucER/fPTOMwvBfp4Jhvw50RKWywnBLHaruweoWZiZviU1yvdJqYj
 4MWW/bVmrBXqresC7cJRwgQMu6XCluz1xZZ5gbVsll7cj+fdk32/9WlBzGr9SH/RGwWK
 r2UbTuPXd+ACVZAAC3LrT4t73KEKAsu6joKwGkLW4EWfh+KOn3gr9kB8kg2xVLb18rQD
 iPaHmK3hlh4wJ8CQgwW+D+mnFcaibdF89WVHAX06jLY+N+7I/4Rs/Ar/hLECHlwOmY7W
 G9ZrwjrAi1hmv7RPRn78F0E3KkxvOz90tm9T1zQvyVnTfZSILjN0Hvd4N1hgzoC14piS
 +r7g==
X-Gm-Message-State: AOAM533n1F9/++JRGOVl5lPEye3/NdZbr4VOvjvwHp3aFvra3xBLM+k7
 SrU1aKARgtkfEjR9tZhQCnTIZ+ZN3bDIHliv0CMTK72EMU7npgXwBgH6z7KhrxkB01tiG+xMi4U
 JuXm5xHqv8ZErfff8JYQoJiasxikD
X-Received: by 2002:a05:600c:2105:: with SMTP id
 u5mr1986045wml.18.1626195593965; 
 Tue, 13 Jul 2021 09:59:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxumMUPdgM1d9aW8ug3rd8W69QVL7ebCKDjq/l4syiEd2xfO/CLyenHYKdqhxzMxt12Uge4rQ==
X-Received: by 2002:a05:600c:2105:: with SMTP id
 u5mr1986010wml.18.1626195593743; 
 Tue, 13 Jul 2021 09:59:53 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id o28sm19766410wra.71.2021.07.13.09.59.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 09:59:53 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] allow simple{fb, drm} drivers to be used on non-x86
 EFI platforms
To: linux-kernel@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Russell King <linux@armlinux.org.uk>,
 linux-efi@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Hans de Goede <hdegoede@redhat.com>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Borislav Petkov <bp@suse.de>, Albert Ou <aou@eecs.berkeley.edu>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atish.patra@wdc.com>
References: <20210625130947.1803678-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <e61cf77c-6bff-dfcc-d3df-2fb6b48e5897@redhat.com>
Date: Tue, 13 Jul 2021 18:59:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625130947.1803678-1-javierm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_100000_255086_24D678FE 
X-CRM114-Status: GOOD (  22.81  )
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

On 6/25/21 3:09 PM, Javier Martinez Canillas wrote:
> The simplefb and simpledrm drivers match against a "simple-framebuffer"
> device, but for aarch64 this is only registered when using Device Trees
> and there's a node with a "simple-framebuffer" compatible string.
> 
> There is no code to register a "simple-framebuffer" platform device when
> using EFI instead. In fact, the only platform device that's registered in
> this case is an "efi-framebuffer", which means that the efifb driver is
> the only driver supported to have an early console with EFI on aarch64.
> 
> The x86 architecture platform has a Generic System Framebuffers (sysfb)
> support, that register a system frambuffer platform device. It either
> registers a "simple-framebuffer" for the simple{fb,drm} drivers or legacy
> VGA/EFI FB devices for the vgafb/efifb drivers.
> 
> The sysfb is generic enough to be reused by other architectures and can be
> moved out of the arch/x86 directory to drivers/firmware, allowing the EFI
> logic used by non-x86 architectures to be folded into sysfb as well.
> 

Any more comments on this series? It would be nice for this to land so the
simpledrm driver could be used on aarch64 EFI systems as well.

The patches have already been acked by x86 and DRM folks.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
