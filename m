Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AA0D10BF8
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Oct 2024 12:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wO6XskAwSJUrkEpqyOKF9pXPR/sAVCdvP7Mu07xRUo0=; b=VccLeVjyt9/0nh
	uz7GFNQaeQgA/nlD23CqHmptrRQSwzu4sGcI/mEUQQWDP3Ii6ZiM4S5PVlQUXrAmfrsZErmIcK8y4
	9Vjo/MSNYDOy9UmKcqEKDnMxbQ4jrqGoQ0NwVX9oVYN1CtxHRbL5wDPAI4H6EhkqW6seFC24Ziy/r
	EHeATPeiG8vatXGKn8iYE12/P1mkZ+hl/fHbIrdk+JxZWR/3djTpWOxmfVdaB9sAy7JTG6zPmjrlM
	bPJagi64/vHoJUP1oUssqaakeMAo4+8NJrxFXLlWRmlnjkX1Sq7p3+ZJ0a0ZDWUyhtDn+FIh5T3AV
	zvnoEAoHREiH/lahH62g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4gJE-00000006eL0-2gpB;
	Sat, 26 Oct 2024 12:54:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4gJC-00000006eJE-24dE
	for linux-riscv@lists.infradead.org;
	Sat, 26 Oct 2024 12:54:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C81015C5589;
	Sat, 26 Oct 2024 12:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 425CCC4CEC6;
	Sat, 26 Oct 2024 12:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729947261;
	bh=iKa9bcxI6W9fsHF/fh/13PtU+WQ5xvNEzWBxiNVZ7eU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Rr0HF2A4OHxPVLkG66zIsA8D6iwuAPYLezAGVOe/LUIHoNOkc7djYPSo/4eVX6vhM
	 KZO9ycMHcppjPtg5UFEHlnpWavhEMZfStN9lFTBq61LrrJKX+S2aC9O/wfTk8q4QEM
	 bHvqgX6KwJlR7NgqtT2XZEgZMhjYnrqNtM8KxPI1v+MhHGRb+KOTVRCgRUmlX4uhr/
	 2w83yfInFhGYwKGAjNG+lhqxaRUL2RxRtWSyR8zQ+ywIaK74PRt5gZ6BC8tbgA0VJL
	 t+jAu+jZpKkdFqawZb7PfXODUJOXJNrOLy5zbXX+lFlbUVm3ROekitz7DtYgsJDHJO
	 HbV0NDFvPIhbg==
From: Puranjay Mohan <puranjay@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Hao Luo <haoluo@google.com>,
	Helge Deller <deller@gmx.de>,
	Jakub Kicinski <kuba@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Mykola Lysenko <mykolal@fb.com>,
	netdev@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Song Liu <song@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Yonghong Song <yonghong.song@linux.dev>
Subject: [PATCH bpf-next v3 3/4] selftests/bpf: don't mask result of bpf_csum_diff() in test_verifier
Date: Sat, 26 Oct 2024 12:53:38 +0000
Message-Id: <20241026125339.26459-4-puranjay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241026125339.26459-1-puranjay@kernel.org>
References: <20241026125339.26459-1-puranjay@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_055422_623303_E3030670 
X-CRM114-Status: UNSURE (   8.12  )
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

VGhlIGJwZl9jc3VtX2RpZmYoKSBoZWxwZXIgaGFzIGJlZW4gZml4ZWQgdG8gcmV0dXJuIGEgMTYt
Yml0IHZhbHVlIGZvcgphbGwgYXJjaHMsIHNvIG5vdyB3ZSBkb24ndCBuZWVkIHRvIG1hc2sgdGhl
IHJlc3VsdC4KClRoaXMgY29tbWl0IGlzIGJhc2ljYWxseSByZXZlcnRpbmcgdGhlIGJlbG93OgoK
Y29tbWl0IDYxODUyNjZjNWE4NSAoInNlbGZ0ZXN0cy9icGY6IE1hc2sgYnBmX2NzdW1fZGlmZigp
IHJldHVybiB2YWx1ZQp0byAxNiBiaXRzIGluIHRlc3RfdmVyaWZpZXIiKQoKU2lnbmVkLW9mZi1i
eTogUHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5QGtlcm5lbC5vcmc+CkFja2VkLWJ5OiBEYW5pZWwg
Qm9ya21hbm4gPGRhbmllbEBpb2dlYXJib3gubmV0PgpSZXZpZXdlZC1ieTogVG9rZSBIw7hpbGFu
ZC1Kw7hyZ2Vuc2VuIDx0b2tlQHJlZGhhdC5jb20+Ci0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvYnBmL3Byb2dzL3ZlcmlmaWVyX2FycmF5X2FjY2Vzcy5jIHwgMyArLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvdmVyaWZpZXJfYXJyYXlfYWNjZXNzLmMgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvdmVyaWZpZXJfYXJyYXlfYWNjZXNzLmMKaW5k
ZXggOTVkN2VjYzEyOTYzYi4uNDE5NWFhODI0YmE1NSAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvYnBmL3Byb2dzL3ZlcmlmaWVyX2FycmF5X2FjY2Vzcy5jCisrKyBiL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy92ZXJpZmllcl9hcnJheV9hY2Nlc3MuYwpAQCAt
MzY4LDggKzM2OCw3IEBAIF9fbmFrZWQgdm9pZCBhX3JlYWRfb25seV9hcnJheV8yXzEodm9pZCkK
IAlyNCA9IDA7CQkJCQkJXAogCXI1ID0gMDsJCQkJCQlcCiAJY2FsbCAlW2JwZl9jc3VtX2RpZmZd
OwkJCQlcCi1sMF8lPToJcjAgJj0gMHhmZmZmOwkJCQkJXAotCWV4aXQ7CQkJCQkJXAorbDBfJT06
CWV4aXQ7CQkJCQkJXAogIgk6CiAJOiBfX2ltbShicGZfY3N1bV9kaWZmKSwKIAkgIF9faW1tKGJw
Zl9tYXBfbG9va3VwX2VsZW0pLAotLSAKMi40MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
