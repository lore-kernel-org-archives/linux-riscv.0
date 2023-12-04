Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1636BC4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 18:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FmW8yDdvyFAGT21B3Nsd3sYxrT0T8csB8v27eZELMG8=; b=lyjpYVJJRO7su9
	lwRNdWmebrN38RIvB0Sjq/QTrkIpiws24CW16s3oPmYzF+10RSlhFh5SAVAVGct+QljyynSN3KXsC
	h4A0AOtc/MCzNzvgdk9Xcbp4xXK9g7EFAXPQPw7l9sS3hCLBBoRXUsWbqkAyExj6JZHiGNV4FUJwz
	h6Sy5fBfiSYEpc85sH7wZSjt9rl7cwHudQrbzsVXYUP4qJCGV0TMsJCF+TlgV6CHgBpuYZ1VhrM4v
	ONEdDnuxfhsppxg+WbrIdhcKauDemaYOSVga1hb37kI4vux45UMnEx8qt8Qpbv2Eepmz3j8KvF5LT
	8CQZlyi0PCa2iqJ2JEcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAEAJ-005OVo-07;
	Mon, 04 Dec 2023 18:59:35 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAEAG-005OU2-09
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 18:59:33 +0000
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-7c44b09f9f9so2889148241.0
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 10:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701716367; x=1702321167; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhTNasiWgh+dkfX0Dm+ISFeJznRbPndi9WOsk0B0xUY=;
        b=3nEN06ITWvXGiTLJ7/HLGTomw4sw0hVK4Z6nSNTzG9iGzsNzEEVZdvwACRlGNU28t7
         brMcIjCTw0YuLECclD8DAfeLczXA8/YXw6hNXnbTZuME5VBiaruzD8QhyUATTheqxF3b
         8hR8hcF4UOMj6A/Apt1+QxCPJmzPuLgz+UivH4jfINt6VvxVETnwiqszMfjtZchVfUmS
         k1Qbr9WM3y4zPhk41hYqDt1H0Y5ocC1Um7cIKp0myLXg8/eZwqvdA4MDRwhIYd0chUQA
         4+Sq3/yg+GWumQoB43eu6OoeNvWDP4eKBzZyEHi79A8MFsGizbj8r5tL1/5vGzfQcOPn
         WlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701716367; x=1702321167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhTNasiWgh+dkfX0Dm+ISFeJznRbPndi9WOsk0B0xUY=;
        b=STUajunI/S+Z3ywZyfxJMoKafeyHJJpsPhceLTFXKhN6Vs70J+TeO3koHtk+CAu2nB
         zIJEc1J+5sVCvfgHPI0BUKuhxiPcwPQAFK2Otwkz/WXNIm7+pMFRFP3lVRdz+I6XZVqi
         LyMZDv3Ro/Fp7po7YhSYH9fqLxKuEEWXZ2bApIM1T5XzRU/zug5zr4Wk8MmDjw+pAIQ6
         0RWdvh7YImXcNfBMgbUyvIa0At8Vyp00eCyOZ5aOVnehumSiFYy56XZLGr523b53QgIx
         g+E9xUC/Jq0kBolRmVpfEBr5oYgtSJ4ocO+QCE/Z6grwnjP96JctqLmb7SN3+HNsNgqX
         iVjA==
X-Gm-Message-State: AOJu0Yw/ei3qxcMkEyc6r2H8opg5iZfAxkX6pdDDNSFcVGeoW92qIQpg
	ieKoVOLUf99qi1Xlwnf7tumPocC18Q+yRMmswAhhng==
X-Google-Smtp-Source: AGHT+IEfIkpQz/M9GZdrLZVheDNrcWpdTi70JO843+0WuxJNqy5io3mjCriO6X0r0jWpNfjDIVrEn82cF2d3kchgVn8=
X-Received: by 2002:a05:6102:a53:b0:452:6d82:56e3 with SMTP id
 i19-20020a0561020a5300b004526d8256e3mr383189vss.6.1701716367163; Mon, 04 Dec
 2023 10:59:27 -0800 (PST)
MIME-Version: 1.0
References: <20231130133630.192490507@infradead.org> <20231130134204.136058029@infradead.org>
 <CAADnVQJqE=aE7mHVS54pnwwnDS0b67iJbr+t4j5F4HRyJSTOHw@mail.gmail.com>
 <20231204091334.GM3818@noisy.programming.kicks-ass.net> <20231204111128.GV8262@noisy.programming.kicks-ass.net>
 <20231204125239.GA1319@noisy.programming.kicks-ass.net> <ZW4LjmUKj1q6RWdL@krava>
 <20231204181614.GA7299@noisy.programming.kicks-ass.net> <20231204183354.GC7299@noisy.programming.kicks-ass.net>
In-Reply-To: <20231204183354.GC7299@noisy.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 4 Dec 2023 10:58:48 -0800
Message-ID: <CABCJKudYc5GtO7TLV=d0-ZYFfBxofrV3-q1vpsaT3MD7oTKpnA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] x86/cfi,bpf: Fix BPF JIT call
To: Peter Zijlstra <peterz@infradead.org>
Cc: Jiri Olsa <olsajiri@gmail.com>, Alexei Starovoitov <alexei.starovoitov@gmail.com>, 
	Song Liu <song@kernel.org>, Song Liu <songliubraving@meta.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	linux-arch <linux-arch@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Joao Moreira <joao@overdrivepizza.com>, 
	Mark Rutland <mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_105932_103211_741F7CFB 
X-CRM114-Status: GOOD (  16.23  )
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

T24gTW9uLCBEZWMgNCwgMjAyMyBhdCAxMDozNOKAr0FNIFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBTbyBhZmFpY3QgdGhpcyBpcyB1c2VkIHRocm91Z2gg
YnBmX2Zvcl9lYWNoX21hcF9lbGVtKCksIHdoZXJlIHRoZQo+IGFyZ3VtZW50IHN0aWxsIGlzIHBy
b3Blcmx5IGNhbGxiYWNrX2ZuLiBIb3dldmVyLCBpbiB0aGUgZGVzcmlwdG9yCj4gYnBmX2Zvcl9l
YWNoX21hcF9lbGVtX3Byb3RvIHRoZSBhcmd1bWVudCBnZXRzIGRlc2NyaWJlZCBhczoKPiBBUkdf
UFRSX1RPX0ZVTkMsIHdoaWNoIGluIHR1cm4gaGFzIGEgY29tbWVudCBsaWtlOgo+Cj4gICBBUkdf
UFRSX1RPX0ZVTkMsICAgICAgICAvKiBwb2ludGVyIHRvIGEgYnBmIHByb2dyYW0gZnVuY3Rpb24g
Ki8KPgo+IFdoaWNoIHRvIG1lIHNvdW5kcyBsaWtlIHRoZXJlIGlzIGRlZmluaXRlIHR5cGUgcHVu
bmluZyBpbnZvbHZlZC4gVGhlCj4gY2FsbCBpbiBicGZfZm9yX2VhY2hfYXJyYXlfZWxlbSgpIGlz
IGEgcmVndWxhciBDIGluZGlyZWN0IGNhbGwsIHdoaWNoCj4gZ2V0cyBhZG9ybmVkIHdpdGggdGhl
IGtDRkkgbWFnaWMuCj4KPiBCdXQgSSBkb3VidCB0aGUgQlBGIGZ1bmN0aW9uIHRoYXQgZ2V0cyB1
c2VkIGdldHMgdGhlIGNvcnJlY3QgbWF0Y2hpbmcKPiBiaXRzIG9uLgo+Cj4gVEw7RFIsIEkgdGhp
bmsgdGhpcyBpcyBhIHByZS1leGlzdGluZyBwcm9ibGVtIHdpdGgga0NGSSArIGVCUEYgYW5kIG5v
dAo+IGNhdXNlZCBieSBteSBwYXRjaGVzLgoKSXQgaXMgYSBwcmUtZXhpc3RpbmcgcHJvYmxlbSwg
SSByYW4gaW50byB0aGUgc2FtZSBmYWlsdXJlcyB3aGVuIEkKbG9va2VkIGludG8gdGhpcyBicmll
Zmx5IGxhc3QgeWVhcjoKCmh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgvbGludXgv
aXNzdWVzLzE3MjcKCkluIGFkZGl0aW9uIHRvIGJwZl9mb3JfZWFjaF9hcnJheV9lbGVtLCBhIGZl
dyBvdGhlciBjYWxsZXJzIGFsc28gdXNlCnRoZSBzYW1lIGZ1bmN0aW9uIHBvaW50ZXIgdHlwZSB0
aGF0IGRvZXNuJ3QgbWF0Y2ggY2ZpX2JwZl9oYXNoLgoKU2FtaQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
