Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C977FC982D2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 17:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TCN04V7AfCChGaHmjgx0JpUQ3Qku4Fhas5Ym+C8BF6Q=; b=MfJDtQEIoDXucl
	Isx7hNH4CwD5iY1myaopcP/gzb7rCLi0cwrPmiTExpzqLHaFxGUsCzaXnvWiDL/a51cyYC4eiTm6L
	xKxmY3+iY05/nnyAl1C+y+M1Brvn+UyecBTu1+31rDsI/5ZO0UnEH5nk0B5Ph1cF3sLezMPgPttCh
	oz14shRwRb8rEkyHFsiUYfaXAPsMD/A09YSdYCebj0q6w9THBPQvGv3558Twfiho/XaoejGFSpWkd
	iQkUs0/emSjHm2/iocnU4ZVb8y5R9VhjP9amD5oos2Ef+W1wmKsI7kdRWwJxGyn0alvwlUXt80HlH
	OmzfSw8g6+pzhhv4qqpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FiA-0000000C44x-2WKO;
	Thu, 17 Sep 2026 17:15:50 +0000
Received: from mail-ed2-x0f.google.com ([2a00:1450:4864:33::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Fi8-0000000C43a-09fw
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 17:15:49 +0000
Received: by mail-ed2-x0f.google.com with SMTP id 4fb4d7f45d1cf-6a6056c2064so1574195a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 17 Sep 2026 10:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789665346; x=1790270146; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCKe0geuwZYO+S2TeH6s+a22CWM7gde8UuWVtmH3l0g=;
        b=BtgA5S5VVdmBW+9JX70/LoGXt/vfQitgGmjvJUct1xuAY0iBrLD5nxgCQtaLw5mT99
         b6LquY1tzoLJy4c5s5jhXaZVohVWgQIZnEdpOXx73qUOKBqAGn/+btP8l025P/4LCFOk
         ctbcV1e9RuhEkhUelhqQaYaxd7/m7eexhZqFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789665346; x=1790270146;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iCKe0geuwZYO+S2TeH6s+a22CWM7gde8UuWVtmH3l0g=;
        b=idpVxgHl+S9fWHkzmSi5BmrUwPZVMskS4N9Jpwkc+hg9iW+SfaRbE7pxH59PyjXBv1
         xCKy/L9klb81ayl26UGVYVJQvIluQFeSAzERNdycZ4NWBH4U3UUgpBHkGAHS5Bnrbm+Y
         CYkMSClkQ5cu4h67cy/U2A19nFU8GsoweDtzfPx6Aa93K4359CrKzKdDb0lgTuO16OFd
         Q5gaWhImAuIol8U5XaNvxF7CO+XfUCuRo2XtxebY1P5e0+VGwh6l5mYYvIT8ocRYUtFH
         fcj7BtwNBsb00DbFKGS3RL0z6F4/X8pqlkPt2JnVI960ZOCIfQ1s12HBwwS3clRTrKgl
         q1Tw==
X-Forwarded-Encrypted: i=1; AKwUvBwM6xSZw/6L7gBDmiTj0N0KEhzhorNV8ERJUSs0NeXxxKlVL+mjooEI+j8Zw5IMFqQ1XwUsJsEmQg8U3A==@lists.infradead.org
X-Gm-Message-State: AFuF++m7SQV1EmrsTheOa42ZhTsCcPXGG1L3q0VHbK+OVSUyKXRfpKd6
	Kj+oaQKccIImOsk9JfCSvKinKyhCb4QkVhIqmeX9X6Pmr2pbc6MoUj3eKXM2uxYbtyPRyLAL9ck
	sJJ510D8=
X-Gm-Gg: AYBFou0+GXmgWt8xLIYKihSfx/rapIrgNb6HbbwZLoDVeSZQrdzrLBlMK0pIgQxL6Cj
	HjnRgW7Ut1VW/w7DBbL7ucJHC1oitREUQm6KpJki43I3A/DVMfAMbwe7VAstgJi1K9Unm/wmd2K
	OEGZ0ZOroj56odnFQYD1QKAXtwbcJbul13tWcEUX8AXmwMdxagGPuaJQRv6by1Xh8zv7NfzURzB
	7RhYPEk+h7rtwykqkag6kQuvWEj6d6HGrSa0eTUqoj92RK6y8HLp7L+bIL7IiJtWeZCrrg9Wo67
	qjtggcrQ4IQ4ToEflutdis7awNL9M/MEof0R4OWZjRIkrguEWVWdhMTWiZfkRmFZsicAb1ZK6i6
	IFMu0MF4jyaqoVRMiXjGmISkBBKyTKPhVnvB1cpeQmh6AYqals5pDNrzTVFsA5YIASOKlxKv1wV
	asFnIJs/rVOzEHmXymP/gwaPftKro6q75z64ipbZjxwCy1jTCSP/8jCAhvKvVQAxQuaJaaKcTLg
	k+w9Jqdhw9L2VQa0Yef8+Vq1Wwnzj9uWI05C0F5lbgLjVbSGg==
X-Received: by 2002:a05:6402:3242:b0:6a6:4004:4ae6 with SMTP id 4fb4d7f45d1cf-6aa22236b94mr4581698a12.5.1789665345681;
        Thu, 17 Sep 2026 10:15:45 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d257a35sm3933267a12.15.2026.09.17.10.15.44
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:15:44 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa650c8so188504766b.0
        for <linux-riscv@lists.infradead.org>; Thu, 17 Sep 2026 10:15:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxNNGrGybNndgUp62PGffMDO1zCVlrn/j3ndJWKXLA4t2K0cwwMvjMuyO6clcOzo+/Y7bWAwWg2RWi1rQ==@lists.infradead.org
X-Received: by 2002:a17:907:c1f:b0:c12:e178:9e68 with SMTP id
 a640c23a62f3a-c29e5237e9amr501417166b.19.1789665344119; Thu, 17 Sep 2026
 10:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
In-Reply-To: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 17 Sep 2026 10:15:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjwtJQPW+MRAkQCcSGA1EZWehxBTUiEUUhdACCNHSKvTQ@mail.gmail.com>
X-Gm-Features: AcwNN1VkAmOFPymjE_dcKSWc6Q8Z4LvlbW-9yRGSGQmATfVxYq3jdlUQ82g4gXM
Message-ID: <CAHk-=wjwtJQPW+MRAkQCcSGA1EZWehxBTUiEUUhdACCNHSKvTQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/20] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
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
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_101548_192984_89BA6E04 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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

On Thu, 17 Sept 2026 at 09:06, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
>                 == defconfig FULL build ==
>
>                         before    after     delta
>                       ----------------------------------
> Threadripper, gcc        32.5s    26.3s     -6.1s (-19%)
> Threadripper, clang      34.5s    27.2s     -7.3s (-21%)
> EPYC, gcc                28.7s    20.6s     -8.1s (-28%)
> EPYC, clang              39.8s    32.2s     -7.6s (-19%)
> M2, gcc                 519.3s   512.4s     -6.9s (-1%)
> M2, clang               634.5s   569.4s    -65.1s (-10%)

There's something odd going on with that M2 gcc build. Why is it such
an odd duck?

             Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
