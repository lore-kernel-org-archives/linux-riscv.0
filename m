Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D23C3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 17:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aRy4KJUw7f71j0ZKbt05BMWk0DBDqdGnPHwfJFWXtrs=; b=LFIiB8JQi6uy/9
	A+M6OXeEwylPxdxWTkQ4cwRL3I3KhykdNw82+CbwGaIL3n09J/yqipJ8fdx8JNNrhWrBv/iJVlOA1
	xN9AuG/JyAcMgAN5QRatrEe2noGPn3QhoNsHZD/tNTl/0H6z++SyG7ilRvuU6whafyXslWforWo7p
	flZslGqBPWnt6fBS1pIUg9BvN1I6JI2MuhCAGHvv0oQQc81F5JlmW9UuI+7GYlxeI0rcosvmjLlp3
	C7dxr3NpOOtyUHCTWtNvBjd/wqRsyHNnVXqk7EIXAMhY8RfAyNpJEGNewdmZ79dr5jWNrnX+h2v4M
	Mf8HZUJabh0cTn4s3Qqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seecS-0000000AhAp-27Ml;
	Thu, 15 Aug 2024 17:50:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seecP-0000000Ah9f-1KHi
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 17:50:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 496CA61F4E;
	Thu, 15 Aug 2024 17:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F87C4AF11;
	Thu, 15 Aug 2024 17:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723744236;
	bh=mPwQMWmaE58h5WbJPFCinD0DF0R538hkvKeIfgExaZo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=be3LTV+m4+TrThyeg+AMlMFa2Sr5e6aO9C+yrL4O4bfNBD1fyCdo0GdKsHhnTu64m
	 Deh6qT5QIsOp7WOU6LGg92EN3BiP4ho9w9wDfvl10Q5WGnXmS3lyKfmVVdlR9Dp34l
	 FB8T0a2mCYWKo25HY4A8pUrRZERwuk48mYttECbGsfI+HInbL2/Sc1ddh+iHnOogWu
	 ywATzc/BdVo/em4amKowAXtEyzdtnkvIE7/yoSKx+ksZIS7l6gCo/lIMHXRDaGn4h8
	 ++wM7hoNLlpqSPUEi3agVcKBg25V7W+7vxyKff4i5c9WQWZeySPRU63vWh/pD4vDUX
	 Ye9Tzwgy+czJw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 643B0382327A;
	Thu, 15 Aug 2024 17:50:36 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: entry: always initialize regs->a0 to -ENOSYS
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172374423527.2967007.4867324910866661414.git-patchwork-notify@kernel.org>
Date: Thu, 15 Aug 2024 17:50:35 +0000
References: <20240627142338.5114-2-CoelacanthusHex@gmail.com>
In-Reply-To: <20240627142338.5114-2-CoelacanthusHex@gmail.com>
To: Celeste Liu <coelacanthushex@gmail.com>
Cc: linux-riscv@lists.infradead.org, bjorn@rivosinc.com,
 linux-kernel@vger.kernel.org, ldv@strace.io, guoren@kernel.org,
 palmer@rivosinc.com, emil.renner.berthing@canonical.com,
 felixonmars@archlinux.org, c141028@gmail.com, CoelacanthusHex@gmail.com,
 stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_105037_419181_257962B3 
X-CRM114-Status: GOOD (  10.58  )
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZml4ZXMp
CmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIFRodSwgMjcgSnVu
IDIwMjQgMjI6MjM6MzkgKzA4MDAgeW91IHdyb3RlOgo+IE90aGVyd2lzZSB3aGVuIHRoZSB0cmFj
ZXIgY2hhbmdlcyBzeXNjYWxsIG51bWJlciB0byAtMSwgdGhlIGtlcm5lbCBmYWlscwo+IHRvIGlu
aXRpYWxpemUgYTAgd2l0aCAtRU5PU1lTIGFuZCBzdWJzZXF1ZW50bHkgZmFpbHMgdG8gcmV0dXJu
IHRoZSBlcnJvcgo+IGNvZGUgb2YgdGhlIGZhaWxlZCBzeXNjYWxsIHRvIHVzZXJzcGFjZS4gRm9y
IGV4YW1wbGUsIGl0IHdpbGwgYnJlYWsKPiBzdHJhY2Ugc3lzY2FsbCB0YW1wZXJpbmcuCj4gCj4g
Rml4ZXM6IDUyNDQ5YzE3YmRkMSAoInJpc2N2OiBlbnRyeTogc2V0IGEwID0gLUVOT1NZUyBvbmx5
IHdoZW4gc3lzY2FsbCAhPSAtMSIpCj4gUmVwb3J0ZWQtYnk6ICJEbWl0cnkgVi4gTGV2aW4iIDxs
ZHZAc3RyYWNlLmlvPgo+IFJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2lu
Yy5jb20+Cj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBDZWxl
c3RlIExpdSA8Q29lbGFjYW50aHVzSGV4QGdtYWlsLmNvbT4KPiAKPiBbLi4uXQoKSGVyZSBpcyB0
aGUgc3VtbWFyeSB3aXRoIGxpbmtzOgogIC0gW3YyXSByaXNjdjogZW50cnk6IGFsd2F5cyBpbml0
aWFsaXplIHJlZ3MtPmEwIHRvIC1FTk9TWVMKICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlz
Y3YvYy82MTExOTM5NDYzMWYKCllvdSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQotLSAKRGVldC1k
b290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9wYXRjaHdv
cmsvcHdib3QuaHRtbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
