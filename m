Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F09C61DBE
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 13:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gb6nhSOsKpgqErFIo5YQ9EWPpQAD3KP1TqpzJ1lf+WU=; b=rF1Hvwef0C7R5A
	gfPdmPReylON2WPuHvIQ2XraFGv7vhEC+AHswBWNhblWqz4BoQ31lIyq+QzCl4Q5pEHNtK2LM3I6J
	4ayA3N/hhkPAvzqp+YgcBbqKGIc0azbw8T+1B3/HrNH0aVKT8D7svmfDaafWHfjk/11tuBd5dIyBW
	vknwAyKtrCD8vxIVvVg+Ek56zMe+vHQWj1cNWKiAZK4ZjglyYyM+WJbXWrQlkyKBV9gEuZ1Rf1J2w
	YjiloLghvEjmgAVX9+dhz7qT8xanwXDS01aKClGtVw1E6AX0qc+BDRsCclgrkU1viJGsl4U+AK6e0
	1B0mgno5kQF0BKxHQYkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyr19-00000000qFX-45Qc;
	Tue, 25 Aug 2026 13:16:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyr18-00000000qFQ-2VvJ
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 13:16:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A5F016020E;
	Tue, 25 Aug 2026 13:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C79AA1F00A3A;
	Tue, 25 Aug 2026 13:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787663801;
	bh=VwATnANXbcLF+RuGQE5pHvL6SYNDXCMexh01FqPSPsM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=W4kAZzFEg8RkiZf7wEIeiOrOmda2BSn6E2xZTDNeGWK/yR3mwFM70EUJQYNGb3M70
	 M8IFjTydpJIeOuRoEJpnSO/TS/nalmikigUGrTcuSsdcmOl46ZUn1cGFWKwNZJ5rv6
	 u/LzTyd1gs1MgSti9JQ6KTi/D3hQ24UMIJWnGHjjvEx0MCxqfEwfJu52yaT8LLDkpO
	 8jAYzvf0kVIt62p9+YBmcqv2nQEZRQAGuYxRdU1p9N4oLH99hpF78izUlQsro3wr4G
	 QN7u7DPupReNbsoYsT+9BddbnOEWoLqvRg5UyN09x+w1tC3+eYhDPoQ+W6KQjyoWPM
	 QQypLxFQ3+V/A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, memxor@gmail.com,
 puranjay@kernel.org
Cc: ihor.solodrai@linux.dev, eddyz87@gmail.com, martin.lau@linux.dev,
 song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
 emil@etsalapatis.com, pulehui@huawei.com, pjw@kernel.org,
 palmer@dabbelt.com, shuah@kernel.org, guoren@kernel.org,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v3 0/2] bpf, riscv: Add support for signed
 arena loads
In-Reply-To: <cover.1787140923.git.cp0613@linux.alibaba.com>
References: <cover.1787140923.git.cp0613@linux.alibaba.com>
Date: Tue, 25 Aug 2026 15:16:37 +0200
Message-ID: <87se42tk5m.fsf@all.your.base.are.belong.to.us>
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

Q2hlbiBQZWkgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT4gd3JpdGVzOgoKPiBDaGVuIFBlaSAo
Mik6Cj4gICBicGYsIHJpc2N2OiBBZGQgc3VwcG9ydCBmb3Igc2lnbmVkIGFyZW5hIGxvYWRzCj4g
ICBzZWxmdGVzdHMvYnBmOiBFbmFibGUgYXJlbmEgTERTWCB0ZXN0cyBmb3IgcmlzY3Y2NAo+Cj4g
IGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgICAgICAgICAgICAgICAgIHwgMTYgKysr
KysrKysrKy0tLS0tLQo+ICAuLi4vdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL3ZlcmlmaWVy
X2xkc3guYyB8IDE3ICsrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjcgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCgpCYWNrIGZyb20gc3VtbWVyIHZhY2F0aW9uISBB
cG9sb2dpZXMgZm9yIHRoZSBkZWxheSEKCkZvciB0aGUgc2VyaWVzOgoKQWNrZWQtYnk6IEJqw7Zy
biBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
