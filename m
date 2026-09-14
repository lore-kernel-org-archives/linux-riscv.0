Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1665BC88E6E
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 16:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+5Kah7ALCwDHNuIEH/4enYrHZb+IG+SuvTubBjBr4fQ=; b=dyNWQg7BIUfZXu
	VzwIejY6763u9ZcbuTESFzm2scCcqK3aKefRqO0j94aCGeOJ5HGOeiKu+Y1IQyUkrcLXbWL7KHsAl
	hOdjvYh7OOAQcMsZkKwz0+UL1iPVBaqvrUB7xfIjkp96zg0hv4cx3HnDREqo0bHq+tL96W/tfcIZr
	rOiLuNJyRUDwz786N+xml6Tifcc3X13bVmicLACQXCnQx8B3LaIiqaQ8DMTZlAwhrCa390pPVYbwl
	pYh/ys54ZVhTOCqH0qCJDDQT4LaLtW9EDrl43oSt6uv0kwg3wTONE31FdL8ou0D3hI8XrmIHFoYUt
	P6jj7fmhZMIzsIaHM+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x698d-00000004FZW-0nS1;
	Mon, 14 Sep 2026 16:02:35 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x698a-00000004FYy-08Js
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 16:02:34 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f9f0b1eso395747666b.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 09:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789401749; x=1790006549; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lW3GLwaZtw2SQDM2dpduYrEemaWK0EaPlBH9/B8yf6k=;
        b=JHygwNdzh0SouAq88X0QQD9zajswmc1jNhHYIeMrSSeSiGb6YsFpgKF36jmw+4D7lT
         RZEBB4y8CTbXuz9/RM7epHNl4EUX3gsrKd5SZ4RqvNPVNKH3Mlnh9wPyYlUID018D+fi
         6Are1xHUHWwPVr5K51CU/0RPmNmNf7N1l5aRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401749; x=1790006549;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lW3GLwaZtw2SQDM2dpduYrEemaWK0EaPlBH9/B8yf6k=;
        b=TfSK5cg/eg8iGYzjs9sjzNotOYXggU+S3J4YRqO3yMGTcFpUqOZa4pGLhdSLB7R9Xb
         C7xAlZULQS+GaTwrVUqcOS7SRrvD6noitv2lkT2MK/OnmhLNRXTQv04eedYHuLM/6v59
         h+mSMDL3RhW4gXduFVe7/YXSWxqkqe2D3DpnBLnHHPquMz0sbIpmvf/FpokjZEXWOzAx
         YtQjaMWbx8j8j9a6uc6zLEyCNASQTTkaVB3UsTkTcqcOvF4hVl8GN1grceWPEKfesgxt
         5R3vGcIjJy94uINBNv3sZ6zDpD2yx/bRM3caO/SanlXl7o0SYL/AQ/Bx06NLBxldjeF7
         0mWg==
X-Forwarded-Encrypted: i=1; AKwUvBwYX1OhPfX6arKRHr0khwYqEMKqw+7mkh/LZIwVbs+AeJcBE4Kz5wcP3qq6wPE69t51dsknDJR1AOU8Lg==@lists.infradead.org
X-Gm-Message-State: AFuF++mQEZPpNfWZ6Efx1MQBjWKROdLFLA9bVXGdbz+w7oALiQqB/dJL
	oV822s1OmDs89uygwf/OXt3I7/ebcu5nX8ynYp86CmK7dPryQYh2yU+VH8VtFvwiug/Vk3HJFRP
	TpoB1TRxwHg==
X-Gm-Gg: AYBFou2OOimtP3zlA9w2klQ95v6HaSfBSPR9YsRd++o609q3J1Dq2MMZTsTfPv7i3Bf
	gJnLbKDZj4CBmt7/nJoKQeAI7VGsHyjwa9E2ALT6oV8Ku7BpVIioKjZZGGDazaiZ/nA3oesGI8U
	5hMwTMpN/KTJfHL0VnDui/PMbK1eL2x5fAvEDoELkOBAPAzR/kK/dxKPB1HF2NapM78uBdHRtu+
	llhHElLvk52LWTHx1wrQzX2Cr13rY5FsGK6CiqrBHefLv87oAeAxuguQy0TNOWrQ/72FHnmP79p
	vHWSBZQkP98oejh27mWVHWJ/OiI2yYi9dIwYmAK7auUeBtn941y92ktTNZSYPD+rMvxcQ5Hw61S
	UJyVfqJ6pOUXwD/iIUcKMdVY9eu5Fp3l9CWtnPAZ6H9ZmaFZdxk6tR89ryKj57YYMfK7V0ioxC6
	iPynoFm5NvK7kX9S+d3HgI4Ky/UyV5zR/c0yRxETw5JqYcYniJHikpHpl4aynxB/ZvrZm86VcrN
	z/4aKoS7QAaoAGdhWVdX79gjYW/EZbOCGG0W3cbB8NmDQodDqg9xfhOYT45
X-Received: by 2002:a17:906:c112:b0:c29:450f:bdbe with SMTP id a640c23a62f3a-c29b8712bbemr384854866b.16.1789401748878;
        Mon, 14 Sep 2026 09:02:28 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4dfc7sm456657466b.4.2026.09.14.09.02.27
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:02:27 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b20so461177966b.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 09:02:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByCxmP6Xg76ASR3PHfLR/CA68+arcfyvJWA+4zbpetFxqRAuh0e31rY8oX3Fz2BlepfZ9eDXSsXcBLYUg==@lists.infradead.org
X-Received: by 2002:a17:907:3f9f:b0:c29:444c:8f28 with SMTP id
 a640c23a62f3a-c29b84c2597mr415053566b.5.1789401247404; Mon, 14 Sep 2026
 08:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org> <202609140833.88C0E16E50@keescook>
In-Reply-To: <202609140833.88C0E16E50@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Sep 2026 08:53:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=whB0X28MNAg71it=1SfFyV7rB+PK3qajpRyWoxXHW81fw@mail.gmail.com>
X-Gm-Features: AcwNN1VyLYI7E7T_24gtwZZHDPdmXi1EUi9s9xthPRH35xQepEwWHVnUZ8r6fdo
Message-ID: <CAHk-=whB0X28MNAg71it=1SfFyV7rB+PK3qajpRyWoxXHW81fw@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] kbuild: significantly speed up kernel builds
To: Kees Cook <kees@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_090232_087617_2BA4A36F 
X-CRM114-Status: GOOD (  11.51  )
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

On Mon, 14 Sept 2026 at 08:41, Kees Cook <kees@kernel.org> wrote:
>
> One area I think might solved via an LLM is the 3-pass kallsyms stuff.
> If we could get a deterministic kallsyms build in 1 pass, that would be
> very nice. A lot of people have tried, but it has eluded upstreaming.

Even the three-pass one hasn't apparently always been entirely
deterministic. We've had random reports over the years of it failing
in some circumstances.

Maybe we've fixed it all, or maybe the failures just go imperceptibly
rare. Regardless, it has definitely been fragile.

               Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
