Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68105C25B6B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 10:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wjviARqguA3Nr8wsk8hk0O3uTUrrF35/0olMJtblmio=; b=VAiDK9ecr0W7Vj
	EJX5t1vuf+lHFZJXyC0IUTvSgX3CKBo4nWnsBS1iugCztJgy3JPemBTxWu4TqDhFLURm4YMGAnzlw
	ZKUe7MWONcbnO5LfYMPVyYudQquVj1ym0qPSO3A86PMZXzvxoxnZGmZPvHUOTlPGKTC+tNmJOt8T1
	JV0x8QikOWQ2niRRfOGpACTHMcTycdazjH6W0vFmdn8s64PrPFv1PsnTgqIb6u2JljBy7cujqvvGg
	j9mXaNpkQkGMvstM+lspmtGCr6P7XiWMn9WzJ8283sB8ZqdsRakXK4Bqu9Gcci0IIwnlSeAFiIyqF
	lapI8wFTnj8KOwL5Hinw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvxo5-00EC33-1I;
	Thu, 26 Oct 2023 10:41:41 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvxo3-00EC2H-0i
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 10:41:40 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698316890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O6L6DWD07tt2bFggRawWCkh8dvucnoefnFHvJXio3Cc=;
	b=SDA2PWvd6GpZ23Q29afOzvItIzP7Dmf9HxNwShbfHzRxZjMPA4ORRmQFrk4WZqVIuYJe78
	Jjsg0SXxwbKfifz1L23f1CdJwoxreMsFrOKuBeQJfGXO+u26WWu5ivTISfPn4+KXF0cHk/
	huAuzWJqNSGNclPgsARofKggfNPAuZ+0plX2vdFECnfvEECG9ZCV2OgWZzy/kFyldQpKNy
	DG2ezfPALHgpx2jG+WhLbas6xIrBHfsdS2IKEi5xAaG6qX720gEFKUw0hn3r6kdvA0wQG0
	0TZzeFKe5acOFUy8oa/+e/DZcmRQQ1B7ook34O80PbmRILDqUAZryd/8cae/+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698316890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O6L6DWD07tt2bFggRawWCkh8dvucnoefnFHvJXio3Cc=;
	b=ZME73FASasBJ5RVuSkYko3ct13v8tQwEK3s0Acq8SemU/uhrkeF7J9uba6SJtkbApjKiuN
	8qpaQyEohb9CJKDg==
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Anup Patel
 <anup@brainfault.org>
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, x86@kernel.org
Subject: Re: [RFC PATCH] genirq/matrix: Dynamic bitmap allocation
In-Reply-To: <20231026101957.320572-1-bjorn@kernel.org>
References: <20231026101957.320572-1-bjorn@kernel.org>
Date: Thu, 26 Oct 2023 12:41:30 +0200
Message-ID: <87r0lh4qed.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_034139_398807_F2DA7603 
X-CRM114-Status: UNSURE (   5.29  )
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

QmrDtnJuIQoKT24gVGh1LCBPY3QgMjYgMjAyMyBhdCAxMjoxOSwgQmrDtnJuIFTDtnBlbCB3cm90
ZToKPiBUaG9tYXMsIHRoaXMgaXMganVzdCBGWUkvUkZDLiBUaGlzIGNoYW5nZSB3b3VsZCBvbmx5
IG1ha2Ugc2Vuc2UsIGlmCj4gdGhlIFJJU0MtViBBSUEgc2VyaWVzIHN0YXJ0cyB1c2luZyB0aGUg
SVJRIG1hdHJpeCBhbGxvY2F0b3IuCgpJJ20gbm90IHNlZWluZyBhbnl0aGluZyBob3JyaWJsZSB3
aXRoIHRoYXQuCgpUaGFua3MsCgogICAgICAgIHRnbHgKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
