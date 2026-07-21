Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D13C4452B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 18:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6yp0O2AG9hij67CiIzGp77yzsVOEHWibmM8E020S+1A=; b=Sx4OJr+gHZEVHm
	o9wMRFsXvJHKJ5p8Rq363DnfCuKpHgQK1Fe22VjY6QPyC77vMNzGWU0bOUz7wSRKNg41ysZqn+SKO
	SE54EzvUViSJMEswrMjmAFTEzTPXq6d5NJ9Ny5Arjx4nVDSLP24w19ozpSHFOMVOowPNuURKVMmD1
	wvOtvqM8AhIOpULnBDAMA4fOK9K3V7syHmShiQ2ABhEECHCb6sQ8ITCYmaajx0x608rdJfHv3Hf4c
	Spl6ZyZoXUjl29ycFQQa8dXYsQ1PlDBhayGKf7o35CuV9q6kr2acC/vpI5DyzVDdOeVVK7zGheqVW
	jVdvnYs1YhgdIvZFUNXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmF2O-0000000AAq8-2Y96;
	Tue, 21 Jul 2026 18:17:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmF2O-0000000AApu-0V02
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 18:17:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 28C0C601DE;
	Tue, 21 Jul 2026 18:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568141F00A3F;
	Tue, 21 Jul 2026 18:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784657870;
	bh=DAgpQs99S8QypFrkxBDN2isaBOsPn8rkpC+lorqlJt8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=oNdbEr3nyDVIx1R/+Zb4Y2JnC/fLb3S2/FwdF0uGAz3dlSPLNcmI3gY+o13M54FCQ
	 7IGXIf+MrEKPeiQ4iccsPeu639yNBbxM9aBnn5ikmovOVd1I5sjApHG3BdZehzIqDu
	 K3SbTDKKP9tIt6ARfCdWy2IIIwGGe6qs8Oh0GYxcxZjuOmi4Mr/ylZKb4pIZbYcqx9
	 u4UIB6+jUaQ3TqUH1WKnvEYWF/+ak8qHq8xTKBiIw9JLNS4oeLc3eYFRmpVBmnvosL
	 7jr8o5D1jEVQ89NBV+k+3rcnUunF/WOLdWL31SN/dOlJDibpddIRB7eJxPhL1D+5Ou
	 ylrQTcIWEr+cQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Feng Jiang <jiangfeng@kylinos.cn>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya
 Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song
 Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Pu Lehui
 <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Feng Jiang
 <jiangfeng@kylinos.cn>
Subject: Re: [PATCH v3] bpf, riscv: fix extable handling for arena load_acquire
In-Reply-To: <20260720-bpf-riscv-fix-extable-v3-1-e9a603882309@kylinos.cn>
References: <20260720-bpf-riscv-fix-extable-v3-1-e9a603882309@kylinos.cn>
Date: Tue, 21 Jul 2026 20:17:48 +0200
Message-ID: <87h5lsurzn.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
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

RmVuZyBKaWFuZyA8amlhbmdmZW5nQGt5bGlub3MuY24+IHdyaXRlczoKCj4gZW1pdF9hdG9taWNf
bGRfc3QoKSByZXR1cm5zIDEgdG8gaGF2ZSBidWlsZF9ib2R5KCkgc2tpcCB0aGUgemV4dCBhZnRl
cgo+IGEgc3ViLXdvcmQgbG9hZF9hY3F1aXJlLiBUaGUgY2FsbGVyIGRvZXMgInJldCA9IHJldCA/
Ogo+IGFkZF9leGNlcHRpb25faGFuZGxlciguLi4pIiwgd2hpY2ggc2tpcHMgYWRkX2V4Y2VwdGlv
bl9oYW5kbGVyKCkgb24gYW55Cj4gbm9uLXplcm8gcmV0LCBzbyB0aGUgZXh0YWJsZSBlbnRyeSBp
cyBtaXNzaW5nIGFuZCBhIGZhdWx0aW5nCj4gUFJPQkVfQVRPTUlDIGxvYWRfYWNxdWlyZSBvb3Bz
ZXMuCj4KPiBSRUdfRE9OVF9DTEVBUl9NQVJLRVIgbGVhdmVzIHJkIHN0YWxlIG9uIGZhdWx0LCBh
bmQgdGhlIHZlcmlmaWVyIHN0aWxsCj4gdGhpbmtzIHRoZSBsb2FkIG92ZXJ3cm90ZSBpdCwgc28g
YSBwcm9ncmFtIGNhbiBsZWFrIGl0IHRocm91Z2ggYSBtYXAuCj4KPiBDaGVjayByZXQgPj0gMCBi
ZWZvcmUgY2FsbGluZyBhZGRfZXhjZXB0aW9uX2hhbmRsZXIoKSwgYW5kIHBhc3MgcmQgZm9yCj4g
TE9BRF9BQ1Egc28gdGhlIGZhdWx0IHplcm9lcyByZCBsaWtlIGEgUFJPQkVfTUVNIGxvYWQuIFJl
dHVybiByZXQKPiB1bmNoYW5nZWQgZm9yIHRoZSB6ZXh0IHNraXAuCj4KPiBGaXhlczogZmI3Y2Vm
YWJhZTgxICgicmlzY3YsIGJwZjogQWRkIHN1cHBvcnQgYXJlbmEgYXRvbWljcyBmb3IgUlY2NCIp
Cj4gU2lnbmVkLW9mZi1ieTogRmVuZyBKaWFuZyA8amlhbmdmZW5nQGt5bGlub3MuY24+CgpUaGFu
ayB5b3UgZm9yIHNwaW5uaW5nIGEgbmV3IHZlcnNpb24hCgpSZXZpZXdlZC1ieTogQmrDtnJuIFTD
tnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
