Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C212C3600C
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Apr 2025 03:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G0Pg1Jz6REFx5tH7gg3xBGG6k7MfMwiYmpbS/Y4KLAE=; b=ipYyDkL+p72WiQ
	VFibAuIHp0gQB3btS9y3I4DIl34pGDUkPokK2m6Gd+6gEZUxjkE8rKtfIKKqmlBYJqA3PWTeArE8O
	VgOGlUsjJCsASSLvj5uiNpV4ScxyTfSh2HD42jJODYIv3eDXuNVylwhZweEYBZhi88NFu5oGeyWyj
	7nQD2ep49r5jiav5gyf6d2v2v0qJ4kWhjR9bkL7hYEORLhEluT2whkXk+BNE/juBu4UAPFer6DMO5
	BBuCn5Al2oZ8NjZ7tirT7WSTPd+dXu7t/5rIQZ8v0kB7LYd2ad7kXMbfDujH9RqWCVV29hmeqqSlw
	d62Ytlopu/nDN4TvSJKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzS1T-00000001pmm-18qT;
	Tue, 01 Apr 2025 03:10:43 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzS1P-00000001pm8-2YrS
	for linux-riscv@lists.infradead.org;
	Tue, 01 Apr 2025 03:10:41 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-30384072398so6809183a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 31 Mar 2025 20:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743477038; x=1744081838; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yR8fpkENlF7DLFUIFMCpvHF4fT3L72mrhSGmnmI07aI=;
        b=PxAGudbGwImU3+vJQYDWtKto5xGotP7jlRGp9Cq0lKkdVNe+HavUksZo1pE496fwh2
         qQLU62ZrCoo0+dnldj2Zvx909E1wVcP7c0Vqc+xmxbX3kfhKJa/uNkIOdoRQoStORDd/
         X523+pbwbXoVMaaFrf+HYQ6WZvlwHeHHPjFlFL+PpnSsTkp7n49nt8/sH4Fd1wUthjId
         aygrY+vyDpcXcGCqxzTCuI/GEWukq5sVPcUXhYrSiBTHzW1DilSq4/QVETlpC6N/u4TZ
         VX6LADh0YZNa9RRk4RPoZG/gLViX/Fnr4eG1023hBw1zo0WxdraTrT8msXu5a/zKwVvO
         pS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743477038; x=1744081838;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yR8fpkENlF7DLFUIFMCpvHF4fT3L72mrhSGmnmI07aI=;
        b=Nw1qsj3Nh0MPE6zDg74MPLRzsySsk6K0hmru69frfNOSh+bkAklQGBDMXDA3U66qpl
         UvBsi2bzqAkSQ/rRGn+JMbvlKxErKeTfzpHh1ZrE7O409PmCnC24geG2+OaGRxz2pSNX
         sppdDeff/LBxKImqeVbAogZU9pr/FyoxErv9vsE6izYcaVvu2d1qkQ7kT0rNQe9am2bD
         NSsiAZvWsu0UBWx3QvfylbX9r8J53ju1V6Z4+dLt9V9cmRK0fcv7YYZBewu8t5yAjiZf
         +kQW6A/8aBn2mO8el64tGQxBA2aQWz5cjSBVD1yBrjgaCh+wIR17eE2cx4UnPHDQ5/7J
         P14w==
X-Forwarded-Encrypted: i=1; AJvYcCWbo5qD6DCjyE1jMxFd0xT1DWgUqqDm90oSvX2YqU9jCHJHnijabQimAzbyfVsbeC6L/3zV83PuvYLpIw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7LjXhKAGJ4Y3Tyctj9NWxXlGI5u5gK4ry3eEDfK+mTnx0o3+t
	4kQo2cMkj3B0LvMkM1ATJrzbTWQAIbWxmmmGGzgbNcLN1NcpO59z
X-Gm-Gg: ASbGnctMDuK9uQZqMLZqpa7hoBy+JtpfglKLUdZWiSXzLlbJatyuCNHGgC1AlM+fHMU
	/iceHsPDkpZMOO/DJNvIBznULY8/42gtwkheG+JpvrGXrl75jX70DSfwZj4aCzuluBCap31o3b6
	zGAmPvlGaglXZD/KbddyBLqzYLhHPfEYZy+CkIRojqMNk8WgtA4viJsrb2PAHXCCdZvH1wI6j0W
	xqGdpPqWEc8s7JnbTNzcCRD3a1jOqwwJC+I5EXaBCh9GyIwYDBLbjB+0h9IJzMbzQfe9V/OSgee
	lAXME95NBgdOKlKWFLdYSZzQMyzlVTWUUY08TGLyE8gmA7lV2g==
X-Google-Smtp-Source: AGHT+IHJEVgryVXBAaV2nMYvJNPsM4kZdEKgt+wHMxHr/FU7YJ8fAuxKh9Gx4YAaVeK6/3r60ryJ/Q==
X-Received: by 2002:a17:90b:274e:b0:2ff:4e90:3c55 with SMTP id 98e67ed59e1d1-30532145ad9mr18135492a91.27.1743477038435;
        Mon, 31 Mar 2025 20:10:38 -0700 (PDT)
Received: from [192.168.0.33] ([136.24.137.112])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4ba4sm10466504a91.31.2025.03.31.20.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 20:10:38 -0700 (PDT)
Message-ID: <754690c5-3df8-4524-b545-88a2a5e186ab@gmail.com>
Date: Mon, 31 Mar 2025 20:10:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Module load relocation hashtable size can become huge and
 unallocatable
From: William Pierce <wgpierce17@gmail.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: alex@ghiti.fr, linux-riscv@lists.infradead.org
References: <32a55bf7-ffc7-4383-ab61-fd4d75f46b3a@gmail.com>
Content-Language: en-US
In-Reply-To: <32a55bf7-ffc7-4383-ab61-fd4d75f46b3a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_201039_671350_89CBFE45 
X-CRM114-Status: GOOD (  12.44  )
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

Using vmalloc_array/vfree on the relocation_hashtable
allows the kernel module to load just fine. I can send this
as a patch if the fix sounds good.

On 3/30/25 1:12 PM, William Pierce wrote:
> Hello, I have a kernel module that requires a huge number
> of relocations upon loading.
> 
> On other architectures, it loads into the kernel just fine.
> However, on riscv, while allocating memory for its relocation
> hashtable, it ends up requesting 2097152 elements to kmalloc_array.
> 
> Right here I've dumped the values by recompiling the kernel:
> num_relocations: 1630985, hastable_size: 2097152
> https://elixir.bootlin.com/linux/v6.14-rc6/source/arch/riscv/kernel/module.c#L734
> 
> which kmalloc_array->...->___kmalloc_large_node->...->
> __alloc_frozen_pages_noprof can't handle and returns
> "Cannot allocate memory" on insmod.
> 
> How would it be recommended to fix this?
> I could imagine allocating a more discontiguous data structure
> to track the relocations or otherwise reworking the tracking to
> do the relocation tracking inline.
> 
> Thank you,
> Will Pierce


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
