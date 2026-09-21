Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251C3C982E1
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 12:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3zBbRFVJD9eaFD7lr3AYfIA6oG3/n+whjghAd0LTkgc=; b=dcl9Yzlz7tl6zZ
	GtcUiYj1vnxq3ehd2c8p9u0Sr7rZ4haJW10k+oijvaElnoHQ5dpVLUuNaTzr6WTHSNhbJOC8iZIeq
	87ZJQylvnW5Gucvoht0FBrUZCwzEH2mdVPfPCAEcLxgPkIOoKayZbK4TsYsLYH0IgV6keE7X4XmuN
	2WGyMyuhQOiaCPgrhjj7XI4gzhHGI8UOuX24iERBYwOjm1Di0yuagtNainR094Vd1AmO8XZiQeLvz
	kv3QBpLTRPF7WAWxmmq73a7Q5UCvax9X9jHIIhDgCYptF0wpggqlzKCMrZLUGVGMwY75hYLAi5JfZ
	j87ccEK+DLsRp+g/dT4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cq8-000000020iW-0YPJ;
	Mon, 21 Sep 2026 12:09:44 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cq4-000000020hK-2PVD;
	Mon, 21 Sep 2026 12:09:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789992581; x=1821528581;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=u9UJ5FPD/iawT9BypdKY9UQHnXff5vFR5/his7/VTkk=;
  b=K2+PD1FV+I362niAQixznBK3TG6cEqs6AQouViMPowcEkTJ5TKw777H1
   JMWY17mFM/zl7tzM0X0UYYg7VD9pf80IyggAf6y205+Xt2sHhVZ8sbLnV
   y3emem4Q1ZKvVN+it5tQAEIGrE+rXYZoe2KfLULeLMTWb9TQxhac2vxLG
   BbAnzbgVyH9X0I0CPs9VgDCTV5I6puaId8e3kRZ0/LY+Vett9obEgQ7K/
   IlVCGTFuQFotZ9/QBcNS9+exnHxIZy+7G69z3rvmBy8o8R0+0pV6QqWpy
   mAPmnV4kuzUd1rggtGVfwUN8zohb+A6uDFJA30SaSxYqI1xGMpaIkyOUc
   Q==;
X-CSE-ConnectionGUID: cx/P1+bWQVml6Mcq/vQVBA==
X-CSE-MsgGUID: ipyFgIBzRkmXqQKcRG8qbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="101093382"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="101093382"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 05:09:33 -0700
X-CSE-ConnectionGUID: W0f4H5asSJaS6m7Gt56H4g==
X-CSE-MsgGUID: SYS7McWiRMag8Rx/VxvOaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="271149277"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.180])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 05:09:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Petr Pavlu <petr.pavlu@suse.com>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Alexey
 Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6r?=
 =?utf-8?Q?n?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein
 <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Onur
 =?utf-8?Q?=C3=96zkan?=
 <work@onurozkan.dev>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap
 <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, Jens Axboe
 <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 13/21] modpost: emit module descriptors as assembly
In-Reply-To: <95baacfb-d8d9-4d2f-bc89-592df6f6f8e3@suse.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-13-39817ec5db23@kernel.org>
 <95baacfb-d8d9-4d2f-bc89-592df6f6f8e3@suse.com>
Date: Mon, 21 Sep 2026 15:09:14 +0300
Message-ID: <2f22f2ae7e5ddd8049994aceb2e52e2993f8c6fe@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_050940_623105_8CD0AFCE 
X-CRM114-Status: GOOD (  10.13  )
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

On Mon, 21 Sep 2026, Petr Pavlu <petr.pavlu@suse.com> wrote:
> As a side note, I'm currently working on cleaning up what linux/module.h
> includes. This was also originally motivated by an effort to reduce the
> compilation time of .mod.c files, though cleaning up that header makes
> sense in general, since it is the most explicitly included file in the
> kernel.

You might find this [1] helpful.


BR,
Jani.

[1] https://lore.kernel.org/r/20260915104331.255636-1-jani.nikula@intel.com


-- 
Jani Nikula, Intel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
