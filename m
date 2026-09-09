Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C0BC79FB7
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 19:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8x3ES1AcDABFsZ2lPYNx9Yxs+jolXdMf6HYMVKfMCY=; b=tJCTqv6oUAZ4Ma
	dLSUIEaxN7XqBv2CH5y/oJwL+DIg0u+c04Wo128Gk9WIeb73DdRZJ770uF6Cp7y7PpHaobiMNAMwb
	VWsE5yxWnbaXTCKHgda0IwF6wnD6/CdkEUJ4la4jUQHl1TPpWItZ3l6W1qIzmch0fI2nKkanZz+ZJ
	lG6oEX5jioSSt+KOFKSHxeFI1fLdYTDWjJFayZF35Wyzspd5RI/fRJ1kJxdJ4oXqpf/uoL3Xd0Trk
	bcGgCpanWkKk0lkM4KzFRCyIbDxadyb18E5Fjh5ccDajdJEaMch+uD5jgGNyq2ZKRuv5XbQ7Ebnfd
	DGzsyYQKx3xc0ZaYzkGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4O7r-0000000CjmU-2eJa;
	Wed, 09 Sep 2026 19:38:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4O7q-0000000Cjkf-19dd
	for linux-riscv@bombadil.infradead.org;
	Wed, 09 Sep 2026 19:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=; b=jr8hBJShDSsbAEeUpEAUnpPoVg
	l3mWHA0r7c94zZvvnfOWLtsl104FS4Mo8VrKBnW08jerceN7A1o9cWRk8rT6bFnFx+eMsHVxr4rW9
	Y5EfefPysjVZ5PWRCqnFxr4SOrArjVvW2D05Fx4Y7zPkjdwOITsD7QIkLLQz3EsWkCP7Yf7ojsuMI
	Nh45G4rWk+bagFAa0K0/HgDQlkFtwS79W5RVYN/jEWemCz04+fAo3Gg2diJgK72N/bmU+dQPxGQ3L
	c2vuObDElPjNaCtDEaRfJv+RapIk87OaaxwVFjkmBk4PcpiCtrJFiFhGuIQHKIPPRIHYIixhkB7dY
	5fMKRY7A==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4O7n-00000001bmT-2X3w
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 19:38:29 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39666bed443so1574785a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 12:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788982705; cv=none;
        d=google.com; s=arc-20260327;
        b=QhmRzChgrx8/4micSegjGtgu9Ni19bOAY2ZZomZRULnmXVGggpfThfKu2tSzOCDMu+
         O4wn2Ng5BcEueHZekBxpM1tofsAe488QdptWWaPcxcfXkwcxWkXmd8lSf3wdyKAlfu3C
         J+vpgwfsjnpMTPVLdJ8b7z/rJaY3CbMGfZJKFlV7ykbh5ZeOp5J+gn0dE5Y2H68+hatF
         TPR3efVXCpOZmCmhR7s4bHStVH9NmeBcJ+lin4g1pmFq7OmkWWUabXNdTkTIwkPbi/Xf
         IcuYj9ADzI1z9oSA5ARSsh4ixfAb+9t8rFsvidktO+D7GjPTBH/11qWXFAuyjBCKlPAD
         HVpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
        fh=l7nX/L/EmAjt7YhRIKevKSTG5fGbN2yQAKghvx+Y+8g=;
        b=OJsE0GbcNAa+yTi8nxXIu7TvtXEnMJHAQTqu19PaD7P4wDFusOGEGVAM7XxJXfa23C
         Sa0rvKhTLSJnEQ0/Ch1BGz73+BPaURFVPU4t2AR+MNVcJBt7IgmQcq+utwQvT4wpsYmk
         o+fJOhaEvLhGXMmnG1+A4JU8wla2BmvqPsK80XprrIYxX+nnQEEo7Vh1LKDq5KAwEWh1
         RUnYgR9Eyf9mhJbsM4yW3VN0vtN3WdnzXiwY3eNKgePOQ6g3cYStsZoMA1v9/3IaqiQt
         KOTmwR0aljbL1vvsBqLMhsTEp0HF8AyKRCGL9u0iVNx97eF1cG6No4yj6aCKci7mKYX9
         5cZA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982705; x=1789587505; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
        b=oQ/42/TKaEJpG8HsR9rWP6oREz+V8DxDp73UeBzl+eB18br57uJp2//LH3Z8H20fG2
         MmgzBluFKJYtp+fxifJ86uyt9Ddhe2YzBAutI+fZpR/7oPtun15NVv7wajZQJPlBSvPQ
         3b8jrwyiEJaWSPqhG4mQ9vE/O2mxX0JKrU+XoAwjse0wutacomQnC0i+bils4wpbv+aB
         xUKcRohu7OMOSvKV6aEJJkVjxsxrhwKGK7J0ndkuqUw4eUZojV/e6WJGAPEjx/o4QBt0
         4Bbmpx1xgjL1vgUqe8AIYx9A9Zz42/wTHxmpwdnxNwwOPQGm3RnTkq+H7DOsOM/xa4wf
         j2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982705; x=1789587505;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
        b=b/41ql2ClSIU5Apy5/2CfocT92cO/odTEvargI6sK0mK8EKgxj/VjK4FZ3UgJ+UWhe
         aNGe7W/ZwrzaxlJZvHKagxa3D1CKfFi9akCjb13KKE8O2Vn0jV2CIcAqfpjMQcezPn65
         fl05EQiY/Sk2RDIws/D0zltGC7nE8kWUqx31L3wKvxoCCIbXa0WLPmz0tL7KJabFL7/l
         fA1UxMq+JDQoxuIgi8EetrDdCX+SSWgT9gM6bnJBnrklGSHepcx6U2Hp0Lk0uyUcDGVX
         49rd7poTgMccr59HhVcx91see8fzz9rlxH2GuHH4I2ORldg1szLKv1JaaSzFOUcFppv+
         gWPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMoBx0mqZjFssuzb6EmxrCnLxl8o8Z0F8bWzYMkJQqAyboUDW4jFlnoqbSNuFGfEiKvoWN8+jx0ztUfA==@lists.infradead.org
X-Gm-Message-State: AFuF++lTeQS/4ty156V2OlLTWwix1YObWzP821mNPBll96sPiVMaAFob
	RiUiKv4gjhAvMJFM5awhYm92m8RwaUVYmdalntd3/6DYibYxpMLarXOnomD0fZF+1H6rPISwuAf
	RkGZE78VQ+6Xq25j7V+d/Czisa4DIuwQ=
X-Gm-Gg: AYBFou3xMrifdZG2NHPsxpATZXa81dTUmu7WRQgSkzrHDzXolUqI65wKhBpu0WzWsIm
	AyX7nwlBGagRz9yL0feuphh/EJDR9ZKofO/EeCoesuYQ4pd4Slocy68xs+Kt9ltG4N2u+jwZ2I6
	Uqk0A8uWFVJhnlJkxNQMK2teDLxEdNo5RbMyfZg/4AeDbEveARQBycb3OZVr+dmD5lGaw9cz8wb
	wZd++K1hTZMBx2L3vLii0npD1e0ox5jjkN8RGQwojKWVtWG/0KA43B2X3BvYbuL88/5h8S7SUk8
	rMWYj6dsHNQyHJiUnNDryLtygWLehkvd12ETAYpnNf0XqOxnRbPEaQxrd59Z0yu5G2Ww+Kldfn1
	tdBQ9dsOodHwylPiN+CbFT+KuiHz2WnZD0Jn39zkyYUA1hFhlDLXTGYsSF/w36gXFtOyP6PXK4h
	/q69PQS4dL9u57dkYS1YEwjrCASnnK7U2+Swmab9dpezzzwOLjhdE=
X-Received: by 2002:a17:90b:3fcc:b0:39b:3505:c72f with SMTP id
 98e67ed59e1d1-39d77b83048mr824934a91.6.1788982705356; Wed, 09 Sep 2026
 12:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
 <20260908-vdso-absolute-reloc-v5-12-3a93791af1cf@linutronix.de>
 <20260908071911.GU4120091@noisy.programming.kicks-ass.net> <ABBC0C50-847F-406A-B426-55D0C2BE15EA@zytor.com>
In-Reply-To: <ABBC0C50-847F-406A-B426-55D0C2BE15EA@zytor.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Sep 2026 21:38:11 +0200
X-Gm-Features: AcwNN1V9A4D3jn7pum7crGv8bcA9jfLyy60O95H9hOe-jZGhQ7AzCwKSAv7z5Dg
Message-ID: <CANiq72=T1487Y7TpAa4c2eTJFMLHoe5Qc7+tRkbkmvrDjfmuvw@mail.gmail.com>
Subject: Re: [PATCH v5 12/24] vdso: Add the vdsocheck tool
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Jan Stancek <jstancek@redhat.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_203827_783573_71599440 
X-CRM114-Status: UNSURE (   9.11  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBTZXAgOSwgMjAyNiBhdCA5OjMz4oCvUE0gSC4gUGV0ZXIgQW52aW4gPGhwYUB6eXRv
ci5jb20+IHdyb3RlOgo+Cj4gSXQgd2FzIGdvaW5nIHRvIGhhcHBlbiwgYW5kIG5vdyB3ZSdsbCBo
YXZlIHRvIHN1ZmZlciB0aGUgaW5zdGFiaWxpdHkgb2YgcnVzdC4uLgoKV2hhdCBpbnN0YWJpbGl0
eT8KCkNoZWVycywKTWlndWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
