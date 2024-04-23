Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83901C10F15
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 07:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZJp9Yg4sZ9g9ubRJEGoPbf0l9nIsvZqDqJD1ZU9luh4=; b=jFPs5h5qgnidMd
	pj0p48u+2H+EEmWjyXxl++s5/aKdkK4ZSS604mKPuaHhMnkR5FAsnvAwOOy+zRSpA9rpxLN6silxy
	3KbXA4qjZXZZTDuZAtNSf+swD4V4vnwrF7VTJsLA8Iu/516Xh5OnGZa0SnIMqlhVtZ7KItG/co9WE
	oJIh8clOqJE6B2x1FtJAKmLMIBjb/mn4uFuBafz1Exo9SdrIYuImXv5/1lHMbqY7g00qsdEeUrKsV
	F1kY/gp642tn2glGf1MUbzIbqtmJjXrgnhorABndkhI9f+R5uYKxaiDY78OaNzEU+bjZEsk34tCyj
	s/3LpBnr3jTCm37mMrPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzB0s-0000000GKXm-30Cd;
	Tue, 23 Apr 2024 07:56:26 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzB0Z-0000000GKHu-3KiL;
	Tue, 23 Apr 2024 07:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1713858962;
	bh=D/3OJwMoANYNDnHN43YEhKh/XOzsWgZJBxcvKVpFvHo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z4eTOEAyeZGZRhMLErDlHrOzyIn7K/DlkM60MPZgILl0NsHakg85D489lgcJ2pyps
	 w8ZjrPHlpbLbeknooUuGV8AX44PHoyXa1MFbZ8JyqpCmrdU3drnEDl22/6rS7GAbFk
	 mLBVLjPqI1ce59ORnQdEOqbJ1Zk5A8F74faI2Ijw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 23 Apr 2024 09:54:36 +0200
Subject: [PATCH v3 01/11] stackleak: don't modify ctl_table argument
MIME-Version: 1.0
Message-Id: <20240423-sysctl-const-handler-v3-1-e0beccb836e2@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713858961; l=1205;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=D/3OJwMoANYNDnHN43YEhKh/XOzsWgZJBxcvKVpFvHo=;
 b=1RhNomBbqj6XFaD6ZYOxEHBLV6bfBHp2WGUjkt4XBn/Ez17CpMDHBnau1hMCabUBp0fIJIUhv
 lq3ewsWLz9gCbCEhY4DcLZnRRhb9Y2u6rar0aoKgOs7QrHrAJv1mc4Z
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_005608_177589_6FC99626 
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

SW4gYSBmdXR1cmUgY29tbWl0IHRoZSBwcm9jX2hhbmRsZXJzIHdpbGwgY2hhbmdlIHRvCiJjb25z
dCBzdHJ1Y3QgY3RsX3RhYmxlIi4KQXMgYSBwcmVwYXJhdGlvbiBmb3IgdGhhdCBhZGFwdCB0aGUg
bG9naWMgdG8gd29yayB3aXRoIGEgdGVtcG9yYXJ5CnZhcmlhYmxlLCBzaW1pbGFyIHRvIGhvdyBp
dCBpcyBkb25lIGluIG90aGVyIHBhcnRzIG9mIHRoZSBrZXJuZWwuCgpGaXhlczogOTY0YzlkZmYw
MDkxICgic3RhY2tsZWFrOiBBbGxvdyBydW50aW1lIGRpc2FibGluZyBvZiBrZXJuZWwgc3RhY2sg
ZXJhc2luZyIpCkFja2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KU2ln
bmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNzc2NodWgubmV0PgotLS0K
IGtlcm5lbC9zdGFja2xlYWsuYyB8IDcgKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9rZXJuZWwvc3RhY2tsZWFrLmMg
Yi9rZXJuZWwvc3RhY2tsZWFrLmMKaW5kZXggZDA5OWYzYWZmY2YxLi41NThiOWQ2ZDI4ZDMgMTAw
NjQ0Ci0tLSBhL2tlcm5lbC9zdGFja2xlYWsuYworKysgYi9rZXJuZWwvc3RhY2tsZWFrLmMKQEAg
LTI3LDEwICsyNywxMSBAQCBzdGF0aWMgaW50IHN0YWNrX2VyYXNpbmdfc3lzY3RsKHN0cnVjdCBj
dGxfdGFibGUgKnRhYmxlLCBpbnQgd3JpdGUsCiAJaW50IHJldCA9IDA7CiAJaW50IHN0YXRlID0g
IXN0YXRpY19icmFuY2hfdW5saWtlbHkoJnN0YWNrX2VyYXNpbmdfYnlwYXNzKTsKIAlpbnQgcHJl
dl9zdGF0ZSA9IHN0YXRlOworCXN0cnVjdCBjdGxfdGFibGUgdG1wID0gKnRhYmxlOwogCi0JdGFi
bGUtPmRhdGEgPSAmc3RhdGU7Ci0JdGFibGUtPm1heGxlbiA9IHNpemVvZihpbnQpOwotCXJldCA9
IHByb2NfZG9pbnR2ZWNfbWlubWF4KHRhYmxlLCB3cml0ZSwgYnVmZmVyLCBsZW5wLCBwcG9zKTsK
Kwl0bXAuZGF0YSA9ICZzdGF0ZTsKKwl0bXAubWF4bGVuID0gc2l6ZW9mKGludCk7CisJcmV0ID0g
cHJvY19kb2ludHZlY19taW5tYXgoJnRtcCwgd3JpdGUsIGJ1ZmZlciwgbGVucCwgcHBvcyk7CiAJ
c3RhdGUgPSAhIXN0YXRlOwogCWlmIChyZXQgfHwgIXdyaXRlIHx8IHN0YXRlID09IHByZXZfc3Rh
dGUpCiAJCXJldHVybiByZXQ7CgotLSAKMi40NC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
