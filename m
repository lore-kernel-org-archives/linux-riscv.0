Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCDEC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jul 2022 12:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uituVm/IbcrzypL/ZZZ9y5R0kVwaEXtK2DtWQzEu05w=; b=VW8QquohXXJeYr
	Hk7YNtclHTkLZJ9JM+a3dQB8RYH6oHtZ5bW47AhpZG9iRZqgyx0wyyS+4PFa7Pq52bJ1kh9/bQADH
	q+Ih/3n0XHClJLkrXPqA0gIjbMbI6jWN8odIM/EBhEmvM8qxv/RWt475/N29z3okPEZRLLkIcMZc0
	bIOXww1mB5fT5K0QzEQ7//Ijf34uKwAY3Gr/WzZE5uqfVudUbal2yUYy9qx6u6B7iZpFRhOIOxksu
	LNNdbAkMx3OmHbXQ5Vz+5Mcs9qXLVvlQkQFOoKEjG/w+PzbN4IMqW70gfK8ZxA8gkQOJ2jnF2CP8A
	S0/2is31MhUmR9ZZtQKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCh7z-00G41U-7A; Sat, 16 Jul 2022 12:42:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCh7n-00G3vf-Ni; Sat, 16 Jul 2022 12:42:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 49E6DB80022;
	Sat, 16 Jul 2022 12:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6CBCC34114;
	Sat, 16 Jul 2022 12:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657975340;
	bh=HjF+NeyLSXs/BPREprBA9T9P63b0wfvdyRWiqF26LnM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u23P2EU6qRL1vu6U1ohiYHNRckhBNC8KYLKdsiszyMvWP2H18PzeER3z0ZoCqs8Oz
	 jcDv58i75lMPxVsyThQIDpuusbS1ggqazOvkBjc0XIBMWOOCt6FhnBOHk0SQrwKruJ
	 XSo7j0jgJemcDPs9KTaC7peucwxSOMt4rJMAHkA5uwdtU7P3TVe7D9jWyfRcSJNhkk
	 ZBSZAiI0ucFmL1fK5Dskz6B94ZFS2WZrK5KXL25yE+Q8WIfgxDRTt01tLNXdu4Q7N8
	 DZobomePyEVsHwva8L8DkFKlH7VjnXfoKcEaNJxI9vUeO+aItFS6E/0zfWyfDmlOhH
	 6F5kuracHfOdw==
From: Conor Dooley <conor@kernel.org>
To: ojeda@kernel.org
Cc: gregkh@linuxfoundation.org,
	jarkko@kernel.org,
	kunit-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	live-patching@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	torvalds@linux-foundation.org
Subject: Re: [PATCH v7 00/25] Rust support
Date: Sat, 16 Jul 2022 13:42:14 +0100
Message-Id: <20220716124214.329949-1-conor@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220523020209.11810-1-ojeda@kernel.org>
References: <20220523020209.11810-1-ojeda@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_054224_095436_3C2BB416 
X-CRM114-Status: GOOD (  11.23  )
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

Hey,

Maybe I am just missing something blatantly obvious here, but trying
to build rust support in -next fails for me. I am using ClangBuiltLinux
clang version 15.0.0 5b0788fef86ed7008a11f6ee19b9d86d42b6fcfa and LLD
15.0.0. Is it just expected that building -next with rust support is
not a good idea?
My defconfig is the default RISC-V one plus:
CONFIG_RUST=y
CONFIG_SAMPLES=y
CONFIG_SAMPLES_RUST=y
CONFIG_SAMPLE_RUST_MINIMAL=y

Thanks,
Conor.

Fail log:
  UPD     rust/target.json
  BINDGEN rust/bindings_generated.rs
  BINDGEN rust/bindings_helpers_generated.rs
  RUSTC L rust/core.o
  EXPORTS rust/exports_core_generated.h
  RUSTC P rust/libmacros.so
  RUSTC L rust/compiler_builtins.o
  RUSTC L rust/alloc.o
  RUSTC L rust/build_error.o
  EXPORTS rust/exports_alloc_generated.h
  RUSTC L rust/kernel.o
error[E0428]: the name `maple_enode` is defined multiple times
     --> linux/rust/bindings_generated.rs:18009:1
      |
18006 | pub struct maple_enode {
      | ---------------------- previous definition of the type `maple_enode` here
...
18009 | pub type maple_enode = *mut maple_enode;
      | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `maple_enode` redefined here
      |
      = note: `maple_enode` must be defined only once in the type namespace of this module

error[E0428]: the name `maple_pnode` is defined multiple times
     --> linux/rust/bindings_generated.rs:18015:1
      |
18012 | pub struct maple_pnode {
      | ---------------------- previous definition of the type `maple_pnode` here
...
18015 | pub type maple_pnode = *mut maple_pnode;
      | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `maple_pnode` redefined here
      |
      = note: `maple_pnode` must be defined only once in the type namespace of this module

error[E0391]: cycle detected when expanding type alias `bindings::bindings_raw::maple_pnode`
     --> linux/rust/bindings_generated.rs:18015:29
      |
18015 | pub type maple_pnode = *mut maple_pnode;
      |                             ^^^^^^^^^^^
      |
      = note: ...which immediately requires expanding type alias `bindings::bindings_raw::maple_pnode` again
      = note: type aliases cannot be recursive
      = help: consider using a struct, enum, or union instead to break the cycle
      = help: see <https://doc.rust-lang.org/reference/types.html#recursive-types> for more information
note: cycle used when computing type of `bindings::bindings_raw::maple_range_64::parent`
     --> linux/rust/bindings_generated.rs:18058:22
      |
18058 |     pub parent: *mut maple_pnode,
      |                      ^^^^^^^^^^^

error[E0391]: cycle detected when expanding type alias `bindings::bindings_raw::maple_enode`
     --> linux/rust/bindings_generated.rs:18009:29
      |
18009 | pub type maple_enode = *mut maple_enode;
      |                             ^^^^^^^^^^^
      |
      = note: ...which immediately requires expanding type alias `bindings::bindings_raw::maple_enode` again
      = note: type aliases cannot be recursive
      = help: consider using a struct, enum, or union instead to break the cycle
      = help: see <https://doc.rust-lang.org/reference/types.html#recursive-types> for more information
note: cycle used when computing type of `bindings::bindings_raw::maple_topiary::next`
     --> linux/rust/bindings_generated.rs:18340:20
      |
18340 |     pub next: *mut maple_enode,
      |                    ^^^^^^^^^^^

error[E0117]: only traits defined in the current crate can be implemented for arbitrary types
     --> linux/rust/bindings_generated.rs:18005:10
      |
18005 | #[derive(Copy, Clone)]
      |          ^^^^
      |          |
      |          impl doesn't use only types from inside the current crate
      |          `*mut [type error]` is not defined in the current crate
      |
      = note: define and implement a trait or new type instead
      = note: this error originates in the derive macro `Copy` (in Nightly builds, run with -Z macro-backtrace for more info)

error[E0117]: only traits defined in the current crate can be implemented for arbitrary types
     --> linux/rust/bindings_generated.rs:18011:10
      |
18011 | #[derive(Copy, Clone)]
      |          ^^^^
      |          |
      |          impl doesn't use only types from inside the current crate
      |          `*mut [type error]` is not defined in the current crate
      |
      = note: define and implement a trait or new type instead
      = note: this error originates in the derive macro `Copy` (in Nightly builds, run with -Z macro-backtrace for more info)

error[E0117]: only traits defined in the current crate can be implemented for arbitrary types
     --> linux/rust/bindings_generated.rs:18005:16
      |
18005 | #[derive(Copy, Clone)]
      |                ^^^^^
      |                |
      |                impl doesn't use only types from inside the current crate
      |                `*mut [type error]` is not defined in the current crate
      |
      = note: define and implement a trait or new type instead
      = note: this error originates in the derive macro `Clone` (in Nightly builds, run with -Z macro-backtrace for more info)

error[E0117]: only traits defined in the current crate can be implemented for arbitrary types
     --> linux/rust/bindings_generated.rs:18011:16
      |
18011 | #[derive(Copy, Clone)]
      |                ^^^^^
      |                |
      |                impl doesn't use only types from inside the current crate
      |                `*mut [type error]` is not defined in the current crate
      |
      = note: define and implement a trait or new type instead
      = note: this error originates in the derive macro `Clone` (in Nightly builds, run with -Z macro-backtrace for more info)

error: aborting due to 8 previous errors

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
