Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D7BC44501
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 07:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGIqJP4FGOplOi+w3VdlA/IcxOWhTqC9d0GQuFLEot0=; b=45IdWhno90po1z
	HaedPeUtqMP8urtSQv+N55/EsUXfj8WyaASk3wuGlUPzCdamxKUe/zkmYpGu/4ABgfw+ve4u4VXuL
	VyRZQqAgLjdj/Zl+wiXJ7vYPc6Ix9Qjw/ui7bncDyqZ4C++hjmwAiq3hGfaF5vNW6iNhNq3MACnW5
	+vEA/D/Wi00ItDL4LUdrE3ym+VI5wcMyvB9/DTk0JZBZjUAMBE2H6NPe/ogcmQ1AZhwX5xXTOlP0U
	FGq2m4Wy3SCN70DpVAA0/52/EYlTOwZ8scFPU4lgxAlJbLZ55kPodUpFNHnOjz/L7YKLQLzoKGGIj
	HvnJy2Vd/TsMnZr+PP/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGzd-0000000GheR-02pb;
	Thu, 16 Jul 2026 07:58:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGzb-0000000GheG-0xbD
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 07:58:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 147B242E7E;
	Thu, 16 Jul 2026 07:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7F01F000E9;
	Thu, 16 Jul 2026 07:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784188729;
	bh=XFGB9EYTJwH+N4BI/qhn6r7GPkURnLDExNdsrN16I9k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=QWKRQEdDiRTpwlxFhKtRwDV6MX9vBuTKRz3k1VfevFlBG+b6rXCBDO5CZjsL8QqL7
	 d0dN1XFfBltaKe56b6y/0CbtnFP/SVnL67XU/txpIidjorkHlqvlPlcT4Qfs2B4DG7
	 x83SrrwBpmXQBQFS3NOYjXxW8J/BdjYCC5EP0mckkD0maDzYCNuWSRPZjd+MNefeYx
	 ukrVcR4hwYZr37KxVQ7ksFbjeyrwht3BgI8zYwuSsjkUJShdaEcDWXYkyHjU8aAbzP
	 QnmTSfrxyrdp2g3Vy1UpCgAzPU8uB7D5Q/RXzgTUJ0FhetG7DLi1fVBjaCFJM6bSyx
	 XJ2XEJ/5LGx8A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Feng Jiang <jiangfeng@kylinos.cn>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya
 Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song
 Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Luke Nelson
 <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Pu Lehui
 <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan
 <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Feng Jiang
 <jiangfeng@kylinos.cn>
Subject: Re: [PATCH v3 2/2] selftests/bpf: enable timed may_goto tests for
 riscv64
In-Reply-To: <20260715-riscv-bpf-timed-may-goto-v3-2-cf2a9c3d843f@kylinos.cn>
References: <20260715-riscv-bpf-timed-may-goto-v3-0-cf2a9c3d843f@kylinos.cn>
 <20260715-riscv-bpf-timed-may-goto-v3-2-cf2a9c3d843f@kylinos.cn>
Date: Thu, 16 Jul 2026 09:58:45 +0200
Message-ID: <877bmvwekq.fsf@all.your.base.are.belong.to.us>
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

RmVuZyBKaWFuZyA8amlhbmdmZW5nQGt5bGlub3MuY24+IHdyaXRlczoKCj4gRW5hYmxlIHZlcmlm
aWVyX21heV9nb3RvXzEgKHJhdyBpbnN0cnVjdGlvbiB0ZXN0cyksIHN0cmVhbV9jb25kX2JyZWFr
Cj4gKDI1MG1zIHRpbWVvdXQgcGF0aCksIGFuZCB0aGUgbWF5X2dvdG9faW50ZXJhY3Rpb25fYXJt
NjQgZmFzdGNhbGwgdGVzdAo+IG9uIHJpc2N2NjQgbm93IHRoYXQgdGhlIEpJVCBzdXBwb3J0cyB0
aW1lZCBtYXlfZ290by4KClJlYWxseSBhIG5pdCwgYnV0IG5vdyB0aGF0IG1heV9nb3RvX2ludGVy
YWN0aW9uX2FybTY0KCkgaGFuZGxlcyBtb3JlCnRoYW4ganVzdCBhYXJjaDY0LCBtYXliZSByZW5h
bWUgdGhhdCBmdW5jdGlvbj8KCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
