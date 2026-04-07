Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9DEFB5175
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 01:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=obwjEXfJpiswVTnsDRPbq9MLgAXrTHwgH2tGCbhMuYs=; b=drsjPtDMl6z6G0
	Cq14/hm8lurBb22CvKz1y2Orz9anvbdBLetft/MHYBDRNMIlrHeXh42Sqv5K9ROhhdIht1aAh48nY
	u8w7fsBIfkBX7sURD32pPCG322PW919vT16hrfmmk5C9/00PqtkKVY747jeuiTW9PzIchITA6huA5
	sDvW7DFVUYDmrZGEa+J2KwiiQiXr+xZmus7cN5OsHQ4EmJxkuN54Ceu355ytsoI6LTJQOND3LUMWN
	lNshXyYGc8czJNNqGa5Uc9hMgbH+Qr6P7Jdq6WuDaU8uVVv3Lzj49q1xAlid6ebjMj0smFvOHp6Wi
	Sa+6vRg3zj3/sAAqX2mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9v2K-00000005hIp-30zH;
	Tue, 07 Apr 2026 01:15:24 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9v2I-00000005hID-2LSN
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 01:15:23 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-12736a0147cso275721c88.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Apr 2026 18:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775524521; cv=none;
        d=google.com; s=arc-20240605;
        b=iSWLuuzTlFU/2juRoplX0gAEvpF3PI4MUYZLcDC8vQWeoRZnu8sPkAkX1PJhrxzDta
         H3amqRXPWdsvWMWb0WnD59OsCIo1ig3EEwtumdtngfWlczvdiFepFsl60X8e1mpWvudy
         91c+ZghslnPmcWXnMO7lU5njaQeXFPNYoztn4H+r80b8cfIhzybMFkrWjmAOYVexe+00
         XnnpPSpTE9NihKk80GZE8XKVEpWriswcWE1EMACDC00j7YIZckVviciKxfgsQLqr7qja
         AyLhTMXeamM6ZPHiUzRP4gcNDbYo5ILBUG/9dV2as7/zRHQxRY93svFs5spTGysa3K2i
         1Icw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        fh=c3k/fmIOJipdMIvzcuaVEY5HtTOe4LyxomRgunh2FmU=;
        b=NOZR07htgneQOuJskyn6FXDn9SGIbIFPCzMIjbnt+zLMouHfp1Ozwjw+HAqlweVm9s
         q+ak2rOKRviBALAShOY0Sf/uCw5PkSnGyOv08P+CcGoLJwXhIaoIpacroo3Qz/H1do2N
         ACa6vyJKoDmYG3/p2AwyhvSel5gbNmdGxOVoDQAqJVJwjh8ZVVMsopXdnj9/1pWjCxXP
         wfXNz0dG5mf19E3kTMx+XRF4t4ELaHoI7nl10GVmK46+MOfdqoEQwfnfexLkFMGpY7bn
         bYsCKWWxkpVhZA+NBeLU/LRBQd630E7HzXNoIjGJHR61vrE1bdaHLSCGS+QXO1f51pAQ
         +uUw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775524521; x=1776129321; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        b=Gxu3tphWluXwFB8Nv9b6WLDCpnsm5QLhCc1EinxEdsPeYtDTSUa4SrdvIImU7qI9Sz
         HH69lnShkjhAQKY4eAJiZfU5k8MikvaiqU//tRIwHvJV/TnvRGEJUTQIw7aZp+gSSNZC
         53XykK3A2KIJhSEluEb6nqtmsxDiZ6Gh1HLwmhEQMr+H+eJxp4wscLcBL6Q4VkO492YI
         Fjnpp/n1MDdEgMihx6jv74+IXmkMMEe1wIH91gxL/AsSY9YO2zwQOhfY8H6njBX5gDwW
         NY+YLWFqmT8b7Fn5QGXxZDrP+8m63U/CNzSaDuXJll2quzeCRrgzII/LmUXle7kcLQ4c
         zfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775524521; x=1776129321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        b=dg1yofiBwGeXTka0gOxeUwO4WN0GuICL8+cWZh5keed8dKBHdFArnED03NSyVdk4R3
         ET0ZGhPFc8pbMssCyMoSQ25pyE1vGHZ8GWWYddBwLvmbMU6WxLG0A+PofSbDqN4Vzoi2
         6ga2uN5wZURx+jXzRLf2JWCtXb0YecCLVRMAaUDxlMuTWTY0sLRt8cAwvFUcza+tqs1u
         iAPrSdiEY1O4uPds0b9bnAMScRHxL/gT72jnO5XlEk/UipEvdFm7wiwudauPAj4XkR3y
         2tGKAs1Ca11rnWBI4/dmS7YlTkZssJe1UySIyblvyLCcYR7czLJD2epTwuD6h1mFFXUm
         zCFA==
X-Forwarded-Encrypted: i=1; AJvYcCWRbICseCw7xIEsIdYQQJ69XH2JWQE8tpQaVvpIesjREh3gjhWjogu+Z2mIM163FGelgMUVvQCMEqKceg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyufXrzoho23u5Q+E0EsSmR9geLDd2zjtJL61FEwJmOzQAUj2qJ
	EnZe7SkQ7UuR8UybJtQGLf1ppAkY3FkkYearoVyOMpLc3ogJxqM8sV5kLx829U41JTRsLGnPWJQ
	OrRLNDXl4JSWBnB80e125UL9DIxljbJk=
X-Gm-Gg: AeBDievvPnAvrqZDtnfyzUaGsm4zV9zM3o1ZWYR37kkmOOnSC5LgX+alapfv69Ubs0Y
	+Hs/XLbZEvbcwvXZdBlG0cIF5M3Qk0KxqetHKnLaiBFADEtSyWZb/YRI8RcoaYgE3U6UCNodTem
	XI6FCkkAQBt8QcJ1c8B25nfVIfWrKAn7GRXgnXLhJ+vmdclwN8W3zakP69DZ+Bm6UuKSBMzsRXT
	hUsQk9jv+LwAFWwEoqGbYIvGpB1oPYK0PTq8u5SIq8ZK4v1fgom380KqyRPm6lHzncrcWzpMtbr
	8ymAwGM5v+P7DbLcdi+0cF82iRqJAlTmHgB+KUGLC6y3hJhH+xqgAQkXU7Aya/LJwykJ2EjZnb7
	F9ywv8RumD6iak8fUCfWHqoc=
X-Received: by 2002:a05:7301:1007:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2cbfcf52a13mr3516734eec.3.1775524521173; Mon, 06 Apr 2026
 18:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
 <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com> <CANiq72n4tmTzqbcHCnzUBFyLVmJzB-AJng_1FgELJCWr7hDg4A@mail.gmail.com>
 <efe61810-2b28-4acd-b69f-d577042c0b62@nvidia.com>
In-Reply-To: <efe61810-2b28-4acd-b69f-d577042c0b62@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Apr 2026 03:15:06 +0200
X-Gm-Features: AQROBzCpjGVGSHiqD6WWW0AkLWSnE3ic7jf8UnYoPnV_5tut3XVgaNfJWwQj0o4
Message-ID: <CANiq72n84On9UxQ9CNqyFb5wpJZKrBzb1Xej9ZRqhLim--ftAQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_181522_681329_84D6A62A 
X-CRM114-Status: UNSURE (   8.50  )
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

T24gTW9uLCBBcHIgNiwgMjAyNiBhdCA5OjA34oCvUE0gSm9obiBIdWJiYXJkIDxqaHViYmFyZEBu
dmlkaWEuY29tPiB3cm90ZToKPgo+IFRoYXQncyB3aGF0IEkgdGhvdWdodCBJIHJlY2FsbGVkLCB0
b28uIFdlaXJkIHRoYXQgaXQgaXMgbm90IGluIHJ1c3QtbmV4dAo+IGFscmVhZHksIHRob3VnaC4K
Ckl0IGlzIG5vcm1hbCAtLSBpbiB0aGUga2VybmVsIGJhY2sgbWVyZ2VzIGFyZSBnZW5lcmFsbHkg
dG8gYmUgYXZvaWRlZC4KCkNoZWVycywKTWlndWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
