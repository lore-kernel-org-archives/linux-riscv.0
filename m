Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C2BCD6E57
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 16:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJlJ1oCk/WnbrJXPvf+Fz+lj4PvGhWMkAqTMsunkwJI=; b=0o0HoSKNkoesAZ
	BvM8hQUNAzA+XDRsCf0X7mmSH30LrK2p+oJ/pKojkZdGX98Sw1YVp7CGrQbpzQsesOAFgP+py6APR
	1nhaijcYBRcYIyDgxNaHrHpQ6CZEWL/qVKi4ndW8Jr0De65qOrj7X18jiIV4P7NI2IuX8hg6wxnz5
	DgMSc+i2cpWfoiESTLVWBV43JrIuht8FnfAEseG+c/1dHLv6qMdhr2/E3oxYsWUkfDFKW0qbVgl7Y
	HdUw0Kg1b+2SQmSutjTMYHSVTkeRIyokPsFlcqlHI8KYzuhZdTqMB1nWqAtJecUqDX4FnRvVIN+e1
	uclzSiy2RrBcq4akCY6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5PO-0000000BTkr-1Njl;
	Mon, 01 Jun 2026 16:22:34 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5PL-0000000BTiT-1eYS
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 16:22:32 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-66067da0638so860679d50.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2026 09:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780330950; cv=none;
        d=google.com; s=arc-20240605;
        b=M/5VT8dHCYzFY7tvWSY0dv0hpGd+MT6dnpM5EsOVheKmHtWoR+9qmFbPB//QCfH6Fn
         a1n2lpxRuM4DlsmRbceAVcI5sbvTZxZGS2Id5izwPGWA5527wydR9LnSsutt1d87uL6t
         DDe1PVrLDGY9WW5rT6bbXBhm83DmwNvSnC/bcg+SSbOPQjTqj4/OJRlJC4nP5kRyi2CO
         6oWcEu3lufuuZiZqiyS8VGb+Tz9sKlLCqeZsU4XostOnoHNcHp9Bw9duf7SKkJ5wpEVx
         6oh7p3gdlW93FuesG311pIDpsfA08cBOAdKJ+hBZdeL/1t6FrqGH5wE0wCmK/8t3CpPV
         ZErQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A1Wsv67Vk9GRUFlRdxu2VA3iBYDzYBLeu5jipj2Jvzw=;
        fh=gChIcK9XGe6dJECaPy5M3NFJf3w+Dxovb0NBA9NGayo=;
        b=cfZvW7cXFOM4EiY9FsL6rek2MDg4Qn2V/JLvB8ZlZl6gWHdSPucjD9cBSosiJKAKpT
         M3V+mV+zlwb1kclEQC6ONdW5DxF7Nnfl/CjtLP46PDU7iiT63NfC6RvqKD2JUn6JqTpR
         BaKJN8UxL3hVpvz16cn1vIyG/mxIHzzN6C9BqhZCLAze/4hviOtyA3VY6lCfwspOHe8Q
         Ag+jZlX2CkuNwCq5dxxto/LkYlZIaxukAuSaBFYa9zuHvx43eIakxp/wYCuDsUzu3Y9k
         zaOiGg1Lmp+e1PHACnPhhLduGHhxWY3JddvA4EpGDai7KAJideu809/k/mJkq5V4YKAk
         xlYw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1780330950; x=1780935750; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1Wsv67Vk9GRUFlRdxu2VA3iBYDzYBLeu5jipj2Jvzw=;
        b=F1EblwjeshKaYQzyvVW45l7LMVCJhBgt4txsOZSG4j+umFJXqZXma0frwShdcCzi4h
         AWiPv6bW/3NHsur+voh1wcQKPkqp4V6bTFk797JCQJVKSxIQC3+JIl1fwGRXWFVwuZ1p
         e2zNbjb4heCTjrwX0Sf9ByAsMiniadPDttEG07Opi2jhjiQSzsH9ix3gfp4bjqejSswG
         LE50tgjKby8FJLK8sUGGS+xJ8xNY+qlIJWmihsoMSsaVXdrt1pQEP17Y5n1xbs82O0iJ
         C9AgWcIq2J3sptHaPQ9dp4a0pCCEIa8lHQ0x3ddgyA4liAZ018xGz8QBo5LpKHFDobr2
         uXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780330950; x=1780935750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A1Wsv67Vk9GRUFlRdxu2VA3iBYDzYBLeu5jipj2Jvzw=;
        b=ZHQmfx74LDZdZ7ipDN5nPgRo/XxnoS47+1fqG7FAaf+qnBfEHRANJIdU7vsLhexGYZ
         izykqi3K4Buk2KR7KdG8/irSpCyobavkCGpXctjNy1N/eEvOrTewZhRwAa4KoA2jOLOy
         hfBhpeT3ZLFUA4BZS2x6+WRYxFT39SCmwvvSJe1Da7u8Q0gW6Dst+n3ZiEHoOEj1QyfS
         AcGYbHPgmeqbI7oKeaDafib5f4AjcqcZUbNeLJ1SVs8F5uZXMeoNRuGPNL6atNbFA9Pu
         R2eEXbJ9KTDr6pAnEr/NDHBnU1uZl4DvgGHHsj/W9ImT+TUVkji26aMbopcD9U472tTJ
         AINA==
X-Forwarded-Encrypted: i=1; AFNElJ8HHfrTomwStKX9+SwD5YNzRDhuoc4qz6Ul5FUPUxd39gk/a9CZDxf96UiHlSKwGGAgHvDEDQvRwf6tNg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgDwG5V2DQmws37uXPBywkWX8i6wQGFHkelHWkQ9OSLe+Crs2K
	UuQqNexDVZMW/YoRPSTllbj3dek+tpv6rp+3C87hT8F0bO1NdLjitEo6rkEUtGuc/XQ8foCm6iE
	/AXuvVfoHHdQxHXFwHH50j0i3ryW3xSnXPku6GSoVYQ==
X-Gm-Gg: Acq92OFZaNdZs7yyt6i61Jh0cWoJJQjm+uODW2ezJqY9/vFV005iTz0V21ENjV7uHjn
	tO0FtwtFDapUjGELn3pmvoXg9d5MhX1ftqTCqcMNqpxDbluvhMrZyQQ4sCzrVyD1/u+J5x/VwUg
	Jap0GF0UlzjfgMgVSZ4hLLQVr1JReqlYoPRoF9vA62DIaiO5JxY2X9+YyjupL9gFePPpDKlyE7t
	HqBUBBjvXkqxSW0ukld0wPWngGXqRbmJhC6Ayx/zeqpf4HAUe4wIGHFhGILDFigl2yTBG7u6c9m
	FEMgxK87LTh0OWih3DEzLm/VNAmqebnCE/3xIF5TkZeQJqI9B2g=
X-Received: by 2002:a05:690e:138b:b0:660:7b47:24cc with SMTP id
 956f58d0204a3-6607b474ddamr5466859d50.1.1780330949770; Mon, 01 Jun 2026
 09:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com>
 <20251112-v5_user_cfi_series-v23-6-b55691eacf4f@rivosinc.com>
 <87jyslndo4.fsf@igel.home> <CAKC1njS=AHu6uHrH4ae8VxcdEbhgiPXYCAoN3F_mnppBd3SwOA@mail.gmail.com>
 <875x44o9hj.fsf@igel.home>
In-Reply-To: <875x44o9hj.fsf@igel.home>
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 1 Jun 2026 09:22:17 -0700
X-Gm-Features: AVHnY4J6Ejb9kcuTR-Xh2mJuobUXOxxIDSAgxNY81YZ-jI0UDO1cEHEz8fOc8KU
Message-ID: <CAKC1njSn_rtCj8ii876PNQTk0nsCTfWsb4DzdymufHVthh1Rkg@mail.gmail.com>
Subject: Re: [PATCH v23 06/28] riscv/mm : ensure PROT_WRITE leads to VM_READ | VM_WRITE
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Deepak Gupta via B4 Relay <devnull+debug.rivosinc.com@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	rust-for-linux@vger.kernel.org, Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_092231_486855_C69DB953 
X-CRM114-Status: GOOD (  14.15  )
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

T24gU2F0LCBNYXkgMzAsIDIwMjYgYXQgMjo0N+KAr1BNIEFuZHJlYXMgU2Nod2FiIDxzY2h3YWJA
bGludXgtbTY4ay5vcmc+IHdyb3RlOgo+Cj4gT24gTWFpIDMwIDIwMjYsIERlZXBhayBHdXB0YSB3
cm90ZToKPgo+ID4gSSBzZWUgdHdvIHdheXMgZm9yd2FyZDoKPiA+Cj4gPiAtIEl0IGNhbiBiZSBk
b25lIGluIGdlbmVyaWMgd2F5IHdoZXJlIGluY29taW5nIFBST1RfV1JJVEUgbWVhbnMKPiA+ICAg
UFJPVF9SRUFEIHwgUFJPVF9XUklURSBpcnJlc3BlY3RpdmUgb2YgUklTQy1WLiBBbHRob3VnaCBv
dGhlcnMKPiA+ICAgKHg4NiwgYXJtLCBldGMpIHdvdWxkIGhhdmUgdG8gd2VpZ2ggaW4uCj4gPgo+
ID4gT1IKPiA+Cj4gPiAtIG1tYXAwNCBMVFAgdGVzdCBjYW4gYmUgdXBkYXRlZCB0byBleHBlY3Qg
ZWl0aGVyIG9mICJydy1wIiBvciAiLXctcCIKPiA+ICAgd2hlbmV2ZXIgb25seSBQUk9UX1dSSVRF
IHdhcyBzcGVjaWZpZWQuCj4KPiBPUgo+Cj4gLSBBZGQgYSBuZXcgUFJPVF8gZmxhZy4KClRoaXMg
d2FzIHNldHRsZWQgd2hlbiB4ODYgaW50cm9kdWNlZCBzaGFkb3cgc3RhY2suIEluc3RlYWQgb2Yg
aGF2aW5nCm5ldyBgUFJPVF9gLCBpdCB3YXMgYWdyZWVkIHRvIGNyZWF0ZSBhIG5ldyBzeXNjYWxs
IGZvciBtYXBwaW5nIHNoYWRvdwpzdGFjayBtZW1vcnkgKHN5c2NhbGw6IGBtYXBfc2hhZG93X3N0
YWNrYCkuIFNjZW5hcmlvcyBsaWtlIGBjbG9uZTNgIG9yCmNvLXJvdXRpbmVzIHJlcXVpcmVkIG1h
bnVmYWN0dXJpbmcgYSBzaGFkb3cgc3RhY2ssIHRodXMgbmVjZXNzaXRhdGluZyBhCm5ldyBtZWNo
YW5pc20gdG8gY3JlYXRlIHNoYWRvdyBzdGFjayBzdHlsZSBtZW1vcnkgaW4gZGVtYW5kLiBJbnN0
ZWFkCm9mIGhhdmluZyBhIG5ldyBQUk9UXyBmbGFnLCAgYSBuZXcgc3lzY2FsbCB3YXMgY3JlYXRl
ZC4KCj4KPiAtLQo+IEFuZHJlYXMgU2Nod2FiLCBzY2h3YWJAbGludXgtbTY4ay5vcmcKPiBHUEcg
S2V5IGZpbmdlcnByaW50ID0gNzU3OCBFQjQ3IEQ0RTUgNEQ2OSAyNTEwICAyNTUyIERGNzMgRTc4
MCBBOURBIEFFQzEKPiAiQW5kIG5vdyBmb3Igc29tZXRoaW5nIGNvbXBsZXRlbHkgZGlmZmVyZW50
LiIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
