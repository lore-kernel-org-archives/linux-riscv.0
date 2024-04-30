Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155DDC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 17:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DwwBgFnXzNdv8DA0jSZfYNd61MixEP9V2UipgH0wRvw=; b=ZzbTGxKEtHW/xT
	4bdyxd9mXJCEKwCEzjtm6jq/Rx1Yv6QTlXOW8XIAyfPJdX2WEbY0UMaS12hGxIznJtTHeBP/4ZC89
	n8J+XMP2dMjgi7EFPewwUxGPgbeBfqbJE7NAS/IbyqLwmtEBTJwq03Dnf3d/cb5DmikRj5ExRj18G
	7Vp2FcN3Y6HtKipM6ORacMzE2HFyYVJ6dMkKUttMAemZ6pxdXqqLyF6IgwnM1nU49CFyMjtKNVS5g
	4CAHscXvCaeHbzxOB8KpJ1ZENAnuijifDgvJF4ZBOVW1sqnjWaRvMTzrmNTEHfdYmKxcywQ3RCsRn
	YCoffyDEFVM5/wcfJExw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1rkp-00000007Vni-2P2z;
	Tue, 30 Apr 2024 17:58:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1rkm-00000007VmH-2B9D
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 17:58:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 56469614CD;
	Tue, 30 Apr 2024 17:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0559C2BBFC;
	Tue, 30 Apr 2024 17:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714499935;
	bh=9GscSuMrdqZRGQiz+g8LzDHMXZexOoafw/dgWylTjf4=;
	h=From:To:Cc:Subject:Date:From;
	b=qOcbs9VICSWN1L4GCro9oYzvMgsVeBcG/Q0+HKQ67mclDI2I0nYhhtFVjHIJIVbYc
	 pPTuoaqDwVTCDdsoM2LFax7yBk0B6c3AWzHHTWv9EqoVuA8AtL4RAygBqfXzvWsSVG
	 FJByHvlxUuD+3h0VNSoS8PBUgbRVn4VJ7CdJU0p6eMks+OmvhZHNI9bEDij6n7dGFS
	 nYgPpRNggyNAoE+2GxUXyRZa+K0ZYktHrD2kxlKehoWx1FGgOtY9VAUvj4zAzNfRSM
	 3PSS6rXRxaOFeRWaDiq3JH2/SmldFkaouq1C9WAN5p8JIMJ5EaG+jsxbkj3RqUaQlp
	 hNYLM1LiXbS7g==
From: Puranjay Mohan <puranjay@kernel.org>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pu Lehui <pulehui@huawei.com>
Cc: puranjay12@gmail.com
Subject: [PATCH bpf-next v2 0/2] riscv, bpf: Support per-CPU insn and inline bpf_get_smp_processor_id()
Date: Tue, 30 Apr 2024 17:58:32 +0000
Message-Id: <20240430175834.33152-1-puranjay@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_105856_629730_A21F2640 
X-CRM114-Status: GOOD (  10.27  )
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

Q2hhbmdlcyBpbiB2MS0+djI6CnYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA0
MDUxMjQzNDguMjc2NDQtMS1wdXJhbmpheTEyQGdtYWlsLmNvbS8KLSBVc2UgZW1pdF9hZGRyKCkg
aW4gcGxhY2Ugb2YgZW1pdF9pbW0oKSBpbiB0aGUgZmlyc3QgcGF0Y2guCi0gQWRkIHRoZSBzZWNv
bmQgcGF0Y2ggdG8gaW5saW5lIGJwZl9nZXRfc21wX3Byb2Nlc3Nvcl9pZCgpCgpUaGUgZmlyc3Qg
cGF0Y2ggYWRkIHRoZSBzdXBwb3J0IGZvciB0aGUgaW50ZXJuYWwtb25seSBNT1YgaW5zdHJ1Y3Rp
b24gdG8KcmVzb2x2ZSBwZXItQ1BVIGFkZHJzIHRvIGFic29sdXRlIGFkZHJlc3Nlcy4KUklTQy1W
IHVzZXMgZ2VuZXJpYyBwZXItY3B1IGltcGxlbWVudGF0aW9uIHdoZXJlIHRoZSBvZmZzZXRzIGZv
ciBDUFVzIGFyZQprZXB0IGluIGFuIGFycmF5IGNhbGxlZCBfX3Blcl9jcHVfb2Zmc2V0W2NwdV9u
dW1iZXJdLiBSSVNDViBzdG9yZXMgdGhlCmFkZHJlc3Mgb2YgdGhlIHRhc2tfc3RydWN0IGluIFRQ
IHJlZ2lzdGVyLiBUaGUgZmlyc3QgZWxlbWVudCBpbiB0YXNrX3N0cnVjdAppcyBzdHJ1Y3QgdGhy
ZWFkX2luZm8sIGFuZCB3ZSBjYW4gZ2V0IHRoZSBjcHUgbnVtYmVyIGJ5IHJlYWRpbmcgZnJvbSB0
aGUgVFAKcmVnaXN0ZXIgKyBvZmZzZXRvZihzdHJ1Y3QgdGhyZWFkX2luZm8sIGNwdSkuCgpUaGUg
c2Vjb25kIHBhdGNoIGlubGluZXMgdGhlIGNhbGxzIGJwZl9nZXRfc21wX3Byb2Nlc3Nvcl9pZCgp
IGluIHRoZSBKSVQKYnkgZW1pdHRpbmcgYSBsb2FkIGZyb20gdGhlIFRQICsgb2Zmc2V0b2Yoc3Ry
dWN0IHRocmVhZF9pbmZvLCBjcHUpLgoKQmVuY2htYXJrIHVzaW5nIFsxXSBvbiBRZW11LgoKICAu
L2JlbmNocy9ydW5fYmVuY2hfdHJpZ2dlci5zaCBnbG9iLWFyci1pbmMgYXJyLWluYyBoYXNoLWlu
YwoKICArLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0t
LS0rLS0tLS0tLS0tLS0tLS0rCiAgfCAgICAgIE5hbWUgICAgIHwgICAgIEJlZm9yZSAgICAgICB8
ICAgICAgIEFmdGVyICAgICAgfCAgICUgY2hhbmdlICAgfAogIHwtLS0tLS0tLS0tLS0tLS0rLS0t
LS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLXwKICB8IGds
b2ItYXJyLWluYyAgfCAxLjA3NyDCsSAwLjAwNk0vcyB8IDEuMzM2IMKxIDAuMDEwTS9zIHwgICAr
IDI0LjA0JSAgIHwKICB8IGFyci1pbmMgICAgICAgfCAxLjA3OCDCsSAwLjAwMk0vcyB8IDEuMzMy
IMKxIDAuMDE1TS9zIHwgICArIDIzLjU2JSAgIHwKICB8IGhhc2gtaW5jICAgICAgfCAwLjQ5NCDC
sSAwLjAwNE0vcyB8IDAuNjUzIMKxIDAuMDAxTS9zIHwgICArIDMyLjE4JSAgIHwKICArLS0tLS0t
LS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0t
LS0tLS0rCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL2FuYWtyeWlrby9saW51eC9jb21taXQvOGRl
YzkwMDk3NWVmCgpQdXJhbmpheSBNb2hhbiAoMik6CiAgcmlzY3YsIGJwZjogYWRkIGludGVybmFs
LW9ubHkgTU9WIGluc3RydWN0aW9uIHRvIHJlc29sdmUgcGVyLUNQVSBhZGRycwogIHJpc2N2LCBi
cGY6IGlubGluZSBicGZfZ2V0X3NtcF9wcm9jZXNzb3JfaWQoKQoKIGFyY2gvcmlzY3YvbmV0L2Jw
Zl9qaXRfY29tcDY0LmMgfCA1MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGlu
Y2x1ZGUvbGludXgvZmlsdGVyLmggICAgICAgICAgfCAgMSArCiBrZXJuZWwvYnBmL2NvcmUuYyAg
ICAgICAgICAgICAgIHwgMTEgKysrKysrKysKIGtlcm5lbC9icGYvdmVyaWZpZXIuYyAgICAgICAg
ICAgfCAgMiArKwogNCBmaWxlcyBjaGFuZ2VkLCA2NCBpbnNlcnRpb25zKCspCgotLSAKMi40MC4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
