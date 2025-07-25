Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01FCC87FCA
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 06:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vSuEgwbNZ+g4SILgnjJMd1BGIoWmFGtxHI6tx6V/AiI=; b=f6vaxuk3INRTfX
	BnXuphlN6B+BaS9N7yejFvShJb5j7OmrEhghQEFMJH9Dz5NiiAWEco6460pMggqE1kgqVwS71u2yQ
	ZY7/fR9pvXDyRTY3jhs32E0oUN74A8OrAOnF6YVHaXBs+A6kKvP7S6O8ULDNYsF3RpgyZVh4zmZ19
	njf12r/cq4GNPxvf3hwf6t2u352/EZL6oUKqHwVZk+6dK/6zHsucQKeZj2gNRXaPmio2qpsUO+/Dl
	pZBAHYgwvE3oy272yxir7N9A0Oizi9BXwzExVK7qBodEAA0QX3EfqGxr/RevBDiNZK+ugKUPBLo+T
	smLqOn5mb+5X+U2XHIMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCCP-00000009BWe-0Lik;
	Fri, 25 Jul 2025 06:46:33 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBqS-000000099oF-0eVb
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 06:23:53 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id ECCE03FB53
	for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 06:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1753424628;
	bh=yY/SYQrNWX8OlVsdlpiMi286zoK+AXS6J+gjgGy9bGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=KJBxipd7Ok3pTZP515xFxl1IqDlys0htEUqIsYbdSRS39m/Px3R63Thm0IeUdcNpR
	 0E8gtwpkwkmt9k0euiG1LyN5hMr0I7kXFJhvV3Fj8rAMZLROVHa2s865pE/fjUY5GB
	 IMhHCKGciGqs8XqaJrQXmO1T/l5xeNV0JZbuOfmyBaUooHmmuC5HvavdvsmnR71TW/
	 LbL8VGh/xmt80fQIPxEoOyqDNQU2WxLa8NanJfQHOu+BW8t7ksBUR8LKOesxIXvqY0
	 dCLYOlsw31pOHlfRTqUUqh2YTelgitVdpLUb3hx8V0tA6wD5Sjm0cy/n4LbanhY3fr
	 Un7nyrDE5yjdg==
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4538f375e86so13798205e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 23:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753424628; x=1754029428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yY/SYQrNWX8OlVsdlpiMi286zoK+AXS6J+gjgGy9bGo=;
        b=f0s/ivsVVBG+qDuK2Bd70mCximyE4z3Zuj/r5Swl1ceVd54jZ8V2mqX6m37msIGZRW
         JS2h6oji/jbKHbg+j9ZS5/X6J5PZuIYcLpaj3UzlEX4H3aUsR5M9443nlfylNDwMSHkd
         En8ezt5WvZq67vCWegR6RXOFzstH4MVr2pWil9QB5x8AZK/3CByz8zgl0XEu36Vh1BfU
         cN6Tsv7tEDZX7/9FhsTQSP5pydt/JDuELupw5RkxEQvbkT+zbX+vkiZgbqWdnrHW+EC+
         a9P8RwRahuaq/Puq0pQlduoJfYHSY/4YNLtAnwIDb3abmHACQZ12uBd8BPGSOxwuW9Hl
         4i9g==
X-Gm-Message-State: AOJu0YxKIxPr4n5gUXUTHiZ4HPVunN5ZhQtcEJoBXmg+2hr5O6V1ApBE
	IE5rB3wiiG0TARr4nWgI4klZ4adn1auapSV+mdIOb1dwHr+6qh8rkfat2R3ROQGeDqGder6qorB
	5x3laoaiIxIyayvmI6myO5Wnv3NM+TRdE/02p0gijvAXqb9nK3SpkEdWyowp4Zte443HOC+5lSO
	yhPO/32drsbQ==
X-Gm-Gg: ASbGncuYTVJHPmuaBf+I/6g0kLeeQL0wanCTjaipk0zB+FKJgOp+nogzraCWI/2zZxP
	k1upbvcMfexuI84w+5wA/a3X1UUTfFw0XttmsX9lQMAH5QltJmIGWgaqALak2vIUmleRdjYiy3F
	YvIAYwpzqXSPG/ErgUNBPjZy8UCqv59P3Ubaz/gQGOhoKqEh2Ohaqyd0Xc123Bi5Uhd7/hr65Zs
	38o2X8cowWKIeKNB63fsi2W9JnXR30Af14TyP8uaXLuo4PjNPYv2FwU1W6333zpIBwYxe5yNoXJ
	nTC79t5gXcvWC8LXWXbWTEY/vn+I6r3V5mcyJPEX6+kF6bDyieqy+Gwo3c9nfvbu/JwzcD4UOSx
	v3MuXc6u30FvFXOxXZ57bHKJftZHT0oWpqNY4
X-Received: by 2002:a05:6000:2306:b0:3a5:527b:64c6 with SMTP id ffacd0b85a97d-3b7765e57c8mr626025f8f.1.1753424627788;
        Thu, 24 Jul 2025 23:23:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1tfqV/uoCrIpUQ7zCYW6YsO9mWdhr+kRfUXgDIjxIPForORsIR9T6UJpoi3QB0+gQ5qNtNA==
X-Received: by 2002:a05:6000:2306:b0:3a5:527b:64c6 with SMTP id ffacd0b85a97d-3b7765e57c8mr625975f8f.1.1753424627337;
        Thu, 24 Jul 2025 23:23:47 -0700 (PDT)
Received: from [192.168.123.154] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcace8csm4135036f8f.54.2025.07.24.23.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 23:23:46 -0700 (PDT)
Message-ID: <4ad699fc-a89d-4740-bdec-ecb9a2134c90@canonical.com>
Date: Fri, 25 Jul 2025 08:23:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] riscv: update asm call site in `call_on_irq_stack`
 to setup correct label
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com,
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com,
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com,
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com,
 andrew@sifive.com, ved@rivosinc.com, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>,
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-2-04b8fa44c98c@rivosinc.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20250724-riscv_kcfi-v1-2-04b8fa44c98c@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_232352_455849_84FA7D26 
X-CRM114-Status: GOOD (  16.37  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 25.07.25 01:36, Deepak Gupta wrote:
> Call sites written in asm performing indirect call, they need to setup
> label register (t2/x7) with correct label.
> 
> Currently first kernel was compiled with `-save-temps` option and
> normalized function signature string is captured and then placed at the
> asm callsite.
> 
> TODO: to write a macro wrapper with toolchain support.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>   arch/riscv/kernel/entry.S | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 2660faf52232..598e17e800ae 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -389,6 +389,7 @@ SYM_FUNC_START(call_on_irq_stack)
>   	load_per_cpu t0, irq_stack_ptr, t1
>   	li	t1, IRQ_STACK_SIZE
>   	add	sp, t0, t1
> +	lui t2, %lpad_hash("FvP7pt_regsE")

In patch 1 you use lpad 0 due to missing tool support for signature hashing.

Wouldn't it be preferable to have a first patch series introducing 
landing pad support with lpad 0 and once tool support for signature 
hashing has landed create a second patch series using tags?

Such a first patch series would not have to be an RFC but might be 
merged soon.

Best regards

Heinrich

>   	jalr	a1
>   
>   	/* Switch back to the thread shadow call stack */
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
