Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959B7C35274
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Dec 2023 00:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IPb/uX+8N+onL4sEb/ckLGDPmTb9VpjFRagW+yWJo8I=; b=Z0L6TbekcKmudi
	d3MgCJNBGL5QqrX06ePTUSH8Jl69Fy4rVmOejganNIO3SSSL2m8yyQ7zl0N43/VCAaP5jXGK15e7c
	Ma5e79JNRNGkhFz37oIM8XWTN25YsMvZcPbmHA93fLs12Bm9jN+ykxI+7rNjk3ROWH4IKu9Y4EiuY
	APx5m5fNMDmkc1aKdUsrfW6yB0LnmESkQu9WnZdHHZWh9r9Jvg0co2wUM4e7AleXfxtDirsronAiv
	VmkXRcOu71jOH79WJt37+/XgL5oMVHIdEcT15oo667cjC02LO5Nu0DmwHqfpJ13vyFrBm3BiZ1DuX
	O3dWgP3OCTGkzcFP5MMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEIwQ-00535s-36;
	Sat, 16 Dec 2023 00:54:07 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEIwN-00534w-34
	for linux-riscv@lists.infradead.org;
	Sat, 16 Dec 2023 00:54:05 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40c2308faedso14213515e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 16:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702688040; x=1703292840; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0wkBeN2mknWfCaYD90okNAjhG97xOBmh5EL3y5dSjM=;
        b=WxYooxT0SKpqSE6DQHDWbeG3LGbl6VYBcsNdH82pzBej8QXp/77h9y4IYqwBVAnlW6
         aZDS0LHC001CpxFWfHg1kyBbJnJgddWt9hZJ6RtWOIpwM5MJCXcZa9RKoH1WjBxZSMxV
         KaJ2RmtvODGBqWdCsL3aqZijEniIdDNtyQVv4zfPIOqm6pJUePnD3ZStYn79N9fPeWd9
         gvDfp9CsC57fLgV/RMt8s6YOKUba14e8KliQphdkJFuuPzPoPvD+jPRJ0uJPrr5WKYzT
         5W0HLtYa/oXsf3KHgK8EnOEv6YqQO+CKUCc7JWErd7mB/USlpkv4aEzHHAOX8ZR7poJB
         LDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702688040; x=1703292840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0wkBeN2mknWfCaYD90okNAjhG97xOBmh5EL3y5dSjM=;
        b=aYaB/mQkwq7TBrh6tRrD0t9pHNbm+dW9bGothuB1w0CfXwSTNJS54Z5GiT1lGBEhpH
         DtAj0xXGHkSKMCPslBquIs81cPLys5ugAbZJbNtx3xrK8+PVwkjh7beVIQOsejm/meSS
         8ZuVEEwBNLUcnuj5ajlNImo7SKtbdrDozSj7gSOO4bbUE9PrD3roEu3a2Nfj6rfwVKpa
         eRrnAdHmZ/S6nxOCJVmo+90FCXIy9WUOkVO9vlgeHh2r46q0/D2XOAPBFkiPyTsrASo6
         U4HO46zUCx6cZjj6WOrpvg0w8+X6MLmKyUk3gFyah7jWdDJgjKXYruyKSRNT1fNE+pIR
         yEpw==
X-Gm-Message-State: AOJu0Yy+rWP3qzL7nXFl0m0qKEY/Gy8lOZr0Zhj4yikJXHpEpK3ucfrB
	lbDGEiS9GSWf8+8tLq2W0KEuMy7JwazRl8q1Ldo=
X-Google-Smtp-Source: AGHT+IFuGmazbLWUSb4nLKggAzQnLeNmhiza7lIRh77ULXtw19cTSgKhotygxYJ0AUw8jKf6X6LfkImHGcy9Q5DkS7c=
X-Received: by 2002:adf:f609:0:b0:336:458b:38d with SMTP id
 t9-20020adff609000000b00336458b038dmr2405362wrp.115.1702688040032; Fri, 15
 Dec 2023 16:54:00 -0800 (PST)
MIME-Version: 1.0
References: <20231215091216.135791411@infradead.org>
In-Reply-To: <20231215091216.135791411@infradead.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 15 Dec 2023 16:53:48 -0800
Message-ID: <CAADnVQJoEkdjyCEJRPASjBw1QGsKYrF33QdMGc1RZa9b88bAEA@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] x86/cfi,bpf: Fix CFI vs eBPF
To: Peter Zijlstra <peterz@infradead.org>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Martin KaFai Lau <martin.lau@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	linux-arch <linux-arch@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Joao Moreira <joao@overdrivepizza.com>, 
	Mark Rutland <mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_165403_990001_F38AF5FA 
X-CRM114-Status: GOOD (  15.39  )
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

T24gRnJpLCBEZWMgMTUsIDIwMjMgYXQgMTozM+KAr0FNIFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBIaSEKPgo+IFdoYXQgc3RhcnRlZCB3aXRoIHRoZSBz
aW1wbGUgb2JzZXJ2YXRpb24gdGhhdCBicGZfZGlzcGF0Y2hlcl8qX2Z1bmMoKSB3YXMKPiBicm9r
ZW4gZm9yIGNhbGxpbmcgQ0ZJIGZ1bmN0aW9ucyB3aXRoIGEgX19ub2NmaSBjYWxsaW5nIGNvbnRl
eHQgZm9yIEZpbmVJQlQKPiBlbmRlZCB1cCB3aXRoIGEgY29tcGxldGUgQlBGIHdpZGUgQ0ZJIGZp
eHVwLgo+Cj4gV2l0aCB0aGVzZSBjaGFuZ2VzIG9uIHRoZSBCUEYgc2VsZnRlc3Qgc3VpdGUgcGFz
c2VzIHdpdGhvdXQgY3Jhc2hpbmcgLS0gdGhlcmUncwo+IHN0aWxsIGEgZmV3IGZhaWx1cmVzLCBi
dXQgQWxleGVpIGhhcyBncmFjaW91c2x5IG9mZmVyZWQgdG8gbG9vayBpbnRvIHRob3NlLgo+Cj4g
KEFsZXhlaSwgSSBoYXZlIHByZXN1bWVkIHlvdXIgU29CIG9uIHRoZSB2ZXJ5IGxhc3QgcGF0Y2gs
IHBsZWFzZSB1cGRhdGUKPiBhcyB5b3Ugc2VlIGZpdCkKPgo+IENoYW5nZXMgc2luY2UgdjIgYXJl
IG51bWVyb3VzIGJ1dCBpbmNsdWRlOgo+ICAtIGNmaV9nZXRfb2Zmc2V0KCkgLS0gYXMgYSBtZWFu
cyB0byBjb21tdW5pY2F0ZSB0aGUgb2Zmc2V0IChhc3QpCj4gIC0gNSBuZXcgcGF0Y2hlcyBmaXhp
bmcgdmFyaW91cyBCUEYgaW50ZXJuYWxzIHRvIGJlIENGSSBjbGVhbgoKTG9va3MgZ3JlYXQgdG8g
bWUuIFB1c2hlZCB0byBicGYtbmV4dC4KClRoZXJlIGlzIGEgZmFpbHVyZSBvbiBzMzkwIHRoYXQg
SSB0ZW1wb3JhcmlseSBkZW55bGlzdGVkCndpdGggYW4gZXh0cmEgcGF0Y2guCkFuZCBzZW50IGEg
cHJvcG9zZWQgZml4OgpodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvMjAyMzEyMTYwMDQ1NDku
NzgzNTUtMS1hbGV4ZWkuc3Rhcm92b2l0b3ZAZ21haWwuY29tLwoKSWx5YSwKcGxlYXNlIHRha2Ug
YSBsb29rLgoKPiBOb3RlOiBpdCAqbWlnaHQqIGJlIHBvc3NpYmxlIHRvIG1lcmdlIHRoZQo+IGJw
Zl9icGZfdGNwX2NhLmM6dW5zdXBwb3J0ZWRfb3BzW10gdGhpbmcgaW50byB0aGUgQ0ZJIHN0dWJz
LCBhcyBpcwo+IGdldF9pbmZvIHdpbGwgaGF2ZSBhIE5VTEwgc3R1YiwgdW5saWtlIHRoZSBvdGhl
cnMuCgpUaGF0J3MgYSBnb29kIGlkZWEuIFdpbGwgY2xlYW4gdXAgdW5zdXBwb3J0ZWRfb3BzLgpF
aXRoZXIgbXlzZWxmIG9yIE1hcnRpbiB3aWxsIGZvbGxvdyB1cC4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
