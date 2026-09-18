Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAACEC982D7
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 19:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1p1upEa6bEEmYXuT8dw6wq8lxfjF/7VXgc2zBNI2bQ=; b=RKwL9cCVlpZzj4
	aPYB7gJv7hw+qliIJCqMUoAI6st1BPSzm7hM8Ersp3Kz7/ejnXCCxt6qrktg8WBbl37MKahmi35ES
	5I5agplJMk3lfnfxS05YJT2SKTA0n2fm2WHO94joky5h1PT63DJLaLLCWxrcDnaugpmSfZBYbe/Qi
	1DvO6nUOXn3XbkP/RvMs5my+kgy7Yjnp6/d10fc1RA3yWlPDZLrSSV+KnwmxullKoyi2FoHA66TiW
	5CeZIBuWuCrVgWAXpqIwI6xh1nsEL6oMnZXc7oV/eOfBAm544zg0xu8z/ukdEV80RxFL0/gXOVGLJ
	RNsH6pCGvFQOkEV4ePcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ecQ-0000000FRxM-32we;
	Fri, 18 Sep 2026 19:51:34 +0000
Received: from mail.avm.de ([2001:bf0:244:244::119])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ecN-0000000FRwD-1zMr;
	Fri, 18 Sep 2026 19:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1789761087; bh=leG1surbbAGzFqImsj1nRlYADVAoFUfkGP9usQfU0ZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CwUTTwfQ0nDfM8KmKEGWxW3N9BGzebJ7oxpcse/seHt1EanTZdQmQsCRUSPmw+40W
	 WlAtsMpEXNVrU77mdkPu6WvEobutBsQvh9ZoOMQjhKEBDrFLZp/pyZy7amGwaHBqUX
	 h/f9FtMXnzpRuanVqUGDUlA2NAqPev4jpkSzX+gywfZoneCagdfhwi/nitq1v0s8Kr
	 4P+SuZ1vWe1+VMnamkZN9HQmcXD/7JQkY13HyBLC4hMeS8Y8THgYzPyM1uzRlvcmQR
	 VxRy+V8I9xw3dIh5udQWYQqkAAA9/EYJiwjcs9lLCoxMH6ail+PCTL8XDeIIKIsQ+2
	 7AaSZLQoGXL+Q==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6aad963f-03d5-7f0000032729-7f000001a58a-1
	for <multiple-recipients>; Fri, 18 Sep 2026 21:51:27 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri, 18 Sep 2026 21:51:27 +0200 (CEST)
Date: Fri, 18 Sep 2026 21:51:26 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Kees Cook <kees@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 08/20] kbuild: cache list, composite object state per
 object
Message-ID: <20260918-godlike-devious-perch-707bf6@l-nschier-aarch64>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-8-9ecf4163ff36@kernel.org>
 <202609171110.438BC7477A@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202609171110.438BC7477A@keescook>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1789761087-71FB9EF9-5D565A0E/0/0
X-purgate-type: clean
X-purgate-size: 512
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-02  mail-id: E2AD4A0120  external: no
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_125131_665449_961104A5 
X-CRM114-Status: GOOD (  11.95  )
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

On Thu, Sep 17, 2026 at 11:11:41AM -0700, Kees Cook wrote:
> On Thu, Sep 17, 2026 at 05:06:18PM +0100, Lorenzo Stoakes (ARM) wrote:
> > Fix the issue by caching this data and looking it up instead of getting it
> > over and over again.
> 
> Nit: I would describe this as "calculate these once". It _is_ caching,
> but I think with Makefiles there is an implication the "caching" means
> "write to disk". But maybe that's just me.

+1

Reviewed-by: Nicolas Schier <n.schier@fritz.com>

-- 
Nicolas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
