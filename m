Return-Path: <SRS0=56ix=JR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D06C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 03:29:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2D1561168
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 03:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2D1561168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YHttDAceM6xys6TXtB5jRKv4oG35hVjNqpkV1wF6Ntg=; b=jMgKyAcC759Phws7K2AOpKm2C
	2hpAXtiU6sIf1o+nGViPGvTThv4Z/R1yZULhMtI1devYnD5bjXbUIVhALE38lhdaM3Bw0H5jFYaaJ
	hgSxf/iFvUwywyVwgqwnOL6Ui0gnMGgo88jLVTKeWlIHlu3fpfC2PPkHpBy0Y//jEB7zxK7o3i8oh
	t4nDO8sVKcOIduFqjHpF0iBPEEWo8QgMo7SqCuGlAJp4ColpOKWdJlO6T62Yy4luCqQA+zbW6s0vf
	rqzhJE1gExXzKs5JJCw28PRWZeUmqyiG5IYUClWcmNQII1do8UiA78mQIeumf2epwrdKNjG3knHSa
	y8I/wghPA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYh4S-00B61S-IP; Tue, 20 Apr 2021 03:29:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYh4Q-00B61J-6m; Tue, 20 Apr 2021 03:29:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=sjA5c4MI/V/Us5khupc3zlEWJtPk9Lba1kHWIn9xqrM=; b=xPVKGne2MahdGR/aYfgMu91g7y
 9LGfvnIYgez9yYl/J6H2P6nRD5fC03Nk1sfJFqf1Tmgq8KS4l+7HKX3xoj18T939VbNWm+Oesk675
 mWWE2OwchiNnpBFRA+Uu3pozTLYoTNMBdCb1XjH1PCymsfDxAqngRzH/3O2FXL5YlykJYigMwpLob
 NxtD2kGLjru31MnEuw2F+Y3nx0bqii8AX/wKnQSqbYNDwKTgM64tE/qdssaMmyQZEdeO/nDf04D6O
 Jt70beGAJD2NJ2rCmYLyXAEVKd9v5iAugiXESPP71MQqcGgSlar/n7xijAESzyn1ApVot5L1DHq6f
 komsdu0w==;
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYh4L-00Bn6F-DD; Tue, 20 Apr 2021 03:29:00 +0000
Received: by mail-lf1-x12f.google.com with SMTP id h36so5129205lfv.7;
 Mon, 19 Apr 2021 20:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sjA5c4MI/V/Us5khupc3zlEWJtPk9Lba1kHWIn9xqrM=;
 b=aZSJaNW84mZRYAHIY5t88erflreGTdYjaH3FYtF1qHJPn6VWs0jryZT46tcKmPEGha
 /og/FC8vcGojrzKljv51Y7lWbKJNsViPSNua0KzzWTeHQBaA77mtr8NCMQ4THd2QTzcC
 W4NX+bAwjkGszUu3wkPlccw0aoYiZjMS+T4JTPsVHoVH+R4TOOISLvGTXFbJ16T+Dgur
 kbNEKiwtz58pU2SAt4AjUcSxyUGvQb0yQueu6ghHyatn+Cc/mNZXXrnsQvXgxCwKXuNp
 sZTyXkoz02r+DOAERoaXyqJHUX8rL4MjlDqKs+1CuVe940UruGYC9kE+b/nNTgV9xhkG
 purg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sjA5c4MI/V/Us5khupc3zlEWJtPk9Lba1kHWIn9xqrM=;
 b=nUadml8T6uPucvTian6UYC7nkZ3UmVZRM4KJTr10kgI4UnHDJY6HJ80EEpnYfrGXPO
 hGf2bAojHB2FZikCNPJ9Prqrt7Oyq84pw3isg/WQcQsfaXy8S85VKtvo4m/3LpqR4HLd
 kJ3uv4XGbSVykikqzmu2b7Y8lzJnMPfipjUGkkl1D1ucZEOY/A3njNY5ojs0xU3coTgN
 TA+KVf7v6FVnCp9vRH44BGKlwLAnLzVO1yWwwqdjNg3moNNAWHFSZWiIhwuvhJaJn2/i
 aKvd8uepUyMiYTAanaiMosDh7GDTBBCXO/KqWpQLAXvPwxV0mgZM7AeTj2eX+ANDw5P2
 24Yw==
X-Gm-Message-State: AOAM5307uzUVFP8qk99FGc0cZkKDjJdEaWNmic3xXke0z4TIhMmpvF6g
 DUYOrl6te1+O9zSAy3EUk1i7YN/1KchsMjHmwWA=
X-Google-Smtp-Source: ABdhPJxtNTC6hNyk2mAr0jYIRtC3Pnw65n4y2IU2BFaZPz0SzJ5eF0gkFi6YsfR4xYcNBc9nZPkqaJatjNPZ02gYJpQ=
X-Received: by 2002:ac2:510d:: with SMTP id q13mr13835296lfb.75.1618889332453; 
 Mon, 19 Apr 2021 20:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
 <9c4a78d2-f73c-832a-e6e2-4b4daa729e07@iogearbox.net>
 <d3949501-8f7d-57c4-b3fe-bcc3b24c09d8@isovalent.com>
 <CAADnVQJ2oHbYfgY9jqM_JMxUsoZxaNrxKSVFYfgCXuHVpDehpQ@mail.gmail.com>
 <0dea05ba-9467-0d84-4515-b8766f60318e@csgroup.eu>
In-Reply-To: <0dea05ba-9467-0d84-4515-b8766f60318e@csgroup.eu>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 19 Apr 2021 20:28:41 -0700
Message-ID: <CAADnVQ+oQT6C7Qv7P5TV-x7im54omKoCYYKtYhcnhb1Uv3LPMQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: Remove bpf_jit_enable=2 debugging mode
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Quentin Monnet <quentin@isovalent.com>, Ian Rogers <irogers@google.com>, 
 Song Liu <songliubraving@fb.com>, 
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Zi Shen Lim <zlim.lnx@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Alexei Starovoitov <ast@kernel.org>, 
 Andrii Nakryiko <andrii@kernel.org>, Paul Mackerras <paulus@samba.org>, 
 Sandipan Das <sandipan@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Shubham Bansal <illusionist.neo@gmail.com>,
 Mahesh Bandewar <maheshb@google.com>, 
 Will Deacon <will@kernel.org>, Nicolas Dichtel <nicolas.dichtel@6wind.com>, 
 linux-s390 <linux-s390@vger.kernel.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 paulburton@kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, X86 ML <x86@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, Russell King <linux@armlinux.org.uk>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Catalin Marinas <catalin.marinas@arm.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, 
 Jakub Kicinski <kuba@kernel.org>, Tobias Klauser <tklauser@distanz.ch>,
 linux-mips@vger.kernel.org, 
 grantseltzer@gmail.com, Xi Wang <xi.wang@gmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, 
 Vasily Gorbik <gor@linux.ibm.com>, Luke Nelson <luke.r.nels@gmail.com>, 
 LKML <linux-kernel@vger.kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 ppc-dev <linuxppc-dev@lists.ozlabs.org>, KP Singh <kpsingh@kernel.org>,
 iecedge@gmail.com, 
 Simon Horman <horms@verge.net.au>, Borislav Petkov <bp@alien8.de>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Yonghong Song <yhs@fb.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>,
 tsbogend@alpha.franken.de, Daniel Borkmann <daniel@iogearbox.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, 
 Network Development <netdev@vger.kernel.org>, David Ahern <dsahern@kernel.org>,
 Wang YanQing <udknight@gmail.com>, Martin KaFai Lau <kafai@fb.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, bpf <bpf@vger.kernel.org>, 
 Jianlin Lv <Jianlin.Lv@arm.com>, "David S. Miller" <davem@davemloft.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_202857_517850_44B5B8B9 
X-CRM114-Status: GOOD (  28.51  )
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

T24gU2F0LCBBcHIgMTcsIDIwMjEgYXQgMToxNiBBTSBDaHJpc3RvcGhlIExlcm95CjxjaHJpc3Rv
cGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+Cj4KPgo+IExlIDE2LzA0LzIwMjEgw6AgMDE6
NDksIEFsZXhlaSBTdGFyb3ZvaXRvdiBhIMOpY3JpdCA6Cj4gPiBPbiBUaHUsIEFwciAxNSwgMjAy
MSBhdCA4OjQxIEFNIFF1ZW50aW4gTW9ubmV0IDxxdWVudGluQGlzb3ZhbGVudC5jb20+IHdyb3Rl
Ogo+ID4+Cj4gPj4gMjAyMS0wNC0xNSAxNjozNyBVVEMrMDIwMCB+IERhbmllbCBCb3JrbWFubiA8
ZGFuaWVsQGlvZ2VhcmJveC5uZXQ+Cj4gPj4+IE9uIDQvMTUvMjEgMTE6MzIgQU0sIEppYW5saW4g
THYgd3JvdGU6Cj4gPj4+PiBGb3IgZGVidWdnaW5nIEpJVHMsIGR1bXBpbmcgdGhlIEpJVGVkIGlt
YWdlIHRvIGtlcm5lbCBsb2cgaXMgZGlzY291cmFnZWQsCj4gPj4+PiAiYnBmdG9vbCBwcm9nIGR1
bXAgaml0ZWQiIGlzIG11Y2ggYmV0dGVyIHdheSB0byBleGFtaW5lIEpJVGVkIGR1bXBzLgo+ID4+
Pj4gVGhpcyBwYXRjaCBnZXQgcmlkIG9mIHRoZSBjb2RlIHJlbGF0ZWQgdG8gYnBmX2ppdF9lbmFi
bGU9MiBtb2RlIGFuZAo+ID4+Pj4gdXBkYXRlIHRoZSBwcm9jIGhhbmRsZXIgb2YgYnBmX2ppdF9l
bmFibGUsIGFsc28gYWRkZWQgYXV4aWxpYXJ5Cj4gPj4+PiBpbmZvcm1hdGlvbiB0byBleHBsYWlu
IGhvdyB0byB1c2UgYnBmX2ppdF9kaXNhc20gdG9vbCBhZnRlciB0aGlzIGNoYW5nZS4KPiA+Pj4+
Cj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBKaWFubGluIEx2IDxKaWFubGluLkx2QGFybS5jb20+Cj4g
Pj4KPiA+PiBIZWxsbywKPiA+Pgo+ID4+IEZvciB3aGF0IGl0J3Mgd29ydGgsIEkgaGF2ZSBhbHJl
YWR5IHNlZW4gcGVvcGxlIGR1bXAgdGhlIEpJVCBpbWFnZSBpbgo+ID4+IGtlcm5lbCBsb2dzIGlu
IFFlbXUgVk1zIHJ1bm5pbmcgd2l0aCBqdXN0IGEgYnVzeWJveCwgbm90IGZvciBrZXJuZWwKPiA+
PiBkZXZlbG9wbWVudCwgYnV0IGluIGEgY29udGV4dCB3aGVyZSBidWlkaW5nL3VzaW5nIGJwZnRv
b2wgd2FzIG5vdAo+ID4+IHBvc3NpYmxlLgo+ID4KPiA+IElmIGJ1aWxkaW5nL3VzaW5nIGJwZnRv
b2wgaXMgbm90IHBvc3NpYmxlIHRoZW4gbWFqb3JpdHkgb2Ygc2VsZnRlc3RzIHdvbid0Cj4gPiBi
ZSBleGVyY2lzZWQuIEkgZG9uJ3QgdGhpbmsgc3VjaCBlbnZpcm9ubWVudCBpcyBzdWl0YWJsZSBm
b3IgYW55IGtpbmQKPiA+IG9mIGJwZiBkZXZlbG9wbWVudC4gTXVjaCBzbyBmb3IgSklUIGRlYnVn
Z2luZy4KPiA+IFdoaWxlIGJwZl9qaXRfZW5hYmxlPTIgaXMgbm90aGluZyBidXQgdGhlIGRlYnVn
Z2luZyB0b29sIGZvciBKSVQgZGV2ZWxvcGVycy4KPiA+IEknZCByYXRoZXIgbnVrZSB0aGF0IGNv
ZGUgaW5zdGVhZCBvZiBjYXJyeWluZyBpdCBmcm9tIGtlcm5lbCB0byBrZXJuZWwuCj4gPgo+Cj4g
V2hlbiBJIGltcGxlbWVudGVkIEpJVCBmb3IgUFBDMzIsIGl0IHdhcyBleHRyZW1lbHkgaGVscGZ1
bGwuCj4KPiBBcyBmYXIgYXMgSSB1bmRlcnN0YW5kLCBmb3IgdGhlIHRpbWUgYmVpbmcgYnBmdG9v
bCBpcyBub3QgdXNhYmxlIGluIG15IGVudmlyb25tZW50IGJlY2F1c2UgaXQKPiBkb2Vzbid0IHN1
cHBvcnQgY3Jvc3MgY29tcGlsYXRpb24gd2hlbiB0aGUgdGFyZ2V0J3MgZW5kaWFuZXNzIGRpZmZl
cnMgZnJvbSB0aGUgYnVpbGRpbmcgaG9zdAo+IGVuZGlhbmVzcywgc2VlIGRpc2N1c3Npb24gYXQK
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvMjFlNjZhMDktNTE0Zi1mNDI2LWI5ZTItMTNi
YWFiMGI5MzhiQGNzZ3JvdXAuZXUvCj4KPiBUaGF0J3MgcmlnaHQgdGhhdCBzZWxmdGVzdHMgY2Fu
J3QgYmUgZXhlcmNpc2VkIGJlY2F1c2UgdGhleSBkb24ndCBidWlsZC4KPgo+IFRoZSBxdWVzdGlv
biBtaWdodCBiZSBjYW5kaWQgYXMgSSBkaWRuJ3QgaW52ZXN0aWdhdGUgbXVjaCBhYm91dCB0aGUg
cmVwbGFjZW1lbnQgb2YgImJwZl9qaXRfZW5hYmxlPTIKPiBkZWJ1Z2dpbmcgbW9kZSIgYnkgYnBm
dG9vbCwgaG93IGRvIHdlIHVzZSBicGZ0b29sIGV4YWN0bHkgZm9yIHRoYXQgPyBFc3BlY2lhbGx5
IHdoZW4gdXNpbmcgdGhlIEJQRgo+IHRlc3QgbW9kdWxlID8KCnRoZSBrZXJuZWwgZGV2ZWxvcGVy
cyBjYW4gYWRkIGFueSBhbW91bnQgb2YgcHJpbnRrIGFuZCBkdW1wcyB0byBkZWJ1Zwp0aGVpciBj
b2RlLApidXQgc3VjaCBkZWJ1Z2dpbmcgYWlkIHNob3VsZCBub3QgYmUgcGFydCBvZiB0aGUgcHJv
ZHVjdGlvbiBrZXJuZWwuClRoYXQgc3lzY3RsIHdhcyB0d28gdGhpbmdzIGF0IG9uY2U6IGRlYnVn
Z2luZyB0b29sIGZvciBrZXJuZWwgZGV2cyBhbmQKaW50cm9zcGVjdGlvbiBmb3IgdXNlcnMuCmJw
ZnRvb2wgaml0IGR1bXAgc29sdmVzIHRoZSAybmQgcGFydC4gSXQgcHJvdmlkZXMgSklUIGludHJv
c3BlY3Rpb24gdG8gdXNlcnMuCkRlYnVnZ2luZyBvZiB0aGUga2VybmVsIGNhbiBiZSBkb25lIHdp
dGggYW55IGFtb3VudCBvZiBhdXhpbGlhcnkgY29kZQppbmNsdWRpbmcgY2FsbGluZyBwcmludF9o
ZXhfZHVtcCgpIGR1cmluZyBqaXRpbmcuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
