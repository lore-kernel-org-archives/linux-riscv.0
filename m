Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644B4C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 17:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yRG7cDG/Wz575zhQcXxo2cUAyTRjBsn98GPbmYeTBhE=; b=crbpddHDPjLYIE
	jabblnMlGu1lo8fFul23wZqaMe2GyOJ6oZgu8sLFXYRfV1S1zHnoFMMsLKmNAAvayQcBP46QBviup
	0YdSh+tinQpUkPRfjkLq4VjENG16XKY5eiYLQzWy3iItpbC1EVXSfj7CH5/cBzXvjxPjOf/EGPzoT
	tKcS2GMa2Z2JUujjqU8q7tyOIymN3W4ARC35jb2cI5WptkJcWym5gvK78tPVwPa/eczZ4EE3o7j06
	cAGjnjoE9NSmZx7DdsHCRF+Riol2hU0PR5PeqZ0r2berxd94VwUgNgyM1eaN6cTCXm0waVmQaUM3k
	mzivlWGSdPSBfcZOVY+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZZfG-00000006GD3-2eYd;
	Thu, 01 Aug 2024 17:32:34 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZZfD-00000006GC7-3uP2
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 17:32:33 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-81f921c40a0so287504139f.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 10:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1722533550; x=1723138350; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bS2/f0MUierH/zQOzYcFrgW7IacC2rV2Pf3VZgOc8QA=;
        b=Io07y8viqaGWIkuke+9bj8WUV6A0WYxJH9KGlpC6tQ+LzxS8EvlgoW1oDkcZ6pOMEq
         c8UL6l5g8GFik+CgLZNIO8ZXIzuTkefAd4zwFGx8TLhMMP8y6HxdkT8hRuNLW8V3dHT4
         2MYgVR7X08FkIATUzVzPyGIJs/s7qm7/4nnNvFKO2FYN4uCsEmR0KiMTluOlOG/QdSNj
         4dziBglrWAHbPviGwd2Dv641OH4Ba656aRB+Lfom1fBF4i3hOwC3td0BZ1ml05GgM7mE
         hPK3dJ26g+5pNn2qcJ0VFmrf3lt2Tnnt4MD2QbOdrN4fGJMyml5Lcb+arTqBj9B46QJ/
         3n9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722533550; x=1723138350;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bS2/f0MUierH/zQOzYcFrgW7IacC2rV2Pf3VZgOc8QA=;
        b=tjUi2upZsV+Aagm7lz89o2yLLF37l5DcIGlsoZuTIwuwvkwliLtoUMjaW+qvo0/q2/
         tfNRqA+GG1senbbnpiSVunT9jJJQM4/uBdNm/yR/j+GI4WGrcfnNtoQXR0euJquS1HKu
         Bw4DyeBCVq2HtMMLaHtyW/chsa6X5l94Owc37X2EVTGEY9CwJyH2rGFH+3a0SrQiDY49
         Y4MgImG4JjdKxXcdUdpKZ054+buHahcQeldIOSBplMRzBQiEHJoTfTX1NIEy/9W8ebkI
         T9Qo4d8ecF+qT07CGTTKpAJ4reXyTmsGr3rYiSbM8hl/ZI42f9LEDcdhVSgwpAPLOSNv
         c67A==
X-Forwarded-Encrypted: i=1; AJvYcCV6KYfB2eRqr7K+jdl5Uclot7ry5saA7nw4CPugI9uQ8xOiUNIXl3b5HRVSl84oIo/0mO04ls0qRWAJSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUh5k7s8mMQ6iYJdjQ4fmrWUNk07Btvfsn4iwuK90znBcjgWuz
	BUerbw5jdTaAxwdo+GqOQC/bzqiGruLnEdNFAz0SHzrwXZY3Qqk1Rx2PbWwFovs=
X-Google-Smtp-Source: AGHT+IEW29DvT927BXE65AEWASyCF+zwd6XCxK7iEu1GTTZ94NlmL1vnW2UIMzI/7NaHio7Cnzi6DA==
X-Received: by 2002:a05:6602:6d10:b0:7fb:790c:a317 with SMTP id ca18e2360f4ac-81fd4367709mr110631939f.6.1722533549872;
        Thu, 01 Aug 2024 10:32:29 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c8d6a3e19asm21674173.127.2024.08.01.10.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 10:32:29 -0700 (PDT)
Message-ID: <0719e155-0a07-4878-87e3-cd96fed7a1dd@sifive.com>
Date: Thu, 1 Aug 2024 12:32:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes] riscv: Re-introduce global icache flush in
 patch_text_XXX()
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20240730135921.156508-1-alexghiti@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240730135921.156508-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_103232_178970_F822E7C5 
X-CRM114-Status: GOOD (  14.61  )
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

Hi Alex,

On 2024-07-30 8:59 AM, Alexandre Ghiti wrote:
> commit edf2d546bfd6 ("riscv: patch: Flush the icache right after
> patching to avoid illegal insns") mistakenly removed the global icache
> flush in patch_text_nosync() and patch_text_set_nosync() functions, so
> reintroduce them.
> 
> Fixes: edf2d546bfd6 ("riscv: patch: Flush the icache right after patching to avoid illegal insns")
> Reported-by: Samuel Holland <samuel.holland@sifive.com>
> Closes: https://lore.kernel.org/linux-riscv/CAHVXubh8Adb4=-vN4cSh0FrZ16TeOKJbLj4AF09QC241bRk1Jg@mail.gmail.com/T/#m800757c26f72a1d45c240cb815650430166c82ea

Shouldn't this use the permalink for the specific message, not the thread?

> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/kernel/patch.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index ab03732d06c4..91edfd764ed9 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -205,6 +205,9 @@ int patch_text_set_nosync(void *addr, u8 c, size_t len)
>  
>  	ret = patch_insn_set(tp, c, len);
>  
> +	if (!ret)
> +		flush_icache_range((uintptr_t)tp, (uintptr_t)tp + len);

This patch was based on an old tree from before
https://git.kernel.org/riscv/c/47742484ee16 removed the "tp" variable. While it
still compiles because flush_icache_range() is a macro that discards its
arguments, it will be confusing to anyone reading the code.

Regards,
Samuel

> +
>  	return ret;
>  }
>  NOKPROBE_SYMBOL(patch_text_set_nosync);
> @@ -237,6 +240,9 @@ int patch_text_nosync(void *addr, const void *insns, size_t len)
>  
>  	ret = patch_insn_write(tp, insns, len);
>  
> +	if (!ret)
> +		flush_icache_range((uintptr_t) tp, (uintptr_t) tp + len);
> +
>  	return ret;
>  }
>  NOKPROBE_SYMBOL(patch_text_nosync);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
