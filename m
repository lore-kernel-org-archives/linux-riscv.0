Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8B2D3517C
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 12:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GNofBcfCXKW2UPVqPQrKws/pbcj/wRbTta/e6KaNf3E=; b=mg7Ra4bsEobB7v
	tfuBlezX110IBijVLOQaUCiWgUNnyUvpPL6Jd+ssMn8YChna5P6XuemfNLJBCSUNuMpfNAUroBJLF
	y6gQDQTgRRWWG61tSapa2OyiO2JPQR9nnpJYuSqNv8GHRysrc64rPmFjiexordmPmuJ4KXuh+4We9
	wEjds9OBACi6PPbAg9ltQ8sL7HaaTZM7lQdIg3Xi8+2m7RokX8208BVZZld8jVdIc9C9yviT2/o2/
	Hf/eCKcxdmmITHOL6l1aRbYIH+bb2UpmU6j1d4AhMv9Uhw4Ah6w6WpRBE8dsl+x+Gj9BPNcxLBgvE
	T5FQAFtxL+4f5sa0LGag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7urk-0000000FEhs-40Xh;
	Wed, 01 Apr 2026 12:40:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7uqg-0000000FDj9-1Sty
	for linux-riscv@bombadil.infradead.org;
	Wed, 01 Apr 2026 12:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=C50p4ZX1kB4/qlngVjB93jucX5ZFw4nyYPOJ+NDGmJQ=; b=fwbG6z2bzW98n6efxKcJbBEJid
	wGl6UGimcrGOo6nqfr91ntvf9ofB4XkDTfTFhElESiuOzvr+XurU84xq8QJAVVwt2jLP3/VLOP3Cd
	rRaaHPDIxM8hsptUSRIuFZA2LAtNPyMzyGgOyakzG3zi683UWzNNyZO0xa8b4jvRT4j+cNZFkDN8R
	s/CpGgXU4gaZwKQVZWtOIKFYkvySXZzPLd5EYisWewlZ57LhPmKgx1aBA2ea9FMYKqCTqYsH39F2n
	e0y57i9eXPF6Wuq9TkQT8H0tUg2h3YVmmn3lRo1AL7myb7Rg/G7wXQudYgdgRpRKehTBgZnsm/ES6
	JJOEKt1A==;
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7uqc-00000000Ma0-15v2
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 12:39:05 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2bd5658b901so279398eec.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 Apr 2026 05:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775047140; cv=none;
        d=google.com; s=arc-20240605;
        b=FayXatTPS9Iagr1xj8CTbd2CJai0hDBkW369Dn5nhtsrDCvOnnErcff49cIMGrh/R3
         +UpwplgVk5NTayn6qB4hwnLYGNtgAKhzM96KzGtv88hNIsEMAd8bK9arjFXh6Z8I8hvR
         sW4fdwa11dumWzcUyctDrS+nB1xZgXc08GlzKyMnjVr9oRopbLVGab7nBBNaINT74a8q
         481IwLiczdlBmImMJwxGvUpEHgyZDhVxPtLRHq+YMg2TfFjWv03QgQikBBpRkPgpxfN5
         61D/hhnswzeu6j+yNuMOCi7nJrqgatpOTsxdqmy+CsCRc+HXvxLL/TSVCaKujdhkjSWL
         pGUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C50p4ZX1kB4/qlngVjB93jucX5ZFw4nyYPOJ+NDGmJQ=;
        fh=7S773pe1d7TYgWJ8eDCBXkM3r9jRu4Q1YwaMlbfoi0Y=;
        b=enuNbPxtOAyq/pKzFbxwOw90NId3tvY++pycTi28Vbcgaiil0PVlawV04BxDObIulP
         FCyj5zPdPgXMT49wl0m5QOlJYJ4TvxawKiJ6+zBWjiv5B1jwXyVU1a4eoDdEa8kI+iim
         MwKgJD1ysZwqfwYiUTS3CQuq9HSTD9Z4Aen4jDK51AddR13c8OVrw6G0Jquf9M3zDlfw
         Caoqw9udTFSXPxIfPG5/oaN2JHoAdA5tlHV5IMxCi/EHkEUPBjdQJuUdOPynO5sP6cqE
         NM6Q8OX7pYdcA4Ua1l7x7L2awPxh3uUUuV5MPLz+/ohHjoyUwTYR/XGXrKj4uOvbq90S
         3KyQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775047140; x=1775651940; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C50p4ZX1kB4/qlngVjB93jucX5ZFw4nyYPOJ+NDGmJQ=;
        b=d8bpKtxFZ0EzDwW8ACPThalwH9tnC7tm9nFc2D4UpG/LMqykcNqqWHe9EYx0WrmcY6
         ppKjxYQHd6zJgqGntdSzqucZl+5gaA1rUNRDof2amPNlSI18xCP8PbazbYqDTbJf5cBh
         ZaSBFbVboLioX8Imv+XmkzIkJaiodTM3rWyCfEajEzCmTjgsia4puAePDT4tN+RfrulG
         FOfVjuAdx1HjqGU815pvAv4NVs6vnPj1ReZRSV9qszqNWMxw/tpIoXvYl6URBIQC6GC6
         fvvW6y4bA399WVe99Wk5RPTK0m92bE+RDMvrsvmiSY/seYScrJsxzd0xzr9b9sD4nhnd
         gc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047140; x=1775651940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C50p4ZX1kB4/qlngVjB93jucX5ZFw4nyYPOJ+NDGmJQ=;
        b=ifN2Zh8Ok6Kb3XEMO95Z6ar08X7KVVVqS0RZkRhYdOs3lwSXL8dpGpRIivJv5suHXF
         tx1+nILUof47GmS7XYqWhA/W09EGsN2bZSxgRIKkne91TQcoD0UjNmS/t8of0w8HZKLa
         hfAb4ooOGyp+fST9RImXc9Lq0CoyhOCw1TMWsrcSqiVIndyiEgvJUz3R7o3zEopnZfWf
         YBR1/QKscliFHPo4yUMXHrEIjkyUNE2CTyRWgpG4ZyoDLM+YrrNVasq3ovkVF5lemXdz
         Awo1JRgdH/FzSp5FPt/3cL5vGdQZb6085CXYrovFYlYLUB4/gyTO+RPywero2/vqErSg
         xWaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUalZf/ROMYxYM0ovgIYJ5DkBJjFQL24AqDQj3Thqn7yL4NoUUWLF5n7vPLf5oguGh+EUAGA21v2mecnA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzDmyu/HN3cOeDfwIdKvZKEAv3ksxOZH9MbQC+ZlwLygPWu9cB
	3fFBnhuYX7u9/HroGAIU6FtJhPP1V6XWhXgn5BRdO8TrnUkdVA/5LuxzTSXKCa3V+bPqeDgtBiV
	yFZowLE0sC9EBZ+HQKjiCkMEMcIOS31U=
X-Gm-Gg: ATEYQzy6PNhohWUVZKg3V2HOviBxvPdNbZ9H+o1wNo0vlaCf4AYk3fimK0nfr6aA+oQ
	4D/uATlnE0fg72+0r0zTqEYpIVVKMOuvkl8GCm6menwnQKJVyqzOZZq+mNX08kQOSdy6AXq2W8r
	U33mCak01DFFQcVL5cMKVUeeRHdM1+dM4f4wAOxNUBwDxmBSE3w9klrvjqxVzpQrAJBU6bK7lYK
	lJLl04id9kSMmHzVHNecyWUHvBFM3S3/Gx/CteuXtdhHauloS5gJr53W+p08kW+f4lqwqzx+vWO
	7PaSNzjaqAxW+/DiqQpCt2/dGEO6VJQ/nyasp3tctjFtE6OyDETD7kIIhT22xdzRO1lqgzKnBqV
	gPEU3nrcrAIuugU3nnj0trr0=
X-Received: by 2002:a05:7301:6790:b0:2c1:6416:2a07 with SMTP id
 5a478bee46e88-2c9321b7bf4mr857984eec.4.1775047139826; Wed, 01 Apr 2026
 05:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-2-ojeda@kernel.org>
 <ac0Ol1PaRTWNK6O9@google.com>
In-Reply-To: <ac0Ol1PaRTWNK6O9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 14:38:46 +0200
X-Gm-Features: AQROBzB47ncfBs2Gvn4IVyEtA2T5y2xBZyqDi53mewiERXnAT8KcWfCgLbx6lUg
Message-ID: <CANiq72nk8Ti1bcjCO+5nPacz7JaH=x4+uTi3-+iu4H2ZfwfVrw@mail.gmail.com>
Subject: Re: [PATCH 01/33] rust: bump Rust minimum supported version to 1.85.0
 (Debian Trixie)
To: Alice Ryhl <aliceryhl@google.com>, 
	=?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <debian@fabian.gruenbichler.email>, 
	=?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <fabiang@debian.org>, 
	=?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>, 
	NoisyCoil <noisycoil@disroot.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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
X-CRM114-CacheID: sfid-20260401_133902_383998_9A2554F0 
X-CRM114-Status: UNSURE (   8.77  )
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

T24gV2VkLCBBcHIgMSwgMjAyNiBhdCAyOjI14oCvUE0gQWxpY2UgUnlobCA8YWxpY2VyeWhsQGdv
b2dsZS5jb20+IHdyb3RlOgo+Cj4gRGViaWFuIHJlYWxseSAqc2hvdWxkKiBwaWNrIHVwIDEuODUu
MS4gSXQgY29udGFpbnMgYnVnZml4ZXMgc2VyaW91cwo+IGVub3VnaCB0aGF0IHRoZSBSdXN0IHRl
YW0gZGVjaWRlZCBpdCB3YXMgcmVhc29uYmxlIHRvIHJlbGVhc2UgYSBwb2ludAo+IHJlbGVhc2Uu
CgpJIGFza2VkIHRoZW0gYWJvdXQgdGhlaXIgcG9saWN5IHllc3RlcmRheSBoZXJlOgoKICBodHRw
czovL2xvcmUua2VybmVsLm9yZy9ydXN0LWZvci1saW51eC8yMDI2MDMzMTE5MDA1My40ODI2MDct
MS1vamVkYUBrZXJuZWwub3JnLwoKUGVyaGFwcyB0aGV5IGp1c3QgcHJlZmVyIHRvIGFwcGx5IHBh
dGNoZXMgb24gdG9wLgoKVGhlIGlzc3VlIGxpbmtlZCBhYm92ZSBpcyB0aGUgb25seSBvbmUgSSBu
b3RpY2VkIHNvIGZhciwgYW5kIGl0IGlzCnF1aXRlIHNwZWNpZmljLgoKQW55d2F5LCBpdCBpcyB1
cCB0byB0aGVtLgoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
