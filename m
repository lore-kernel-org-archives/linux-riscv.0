Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7853CC7EE30
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Jun 2025 20:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IAe0/Tk+6rUtxCeGPaAH3YhzbcJdDcl8bxCjdIjlzQg=; b=ozGF7NtNKBYI6d
	EZX7RejRqi04wk7r2FpfkllyC6rLd1fDtiPOO74D0e00d6o9emTYQvK6SZlvVh8CARlRLhRCdlytT
	cbXSCClccDuHG+eKlBjSjhoUVUmWI7VTIlFxwUXaaFcqbNQsp42Y2rwAZQ6m+AVPm7KJ+cip7F3Dh
	iGP9Hv/9o9GCB7HOKOKlM04pujSCRrw2pmc2IP5GDwaC4tGHpj7CSxoWiwibE2Om4v5pvqrX0IqxF
	LcB4yr2LvAT4Jm5zh6F4eO3dVa7I/VuGiyEI/qlCu1vqPDTKAj2BLR6US1q1/pkBtXR+dusqQ4RKD
	CN/bJAPbX/m4uI9LXkfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVyHR-00000000g8P-3EvN;
	Sun, 29 Jun 2025 20:05:37 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVyHP-00000000g7g-34UC;
	Sun, 29 Jun 2025 20:05:37 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a52874d593so1198318f8f.0;
        Sun, 29 Jun 2025 13:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751227534; x=1751832334; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpjVZvBcIo5G28UGMNZaBkJZF6ITVDpFyOxvjBVjrQo=;
        b=cketaLXD+PUDlX6nzdQ5w6JODWtOyuj8Msa0s2TRDgrmr0EZdnwfti8Fp1hmjhywEX
         aeC1JT2l3pG2yD1R98uEPxhD0dZLQhfSxuVkJAUBFzbZbh0eTiDddtaoONvDrHR8Viup
         6tK1JXnuW8Dg7RCoiZV0KzCvwRvSMvPNoy6L5g7F/TyTCBDlIDh6I90ZItH9UXZCxj1w
         z8zZ/ntlKnxH4C5KCuLdQw7QgY3KeOF97tqrTCDGR6vbclV+KDoSO7RvmT2LS7IW8qLP
         cgJMoXtg1tFcR+HgJ58DUC1aOAmQYQeloSYtcSVVVSCsPU0OSaq+8aZY1UlSgGCPPtBy
         Ctgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751227534; x=1751832334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpjVZvBcIo5G28UGMNZaBkJZF6ITVDpFyOxvjBVjrQo=;
        b=XKV5sitysmR4zR1N+SfYCfmlCNa6gyCTydjmnhv9tUlxWvJayU69b+2nyK36x+qzGX
         JL65fWXXH5QdRGoAkDT0TL+kmb4bf00Ok+py4wmr0M6rgj69v7KtwWLlbKM4rC85A8we
         2jsWu99LrrH/sEQwLaFSFfj1RJQmzaLir7Hw2ta2Z+z6cLO1Ar5GzkP1HY9eWUldZc7g
         ymNGuLP9iEb8H8/d1JhhPR/giyfAFBFJkTs6Q0FchkGCQIWY9q1TrRaw8HF1nIz/o1Nk
         b96WZAUZ3/qSvgemh3m/rZTWoWcFubYLmZfjmau9zi+gsLxyos+PC8FHitx/CAxRBNbW
         Lezw==
X-Forwarded-Encrypted: i=1; AJvYcCUAlEh9jL7jpLZ+nLJ0rbQVRm33z4zcmLlEUhUtUglrKnf//ywkpt4pZQkgG8Syo313cSNDB+pGh4kLbRz8nIFy@lists.infradead.org, AJvYcCUL1L8Vqy/c9tuQWpaER/wwP7e+ZnVsiVxsduHX9NNmvXr4Q9ogE60ODkFufkV6yQuEXQOeu7Ib+3Wt09w=@lists.infradead.org, AJvYcCVSBzEeUbLjyUje72kPDIud/MLkLzyvaIMJPkgvSDlllZH4FZDDOMU79H4jjpVLch2kFhcP0GfyRaI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzvzlgkdN7v8TB86eZ0K+CiqqNXwfYiQTEcQSNxOevx96fRH/VU
	2tYvARNwmpVrEV4o7Clhz7DVu/nHiJFFXTLtI7GOjtW2SHYO6pzq+O6TjUTRMdpUs1thyZasa+C
	m3A+M9Tod7QoWnon5mt2zosKjfzy77wY=
X-Gm-Gg: ASbGncumJzGHOyHRZTZSngfIrc8tqUzxdVZKuqxvzUJnTN5m655e1m1GETLaPEStL7h
	b9y/orzUDsNYWLpXT8DZjumkHpMCQDTIssSkyDg6snHZ1A4d6JbE0ZSH5DAsW5trVEnme1k5cIb
	7LxM/BAQua3/NLSvX44cpt8YyV2+lLeWT/3VRV0b4Yk/uahh5GTfdd3gs=
X-Google-Smtp-Source: AGHT+IG9Jnr7utU7Trd4lqTg8GWi9uRNVbru2WXxMPFleBJfH4kInx+LP9kDmy2SL/eaM5dKaQqnO/o2Ok4MjECqA8k=
X-Received: by 2002:a5d:59c7:0:b0:3a4:fc3f:ed28 with SMTP id
 ffacd0b85a97d-3a8fee64fafmr10710844f8f.29.1751227533501; Sun, 29 Jun 2025
 13:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250626153147.145312-1-snovitoll@gmail.com> <CA+fCnZfAtKWx=+to=XQBREhou=Snb0Yms4D8GNGaxE+BQUYm4A@mail.gmail.com>
 <CACzwLxgsVkn98VDPpmm7pKcbvu87UBwPgYJmLfKixu4-x+yjSA@mail.gmail.com>
In-Reply-To: <CACzwLxgsVkn98VDPpmm7pKcbvu87UBwPgYJmLfKixu4-x+yjSA@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sun, 29 Jun 2025 22:05:22 +0200
X-Gm-Features: Ac12FXwSsH6fvJE1vEp59zDWu481tFenq-ukDXNa3gyvAGzFlMqgNHF8VfcuM6Y
Message-ID: <CA+fCnZcGyTECP15VMSPh+duLmxNe=ApHfOnbAY3NqtFHZvceZw@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] kasan: unify kasan_arch_is_ready with kasan_enabled
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: ryabinin.a.a@gmail.com, glider@google.com, dvyukov@google.com, 
	vincenzo.frascino@arm.com, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, 
	richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org, 
	hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com, 
	akpm@linux-foundation.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, arnd@arndb.de, rppt@kernel.org, 
	geert@linux-m68k.org, mcgrof@kernel.org, guoweikang.kernel@gmail.com, 
	tiwei.btw@antgroup.com, kevin.brodsky@arm.com, benjamin.berg@intel.com, 
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_130535_779065_D91DB2B8 
X-CRM114-Status: GOOD (  26.80  )
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

T24gU2F0LCBKdW4gMjgsIDIwMjUgYXQgMzoyNeKAr1BNIFNhYnlyemhhbiBUYXNib2xhdG92Cjxz
bm92aXRvbGxAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFNhdCwgSnVuIDI4LCAyMDI1IGF0IDM6
NTfigK9QTSBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdtYWlsLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gT24gVGh1LCBKdW4gMjYsIDIwMjUgYXQgNTozMuKAr1BNIFNhYnlyemhhbiBUYXNib2xh
dG92Cj4gPiA8c25vdml0b2xsQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IFRoaXMgcGF0
Y2ggc2VyaWVzIHVuaWZpZXMgdGhlIGthc2FuX2FyY2hfaXNfcmVhZHkoKSBhbmQga2FzYW5fZW5h
YmxlZCgpCj4gPiA+IGludGVyZmFjZXMgYnkgZXh0ZW5kaW5nIHRoZSBleGlzdGluZyBrYXNhbl9l
bmFibGVkKCkgaW5mcmFzdHJ1Y3R1cmUgdG8KPiA+ID4gd29yayBjb25zaXN0ZW50bHkgYWNyb3Nz
IGFsbCBLQVNBTiBtb2RlcyAoR2VuZXJpYywgU1dfVEFHUywgSFdfVEFHUykuCj4gPiA+Cj4gPiA+
IEN1cnJlbnRseSwga2FzYW5fZW5hYmxlZCgpIG9ubHkgd29ya3MgZm9yIEhXX1RBR1MgbW9kZSB1
c2luZyBhIHN0YXRpYyBrZXksCj4gPiA+IHdoaWxlIG90aGVyIG1vZGVzIGVpdGhlciByZXR1cm4g
SVNfRU5BQkxFRChDT05GSUdfS0FTQU4pIChjb21waWxlLXRpbWUKPiA+ID4gY29uc3RhbnQpIG9y
IHJlbHkgb24gYXJjaGl0ZWN0dXJlLXNwZWNpZmljIGthc2FuX2FyY2hfaXNfcmVhZHkoKQo+ID4g
PiBpbXBsZW1lbnRhdGlvbnMgd2l0aCBjdXN0b20gc3RhdGljIGtleXMgYW5kIGdsb2JhbCB2YXJp
YWJsZXMuCj4gPiA+Cj4gPiA+IFRoaXMgbGVhZHMgdG86Cj4gPiA+IC0gQ29kZSBkdXBsaWNhdGlv
biBhY3Jvc3MgYXJjaGl0ZWN0dXJlcwo+ID4gPiAtIEluY29uc2lzdGVudCBydW50aW1lIGJlaGF2
aW9yIGJldHdlZW4gS0FTQU4gbW9kZXMKPiA+ID4gLSBBcmNoaXRlY3R1cmUtc3BlY2lmaWMgcmVh
ZGluZXNzIHRyYWNraW5nCj4gPiA+Cj4gPiA+IEFmdGVyIHRoaXMgc2VyaWVzOgo+ID4gPiAtIEFs
bCBLQVNBTiBtb2RlcyB1c2UgdGhlIHNhbWUga2FzYW5fZmxhZ19lbmFibGVkIHN0YXRpYyBrZXkK
PiA+ID4gLSBDb25zaXN0ZW50IHJ1bnRpbWUgZW5hYmxlL2Rpc2FibGUgYmVoYXZpb3IgYWNyb3Nz
IG1vZGVzCj4gPiA+IC0gU2ltcGxpZmllZCBhcmNoaXRlY3R1cmUgY29kZSB3aXRoIHVuaWZpZWQg
a2FzYW5faW5pdF9nZW5lcmljKCkgY2FsbHMKPiA+ID4gLSBFbGltaW5hdGlvbiBvZiBhcmNoIHNw
ZWNpZmljIGthc2FuX2FyY2hfaXNfcmVhZHkoKSBpbXBsZW1lbnRhdGlvbnMKPiA+ID4gLSBVbmlm
aWVkIHZtYWxsb2MgaW50ZWdyYXRpb24gdXNpbmcga2FzYW5fZW5hYmxlZCgpIGNoZWNrcwo+ID4g
Pgo+ID4gPiBUaGlzIGFkZHJlc3NlcyB0aGUgYnVnemlsbGEgaXNzdWUgWzFdIGFib3V0IG1ha2lu
Zwo+ID4gPiBrYXNhbl9mbGFnX2VuYWJsZWQgYW5kIGthc2FuX2VuYWJsZWQoKSB3b3JrIGZvciBH
ZW5lcmljIG1vZGUsCj4gPiA+IGFuZCBleHRlbmRzIGl0IHRvIHByb3ZpZGUgdHJ1ZSB1bmlmaWNh
dGlvbiBhY3Jvc3MgYWxsIG1vZGVzLgo+ID4gPgo+ID4gPiBbMV0gaHR0cHM6Ly9idWd6aWxsYS5r
ZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTcwNDkKPiA+Cj4gPiBIaSBTYWJ5cnpoYW4sCj4g
Pgo+ID4gVGhhbmsgeW91IGZvciB3b3JraW5nIG9uIHRoaXMhCj4gPgo+ID4gT25lIGFzcGVjdCB0
aGF0IGlzIG1pc3NpbmcgZnJvbSB0aGUgcGF0Y2hlcyBpcyBtb3ZpbmcgdGhlCj4gPiBrYXNhbl9h
cmNoX2lzX3JlYWR5KCkgY2FsbHMgaW50byB0aGUgaW5jbHVkZS9saW51eC9rYXNhbi5oICh0aGlz
IGlzCj4gPiBub3QgZXhwbGljaXRseSBtZW50aW9uZWQgaW4gdGhlIGlzc3VlLCBidXQgdGhpcyBp
cyB3aGF0IHRoZSAiYWRkaW5nCj4gPiBfX3dyYXBwZXJzIiBwYXJ0IGlzIGFib3V0KS4KPiA+Cj4g
PiBBbm90aGVyIHRoaW5nIHRoYXQgbmVlZHMgY2FyZWZ1bCBjb25zaWRlcmF0aW9uIGlzIHdoZXRo
ZXIgaXQncwo+ID4gcG9zc2libGUgdG8gY29tYmluZSBrYXNhbl9hcmNoX2lzX3JlYWR5KCkgYW5k
IGthc2FuX2VuYWJsZWQoKSBpbnRvIHRoZQo+ID4gc2FtZSBjaGVjayBsb2dpY2FsbHkgYXQgYWxs
LiBUaGVyZSdzIG9uZSBpc3N1ZSBtZW50aW9uZWQgaW4gWzFdOgo+Cj4gSGVsbG8sCj4gSSd2ZSBy
ZW1vdmVkIGthc2FuX2FyY2hfaXNfcmVhZHkoKSBhdCBhbGwgaW4gdGhpcyBzZXJpZXM6Cj4gW1BB
VENIIHYyIDExLzExXSBrYXNhbjogcmVwbGFjZSBrYXNhbl9hcmNoX2lzX3JlYWR5IHdpdGgga2Fz
YW5fZW5hYmxlZAo+Cj4gSXMgaXQgbm90IHdoYXQncyBleHBlY3RlZCBieSB1bmlmaWNhdGlvbj8K
CkkgZ3Vlc3MgdGhlIGlzc3VlIGRlc2NyaXB0aW9uIGRpdmVyZ2VkIGEgYml0IGZyb20gd2hhdCBu
ZWVkcyB0byBiZQpkb25lLCBzb3JyeSBhYm91dCB0aGF0LgoKVGhlIGNvcmUgMiB0aGluZ3MgSSB3
YW50ZWQgdG8gYWRkcmVzcyB3aXRoIHRoZSB1bmlmaWNhdGlvbiBhcmU6CgoxLiBBdm9pZCBzcHJh
eWluZyBrYXNhbl9hcmNoX2lzX3JlYWR5KCkgdGhyb3VnaG91dCB0aGUgS0FTQU4KaW1wbGVtZW50
YXRpb24gYW5kIG1vdmUgdGhlc2UgY2hlY2tzIGludG8gaW5jbHVkZS9saW51eC9rYXNhbi5oIChh
bmQKYWRkIF9fd3JhcHBlcnMgd2hlbiByZXF1aXJlZCkuCgoyLiBBdm9pZCBhcmNoaXRlY3R1cmVz
IHJlZGVmaW5pbmcgdGhlIHNhbWUga2FzYW5fZW5hYmxlZCBnbG9iYWwKdmFyaWFibGUvc3RhdGlj
IGtleS4KCkluaXRpYWxseSwgSSB0aG91Z2h0IHRoYXQgcy9rYXNhbl9hcmNoX2lzX3JlYWR5L2th
c2FuX2VuYWJsZWQgKyBzaW1wbHkKbW92aW5nIHRoZSBjYWxscyBpbnRvIGFmZmVjdGVkIGluY2x1
ZGUvbGludXgva2FzYW4uaCBmdW5jdGlvbnMgd291bGQKYmUgZW5vdWdoLiBCdXQgdGhlbiwgYmFz
ZWQgb24gWzFdLCB0dXJucyBvdXQgaXQncyBub3QgdGhhdCBzaW1wbGUuCgpTbyBub3csIEkgdGhp
bmsgd2UgbGlrZWx5IHN0aWxsIG5lZWQgdHdvIHNlcGFyYXRlIGNoZWNrcy9mbGFnczoKa2FzYW5f
ZW5hYmxlZCgpIHRoYXQgY29udHJvbHMgd2hldGhlciBLQVNBTiBpcyBlbmFibGVkIGF0IGFsbCBh
bmQKa2FzYW5fYXJjaF9pc19yZWFkeSgpIHRoYXQgZ2V0cyB0dXJuZWQgb24gYnkga2FzYW5faW5p
dCgpIHdoZW4gc2hhZG93CmlzIGluaXRpYWxpemVkIChzaG91bGQgd2UgcmVuYW1lIGl0IHRvIGth
c2FuX3NoYWRvd19pbml0aWFsaXplZCgpPykuCkJ1dCB0aGVuIHdlIGNhbiBzdGlsbCBtb3ZlIGth
c2FuX2FyY2hfaXNfcmVhZHkoKSBpbnRvCmluY2x1ZGUvbGludXgva2FzYW4uaCBhbmQgdXNlIHRo
ZSBwcm9wZXIgY29tYmluYXRpb24gb2YgY2hlY2tzIGZvcgplYWNoIGFmZmVjdGVkIGZ1bmN0aW9u
IGJlZm9yZSBjYWxsaW5nIF9fd3JhcHBlcnMuIEFuZCB3ZSBjYW4gc3RpbGwKcmVtb3ZlIHRoZSBk
dXBsaWNhdGVkIGZsYWdzL2tleXMgY29kZSBmcm9tIHRoZSBhcmNoIGNvZGUuCgpbMV0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbW0vQ0ErZkNuWmY3SnFUSDQ2QzdvRzJXazlObkxVN2hn
aVZERUswRUE4UkF0eXItS2drSGRnQG1haWwuZ21haWwuY29tLwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
