Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C899EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 13:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5/MHT3FmbGLwu/tjA3MQZ6JoxAJoToUKHV40XXbJxw=; b=JfzR8bIGepzvH8
	m2ZUi1oNiKM0k95Qrn5P9XXVP68q0Gs6JJawgSrj6cAOS4xtwpt8YGlZx0Pj+eoprQ5bI0XwsTHm6
	76+juPeGy/UvxhWjo+4EDNVDv6uRsgML2Z1fmwRJZ7uYxJJMp19fCtEEi7x+/jsPqKxtRqruIAG2I
	rgWyEI/DfgQ0B/IHobQB2lZWU3VGkf44nXvTqZ7jb1v+9V5WJUvXN94WXABh0xF+xOUSrcNCZKDCX
	kApNmjsosvcZp1tpou3m+6vsgi61bcv7KtKouWJ3OzTpJS5AxpFy+JnhD4pq4NbsyWDxEWoPzgVVZ
	2mrmwdf5MlpgdriRUdhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH2p7-00G22W-0S;
	Wed, 05 Jul 2023 13:45:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH2p4-00G22A-1j
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 13:45:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0C68F61578;
	Wed,  5 Jul 2023 13:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30B0C433C7;
	Wed,  5 Jul 2023 13:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688564733;
	bh=2nZc8QuDXQtU0mJQdbBKKU3T4vyKo8XqmVijsQeBb+w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HHCNlWJdsDyCfJAqxVw88yhrOEwjE4+AzjYxJ5QdiR8zt2Bq3oevCi7o2fOX30Vs9
	 vR4PqMoHxn+Lu2H8Z56jIubA19YmDBfJKFWE6sO4kkMYH0qdo6rsCG7LGu3w3/RN4t
	 XIgbDrYMp/K5PeAmItfPHIpVfVuLJy2b65tmxMT0o3IqOBb4eVUNsNj/EjOrEB7Lms
	 Ki+JeSy0W8UmVOzyslNJUj5BvAD4YWTGpWbPcxD71SfAeh4OxhX8/nv0wdNMxK1fTd
	 b4Gj68qHZOwIh2u5ghqhV5kuA1UFfeWvCE/zKBicWXuF9rz5rWJUVEzb4ZcddFTEAc
	 QJIN5x6a71C0A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Mykola Lysenko <mykolal@fb.com>, bpf@vger.kernel.org,
 netdev@vger.kernel.org
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Alexei
 Starovoitov <ast@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH bpf-next 0/2] BPF kselftest cross-build/RISC-V fixes
In-Reply-To: <9ee053a4-500c-2722-d822-d137648e55e5@iogearbox.net>
References: <20230705113926.751791-1-bjorn@kernel.org>
 <9ee053a4-500c-2722-d822-d137648e55e5@iogearbox.net>
Date: Wed, 05 Jul 2023 15:45:30 +0200
Message-ID: <87bkgqtqth.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_064534_615798_51ED267C 
X-CRM114-Status: GOOD (  12.05  )
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

RGFuaWVsIEJvcmttYW5uIDxkYW5pZWxAaW9nZWFyYm94Lm5ldD4gd3JpdGVzOgoKPiBPbiA3LzUv
MjMgMTozOSBQTSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8
Ympvcm5Acml2b3NpbmMuY29tPgo+PiAKPj4gVGhpcyBzZXJpZXMgaGFzIHR3byBtaW5vciBmaXhl
cywgZm91bmQgd2hlbiBjcm9zcy1jb21waWxpbmcgZm9yIHRoZQo+PiBSSVNDLVYgYXJjaGl0ZWN0
dXJlLgo+PiAKPj4gU29tZSBSSVNDLVYgc3lzdGVtcyBkbyBub3QgZGVmaW5lIEhBVkVfRUZGSUNJ
RU5UX1VOQUxJR05FRF9BQ0NFU1MsCj4+IHdoaWNoIG1hZGUgc29tZSBvZiB0ZXN0cyBiYWlsIG91
dC4gRml4IHRoZSBmYWlsaW5nIHRlc3RzIGJ5IGFkZGluZwo+PiBGX05FRURTX0VGRklDSUVOVF9V
TkFMSUdORURfQUNDRVNTLgo+PiAKPj4gLi4uYW5kIHNvbWUgUklTQy1WIHN5c3RlbXMgKmRvKiBk
ZWZpbmUKPj4gSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUy4gSW4gdGhpcyBjYXNlIHRo
ZSBhdXRvY29uZi5oIHdhcyBub3QKPj4gY29ycmVjdGx5IHBpY2tlZCB1cCBieSB0aGUgYnVpbGQg
c3lzdGVtLgo+Cj4gTG9va3MgZ29vZCwgYXBwbGllZCB0aGFua3MhIAoKVGhhbmsgeW91IQoKPiBB
bnkgcGxhbnMgb24gd29ya2luZyB0b3dhcmRzIGludGVncmF0aW5nIHJpc2N2IGludG8gdXBzdHJl
YW0gQlBGIENJPwo+IFdvdWxkIGxvdmUgdG8gc2VlIHRoYXQgaGFwcGVuaW5nLiA6KQoKWWVzISBJ
IHN0YXJ0ZWQgaGFja2luZyBhIGJpdCBvbiB0aGF0IHNvbWUgdGltZSBiYWNrOgoKICBodHRwczov
L2dpdGh1Yi5jb20vbGliYnBmL2NpL3B1bGwvODcKICBodHRwczovL2dpdGh1Yi5jb20va2VybmVs
LXBhdGNoZXMvdm10ZXN0L3B1bGwvMTk0CgooVEw7RFI6IEknbGwgY29udGludWluZyB0aGF0IHdv
cmsgYXQgc29tZSBwb2ludC4pCgpSSVNDLVYgc3RpbGwgbmVlZHMgY3Jvc3MtY29tcGlsYXRpb24s
IGFuZCB0ZXN0aW5nIG9uIHFlbXUvVENHIChvbgp0eXBpY2FsbHkgeDg2LWhvc3RzKSwgd2hpY2gg
cHV0cyBzb21lIGNvbnN0cmFpbnRzIG9uIHRoZQpyb290ZnMvY3Jvc3MtY29tcGlsYXRpb24gaG9z
dDsgRm9yIFJJU0MtViBEZWJpYW4gQnVsbHNleWUgaXMgd2F5IHRvbyBvbGQKKGEgbG90IHBhY2th
Z2VzIGFyZSBtaXNzaW5nL2Jyb2tlbikuIFR5cGljYWxseSBmb3IgQlBGIGl0IHdvdWxkIGJlClVi
dW50dSBLaW5ldGljIChvciBsYXRlciksIG9yIHNvbWUgRGViaWFuIFNpZCBzbmFwc2hvdC4KClRo
ZSByb290ZnMsIHRoZSBob3N0LCBhbmQgdGhlIGhvc3QgZm9yZWlnbiBhcmNoIHdvdWxkIG5lZWQg
dG8gYmUgdGhlCnNhbWUgZm9yICJuby1oYXNzbGUgY3Jvc3MtY29tcGlsYXRpb24gb24gRGViaWFu
IGRlcml2YXRpdmVzIiAtLSBhbmQgYXQKbGVhc3QgeW91bmdlciB0aGFuICJVYnVudHUgS2luZXRp
YyItYWdlLgoKQUZBSVUsIHRoZXJlIGFyZSBzb21lIGlzc3VlcyB3aXRoIHJvb3RmcyB2ZXJzaW9u
IGFuZCBidWlsZCBob3N0CnZlcnNpb25pbmcgZm9yIG90aGVyIGFyY2hzIGFzIHdlbGw6IGh0dHBz
Oi8vZ2l0aHViLmNvbS9saWJicGYvY2kvcHVsbC84MwoKCkJqw7ZybgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
