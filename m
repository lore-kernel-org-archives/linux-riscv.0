Return-Path: <SRS0=lw90=JS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE46BC433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Apr 2021 16:30:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08D0661409
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Apr 2021 16:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08D0661409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Subject:References:In-Reply-To:
	Message-ID:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hO3CHPVTuk1oxbXzVoKE34XARh6PDbY9ucP68GTxT4M=; b=FT046Lc57KA2RF
	itWZT4kGQUJxiPYm6XZhw90N24Nk2SGzWrwntSQgTDwkNCoosDyRFjcmevkI3P+l/9Z+mRKoCCYI/
	Gye6dIi+GvvHkV0zx1o1Zc43Qa0urD1UjzrFFi/cqnZFpQMdLVTbr9eufXol43rMi2oQW3aFvAAfO
	sh6mu6lWGEWVyhLwlGI0WyXlpGWiRuNNImWa9BkPlnn8dTMnpYYT59IzdAGEfrL5nrwUI6fjLkWbr
	08T/Nytnt4CJ5+l+wahKYMy2ioFCDa6On6jJ/4bMo69JAJNd7mDaYs6Xq+8gE7ZsBTJAagTlKQN+W
	Hf9YndMNH9s24AKPeiyg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZFjq-00EkMY-3W; Wed, 21 Apr 2021 16:30:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZFjn-00EkML-QU; Wed, 21 Apr 2021 16:30:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=kZEeiT+02hDVJRhO51gnJpF7hYzhozQfqmgkPQR+2go=; b=H3GU553BNUV9mqqtvlMg6mzH+s
 POX5xf36KGlYXxapADN4nrfKM+DnRMKruN2s0K6QbETURPokW982salmepytJ+OGnT/Q0W8i6KygV
 K6wJPcl8CHx8RIxpuo/aeyAaDxzpTqkWEujgLixpzEpK6eQBfKb1DmCBo0eyd5Y/cKAJsyMwGLZZL
 qjhD7jT/0uJjnQEXcenQyOLL+xjpTyMVPOIeEauVcBGmymsKiIvJZqXNje1geKBWVon3s93HPeivb
 EwXVSnvbsiu8fiPi4gPPMqTZ7NMlwV1CAgO4vRYk1CZ0gFVKmZj/ern/vSHelpgVCW2xqHwfIMm9M
 iQmC90dg==;
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZFjk-00D1mX-Lh; Wed, 21 Apr 2021 16:30:02 +0000
Received: by mail-il1-x12f.google.com with SMTP id i22so30703827ila.11;
 Wed, 21 Apr 2021 09:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding;
 bh=kZEeiT+02hDVJRhO51gnJpF7hYzhozQfqmgkPQR+2go=;
 b=RCvSbC5gF4irYRxbKtCXq6ucAmn/fBlZPcmxc5StJjv0OsgtmawKZzSRMOt9KwaVfB
 mOterPVI+uca5uIZicYzxPVaYRAjch0dVaykdoLqmfnumz1qeSndgLTPIM5A88GuAh16
 kY60ERydmvvHQ8SECatQeY+fvihLUbYrM61BxVEcAV4K+xfLjiZrTMwPk+MtsJVT2Zr6
 GOZv43s51r2l+BrbedzeIDb4y3VrRbbDk8nnNp+fNSeMWAnjMPVM6JYQO/h4ai6vqwLR
 UCr2zI9SxvzesSwPuDXcovg8tK5WkZn8XccEKEIg0LxS0AurB5NZT/Bi0RNt9J0flU4S
 ysDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding;
 bh=kZEeiT+02hDVJRhO51gnJpF7hYzhozQfqmgkPQR+2go=;
 b=CFzJPtryb6DQQrvPqXwGJmzWlSlKH4U0deMLhzBHg/tM/DDx3BFvLP4HrapHJg9PCa
 +3RNlMkUViV9M+5FhVbTC85tV7iidRMaQ7ziOOxPwAKXY0fCJnijKvO6LAv1aRbJpp76
 py5LGnIe88loLO0tR4FUBbn6+8rgL2XHGjtUV68Bk/Uin+b4NMDLrvOwF1q437/uWReg
 p94qVJi2bR9hwEXI2AAuwMaXQYwOB8RsxYSCPjjb/xvQYabLquRy/5oHETMcJwVRgRZW
 dh7ZUZ4Av/BlTwtWPgiXvhpBWLF4RJfE56uJMetcLo1izlsqwQH1jlQzgEFexbe5RsiE
 RLOw==
X-Gm-Message-State: AOAM531vfMoDQ4Pbu8/tRp6HAGWbQcOkp1aXIUlCWO0YMPErO2y0E7Gc
 4M3GN3TB7h5b4vEPz6iFrYs=
X-Google-Smtp-Source: ABdhPJz7ul05BAWC6HoOuLc6EjCX5ztWUgfj1SHdCI0SDk1nQOPXDNy1tG/R5d8sRRgMhivItaOuEA==
X-Received: by 2002:a92:ce0e:: with SMTP id b14mr25946343ilo.283.1619022599257; 
 Wed, 21 Apr 2021 09:29:59 -0700 (PDT)
Received: from localhost ([172.242.244.146])
 by smtp.gmail.com with ESMTPSA id v26sm1303125ioh.42.2021.04.21.09.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 09:29:58 -0700 (PDT)
Date: Wed, 21 Apr 2021 09:29:50 -0700
From: John Fastabend <john.fastabend@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Quentin Monnet <quentin@isovalent.com>, Ian Rogers <irogers@google.com>, 
 Song Liu <songliubraving@fb.com>, 
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
 Zi Shen Lim <zlim.lnx@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
 Paul Mackerras <paulus@samba.org>, Sandipan Das <sandipan@linux.ibm.com>, 
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, 
 Shubham Bansal <illusionist.neo@gmail.com>, 
 Mahesh Bandewar <maheshb@google.com>, Will Deacon <will@kernel.org>, 
 Nicolas Dichtel <nicolas.dichtel@6wind.com>, 
 linux-s390 <linux-s390@vger.kernel.org>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, paulburton@kernel.org, 
 Jonathan Corbet <corbet@lwn.net>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, X86 ML <x86@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Christian Borntraeger <borntraeger@de.ibm.com>, 
 Ingo Molnar <mingo@redhat.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, 
 Jakub Kicinski <kuba@kernel.org>, Tobias Klauser <tklauser@distanz.ch>, 
 linux-mips@vger.kernel.org, grantseltzer@gmail.com, 
 Xi Wang <xi.wang@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>, 
 Luke Nelson <luke.r.nels@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
 Heiko Carstens <hca@linux.ibm.com>, 
 ppc-dev <linuxppc-dev@lists.ozlabs.org>, KP Singh <kpsingh@kernel.org>, 
 iecedge@gmail.com, Simon Horman <horms@verge.net.au>, 
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Yonghong Song <yhs@fb.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Dmitry Vyukov <dvyukov@google.com>, tsbogend@alpha.franken.de, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, 
 Network Development <netdev@vger.kernel.org>, 
 David Ahern <dsahern@kernel.org>, Wang YanQing <udknight@gmail.com>, 
 Martin KaFai Lau <kafai@fb.com>, 
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, bpf <bpf@vger.kernel.org>, 
 Jianlin Lv <Jianlin.Lv@arm.com>, "David S. Miller" <davem@davemloft.net>
Message-ID: <608052fea86fb_46b92087@john-XPS-13-9370.notmuch>
In-Reply-To: <7dc31256-eb1d-dc93-5e55-2de27475e0c6@csgroup.eu>
References: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
 <9c4a78d2-f73c-832a-e6e2-4b4daa729e07@iogearbox.net>
 <d3949501-8f7d-57c4-b3fe-bcc3b24c09d8@isovalent.com>
 <CAADnVQJ2oHbYfgY9jqM_JMxUsoZxaNrxKSVFYfgCXuHVpDehpQ@mail.gmail.com>
 <0dea05ba-9467-0d84-4515-b8766f60318e@csgroup.eu>
 <CAADnVQ+oQT6C7Qv7P5TV-x7im54omKoCYYKtYhcnhb1Uv3LPMQ@mail.gmail.com>
 <7dc31256-eb1d-dc93-5e55-2de27475e0c6@csgroup.eu>
Subject: Re: [PATCH bpf-next 1/2] bpf: Remove bpf_jit_enable=2 debugging mode
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_093000_754887_C141CAFB 
X-CRM114-Status: GOOD (  30.22  )
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

Q2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiAKPiAKPiBMZSAyMC8wNC8yMDIxIMOgIDA1OjI4LCBB
bGV4ZWkgU3Rhcm92b2l0b3YgYSDDqWNyaXTCoDoKPiA+IE9uIFNhdCwgQXByIDE3LCAyMDIxIGF0
IDE6MTYgQU0gQ2hyaXN0b3BoZSBMZXJveQo+ID4gPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5l
dT4gd3JvdGU6Cj4gPj4KPiA+Pgo+ID4+Cj4gPj4gTGUgMTYvMDQvMjAyMSDDoCAwMTo0OSwgQWxl
eGVpIFN0YXJvdm9pdG92IGEgw6ljcml0IDoKPiA+Pj4gT24gVGh1LCBBcHIgMTUsIDIwMjEgYXQg
ODo0MSBBTSBRdWVudGluIE1vbm5ldCA8cXVlbnRpbkBpc292YWxlbnQuY29tPiB3cm90ZToKPiA+
Pj4+Cj4gPj4+PiAyMDIxLTA0LTE1IDE2OjM3IFVUQyswMjAwIH4gRGFuaWVsIEJvcmttYW5uIDxk
YW5pZWxAaW9nZWFyYm94Lm5ldD4KPiA+Pj4+PiBPbiA0LzE1LzIxIDExOjMyIEFNLCBKaWFubGlu
IEx2IHdyb3RlOgo+ID4+Pj4+PiBGb3IgZGVidWdnaW5nIEpJVHMsIGR1bXBpbmcgdGhlIEpJVGVk
IGltYWdlIHRvIGtlcm5lbCBsb2cgaXMgZGlzY291cmFnZWQsCj4gPj4+Pj4+ICJicGZ0b29sIHBy
b2cgZHVtcCBqaXRlZCIgaXMgbXVjaCBiZXR0ZXIgd2F5IHRvIGV4YW1pbmUgSklUZWQgZHVtcHMu
Cj4gPj4+Pj4+IFRoaXMgcGF0Y2ggZ2V0IHJpZCBvZiB0aGUgY29kZSByZWxhdGVkIHRvIGJwZl9q
aXRfZW5hYmxlPTIgbW9kZSBhbmQKPiA+Pj4+Pj4gdXBkYXRlIHRoZSBwcm9jIGhhbmRsZXIgb2Yg
YnBmX2ppdF9lbmFibGUsIGFsc28gYWRkZWQgYXV4aWxpYXJ5Cj4gPj4+Pj4+IGluZm9ybWF0aW9u
IHRvIGV4cGxhaW4gaG93IHRvIHVzZSBicGZfaml0X2Rpc2FzbSB0b29sIGFmdGVyIHRoaXMgY2hh
bmdlLgo+ID4+Pj4+Pgo+ID4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKaWFubGluIEx2IDxKaWFubGlu
Lkx2QGFybS5jb20+Cj4gPj4+Pgo+ID4+Pj4gSGVsbG8sCj4gPj4+Pgo+ID4+Pj4gRm9yIHdoYXQg
aXQncyB3b3J0aCwgSSBoYXZlIGFscmVhZHkgc2VlbiBwZW9wbGUgZHVtcCB0aGUgSklUIGltYWdl
IGluCj4gPj4+PiBrZXJuZWwgbG9ncyBpbiBRZW11IFZNcyBydW5uaW5nIHdpdGgganVzdCBhIGJ1
c3lib3gsIG5vdCBmb3Iga2VybmVsCj4gPj4+PiBkZXZlbG9wbWVudCwgYnV0IGluIGEgY29udGV4
dCB3aGVyZSBidWlkaW5nL3VzaW5nIGJwZnRvb2wgd2FzIG5vdAo+ID4+Pj4gcG9zc2libGUuCj4g
Pj4+Cj4gPj4+IElmIGJ1aWxkaW5nL3VzaW5nIGJwZnRvb2wgaXMgbm90IHBvc3NpYmxlIHRoZW4g
bWFqb3JpdHkgb2Ygc2VsZnRlc3RzIHdvbid0Cj4gPj4+IGJlIGV4ZXJjaXNlZC4gSSBkb24ndCB0
aGluayBzdWNoIGVudmlyb25tZW50IGlzIHN1aXRhYmxlIGZvciBhbnkga2luZAo+ID4+PiBvZiBi
cGYgZGV2ZWxvcG1lbnQuIE11Y2ggc28gZm9yIEpJVCBkZWJ1Z2dpbmcuCj4gPj4+IFdoaWxlIGJw
Zl9qaXRfZW5hYmxlPTIgaXMgbm90aGluZyBidXQgdGhlIGRlYnVnZ2luZyB0b29sIGZvciBKSVQg
ZGV2ZWxvcGVycy4KPiA+Pj4gSSdkIHJhdGhlciBudWtlIHRoYXQgY29kZSBpbnN0ZWFkIG9mIGNh
cnJ5aW5nIGl0IGZyb20ga2VybmVsIHRvIGtlcm5lbC4KPiA+Pj4KPiA+Pgo+ID4+IFdoZW4gSSBp
bXBsZW1lbnRlZCBKSVQgZm9yIFBQQzMyLCBpdCB3YXMgZXh0cmVtZWx5IGhlbHBmdWxsLgo+ID4+
Cj4gPj4gQXMgZmFyIGFzIEkgdW5kZXJzdGFuZCwgZm9yIHRoZSB0aW1lIGJlaW5nIGJwZnRvb2wg
aXMgbm90IHVzYWJsZSBpbiBteSBlbnZpcm9ubWVudCBiZWNhdXNlIGl0Cj4gPj4gZG9lc24ndCBz
dXBwb3J0IGNyb3NzIGNvbXBpbGF0aW9uIHdoZW4gdGhlIHRhcmdldCdzIGVuZGlhbmVzcyBkaWZm
ZXJzIGZyb20gdGhlIGJ1aWxkaW5nIGhvc3QKPiA+PiBlbmRpYW5lc3MsIHNlZSBkaXNjdXNzaW9u
IGF0Cj4gPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmLzIxZTY2YTA5LTUxNGYtZjQyNi1i
OWUyLTEzYmFhYjBiOTM4YkBjc2dyb3VwLmV1Lwo+ID4+Cj4gPj4gVGhhdCdzIHJpZ2h0IHRoYXQg
c2VsZnRlc3RzIGNhbid0IGJlIGV4ZXJjaXNlZCBiZWNhdXNlIHRoZXkgZG9uJ3QgYnVpbGQuCj4g
Pj4KPiA+PiBUaGUgcXVlc3Rpb24gbWlnaHQgYmUgY2FuZGlkIGFzIEkgZGlkbid0IGludmVzdGln
YXRlIG11Y2ggYWJvdXQgdGhlIHJlcGxhY2VtZW50IG9mICJicGZfaml0X2VuYWJsZT0yCj4gPj4g
ZGVidWdnaW5nIG1vZGUiIGJ5IGJwZnRvb2wsIGhvdyBkbyB3ZSB1c2UgYnBmdG9vbCBleGFjdGx5
IGZvciB0aGF0ID8gRXNwZWNpYWxseSB3aGVuIHVzaW5nIHRoZSBCUEYKPiA+PiB0ZXN0IG1vZHVs
ZSA/Cj4gPiAKPiA+IHRoZSBrZXJuZWwgZGV2ZWxvcGVycyBjYW4gYWRkIGFueSBhbW91bnQgb2Yg
cHJpbnRrIGFuZCBkdW1wcyB0byBkZWJ1Zwo+ID4gdGhlaXIgY29kZSwKPiA+IGJ1dCBzdWNoIGRl
YnVnZ2luZyBhaWQgc2hvdWxkIG5vdCBiZSBwYXJ0IG9mIHRoZSBwcm9kdWN0aW9uIGtlcm5lbC4K
PiA+IFRoYXQgc3lzY3RsIHdhcyB0d28gdGhpbmdzIGF0IG9uY2U6IGRlYnVnZ2luZyB0b29sIGZv
ciBrZXJuZWwgZGV2cyBhbmQKPiA+IGludHJvc3BlY3Rpb24gZm9yIHVzZXJzLgo+ID4gYnBmdG9v
bCBqaXQgZHVtcCBzb2x2ZXMgdGhlIDJuZCBwYXJ0LiBJdCBwcm92aWRlcyBKSVQgaW50cm9zcGVj
dGlvbiB0byB1c2Vycy4KPiA+IERlYnVnZ2luZyBvZiB0aGUga2VybmVsIGNhbiBiZSBkb25lIHdp
dGggYW55IGFtb3VudCBvZiBhdXhpbGlhcnkgY29kZQo+ID4gaW5jbHVkaW5nIGNhbGxpbmcgcHJp
bnRfaGV4X2R1bXAoKSBkdXJpbmcgaml0aW5nLgo+ID4gCj4gCj4gSSBnZXQgdGhlIGZvbGxvd2lu
ZyBtZXNzYWdlIHdoZW4gdHJ5aW5nIHRoZSBjb21tYW5kIHN1Z2dlc3RlZCBpbiB0aGUgcGF0Y2gg
bWVzc2FnZToKPiAKPiByb290QHZnb2lwOn4jIC4vYnBmdG9vbCBwcm9nIGR1bXAgaml0ZWQKPiBF
cnJvcjogTm8gbGliYmZkIHN1cHBvcnQKPiAKPiBDaHJpc3RvcGhlCgpTZWVtcyB5b3VyIGJwZnRv
b2wgcHJvZyB3YXMgYnVpbHQgd2l0aG91dCBsaWJiZmQsIGNhbiB5b3UgcmVidWlsZCB3aXRoIGxp
YmJmZAppbnN0YWxsZWQuCgouSm9obgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
