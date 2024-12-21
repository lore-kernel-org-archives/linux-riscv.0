Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2451E7718C
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Dec 2024 14:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nbvm++QOn8JdYkKaJRQ0ciICX0fNuvAIPVs2WJMphjE=; b=WSZkF0XNMhXsCC
	nvpic0oVzjRDi7IY/mJEacbGBgk/Iw1MPWlKH/6gBJyyngO0ZEqzGEU7/qhN0R8IPLVLHovdOTorp
	oOUKrjrRl8y7A5Im/hzMc4QLQZBiQIbnKregEwkdS11o9Pey6wZpuVeKcbPry1TNnhTw9zzbfb3kY
	sxO90sto7HbxNoDvXtxQ4ovw9ofOCkkTYhxDzdOGeZOHkLnyaXjdm7dv/p7xrIzMq8HOpGJXrviax
	RIwSmLH6I3qNXDhiH8G93aCSQ36Cba5NqL98PHoLKjAT/9Grz9z4pbGKsiZCfTpYrv96PnmdmAW18
	Z8SQweQCeryMbaFFRK7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP0ii-000000074mS-38AT;
	Sat, 21 Dec 2024 14:44:44 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP0ic-000000074gO-3Tfm
	for linux-riscv@lists.infradead.org;
	Sat, 21 Dec 2024 14:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734792272;
	bh=8sEohOXFcgWEpRoGJM9TirpXvqQhi1CABSHHAxol18U=;
	h=From:Subject:Date:To:Cc:From;
	b=st0i8CzQElWUfNAztv59168LO+QexAAWVLoEFuAORTprvyKW/JxjN1lfKrEgqyODO
	 G9YmkBAQN/AzbrZpnWGhp3EHXtmMhqhTzneIkULwuKr1hnFbvbeQYmEY0kRNKI6dba
	 RPyvvmKNOKJbs0RUnUj6OiaSBgUD0GZqHpctFjdM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/6] selftests/nolibc: wire up riscv32
Date: Sat, 21 Dec 2024 15:44:27 +0100
Message-Id: <20241221-nolibc-rv32-v1-0-d9ef6dab7c63@weissschuh.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEvUZmcC/x3MQQqAIBBA0avIrBNydJFdJVqUjTUQGgoSiHdPW
 r7F/xUyJaYMs6iQqHDmGDrUIMBdWzhJ8tENOKJRqKwM8ebdyVQ0Suf9tGlC1NZAL55Ent//tqy
 tfSxJNm1dAAAA
X-Change-ID: 20241219-nolibc-rv32-cff8a3e22394
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Zhangjin Wu <falcon@tinylab.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734792271; l=1009;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=8sEohOXFcgWEpRoGJM9TirpXvqQhi1CABSHHAxol18U=;
 b=74mc5mwJR9/bsqPQMEmWFdGt6ROOaaFrQQ6Ams9v3xE+uI1rX5t5F1eQwzlb3rKt5dMrkw7i9
 I4H+2gV/jkeDfKEWPfY+SCU64GiUfK/XMF34pW2QP1Q/d1xTpvtKgZv
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_064439_011563_2557DCE6 
X-CRM114-Status: UNSURE (   5.02  )
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

Tm9saWJjIGhhcyBzdXBwb3J0IGZvciByaXNjdjMyLiBCdXQgdGhlIHRlc3RzdWl0ZSBkaWQgbm90
IGFsbG93IHRvIHRlc3QKaXQgc28gZmFyLiBBZGQgYSB0ZXN0IGNvbmZpZ3VyYXRpb24uCgpTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8bGludXhAd2Vpc3NzY2h1aC5uZXQ+Ci0tLQpU
aG9tYXMgV2Vpw59zY2h1aCAoNik6CiAgICAgIHRvb2xzL25vbGliYzogYWRkIHN1cHBvcnQgZm9y
IHdhaXRpZCgpCiAgICAgIHNlbGZ0ZXN0cy9ub2xpYmM6IHVzZSB3YWl0aWQoKSBvdmVyIHdhaXRw
aWQoKQogICAgICBzZWxmdGVzdHMvbm9saWJjOiB1c2UgYSBwaXBlIHRvIGluIHZmcHJpbnRmIHRl
c3RzCiAgICAgIHNlbGZ0ZXN0cy9ub2xpYmM6IHNraXAgdGVzdHMgZm9yIHVuaW1wbGVtZW50ZWQg
c3lzY2FsbHMKICAgICAgc2VsZnRlc3RzL25vbGliYzogcmVuYW1lIHJpc2N2IHRvIHJpc2N2NjQK
ICAgICAgc2VsZnRlc3RzL25vbGliYzogYWRkIGNvbmZpZ3VyYXRpb25zIGZvciByaXNjdjMyCgog
dG9vbHMvaW5jbHVkZS9ub2xpYmMvc3lzLmggICAgICAgICAgICAgICAgICAgfCAxOCArKysrKysr
KysrKysKIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9NYWtlZmlsZSAgICAgIHwgMTEg
KysrKysrKwogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0LmMgfCA0
NCArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9u
b2xpYmMvcnVuLXRlc3RzLnNoICB8ICAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDU2IGluc2VydGlv
bnMoKyksIDE5IGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IDQ5OTU1MTIwMWI1ZjRmZDNj
MDYxOGEzZTk1ZTNkMGQxNWVhMThmMzEKY2hhbmdlLWlkOiAyMDI0MTIxOS1ub2xpYmMtcnYzMi1j
ZmY4YTNlMjIzOTQKCkJlc3QgcmVnYXJkcywKLS0gClRob21hcyBXZWnDn3NjaHVoIDxsaW51eEB3
ZWlzc3NjaHVoLm5ldD4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
