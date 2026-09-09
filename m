Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810EBC79FB7
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 15:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tOQlUafp36dfjlqvjCLFLKxNyTI4WeMhOmwdpK4nMZA=; b=4o0UX1G3SSTVXR
	kRp/6wR2Q9/gd3Dck7hJwTlTcaWTmdIB9i6ZG82BLNPwPrqdTAHoOVJ8NfoZWTjgcb/MBWBUoDHYZ
	VwHk6sO4BJXxGgC94UAK90/69aT6Tt5v3/UqmtL4kQsnY9w1KTz/iZljIJp2IptNkn0t/YOU2Qv0r
	kfAsnkwdlT1gDF6Gk4M6PbDIHMW0gxjy72Uvt8u+9J2dYUYJYK1vDjpWv8woq2pOJZCPs4ySnOo8k
	FxxN6y08XXre8Pq1S26enMP/W9lveOrD0ydJqvchRQp7VAn5pUi2vE2dm+BKC3SGtD3NawO9386Vg
	ximocRCuQIa7Ey3/UQ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KRx-0000000CD3l-0tRM;
	Wed, 09 Sep 2026 15:43:01 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KRu-0000000CD2P-2D1F
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 15:42:59 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a996c8adf3so1259977a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 08:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788968576; x=1789573376; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7MDRo1IEz0/ztB5k2AgA6IiU/moC5VF/pQ54TqLA70=;
        b=GggvnGk/9JGDSLWnHaSmnlGNCxZWNvb6Y+sX8ZrNrWPB74QVIHXbrfJ3oXEIQEQ8XU
         OIjEONBGcxd2n1IDVzt4OoSsm71DhHeN+w+XttnDV1dpIkM2QqDsiDKzcLq1xFleIEed
         TVkQfQ2c+JBFhRyMmWtGyj58tizgfX9EZDyqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968576; x=1789573376;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B7MDRo1IEz0/ztB5k2AgA6IiU/moC5VF/pQ54TqLA70=;
        b=Hd+1yNfp+V2OBWn4YAGhqUvcqm3goa4rsfZ9x3ODJC3eBBXnpFsbyZ5P9Cvy+V+4Gr
         Kq7VXyeYSBuHB2OBmis3zM9zPn+HP2uJXDiwGNG55xBMLPwnbGwxOrOi8/zXMQ6QsoFY
         c2w4y7SkHLm5oKZYbATsfOua8twcwkjocFWKJQkI3kRV+yEd/LD0MlRRo8GvfRD6WC9F
         vwlrvoYOBUhJ2R/Hh7cM6hG52LKmRzLDkChAQtEsZXjHR9ggF7VIY1aeRYnkdpLucDw7
         PW38exfpuZo2JRxSbLAgKSTql2tuRvzCPa85ie+miybw7yA1G6ePE5myJNYIl44s2+LS
         +8oA==
X-Forwarded-Encrypted: i=1; AKwUvBy0BIxPKFK+cwdW8KHiLONWF4N7oqFOceSgcpZlRe+LJ8J78DDSVuQjRhF6/mD+kDIRFYgtCTTDOQY0pg==@lists.infradead.org
X-Gm-Message-State: AFuF++mwlP5DY2hHRAoVK62c8SHAHzSK9A/jjclmW72aSFZ7riPiZFUP
	maQmrCijftqMFQ8rXJG6pdrj3wS76V98JoJ+lJVbNFcWZaIMuETbRvp6xQyEeJ5vjhkQhAoWJAf
	WSMpstlOJWytq
X-Gm-Gg: AYBFou3+NEwx20AZNkoOXuAFita7JJ1gLitSowSoti31DhYeLe2NoaOa0ReUMcxNsdD
	b3mMvpCqCi4oNWL3Qk+Y1x6OMQDSdmQPpMBKOQ2BXAhumfoameq1W3ne8SzpGJdK7eyo51sQY+N
	vcR15Fe1N86JsQzOJa3mOPnz7d9iHhFIzEvUnzViqbet31xAJWYCPqkv7JQM4Xw9OljPAwWcaXB
	paqITVhhI2jtaMkVc2EZtZibIBHxN/uOl6So3FFCQizO2/Ts3wkcV1FrOA0AgKAGruTojhFJLrn
	mdDFP6e4RsObUj0jfqjoFbs3IjJ47jhKo/WW/Ljlf/PgNCrAeixKHtyIhkZccJ47itvV3Is77G7
	cTj+FIKQwVXqoshOOiPYVts5E4+b9CyGaP0jF56W0fJWiygNj5fMfey29CiWT08/LwnEz7YSVNc
	iNqTxEjuAe3L6cUNAsLLixjyG1t9RxIxoN2UVxx44+R+F7oOgoP+9YJaekiySMWBTuSI+ahHptx
	pB1Dn+QREZ32YTTE+9GCQtYwNS2Sg==
X-Received: by 2002:a05:6402:1f46:b0:6a7:f18b:a309 with SMTP id 4fb4d7f45d1cf-6a98e02de89mr4986326a12.16.1788968576416;
        Wed, 09 Sep 2026 08:42:56 -0700 (PDT)
Received: from mail-ed2-x10.google.com (mail-ed2-x10.google.com. [2a00:1450:4864:33::10])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9857ce120sm1811205a12.4.2026.09.09.08.42.56
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:42:56 -0700 (PDT)
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae45so2053135a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 08:42:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz2S6AhiVjTxqJcTDmjRiSXNV2420hAaqpq2Mm6K8kjnvf9NJlFG4DtiuoJ2a6yuZ1LspFxTTi4sxRe6w==@lists.infradead.org
X-Received: by 2002:a05:6402:3817:b0:6a6:58e:f84b with SMTP id
 4fb4d7f45d1cf-6a98dfd77b1mr5256449a12.9.1788968246832; Wed, 09 Sep 2026
 08:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 08:37:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wieaheq8rXSps3xRZpNNMQMEj9BH5gU+Dh4q_ZgokO51Q@mail.gmail.com>
X-Gm-Features: AcwNN1XKEJS_S8eITIntw19v_mcHyut1QfPlZfjowWaI1qZq5Mivgkqwhzm7f_s
Message-ID: <CAHk-=wieaheq8rXSps3xRZpNNMQMEj9BH5gU+Dh4q_ZgokO51Q@mail.gmail.com>
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
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
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_084258_589379_E70DDE29 
X-CRM114-Status: GOOD (  14.83  )
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

On Tue, 8 Sept 2026 at 13:55, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> A typical kernel build consists of a frustratingly large amount of time

.. you're preaching to the choir.

>                 == allmodconfig FULL build ==
>
>                         before    after     delta
>                       ----------------------------------
> Threadripper, gcc       345.3s   275.2s    -70.1s (-20%)

Well, that's certainly very encouraging. We should do this. I sent out
some emails as just reactions to individual patches, but I have no
numbers to back any of those emails up, and I never actually applied
this series to my tree - they were all based on reading the patches
themselves.

That said:

> An LLM was used to first determine where the bottlenecks were then to
> figure out how to improve them.
>
> It generated a lot of code, much of it hideous.

This made me scared to look at the patches originally, and I held off
in fear that the patches would be horrible and this build time
improvement would be hugely controversial garbage code.

But:

> I extensively audited and rewrote a lot of it, and heavily edited commit
> messages, the cover letter and comments.

None of the patches look at all horrible to me. You clearly excised
the hideous parts. All of my reactions were of the type "this could
probably be taken _further_" rather than me throwing my hands up in
disgust.

So the Rust parallelism thing clearly isn't ready based on feedback
from that quarter, but the rest looked safe and innocuous. I'm all for
merging this, although it should obviously go in through the right
channels. Mostly the kbuild tree, although some of it clearly would be
other cases - the objtool change in particular is fairly substantial
and needsobjtool people to approve. It didn't look all that
contentious, but still..

Anyway, I'd love for this all to go in. Build times are a pet peeve of mine.

              Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
