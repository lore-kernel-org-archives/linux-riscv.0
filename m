Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4FFC79F8C
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 08:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pd+lQrz8crqzdIKvsnHPawIxGkBhMqfvZxHa0vvze+I=; b=BiDL0lINkjwRhk
	S1V2hKmyJ5wNvYgGCqZqx+cRMdvtIql59uU9S21li9Cypxa6gnkhQnlQ0pL9iqw1zylcB5nwaArUV
	JVQoQkefA5QygtKUWuEnOhBeRWLGWXa8rI/Veo0gnnLr3n6Udd12DB2bH1gYzOvGVFoNeWQBuO+BC
	EPl0T9V+yH7Cy7XaVLeLfr7HZQGNX2MIGiSqxzOe6tp9dhnYLLGshGMbNf3BEE1zS1YudGOguHH6y
	9m3I7KH6y5k408Jcmp5uMHtz8BnT1hCPZmTaWX7v3PM8e6vvEdOh++qyFq6ZNSyOTb5uqFBoXiURj
	DDhPs3xKUSYBFZCT7BnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1h-0000000BADz-2eop;
	Wed, 09 Sep 2026 08:51:29 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1d-0000000BAAa-2yt5;
	Wed, 09 Sep 2026 08:51:28 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XzQOMxzxshTh4wmqEu29Gu2VPX+xEoLqk1yFbDrb8uM=;
	b=X09Yejo/JqqKtXCBERrNnRAYA35ImQKVCAF+aSCtG2F6PKrzCaElWrLHCAxGtzr7vC7OOu
	w0HUGAq/x4Pq3gNZtO6+iPsEvOwxvPbU1eDFXpf/ovbFERZB00bGkzZGvYmYJW9ldJ+TqS
	QLNVMEHKXIz5pnTCub3fdLep8HnNx+Lwy8VwNv++2kJBMAasTB9ZIDMciuBfKiHjHkPOx5
	tC3004wXfoTPdEjwfIlJE/qyREnrsnkGz8wj1Jtp35FtBZ281kpRX+N5IgSTM4LnIdUKJV
	xZiars5kzubb+8wkquYE/jKHmF25JTco2ilJeYOEa4VaT6+D19ljJZA18zrpnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XzQOMxzxshTh4wmqEu29Gu2VPX+xEoLqk1yFbDrb8uM=;
	b=cYA/s1bWs/UKgyEP7Ti0e2vw1WhICfuqGpLaEZeMxwrx7+M/smOGJv8avR0BVCzMnxs/GQ
	tXZzBptfzYAlvhDA==
Date: Wed, 09 Sep 2026 10:51:15 +0200
Subject: [PATCH 02/15] vdso/gettimeofday: Define fallback
 __arch_get_vdso_u_time_data() in gettimeofday.c
MIME-Version: 1.0
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-2-63ae856cc659@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=1583;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=5Ojd0VZyBuWlT1Vlm9OCcvjNe/c3y4B8B7OiZI04IfU=;
 b=VGAO2rm1dloGKPPn6fG5mfwo6sz2glPNKl5GoEyuD+WCr61o80au+loFA+6grZFSc94CCx300
 8Gh0V0u0lq7CxoWtxOpnah08gZTdMGr+JgfY05geFzjXERrVbBldpxr
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_015125_981948_FE52150F 
X-CRM114-Status: UNSURE (   6.72  )
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

X19hcmNoX2dldF92ZHNvX3VfdGltZV9kYXRhKCkgaXMgb25seSB1c2VkIGluIGdldHRpbWVvZmRh
eS5jLiB2c3lzY2FsbC5oCmhhcyBiZWNvbWUgYSBkdW1waW5nIGdyb3VuZCBmb3IgZGlmZmVyZW50
IGtpbmRzIG9mIGZhbGxiYWNrcy4KCk1vdmUgdGhlIGZhbGxiYWNrIGZ1bmN0aW9uIGRlZmluaXRp
b24gaW50byBnZXR0aW1lb2ZkYXkuYywKc2ltaWxhciB0byBvdGhlciBmYWxsYmFja3MuCgpTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25p
eC5kZT4KLS0tCiBpbmNsdWRlL2FzbS1nZW5lcmljL3Zkc28vdnN5c2NhbGwuaCB8IDcgLS0tLS0t
LQogbGliL3Zkc28vZ2V0dGltZW9mZGF5LmMgICAgICAgICAgICAgfCA3ICsrKysrKysKIDIgZmls
ZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2luY2x1ZGUvYXNtLWdlbmVyaWMvdmRzby92c3lzY2FsbC5oIGIvaW5jbHVkZS9hc20tZ2VuZXJp
Yy92ZHNvL3ZzeXNjYWxsLmgKaW5kZXggYTZiMDNjZmJhMGUyLi5mZTEyZmIxZmI0NDIgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvdmRzby92c3lzY2FsbC5oCisrKyBiL2luY2x1ZGUv
YXNtLWdlbmVyaWMvdmRzby92c3lzY2FsbC5oCkBAIC00LDEzICs0LDYgQEAKIAogI2lmbmRlZiBf
X0FTU0VNQkxFUl9fCiAKLSNpZm5kZWYgX19hcmNoX2dldF92ZHNvX3VfdGltZV9kYXRhCi1zdGF0
aWMgX19hbHdheXNfaW5saW5lIGNvbnN0IHN0cnVjdCB2ZHNvX3RpbWVfZGF0YSAqX19hcmNoX2dl
dF92ZHNvX3VfdGltZV9kYXRhKHZvaWQpCi17Ci0JcmV0dXJuICZ2ZHNvX3VfdGltZV9kYXRhOwot
fQotI2VuZGlmCi0KICNpZm5kZWYgX19hcmNoX2dldF92ZHNvX3Vfcm5nX2RhdGEKIHN0YXRpYyBf
X2Fsd2F5c19pbmxpbmUgY29uc3Qgc3RydWN0IHZkc29fcm5nX2RhdGEgKl9fYXJjaF9nZXRfdmRz
b191X3JuZ19kYXRhKHZvaWQpCiB7CmRpZmYgLS1naXQgYS9saWIvdmRzby9nZXR0aW1lb2ZkYXku
YyBiL2xpYi92ZHNvL2dldHRpbWVvZmRheS5jCmluZGV4IGY3YTU5MWFiYTU5Zi4uYjg2N2MyMzAx
ZDVjIDEwMDY0NAotLS0gYS9saWIvdmRzby9nZXR0aW1lb2ZkYXkuYworKysgYi9saWIvdmRzby9n
ZXR0aW1lb2ZkYXkuYwpAQCAtOTMsNiArOTMsMTMgQEAgc3RhdGljIGlubGluZSBib29sIHZkc29f
Y3ljbGVzX29rKHU2NCBjeWNsZXMpCiB9CiAjZW5kaWYKIAorI2lmbmRlZiBfX2FyY2hfZ2V0X3Zk
c29fdV90aW1lX2RhdGEKK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgY29uc3Qgc3RydWN0IHZkc29f
dGltZV9kYXRhICpfX2FyY2hfZ2V0X3Zkc29fdV90aW1lX2RhdGEodm9pZCkKK3sKKwlyZXR1cm4g
JnZkc29fdV90aW1lX2RhdGE7Cit9CisjZW5kaWYKKwogc3RhdGljIF9fYWx3YXlzX2lubGluZSBi
b29sIHZkc29fY2xvY2tpZF92YWxpZChjbG9ja2lkX3QgY2xvY2spCiB7CiAJLyogQ2hlY2sgZm9y
IG5lZ2F0aXZlIHZhbHVlcyBvciBpbnZhbGlkIGNsb2NrcyAqLwoKLS0gCjIuNTUuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
