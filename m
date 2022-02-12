Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34E2C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Feb 2022 18:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gbO+k4wFzpWil5qQO6QELND8nzVEGVMbBRaRJ6KcuZc=; b=Xs8rOnhhXZz/dT
	Bwr5vWrbLu0F+w0+0RqYZhsKGcgq4Iq99BWpx72vD7e2eUz0QeW6MXNbXIZ0fCAUgiIJUIKs/Kfwt
	ClnveIIza1JQQ7hCIP52odzhAtOI3NY40T5lYrYa1L1D+t45ZDFm7+PSVTD6yPZugc5MjM5zyV8GY
	51shAcFvaaCtR8QS2MookyuxrlrdbwlNwDlm9mFA1fTCXI1lvFsW7NXoUzrv0U0zCkkSWxmw/s4P/
	wN2A3Q8E8ydHh30/LsSnouvL/HaGGI9uM6xxcsetXySkZ+nrxmjoSB5oz7Nt+jxDhpqyVguY3yQVb
	45S8IS6+A8r6JEvkMIuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIx81-00AKpm-BR; Sat, 12 Feb 2022 18:28:13 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIx7p-00AKlE-Qm; Sat, 12 Feb 2022 18:28:03 +0000
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.94) with esmtps (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1nIx76-001UOn-Ci; Sat, 12 Feb 2022 19:27:16 +0100
Received: from dynamic-077-011-010-081.77.11.pool.telefonica.de ([77.11.10.81]
 helo=[192.168.1.7]) by inpost2.zedat.fu-berlin.de (Exim 4.94)
 with esmtpsa (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1nIx75-000dOg-TM; Sat, 12 Feb 2022 19:27:16 +0100
Message-ID: <0396e38b-f681-a035-b6ea-21127fdf5615@physik.fu-berlin.de>
Date: Sat, 12 Feb 2022 19:27:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
To: ojeda@kernel.org
Cc: alex.gaynor@gmail.com, antonio.terceiro@linaro.org,
 aou@eecs.berkeley.edu, ark.email@gmail.com, benh@kernel.crashing.org,
 bobo1239@web.de, boqun.feng@gmail.com, bp@alien8.de,
 catalin.marinas@arm.com, d0u9.su@outlook.com, dave.hansen@linux.intel.com,
 dsosnowski@dsosnowski.pl, dxu@dxuuu.xyz, gary@garyguo.net,
 gregkh@linuxfoundation.org, hpa@zytor.com,
 linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux@armlinux.org.uk, linuxppc-dev@lists.ozlabs.org, macanroj@gmail.com,
 masahiroy@kernel.org, me@kloenk.de, michal.lkml@markovi.net,
 mingo@redhat.com, mpe@ellerman.id.au, ndesaulniers@google.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, paulus@samba.org,
 rust-for-linux@vger.kernel.org, tglx@linutronix.de, thesven73@gmail.com,
 torvalds@linux-foundation.org, wedsonaf@google.com, will@kernel.org,
 x86@kernel.org
References: <20220212130410.6901-17-ojeda@kernel.org>
Subject: Re: [PATCH v4 16/20] Kbuild: add Rust support
Content-Language: en-US
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <20220212130410.6901-17-ojeda@kernel.org>
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 77.11.10.81
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220212_102802_036586_0EC526AD 
X-CRM114-Status: UNSURE (   7.04  )
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

Hi!

On Sat, Feb 12, 2022 at 02:03:42PM +0100, Miguel Ojeda wrote:
> +config RUST
> +	bool "Rust support"
> +	depends on RUST_IS_AVAILABLE
> +	depends on ARM64 || CPU_32v6 || CPU_32v6K || (PPC64 && CPU_LITTLE_ENDIAN) || X86_64 || RISCV

Is there any particular reason why this list excludes MIPS*, i386, big-endian
PowerPC and SPARC targets which are already supported by the Rust programming
language?

Are the arch/$ARCH/rust/target.json files everything that's needed for supporting
the other targets?

Thanks,
Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
