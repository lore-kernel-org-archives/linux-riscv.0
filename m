Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E96DC56205
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 15:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Md1xBvF8si6C0KuVcDjaXmJrI06hOBxlOvoiCFpVyCM=; b=2KC9T0H8k9Kup+
	ED40n2aiD9jVhr7ajv0Cvq/GN+6CJc/TliXQYrnjlFJynJzk316FTk2zL3SPjvZE7dzQFHazimH+4
	Mloj4FumqUHVvzykzlQ8zSATMxpXGkYvf6aoGfa0XROQVZiNWtY0YfFzrqwGKPYyxxEvTSPjPbVkK
	wIxc5O2buJDUBGzox1RdWu4c5gezVfIXbNxsq63eYMZp+ER1olhvabOzuDpyFkd1OtezYrS4yBpuo
	RkM5eYVDOcSes+WFg2rBXfu80sMP+tf1vHQXy75ahwnfO4F5WzSmO9n4U1+Sd0uValMwVsD8EMLTD
	k+qABhvq0cNsm9sJNMAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrze9-000000063P3-2nci;
	Thu, 06 Aug 2026 15:04:37 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrze7-000000063Oa-1JyN;
	Thu, 06 Aug 2026 15:04:36 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786028672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5vYlEkYi9o51c1f/TTbOEXeh8TYKvmeJYU6kzjXqK0=;
	b=QkUwySVI4FE+trCJg6qqAkkIQpJKeDzsTJkM/04av9tzmUFPPSCmB6Ebxp9gItEVMxIZo7
	621j1qmWIS+Ukkt9qendBqtWOfCcmzbHMzzriK8LKxEb8evczh3qYgWgjtbH+5JG6v8rDS
	JYXgmicXB/3zra9Hsvthh/KNO3HDZU+kUbGSoMOWwmZNnPinX7rILW7a6RIUtk6mqErhnq
	gFjycxfe/58mLJ6vnevJy8WZKcpIO6PBhz/aNCt9XKTNEf0fcnyGO/hv11Z9PciRHy0pcr
	mflWHyF546ffgzA1P0Ag7VpSJUG1dTyJEh6ZzmaSKabhF7Svuytu1ZhaeFvEZw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786028672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5vYlEkYi9o51c1f/TTbOEXeh8TYKvmeJYU6kzjXqK0=;
	b=6JENUJOs/buVuvrTF2FobfkdDbOVwiZPmC5wy2FFshSHbQAnTyfRR+bza8a2IMq3uwTOoF
	XicK9QKeAMCztPDQ==
To: Charlie Jenkins <thecharlesjenkins@gmail.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Atish Patra
 <atish.patra@linux.dev>, Conor Dooley <conor@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah
 Khan <shuah@kernel.org>, Radim =?utf-8?B?S3LEjW3DocWZ?=
 <radim.krcmar@oss.qualcomm.com>,
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Charlie Jenkins
 <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH v3 09/17] riscv: kvm: Use generated instruction headers
 for csr code
In-Reply-To: <20260707-riscv_insn_table-v3-9-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
 <20260707-riscv_insn_table-v3-9-3f8e5f75ba97@gmail.com>
Date: Thu, 06 Aug 2026 17:04:32 +0200
Message-ID: <87fr0rl27z.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_080435_489371_CE126481 
X-CRM114-Status: UNSURE (   2.89  )
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

Q2hhcmxpZSBKZW5raW5zIDx0aGVjaGFybGVzamVua2luc0BnbWFpbC5jb20+IHdyaXRlczoKPiAr
CQl3cl9tYXNrID0gR0VUX1JFRyhyaXNjdl9pbnNuX2NzcnJ3aV9leHRyYWN0X2ltbShpbnNuKSk7
CgogIENDICAgICAgYXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNuLm8KYXJjaC9yaXNjdi9rdm0vdmNw
dV9pbnNuLmM6IEluIGZ1bmN0aW9uIOKAmGNzcl9pbnNu4oCZOgphcmNoL3Jpc2N2L2t2bS92Y3B1
X2luc24uYzoxODY6Mjc6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDi
gJhHRVRfUkVH4oCZOyBkaWQgeW91IG1lYW4g4oCYRVRfUkVM4oCZPyBbLVdpbXBsaWNpdC1mdW5j
dGlvbi1kZWNsYXJhdGlvbl0KICAxODYgfCAgICAgICAgICAgICAgICAgd3JfbWFzayA9IEdFVF9S
RUcocmlzY3ZfaW5zbl9jc3Jyd2lfZXh0cmFjdF9pbW0oaW5zbikpOwogICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn5+fgogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgRVRfUkVMCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
