Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AE3CE7B17
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 10:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cakFQ38vlaAiSSzfjGUdYrMDl32JgvBYSFUG49ibnd0=; b=slnJmD1ZkwsaTZ
	UrKFKMgcnjrydaFsgrmHiw68PRy9ccdFHDNkmnJ6Jlfm2GDQRSQHxQ4/xJddFYwUNunTKLfS0KCSm
	zD6m3AqeqrAYmU/6AIe8IxrdG4YpCGFK4ua3jgMgSXURYqdCr0Q/RIMGqi8XxsFhbDy62fHo6lG79
	Qvh18gX22EQHoB1SCoZrXJBiXypVKi5sxNv0HgHgcdcCcEny2J/ttr7QDD9mWXjpkMQQaRgPC29zh
	ZlW4fQj7UQu2VDXJGe0nYV83UF0iTnAScGWq/FIAAR1EAKT2zo0c9fpGwfnDdy8tO3EXPANlfW63v
	fjgOlds2abfL78uj1leQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qloVR-002v9Q-1d;
	Thu, 28 Sep 2023 10:44:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qloVN-002v73-2a
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 10:44:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A41B2CE1D09;
	Thu, 28 Sep 2023 10:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41AB9C433C7;
	Thu, 28 Sep 2023 10:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695897861;
	bh=FvmhE1zWN7G0I1REAabVQr+yUPNKpb+BRUhnlZA70m4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pGUVE5en0exvjekKAMOQnWXPVBsU97kTtTAS0PxYVpySk8PdEzqhSspiONSumjOpg
	 ozkApq+2UPkiSa5V7km9Ay2W6zLXQE6oq4+gHtLgeGrP/e5umP7HIT10yXz8gQrO0I
	 5v18VrJGdBpPOM5iHlp2yAIogcDlDFzA0paoEzu4UorjvXAM96HAKR4PokXNJvP2hQ
	 h+jNwrGBL6OVV4USGMfQP7BDoX5gc6cWWJbchN8tl0aFYVikFUa1/ShAsJHk/6j/pd
	 hOz8MAVGdlks3O9dUQtcdqok/ktvvC8LSrBUV5TJNqddYbwtkUC2lAx2vi7K7gsRqZ
	 og9jKDYKcUc/w==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Luke Nelson
 <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>, Pu Lehui
 <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next v2 0/6] Zbb support and code simplification for
 RV64 JIT
In-Reply-To: <20230919035839.3297328-1-pulehui@huaweicloud.com>
References: <20230919035839.3297328-1-pulehui@huaweicloud.com>
Date: Thu, 28 Sep 2023 12:44:18 +0200
Message-ID: <87h6neo9vh.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_034426_128533_89A14871 
X-CRM114-Status: UNSURE (   4.59  )
X-CRM114-Notice: Please train this message.
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEFkZCBaYmIgc3Vw
cG9ydCBbMF0gdG8gb3B0aW1pemUgY29kZSBzaXplIGFuZCBwZXJmb3JtYW5jZSBvZiBSVjY0IEpJ
VC4KPiBNZWFud2hpbGUsIGFkanVzdCB0aGUgY29kZSBmb3IgdW5pZmljYXRpb24gYW5kIHNpbXBs
aWZpY2F0aW9uLiBUZXN0cwo+IHRlc3RfYnBmLmtvIGFuZCB0ZXN0X3ZlcmlmaWVyIGhhdmUgcGFz
c2VkLCBhcyB3ZWxsIGFzIHRoZSByZWxhdGl2ZQo+IHRlc3RjYXNlcyBvZiB0ZXN0X3Byb2dzKi4K
Ck5pY2Ugd29yayEKCkRpZCB5b3UgbWVhc3VyZSBob3cgdGhlIGluc3RydWN0aW9uIGNvdW50IGNo
YW5nZWQgZm9yLCBzYXksIHRlc3RfYnBmLmtvCmFuZCB0ZXN0X3Byb2dzPwoKCkJqw7ZybgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
