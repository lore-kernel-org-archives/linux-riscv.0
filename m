Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA76C79FB7
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 19:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QeqcAA5Q8vm0dwixBOzgiwdFIDN2OSmdBjBJ7pGtmrw=; b=ZDPyTntsFh7dy3
	SdUSgGyFh2LadjkqWr5v/WEDoDwJxtqWJpQmvkWFsQSyDkWuReHQkRQ49wjU05N52lf2UL9pqNX4x
	BX3sb/PcVOpbotNBLo7621xYLfh3215xJbya/MZk59DomvfPZ1GLZuP/zZchKd+/CdJ2Q5DRYzAjd
	M5DSJQ5SUy0/P+cUwPUHMmNmLEByaj8gavRBRRnWoDIz9qX/CFWN6CRf7sjighTk6jVtJXfS+H9Ry
	nH7EWoqWGPNQhR88LIarhc8MdaSNw6c+myznVCbMsAUq/eniOnnhHbr5DSk80J8KTHZg6Kzrb8aM1
	zpb77YGMIgJKML91k8Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4OGi-0000000Cl94-29La;
	Wed, 09 Sep 2026 19:47:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4OGg-0000000Cl8s-15NM;
	Wed, 09 Sep 2026 19:47:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5989143BAC;
	Wed,  9 Sep 2026 19:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DEF51F000FF;
	Wed,  9 Sep 2026 19:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788983257;
	bh=/DdlRrwOvlulNXt5vfNVhc9pESgkmxnCKefmHG9DdJg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=YjJs8ghS7pquI02zgxgnqAZpy/OVin7jboQXmQ0wY8onfmY2YEyGG7Sfzm4c2sOKM
	 rFDdcfElKGAxHRqNc+rinp7nJ+wCQH6Vb95vh58wLPXQ1odCWLJe04eACoTuFioont
	 zxSQ1pjZiow+eBiaWGVjuLRNlyCqvVDssZorBA3p/x8PNoIBRFKh/dU6Q6+ZawpS3r
	 lhuW7j1uGUqIdJYaxaykmJ8wFqoefavHECQtZEgHqhDLwYbPniAo0HZz+g6mbVHRaj
	 w5XMpYKW/zCEN+2X0rTQTI0hDVUrNcaXMxZuuOvRtS/WrwzpVi+Hzc80KvPGGEeBUd
	 k0oBYKKL1GDJw==
MIME-Version: 1.0
Subject: Re: [PATCH 02/23] scripts/mksysmap: fix escape of '$' in the __pi_
 pattern
From: Nicolas Schier <nsc@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260908-build-speedup-v1-2-5dc1ac01672d@kernel.org>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-2-5dc1ac01672d@kernel.org>
Date: Wed, 09 Sep 2026 21:47:18 +0200
Message-Id: <178898323844.67740.17554063026930604280.b4-review@b4>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=openpgp-sha256; l=1274; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=dIsgkmHT8CySWCVBXJdGNVcXGxhoYdLBOKFpSuXewxk=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqobfOSh+e4lMe1fSWxlaLZhgOIgxYQusA7GVb3
 GP6qj8CfVqJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCaqG3zgAKCRAHUgpwFiYS
 afLaEACGk6ii8eNuSpScPWy+cfy7cb+OysRMgJJIEJgv+RUDlBhsNCZMJ0y3jSN22aiyotenGiC
 6dISnDxnLNFRSCn+dezIxUZGsgHvpEoCcYaGQrDKopNK0iI+Q1JNseZvEewdh65F9BiKfGq8bjW
 NNU5w//uxMjUZio2jAqRYvUVZgA3CboN4BwkNCnyWXRsHTiV+BSmZ3elMU6Lx2OhHkcnq4GO3Jz
 PuePAzJrl03LS0S9fq35OcUY9BdaINj9nFKkpUSvi/oNfqEGbexhkxo80Mcmx/METfdmWjboEhw
 25NRet1wJQxvUMLtwBxRqTEIyaJX7iadh7RKo2ok5B9alZsTJOtZTbMT+OTF9T4NC5r2p7sH7Rb
 bpz8Oy9RnblisbMXRDpYqTn/FXMcXpUzE20I09YS1u+/7R48vh8FyEQMDPJSME0JjXH8MR4l8ic
 McJi0KCMdQnNvSCLHj7sDYE18ldgEJS77qaLqPs7TvY7ip2BZ7QAHF8a9Mpx24UrocN4DEdStz/
 o2eTfnkQvDpiqoyY206IS3pajNvQUy0BGV/fN4sVRxRpBXM150sNwQKBLglqQ429SLzS71wWA2L
 IK5SrYGQn3q6MF7gHMUrmlheBkeAKu9KVv05Hz18M1wrdjck2Ocihhi5ftjRNuwmQDdhDg/etb9
 LDbX9wIG+of9pWg==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F
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

> Commit b18b047002b7 ("kbuild: change scripts/mksysmap into sed script")
> converted scripts/mksysmap from a shell script to a sed script.
> 
> However an error was made - escaping of '$' required \\ escaping in shell
> but only \ in a sed script.
> 
> This was mostly corrected in commit 7a6c355b55c0 ("scripts/mksysmap: Fix
> escape chars '$'"), but this fix missed arm64 PIE namespace local symbols
> like __pi_$x and __pi_$d which appear in System.mapand /proc/kallsyms:
> 
> $ grep __pi_\\$ /proc/kallsyms | sort -u
> 0000000000000000 d __pi_$d
> 0000000000000000 t __pi_$x
> 
> Fix the escaping properly.
> 
> Fixes: b18b047002b7 ("kbuild: change scripts/mksysmap into sed script")
> 
> No measurable change in build time.
> 
> Assisted-by: LLM
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> diff --git a/scripts/mksysmap b/scripts/mksysmap
> index 56a8b8bbdb37..856b26ba2ac0 100755
> --- a/scripts/mksysmap
> +++ b/scripts/mksysmap
> @@ -35,7 +35,7 @@
>  / __efistub_/d
>  
>  # arm64 local symbols in PIE namespace
> -/ __pi_\\$/d
> +/ __pi_\$/d
>  / __pi_\.L/d
>  
>  # arm64 local symbols in non-VHE KVM namespace

(Move 'Fixes:' to trailer block)

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
