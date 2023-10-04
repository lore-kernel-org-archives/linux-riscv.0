Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC2EE7B5F9
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 12:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JW8RMNP1klkET3/oxkWhVMjesjZlFupJltQmlrB0OAI=; b=cf+IKiLKUjiT6k
	DdU4kj+7U8JIQFh2nnfOG1I7r40fQIX8V43JPRCpt/5bJDnI0iM8P1Z6V6QqosJAn/Xd+sNEWFnla
	T1H3Nj4v8s/6+Me0qcp8P4N5msm+0tDGooeHJ7UT6/+7IsCPhK9yTTGsq8owPln7rnd5v/k+YQZem
	qNDGTJ0861+itZxskfv0rZyUFlrsuQ08HOgKRjJnYaaunBJF7JjqnK/h+IuY8LCukygZkiM7beyXW
	Pn5x5p/W1PlRWTJGqMELM1D/Bi3U2PA0WlOQnxdXEi0v1KtPS8W4YmVD2JwOBlSW/PlA98wHDFsl6
	W3F+GgQXN63ZOdcAikhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo0ew-00HYlH-2E;
	Wed, 04 Oct 2023 12:07:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo0et-00HYjo-1n
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 12:07:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 071466150B;
	Wed,  4 Oct 2023 12:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A32C433C7;
	Wed,  4 Oct 2023 12:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696421238;
	bh=jiwF/a0PTTygMSsmAPMD6cp4z/ZqdiLgziTxoP11oDg=;
	h=From:To:Cc:Subject:Date:From;
	b=rmhaw58iLsxW4Gr3byt0TNlCS8nNUD+lr00+679s8fRwqPTX1BzNVjyUNvRsAqOR6
	 fjF0eI4lo/624C8zlX5D3Zn59FXHswT3peYewYJrafb9VvGNGSQmI+REoIsXYnoqyb
	 NEhNkcuePwm7Z83wDdogWISAVjyqI4bgwj57rbO4PQtOsDOnPLNNXCa81O53IcqDVm
	 fJb0uqHB8PtlbMQL2Au3r6YFBUidKXyOZWANR07KO+HGpK2Q1KkUuPDgNqWOw/MIgg
	 S0HnKWDJzv3aau/5AlwR9cOlDztikig1jXfHsQnZQlQDFNG0vS62lp7hiYxTCQEgLa
	 afMFOSqkw86jw==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	Pu Lehui <pulehui@huawei.com>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH bpf 0/2] riscv, bpf: Properly sign-extend return values
Date: Wed,  4 Oct 2023 14:07:04 +0200
Message-Id: <20231004120706.52848-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_050719_635424_9647FCB0 
X-CRM114-Status: UNSURE (   7.90  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhlIFJJU0MtViBhcmNo
aXRlY3R1cmUgZG9lcyBub3QgZXhwb3NlIHN1Yi1yZWdpc3RlcnMsIGFuZCBob2xkIGFsbAozMi1i
aXQgdmFsdWVzIGluIGEgc2lnbi1leHRlbmRlZCBmb3JtYXQgWzFdIFsyXToKCiAgfCBUaGUgY29t
cGlsZXIgYW5kIGNhbGxpbmcgY29udmVudGlvbiBtYWludGFpbiBhbiBpbnZhcmlhbnQgdGhhdCBh
bGwKICB8IDMyLWJpdCB2YWx1ZXMgYXJlIGhlbGQgaW4gYSBzaWduLWV4dGVuZGVkIGZvcm1hdCBp
biA2NC1iaXQKICB8IHJlZ2lzdGVycy4gRXZlbiAzMi1iaXQgdW5zaWduZWQgaW50ZWdlcnMgZXh0
ZW5kIGJpdCAzMSBpbnRvIGJpdHMKICB8IDYzIHRocm91Z2ggMzIuIENvbnNlcXVlbnRseSwgY29u
dmVyc2lvbiBiZXR3ZWVuIHVuc2lnbmVkIGFuZAogIHwgc2lnbmVkIDMyLWJpdCBpbnRlZ2VycyBp
cyBhIG5vLW9wLCBhcyBpcyBjb252ZXJzaW9uIGZyb20gYSBzaWduZWQKICB8IDMyLWJpdCBpbnRl
Z2VyIHRvIGEgc2lnbmVkIDY0LWJpdCBpbnRlZ2VyLgoKV2hpbGUgQlBGLCBvbiB0aGUgb3RoZXIg
aGFuZCwgZXhwb3NlcyBzdWItcmVnaXN0ZXJzLCBhbmQgdXNlCnplcm8tZXh0ZW5zaW9uIChzaW1p
bGFyIHRvIGFybTY0L3g4NikuCgpUaGlzIGhhcyBsZWQgdG8gc29tZSBzdWJ0bGUgYnVncywgd2hl
cmUgYSBCUEYgSklUdGVkIHByb2dyYW0gaGFzIG5vdApzaWduLWV4dGVuZGVkIHRoZSBhMCByZWdp
c3RlciAocmV0dXJuIHZhbHVlIGluIFJJU0MtViBsYW5kKSwgcGFzc2VkCnRoZSByZXR1cm4gdmFs
dWUgdXAgdGhlIGtlcm5lbCwgZS5nLjoKICAgIAogIHwgaW50IGZyb21fYnBmKHZvaWQpOwogIHwK
ICB8IGxvbmcgZm9vKHZvaWQpCiAgfCB7CiAgfCAgICByZXR1cm4gZnJvbV9icGYoKTsKICB8IH0K
ClRoaXMgc2VyaWVzIGZpeGVzIHRoaXMgaXNzdWUgYnkga2VlcGluZyBhIHBhaXIgb2YgcmV0dXJu
IHZhbHVlCnJlZ2lzdGVyczsgYTAgKFJJU0MtViBBQkksIHNpZ24tZXh0ZW5kZWQpLCBhNSAoQlBG
LCB6ZXJvLWV4dGVuZGVkKS4KClRoZSBmb2xsb3dpbmcgdGVzdF9wcm9ncyBub3cgcGFzcywgd2hp
Y2ggd2VyZSBwcmV2aW91c2x5IGJyb2tlbjoKCiAgfCAxMyAgICAgIGJwZl9jb29raWUKICB8IDE5
ICAgICAgYnBmX21vZF9yYWNlCiAgfCA2OCAgICAgIGRlbnlfbmFtZXNwYWNlCiAgfCAxMTkgICAg
IGxpYmJwZl9nZXRfZmRfYnlfaWRfb3B0cwogIHwgMTM1ICAgICBsb29rdXBfa2V5CiAgfCAxMzcg
ICAgIGxzbV9jZ3JvdXAKICB8IDI4NCAgICAgdGVzdF9sc20KCgpCasO2cm4KCgpCasO2cm4gVMO2
cGVsICgyKToKICByaXNjdiwgYnBmOiBTaWduLWV4dGVuZCByZXR1cm4gdmFsdWVzCiAgcmlzY3Ys
IGJwZjogVHJhY2sgYm90aCBhMCAoUklTQy1WIEFCSSkgYW5kIGE1IChCUEYpIHJldHVybiB2YWx1
ZXMKCiBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIHwgMTggKysrKysrKysrKysrLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCgpi
YXNlLWNvbW1pdDogOTA3N2ZjMjI4ZjA5YzlmOTc1YzQ5OGM1NWY1ZDJlODgyY2QwZGE1OQotLSAK
Mi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
