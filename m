Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B59C79F8C
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 08:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kkJVJVgSKTABO/dvZH9zaPuactBvrrUolcv8MNUuyPY=; b=hBDr5EQ2EkWTZ6
	8qK/6HdhfKigRqJH87JbYuOLHtcbcw0yzA+FfzwFNjt+e9RMGW5VLi+3LQj7WV2AxnD/c9PjRweH8
	37GdPvHk0srRklyEce6UY7SFUR8OzqEHOLFVKbu40cWNgCqru+TojYefeOlE0c9scQm68u/q8gux0
	Veo9ycJ5XoFtiw/X7VBURpKLS8+BOcXAR1Zk5MPSbldQUKPgu4bDgpJgxMxnTixSrL/rvd3Lml38p
	smHaWSKq6vJHjbHK1gDa1MczKKP8cZDQu7Kez9TTm35p655mUI2dkeHlc+QqJaG9dezKeAMMcDTRC
	7CvXd9P/uz+IQzEfmGyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E21-0000000BAZ2-455O;
	Wed, 09 Sep 2026 08:51:50 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1h-0000000BACp-4480;
	Wed, 09 Sep 2026 08:51:32 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bRBWj4mHSE+gknjapqdIxCDI+b+DaeaenxvpulsS1K8=;
	b=OuwvPY70bFMkqtB5jpFaHm754bhGKnxYjRFqeq/NxUHsAi1S/l6DON/VFVG35d42rblTYT
	q6nPgppRoUf2NTOIeO19SzWG1Dgirc42Owbs6GVYpb3JRlXE0lZTUWmbSpdYa/IMY0+PSQ
	BpBSXtapXIZ3mUdmnI6qABHQMVSFVsywYuuxu2WTq380Uq/f2FD3rHQ+6dci7c5FY4beKt
	spLLl3asON8tW8f3/yj9ohsCwkhsjD3en/x7SdI5zE8pzWRPc5klauC/Draw/Ok6Tk5WgX
	qeDqlDtCTn4HBCSILi54ACQICpWadAvqQ4UBqYOAtZWu1+JDURIbjPxybYHzSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bRBWj4mHSE+gknjapqdIxCDI+b+DaeaenxvpulsS1K8=;
	b=wRCjo4ppx3NZEr7blbkSnFDjUNREZe3LWFNZiakgUojTuDBVUpaNXO4d+N8RwyHc3AJBN/
	Awf+ktdqmalyM9Cg==
Date: Wed, 09 Sep 2026 10:51:24 +0200
Subject: [PATCH 11/15] arm64/vdso: Delete asm/vdso/vsyscall.h inclusions
MIME-Version: 1.0
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-11-63ae856cc659@linutronix.de>
References: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
In-Reply-To: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=1045;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=gLJEWgigGyJ7XawvovjYyQOfwIjsfDH42RIEWGgskXM=;
 b=dXObFU3KxzH9K1ul1RZRBGrqGW/wDZaQe1dxCAARQqeFJPUhpOY3RLhbeefuEg4MBu550yA8g
 Kiuma1H8fEGDwbk+wuxsy/poBd6Gxu2/vVk7ernHzK4zAYbhLyYb6VM
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_015130_172139_EF8EB0E5 
X-CRM114-Status: UNSURE (   6.55  )
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

VGhlIGluY2x1c2lvbnMgYXJlIHVubmVjZXNzYXJ5LCByZW1vdmUgdGhlbS4KClNpZ25lZC1vZmYt
Ynk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgot
LS0KIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vdmRzby9nZXRyYW5kb20uaCB8IDEgLQogYXJjaC9h
cm02NC9rZXJuZWwvdmRzby92ZHNvLmxkcy5TICAgICAgIHwgMSAtCiAyIGZpbGVzIGNoYW5nZWQs
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS92ZHNv
L2dldHJhbmRvbS5oIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS92ZHNvL2dldHJhbmRvbS5oCmlu
ZGV4IGRhMWQ1OGJiZmFiZS4uZDliOTEwNGQ0ZWExIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2lu
Y2x1ZGUvYXNtL3Zkc28vZ2V0cmFuZG9tLmgKKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS92
ZHNvL2dldHJhbmRvbS5oCkBAIC02LDcgKzYsNiBAQAogI2lmbmRlZiBfX0FTU0VNQkxFUl9fCiAK
ICNpbmNsdWRlIDxhc20vdW5pc3RkLmg+Ci0jaW5jbHVkZSA8YXNtL3Zkc28vdnN5c2NhbGwuaD4K
ICNpbmNsdWRlIDx2ZHNvL2RhdGFwYWdlLmg+CiAKIC8qKgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9rZXJuZWwvdmRzby92ZHNvLmxkcy5TIGIvYXJjaC9hcm02NC9rZXJuZWwvdmRzby92ZHNvLmxk
cy5TCmluZGV4IDUyMzE0YmUyOTE5MS4uNjMzNGNhMGE3NjczIDEwMDY0NAotLS0gYS9hcmNoL2Fy
bTY0L2tlcm5lbC92ZHNvL3Zkc28ubGRzLlMKKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvdmRzby92
ZHNvLmxkcy5TCkBAIC0xMSw3ICsxMSw2IEBACiAjaW5jbHVkZSA8bGludXgvY29uc3QuaD4KICNp
bmNsdWRlIDxhc20vcGFnZS5oPgogI2luY2x1ZGUgPGFzbS92ZHNvLmg+Ci0jaW5jbHVkZSA8YXNt
L3Zkc28vdnN5c2NhbGwuaD4KICNpbmNsdWRlIDxhc20tZ2VuZXJpYy92bWxpbnV4Lmxkcy5oPgog
I2luY2x1ZGUgPHZkc28vZGF0YXBhZ2UuaD4KIAoKLS0gCjIuNTUuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
