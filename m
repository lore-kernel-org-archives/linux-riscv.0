Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA6FC98318
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 15:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ShhFZ0uCGgVkozj4tYOeeUxtfbFFWT6/A8tTj8x8Sw=; b=WGIrjNNawE25dm
	+t5QQzeFcPSsFt8clRF2ajbvL3/f3DopeDXfDVA3Xc2uOP1rHjdg1viz3/uCqRnKvXtZsd4pB/E6x
	EyRFF7NkewDrRCs5D1dlLrLVwXJ1VdP+54/UzeCIHvXJciCr6DAyEkK6S9x5oiBDsDCp39/zZEc7u
	lyKRd8ZIsJiYIWo4NLGUGhfjJ0vnx5UYdDXJ+ug1ica4m2VuqVE1daWzwYLUphb5uYMOgr7ZBx6uI
	uL5ZUE1vs/Eq06qrcyFGGh0WwJII69Xo71tOP5RVbam+s3odcgO0OuCiEgZazbNDj0rQMWy/yTM44
	rdTJg0OCgdzyL74MX7Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lgg-0000000BTqE-0I0b;
	Thu, 24 Sep 2026 15:48:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lge-0000000BTpu-0ocs
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 15:48:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D45EF4164E;
	Thu, 24 Sep 2026 15:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA681F000FF;
	Thu, 24 Sep 2026 15:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790264919;
	bh=HLisvpRZLu8nEZDHRNFgCxsrgUpFlrGFkXzXtadU/0U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=AHzAM7SYWMqk8PkwoBw1/dZQ9GWWjslMSDAaYr/0UlHzJvzw6u6SYcg0Xbacruq1c
	 6niHIUbH6fW2YpKnr2HHjd8sIO1NKmGNbkKlcNfJO/e6p5jDFY8C180IS0Jh2mPZmL
	 aB0JDrg7D3EhBD6eVWALjdH0Z6NsR8KnEs4ap0rRRGIGAbA4npXD8mfAl3WRILV15F
	 tAR08qwUSt2O5hnEErwyf6p5R9Qcth9Ix8BK1lT+uzOkzGaFINKxiF9NSgQTxiXjTo
	 wuqPHC3tx+U0fl7X6182Keen5engdz0nSn/0vPP9jhq5ynhzCQyyycffdFYBR+KQhf
	 6xa9+57hwOXWw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard
 Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, Puranjay Mohan <puranjay@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre
 Ghiti <alex@ghiti.fr>, Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next] riscv, bpf: Adjust bpf_func to account for CFI
 offset in bpf_jit_free
In-Reply-To: <20260923144216.934701-1-pulehui@huaweicloud.com>
References: <20260923144216.934701-1-pulehui@huaweicloud.com>
Date: Thu, 24 Sep 2026 17:48:36 +0200
Message-ID: <87fqyyps4r.fsf@all.your.base.are.belong.to.us>
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEZyb206IFB1IExl
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBXaGVuIENGSSBpcyBlbmFibGVkLCB0aGUgYWN0
dWFsIEJQRiBwcm9ncmFtIGVudHJ5IHBvaW50IGlzIHNoaWZ0ZWQKPiBmb3J3YXJkIGJ5IGEgQ0ZJ
IHByZWFtYmxlLiBEdXJpbmcgYnBmX2ppdF9mcmVlKCksIHRoaXMgc2hpZnRlZCBwb2ludGVyCj4g
Y2F1c2VzIHRoZSB3cm9uZyByb19oZWFkZXIgdG8gYmUgZmV0Y2hlZCwgbGVhZGluZyB0byBhIHBv
dGVudGlhbCBpbnZhbGlkCj4gbWVtb3J5IGZyZWUuCj4KPiBGaXggdGhpcyBieSBzdWJ0cmFjdGlu
ZyBjZmlfZ2V0X29mZnNldCgpIGZyb20gcHJvZy0+YnBmX2Z1bmMgdG8KPiBjb3JyZWN0bHkgcmVz
dG9yZSB0aGUgb3JpZ2luYWwgSklUZWQgYWxsb2NhdGlvbiBhZGRyZXNzIGJlZm9yZSBmcmVlaW5n
Lgo+Cj4gRml4ZXM6IGU2Mzk4NWVjZDIyNiAoImJwZiwgcmlzY3Y2NC9jZmk6IFN1cHBvcnQga0NG
SSArIEJQRiBvbiByaXNjdjY0IikKPiBTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBo
dWF3ZWkuY29tPgoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+
CkFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
