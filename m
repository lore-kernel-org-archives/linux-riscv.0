Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68A7FEEF4E
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 14:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Fl/5dbe4C+IDX77mbvFEpaPU268gB+n8ouRxhdolnQ=; b=NynZp66pOV3IGL
	FoO1nlQNtiGY3yV8VJS6THTKsOe8DQaEFAtfT8Mb/RJcTEz7H2TucjUE/Cn85IShgOgUMgIFNSPDO
	sLL0Ahde06v47j6buv5nKPXerrQruHYH702uNe+QpEob8+un8W8/88eyBasTRz352qbfhksvXNKSd
	A2h+of7EyOPNjI6XseM5yZWDtlvOkC5bV1bGKja7Yq0Kg+N2531bznu4wjTQqLMEPhqygqxoxnJsv
	H4XXb7FEsHQZCVIqUKaA5QqPvHDc5GAShxWwUcWwbrRCxZtXuVdoSWFX1sojSfS69vdCTptJyfmio
	4Ap0lnACGEV6EmUUIGCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7BC-00000006ZuU-3UyJ;
	Tue, 07 Apr 2026 14:13:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7BA-00000006Ztj-0WcC
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 14:13:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 441044459A
	for <linux-riscv@lists.infradead.org>; Tue,  7 Apr 2026 14:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29621C2BCF5
	for <linux-riscv@lists.infradead.org>; Tue,  7 Apr 2026 14:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775571199;
	bh=5mucqtRqZUC32Ucba3hcpr0TYw4Hx9sPWSW0EAmo2Qk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gEucaIosHM9b3uXIg9wCIDGrIN+QFR/6iPwXQnWdFH9HWtMNSWt3HnRH18WyUTQpJ
	 s4umHD45tbjfhln8lAimbMNko8WzgfUQDHagpK5O5HB0bTIScDMv2ww+UgBRgkwiqd
	 IRpFehScAdjq8204q/+sCn+ZIHPw+22qUrQNrb3JyH8+zCNdKy3liqkjAvk8WeRpM8
	 gb9416wPR3BQbGzj3b+S3F3dUN9WQF1hw9T8EguZWupT+YQu8uF/mwY1YlJ7eF6Oj+
	 00geFQ0nmAc07pftQft657gbDmcjFQDJjODzgg5FqLvePA1Fq11yxK9ldCXqXvijeM
	 coQR79hDwKq/Q==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59e4989dacdso5442383e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2026 07:13:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJAh2sWuKnuDLlZkcHFNk/Il5vabu/3MyHlFNFHkiMbOfs4AYvXcVJqPAw6yPqABnePX2e4XQMyJ+2tA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1UduEmwCj1LP6KQdBoLNHh/1QnUHP1V+S9OCHgWFSu9DNBun7
	3PJaMzXKFXwygPVHkquF1wzNtUy1SVsjuKgKDshskqGguM8jmo/UDQOy+oWSjTeTtR+AtLrd3FA
	IWUaRlEkjiseldacvM5L2Wq64I3kg/4k=
X-Received: by 2002:a05:6512:1385:b0:5a2:a8ab:ab5a with SMTP id
 2adb3069b0e04-5a337584899mr6421611e87.30.1775571197439; Tue, 07 Apr 2026
 07:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <20260405235309.418950-8-ojeda@kernel.org>
 <177548573697.95472.13544191227699996309.b4-review@b4> <CANiq72ne_JYPodnROckyNto10ZF0PqadRxSrng5-mZyqVovxFg@mail.gmail.com>
 <CAJ-ks9kbHz_KYAXx02vgW1dN2pfb5MFoaSoU1HbJbJg2O8EUaw@mail.gmail.com> <CANiq72mJTT7xFnhm-CeOZM_3ZwGdaQ8F2zUbONpPbqJ8g7DokQ@mail.gmail.com>
In-Reply-To: <CANiq72mJTT7xFnhm-CeOZM_3ZwGdaQ8F2zUbONpPbqJ8g7DokQ@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 7 Apr 2026 10:12:41 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9kqhQ7De+faY20PxGS3pYAyuRM6A6NVtNdNvdn_t9vwGA@mail.gmail.com>
X-Gm-Features: AQROBzCOb76MPiztEakAab4vOA01AReuQXW6N_U0hZ8trRfXq-PYQWgznDgWpRA
Message-ID: <CAJ-ks9kqhQ7De+faY20PxGS3pYAyuRM6A6NVtNdNvdn_t9vwGA@mail.gmail.com>
Subject: Re: [PATCH v2 07/33] rust: allow globally `clippy::incompatible_msrv`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_071320_225993_6C9105A9 
X-CRM114-Status: GOOD (  10.83  )
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

T24gVHVlLCBBcHIgNywgMjAyNiBhdCA0OjM34oCvQU0gTWlndWVsIE9qZWRhCjxtaWd1ZWwub2pl
ZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgQXByIDYsIDIwMjYgYXQg
NTozMeKAr1BNIFRhbWlyIER1YmVyc3RlaW4gPHRhbWlyZEBrZXJuZWwub3JnPiB3cm90ZToKPiA+
Cj4gPiBZb3UncmUgd2VsY29tZSEgQWN0dWFsbHkgaXQgc2VlbXMgdGhlIGxpbnQgd2FzIGFscmVh
ZHkgaW1wcm92ZWQKPiA+IHVwc3RyZWFtLCBzdGFydGluZyB3aXRoIDEuOTAuMC4KPiA+Cj4gPiBM
aW5rOiBodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL3J1c3QtY2xpcHB5L2NvbW1pdC9jMGRj
M2I2MSBbMF0KPgo+IEluZGVlZCwgSSBoYWQgdGhlIFBSIGxpbmtlZCBpbgo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9SdXN0LWZvci1MaW51eC9saW51eC9pc3N1ZXMvMzQ5LCBhbmQgaXQgaXMgbmljZXIs
Cj4gYnV0IGl0IHdvdWxkIHN0aWxsIGZpcmUgaW4gYSBjYXNlIGxpa2UgdGhpcyBwYXRjaCA6KAoK
QWgsIHRoYXQgaXMgcG9zc2libHkgaHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFuZy9ydXN0LWNs
aXBweS9pc3N1ZXMvMTQ4MjcuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
