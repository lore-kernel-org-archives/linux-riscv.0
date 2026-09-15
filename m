Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF318C982C4
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 17:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CMrYRgNIlqvgWKICWR6aQY/UHEqJ9huzQzVEBl2KabE=; b=pjj5Lq2O9Jo5tF
	Q5zAcHZ8f77dRsyxTqgghQQpnK/rJ4FRrzQfldX3NR4LDgzsxM/By8Xnu9SllMppOB1iJICqOu3hd
	llTOcw7lZQkrQd8WTfx6puzGVE9NHSP0pMLnugyuqq50V5d4GyfrGfpzU4pEpgxgmCXCzK9vesfDx
	OPiCUETcZUzLnbBtpDYiIdoUkB5x0MC23mxKwIvAzmAgLBQ1extevRg4wW691qlqa5UTl1AsWbXm7
	tRUEV2ELoIYNTZL9X4f4nmoaO1Vwj/HSXDL+pdZWcxI6xZMctEGc+FPaH+h8p+kFvITZfLozm/A6O
	lCcE5zweXOEul1Axb+IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XOG-00000007fXt-0ILG;
	Tue, 15 Sep 2026 17:56:20 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XOB-00000007fWW-3B7M
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 17:56:18 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48431648f33so537572f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 10:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789494973; cv=none;
        d=google.com; s=arc-20260327;
        b=noXl375WZNUNrbeTrGBDJeyo5w176LEVLrZMd9aE/huxPP56TtbnHldg8BZZN+zF1I
         9/L7fVh0NsyiduBFZryE6XVEMNuXNARX3UkwVnNomL962sQJ8/UHtVcYRftQTSlRYkJ/
         TFW3utG/ccC85xtNLh0TA6fb+tTDcxcNiiPzgJjVndv88HCj8hXmM29R7/MtDPlgWrW5
         EPVV6qHfyW4MN7tWW5/MNelw7XqipdpxpIdklzmX9Y+h9D+mMSusjAhgMx1+xkVGonaS
         01e1YXx2+8D+2VmSpJ+mO/3mHD9asJYqTBTT1Jan7l+YBF2IR5lsOwOUMhpuh+PR+IQC
         /LdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GXjIVxCi/wI/JEAgJbDGbjdOXMojQ1soppHskXz6ugY=;
        fh=eWeElGqr06cAtwj/6TqP2gmmv49Zx+KLehPhFAHKA8A=;
        b=s/YINWaH7KQnpjLU/fYGmh3/+Pk0QYtMeBHRM9ZLlUF4NXkmnusHS4Zc4QTBwiyIIl
         nj5F7AjSFl1G9B/kEQ1GKdaCPWCE60RGQ3DHff+0Wd8chEIpZ8m6nRshefgGnjlzhE7T
         jeSJiUkDIv1oVBPZQ3ahhWfNui3NtmZ8dqtA17cTogv+8OfpxtfaQKEN0Yatl1SHQrtd
         IlnT/lCgKCyLV9hWIc6A5ji3w4txCKRiPQVbvRKUsQyK9AJNk311WkFQm+3DEkLYVG3A
         YWjBaWwzcv8wJk1xRe1P7JoLRZfdQmdDUWpvf+Ku2M8Nh07oM08rPj3s4XyFq7hTlZRn
         jzzg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789494973; x=1790099773; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GXjIVxCi/wI/JEAgJbDGbjdOXMojQ1soppHskXz6ugY=;
        b=Jc/5q/Y07KRoifstKQrCwGwCHcQb3gjqX8YclDezjWnUlUKADW68emLekLPZZAiMuX
         PlWIN7dRmWJwJt/3hpm04y01QTkBxQ4jxucfw9z6LX7P7Gl/QWHay1Mge90GpPbIMdTh
         exkwBZRaXK7QoSHgsUuMRCtfDXt5Dq+D2RoXh3MXAEzxPoBv7oHgUaOSoRwjeD7ojTGy
         PkKOa0qS0tYvAe3KMtPZLhQOy+bqy22ipHumV2eRv+DI1PtoNo3PptsmZhkxztlAPq7I
         lRVZVvrr4m7NfSV87L8OFVpfABEoYWmD2OlORV00hixpuktaOBJl7UJc0rWOX9U92NAy
         Rvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494973; x=1790099773;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXjIVxCi/wI/JEAgJbDGbjdOXMojQ1soppHskXz6ugY=;
        b=Ehe6QB7tpJ6Zvw1ybE01X6wBsFSRPUnzRfelW7U6yYcnhCp48WH3t1JwOQ2IVLo0fI
         bcMLe+ezam8mnj1OvKtOmrGg/lfa6EFEg5+YJLqNtrcb5sS/zLQ90h3R/JlCg/MGsfj5
         xtR9u3NoL+urQsLKelf+MGozI835woeZ++1f05cMpbOF7QcTnLJDe1L9/vgWfQvvxkPg
         Pa7Iv0Y378D41k3H+IaDPuzhi05fsoWdtgE3c1VmXKM+zeOxjDPBVnDETBy4dHa5Q7bg
         fN4XkQwOMwEf5evEh/0MEWTFU5y6gfIxBrWRjmadF1XPAlfP1OhaZPExEICbtjwxYMM2
         wHcA==
X-Forwarded-Encrypted: i=1; AKwUvBzvZ+Titl8p7ADwhXkhv2WgJ8L2LspcgYh/GLz+satFfNS3fHRLNWxslrCWPFqCsqmV+UWLr976bQnjCw==@lists.infradead.org
X-Gm-Message-State: AFuF++mqQFKVFErV0j9e/s2Ic0cwJrhDk0x5JcJ6V99T87KycJCoej1X
	fvCqPFJYa9Pyr9GsaIjeXGewnCDfQ3X79wve6id+M5rGwSP9DSqpi1w4essyYs6lQ8mu/RJtDEJ
	WNXL716WLWfXu93XoWfe+Av1Dkbb57L57v9ArVtmh
X-Gm-Gg: AYBFou1PEMnoBwglamJeni26zgHbfbcqYbKDTrUsfAiBX6p5Rr+h1wNLCDbSLCc4hgZ
	Uo0BrNF0nYh3C/E84EYJVV6YuU5G9UBbeEAOvCGQbuK4JUGgWGiZij7AaWbK2C4ENLuFnmDwlFa
	WonBB5iofS7QxISf75efRcnGhq8REdHpRznMVylhFFFxuHYT5UjlrI7Bt1bkBhFhN9Uu6G5CHm4
	sLKDq84L7asUTLvaKw8b1MNxsX+mOQP3ecFYbA/KBMz8IEz8RKEslcC0JBMElLibyWtsVJBzNQ6
	n+yE8LEYvxZsF8V2i71/Y7/DdJp3uMTgu4Ww59/rq4EwPp5Qum+5v6WVN4Qiy911iyzLWeh+bdg
	nTkmH+XXbrywqjtmgLpbMjAc08nTC3JvSqYBjdt9qhs2LVNXIogTkkXgKnXBJiWC2pzE=
X-Received: by 2002:adf:eec3:0:b0:487:13f:4968 with SMTP id
 ffacd0b85a97d-48705b5d792mr5756089f8f.11.1789494972051; Tue, 15 Sep 2026
 10:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-14-39817ec5db23@kernel.org> <202609141056.6AE2C82E@keescook>
 <aqkZvtAKWYf9-1ZW@gremlin> <202609150943.000EC9277@keescook>
In-Reply-To: <202609150943.000EC9277@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 15 Sep 2026 10:56:01 -0700
X-Gm-Features: AcwNN1WPMMWK_d5_qt02ICUH5UNGl72dPPgrM0zv_mQxUiZh6yRKMNR6HBnx31I
Message-ID: <CAKwvOdms6QWc7RMW6hJb3qzgmpK+aw40C7b_h7eG161ie_Y8ZA@mail.gmail.com>
Subject: Re: [PATCH v2 14/21] kbuild: batch module finalisation
To: Kees Cook <kees@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, 
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
X-CRM114-CacheID: sfid-20260915_105617_415955_FAE86C53 
X-CRM114-Status: GOOD (  14.63  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBTZXAgMTUsIDIwMjYgYXQgOTo0OeKAr0FNIEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgU2VwIDE1LCAyMDI2IGF0IDExOjQ0OjAxQU0gKzAxMDAs
IExvcmVuem8gU3RvYWtlcyAoQVJNKSB3cm90ZToKPiA+IE9uIE1vbiwgU2VwIDE0LCAyMDI2IGF0
IDExOjAwOjI3QU0gLTA3MDAsIEtlZXMgQ29vayB3cm90ZToKPiA+ID4gT24gTW9uLCBTZXAgMTQs
IDIwMjYgYXQgMTA6MjI6MTNBTSArMDEwMCwgTG9yZW56byBTdG9ha2VzIChBUk0pIHdyb3RlOgo+
ID4gPiA+IE1vZHVsZSBmaW5hbGlzYXRpb24gb24gYWxsbW9kY29uZmlnIGJ1aWxkcyBjb25zaXN0
cyBvZiBhIGxhcmdlIG51bWJlciBvZgo+ID4gPiA+IHZlcnkgc2hvcnQtbGl2ZWQgam9icywgYW5k
IHRoZSBtYWtlIGpvYiBkaXNwYXRjaGVyIGNhbm5vdCBwb3NzaWJseSBkaXNwYXRjaAo+ID4gPiA+
IGpvYnMgZmFzdCBlbm91Z2guCj4gPiA+Cj4gPiA+IFRoaXMgImNhbm5vdCBwb3NzaWJseSIgc291
bmRzIGxpa2UgYSB3ZWlyZCBMTE0gbGFuZ3VhZ2UgaW50ZW5zaWZpZXIuIEknZAo+ID4KPiA+IEFn
YWluIHRoYXQncyBteSB3cml0aW5nIGFjdHVhbGx5LCBwcm9iYWJseSBiZXN0IHRvIHN0b3AgYXNz
dW1pbmcgTExNIG5vdyA7KQo+Cj4gQXBvbG9naWVzOyB3aGF0ZXZlciB0aGUgb3Bwb3NpdGUgb2Yg
dGhlIFR1cmluZyBUZXN0IGlzLCBJIGhhdmUgZmFpbGVkLgo+IDpQIFRoZSBBSXMgYXJlIHdpbm5p
bmc6IGh1bWFucyBhcmUgc3VzcGljaW91cyBvZiBlYWNoIG90aGVyIG5vdy4gOikKCklzIHRoZXJl
IGEgdGVybSBmb3IgdGhpcyB5ZXQ/ICBDeWxvbiBwYXJhbm9pYT8KCi0tIApUaGFua3MsCn5OaWNr
IERlc2F1bG5pZXJzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
