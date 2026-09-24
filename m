Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074EAC9831E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 13:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3PKCII7z4tSw2Q3MwlgAdSoZ+3o98JvzbOQM2bdjo4o=; b=MOTRXkEhlSyz7I
	LNY1+fYJhYAcrHwv9dBueSLhYsHsJA8737RqG9AwOxMHLxoaCxL/oUGOxBaOE+3WSa+ZJM7sWz14m
	+0ytFp0gFSc4qON+KmJX/pbvKRGhmRwTpq654uZx/OUk8a4ivf7Pzes3Ry/1vwuLXsAbZN2XWi2+V
	XBr6F/TPN5FINjbUBlv8vSkhrGYQoA1WWK2ovEg9q0duJ823jIjVtt4jSfHmrMVCTfWGOtstYaBfd
	6yJVyq8LXl0hB1zbWQ+Q4Mh++owc79t5GybQgDlvejlGqf72XafmzCzgcjtd12yEtqq1ivglQMToo
	vDIiZhms0iTpHuNMngIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jl2-0000000B7bV-1fev;
	Thu, 24 Sep 2026 13:45:04 +0000
Received: from mail.avm.de ([212.42.244.119])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jkx-0000000B7ZW-27dK;
	Thu, 24 Sep 2026 13:45:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1790257492; bh=RNrHlkedPxi+Seo64aiciiC5cKPNZrA+d4i/PipmIlg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=Zqlo3F7I9z6odqeWj380ltc1L8l1Y1OdMFIQ8fJGCcL0godj+AMTyZAdgeBzcvddy
	 visMApYsWZFHUl+du/8beS1mqhyyK8ENoIV/CWxsvsCyh4cXW9xX5/jgMeBjt7Okbx
	 0/ooMNq4gemCVy7fVq7GcIWAcjUgfeWkAadYPLTG/JWW8pKKwCcMOYLk1qQeJgLrW8
	 b4tI9uek01mHErbJsLDhOWmma86ZwUu/kuFk/UO41MVhGaC3RTdij6ogY0d2ej8cFn
	 orJV7gvvJ+I19L2+qoEA4l9czaoqgjfie6TZI2lVsYdMBW0eMfXwm6+6RMe9tD03QH
	 luFchOl1IwK2w==
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6ab52954-03d5-7f0000032729-7f000001b242-1
	for <multiple-recipients>; Thu, 24 Sep 2026 15:44:52 +0200
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 24 Sep 2026 15:44:52 +0200 (CEST)
MIME-Version: 1.0
Subject: Re: [PATCH v4 01/22] kbuild: do not allocate .modinfo in vmlinux
From: Nicolas Schier <n.schier@fritz.com>
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
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, 
 linux-hardening@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260923-build-speedup-v4-1-73128809a4a4@kernel.org>
References: <20260923-build-speedup-v4-0-73128809a4a4@kernel.org>
 <20260923-build-speedup-v4-1-73128809a4a4@kernel.org>
Date: Thu, 24 Sep 2026 15:44:48 +0200
Message-Id: <179025748878.4172706.1928342214472255763.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=529; i=n.schier@fritz.com;
 h=from:subject:message-id; bh=RNrHlkedPxi+Seo64aiciiC5cKPNZrA+d4i/PipmIlg=;
 b=owEBbQKS/ZANAwAIAYjGvJyImm24AcsmYgBqtSlSAaAHZSpwz+agR7A4nUL/f+UeSeo3MVlM+
 g0GySzoXvKJAjMEAAEIAB0WIQQO/4WJ63TpgecLpGmIxryciJptuAUCarUpUgAKCRCIxryciJpt
 uLpFD/4jbTD/m855zQY2oXD/P7gI5rKS0e2JEo4CFs/WQ1q0+MoV/WJx2zzT4SnAM6QXyzOFdL8
 N4GjNg6r/k+K/apkYq+ibSeq8HUHeSxbO4sdJRWjLXWSReqCL5kxhgvKohauiasWosm4pin+gdR
 RIwZVezT7eufa+MunXFc3rYHUcBkRsAk5RV5GV/lc9FQdBwdynEkTt0nWX4CiMH/iJh7dYLIYvp
 1DkwLdomrF1bURPaP3rgb3sMMNwDGcgH/51PYGy1Cf7MRvdgqCZcW/HRqcEYzFMZPdCjsJgvkhw
 RUuROmOPYRqcKgbzduQ+SH1njzB9AJeTo5LqhHb7StHjZLRBkVm0tODdImmjW383URt3/Y20UQd
 wjXVi/xxqIrtsJt78RpFk68LZO82/G3bm1fE3d1JDLJmo0l3W+sR7WVzxKK2SH/AK30LuUXRXUJ
 1SaSkqrau/qQNnQ2DyGm2l2l6Wu/gouZrGp1d2hhapMb8D9257v2CnrUEDhBcOh5xYcMlsorNx+
 S9sQuzuLiqpFAu9Wh/aFc04x+KPDGg2QDWA2KG5wWx8FcTJfAFCWTQfQJrEAD7ZcfQichDLYv1+
 r9/isWvL4j22ulU2/eqIEx2pPHPPDl5q61LJm6gQhc9gb53OoYIphIXTYZFxQdVLz+W0FuNgXmW
 64JXl+x4hWlDQJg==
X-Developer-Key: i=n.schier@fritz.com; a=openpgp;
 fpr=7CF67EF8868721AFE53D73FDBDE3A6CC4E333CC8
X-purgate-ID: 149429::1790257492-1CC5EEF9-18159528/0/0
X-purgate-type: clean
X-purgate-size: 531
X-Notice: Whitelisted
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-02  mail-id: 76E62A085A  external: no
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_064459_748516_AE852189 
X-CRM114-Status: UNSURE (   9.43  )
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

On Wed, 23 Sep 2026 18:17:50 +0100, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> Commit 3e86e4d74c04 ("kbuild: keep .modinfo section in vmlinux.unstripped")
> placed MODULE_INFO() strings in the .modinfo section in vmlinux.unstripped,
> however it left the section allocatable, so it gets assigned an address and
> on arm64, arm and riscv, the section is tagged as PT_LOAD.
> 
> This is useless as the data is ultimately stripped anyway.
> 
> [...]

Reviewed-by: Nicolas Schier <n.schier@fritz.com>

-- 
Nicolas


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
