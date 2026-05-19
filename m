Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2140BCD4F3C
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 06:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+NtJp/1bI3faNX/48HmOBTcJ9kuUi729SGc0WvT6k0=; b=qF7tfwssfuHi2+
	NOqNphYPIuYn5g8JdXGXBJmwm61HJqi4cGt+sDjBWFStACnRQFjDtXJfUeZ6PgJV/neQiBDnk0FFZ
	7Iw6kjSfVOLyHt0aUdRR70+w024snm0B8MTCvXiuJUIvlmTxd9koj8cv0T+IKweZA+8X6/krLmuB3
	2Q9Z0zjXI40tWmrAQUfZxkfKgnbfKl8/4sR8/U1X0ZAm+3EhHqoEkoVa0uwqt8tUmInuye853z+yZ
	76opMx78LZXwqjHPlIRHUuPI+VEsKUYLb+TJqIc0IZct4GiYCzujtsL1XZ7fujM+F/WYylOuJV+6M
	CLT8YPuWVBmJ9GHq8bBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDuQ-00000000KJG-1Hmp;
	Tue, 19 May 2026 06:26:30 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDuN-00000000KGl-0P1z
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 06:26:28 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779171982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5Vcymrrx/wYafpE4qcTlMPq/+9airhtMGtXJydrAP8=;
	b=Pqbak+374QFcvNAoLuPnmqVFDKHd0gyI8mlGFzw2O5KD7O8NtKn5vkmnZKHRFru1VN3Q5G
	viG/mOs15HLiaioXvMeASjZFa3MyA1/2Ii6ruAMjO8TXXG0/WpiaeeYiOuCXQHFfh+/xcN
	RWUXbs1hYwWwgabiQYRbDFaudErlhRa2OQU/So2HSzSWJVcgRWGVF1xhBstChx2kYRS6JB
	/cMiTg/dMS6F9cBwDjhOEUW7wAOamJsCyAhvkR65Bt5h8HH1snqFgF9xwS8zqzvifE4Bal
	NE8nOD5PGP5JFtQrCpgNzu6gT4Mp/ksGkknDjoMbLfUnl/AKEgSonPuGrKzRSA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779171982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5Vcymrrx/wYafpE4qcTlMPq/+9airhtMGtXJydrAP8=;
	b=ajRMwv7ZSnY+FdPUbi0aBXgNp17Ju2MkWdgcEdr8Vqr6PzzVXAATn1Ky4E5axyK3GaIWYz
	DPDCKyJiEdEecnCQ==
Date: Tue, 19 May 2026 08:26:16 +0200
Subject: [PATCH 2/3] vdso/vsyscall: Gate update_vsyscall() behind
 CONFIG_GENERIC_GETTIMEOFDAY
MIME-Version: 1.0
Message-Id: <20260519-vdso-generic_time_vsyscal-v1-2-5c2a5905d5f5@linutronix.de>
References: <20260519-vdso-generic_time_vsyscal-v1-0-5c2a5905d5f5@linutronix.de>
In-Reply-To: <20260519-vdso-generic_time_vsyscal-v1-0-5c2a5905d5f5@linutronix.de>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779171981; l=926;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=CXalLKKila3WkbwbLF+kN4LXJR3zgviWlsVlMmBUPiA=;
 b=yZ5iimLoTTszP7dX/4Hb8DdZe5b484KMbrG2uhEOqmPgCqnz7mOxjD3e1ANECDSTEqZD/gIvj
 54lgP/eWmr+A37S9IetuBfwwtD5m9Hd8E3lcU6610g7PY4F87PywABW
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_232627_275254_13BD8988 
X-CRM114-Status: UNSURE (   8.49  )
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

Qm90aCB0aGUgY29tcGlsYXRpb24gb2Yga2VybmVsL3RpbWUvdnN5c2NhbGwuYywgd2hpY2ggY29u
dGFpbnMgdGhlIHJlYWwKZGVmaW5pdGlvbiBvZiB1cGRhdGVfdnN5c2NhbGwoKSBhbmQgdGhlIG90
aGVyIHZEU08gZGVmaW5pdGlvbnMgaW4KdGltZWtlZXBlcl9pbnRlcm5hbC5oIHVzZSBDT05GSUdf
R0VORVJJQ19HRVRUSU1FT0ZEQVkgYW5kIG5vdApDT05GSUdfR0VORVJJQ19USU1FX1ZTWVNDQUxM
LgoKQWxpZ24gdGhlIGNvZGUgdG8gdXNlIGEgc2luZ2xlIGtjb25maWcgc3ltYm9sLgoKU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXgu
ZGU+Ci0tLQogaW5jbHVkZS9saW51eC90aW1la2VlcGVyX2ludGVybmFsLmggfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L3RpbWVrZWVwZXJfaW50ZXJuYWwuaCBiL2luY2x1ZGUvbGludXgvdGltZWtl
ZXBlcl9pbnRlcm5hbC5oCmluZGV4IGUzNmQxMWUzM2UwYy4uNDQ4NmRmZDVkMGRlIDEwMDY0NAot
LS0gYS9pbmNsdWRlL2xpbnV4L3RpbWVrZWVwZXJfaW50ZXJuYWwuaAorKysgYi9pbmNsdWRlL2xp
bnV4L3RpbWVrZWVwZXJfaW50ZXJuYWwuaApAQCAtMTkwLDcgKzE5MCw3IEBAIHN0cnVjdCB0aW1l
a2VlcGVyIHsKIAlzMzIJCQl0YWlfb2Zmc2V0OwogfTsKIAotI2lmZGVmIENPTkZJR19HRU5FUklD
X1RJTUVfVlNZU0NBTEwKKyNpZmRlZiBDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZEQVkKIAogZXh0
ZXJuIHZvaWQgdXBkYXRlX3ZzeXNjYWxsKHN0cnVjdCB0aW1la2VlcGVyICp0ayk7CiBleHRlcm4g
dm9pZCB1cGRhdGVfdnN5c2NhbGxfdHoodm9pZCk7CgotLSAKMi41My4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
