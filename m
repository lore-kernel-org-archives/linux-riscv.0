Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C0DC71136
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 22:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VhpqRL7D2WVELdZkFy0C0yyd/zB9f4m9vZc2tjFgVmE=; b=TtzttC6FsTfxWv
	p/WWlxJX5ipcZU42owbbnKb2F8L/POOzq1ZMv9IaV9Q1xP5kHymkqIahfqGGmiOX+QT2yPcffac7b
	yFKFIYlsI0amFxk5dXOUMNe6/nIaj5rUlq5/cToaBTSoK6c4o9YPwnQ09UEPM7Qxmoy6acA7E7dZP
	rNLPDQxVHQG3l8eHzL1IcbXdc1C2bhbifBzsCFRS600DnLatGBYe60lLpRs2e0yGb3wBTPfYCXtgu
	a/eQE0NbHJwxUr9X2JYTRCBUSpTRu2ZyRQ3aOJfoHCr4Pb3L7cyAuNQEtAM4AiF3CBPM2RQc/myrK
	DMK4g9ji1Y0VvipS59cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQD0P-00000000EWs-3Gye;
	Fri, 13 Jun 2025 22:36:13 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQD0M-00000000EWB-3zTO;
	Fri, 13 Jun 2025 22:36:12 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a35c894313so2631078f8f.2;
        Fri, 13 Jun 2025 15:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749854169; x=1750458969; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDhN0PQzQ9wgEHlw7OXTzGjuQH3XOnQA5xq1WBIqnek=;
        b=DMjax0zMksdv5+pp6WptQ2jn1L3UzpTOcUGCJmh6VcoYoS+TWz+/CX0QVdXskq1H3X
         mCMgFSNYfYRsdK+NE0qdXF2EDemXEIgsRRy/MU9GqwWc+yUTmepPUwPJHCIEOLOSAfPn
         z620zY0PWvu3MDCupHJrmTDTvvTJE4mQKnyqh7/7Riy6DH6mE9j/a4U8PEZw4XWc6umK
         iFMBibAjhJa2dhpYWOR4QNGm8Skek+c4brim4292tQocq57yfi5DDm0V0quMLey0nUh1
         DfxeiuTjc3B/YAq6f0ydRYMuhaDintOFYI6Hm0ewHdiqIqtUd5UHOEFadFdwjywPAFVP
         y1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749854169; x=1750458969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDhN0PQzQ9wgEHlw7OXTzGjuQH3XOnQA5xq1WBIqnek=;
        b=vPffMHSKjSxW/xgbGaG0QoPElJlWLCTvLC72gJUrRDrEu/uLZag1vlndefWhFH5IK1
         MhjwHnK6kqDxcXLm1O6367W05jFAj/WAUBbDDkVqWpDWo91LCgM3Z9nNmUZR41GFvVkw
         wD74c+fL1q9g70vWr6vZuldJZbf3tKbC9HYyZLOaBh53NNon7Qn+1QeVr+H59VLhK8l7
         TdJMY3Idfd57qqH/3Em3eF4R+M5LcARqxLnyka2OU8AEWM7V/NfUgFM+J9cHtstMGCN6
         bIxMF47gvi114/WRndURUlx0FoBRqF17nMb5hMsCQzBtp1kd2E1fWcIayt+2FA9KLC/C
         xUbA==
X-Forwarded-Encrypted: i=1; AJvYcCUsBWl1XgR3wPFY1ci2xhzZLn3Th/XydkXoFHYM+pitQbKWPl6Xfi0RxM1/X00uYw5nr+B/qn0utGmG5RrEfoTY@lists.infradead.org, AJvYcCXowg/TrfWED0WG3sr4P1B2UpVQ3dda1sZh8TmL4mLo7V687enf/XuNUIigXxlbNfKt7V+dVKSDIJE9Kh0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvEjZ6p1cl0P71ckx8FYAE12GZjMfklLrWcp1omFEFv5vDg/nn
	H4nUr2AtjXFZpj8cwt0Uik48fyEDVVIxfAFHO1LAkHGZr8nrpZXgiEJ8rIjT3XDiUIgeoJoFLXb
	jLbz3owKEWqGsKAfw5CWsVjLGgvmsQ9A=
X-Gm-Gg: ASbGnct0/fdq8/G8vNG0DOicXsQChLIEDCtqiIBDhYZNY6/uCPenxL2gThVA+tMjyXc
	Sr0lAyLvhG28o3jsryaVCooWv2udnAhC0SodurRPA+EfR0ir82RUR/0PiCzRdpvzgV12gB1QnAZ
	j61KerfPCYNBPDbFXP4F1UzHM3nXE46YEArnGPaTroEy23N/2Txg7DrVSMent37kBhOQ4Bxr6d
X-Google-Smtp-Source: AGHT+IGvAZU4d5tXw0nhgWlSwGRKFbuaQhR8GZiHa22TV57O0MRl7T0f9v9YaYzOJredMJW3TgBMxueem5pPB3YsBNg=
X-Received: by 2002:a05:6000:40dd:b0:3a5:2694:d75f with SMTP id
 ffacd0b85a97d-3a572e895fbmr1535518f8f.52.1749854168416; Fri, 13 Jun 2025
 15:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com>
 <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com>
 <20250613081150.GJ2273038@noisy.programming.kicks-ass.net>
 <DAL9GRMH74F4.2IV0HN0NGU65X@bootlin.com> <20250613083232.GL2273038@noisy.programming.kicks-ass.net>
 <DALA5WYA04OG.1283TZDOVLBPS@bootlin.com>
In-Reply-To: <DALA5WYA04OG.1283TZDOVLBPS@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 13 Jun 2025 15:35:57 -0700
X-Gm-Features: AX0GCFvxnM-s8AungljiWEt_LCtzKmPe0DGMu2VqQrNsxFmjrZ6Pec_NoZEOn-E
Message-ID: <CAADnVQ+sj9XhscN9PdmTzjVa7Eif21noAUH3y1K6x5bWcL-5pg@mail.gmail.com>
Subject: Re: [PATCH bpf 2/7] bpf/x86: prevent trampoline attachment when args
 location on stack is uncertain
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Menglong Dong <imagedong@tencent.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	ebpf@linuxfoundation.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	Network Development <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	ppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_153610_992667_F436A08C 
X-CRM114-Status: GOOD (  29.97  )
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

T24gRnJpLCBKdW4gMTMsIDIwMjUgYXQgMTo1OeKAr0FNIEFsZXhpcyBMb3Rob3LDqQo8YWxleGlz
LmxvdGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gRnJpIEp1biAxMywgMjAyNSBhdCAx
MDozMiBBTSBDRVNULCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPiA+IE9uIEZyaSwgSnVuIDEzLCAy
MDI1IGF0IDEwOjI2OjM3QU0gKzAyMDAsIEFsZXhpcyBMb3Rob3LDqSB3cm90ZToKPiA+PiBIaSBQ
ZXRlciwKPiA+Pgo+ID4+IE9uIEZyaSBKdW4gMTMsIDIwMjUgYXQgMTA6MTEgQU0gQ0VTVCwgUGV0
ZXIgWmlqbHN0cmEgd3JvdGU6Cj4gPj4gPiBPbiBGcmksIEp1biAxMywgMjAyNSBhdCAwOTozNzox
MUFNICswMjAwLCBBbGV4aXMgTG90aG9yw6kgKGVCUEYgRm91bmRhdGlvbikgd3JvdGU6Cj4KPiBb
Li4uXQo+Cj4gPj4gTWF5YmUgbXkgY29tbWl0IHdvcmRpbmcgaXMgbm90IHByZWNpc2UgZW5vdWdo
LCBidXQgaW5kZWVkLCB0aGVyZSdzIG5vdAo+ID4+IGRvdWJ0IGFib3V0IHdoZXRoZXIgdGhlIHN0
cnVjdCB2YWx1ZSBpcyBwYXNzZWQgb24gdGhlIHN0YWNrIG9yIHRocm91Z2ggYQo+ID4+IHJlZ2lz
dGVyL2EgcGFpciBvZiByZWdpc3RlcnMuIFRoZSBkb3VidCBpcyByYXRoZXIgYWJvdXQgdGhlIHN0
cnVjdCBsb2NhdGlvbgo+ID4+IHdoZW4gaXQgaXMgcGFzc2VkIF9ieSB2YWx1ZV8gYW5kIF9vbiB0
aGUgc3RhY2tfOiB0aGUgQUJJIGluZGVlZCBjbGVhcmx5Cj4gPj4gc3RhdGVzIHRoYXQgIlN0cnVj
dHVyZXMgYW5kIHVuaW9ucyBhc3N1bWUgdGhlIGFsaWdubWVudCBvZiB0aGVpciBtb3N0Cj4gPj4g
c3RyaWN0bHkgYWxpZ25lZCBjb21wb25lbnQiIChwLjEzKSwgYnV0IHRoaXMgcnVsZSBpcyAic2ls
ZW50bHkgYnJva2VuIiB3aGVuCj4gPj4gYSBzdHJ1Y3QgaGFzIGFuIF9fYXR0cmlidXRlX18oKHBh
Y2tlZCkpIG9yIGFuZCBfX2F0dHJpYnV0ZV9fKChhbGlnbmVkKFgpKSksCj4gPj4gYW5kIEFGQUlD
VCB0aGlzIGNhc2UgY2FuIG5vdCBiZSBkZXRlY3RlZCBhdCBydW50aW1lIHdpdGggY3VycmVudCBC
VEYgaW5mby4KPiA+Cj4gPiBBaCwgb2theS4gU28gaXQgaXMgYSBmYWlsdXJlIG9mIEJURi4gVGhh
dCB3YXMgaW5kZWVkIG5vdCBjbGVhci4KPgo+IElmIEkgbmVlZCB0byByZXNwaW4sIEknbGwgcmV3
cml0ZSB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gaW5jbHVkZSB0aGUgZGV0YWlscwo+IGFib3ZlLgoK
Tm8gbmVlZCB0byByZXNwaW4uIFRoZSBjb3ZlciBsZXR0ZXIgaXMgcXVpdGUgZGV0YWlsZWQgYWxy
ZWFkeS4KCkJ1dCBsb29raW5nIGF0IHRoZSBwYXRjaCBhbmQgdGhpcyB0aHJlYWQgSSB0aGluayB3
ZSBuZWVkIHRvIGFncmVlCm9uIHRoZSBsb25nIHRlcm0gYXBwcm9hY2ggdG8gQlRGLCBzaW5jZSBw
ZW9wbGUgYXNzdW1lIHRoYXQKaXQncyBhIG1vcmUgY29tcGFjdCBkd2FyZiBhbmQgYW55IG1pc3Np
bmcgaW5mb3JtYXRpb24Kc2hvdWxkIGJlIGFkZGVkIHRvIGl0LgpMaWtlIGluIHRoaXMgY2FzZSBz
cGVjaWFsIGFsaWdubWVudCBjYXNlIGFuZCBwYWNrZWQgYXR0cmlidXRlcwphcmUgbm90IGV4cHJl
c3NlZCBpbiBCVEYgYW5kIEkgYmVsaWV2ZSB0aGV5IHNob3VsZCBub3QgYmUuCkJURiBpcyBub3Qg
YSBkZWJ1ZyBmb3JtYXQgYW5kIG5vdCBhIHN1YnN0aXR1dGUgZm9yIGR3YXJmLgpUaGVyZSBpcyBu
byBnb2FsIHRvIGV4cHJlc3MgZXZlcnl0aGluZyBwb3NzaWJsZSBpbiBDLgpJdCdzIG1pbmltYWws
IGJlY2F1c2UgQlRGIGlzIF9wcmFjdGljYWxfIGRlc2NyaXB0aW9uIG9mCnR5cGVzIGFuZCBkYXRh
IHByZXNlbnQgaW4gdGhlIGtlcm5lbC4KSSBkb24ndCB0aGluayB0aGUgc3BlY2lhbCBjYXNlIG9m
IHBhY2tpbmcgYW5kIGFsaWdubWVudCBleGlzdHMKaW4gdGhlIGtlcm5lbCB0b2RheSwgc28gdGhl
IGN1cnJlbnQgZm9ybWF0IGlzIHN1ZmZpY2llbnQuCkl0IGRvZXNuJ3QgbWlzcyBhbnl0aGluZy4K
SSB0aGluayB3ZSBtYWRlIGFybTY0IEpJVCB1bm5lY2Vzc2FyeSByZXN0cmljdGl2ZSBhbmQgbm93
IGNvbnNpZGVyaW5nCnRvIG1ha2UgYWxsIG90aGVyIEpJVHMgcmVzdHJpY3RpdmUgdG9vIGZvciBo
eXBvdGhldGljYWwgY2FzZQpvZiBzb21lIGZ1dHVyZSBrZXJuZWwgZnVuY3Rpb25zLgpJIGZlZWwg
d2UncmUgZ29pbmcgaW4gdGhlIHdyb25nIGRpcmVjdGlvbi4KSW5zdGVhZCB3ZSBzaG91bGQgdGVh
Y2ggcGFob2xlIHRvIHNhbml0aXplIEJURiB3aGVyZSBmdW5jdGlvbnMKYXJlIHVzaW5nIHRoaXMg
ZmFuY3kgYWxpZ25tZW50IGFuZCBwYWNrZWQgc3RydWN0cy4KcGFob2xlIGNhbiBzZWUgaXQgaW4g
ZHdhcmYgYW5kIGNhbiBza2lwIGVtaXR0aW5nIEJURiBmb3Igc3VjaApmdW5jdGlvbnMuIFRoZW4g
dGhlIGtlcm5lbCBKSVRzIG9uIGFsbCBhcmNoaXRlY3R1cmVzIHdvbid0IGV2ZW4Kc2VlIHN1Y2gg
Y2FzZXMuCgpUaGUgaXNzdWUgd2FzIGluaXRpYWxseSBkaXNjb3ZlcmVkIGJ5IGEgc2VsZnRlc3Q6
Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2JwZi8yMDI1MDQxMS1tYW55X2FyZ3NfYXJtNjQtdjEt
My0wYTMyZmU3MjMzOWVAYm9vdGxpbi5jb20vCnRoYXQgYXR0ZW1wdGVkIHRvIHN1cHBvcnQgdGhl
c2UgdHdvIHR5cGVzOgorc3RydWN0IGJwZl90ZXN0bW9kX3N0cnVjdF9hcmdfNCB7CisgX191NjQg
YTsKKyBfX3U2NCBiOworfTsKKworc3RydWN0IGJwZl90ZXN0bW9kX3N0cnVjdF9hcmdfNSB7Cisg
X19pbnQxMjggYTsKK307CgpUaGUgZm9ybWVyIGlzIHByZXNlbnQgaW4gdGhlIGtlcm5lbC4gSXQn
cyBtb3JlIG9yIGxlc3Mgc29ja3B0cl90LAphbmQgcGVvcGxlIHdhbnQgdG8gYWNjZXNzIGl0IGZv
ciBvYnNlcnZhYmlsaXR5IGluIHRyYWNpbmcuClRoZSBsYXR0ZXIgZG9lc24ndCBleGlzdCBpbiB0
aGUga2VybmVsIGFuZCB3ZSBjYW5ub3QgcmVwcmVzZW50Cml0IHByb3Blcmx5IGluIEJURiB3aXRo
b3V0IGxvc2luZyBhbGlnbm1lbnQuCgpTbyBJIHRoaW5rIHdlIHNob3VsZCBnbyBiYWNrIHRvIHRo
YXQgc2VyaWVzOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvMjAyNTA0MTEtbWFueV9hcmdz
X2FybTY0LXYxLTAtMGEzMmZlNzIzMzllQGJvb3RsaW4uY29tLwoKcmVtb3ZlIF9faW50MTI4IHNl
bGZ0ZXN0LCBidXQgYWxzbyB0ZWFjaCBwYWhvbGUKdG8gcmVjb2duaXplIHR5cGVzIHRoYXQgY2Fu
bm90IGJlIHJlcHJlc2VudGVkIGluIEJURiBhbmQKZG9uJ3QgZW1pdCB0aGVtIGVpdGhlciBpbnRv
IHZtbGludXggb3IgaW4ga2VybmVsIG1vZHVsZQoobGlrZSBpbiB0aGlzIGNhc2UgaXQgd2FzIGJw
Zl90ZXN0bW9kLmtvKQpJIHRoaW5rIHRoYXQgd291bGQgYmUgYSBiZXR0ZXIgcGF0aCBmb3J3YXJk
IGFsaWduZWQKd2l0aCB0aGUgbG9uZyB0ZXJtIGdvYWwgb2YgQlRGLgoKQW5kIGJlZm9yZSBwZW9w
bGUgYXNrLi4uIHBhaG9sZSBpcyBhIHRydXN0ZWQgY29tcG9uZW50IG9mIHRoZSBidWlsZApzeXN0
ZW0uIFdlIHRydXN0IGl0IGp1c3QgYXMgd2UgdHJ1c3QgZ2NjLCBjbGFuZywgbGlua2VyLCBvYmp0
b29sLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
