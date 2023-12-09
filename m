Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EECC10DC3
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Dec 2023 04:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1f82oFamTD7Z7N36+GRNW4GolPsMvv/D3ZwuYabZUXM=; b=FB3apXDe3WtD+0
	A6WNvADGEkaQpAVPjH5J1sY6TYrezsLxobgJ4b14+71p5bxzUHXGhXN58LZ226LV/U0e9nN6WN4yZ
	0fXsiyPI9TePLwq7wdpemuo6Xwl90rrR19kwc8OkT9c+M1NwF6q+oUdi/TTJ2Qy0v73bf7EFbWQTk
	OUWSpvzhju/QPuGRYgoR+ZS/wELen6dan0mo4YCxzReVigfzXdNwZpCByjl6N/pQE7U6U4UKPrc5+
	xZVv//iwZH5M+ryf4Gkt8MbWuerP8YUVDtOFn8xaDYNVmcR3Pm/mnJR1xabHVI3u4viFbNWtIO5KX
	gnITr0YTjVZCNFzukjwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBpJY-00H6RT-2B;
	Sat, 09 Dec 2023 04:51:44 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBpJW-00H6Qo-1N
	for linux-riscv@lists.infradead.org;
	Sat, 09 Dec 2023 04:51:43 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3332efd75c9so2567119f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 20:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702097499; x=1702702299; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9jLsGhfGkMZnWhDYfHQ0jvQvXqjfciOlusSLK9GhRY=;
        b=adHFhNbgmBzp9lnF129weXLrNjxDsuw2uezdEvv107aZ4wq7ghpIIp6sJOCT2nIV+W
         bMjyWZx+BrD6QCVhPI9rz+poe8tdBBJciQ5qm82VqC5iKRKvvhNE5kPW4S7HtTA6OU0+
         tWYaJCoIBdU55WohXZ1AxyRPRMNgRtUeOnnGEBk0xoT6dm4icBZNK34bcyyQ0Mz5hgzt
         XUJgMtmYs7lKCqO0OAOGmlEMzrwxxFZpUj2iq25FvfY2HKbokyToa6R5c+nJwkN6J9gr
         j0lQsDak/X1U2DCCN7Jdaw4ZKFcfz7gdbBFRARuePKweg3tpZQs1nbgWP+hiz7DgdpOS
         iLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702097499; x=1702702299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9jLsGhfGkMZnWhDYfHQ0jvQvXqjfciOlusSLK9GhRY=;
        b=BxXS77kv2DmViZeEa4Dyg85HIfOHjE5mWvxrpYzVTgAWx6jpcxvRGoFauBWQHGybDB
         dUNWwuPshzEdneOhh3vn4paOc5865dC6mN9MqUloDGkSJua/h9/WH0OlfzZY81MYSAW4
         6/GR3S0QtGWhKKnD4hhQS5XWZQSn6ookiUvNJ/JiV0NeuOICx/7AeYG2LCFwfj1CE35r
         FFKDk4cw48VEqfhnAzJbRPTfT+pSxiV4sXSivH4lifP6NPYheaCi68ZQAF+jHRmmMPXU
         3L1uXtiOhDdzzQGmtCOJ4DZnehY6zC2Ui/b4c/SxgtoS8lfo83078/VeXse0KmIPI7VM
         NtoQ==
X-Gm-Message-State: AOJu0Yyfxio/gEZYDh/r8f+kh9w3cVuAthRJNddUOwUGnzwB+bQNEX3I
	BaF3sbjUfHgAu/psikqjxFmY8LvRU7Eb+wOoERE=
X-Google-Smtp-Source: AGHT+IGWegoXbG6riU09aOxjScmI6QdU76ibtag8Pupqd8K6QoQZC3fgz8qhZUFCULCtLMsl2YQJg9oU3fR3idrWio4=
X-Received: by 2002:adf:ce8d:0:b0:333:49a8:73e4 with SMTP id
 r13-20020adfce8d000000b0033349a873e4mr197659wrn.201.1702097499187; Fri, 08
 Dec 2023 20:51:39 -0800 (PST)
MIME-Version: 1.0
References: <20231207093105.GA28727@noisy.programming.kicks-ass.net>
 <ivhrgimonsvy3tyj5iidoqmlcyqvtsh2ay3cm3ouemsdbvjzs4@6jlt6zv55tgh>
 <20231208102940.GB28727@noisy.programming.kicks-ass.net> <20231208134041.GD28727@noisy.programming.kicks-ass.net>
 <20231208172152.GD36716@noisy.programming.kicks-ass.net> <CAADnVQKsnZfFomQ4wTZz=jMZW5QCV2XiXVsi64bghHkAjJtcmA@mail.gmail.com>
 <20231208203535.GG36716@noisy.programming.kicks-ass.net> <CAADnVQJzCw=qcG+jHBYG0q0SxLPkwghni0wpgV4A4PkpgVbGPw@mail.gmail.com>
 <20231208205241.GK28727@noisy.programming.kicks-ass.net> <CAADnVQL3KsJONShsstDq5jrpbc_4FOU-VQPJgDCt50N9asoFzA@mail.gmail.com>
 <20231208224557.GH36716@noisy.programming.kicks-ass.net>
In-Reply-To: <20231208224557.GH36716@noisy.programming.kicks-ass.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 8 Dec 2023 20:51:27 -0800
Message-ID: <CAADnVQ+Z7UcXXBBhMubhcMM=R-dExk-uHtfOLtoLxQ1XxEpqEA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] x86/cfi,bpf: Fix BPF JIT call
To: Peter Zijlstra <peterz@infradead.org>
Cc: Jiri Olsa <olsajiri@gmail.com>, Song Liu <song@kernel.org>, 
	Song Liu <songliubraving@meta.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, 
	bpf <bpf@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Joao Moreira <joao@overdrivepizza.com>, Mark Rutland <mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_205142_465431_4801D282 
X-CRM114-Status: GOOD (  15.81  )
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

T24gRnJpLCBEZWMgOCwgMjAyMyBhdCAyOjQ24oCvUE0gUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPgo+Cj4gT2ssIGRpZCB0aGF0LiBDdXJyZW50IHBhdGNoZXMg
KG9uIHRvcCBvZiBicGYtbmV4dCkgYXJlIGhlcmU6Cj4KPiAgIGdpdDovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wZXRlcnovcXVldWUuZ2l0IHg4Ni9jZmkKCkxvb2tz
IHJlYWxseSBncmVhdC4gVGhlIGxhc3QgcGF0Y2ggaXMgY2xlYW5lciB0aGFuIEkgZXhwZWN0ZWQu
IEdvb2QgaWRlYS4KCj4gKHJlYWxseSBzaG91bGQgdHJ5IGFuZCB3cml0ZSBiZXR0ZXIgY2hhbmdl
bG9ncywgYnV0IGl0J3MgdG9vIGxhdGUpCgpjb21taXQgbG9ncyBsb29rIGZpbmUgZXhjZXB0IHRo
ZSAicGlsZmVyIiB3b3JkIHRoYXQgSSBoYWQgdG8gbG9vayB1cAppbiB0aGUgZGljdGlvbmFyeSA6
KQoKPiBbICAyNDcuNzIxMDYzXSAgPyBicGZfdGhyb3crMHg5Yi8weGYwCj4gWyAgMjQ3LjcyMTEy
Nl0gID8gYnBmX3Rlc3RfcnVuKzB4MTA4LzB4MzUwCj4gWyAgMjQ3LjcyMTE5MV0gID8gYnBmX3By
b2dfNTU1NTcxNGI2ODViZjBjZl9leGNlcHRpb25fdGhyb3dfYWx3YXlzXzErMHgyNi8weDI2Cj4g
WyAgMjQ3LjcyMTMwMV0gID8gYnBmX3Rlc3RfcnVuKzB4MTA4LzB4MzUwCj4gWyAgMjQ3LjcyMTM2
OF0gIGJwZl90ZXN0X3J1bisweDIxMi8weDM1MAo+IFsgIDI0Ny43MjE0MzNdICA/IHNsYWJfYnVp
bGRfc2tiKzB4MjIvMHgxMTAKPiBbICAyNDcuNzIxNTAzXSAgYnBmX3Byb2dfdGVzdF9ydW5fc2ti
KzB4MzQ3LzB4NGEwCj4KPiBCdXQgSSdtIHRvbyB0aXJlZCB0byB0aGluayBzdGFpZ2h0LiBJcyAg
dGhpcyBhIGJwZl9jYWxsYmFja190IHZzCj4gYnBmX2V4Y2VwdGlvbl9jYiBkaWZmZXJlbmNlPwoK
WWVwLgpJdCdzIGVhc3kgdG8gZml4OgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9icGYuaCBi
L2luY2x1ZGUvbGludXgvYnBmLmgKaW5kZXggMGUxNjJlYWU4NjM5Li5lMzZiM2Y0MTc1MWUgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvYnBmLmgKKysrIGIvaW5jbHVkZS9saW51eC9icGYuaApA
QCAtMTQ4NCw3ICsxNDg0LDcgQEAgc3RydWN0IGJwZl9wcm9nX2F1eCB7CiAgICAgICAgaW50IGNn
cm91cF9hdHlwZTsgLyogZW51bSBjZ3JvdXBfYnBmX2F0dGFjaF90eXBlICovCiAgICAgICAgc3Ry
dWN0IGJwZl9tYXAgKmNncm91cF9zdG9yYWdlW01BWF9CUEZfQ0dST1VQX1NUT1JBR0VfVFlQRV07
CiAgICAgICAgY2hhciBuYW1lW0JQRl9PQkpfTkFNRV9MRU5dOwotICAgICAgIHVuc2lnbmVkIGlu
dCAoKmJwZl9leGNlcHRpb25fY2IpKHU2NCBjb29raWUsIHU2NCBzcCwgdTY0IGJwKTsKKyAgICAg
ICB1NjQgKCpicGZfZXhjZXB0aW9uX2NiKSh1NjQgY29va2llLCB1NjQgc3AsIHU2NCBicCwgdTY0
LCB1NjQpOwogI2lmZGVmIENPTkZJR19TRUNVUklUWQogICAgICAgIHZvaWQgKnNlY3VyaXR5Owog
I2VuZGlmCmRpZmYgLS1naXQgYS9rZXJuZWwvYnBmL2hlbHBlcnMuYyBiL2tlcm5lbC9icGYvaGVs
cGVycy5jCmluZGV4IGZlMjI5YjI4ZTRhOS4uNjUwZWJlOGZmMTgzIDEwMDY0NAotLS0gYS9rZXJu
ZWwvYnBmL2hlbHBlcnMuYworKysgYi9rZXJuZWwvYnBmL2hlbHBlcnMuYwpAQCAtMjUzNyw3ICsy
NTM3LDcgQEAgX19icGZfa2Z1bmMgdm9pZCBicGZfdGhyb3codTY0IGNvb2tpZSkKICAgICAgICAg
KiB3aGljaCBza2lwcyBjb21waWxlciBnZW5lcmF0ZWQgaW5zdHJ1bWVudGF0aW9uIHRvIGRvIHRo
ZSBzYW1lLgogICAgICAgICAqLwogICAgICAgIGthc2FuX3VucG9pc29uX3Rhc2tfc3RhY2tfYmVs
b3coKHZvaWQgKikobG9uZyljdHguc3ApOwotICAgICAgIGN0eC5hdXgtPmJwZl9leGNlcHRpb25f
Y2IoY29va2llLCBjdHguc3AsIGN0eC5icCk7CisgICAgICAgY3R4LmF1eC0+YnBmX2V4Y2VwdGlv
bl9jYihjb29raWUsIGN0eC5zcCwgY3R4LmJwLCAwLCAwKTsKICAgICAgICBXQVJOKDEsICJBIGNh
bGwgdG8gQlBGIGV4Y2VwdGlvbiBjYWxsYmFjayBzaG91bGQgbmV2ZXIgcmV0dXJuXG4iKTsKIH0K
CmFuZCB3aXRoIHRoYXQgYWxsIG9mIHRlc3RfcHJvZ3MgcnVucyBzdWNjZXNzZnVsbHkgd2l0aG91
dCBDRkkgcGFuaWNzLgoqaGFwcHkgZGFuY2UqCgpPbmx5IHRlc3RfcHJvZ3MgLXQgYnRmL2xpbmVf
aW5mbyBmYWlscyBzdXNwaWNpb3VzbHkuClRoZXJlIHdlIGNoZWNrIHRoYXQgbGluZSBpbmZvIGVt
YmVkZGVkIGluIHRoZSBwcm9nIGxvb2tzIHNhbmUuCk5ldyBjZmkgcHJlYW1ibGUgaXMgcHJvYmFi
bHkgdHJpcHBpbmcgc29tZXRoaW5nLgpJdCBjb3VsZCBiZSBhIHRlc3QgaXNzdWUuIEknbGwgaW52
ZXN0aWdhdGUuIEl0J3Mgbm90IGEgYmxvY2tlci4KCkRvIHlvdSBtaW5kIHJlc2VuZGluZyB0aGUg
d2hvbGUgc2V0IHNvIHRoYXQgQlBGIENJIGNhbiB0ZXN0IGl0Cm9uIGRpZmZlcmVudCBhcmNocyA/
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
