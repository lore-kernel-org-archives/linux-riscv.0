Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0660C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 01:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KFoGI6bMcDVHbr9dMp15QqWLcQheJx39Zm/leVyoT3I=; b=ajGFwb3Tw/ava3
	eNapXG8Ln+Pj7HAw8BTdoDs4/SbfRlDixMT3N8MIJJEab/xoRwOqNbmko2xLDm38hj7JoHq3PrL61
	TfLxRtfFS+xBAQ7hwrZdFCfCV43/7XjXNC7iGQ/mnxzrOfWI7gXI0qkBQfr+37OO+8lXZj8jXhojz
	CkKTOY8q+Ob9UghI6DFRUmGmMeZu2rVrzC+qRDLFciFAwk5yUjzkeuTmbHaq4Rv4CDmMUmkDLDQxr
	Ac9GJMCSacfynAHcFt2SYkG8p7rtPV1kbfi4OEu3+77Ka+Av8+1EIQiYa7eyOzXhOwXP5gxMVNAxT
	EO1uj6b14eGkFkdwRgeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAK5L-005wif-0Q;
	Tue, 05 Dec 2023 01:18:51 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAK5H-005wgj-0h
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 01:18:48 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-33350fcb2c7so816175f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 17:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701739123; x=1702343923; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jf8j7x8KL5+FXfau2GI8WqRGtfi/ioqnUgDBbWrCwc=;
        b=BmuseMKRoDntpGdNWpyThsUG+obH0gJkY+ZdBz4n9V0hIB94AX18djxzvogfvqY0b+
         Z43ps1zAYRRcQBoU30pz1B136k6QQ85wFqG1GFSOWFQkTZU+yoOs7Tvr3IWLnREiISVh
         NGPd7S4yEh1DX4aMHSH5ITt3ScfmoyvusxBphy1IY4BwVDca2AbmoWbQfcua/2lT/Rln
         oxoeQGrHOmSyN57nhfGP2SVDdkx3i5ubBG2fAonqbygmvlSNxo3u3UXDcr+8IGCIyyS2
         RLErryCFTGKVA+kD/Di95N2dprASm58veYEbxgnWV779ClK14mxgmLls2XvSw8lAc3Oy
         lmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701739123; x=1702343923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jf8j7x8KL5+FXfau2GI8WqRGtfi/ioqnUgDBbWrCwc=;
        b=oVTTYn6hkdZbdhMFbrpqkotYkf3V44qT+C6xw7hXkaHv8dQAlJ+KrC9yO+ZJpwFVtf
         F3Es8TxGEog88XWthXr8mYJWvtMR4aOt2ALMUIIHTfLmTga0bmMQh8Yfh0q7IYoSVLD7
         MXD2RK2MXt+H2Y6pxhEuNhvYncUYYSqqe5w9MBShTcgVSdbv6yPElO4RKw9FA+tmP8ot
         wIh8aiv/sL8lVeVmtdLeK3sKDOkkq7IDOHhBm25uJdyzoOEQbX0DrbWID71gCKacITbP
         gn9s1fHOJEQCd+PnrWie+kdYeZHl8fXSlXNEsGeAOTzw8G1Dv9aU6Isz87oYxCkq2cEy
         U0FA==
X-Gm-Message-State: AOJu0YzD4IiXRVeSn4xsFz3mNAeFfd6gP7VYNWdEZgIQgcFNHbdc4Iw2
	dyLIORF7nRD6kCVzuT6kIHo0h17LeMqfg3ffnEo=
X-Google-Smtp-Source: AGHT+IGEc+RU3aLyo6G6cXdlO/5FlaIRSUm657pq4pWBz4aI+C9RHW2IiSzyw85KCLQaAJWMQI8ODuDVbfqFALf2YSA=
X-Received: by 2002:adf:e78a:0:b0:333:2fd2:812c with SMTP id
 n10-20020adfe78a000000b003332fd2812cmr3734853wrm.73.1701739122768; Mon, 04
 Dec 2023 17:18:42 -0800 (PST)
MIME-Version: 1.0
References: <20231130133630.192490507@infradead.org> <20231130134204.136058029@infradead.org>
 <CAADnVQJqE=aE7mHVS54pnwwnDS0b67iJbr+t4j5F4HRyJSTOHw@mail.gmail.com>
 <20231204091334.GM3818@noisy.programming.kicks-ass.net> <20231204111128.GV8262@noisy.programming.kicks-ass.net>
 <20231204125239.GA1319@noisy.programming.kicks-ass.net> <ZW4LjmUKj1q6RWdL@krava>
 <20231204181614.GA7299@noisy.programming.kicks-ass.net> <20231204183354.GC7299@noisy.programming.kicks-ass.net>
In-Reply-To: <20231204183354.GC7299@noisy.programming.kicks-ass.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 4 Dec 2023 17:18:31 -0800
Message-ID: <CAADnVQJwU5fCLcjBWM9zBY6jUcnME3+p=vvdgKK9FiLPWvXozg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231204_171847_276476_7805E5A9 
X-CRM114-Status: GOOD (  17.45  )
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
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPgo+IFRMO0RSLCBJIHRoaW5rIHRoaXMgaXMgYSBwcmUt
ZXhpc3RpbmcgcHJvYmxlbSB3aXRoIGtDRkkgKyBlQlBGIGFuZCBub3QKPiBjYXVzZWQgYnkgbXkg
cGF0Y2hlcy4KCkl0J3MgYW4gb2xkIGlzc3VlIGluZGVlZC4KClRvIHdvcmthcm91bmQgSSBqdXN0
IGRpZDoKK19fbm9jZmkKIHN0YXRpYyBsb25nIGJwZl9mb3JfZWFjaF9hcnJheV9lbGVtKHN0cnVj
dCBicGZfbWFwICptYXAsCmJwZl9jYWxsYmFja190IGNhbGxiYWNrX2ZuLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpjYWxsYmFja19jdHgsIHU2NCBmbGFncykKCnRv
IHByb2NlZWQgZnVydGhlci4KdGVzdF9wcm9ncyBwYXNzZWQgZmV3IG1vcmUgdGVzdHMsIGJ1dCB0
aGVuIGl0IGhpdDoKClsgICAxMy45NjU0NzJdIENGSSBmYWlsdXJlIGF0IHRjcF9zZXRfY2Ffc3Rh
dGUrMHg1MS8weGQwICh0YXJnZXQ6CjB4ZmZmZmZmZmZhMDIwNTBkNjsgZXhwZWN0ZWQgdHlwZTog
MHgzYTQ3YWMzMikKWyAgIDEzLjk2NjM1MV0gaW52YWxpZCBvcGNvZGU6IDAwMDAgWyMxXSBQUkVF
TVBUIFNNUCBQVEkKWyAgIDEzLjk2Njc1Ml0gQ1BVOiAzIFBJRDogMjE0MiBDb21tOiB0ZXN0X3By
b2dzIFRhaW50ZWQ6IEcKTyAgICAgICA2LjcuMC1yYzMtMDA3MDUtZzQyMWRlZmQxYmVhMC1kaXJ0
eSAjNTI0NgpbICAgMTMuOTY3NTUyXSBIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5kYXJkIFBDIChp
NDQwRlggKyBQSUlYLCAxOTk2KSwKQklPUyByZWwtMS4xMi4wLTU5LWdjOWJhNTI3NmUzMjEtcHJl
YnVpbHQucWVtdS5vcmcgMDQvMDEvMjAxNApbICAgMTMuOTY4NDIxXSBSSVA6IDAwMTA6dGNwX3Nl
dF9jYV9zdGF0ZSsweDUxLzB4ZDAKWyAgIDEzLjk2ODc1MV0gQ29kZTogNzAgNDAgZmYgODQgYzAg
NzQgNDkgNDggOGIgODMgNjAgMDcgMDAgMDAgNGMgOGIKNTggMTAgNGQgODUgZGIgNzQgMWIgNDAg
MGYgYjYgZjUgNDggODkgZGYgNDEgYmEgY2UgNTMgYjggYzUgNDUgMDMgNTMKZjEgNzQgMDIgPDBm
PiAwYiAyZSBlOCBjNyBlZSAzMSAwMCAwZiBiNiA4MyA5MCAwNyAwMCAwMCA0MCA4MCBlNSAxZiAy
NAplMCA0MApbICAgMTMuOTc1NDYwXSBDYWxsIFRyYWNlOgpbICAgMTMuOTc1NjQwXSAgPElSUT4K
WyAgIDEzLjk3NTc5MV0gID8gX19kaWVfYm9keSsweDY4LzB4YjAKWyAgIDEzLjk3NjA2Ml0gID8g
ZGllKzB4YTQvMHhkMApbICAgMTMuOTc2MjczXSAgPyBkb190cmFwKzB4YTUvMHgxODAKWyAgIDEz
Ljk3NjUxM10gID8gdGNwX3NldF9jYV9zdGF0ZSsweDUxLzB4ZDAKWyAgIDEzLjk3NjgwMF0gID8g
ZG9fZXJyb3JfdHJhcCsweGI2LzB4MTAwClsgICAxMy45NzcwNzZdICA/IHRjcF9zZXRfY2Ffc3Rh
dGUrMHg1MS8weGQwClsgICAxMy45NzczNjBdICA/IHRjcF9zZXRfY2Ffc3RhdGUrMHg1MS8weGQw
ClsgICAxMy45Nzc2NDRdICA/IGhhbmRsZV9pbnZhbGlkX29wKzB4MmMvMHg0MApbICAgMTMuOTc3
OTM0XSAgPyB0Y3Bfc2V0X2NhX3N0YXRlKzB4NTEvMHhkMApbICAgMTMuOTc4MjIyXSAgPyBleGNf
aW52YWxpZF9vcCsweDM4LzB4NjAKWyAgIDEzLjk3ODQ5N10gID8gYXNtX2V4Y19pbnZhbGlkX29w
KzB4MWEvMHgyMApbICAgMTMuOTc4Nzk4XSAgPyB0Y3Bfc2V0X2NhX3N0YXRlKzB4NTEvMHhkMApb
ICAgMTMuOTc5MDg3XSAgdGNwX3Y2X3N5bl9yZWN2X3NvY2srMHg0NWMvMHg2YzAKWyAgIDEzLjk3
OTQwMV0gIHRjcF9jaGVja19yZXErMHg0OTcvMHg1OTAKWyAgIDEzLjk3OTY3MV0gIHRjcF92Nl9y
Y3YrMHg3MjgvMHhjZTAKWyAgIDEzLjk3OTkyM10gID8gcmF3Nl9sb2NhbF9kZWxpdmVyKzB4NjMv
MHgzNTAKWyAgIDEzLjk4MDI1N10gIGlwNl9wcm90b2NvbF9kZWxpdmVyX3JjdSsweDJmNi8weDU2
MApbICAgMTMuOTgwNTk2XSAgPyBpcDZfaW5wdXRfZmluaXNoKzB4NTkvMHgxNDAKWyAgIDEzLjk4
MDg4N10gID8gTkZfSE9PSysweDI5LzB4MWQwClsgICAxMy45ODExMzZdICBpcDZfaW5wdXRfZmlu
aXNoKzB4Y2IvMHgxNDAKWyAgIDEzLjk4MTQxNV0gID8gX19jZmlfaXA2X2lucHV0X2ZpbmlzaCsw
eDEwLzB4MTAKWyAgIDEzLjk4MTczOF0gIE5GX0hPT0srMHgxNzcvMHgxZDAKWyAgIDEzLjk4MTk3
MF0gID8gcmN1X2lzX3dhdGNoaW5nKzB4MTAvMHg0MApbICAgMTMuOTgyMjc5XSAgPyBsb2NrX3Jl
bGVhc2UrMHgzNS8weDJlMApbICAgMTMuOTgyNTQ3XSAgPyBsb2NrX3JlbGVhc2UrMHgzNS8weDJl
MApbICAgMTMuOTgyODIyXSAgPyBORl9IT09LKzB4MjkvMHgxZDAKWyAgIDEzLjk4MzA2NF0gID8g
X19jZmlfaXA2X3Jjdl9maW5pc2grMHgxMC8weDEwClsgICAxMy45ODM0MDldICBORl9IT09LKzB4
MTc3LzB4MWQwClsgICAxMy45ODM2NjRdICA/IGlwNl9yY3ZfY29yZSsweDUwLzB4NmMwClsgICAx
My45ODM5NTZdICA/IHByb2Nlc3NfYmFja2xvZysweDEzMi8weDI5MApbICAgMTMuOTg0MjY0XSAg
PyBwcm9jZXNzX2JhY2tsb2crMHgxMzIvMHgyOTAKWyAgIDEzLjk4NDU1N10gIF9fbmV0aWZfcmVj
ZWl2ZV9za2IrMHg1Yy8weDE2MApbICAgMTMuOTg0ODU2XSAgcHJvY2Vzc19iYWNrbG9nKzB4MTll
LzB4MjkwClsgICAxMy45ODUxNDBdICBfX25hcGlfcG9sbCsweDNmLzB4MWYwClsgICAxMy45ODU0
MDJdICBuZXRfcnhfYWN0aW9uKzB4MTkzLzB4MzMwClsgICAxMy45ODU2NzJdICBfX2RvX3NvZnRp
cnErMHgxNGQvMHgzZWEKWyAgIDEzLjk4NTk2M10gID8gZG9fc29mdGlycSsweDdmLzB4YjAKWyAg
IDEzLjk4NjI0M10gID8gX19kZXZfcXVldWVfeG1pdCsweDViLzB4ZDUwClsgICAxMy45ODY1NjNd
ICA/IGlwNl9maW5pc2hfb3V0cHV0MisweDIyMi8weDdhMApbICAgMTMuOTg2OTA2XSAgZG9fc29m
dGlycSsweDdmLzB4YjAKClRoZSBzdGFjayB0cmFjZSBkb2Vzbid0IGhhdmUgYW55IGJwZiwgYnV0
IGl0J3MgYSBicGYgaXNzdWUgdG9vLgpIZXJlIHRjcF9zZXRfY2Ffc3RhdGUoKSBjYWxscwppY3Nr
LT5pY3NrX2NhX29wcy0+c2V0X3N0YXRlKHNrLCBjYV9zdGF0ZSk7CndoaWNoIGNhbGxzIGJwZiBw
cm9nIHZpYSBicGYgdHJhbXBvbGluZS4KCnJlOiBicGZfaml0X2JpbmFyeV9wYWNrX2hkcigpLgoK
c2luY2UgY2ZpX21vZGUgaXMgX19yb19hZnRlcl9pbml0IHdlIGRvbid0IG5lZWQgdG8gd2FzdGUK
Y2ZpX29mZnNldCB2YXJpYWJsZSBpbiBwcm9nLT5hdXggYW5kIGluIGppdF9jb250ZXh0LgoKSG93
IGFib3V0CitpbnQgZ2V0X2NmaV9vZmZzZXQodm9pZCkKK3sKKyAgICAgICBzd2l0Y2ggKGNmaV9t
b2RlKSB7CisgICAgICAgY2FzZSBDRklfRklORUlCVDoKKyAgICAgICAgICAgICAgIHJldHVybiAx
NjsKKyAgICAgICBjYXNlIENGSV9LQ0ZJOgorI2lmZGVmIENPTkZJR19DQUxMX1BBRERJTkcKKyAg
ICAgICAgICAgICAgIHJldHVybiAxNjsKKyNlbHNlCisgICAgICAgICAgICAgICByZXR1cm4gNTsK
KyNlbmRpZgorICAgICAgIGRlZmF1bHQ6CisgICAgICAgICAgICAgICByZXR1cm4gMDsKKyAgICAg
ICB9Cit9CisKIHN0cnVjdCBicGZfYmluYXJ5X2hlYWRlciAqCiBicGZfaml0X2JpbmFyeV9wYWNr
X2hkcihjb25zdCBzdHJ1Y3QgYnBmX3Byb2cgKmZwKQogewotICAgICAgIHVuc2lnbmVkIGxvbmcg
cmVhbF9zdGFydCA9ICh1bnNpZ25lZCBsb25nKWZwLT5icGZfZnVuYzsKKyAgICAgICB1bnNpZ25l
ZCBsb25nIHJlYWxfc3RhcnQgPSAodW5zaWduZWQgbG9uZylmcC0+YnBmX2Z1bmMgLQpnZXRfY2Zp
X29mZnNldCgpOwoKYW5kIGhhdmUgX193ZWFrIHZlcnNpb24gb2YgZ2V0X2NmaV9vZmZzZXQoKSBp
biBicGYvY29yZS5jCnRoYXQgcmV0dXJucyAwIGFuZCBub24td2VhayBpbiBhcmNoL3g4NiBsaWtl
IGFib3ZlPwoKU2ltaWxhcmx5IHJlbW92ZSBwcm9nX29mZnNldCBmcm9tIGppdF9jb250ZXh0IGFu
ZCB1bmRvOgoKY3R4LT5wcm9nX29mZnNldCA9IGVtaXRfcHJvbG9ndWUoLi4uKQp0byBrZWVwIGl0
IGFzICdzdGF0aWMgdm9pZCBlbWl0X3Byb2xvZ3VlJwoKc2luY2UgY2ZpIG9mZnNldCBpcyBmaXhl
ZCBhdCBlYXJseSBib290IGFuZCB0aGUgc2FtZSBmb3IgYWxsIHByb2dzLgoKU2VwYXJhdGVseSB3
ZSBuZWVkIHRvIGRlYWwgd2l0aCBicGZfZm9yX2VhY2hfYXJyYXlfZWxlbSgpCndoaWNoIGRvZXNu
J3QgbG9vayBlYXN5LgpBbmQgZml4IHRjcF9zZXRfY2Ffc3RhdGUoKSBhcyB3ZWxsICh3aGljaCBp
cyBldmVuIGhhcmRlcikuCgpKdXN0IHRvIHNlZSB3aGVyZSBwbGFjZXMgbGlrZSB0aGVzZSBhcmUg
SSBkaWQ6CitfX25vY2ZpCiBCUEZfQ0FMTF80KGJwZl9sb29wLCB1MzIsIG5yX2xvb3BzLCB2b2lk
ICosIGNhbGxiYWNrX2ZuLCB2b2lkICosIGNhbGxiYWNrX2N0eCwKK19fbm9jZmkKIHN0YXRpYyBs
b25nIGJwZl9mb3JfZWFjaF9oYXNoX2VsZW0oc3RydWN0IGJwZl9tYXAgKm1hcCwKYnBmX2NhbGxi
YWNrX3QgY2FsbGJhY2tfZm4sCitfX25vY2ZpCiBzdGF0aWMgZW51bSBocnRpbWVyX3Jlc3RhcnQg
YnBmX3RpbWVyX2NiKHN0cnVjdCBocnRpbWVyICpocnRpbWVyKQorX19ub2NmaQogc3RhdGljIGlu
dCBfX2JwZl9yYnRyZWVfYWRkKHN0cnVjdCBicGZfcmJfcm9vdCAqcm9vdCwKK19fbm9jZmkKIEJQ
Rl9DQUxMXzQoYnBmX3VzZXJfcmluZ2J1Zl9kcmFpbiwgc3RydWN0IGJwZl9tYXAgKiwgbWFwLAor
X19ub2NmaQogdm9pZCB0Y3Bfc2V0X2NhX3N0YXRlKHN0cnVjdCBzb2NrICpzaywgY29uc3QgdTgg
Y2Ffc3RhdGUpCitfX25vY2ZpCiB2b2lkIHRjcF9pbml0X2Nvbmdlc3Rpb25fY29udHJvbChzdHJ1
Y3Qgc29jayAqc2spCitfX25vY2ZpCiB2b2lkIHRjcF9lbnRlcl9sb3NzKHN0cnVjdCBzb2NrICpz
aykKK19fbm9jZmkKIHN0YXRpYyB2b2lkIHRjcF9jb25nX2F2b2lkKHN0cnVjdCBzb2NrICpzaywg
dTMyIGFjaywgdTMyIGFja2VkKQorX19ub2NmaQogc3RhdGljIGlubGluZSB2b2lkIHRjcF9pbl9h
Y2tfZXZlbnQoc3RydWN0IHNvY2sgKnNrLCB1MzIgZmxhZ3MpCgphbmQgbW9yZS4uLiBXaGljaCBp
cyBjbGVhcmx5IG5vdCBhIGRpcmVjdGlvbiB0byBnby4KCkluc3RlYWQgb2YgYW5ub3RhdGluZyBj
YWxsZXJzIGlzIHRoZXJlIGEgd2F5IHRvIHNheSB0aGF0CmFsbCBicGZfY2FsbGJhY2tfdCBjYWxs
cyBhcmUgbm9jZmk/CgpJIGZlZWwgdGhlIHBhdGNoZXMgc2NyYXRjaGVkIHRoZSBpY2ViZXJnLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
