Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA2F606A335
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 08:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gn3a0z+d;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dGD7mkyb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=V2Bi6vYpl7B8/Skjrkyib3emwSnhc4eibQnirRi/298=; b=Gn3a0z+dBuAZoBa22EPT/4s2hl
	xuI7bTPa6unbTh82t0RY+T7Jv7JbGVVV8GJGMxTtszA1u4ikmK/MxNjTVHKrqJDewpHti2wVXQmGi
	TT9U6kRZY97Jcc9zWuEpvZ5C7ThYUKCwQOymDycw+3lr84E6IcYjUP45KJlM37MM0tYpuRX8A/B4y
	1rSXY1eC2vvtjCyc/VOwuiJeO0Jj2lB4Ql2PXOpZLvnT0i6pU3zPmSRKEyjZbBEyUSLFgPeHsuUQb
	T3RWpqzxH8JcIEqwuoiJL3bXtQloSBCaugzgsFkxKWOywMxMxnjKsOIHGHTNcpoIVwTYFbhK4xc6S
	cCGx8O1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbHo-00000008CtI-3kK7;
	Wed, 18 Nov 2026 08:45:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbHn-00000008Csg-0Fdd;
	Wed, 18 Nov 2026 08:44:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C4C0405DF;
	Wed, 18 Nov 2026 08:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C501F000CA;
	Wed, 18 Nov 2026 08:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794991498;
	bh=N1sGH4N/SXZ2PEylzDQSbka+G8mKbWTDfMxnhcO/bOI=;
	h=From:To:Cc:Subject:Date;
	b=dGD7mkybV8hQ9Llilny4jnyX3zQT0Ep2HY++G1vuIMeixLzwoyK9sNKrxLwcrKWQN
	 emllvu4pbdquNod7Hx9FgiIoOU9Zd+4skmIOVpQTSWxXveVf2yN9WeFzDATL5KrhKS
	 MgjoZsAeS5Zxh01cDqv3SR3Wv48Wxwza3jqYT832xXOtKqvbB6GUeFtf2ZrLiSLaUZ
	 /UHzPCif2KRBYmQQvehes3R7fSGJPUFhT0O33gF+7buYD5RzICjcbUwiuBCG/8YKKf
	 QdLfBN6Kj1BMYKCzIpb72hYCwqwixDKEWPhwx3Cs83oya/cvb+Fo04xbCgfNB8ozCq
	 /PcxyBMVA9WCw==
From: Jiri Olsa <jolsa@kernel.org>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>
Cc: bpf@vger.kernel.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Will Deacon <will@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	rtm@csail.mit.edu
Subject: [PATCH bpf 0/2] bpf: Limit writable registers in uprobe context
Date: Wed, 18 Nov 2026 09:44:48 +0100
Message-ID: <20261118084451.12590-1-jolsa@kernel.org>
X-Mailer: git-send-email 2.56.1
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCmEgdXByb2JlIEJQRiBwcm9ncmFtIGNhbiBjdXJyZW50bHkgd3JpdGUgZmllbGRzIGluIHN0
cnVjdCBwdF9yZWdzIHRoYXQKYXJlIGxvYWRlZCBkaXJlY3RseSBieSB0aGUgYXJjaGl0ZWN0dXJl
4oCZcyByZXR1cm4tdG8tdXNlciBwYXRoLiBTb21lIG9mCnRoZXNlIGZpZWxkcyBhcmUgcmVzdHJp
Y3RlZCBieSBwdHJhY2UsIGJ1dCB0aGUgQlBGIHZlcmlmaWVyIGRvZXMgbm90CmFwcGx5IHRoZSBz
YW1lIHJlc3RyaWN0aW9ucy4KClRoaXMgc2VyaWVzIGxpbWl0cyB1cHJvYmUgY29udGV4dCB3cml0
ZXMgdG8gcmVnaXN0ZXJzIHRoYXQgcHRyYWNlIGNhbgpzZXQgdG8gYXJiaXRyYXJ5IHZhbHVlcy4g
SXQgYWRkcyBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgd3JpdGFibGUtcmVnaXN0ZXIKY2hlY2tzIGZv
ciBhcm02NCwgcmlzY3YsIGFuZCB4ODYtNjQ7IG90aGVyIGFyY2hpdGVjdHVyZXMgZGVmYXVsdCB0
bwphbGxvd2luZyBubyB3cml0ZXMuIFJlYWRzIGFyZSB1bmNoYW5nZWQuCgpUaGUgc2Vjb25kIHBh
dGNoIGFkZHMgdmVyaWZpZXIgdGVzdHMgZm9yIHdyaXRhYmxlIGFuZCByZWFkLW9ubHkgcmVnaXN0
ZXJzCm9uIHg4Ni02NCwgYXJtNjQsIGFuZCByaXNjdi4KClBhdGNoIDEgZml4ZXMgdGhlIGlzc3Vl
IHJlcG9ydGVkIGJ5IHJ0bSBhbmQgaXMgbWFya2VkIGZvciBzdGFibGUgY29uc2lkZXJhdGlvbi4K
UGF0Y2ggMiBhZGRzIHRoZSByZWdyZXNzaW9uIHRlc3RzLgoKdGhhbmtzLApqaXJrYQoKCi0tLQpK
aXJpIE9sc2EgKDIpOgogICAgICBicGY6IFJlc3RyaWN0IHVwcm9iZSBjdHggd3JpdGVzIHRvIHRo
ZSByZWdpc3RlcnMgcHRyYWNlIGNhbiBzZXQKICAgICAgc2VsZnRlc3RzL2JwZjogVGVzdCB3aGlj
aCBjdHggcmVnaXN0ZXJzIGEgdXByb2JlIHByb2cgY2FuIHdyaXRlCgogYXJjaC9hcm02NC9rZXJu
ZWwvcHJvYmVzL3Vwcm9iZXMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNiArKwog
YXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL3Vwcm9iZXMuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgNiArKwogYXJjaC94ODYva2VybmVsL3Vwcm9iZXMuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAxNSArKysrCiBpbmNsdWRlL2xpbnV4L3Vwcm9iZXMuaCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA1ICsrCiBrZXJuZWwvZXZl
bnRzL3Vwcm9iZXMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA5
ICsrKwoga2VybmVsL3RyYWNlL2JwZl90cmFjZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAxMCArKy0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9nX3Rl
c3RzL3ZlcmlmaWVyLmMgICAgICAgICAgICAgfCAgIDIgKwogdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvYnBmL3Byb2dzL3ZlcmlmaWVyX3Vwcm9iZV93cml0ZV9jdHguYyB8IDE5NiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiA4IGZpbGVzIGNoYW5nZWQs
IDI0OCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL3ZlcmlmaWVyX3Vwcm9iZV93cml0ZV9jdHgu
YwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
