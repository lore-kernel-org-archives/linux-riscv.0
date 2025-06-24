Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B8BC77B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 07:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c9LgZVGxgqZT5mSOoQa/OeVeKYVIVKvRSnKSM32nzRM=; b=CR6tzCSuVbghVb
	F4iBQUCOCwWNlkrGQJi8Qt/alhVES6zBFcNaVoTtfoor3DrHbbDmM4pe6Y4/yLUVy4X4Rq/+K1+Mk
	OCqditRECQoVF5CRO7xcXzfFoANkXaMlr1W/VskocBp/SW22CkCnhNBkO0oSyqE9Mz9L1mETHVeaJ
	N+SextNcKN/E5/5TUtP7MohLs+ou27nw0MQ7jTSjIu1mzsvH2Rwlu8idmw3ZQiRjVMVnrb2jRahYb
	92vR8Iz3nnAjeYH56/1oegcQcESSltjfHq3/yYIfzgxnIDnvr7/0FlAURrvJgqeFPFKEukWQt2ULt
	T451wH0uGNas0Extmcog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTyLV-00000004vCF-2H0C;
	Tue, 24 Jun 2025 07:45:33 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTy6B-00000004s6e-0icw
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 07:29:44 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3ddda0a8ba2so955075ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 00:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1750750182; x=1751354982; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCAx15zg9RW4K8KXkbEJeib3OebKP7rlI+yhk9VbeJ8=;
        b=BZ8eITCsLvNLxubPz8Jj6DZIfrxShEwTG90CF8Jxtox3AGwcoEpjkO3CinWA8A7Rd6
         htt/xK+8Z+Xxe/xsxGSQSJVM5s9QDeKNkLAwCh0U87jUWa3hyp6IYvRU0ULuE0nmNhKF
         mygZAdRo1ZwglFPlmdQ4oQlJzD5iuOuqqMkbygjB5aSWvTvqvbaZr/bfQaPHbge/HtGB
         zK6XXSX/3+5hi3BS2pwnWq4jel7j7QxlLTfCx+e4jFwuUWn1otqOwS9m5WUrteUkcwoj
         44ak/ZFOiffbSS3qck1tIIfMdhavc1HrBhjzkzxbrVYJffAyT7qv6ds0y+WdsNVLVSFv
         buDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750750182; x=1751354982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCAx15zg9RW4K8KXkbEJeib3OebKP7rlI+yhk9VbeJ8=;
        b=NP4AX/g3mPK1aGsQVK48VpI2IUUmOFpPgWPCer1KzuTsvd8vmyubVI6cK1KI6ao6bV
         9DmUEzGYODcXH6Wp9ekGc6KFquT9FKqPW3FgOuC99aYX+wyl8oNSJGOW8J1Ui74riU7W
         z6LHUmJhi7CopJOCO5VsHovJjXt7yeu03bqkCF2dJkQhQL80kGAsHiQaNpg7BWsT0CDQ
         xaAUWzZuK3S30zXWOQ1fcCSWpR1OQKJTTGVFU9WmguMeDJSWe5haG3VlNSFOnxF5Hi5J
         hgdhZqApb8WW1y5ybhNgSx0wrj3319VaepRnv3JRRuEsl31Dv8Q2q+u82k1m4xWLNxhT
         F+Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXMvUl9bCOLd20TgujRsHxVSVqhOxuGL5Uvcrctvpl+QYyUPvNoMjmQ5lRbvwsKMDF+wZKmOHH0EuaNoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZKt6B/roBiUGcQ1Z6Wd4avj0o1fnWMrrRe2XfHAuZsPcRMs/t
	2llWNWIPjqVg1v44ktBPcL1zdVFuVQT6MnsCOg3uJI2rfrz0ftX38pHl/lk0ZrMc/JKIcutciuv
	m7++jdNyzeqgSktP872wQMcsNuJCelsJ3GrG4ZJzTWA==
X-Gm-Gg: ASbGncuG3xCNMAawEMoAHpLNYEDbS9WJDu/74V6Ta1A3dqPJbFUWiA3EmI6+B6fDfDL
	KRnQfg0t6GUV/KQpUXNRj+dsluLTww9l1fhgzY0jKEoVVG2w1SQB00g989QoWmwtLJvH7RhrfKi
	dUK61bsQwf60O0wieQgGPe5VotuhjyBi7CBhWrqw9UEWShKQ==
X-Google-Smtp-Source: AGHT+IH6hRbPz4KJd4uHusg55uzqEZNbIEEtPoBg2Di8b55LbLqgN3m0kaio6V1nAiVuXSaR5cp2kjghUWOHqxTA20U=
X-Received: by 2002:a05:6e02:19c8:b0:3dd:a3e4:2def with SMTP id
 e9e14a558f8ab-3de38cbfe5cmr169073095ab.16.1750750181761; Tue, 24 Jun 2025
 00:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com> <20250604-v5_user_cfi_series-v17-23-4565c2cf869f@rivosinc.com>
In-Reply-To: <20250604-v5_user_cfi_series-v17-23-4565c2cf869f@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 24 Jun 2025 15:29:23 +0800
X-Gm-Features: AX0GCFtqo33kUwQ41tFem8GGyjdAkGeTRdsf_5aqfLZF6MkgxmnaqyzxPU27Aco
Message-ID: <CANXhq0qy_0Lth1a-aZ+dd5p+HXKRpbgsc522v9_kqP1Ve67J2w@mail.gmail.com>
Subject: Re: [PATCH v17 23/27] arch/riscv: compile vdso with landing pad
To: Deepak Gupta <debug@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_002943_232637_BB7561FB 
X-CRM114-Status: GOOD (  24.07  )
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

T24gVGh1LCBKdW4gNSwgMjAyNSBhdCAxOjE34oCvQU0gRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZv
c2luYy5jb20+IHdyb3RlOgo+Cj4gRnJvbTogSmltIFNodSA8amltLnNodUBzaWZpdmUuY29tPgo+
Cj4gdXNlciBtb2RlIHRhc2tzIGNvbXBpbGVkIHdpdGggemljZmlscCBtYXkgY2FsbCBpbmRpcmVj
dGx5IGludG8gdmRzbyAobGlrZQo+IGh3cHJvYmUgaW5kaXJlY3QgY2FsbHMpLiBBZGQgbGFuZGlu
ZyBwYWQgY29tcGlsZSBzdXBwb3J0IGluIHZkc28uIHZkc28KPiB3aXRoIGxhbmRpbmcgcGFkIGlu
IGl0IHdpbGwgYmUgbm9wIGZvciB0YXNrcyB3aGljaCBoYXZlIG5vdCBlbmFibGVkCj4gbGFuZGlu
ZyBwYWQuCj4gVGhpcyBwYXRjaCBhbGxvd3MgdG8gcnVuIHVzZXIgbW9kZSB0YXNrcyB3aXRoIGNm
aSBlYW5ibGVkIGFuZCBkbyBubyBoYXJtLgo+Cj4gRnV0dXJlIHdvcmsgY2FuIGJlIGRvbmUgb24g
dGhpcyB0byBkbyBiZWxvdwo+ICAtIGxhYmVsZWQgbGFuZGluZyBwYWQgb24gdmRzbyBmdW5jdGlv
bnMgKHdoZW5ldmVyIGxhYmVsaW5nIHN1cHBvcnQgc2hvd3MKPiAgICB1cCBpbiBnbnUtdG9vbGNo
YWluKQo+ICAtIGVtaXQgc2hhZG93IHN0YWNrIGluc3RydWN0aW9ucyBvbmx5IGluIHZkc28gY29t
cGlsZWQgb2JqZWN0cyBhcyBwYXJ0IG9mCj4gICAga2VybmVsIGNvbXBpbGUuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBKaW0gU2h1IDxqaW0uc2h1QHNpZml2ZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IFpvbmcg
TGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEZWVwYWsgR3VwdGEgPGRl
YnVnQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICB8ICA1ICsrKy0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc3NlbWJsZXIuaCAg
ICB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGFyY2gvcmlzY3Yv
a2VybmVsL3Zkc28vTWFrZWZpbGUgICAgICAgfCAgNiArKysrKwo+ICBhcmNoL3Jpc2N2L2tlcm5l
bC92ZHNvL2ZsdXNoX2ljYWNoZS5TIHwgIDQgKysrKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNv
L2dldGNwdS5TICAgICAgIHwgIDQgKysrKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3J0X3Np
Z3JldHVybi5TIHwgIDQgKysrKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3N5c19od3Byb2Jl
LlMgIHwgIDQgKysrKwo+ICA3IGZpbGVzIGNoYW5nZWQsIDcwIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L01ha2VmaWxlIGIvYXJjaC9yaXNj
di9NYWtlZmlsZQo+IGluZGV4IDUzOWQyYWVmNWNhYi4uYzJkZDA5YmI5ZGIzIDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3YvTWFrZWZpbGUKPiArKysgYi9hcmNoL3Jpc2N2L01ha2VmaWxlCj4gQEAg
LTg4LDkgKzg4LDEyIEBAIHJpc2N2LW1hcmNoLSQoQ09ORklHX1RPT0xDSEFJTl9IQVNfWkFDQVMp
IDo9ICQocmlzY3YtbWFyY2gteSlfemFjYXMKPiAgIyBDaGVjayBpZiB0aGUgdG9vbGNoYWluIHN1
cHBvcnRzIFphYmhhCj4gIHJpc2N2LW1hcmNoLSQoQ09ORklHX1RPT0xDSEFJTl9IQVNfWkFCSEEp
IDo9ICQocmlzY3YtbWFyY2gteSlfemFiaGEKPgo+ICtLQlVJTERfQkFTRV9JU0EgPSAtbWFyY2g9
JChzaGVsbCBlY2hvICQocmlzY3YtbWFyY2gteSkgfCBzZWQgLUUgJ3MvKHJ2MzJpbWF8cnY2NGlt
YSlmZChbXnZfXSopdj8vXDFcMi8nKQo+ICtleHBvcnQgS0JVSUxEX0JBU0VfSVNBCj4gKwo+ICAj
IFJlbW92ZSBGLEQsViBmcm9tIGlzYSBzdHJpbmcgZm9yIGFsbC4gS2VlcCBleHRlbnNpb25zIGJl
dHdlZW4gImZkIiBhbmQgInYiIGJ5Cj4gICMgbWF0Y2hpbmcgbm9uLXYgYW5kIG5vbi1tdWx0aS1s
ZXR0ZXIgZXh0ZW5zaW9ucyBvdXQgd2l0aCB0aGUgZmlsdGVyIChbXnZfXSopCj4gLUtCVUlMRF9D
RkxBR1MgKz0gLW1hcmNoPSQoc2hlbGwgZWNobyAkKHJpc2N2LW1hcmNoLXkpIHwgc2VkIC1FICdz
LyhydjMyaW1hfHJ2NjRpbWEpZmQoW152X10qKXY/L1wxXDIvJykKPiArS0JVSUxEX0NGTEFHUyAr
PSAkKEtCVUlMRF9CQVNFX0lTQSkKPgo+ICBLQlVJTERfQUZMQUdTICs9IC1tYXJjaD0kKHJpc2N2
LW1hcmNoLXkpCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc3NlbWJs
ZXIuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNzZW1ibGVyLmgKPiBpbmRleCA0NGIxNDU3
ZDNlOTUuLmEwNThlYTVlOWM1OCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2Fzc2VtYmxlci5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc3NlbWJsZXIuaAo+
IEBAIC04MCwzICs4MCw0NyBAQAo+ICAgICAgICAgLmVuZG0KPgo+ICAjZW5kaWYgLyogX19BU01f
QVNTRU1CTEVSX0ggKi8KPiArCj4gKyNpZiBkZWZpbmVkKENPTkZJR19SSVNDVl9VU0VSX0NGSSkg
JiYgKF9fcmlzY3ZfeGxlbiA9PSA2NCkKPiArLm1hY3JvIHZkc29fbHBhZAo+ICtscGFkIDAKPiAr
LmVuZG0KPiArI2Vsc2UKPiArLm1hY3JvIHZkc29fbHBhZAo+ICsuZW5kbQo+ICsjZW5kaWYKPiAr
Cj4gKy8qCj4gKyAqIFRoaXMgbWFjcm8gZW1pdHMgYSBwcm9ncmFtIHByb3BlcnR5IG5vdGUgc2Vj
dGlvbiBpZGVudGlmeWluZwo+ICsgKiBhcmNoaXRlY3R1cmUgZmVhdHVyZXMgd2hpY2ggcmVxdWly
ZSBzcGVjaWFsIGhhbmRsaW5nLCBtYWlubHkgZm9yCj4gKyAqIHVzZSBpbiBhc3NlbWJseSBmaWxl
cyBpbmNsdWRlZCBpbiB0aGUgVkRTTy4KPiArICovCj4gKyNkZWZpbmUgTlRfR05VX1BST1BFUlRZ
X1RZUEVfMCAgNQo+ICsjZGVmaW5lIEdOVV9QUk9QRVJUWV9SSVNDVl9GRUFUVVJFXzFfQU5EIDB4
YzAwMDAwMDAKPiArCj4gKyNkZWZpbmUgR05VX1BST1BFUlRZX1JJU0NWX0ZFQVRVUkVfMV9aSUNG
SUxQICAgICAgKDFVIDw8IDApCj4gKyNkZWZpbmUgR05VX1BST1BFUlRZX1JJU0NWX0ZFQVRVUkVf
MV9aSUNGSVNTICAgICAgKDFVIDw8IDEpCj4gKwo+ICsjaWYgZGVmaW5lZChDT05GSUdfUklTQ1Zf
VVNFUl9DRkkpICYmIChfX3Jpc2N2X3hsZW4gPT0gNjQpCj4gKyNkZWZpbmUgR05VX1BST1BFUlRZ
X1JJU0NWX0ZFQVRVUkVfMV9ERUZBVUxUIFwKPiArICAgICAgIChHTlVfUFJPUEVSVFlfUklTQ1Zf
RkVBVFVSRV8xX1pJQ0ZJTFApCj4gKyNlbmRpZgo+ICsKPiArI2lmZGVmIEdOVV9QUk9QRVJUWV9S
SVNDVl9GRUFUVVJFXzFfREVGQVVMVAo+ICsubWFjcm8gZW1pdF9yaXNjdl9mZWF0dXJlXzFfYW5k
LCBmZWF0ID0gR05VX1BST1BFUlRZX1JJU0NWX0ZFQVRVUkVfMV9ERUZBVUxUCj4gKyAgICAgICAu
cHVzaHNlY3Rpb24gLm5vdGUuZ251LnByb3BlcnR5LCAiYSIKPiArICAgICAgIC5wMmFsaWduICAg
ICAgICAzCj4gKyAgICAgICAud29yZCAgICAgICAgICAgNAo+ICsgICAgICAgLndvcmQgICAgICAg
ICAgIDE2Cj4gKyAgICAgICAud29yZCAgICAgICAgICAgTlRfR05VX1BST1BFUlRZX1RZUEVfMAo+
ICsgICAgICAgLmFzY2l6ICAgICAgICAgICJHTlUiCj4gKyAgICAgICAud29yZCAgICAgICAgICAg
R05VX1BST1BFUlRZX1JJU0NWX0ZFQVRVUkVfMV9BTkQKPiArICAgICAgIC53b3JkICAgICAgICAg
ICA0Cj4gKyAgICAgICAud29yZCAgICAgICAgICAgXGZlYXQKPiArICAgICAgIC53b3JkICAgICAg
ICAgICAwCj4gKyAgICAgICAucG9wc2VjdGlvbgo+ICsuZW5kbQo+ICsjZWxzZQo+ICsubWFjcm8g
ZW1pdF9yaXNjdl9mZWF0dXJlXzFfYW5kLCBmZWF0ID0gMAo+ICsuZW5kbQo+ICsjZW5kaWYKPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZSBiL2FyY2gvcmlzY3Yv
a2VybmVsL3Zkc28vTWFrZWZpbGUKPiBpbmRleCBhZDczNjA3YWJjMjguLjQ0MWM1NDMxZDI3ZSAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlCj4gKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZQo+IEBAIC0xMywxMiArMTMsMTggQEAgdmRzby1z
eW1zICs9IGZsdXNoX2ljYWNoZQo+ICB2ZHNvLXN5bXMgKz0gaHdwcm9iZQo+ICB2ZHNvLXN5bXMg
Kz0gc3lzX2h3cHJvYmUKPgo+ICtpZmRlZiBDT05GSUdfUklTQ1ZfVVNFUl9DRkkKPiArTFBBRF9N
QVJDSCA9IF96aWNmaWxwX3ppY2Zpc3MgLWZjZi1wcm90ZWN0aW9uPWZ1bGwKCkhpIERlZXBhaywK
SSBndWVzcyB3ZSBvbmx5IHdhbnQgdG8gZ2VuZXJhdGUgbGFuZGluZyBwYWQgaW5zdHJ1Y3Rpb25z
IGluIHZkc28sIGlmCnNvLCB0aGUgLWZjZi1wcm90ZWN0aW9uIHNob3VsZCBiZSBzZXQgdG8gYnJh
bmNoIGluc3RlYWQgb2YgZnVsbC4KKGkuZS4sIC1mY2YtcHJvdGVjdGlvbj1icmFuY2gpLgoKPiAr
ZW5kaWYKPiArCj4gICMgRmlsZXMgdG8gbGluayBpbnRvIHRoZSB2ZHNvCj4gIG9iai12ZHNvID0g
JChwYXRzdWJzdCAlLCAlLm8sICQodmRzby1zeW1zKSkgbm90ZS5vCj4KPiAgY2NmbGFncy15IDo9
IC1mbm8tc3RhY2stcHJvdGVjdG9yCj4gIGNjZmxhZ3MteSArPSAtRERJU0FCTEVfQlJBTkNIX1BS
T0ZJTElORwo+ICBjY2ZsYWdzLXkgKz0gLWZuby1idWlsdGluCj4gK2NjZmxhZ3MteSArPSAkKEtC
VUlMRF9CQVNFX0lTQSkkKExQQURfTUFSQ0gpCj4gK2FzZmxhZ3MteSArPSAkKEtCVUlMRF9CQVNF
X0lTQSkkKExQQURfTUFSQ0gpCj4KPiAgaWZuZXEgKCQoYy1nZXR0aW1lb2ZkYXkteSksKQo+ICAg
IENGTEFHU192Z2V0dGltZW9mZGF5Lm8gKz0gLWZQSUMgLWluY2x1ZGUgJChjLWdldHRpbWVvZmRh
eS15KQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL2ZsdXNoX2ljYWNoZS5T
IGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9mbHVzaF9pY2FjaGUuUwo+IGluZGV4IDhmODg0MjI3
ZThiYy4uZTRjNTY5NzA5MDVlIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28v
Zmx1c2hfaWNhY2hlLlMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL2ZsdXNoX2ljYWNo
ZS5TCj4gQEAgLTUsMTEgKzUsMTMgQEAKPgo+ICAjaW5jbHVkZSA8bGludXgvbGlua2FnZS5oPgo+
ICAjaW5jbHVkZSA8YXNtL3VuaXN0ZC5oPgo+ICsjaW5jbHVkZSA8YXNtL2Fzc2VtYmxlci5oPgo+
Cj4gICAgICAgICAudGV4dAo+ICAvKiBpbnQgX192ZHNvX2ZsdXNoX2ljYWNoZSh2b2lkICpzdGFy
dCwgdm9pZCAqZW5kLCB1bnNpZ25lZCBsb25nIGZsYWdzKTsgKi8KPiAgU1lNX0ZVTkNfU1RBUlQo
X192ZHNvX2ZsdXNoX2ljYWNoZSkKPiAgICAgICAgIC5jZmlfc3RhcnRwcm9jCj4gKyAgICAgICB2
ZHNvX2xwYWQKPiAgI2lmZGVmIENPTkZJR19TTVAKPiAgICAgICAgIGxpIGE3LCBfX05SX3Jpc2N2
X2ZsdXNoX2ljYWNoZQo+ICAgICAgICAgZWNhbGwKPiBAQCAtMjAsMyArMjIsNSBAQCBTWU1fRlVO
Q19TVEFSVChfX3Zkc29fZmx1c2hfaWNhY2hlKQo+ICAgICAgICAgcmV0Cj4gICAgICAgICAuY2Zp
X2VuZHByb2MKPiAgU1lNX0ZVTkNfRU5EKF9fdmRzb19mbHVzaF9pY2FjaGUpCj4gKwo+ICtlbWl0
X3Jpc2N2X2ZlYXR1cmVfMV9hbmQKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmRz
by9nZXRjcHUuUyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vZ2V0Y3B1LlMKPiBpbmRleCA5YzFi
ZDUzMTkwN2YuLjVjMWVjYzRlMTQ2NSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92
ZHNvL2dldGNwdS5TCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9nZXRjcHUuUwo+IEBA
IC01LDE0ICs1LDE4IEBACj4KPiAgI2luY2x1ZGUgPGxpbnV4L2xpbmthZ2UuaD4KPiAgI2luY2x1
ZGUgPGFzbS91bmlzdGQuaD4KPiArI2luY2x1ZGUgPGFzbS9hc3NlbWJsZXIuaD4KPgo+ICAgICAg
ICAgLnRleHQKPiAgLyogaW50IF9fdmRzb19nZXRjcHUodW5zaWduZWQgKmNwdSwgdW5zaWduZWQg
Km5vZGUsIHZvaWQgKnVudXNlZCk7ICovCj4gIFNZTV9GVU5DX1NUQVJUKF9fdmRzb19nZXRjcHUp
Cj4gICAgICAgICAuY2ZpX3N0YXJ0cHJvYwo+ICsgICAgICAgdmRzb19scGFkCj4gICAgICAgICAv
KiBGb3Igbm93LCBqdXN0IGRvIHRoZSBzeXNjYWxsLiAqLwo+ICAgICAgICAgbGkgYTcsIF9fTlJf
Z2V0Y3B1Cj4gICAgICAgICBlY2FsbAo+ICAgICAgICAgcmV0Cj4gICAgICAgICAuY2ZpX2VuZHBy
b2MKPiAgU1lNX0ZVTkNfRU5EKF9fdmRzb19nZXRjcHUpCj4gKwo+ICtlbWl0X3Jpc2N2X2ZlYXR1
cmVfMV9hbmQKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9ydF9zaWdyZXR1
cm4uUyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vcnRfc2lncmV0dXJuLlMKPiBpbmRleCAzZGMw
MjJhYTg5MzEuLmU4Mjk4N2RjMzczOSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92
ZHNvL3J0X3NpZ3JldHVybi5TCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9ydF9zaWdy
ZXR1cm4uUwo+IEBAIC01LDEyICs1LDE2IEBACj4KPiAgI2luY2x1ZGUgPGxpbnV4L2xpbmthZ2Uu
aD4KPiAgI2luY2x1ZGUgPGFzbS91bmlzdGQuaD4KPiArI2luY2x1ZGUgPGFzbS9hc3NlbWJsZXIu
aD4KPgo+ICAgICAgICAgLnRleHQKPiAgU1lNX0ZVTkNfU1RBUlQoX192ZHNvX3J0X3NpZ3JldHVy
bikKPiAgICAgICAgIC5jZmlfc3RhcnRwcm9jCj4gICAgICAgICAuY2ZpX3NpZ25hbF9mcmFtZQo+
ICsgICAgICAgdmRzb19scGFkCj4gICAgICAgICBsaSBhNywgX19OUl9ydF9zaWdyZXR1cm4KPiAg
ICAgICAgIGVjYWxsCj4gICAgICAgICAuY2ZpX2VuZHByb2MKPiAgU1lNX0ZVTkNfRU5EKF9fdmRz
b19ydF9zaWdyZXR1cm4pCj4gKwo+ICtlbWl0X3Jpc2N2X2ZlYXR1cmVfMV9hbmQKPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9zeXNfaHdwcm9iZS5TIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvdmRzby9zeXNfaHdwcm9iZS5TCj4gaW5kZXggNzdlNTdmODMwNTIxLi5mMTY5NDQ1MWE2
MGMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9zeXNfaHdwcm9iZS5TCj4g
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9zeXNfaHdwcm9iZS5TCj4gQEAgLTMsMTMgKzMs
MTcgQEAKPgo+ICAjaW5jbHVkZSA8bGludXgvbGlua2FnZS5oPgo+ICAjaW5jbHVkZSA8YXNtL3Vu
aXN0ZC5oPgo+ICsjaW5jbHVkZSA8YXNtL2Fzc2VtYmxlci5oPgo+Cj4gIC50ZXh0Cj4gIFNZTV9G
VU5DX1NUQVJUKHJpc2N2X2h3cHJvYmUpCj4gICAgICAgICAuY2ZpX3N0YXJ0cHJvYwo+ICsgICAg
ICAgdmRzb19scGFkCj4gICAgICAgICBsaSBhNywgX19OUl9yaXNjdl9od3Byb2JlCj4gICAgICAg
ICBlY2FsbAo+ICAgICAgICAgcmV0Cj4KPiAgICAgICAgIC5jZmlfZW5kcHJvYwo+ICBTWU1fRlVO
Q19FTkQocmlzY3ZfaHdwcm9iZSkKPiArCj4gK2VtaXRfcmlzY3ZfZmVhdHVyZV8xX2FuZAo+Cj4g
LS0KPiAyLjQzLjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
