Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972C4C44520
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 11:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rVrna7Z/d5CmaHtF903xvUVeMHyk5I8UwZXiR4mpqY8=; b=wY1EUMWeySiXo4
	qyZik86fUkJbELTpIgMB1SpJQr1SysgO8gqKs4sezGmEfcqzq0CY8s8YjvtOtujAa73u6WVEzY0Ax
	+sbQZYo4OHKE+htnN/di4pq9LympPWQ/dHg9TyGLOZCKpRr7NB70xjcVjq6V5CjbVsPnYt7o2Pkx5
	9P49YISiAwvwhUm/17VuJHSl/IqkKFCtpieyt1vF6ThD/AQhIZy0t5+lXEUtmKpZPbE4dfyFd3uFf
	NQvr5T+DMJng3KkjUPdFRBZPaSAi5MyqEqldIyUp8pzXXElsTJORkQZ+wET/OtuQxFDa6lV1mBFIG
	hOTKYDZw3fuHQo34zNzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmJw-00000006cML-35VA;
	Mon, 20 Jul 2026 11:38:04 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmJu-00000006cLv-1Uq1
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 11:38:03 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784547480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=phFCsGFYgs1QpHy89Fcujz+dav1RJ/5A2UnSq6VyrOw=;
	b=Bfw094oq7+xt3FEeyBaZMoNqOFo32cwnFmyGeWmG5Bt2uAnZ7IFAF6xTz+f/849ZeyyfwE
	oXB570q/iLNMeIxW6UrZqSaoVV63RVzdzFtO6s/Nh3LZ7DBi3nmZdh+x03yO89Wi9IN28N
	p9p4QIE+bpZa3YdCjOjQh7OsJWEMLi2nQFnyqTODlNvQSWAaFN60zL670HO877AW69f/HR
	x62AtJofxvhd49aygvbFUsFCOZdHQRt5ykOk7gfjqQ9dsyetsiR1bS1CMBHNyOLyq6CW5l
	izYUJ3PvNFOBSeIpo6/LfeuBFkUbWmgqvW/wPPjwZng9MARnHx35Y1A0YtWwdA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784547480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=phFCsGFYgs1QpHy89Fcujz+dav1RJ/5A2UnSq6VyrOw=;
	b=fG8KDPZBrq+f7GWWrnqAZeU4hIZHnXZjIr2v4w8j5J5P0FZZOre8cOpVYHyj9ul/isnK0E
	TIFvvoe30MQhJrBQ==
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?utf-8?Q?Andr=C3=A9?=
 Almeida <andrealmeid@igalia.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Subject: Re: [PATCH v3 5/5] riscv: vdso: Implement
 __vdso_futex_robust_try_unlock()
In-Reply-To: <20260717142423-c5be3c7c-d4cb-4a68-8e85-3e3754e42666@linutronix.de>
References: <cover.1784274927.git.namcao@linutronix.de>
 <b3447fdd87cdd607b685940a1801b841066337fa.1784274927.git.namcao@linutronix.de>
 <20260717142423-c5be3c7c-d4cb-4a68-8e85-3e3754e42666@linutronix.de>
Date: Mon, 20 Jul 2026 13:37:59 +0200
Message-ID: <87ldb5evs8.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_043802_556494_94A7BBBE 
X-CRM114-Status: GOOD (  10.20  )
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

VGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+IHdyaXRl
czoKPiBDYW4gaXQgZXZlciBoYXBwZW4gdGhhdCB0aGUgdG9vbGNoYWluIGhhcyBkaWZmZXJpbmcg
emFjYXMgc3VwcG9ydCBiZXR3ZWVuCj4gMzItYml0IGFuZCA2NC1iaXQ/IFRoZW4gY3B1X3N1cHBv
cnRzX3phY2FzKCkgbWF5IG5vdCBiZSBzdWZmaWNpZW50LgoKTm8gaWRlYS4gUHJvYmFibHkgbm90
LgoKQnV0IGlmIGl0IGRvZXMgZGlmZmVyLCB3ZSB3aWxsIGdldCBhIGNsZWFyIGNvbXBpbGUtdGlt
ZSBlcnJvciBtZXNzYWdlCih1bnJlY29nbml6ZWQgaW5zdHJ1Y3Rpb24gb3Igc29tZXRoaW5nIGxp
a2UgdGhhdCkuIFdlIGNhbiB3b3JyeSBhYm91dCBpdCB0aGVuLgoKPiBJZiBpdCBpcyBndWFyYW50
ZWVkIHRvIGJlIGluIHN5bmMgSSB3b3VsZCBwcmVmZXIgdG8gcmV1c2UKPiBDT05GSUdfVE9PTENI
QUlOX0hBU19aQUNBUyBpbnN0ZWFkIG9mIHRoZSBjYy1vcHRpb24gY2hlY2sgaW4gdGhlIE1ha2Vm
aWxlCj4gdG8gbWFrZSB0aGF0IGNsZWFyIGFuZCBlcnJvciBvdXQgZWFybHkgaWYgaXQgc2hvdWxk
IGV2ZXIgY2hhbmdlLgoKSSBpbnRlbmQgdG8gYXBwbHkgVml2aWFuJ3MgLm9wdGlvbiBzdWdnZXN0
aW9uLiBUaGF0IHdvbid0IGJlIHJlcXVpcmVkIHRoZW4uCj4KPiBBbHNvIHRoaXMgYXNzdW1lcyB0
aGF0IGNvbXBhdCB2RFNPIGFsdGVybmF0aXZlIHBhdGNoaW5nIHdvcmtzLgo+IEJ1dCB0aGlzIGlz
IG5vdCB0aGUgY2FzZS4gTXkgc2VyaWVzIFswXSB0byBpbXBsZW1lbnQgaXQgaGFzIG5vdCB5ZXQg
YmVlbgo+IGFwcGxpZWQuIFRoaXMgcmV2aXNpb24gaXMgbWlzc2luZyB0aGUgbm90ZSBhYm91dCB0
aGlzIGRlcGVuZGVuY3kuCj4KPiBbMF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYw
NjMwLXJpc2N2LXZkc28zMi1hbHRlcm5hdGl2ZS12MS0wLWEzMmZkODliN2IxY0BsaW51dHJvbml4
LmRlLwoKUmlnaHQsIHRoYW5rcy4KCj4gQ291bGQgYmUgOgo+Cj4gdmRzby1zeW1zICs9IF9fdmRz
b19mdXRleF9yb2J1c3RfbGlzdCQoQklUUylfdHJ5X3VubG9jawoKV2Fzbid0IGF3YXJlIHRoYXQg
QklUUyBleGlzdHMsIG5pY2UhCgpOYW0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
