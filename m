Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3753F606A319
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 11:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ARfRyNN8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d4fJGOkx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+DFjyAOtQ9SeqGcZ4AACTbLl8y+c6DqLI9wYiF6wuKo=; b=ARfRyNN8eoxuxnlZRg/lS4/q+4
	dsTXcU8gAcJlTRwJ1xR9VQagjFBVSAtnshoB5WjaOYn5YewTw62fc9AekM3Zd9DxFHAxHTaevrjlj
	hBbU7HnW7eFVornEEePNzaIN3CP4Bpf2IaDgouwargO9Rhw+wYg/a0UgsV3JTnzxnDPQxzpN/dJFx
	g3yslWu0bPmMp9xwHBn8S8uUkC2pxrsOr7sQ/skovYduhCCfhVizPjV5iu5Yb4PD/F7dBVmIs4Mxl
	qLeEbFiH9nZCFgTl1JVLfX7rNQc7ZGl6jNbTv5iot7n/etu3Ko5M2tQqn9xK/6Pg/mzPsVO2LVvD7
	tdEIi72w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqoB-0000000E09X-0JxW;
	Thu, 22 Oct 2026 11:18:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqo8-0000000E096-3jM4;
	Thu, 22 Oct 2026 11:18:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CCBC860018;
	Thu, 22 Oct 2026 11:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43D21F000C1;
	Thu, 22 Oct 2026 11:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792667883;
	bh=JclM6m6UJd9X/eOzEM/yHtyN8srcsiT4FYG2M3UATeQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=d4fJGOkxHdDVT8ZFMZ7Z04p+Ls2YAslbqzV3fpCgkx/tvjSu6/DEUeajUjK1NiKAC
	 fd2XELg/Htc6LuXgCztTcSRwA23afViNqzg3m4zWXg9LHknn7UeeZ4UQUm+FNRIGlD
	 cfFeuwaRaFWM4ksecwZpmCiF4oGxY5GKEgR5diRkTHQ4mDJz5CO0EHmQ1URUwj03BG
	 O8Qpgd3e0o1cigcVjxBlqpCYc4qxKLVLv7KjwTqhAjibmLhujitUoJMNIMOjP37Yji
	 ulhuU6fdxZBJPq80wItLkGsphSKy91we2VoD37Eyqqf0uHHHJRxUkyjYIcyxpDYT/m
	 SOCfT9gy/6v0w==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: tangyazhou@zju.edu.cn, bpf@vger.kernel.org, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya
 Dwivedi <memxor@gmail.com>, David Vernet <void@manifault.com>,
 bpf@ietf.org
Cc: John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis
 <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, Quentin
 Monnet <qmo@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai
 <xukuohai@huaweicloud.com>, Pu Lehui <pulehui@huawei.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, Shahab Vahedi <list+bpf@vahedi.org>,
 Russell King <linux@armlinux.org.uk>, Tiezhu Yang
 <yangtiezhu@loongson.cn>, Hengqi Chen <hengqi.chen@gmail.com>, Johan
 Almbladh <johan.almbladh@anyfinetworks.com>, Paul Burton
 <paulburton@kernel.org>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Hari Bathini <hbathini@linux.ibm.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, Naveen N Rao <naveen@kernel.org>, Luke Nelson
 <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Wang YanQing
 <udknight@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, linux-doc@vger.kernel.org, Yazhou Tang
 <tangyazhou518@outlook.com>, Tianci Cao <ziye@zju.edu.cn>, Shenghao Yuan
 <shenghaoyuan0928@163.com>
Subject: Re: [PATCH bpf-next v2 4/8] bpf, riscv: JIT UHMUL and SHMUL on RV64
In-Reply-To: <20261021-bpf-hmul-v2-4-88e260099f7d@outlook.com>
References: <20261021-bpf-hmul-v2-0-88e260099f7d@outlook.com>
 <20261021-bpf-hmul-v2-4-88e260099f7d@outlook.com>
Date: Thu, 22 Oct 2026 13:18:00 +0200
Message-ID: <874iee6l1z.fsf@all.your.base.are.belong.to.us>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

dGFuZ3lhemhvdUB6anUuZWR1LmNuIHdyaXRlczoKCj4gRnJvbTogWWF6aG91IFRhbmcgPHRhbmd5
YXpob3U1MThAb3V0bG9vay5jb20+Cj4KPiBPbiBSVjY0LCB0aGUgUklTQy1WIE0gZXh0ZW5zaW9u
IHByb3ZpZGVzIE1VTEhVIGFuZCBNVUxIIGluc3RydWN0aW9ucyB0aGF0Cj4gcmV0dXJuIHRoZSBo
aWdoIDY0IGJpdHMgb2YgYW4gdW5zaWduZWQgb3Igc2lnbmVkIDY0LWJpdCBtdWx0aXBsaWNhdGlv
biwKPiByZXNwZWN0aXZlbHkuCj4KPiBBZGQgdGhlIG1pc3NpbmcgTVVMSCBlbmNvZGVyIGFuZCB1
c2UgTVVMSFUgYW5kIE1VTEggdG8gbG93ZXIgdGhlIFVITVVMIGFuZAo+IFNITVVMIEJQRl9NVUwg
dmFyaWFudHMgZm9yIGJvdGggcmVnaXN0ZXIgYW5kIGltbWVkaWF0ZSBzb3VyY2VzLiBLZWVwIHRo
ZQo+IGV4aXN0aW5nIGxvdy1oYWxmIGFuZCBBTFUzMiBtdWx0aXBsaWNhdGlvbiBsb3dlcmluZyB1
bmNoYW5nZWQuCj4KPiBTdWdnZXN0ZWQtYnk6IEFsZXhlaSBTdGFyb3ZvaXRvdiA8YWxleGVpLnN0
YXJvdm9pdG92QGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBZYXpob3UgVGFuZyA8dGFuZ3lh
emhvdTUxOEBvdXRsb29rLmNvbT4KPiBDby1kZXZlbG9wZWQtYnk6IFRpYW5jaSBDYW8gPHppeWVA
emp1LmVkdS5jbj4KPiBTaWduZWQtb2ZmLWJ5OiBUaWFuY2kgQ2FvIDx6aXllQHpqdS5lZHUuY24+
Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBTaGVuZ2hhbyBZdWFuIDxzaGVuZ2hhb3l1YW4wOTI4QDE2My5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogU2hlbmdoYW8gWXVhbiA8c2hlbmdoYW95dWFuMDkyOEAxNjMu
Y29tPgoKQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
