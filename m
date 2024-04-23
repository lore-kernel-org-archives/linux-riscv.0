Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5C0C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 07:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xnZrlTC/rJZCTNCQbtv7BRRMiSxjEBUkOdZgp0HPeU8=; b=EDc1NwmTuO7Z9v
	L0HL+LBVDuliAuUzEod+2WkzzpLufA6k4H/mOoiJwN2v+IuEXyBhdVHJ6HHpM3GVcgPtyy5SGrARv
	Q5VjrKtAuB/WBd2fjd6Autl4oj+xx8NCvLlfOUPid8fBHgBVBImmvzVs3Wj6SK9QVopztYulyA5IY
	1kL3mMY4QjNGBFUl/Djc9T/pmygT43MgR+kjS8v8I5FqjWLwA5ImTnW4nV9Xqh9JN5habkiZFaI8b
	lDiWe2g/MgDH0s8PRIiGL11ZDFJ0c96K3XKTdDTCZkFCx4oHtHKAom+j9c21VPl8+gsRYn9gidvr7
	gV2Qwhkjz0zxoZq2PTlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzB1x-0000000GLQz-1Zee;
	Tue, 23 Apr 2024 07:57:33 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzB0e-0000000GKKE-2RZs;
	Tue, 23 Apr 2024 07:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1713858962;
	bh=m+K+pCOcUIKDJXVlXdIjxkNCOOD+02kNnAffkd4pv3g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uTNAVwQOIrRyal1El9mD80wWXIn5+WwLLWjNLDCcaegSzdSC84+iXuF/GhKNCzZey
	 dqHH7jcVgd6z8KAGRhgZtLRswyOrd22fZMdq605pjyZEWmoyB7lxnYP/oYvWQiq6lf
	 wEKqJImxcbL8ej1t87j4xoAeM5vL0mYBMuWiF53E=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 23 Apr 2024 09:54:43 +0200
Subject: [PATCH v3 08/11] ipv6/ndisc: constify ctl_table arguments of
 utility function
MIME-Version: 1.0
Message-Id: <20240423-sysctl-const-handler-v3-8-e0beccb836e2@weissschuh.net>
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
In-Reply-To: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Joel Granados <j.granados@samsung.com>, Kees Cook <keescook@chromium.org>
Cc: Eric Dumazet <edumazet@google.com>, Dave Chinner <david@fromorbit.com>, 
 linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-xfs@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, netfilter-devel@vger.kernel.org, 
 coreteam@netfilter.org, kexec@lists.infradead.org, 
 linux-hardening@vger.kernel.org, bridge@lists.linux.dev, 
 lvs-devel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 rds-devel@oss.oracle.com, linux-sctp@vger.kernel.org, 
 linux-nfs@vger.kernel.org, apparmor@lists.ubuntu.com, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713858961; l=778;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=m+K+pCOcUIKDJXVlXdIjxkNCOOD+02kNnAffkd4pv3g=;
 b=Q+YktwnSI6kCGsBTIybu9xGGD/NXt4eNC5iasTFmeHPKR3qFek7DAHVOAL6ODtVWxHz0IlTDl
 mOjC9oMpS6vAF/sGF+2/gRvvMn2SvCRtOwEY6l6YCWFhCxPgYjqZVDv
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_005612_902155_F82C646E 
X-CRM114-Status: UNSURE (   8.13  )
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

SW4gYSBmdXR1cmUgY29tbWl0IHRoZSBwcm9jX2hhbmRsZXJzIHRoZW1zZWx2ZXMgd2lsbCBjaGFu
Z2UgdG8KImNvbnN0IHN0cnVjdCBjdGxfdGFibGUiLiBBcyBhIHByZXBhcmF0aW9uIGZvciB0aGF0
IGFkYXB0IHRoZSBpbnRlcm5hbApoZWxwZXIuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59z
Y2h1aCA8bGludXhAd2Vpc3NzY2h1aC5uZXQ+Ci0tLQogbmV0L2lwdjYvbmRpc2MuYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL25ldC9pcHY2L25kaXNjLmMgYi9uZXQvaXB2Ni9uZGlzYy5jCmluZGV4IGFlMTM0NjM0YzMy
My4uOTQ1ZDVmNWNhMDM5IDEwMDY0NAotLS0gYS9uZXQvaXB2Ni9uZGlzYy5jCisrKyBiL25ldC9p
cHY2L25kaXNjLmMKQEAgLTE5MzYsNyArMTkzNiw3IEBAIHN0YXRpYyBzdHJ1Y3Qgbm90aWZpZXJf
YmxvY2sgbmRpc2NfbmV0ZGV2X25vdGlmaWVyID0gewogfTsKIAogI2lmZGVmIENPTkZJR19TWVND
VEwKLXN0YXRpYyB2b2lkIG5kaXNjX3dhcm5fZGVwcmVjYXRlZF9zeXNjdGwoc3RydWN0IGN0bF90
YWJsZSAqY3RsLAorc3RhdGljIHZvaWQgbmRpc2Nfd2Fybl9kZXByZWNhdGVkX3N5c2N0bChjb25z
dCBzdHJ1Y3QgY3RsX3RhYmxlICpjdGwsCiAJCQkJCSBjb25zdCBjaGFyICpmdW5jLCBjb25zdCBj
aGFyICpkZXZfbmFtZSkKIHsKIAlzdGF0aWMgY2hhciB3YXJuY29tbVtUQVNLX0NPTU1fTEVOXTsK
Ci0tIAoyLjQ0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
