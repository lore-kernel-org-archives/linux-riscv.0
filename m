Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93C4D1D482
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 16:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+4dwt3qAXAdmOF9vOJnLSqKDOWOO6N9EMbAQiikpqRw=; b=yKUOH+i7/kKdy3
	2oq/dM64EMfyTRWXsWN/Z7raaAj2uvs01Gu15mbuqhImpFBCZrDxQzJBDph+7JT3bNpe/x0hfUX1F
	Ib3zLP/XMNnn+os6W3lfJ5jPilbieOji7fQhBRyAEM1Of3mVzKtJS4WrJhmD7NMi+pBPiR32RLxlY
	x1dws7qaYnb9/ViysuejP0kQ9y4cNjz2droXbCyAcRz83LkqGL3ir0wWUH5tuh0K4t4S/W9s6XPiw
	4WeEeLXcRdVBIasRun/ZDBkCtbKmFWnVqcRCP9jnyYtnlaJOroCUaLA1SwzWidqcK0XM1zNXpRgqt
	z7OU8PJSfkm+U8cHf3mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdspv-000000007oQ-0Hkm;
	Thu, 08 Jan 2026 16:26:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdspl-000000007mc-09n2
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 16:26:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C9E86012B;
	Thu,  8 Jan 2026 16:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1C6C116C6;
	Thu,  8 Jan 2026 16:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767889560;
	bh=OQxDuNgfE6e5tF4qpwq4v6IWP64NBvnqK3wmGYcyRBU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XrjTyWmGlM9ynS+kE26WK4jWibbKKPLMLH4CBpcdhpleY8DPE45SA/UTzeXmERy24
	 mJ+bBrcHNSnuJqBMo+ZxKOtxxbkobRs0QELFpHk2Z7U3owKAcH3fcdtz0syeOcU61U
	 z6dikvGvgVC7qTCzSXkLBy2Gjmac25yXoX7s7Y79wP8niEBFgC87wv5ceryJMxvtbQ
	 PbUU9O8SUola85nvSNQju0ZcS+8OELA8AVILAo1bGJJHXBHP7pwHVwU5R7IuZVsKeG
	 5NT85m/20ljCZqQrzL3XnjHB59ocPhq3OMPbh0ThCl2b812NDixOgLf0NFWIUrBAwy
	 ijChpFvHraCQQ==
Date: Thu, 8 Jan 2026 09:25:53 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
cc: Paul Walmsley <pjw@kernel.org>, x86@kernel.org, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
    Christian Brauner <brauner@kernel.org>, 
    Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
    Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
    Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
    Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
    Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
    Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
    =?ISO-8859-15?Q?Bj=F6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
    Andreas Hindborg <a.hindborg@kernel.org>, 
    Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
    Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
    linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
    linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
    linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
    linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
    richard.henderson@linaro.org, jim.shu@sifive.com, 
    Andy Chiu <andybnac@gmail.com>, kito.cheng@sifive.com, 
    charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com, 
    cleger@rivosinc.com, alexghiti@rivosinc.com, samitolvanen@google.com, 
    broonie@kernel.org, rick.p.edgecombe@intel.com, 
    rust-for-linux@vger.kernel.org, Zong Li <zong.li@sifive.com>, 
    Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
    Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
    Charles Mirabile <cmirabil@redhat.com>, 
    Jesse Huang <jesse.huang@sifive.com>
Subject: Re: [PATCH v26 00/28] riscv control-flow integrity for usermode
In-Reply-To: <CAKC1njQ-hS+kUJ0C_v0oqZW1EZw2zAXMp-SnnA-ZXh_H-SoVdQ@mail.gmail.com>
Message-ID: <30f969d2-794f-937f-53b7-3af3f2b88ef7@kernel.org>
References: <20251211-v5_user_cfi_series-v26-0-f0f419e81ac0@rivosinc.com> <e052745b-6bf0-c2a3-21b2-5ecd8b04ec70@kernel.org> <aTxf7IGlkGLgHgI2@debug.ba.rivosinc.com> <CAKC1njQ-hS+kUJ0C_v0oqZW1EZw2zAXMp-SnnA-ZXh_H-SoVdQ@mail.gmail.com>
MIME-Version: 1.0
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

Hi Deepak,
On Thu, 8 Jan 2026, Deepak Gupta wrote:

> I have a bugfix for a bug reported by Jesse Huang (thanks Jesse) in riscv
> implementation of `map_shadow_stack`.
> 
> Should I send a new series or only the bugfix-patch for implementation
> of `map_shadow_stack`

If you just send the bugfix patch, I'll roll it in to the patches that I'm 
applying.

Thanks for asking and happy new year,


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
