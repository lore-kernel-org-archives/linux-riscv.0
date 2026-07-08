Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEB2C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 20:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cr1DHwSsAWmX3jN7dJdhW19+IxBqhXtf6eqgjLkrk4o=; b=CCxvPdJXb8ltC1
	gIB6Eb9mV5HrBEaw8J/nLdqGvtk8XlqRq61EVo+OkCN1pesQada25YoibvZlRZ2STbVJxTo3u72WV
	QygTRB3i/Ni+BTlwE2XQGrZh3qvstzw+U2ojSXItIU5mT8cGq7U04lt6NpfYOuI44x3aU5ZBhyF1V
	hg3CdcB85NCtU54H5hYrFWnPehLhtpsId8A3foqslAG7qaLe4u5aV6Q/sis3x7mhKEpDqfCj6TP33
	u8gaYt3FjO464KSMgFupjCtjIWVAr+4I/ULdPzYkbWyoipqcj3WLw+EuKd6+bjvPf1YQ//ApzIXXC
	F8v/S3wfLARjChu/3RqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZAI-00000000ODi-0xDG;
	Wed, 08 Jul 2026 20:46:42 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZAF-00000000ODA-1d8V
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 20:46:40 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783543596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BeW1+Lt2glRO2nTqrw43wBscOwCulbV/mgu0vr5CnuU=;
	b=a1Sv7OnDaEKCbTte5CK6LT5lDadqMP4utWZx2C5wHU4I/tzVvrG8ihPQVFt0CRnhu7Dear
	Uo6xi9+xQ8JY3DRpC6EYZZvh19E3UoCx4Lv2KJH5zGwKnkMg+H3F+1k0oV8Yzfz6/hn8cS
	l5oRACu9vujSD2Bc/No2ADfW0tA1WiWDM+5fpMciN9IiPKzO7lwX7pprL2+G+fqWgU7mk6
	5foNtFVwg4FqvR3iybUKaNrViyCOu2YUROMQp86GLktW9z18s6taZy0YBJO8Gr4rlQeUQc
	/uPOEf6LHEqrdp/wt1sUhbtqKwoP4ml0kIKe0+wEVX7mdQEwTlmgUuUggdI6VQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783543596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BeW1+Lt2glRO2nTqrw43wBscOwCulbV/mgu0vr5CnuU=;
	b=+9W5dv9nePX/QkLL4mwBBpmPKM8sBfNUvizJP9+XRolt7ODtMSu8mfpoR0bed8BaWITeRv
	wqBVMJMk57Q+kOAw==
To: =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <pjw@kernel.org>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, Thomas
 =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Thomas Gleixner
 <tglx@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, kernel-dev@igalia.com
Subject: Re: [PATCH 5/5] riscv: vdso: Implement
 __vdso_futex_robust_try_unlock()
In-Reply-To: <874ii9pfdk.fsf@yellow.woof>
References: <cover.1781876501.git.namcao@linutronix.de>
 <7e567e288f9ddeb2128f5d7ed83a518945fb50d9.1781876501.git.namcao@linutronix.de>
 <8d1bd8fb-1c35-4944-ab77-4dfc73ae5056@igalia.com>
 <874ii9pfdk.fsf@yellow.woof>
Date: Wed, 08 Jul 2026 22:46:34 +0200
Message-ID: <87pl0xdxat.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_134639_569701_C0B6B45B 
X-CRM114-Status: UNSURE (   8.36  )
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

TmFtIENhbyA8bmFtY2FvQGxpbnV0cm9uaXguZGU+IHdyaXRlczoKPiBBbmRyw6kgQWxtZWlkYSA8
YW5kcmVhbG1laWRAaWdhbGlhLmNvbT4gd3JpdGVzOgo+PiBTbyBpZiB0aGUgYnVpbGQgaGFzIHN1
cHBvcnQgZm9yIENBUywgdGhlIGZ1bmN0aW9uIG92ZXJ3cml0ZSB3aGF0IGl0IGhhZCAKPj4ganVz
dCBzZXQuIFdoeSBkbyBpdCBldmVuIHdyaXRlcyBpdCBpbiB0aGUgZmlyc3QgcGxhY2UgdGhlbiwg
Y2FuJ3QgdGhpcyAKPj4gYmUgYW4gaWYvZWxzZT8KPgo+IEZ1bmN0aW9uYWxseSBzcGVha2luZywg
YW4gaWYvZWxzZSBtYWtlcyBtb3JlIHNlbnNlLiBIb3dldmVyLCBJIGNhbm5vdAo+IGZpZ3VyZSBv
dXQgaG93IHRvIGRvIHRoYXQgd2l0aG91dCBjcmVhdGluZyBhIGNvbXBsZXRlIG1lc3MsIHNpbmNl
Cj4gKl90cnlfdW5sb2NrX2NzX2Nhc19zdGFydCBhbmQgKl90cnlfdW5sb2NrX2NzX2Nhc19lbmQg
YXJlIG5vdCBhbHdheXMKPiBhdmFpbGFibGUuIElmIHlvdSBoYXZlIGEgc3VnZ2VzdGlvbiwgcGxl
YXNlIGRvIGxldCBtZSBrbm93LiBCdXQgZG9pbmcKPiBpdCB0aGlzIHdheSBvbmx5IGNvc3RzIHVz
IGEgZmV3IG1vcmUgaW5zdHJ1Y3Rpb25zLgoKTG9vayBhdCB0aGlzIGFnYWluLCB3ZSBjYW4gZG8g
c29tZXRoaW5nIGxpa2UgYmVsb3cuIExldCBtZSBzZW5kIHYzLgoKI2lmIGRlZmluZWQoQ09ORklH
X1JJU0NWX0lTQV9aQUNBUykgJiYgZGVmaW5lZChDT05GSUdfVE9PTENIQUlOX0hBU19aQUNBUykK
I2RlZmluZSBGVVRFWF9DQVNfU0VUX1ZEU09fQ1NfUkFOR0UodmRzbywgZmQsIGlkeCwgeGxlbiwg
c3ltYm9sKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAp7ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgdm9pZCAqc3RhcnQgPSBzeW1ib2wodmRz
bywgQ09OQ0FUMyhmdXRleF9saXN0LCB4bGVuLCBfdHJ5X3VubG9ja19jc19jYXNfc3RhcnQpKTsg
ICAgICAgIFwKICAgICAgICB2b2lkICplbmQgICA9IHN5bWJvbCh2ZHNvLCBDT05DQVQzKGZ1dGV4
X2xpc3QsIHhsZW4sIF90cnlfdW5sb2NrX2NzX2Nhc19lbmQpKTsgICAgICAgICAgXAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgZnV0ZXhfc2V0X3Zkc29f
Y3NfcmFuZ2UoZmQsIGlkeCwgKHVpbnRwdHJfdClzdGFydCwgKHVpbnRwdHJfdCllbmQsIHhsZW4g
PT0gMzIpOyAgICAgICAgIFwKfQojZWxzZQojZGVmaW5lIEZVVEVYX0NBU19TRVRfVkRTT19DU19S
QU5HRSguLi4pIEJVSUxEX0JVRygpCiNlbmRpZgoKI2RlZmluZSBGVVRFWF9MUlNDX1NFVF9WRFNP
X0NTX1JBTkdFKHZkc28sIGZkLCBpZHgsIHhsZW4sIHN5bWJvbCkgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAp7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAg
ICAgICB2b2lkICpzdGFydCA9IHN5bWJvbCh2ZHNvLCBDT05DQVQzKGZ1dGV4X2xpc3QsIHhsZW4s
IF90cnlfdW5sb2NrX2NzX2xyc2Nfc3RhcnQpKTsgICAgICAgXAogICAgICAgIHZvaWQgKmVuZCAg
ID0gc3ltYm9sKHZkc28sIENPTkNBVDMoZnV0ZXhfbGlzdCwgeGxlbiwgX3RyeV91bmxvY2tfY3Nf
bHJzY19lbmQpKTsgICAgICAgICBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKICAgICAgICBmdXRleF9zZXRfdmRzb19jc19yYW5nZShmZCwgaWR4LCAodWludHB0cl90
KXN0YXJ0LCAodWludHB0cl90KWVuZCwgeGxlbiA9PSAzMik7ICAgICAgICAgXAp9CgojZGVmaW5l
IEZVVEVYX1NFVF9WRFNPX0NTX1JBTkdFKHZkc28sIGZkLCBpZHgsIHhsZW4sIHN5bWJvbCkgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCnsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKICAgICAgICBpZiAoY3B1X3N1cHBvcnRzX3phY2FzKCkpIHsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAogICAgICAgICAgICAgICAgRlVURVhfQ0FTX1NFVF9WRFNPX0NTX1JBTkdFKHZkc28sIGZkLCBp
ZHgsIHhsZW4sIHN5bWJvbCk7ICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgfSBlbHNl
IHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgICAgICAgIEZVVEVYX0xSU0NfU0VU
X1ZEU09fQ1NfUkFOR0UodmRzbywgZmQsIGlkeCwgeGxlbiwgc3ltYm9sKTsgICAgICAgICAgICAg
ICAgICAgICAgXAogICAgICAgIH0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCn0KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
