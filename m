Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422B8C79FB9
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 08:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=isBumkFmaM1rJR/0c0r96OANV2VO5QzKg7cqPYhhkwQ=; b=ZMetJAebJMOa77
	HyPW3bCWnysixMXHFei9RyJ7buzZeTPOjmT6DHr/GFyMCwhw4B2PHD+DzkyT2OPqOo2rpu7Z/ZAKx
	hBL4fKvo5Ey6PFp28v2eTBUyK085mw8gAo8rh28zAbEOB2fHa+afW8XMxDZRcB/rmeO60y7k9P3EE
	8BNMF0UK6TdI9hHLkkKOe36YpGfKgJu5BWSAd/1LXXFusknz5WnFu5JPv/Y8HSur+Ytupl2GnvYLZ
	0gHSkHzGaSRDQKfmOJN56QyHp8wXGtVIOeuLvT0efjg5fAKDnuzvjKYDQlWAiZelD69JUmSDXAk2E
	14XZS4eHNYFMaDl++lAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1w-0000000BAPh-1MVL;
	Wed, 09 Sep 2026 08:51:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1g-0000000BACV-3cz4;
	Wed, 09 Sep 2026 08:51:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=p8ISCnsd1kBgxpKDcNux5gAnw7Y6k/Yo3uUbNdp9+qI=; b=bZ4dr6/HoJObWcZw41kOVJnrKl
	bMdg8/otBxn2fkZZ708gWEnCzYmutkCITZFucXrGpDTnRWBZlNXVl1VnRw9Oi/Q9Nt68jxc+faMMD
	uzuknLBOCe8Q7OM4T9a7cGe9AWq53RDpvYPmTVUFLhGdamvyvqfyKDIeUtHKyqXAWuHU1qZj4vd2s
	0omtPFnFeBDMVk3MJLZEIW7WLQGDBNY7BkU23GgFsRtD4I07ipWROdjlW1U29jXrVMFSMr4nG7pqG
	VOXBBx7Yddj7jCl8N0HnYJfAqzVFnE95b/br2SX1x3bQ8XYLNxmnBctHxGQqLm5UfGF8rOdXFY9a+
	ZpOLFeiA==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4E1d-00000000wH8-3qTI;
	Wed, 09 Sep 2026 08:51:27 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p8ISCnsd1kBgxpKDcNux5gAnw7Y6k/Yo3uUbNdp9+qI=;
	b=O5zzVmOyrKpaHp2u4bUY98lgwCvVarLkNgeAPPVX89i5JBg3rHp4+Y8F9L4P7sCCu7APVT
	Al93fxOcU0nkxzrDGMp9ojUNo/XMGidIJmj5ushFZTsVzhhH2/4847wUgewnz4odH33RCG
	rYEV6IXxTfCoYWNjLI1njWpXKiTQzh4hlJ2nAfWSRVlSvIRdZ8jZlx0oLL8v+H9qcVdvTu
	VCEGXnt6KMhztEQTNXeBUDeApxeuzzOKfXXfabG23aFg593biDM8h5sQ9dSVqWDjHQtLqp
	9TYPesEC1SSI+QAvRjLvNdyJHhqsK2SHpCmurN0Bhvkm5WRkaGF5W+rYh+i8Fg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p8ISCnsd1kBgxpKDcNux5gAnw7Y6k/Yo3uUbNdp9+qI=;
	b=9huAc0xk9QcC4SgqamXcnykpmbUho6tKXuFLvtEqd+RfqJ7UdPuClzkoIyvHwlR5apQHEl
	EoLJQecYy/nKN7DQ==
Date: Wed, 09 Sep 2026 10:51:17 +0200
Subject: [PATCH 04/15] vdso/vsyscall: Define fallback time synchronization
 functions in vsyscall.c
MIME-Version: 1.0
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-4-63ae856cc659@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=1827;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=sUPCnKCUGSNrK6kUHNVPQIEZiXKtWEAStKPxMYG7MFQ=;
 b=lrpRL87RH6Jns+QOQuU8vG+UhFyds9BwYL/rt0fjZCb0s1Oj7j4AIKDMavYVvjgkUDUjPhvEc
 T9kztup5hZYCOHnR9RnzqXUPyVZQLUeJCQxyJrgUgGCsXxKa0apJ8Bi
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_095126_267885_56106070 
X-CRM114-Status: UNSURE (   6.98  )
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

X19hcmNoX3VwZGF0ZV92ZHNvX2Nsb2NrKCkgYW5kIF9fYXJjaF9zeW5jX3Zkc29fdGltZV9kYXRh
KCkgYXJlIG9ubHkKdXNlZCBpbiB2c3lzY2FsbC5jLiB2c3lzY2FsbC5oIGhhcyBiZWNvbWUgYSBk
dW1waW5nIGdyb3VuZCBmb3IgZGlmZmVyZW50CmtpbmRzIG9mIGZhbGxiYWNrcy4KCk1vdmUgdGhl
IGZhbGxiYWNrIGZ1bmN0aW9uIGRlZmluaXRpb25zIGludG8gdnN5c2NhbGwuYy4KClNpZ25lZC1v
ZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRl
PgotLS0KIGluY2x1ZGUvYXNtLWdlbmVyaWMvdmRzby92c3lzY2FsbC5oIHwgMTEgLS0tLS0tLS0t
LS0KIGtlcm5lbC90aW1lL3ZzeXNjYWxsLmMgICAgICAgICAgICAgIHwgMTIgKysrKysrKysrKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvdmRzby92c3lzY2FsbC5oIGIvaW5jbHVkZS9h
c20tZ2VuZXJpYy92ZHNvL3ZzeXNjYWxsLmgKaW5kZXggY2RmN2IzOWNkMzQ5Li5jZmI3NDBlODJj
YjUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvdmRzby92c3lzY2FsbC5oCisrKyBi
L2luY2x1ZGUvYXNtLWdlbmVyaWMvdmRzby92c3lzY2FsbC5oCkBAIC00LDE3ICs0LDYgQEAKIAog
I2lmbmRlZiBfX0FTU0VNQkxFUl9fCiAKLSNpZm5kZWYgX19hcmNoX3VwZGF0ZV92ZHNvX2Nsb2Nr
Ci1zdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgX19hcmNoX3VwZGF0ZV92ZHNvX2Nsb2NrKHN0
cnVjdCB2ZHNvX2Nsb2NrICp2YykKLXsKLX0KLSNlbmRpZiAvKiBfX2FyY2hfdXBkYXRlX3Zkc29f
Y2xvY2sgKi8KLQotI2lmbmRlZiBfX2FyY2hfc3luY192ZHNvX3RpbWVfZGF0YQotc3RhdGljIF9f
YWx3YXlzX2lubGluZSB2b2lkIF9fYXJjaF9zeW5jX3Zkc29fdGltZV9kYXRhKHN0cnVjdCB2ZHNv
X3RpbWVfZGF0YSAqdmRhdGEpCi17Ci19Ci0jZW5kaWYgLyogX19hcmNoX3N5bmNfdmRzb190aW1l
X2RhdGEgKi8KIAogI2VuZGlmIC8qICFfX0FTU0VNQkxFUl9fICovCiAKZGlmZiAtLWdpdCBhL2tl
cm5lbC90aW1lL3ZzeXNjYWxsLmMgYi9rZXJuZWwvdGltZS92c3lzY2FsbC5jCmluZGV4IDEyZTIw
NWQ4NmU3Zi4uMTkzYTAyZDc4YjExIDEwMDY0NAotLS0gYS9rZXJuZWwvdGltZS92c3lzY2FsbC5j
CisrKyBiL2tlcm5lbC90aW1lL3ZzeXNjYWxsLmMKQEAgLTE2LDYgKzE2LDE4IEBACiAKICNpbmNs
dWRlICJ0aW1la2VlcGluZ19pbnRlcm5hbC5oIgogCisjaWZuZGVmIF9fYXJjaF91cGRhdGVfdmRz
b19jbG9jaworc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIF9fYXJjaF91cGRhdGVfdmRzb19j
bG9jayhzdHJ1Y3QgdmRzb19jbG9jayAqdmMpCit7Cit9CisjZW5kaWYgLyogX19hcmNoX3VwZGF0
ZV92ZHNvX2Nsb2NrICovCisKKyNpZm5kZWYgX19hcmNoX3N5bmNfdmRzb190aW1lX2RhdGEKK3N0
YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBfX2FyY2hfc3luY192ZHNvX3RpbWVfZGF0YShzdHJ1
Y3QgdmRzb190aW1lX2RhdGEgKnZkYXRhKQoreworfQorI2VuZGlmIC8qIF9fYXJjaF9zeW5jX3Zk
c29fdGltZV9kYXRhICovCisKIHN0YXRpYyBpbmxpbmUgdm9pZCBmaWxsX2Nsb2NrX2NvbmZpZ3Vy
YXRpb24oc3RydWN0IHZkc29fY2xvY2sgKnZjLCBjb25zdCBzdHJ1Y3QgdGtfcmVhZF9iYXNlICpi
YXNlKQogewogCXZjLT5jeWNsZV9sYXN0CT0gYmFzZS0+Y3ljbGVfbGFzdDsKCi0tIAoyLjU1LjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
