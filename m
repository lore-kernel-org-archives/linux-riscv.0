Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA65CD5BD1
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 17:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GbTaIDipshZ28f3rTT4WX+Xgq1xTj6kh2q75n6zCi0w=; b=xv2d8rp/65Wt4z
	HfQq9mLfy5/bpi6qYZd3duLCJmJtq+J1ed0fWJTYas59d/Eg7o/cCNXFXmNLsvLWaci8x54uQuv4Q
	EQoy4JA9PvTcifzym5aLx5XerIJfyWGdigcr9kUyO9JWXCfzxhnh3/6hmz9eOQyvJzyW1IKUpEa9Y
	B/mB8Eo6Fyl72Ef+oIEex79Vx1Q+L9NiKSFMfDA9Ep8XA/AUJa4DhkOMXGwBngT7vjpEAjHbFp9nL
	e7jTYlZMlaH1X8P7db6B22PPa6lNeCl925bytfkQ3x34JicWUWt8c1+ECSKkCuN3Jfew5BgWS7jks
	vp0sJ25xyWXtiSoMFgAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU6tf-0000000Bclq-3Pql;
	Mon, 01 Jun 2026 17:57:55 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU6td-0000000BclI-1M5D
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 17:57:54 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-7e3b2a435ecso14760727b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2026 10:57:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780336672; cv=none;
        d=google.com; s=arc-20240605;
        b=ifoSBwKXK46k+UwLBRJxQ7eSaURK8gZUrhjvpdKCqNwPr9QnLtAvHPmm1dTVCS4dg2
         DHn3QjNEVPOQl+EHQEc3lB35dEv27uvuGqBKh8rSpwVbgjKC8lwMB02HBbGT+7sfK37u
         xLCv8er5AOxC8jtozdB918AK5EDdoZm6ssFnPIb1+RxOrJQHIeZtJL91N8yocFXJdZcF
         4fWlednvq08OaQLftY3MfH0kSIltBxkeD9oC9RD1Kq3yXLjMBGNyCov6S0T5BUut0O2e
         dEtEsr3ESoV388Sz7etlhaT1SqU6KrnZWjFd+YMPRZz4Qeb5mVp57+nE8AYR1NuTF6hx
         wCiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FfE0OEt10KoqyrBxkVX83evIZS2y+17Dt49yMyisaOQ=;
        fh=Bg9obNmthggIMVRcTN5DL3+fSNE8P1k6K7mR3jLs5n4=;
        b=jnzqMTCKxFQP3hfnanRD3QcEI2Y5nyPzzbOiEFq5429fsVfnlnYrMjaXDlqxRXPJQn
         R5zuvoC7QWMhUZLhv61CpKJICFfdYa5APfR3cJia0inAZdpADxSLN1q5K4mhoCGfGLTP
         5cjQHEOKoDmGSorcfjuMQ8x8loqnQlmQGvlojxyf8hrXAApSkPecTFTt+FfmMcwK9LtM
         q7ga2hwOwVc3RVF8sEWFnQmHh1MrXzch19jSFoj3/lHFKFUExHEPvN7PK8lnAser9MV5
         wsLvv5thyArJD/vNIzWlLD5QfmLFwV/9dhdJc9LX1WDerHoJJu8sQhDEy+vCC5Tltlg2
         zE0w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1780336672; x=1780941472; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfE0OEt10KoqyrBxkVX83evIZS2y+17Dt49yMyisaOQ=;
        b=eUoQZ5lBb3eto+MixvJDqd6OHpA/8aG5fN//lmqPo6wazSgjGpOPQbUQRblzx0XfOQ
         gaEmnZTrkziWyK1jkgLyc3LDFlDAeK2QNPLMPrFEzigAohDVnqd//7Gc0P5KFEYfVB8A
         E3zo4H/bS+t6wQ90wNGCC0tot58XoKR2uTeBZlFHspqt79bGfOZcn7y/0pPWoE3+pydS
         BUku85SWXtqmRIgADNhe5SyzICQmPcwIyVWyaFD51mFRC3mHe3kgQQcNs87PX9jtLK4V
         BsKk8omPyXfWaPGQRzjshendCnxrAfq29NA0w5O1UVE+jdQVGchOaNLXqtg3HNXl+nSg
         bqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780336672; x=1780941472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FfE0OEt10KoqyrBxkVX83evIZS2y+17Dt49yMyisaOQ=;
        b=AehY4PkSMscgEaL+0Eg4AukqjALt3K72Wjfl7cILrlRKpQzcw/YPzDSgxcO/vtNO9b
         TAas61midpleNeHvQJxrElAi0Kv1+8uFIyF1X03l132lA2caGgDmutvrHu7kpf8XLbV8
         u8GS/aAoLspHYCjqLv5Pe0lWQe6/EPaBzWY2abwjVcGqkf7gHL4L0RqW1te+oLlRvAaI
         ZLsc+BH8jpKPZT0binLvdA2JUms0ephWI8uvGXZpZuwd6rVH/d4w8EMzin+MsdL8wWrH
         FZTZ1yyJcw2NHRk8698vAzpAKDJ+EeQPJUN/+NvjoKFj12+1gsiclBIy95LAvWZiLHT9
         FQew==
X-Forwarded-Encrypted: i=1; AFNElJ90pHRZvybSUwhCcKBBtaiBYrh9G8ANO5DDS5DGJmlF0yfQ5GqXFz+HXS2qThk/JNcnfEX6Qeqmat+UhA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwxbfsHo22VE6OLK/7DjTZmoZgXINhYpcCaFny3rlPzauZrsHD
	z/5mA3K5AsKZhrQ5sg6c9mxpU/KuAJuQxL4rkHktOv2FPuHSLgLTwkPDgUYIOBwmdrwGKIPj+ff
	Xs8oY4VGJXPPXRBkncD3eWiCkegUWkThr/NPxpzq36A==
X-Gm-Gg: Acq92OFaGNc1vuV6EG1oPlEQhUztbNXNgrFnHRbqvhJiOJUDCn9Vk/noDvmYLXh6rqJ
	2dSialUsL1KVbP3DgVKg870j+aCsqg1bLVxWei3nxV+1veOcluQ8UqUs3InZJt+oz/4QdSk3z6K
	hsDzmBKc/S5Pqn2CDAKbauk15gnkf9vX0x8FtRagyca9LmceTIKVKCYVASLKDr5OoUIKwxx9E92
	gnhOMMP7JVmTcHjRnV3vCmZaK4nn1jW/NVNDlOARZgpukcVjEBzHLjezLfiUwsvvcegABKdjAyQ
	RU6r4gbNsIoKJvgLXtuyD68b/xXF+K8DyfmjHUqmZ76v+oGt2jg=
X-Received: by 2002:a05:690c:30a:b0:7be:5f3e:5309 with SMTP id
 00721157ae682-7e05e853e5amr107636127b3.38.1780336672104; Mon, 01 Jun 2026
 10:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com>
 <20251112-v5_user_cfi_series-v23-6-b55691eacf4f@rivosinc.com>
 <87jyslndo4.fsf@igel.home> <CAKC1njS=AHu6uHrH4ae8VxcdEbhgiPXYCAoN3F_mnppBd3SwOA@mail.gmail.com>
 <875x44o9hj.fsf@igel.home> <CAKC1njSn_rtCj8ii876PNQTk0nsCTfWsb4DzdymufHVthh1Rkg@mail.gmail.com>
 <871peqgp9v.fsf@igel.home>
In-Reply-To: <871peqgp9v.fsf@igel.home>
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 1 Jun 2026 10:57:41 -0700
X-Gm-Features: AVHnY4J9AUNhuz056EYoPs-ULzO8_fe_9tgwbVh_N3bHNsdR65FJv6ifxqCKuXk
Message-ID: <CAKC1njR+dTdvp+BmLGPtgd8dufiUwBtkQ9a-qinELT_Fmi13sQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260601_105753_376828_9E66122A 
X-CRM114-Status: GOOD (  16.02  )
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

T24gTW9uLCBKdW4gMSwgMjAyNiBhdCAxMDoxMOKAr0FNIEFuZHJlYXMgU2Nod2FiIDxzY2h3YWJA
bGludXgtbTY4ay5vcmc+IHdyb3RlOgo+Cj4gT24gSnVuIDAxIDIwMjYsIERlZXBhayBHdXB0YSB3
cm90ZToKPgo+ID4gVGhpcyB3YXMgc2V0dGxlZCB3aGVuIHg4NiBpbnRyb2R1Y2VkIHNoYWRvdyBz
dGFjay4gSW5zdGVhZCBvZiBoYXZpbmcKPiA+IG5ldyBgUFJPVF9gLCBpdCB3YXMgYWdyZWVkIHRv
IGNyZWF0ZSBhIG5ldyBzeXNjYWxsIGZvciBtYXBwaW5nIHNoYWRvdwo+ID4gc3RhY2sgbWVtb3J5
IChzeXNjYWxsOiBgbWFwX3NoYWRvd19zdGFja2ApLiBTY2VuYXJpb3MgbGlrZSBgY2xvbmUzYCBv
cgo+ID4gY28tcm91dGluZXMgcmVxdWlyZWQgbWFudWZhY3R1cmluZyBhIHNoYWRvdyBzdGFjaywg
dGh1cyBuZWNlc3NpdGF0aW5nIGEKPiA+IG5ldyBtZWNoYW5pc20gdG8gY3JlYXRlIHNoYWRvdyBz
dGFjayBzdHlsZSBtZW1vcnkgaW4gZGVtYW5kLiBJbnN0ZWFkCj4gPiBvZiBoYXZpbmcgYSBuZXcg
UFJPVF8gZmxhZywgIGEgbmV3IHN5c2NhbGwgd2FzIGNyZWF0ZWQuCj4KPiBTbyB3aGF0IHByZXZl
bnRzIHJpc2N2IGZyb20gbWFraW5nIHVzZSBvZiBWTV9TSEFET1dfU1RBQ0sgc2ltaWxhciBhcwo+
IHg4Niwgd2l0aG91dCB0aGUgdXNlciB2aXNpYmxlIGVmZmVjdHM/CgpyaXNjdiB1c2VzIGBWTV9T
SEFET1dfU1RBQ0tgLiBJdCdzIGp1c3QgdmVyeSBzaW1wbGUgdG8gdXNlIGBwcm90ZWN0aW9uX21h
cGAKd2l0aCBqdXN0IGBWTV9XUklURWAuIE9uIFJJU0MtViwgYC1XLWAgaXMgYSBzaGFkb3cgc3Rh
Y2sgbWFwcGluZy4gSXQncyBub3Qgc2FtZQpvbiB4ODYgb3IgYXJtNjQuIFNvIGBwcm90ZWN0aW9u
X21hcFtWTV9XUklURV1gIHNpbXBseSBwaWNrcyBzaGFkb3cgc3RhY2sKZW5jb2RpbmcuIFdlIGp1
c3QgZW5zdXJlIHRoYXQgUFJPVF9XUklURSBpcyBjb252ZXJ0ZWQgdG8KIlZNX1JFQUQgfCBWTV9X
UklURSIgYXQgdm1hIGxldmVsLgoKc2VlIGNvbW1pdCBtZXNzYWdlCgoiIiIKRWFybGllciBgcHJv
dGVjdGlvbl9tYXBbVk1fV1JJVEVdYCB1c2VkIHRvIHBpY2sgcmVhZC13cml0ZSBQVEUgZW5jb2Rp
bmdzLgpOb3cgYHByb3RlY3Rpb25fbWFwW1ZNX1dSSVRFXWAgd2lsbCBhbHdheXMgcGljayBQQUdF
X1NIQURPV1NUQUNLIFBURQplbmNvZGluZ3MgZm9yIHNoYWRvdyBzdGFjay4gQWJvdmUgY2hhbmdl
cyBlbnN1cmUgdGhhdCBleGlzdGluZyBhcHBzCmNvbnRpbnVlIHRvIHdvcmsgYmVjYXVzZSB1bmRl
cm5lYXRoIGtlcm5lbCB3aWxsIGJlIHBpY2tpbmcKYHByb3RlY3Rpb25fbWFwW1ZNX1dSSVRFfFZN
X1JFQURdYCBQVEUgZW5jb2RpbmdzLgoiIiIKCkFzIEkgc2FpZCBvdGhlciBhcmNoZXMgaGF2ZSBh
IFZNQSBmbGFnIGZvciBzaGFkb3cgc3RhY2sgcmFuZ2UgYnV0IFBURSBlbmNvZGluZ3MKYW5kIG92
ZXJsYXlzIGFyZSBjb21wbGljYXRlZC4KCj4KPiAtLQo+IEFuZHJlYXMgU2Nod2FiLCBzY2h3YWJA
bGludXgtbTY4ay5vcmcKPiBHUEcgS2V5IGZpbmdlcnByaW50ID0gNzU3OCBFQjQ3IEQ0RTUgNEQ2
OSAyNTEwICAyNTUyIERGNzMgRTc4MCBBOURBIEFFQzEKPiAiQW5kIG5vdyBmb3Igc29tZXRoaW5n
IGNvbXBsZXRlbHkgZGlmZmVyZW50LiIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
