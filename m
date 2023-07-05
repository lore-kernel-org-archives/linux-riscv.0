Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87211EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 12:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlHFZhIAZlWdb+nS3LueN5dtZ2xx18+imw5seuJnz9I=; b=jBVWsVyIS4MHNgGxliWsV99slH
	ElGcZLfQLlneS6l3y0R6N/uSlYiH+ySCyycZlQgTOPJNQCxLwo2euXkwjeq4cqebkOQoKAnlEewNL
	Xcc2mk5J6Gmo1sFVBUqHwy7uEzoCmf93lYEttOxJWH7YId1uK3XvGqn193StQek+VNNYDoPDfyiOa
	+2hEoGRtdkmg1Mei6EBp+1cVFFM1CQjH6vdp/iZFrnqzMuFD9TGJ8O1W4rAqA/tZnKc2xE1GeR/ub
	y0+Jd+hLzQuybXONuoXk3z6pT0t4Fb2OrrCe03EAqpHMclFyNvOQ7bcKhrugLp3r0OVSZ/kEZnvaO
	tUGuF/MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH1ml-00Fu5j-14;
	Wed, 05 Jul 2023 12:39:07 +0000
Received: from www62.your-server.de ([213.133.104.62])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH1mj-00Fu3i-06
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 12:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=NGAR6ZIiv7c024DeENENlyWBZsZPUFDDAkTK7aDiRWY=; b=Y9Kty3Q0jfYzDgiSs/NQXlUGnN
	W+HbPJJjBuYvAII4Pe+UlYF6bvoEno/MpdVEo5qDs/DjgZhw/rkm8krLK7kuGhRPz7dBfOuvRUnXs
	AjNhpvPHJMNH8tO7Ok988hVTkknYH9BCQceXNy0SsOXmMgczHROb9lm8g04l2fo6/Pxx/Nk/db4/O
	KdXGkUMDAFCFKCXtQ7OcU/JcFKVzCnsVi8huCofS68rr5QA0szwbG+IMHUgyXNj4HLEnwHYD3jmQQ
	L8yVo3194TUwCCBDanzRqJFT8sBzo2yMUrMIyT7PKUGRs81fkyZV60f+S0egXzPjjXazzTrof2sAd
	gjIRxCXQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1qH1mU-000NUt-UR; Wed, 05 Jul 2023 14:38:50 +0200
Received: from [178.197.249.31] (helo=linux.home)
	by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <daniel@iogearbox.net>)
	id 1qH1mU-000P5n-Cr; Wed, 05 Jul 2023 14:38:50 +0200
Subject: Re: [PATCH bpf-next 0/2] BPF kselftest cross-build/RISC-V fixes
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Mykola Lysenko <mykolal@fb.com>,
 bpf@vger.kernel.org, netdev@vger.kernel.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Alexei Starovoitov <ast@kernel.org>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230705113926.751791-1-bjorn@kernel.org>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <9ee053a4-500c-2722-d822-d137648e55e5@iogearbox.net>
Date: Wed, 5 Jul 2023 14:38:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20230705113926.751791-1-bjorn@kernel.org>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.8/26960/Wed Jul  5 09:29:05 2023)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_053905_067958_87DF4416 
X-CRM114-Status: GOOD (  10.77  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNy81LzIzIDE6MzkgUE0sIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gRnJvbTogQmrDtnJuIFTD
tnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IAo+IFRoaXMgc2VyaWVzIGhhcyB0d28gbWlub3Ig
Zml4ZXMsIGZvdW5kIHdoZW4gY3Jvc3MtY29tcGlsaW5nIGZvciB0aGUKPiBSSVNDLVYgYXJjaGl0
ZWN0dXJlLgo+IAo+IFNvbWUgUklTQy1WIHN5c3RlbXMgZG8gbm90IGRlZmluZSBIQVZFX0VGRklD
SUVOVF9VTkFMSUdORURfQUNDRVNTLAo+IHdoaWNoIG1hZGUgc29tZSBvZiB0ZXN0cyBiYWlsIG91
dC4gRml4IHRoZSBmYWlsaW5nIHRlc3RzIGJ5IGFkZGluZwo+IEZfTkVFRFNfRUZGSUNJRU5UX1VO
QUxJR05FRF9BQ0NFU1MuCj4gCj4gLi4uYW5kIHNvbWUgUklTQy1WIHN5c3RlbXMgKmRvKiBkZWZp
bmUKPiBIQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTLiBJbiB0aGlzIGNhc2UgdGhlIGF1
dG9jb25mLmggd2FzIG5vdAo+IGNvcnJlY3RseSBwaWNrZWQgdXAgYnkgdGhlIGJ1aWxkIHN5c3Rl
bS4KCkxvb2tzIGdvb2QsIGFwcGxpZWQgdGhhbmtzISBBbnkgcGxhbnMgb24gd29ya2luZyB0b3dh
cmRzIGludGVncmF0aW5nIHJpc2N2CmludG8gdXBzdHJlYW0gQlBGIENJPyBXb3VsZCBsb3ZlIHRv
IHNlZSB0aGF0IGhhcHBlbmluZy4gOikKClRoYW5rcywKRGFuaWVsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
