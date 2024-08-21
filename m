Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E2EC52D6F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 17:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qH0Etn7VFEov+5gXVVI1yjWWgiha6hr5b5TJy1BPQc8=; b=qGM7+rOaEi81gkWZfE9VRCFSRw
	ZAeJChaB2kG/4S+RWxYJ6OztY/6MhIz3Wi9W8EGTiEN/CRVj450sG6mn9lwNhq/4g6bjPqvDDWsNW
	DODY4N3ZK+8YiW2s4RCFNMV2rXeMS1qp7F5WkRlMk3CEtecDtJ7j+E5/T/f82e4hB59/55Nz4swXM
	qph2Ha/J1V1WfdTwzd5OvlUSgWOE9HWUcv/teVYD5txM1aU60VTqXyxg6AtH3vw62nfoYWMFj3zJe
	jzc8f3/k1K4oPimoigcoC9nn4Tk1IfnuJvLrRR7uJyxLRZo6phHKHw8QVpYEKtqVlbYrf4aeQuduO
	X9vZQd2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgpY4-00000009ygA-3EMi;
	Wed, 21 Aug 2024 17:55:08 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgpY0-00000009yf6-3uTg;
	Wed, 21 Aug 2024 17:55:06 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-70e9545d8b2so99339b3a.3;
        Wed, 21 Aug 2024 10:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724262904; x=1724867704; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=99UTJcdmOMSq3QL9Ld/ZYDtqRpwRWCrHaSBTyLsenAI=;
        b=kUrcI+NEt/0wmJZz3FFzBD1xrEeT0YJM1J8ONMBxjMCpuZL9ni+Ibefxte4XzkTOQw
         kMWEMMaj9c4qGhumke7kq2tkWl0RKHcfummuR7wth2u6wq7aRqLnusALwyDdjQ3DSTpA
         CXK6hJ87/pmilF8sbjGGY4qxAkwd8MV329cmUudJ4KgAYpw8QzmVZWSZrEG9UKh1WteS
         aI2xIb6gOk0kOUEomcB+P1DlMY7aS+fyDe1kg/jcUYwb1k65e7H9EtQv4DYpy24Azqs2
         bjlnIpX1O4Qwg7djMj6OpblOdfHBeO2j8KuNa2bbWKdxq8kxgIW1WRcyKhZeOCTVEmqY
         ZyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724262904; x=1724867704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99UTJcdmOMSq3QL9Ld/ZYDtqRpwRWCrHaSBTyLsenAI=;
        b=K81W9lg/3AP95LbfdbeaNuekc4WraN8bcAud/7EkRl0v+PoSbVPr6VqKYsixcGZn4d
         6/nTHKuGwT1ZCXtv29DhrPlEU7L/svMV71wn1inqcHn1mepk5xgfhCaMCFCsr4IJNH+f
         wtx+PrzlGAdzTmR/J618mY/amY6dh79pktZlE8rjEhDwwpSoFSiAamwwlKYs7u3BSvv2
         tIwzkmmpSbx0N49a6Qcjb5oMSEd/5AjH0pEtT1QcxlgjHnWo9dv8THemHQVmzr9jMoyU
         gNURpB7IAUIheXgNndvbc35ecaXSyPQeiLXXLy2EXWPqzWPhNRZqK6MyQWDR7oqcf00S
         hBjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6gxEBNGwXRAWWR6mk5SI4ohE1l8bqU4stjnwHB69dJkHNQxEOIVo2fWtZ4vMFVAomhGvw2haPHenoFso=@lists.infradead.org, AJvYcCXOQu9l7ehiQBuE3aPKrvq7S1MAoYUV1G5b94aYYBE736+Lu3wvh4DbAt2k8KrjlpPefC3K4QYhrlNyWpKJscNN@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpgf2Bg5bvzGEJuWWiehjXJV+iY+cAkqFHYWhaQu5wLi/aRtzl
	firIT3ZFUOSPzIXOhby5UAuBL5ozmdh1pfOK+DyG56DrMp9tt+he+KSvs7bG6wUTsIoPWmLsJ5q
	+NOGFTYxt+bUp4ifECg0nY+IuenE=
X-Google-Smtp-Source: AGHT+IEzWQ9FWxtgUqDPIkbMELTDsn643+uCsx+x59lAbwOzM67Cgp8McbVys7i78Q39WJ4bizO6S55PWpHdgZM9zIQ=
X-Received: by 2002:a05:6a00:2d90:b0:710:5243:4161 with SMTP id
 d2e1a72fcca58-714235d73ecmr2136069b3a.5.1724262903448; Wed, 21 Aug 2024
 10:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240816-tracepoint-v7-0-d609b916b819@google.com>
 <20240816-tracepoint-v7-5-d609b916b819@google.com> <ZsYfAFrBFVewchGM@boqun-archlinux>
In-Reply-To: <ZsYfAFrBFVewchGM@boqun-archlinux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Aug 2024 19:54:51 +0200
Message-ID: <CANiq72np8GhZ4V22b7RekvQOhCbM67A-19Px2aVLgweC4Qxebg@mail.gmail.com>
Subject: Re: [PATCH v7 5/5] rust: add arch_static_branch
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Andrew Morton <akpm@linux-foundation.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev
Content-Type: multipart/mixed; boundary="000000000000dc2d130620353d5b"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_105505_016334_3411A425 
X-CRM114-Status: GOOD (  17.13  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--000000000000dc2d130620353d5b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 7:08=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Have you try this with "make O=3D<dir>"? I hit the following issue, but I
> am rebasing on rust-dev, so I might miss something:
>
>         error: couldn't read ../rust/kernel/arch_static_branch_asm.rs: No=
 such file or directory (os error 2)
>           --> ../rust/kernel/jump_label.rs:39:17
>            |
>         39 | const _: &str =3D include!("arch_static_branch_asm.rs");
>            |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>            |
>            =3D note: this error originates in the macro `include` (in Nig=
htly builds, run with -Z macro-backtrace for more info)
>
>         error: aborting due to 1 previous error

Yeah, we should use a `*TREE` everywhere. In addition, we should not
use `SRCTREE` but `OBJTREE`. It is my fault, this comes from my
prototype I gave Alice.

Please see the attached diff.

Cheers,
Miguel

--000000000000dc2d130620353d5b
Content-Type: text/x-patch; charset="US-ASCII"; name="objtree.diff"
Content-Disposition: attachment; filename="objtree.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_m045ljec0>
X-Attachment-Id: f_m045ljec0

ZGlmZiAtLWdpdCBhL3J1c3Qva2VybmVsL2p1bXBfbGFiZWwucnMgYi9ydXN0L2tlcm5lbC9qdW1w
X2xhYmVsLnJzCmluZGV4IDc3NTdlNGY4ZTg1ZS4uY2NmZDIwNTg5YzIxIDEwMDY0NAotLS0gYS9y
dXN0L2tlcm5lbC9qdW1wX2xhYmVsLnJzCisrKyBiL3J1c3Qva2VybmVsL2p1bXBfbGFiZWwucnMK
QEAgLTM2LDcgKzM2LDcgQEAgbWFjcm9fcnVsZXMhIHN0YXRpY19rZXlfZmFsc2UgewoKIC8vLyBB
c3NlcnQgdGhhdCB0aGUgYXNzZW1ibHkgYmxvY2sgZXZhbHVhdGVzIHRvIGEgc3RyaW5nIGxpdGVy
YWwuCiAjW2NmZyhDT05GSUdfSlVNUF9MQUJFTCldCi1jb25zdCBfOiAmc3RyID0gaW5jbHVkZSEo
ImFyY2hfc3RhdGljX2JyYW5jaF9hc20ucnMiKTsKK2NvbnN0IF86ICZzdHIgPSBpbmNsdWRlIShj
b25jYXQhKGVudiEoIk9CSlRSRUUiKSwgIi9ydXN0L2tlcm5lbC9hcmNoX3N0YXRpY19icmFuY2hf
YXNtLnJzIikpOwoKICNbbWFjcm9fZXhwb3J0XQogI1tkb2MoaGlkZGVuKV0KQEAgLTQ1LDcgKzQ1
LDcgQEAgbWFjcm9fcnVsZXMhIHN0YXRpY19rZXlfZmFsc2UgewogbWFjcm9fcnVsZXMhIGFyY2hf
c3RhdGljX2JyYW5jaCB7CiAgICAgKCRrZXk6cGF0aCwgJGtleXR5cDp0eSwgJGZpZWxkOmlkZW50
LCAkYnJhbmNoOmV4cHIpID0+IHsnbXlfbGFiZWw6IHsKICAgICAgICAgJGNyYXRlOjphc20hKAot
ICAgICAgICAgICAgaW5jbHVkZSEoY29uY2F0IShlbnYhKCJTUkNUUkVFIiksICIvcnVzdC9rZXJu
ZWwvYXJjaF9zdGF0aWNfYnJhbmNoX2FzbS5ycyIpKTsKKyAgICAgICAgICAgIGluY2x1ZGUhKGNv
bmNhdCEoZW52ISgiT0JKVFJFRSIpLCAiL3J1c3Qva2VybmVsL2FyY2hfc3RhdGljX2JyYW5jaF9h
c20ucnMiKSk7CiAgICAgICAgICAgICBsX3llcyA9IGxhYmVsIHsKICAgICAgICAgICAgICAgICBi
cmVhayAnbXlfbGFiZWwgdHJ1ZTsKICAgICAgICAgICAgIH0sCkBAIC02NSw3ICs2NSw3IEBAIG1h
Y3JvX3J1bGVzISBhcmNoX3N0YXRpY19icmFuY2ggewogbWFjcm9fcnVsZXMhIGFyY2hfc3RhdGlj
X2JyYW5jaCB7CiAgICAgKCRrZXk6cGF0aCwgJGtleXR5cDp0eSwgJGZpZWxkOmlkZW50LCAkYnJh
bmNoOmV4cHIpID0+IHsnbXlfbGFiZWw6IHsKICAgICAgICAgJGNyYXRlOjphc20hKAotICAgICAg
ICAgICAgaW5jbHVkZSEoY29uY2F0IShlbnYhKCJTUkNUUkVFIiksICIvcnVzdC9rZXJuZWwvYXJj
aF9zdGF0aWNfYnJhbmNoX2FzbS5ycyIpKTsKKyAgICAgICAgICAgIGluY2x1ZGUhKGNvbmNhdCEo
ZW52ISgiT0JKVFJFRSIpLCAiL3J1c3Qva2VybmVsL2FyY2hfc3RhdGljX2JyYW5jaF9hc20ucnMi
KSk7CiAgICAgICAgICAgICBsX3llcyA9IGxhYmVsIHsKICAgICAgICAgICAgICAgICBicmVhayAn
bXlfbGFiZWwgdHJ1ZTsKICAgICAgICAgICAgIH0sCmRpZmYgLS1naXQgYS9zY3JpcHRzL01ha2Vm
aWxlLmJ1aWxkIGIvc2NyaXB0cy9NYWtlZmlsZS5idWlsZAppbmRleCA0ZjBmNmIxM2ViZDcuLjc0
NmNjZTgwNTQ1ZiAxMDA2NDQKLS0tIGEvc2NyaXB0cy9NYWtlZmlsZS5idWlsZAorKysgYi9zY3Jp
cHRzL01ha2VmaWxlLmJ1aWxkCkBAIC0yNjksNyArMjY5LDcgQEAgcnVzdF9hbGxvd2VkX2ZlYXR1
cmVzIDo9IGFzbV9jb25zdCxhc21fZ290byxuZXdfdW5pbml0CiAjIGN1cnJlbnQgd29ya2luZyBk
aXJlY3RvcnksIHdoaWNoIG1heSBiZSBub3QgYWNjZXNzaWJsZSBpbiB0aGUgb3V0LW9mLXRyZWUK
ICMgbW9kdWxlcyBjYXNlLgogcnVzdF9jb21tb25fY21kID0gXAotCVNSQ1RSRUU9JChhYnNwYXRo
ICQoc3JjdHJlZSkpIFwKKwlPQkpUUkVFPSQoYWJzcGF0aCAkKG9ianRyZWUpKSBcCiAJUlVTVF9N
T0RGSUxFPSQobW9kZmlsZSkgJChSVVNUQ19PUl9DTElQUFkpICQocnVzdF9mbGFncykgXAogCS1a
YWxsb3ctZmVhdHVyZXM9JChydXN0X2FsbG93ZWRfZmVhdHVyZXMpIFwKIAktWmNyYXRlLWF0dHI9
bm9fc3RkIFwK
--000000000000dc2d130620353d5b
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--000000000000dc2d130620353d5b--

