Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFD4C43458
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2026 18:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6LBNJWNaz9sokLpTYvjr+45OzQWCiwLAqTs77JZqh0c=; b=ImU6Fu9LYzHsU6
	O1M5gNFOldE+XwWNNj4zCDVCdWUgEHtZ/R7Y/MH2mr6CIPISLpTRPwyfH0RGH8gu0RBo6xnKC7o3Z
	LDsnj4Czs80yrU4+NWwqyFXCtwbGD3WupmZ3uIPI6SQM9oJlJTKzOyCi6ny4L9SzbS4Qn+hv5OS35
	BvTRQmDb7d9g4Znlg2zupubJIKMwqhfScxOHMW1/KyJkuORQ6l3FzyhnXS5Z9oVH/PMhFjGcjENEL
	Mi4McJNkQQLkYGeGtIkKi+iWzQF5soPx28C53y6kC/EhWIV3p03Kq37j7YdaMUsYCa2CWIshgGZby
	WFjfnyq5sTdykpPJ+kBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdtni-0000000DGAf-3Yeh;
	Sun, 28 Jun 2026 18:00:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdtnh-0000000DGAJ-3jAo
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jun 2026 18:00:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B4D8C6001D;
	Sun, 28 Jun 2026 18:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EDB91F000E9;
	Sun, 28 Jun 2026 18:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782669611;
	bh=m4w2zYR4pkagcbFIWL/+If5a2G2VCWitoOLDB2Gmh/k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=PWwU0FSJCwADrUnl65r7aAB8aO+AHlVhiUTDhA4AjNIFZzLKYFZyHjFl5A9THhBHq
	 jT+T6RxfNu1zxBa2mqatTEUgTYHl1YsU24Xvh5llzdCK7nbU6FTywcMfPLAaq8O9Wi
	 jU4HQZ7WT30xvzqUyK23nXwABnwdzuGF4UM2aRc9Wks1q75/8lpxfGAa2o9I3tAaYD
	 bEWtY51EvttcdtZEvNdz9EoV5NlnjtzvnM9lEpPxs8eFKDToSJm1z3qPe0LmUultfH
	 m4a0uENHG+OvE/l49mJdqBiZXB9SXhBhT2ZUMmIMUYuwpYHv7lmC/5H6Hd/P6BlA5Z
	 zaxzk6H7yxdew==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Varun R Mallya <varunrmallya@gmail.com>, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com,
 memxor@gmail.com, pulehui@huawei.com
Cc: alex@ghiti.fr, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 puranjay@kernel.org, shuah@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, varunrmallya@gmail.com
Subject: Re: [PATCH bpf-next v2 3/3] riscv, bpf: Remove BPF exceptions from
 BPF CI denylist
In-Reply-To: <20260628081710.113333-4-varunrmallya@gmail.com>
References: <20260628081710.113333-1-varunrmallya@gmail.com>
 <20260628081710.113333-4-varunrmallya@gmail.com>
Date: Sun, 28 Jun 2026 11:00:07 -0700
Message-ID: <878q7yy28o.fsf@all.your.base.are.belong.to.us>
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

VmFydW4gUiBNYWxseWEgPHZhcnVucm1hbGx5YUBnbWFpbC5jb20+IHdyaXRlczoKCj4gVGhpcyBw
YXRjaCByZW1vdmVzIEJQRiBleGNlcHRpb25zIGZyb20gcmlzY3Y2NCBkZW55bGlzdCBvbgo+IEJQ
RiBzZWxmdGVzdHMgc2luY2Ugc3VwcG9ydCBmb3IgZXhjZXB0aW9ucyBoYXMgYmVlbiBhZGRlZCBu
b3cuCj4KPiBTaWduZWQtb2ZmLWJ5OiBWYXJ1biBSIE1hbGx5YSA8dmFydW5ybWFsbHlhQGdtYWls
LmNvbT4KPiBSZXZpZXdlZC1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KPiAtLS0K
PiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL0RFTllMSVNULnJpc2N2NjQgfCAxIC0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9icGYvREVOWUxJU1QucmlzY3Y2NCBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2JwZi9ERU5ZTElTVC5yaXNjdjY0Cj4gaW5kZXggNGZjNGRmZGRlMjkzLi45MjY4MzUxY2U0
YzEgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL0RFTllMSVNULnJp
c2N2NjQKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvREVOWUxJU1QucmlzY3Y2
NAo+IEBAIC0xLDMgKzEsMiBAQAo+ICAjIHJpc2N2NjQgZGVueSBsaXN0IGZvciBCUEYgQ0kgYW5k
IGxvY2FsIHZtdGVzdAo+IC1leGNlcHRpb25zCQkJCQkjIEpJVCBkb2VzIG5vdCBzdXBwb3J0IGV4
Y2VwdGlvbnMKCkhtbSwgcmVhZGluZyB5b3VyIGNvdmVyIHRoZSBrc2VsZnRlc3QgcnVuIHN0aWxs
IHNheXMgIiMxMTMKZXhjZXB0aW9uczpGQUlMIiwgc28gZnJvbSBhIENJIHBlcnNwZWN0aXZlIHRo
aXMgaXMgbm90IG11Y2ggaGVscC4gOy0pCkNhbiB3ZSByZXN0cnVjdHVyZS9zcGxpdCBzbyB0aGF0
IHdlJ3JlIG5vdCBiaXR0ZW4gYnkgdGhlIGxhY2sgb2YKQlBGLXRvLUJQRiBjYWxscyBhbmQgdGFp
bCBjYWxscz8KCgpUaGFua3MsCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
