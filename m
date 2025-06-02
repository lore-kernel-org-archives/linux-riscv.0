Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A638DC5AD49
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 22:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7DohvmyTHZwJKsswDLvCZd/oDYCGo4E2kZBwbemv6t4=; b=L0GJJCWGenxJuf
	0Pp7NxekY3DBRMACQpNrYVm80LzhR4RmlraaQbEV/yNGJgQZIuysKdgvyaflbngN60V6+RW5gwFP+
	hh2i0trcpFKuKstZQsX8gyE65DFjgwoeStLsAPp0JPTS5eSFnmpPcSxkVE2Ybr+L7yHCmepX32oZY
	bhtnIiY0ac95MyHQSF8o4k51vR5XzJ/nbMhC7OnETZ4vl9DM7LqdEjXVMkgkoDuQ5/3oc2ZaE11B6
	Aa7+Ea5XrMqmCQ2Yv2BBeOIGNfZIWh3nNn7Sn1bw2junKH1bIlxvEUZgY7PKf0lga/9tXOyGteJO9
	YWGqLyxiYMY1ahm2qRqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDO7-000000099iK-2qKg;
	Mon, 02 Jun 2025 22:12:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDO4-000000099g9-254V
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 22:12:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1584F5C63D6;
	Mon,  2 Jun 2025 22:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91FF3C4CEEE;
	Mon,  2 Jun 2025 22:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748902327;
	bh=qYjz4apuxrHx66aibZhx0HKmmujs0oYFsBNDV/s4fwk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Rkj8b5fwlaaNXl0KCRVz/vrrUV0iuBYFdAZ0fI7RP4glaE6uj6EKRwM3cGXXoqERm
	 IHqXuyxI0iZ0Ocn+1PQg+vFcHr4b2PSM7gMk4OmKF4Zp5+AHNNMfMdsYZhLHtU7vRK
	 8TEDzS3/RZUuMoMrfK8wYLV4jRVgS742cFK9pltwe/8FRqk1AZCElvTjFM8Zr0IBY1
	 1FEDqcpmdVNkiJrlbBEp4YS+nJ5sIRp5JQGfMltOsRhd39uAP5NFy9KRIwJMkOZbO4
	 9GJxi8M+pR7ewtK5XmKWPtUqGuAsJv/DjCSoCZjsPdt12WPmOHXYeSya4l+18h01gw
	 QjkZgN2VJeqeA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71974380AAD0;
	Mon,  2 Jun 2025 22:12:41 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/2] riscv: kexec_file: Support loading Image binary
 file
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174890236014.925497.1303542607611345716.git-patchwork-notify@kernel.org>
Date: Mon, 02 Jun 2025 22:12:40 +0000
References: <20250409193004.643839-1-bjorn@kernel.org>
In-Reply-To: <20250409193004.643839-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alex@ghiti.fr, songshuaishuai@tinylab.org,
 cyrevolt@gmail.com, bjorn@rivosinc.com, mick@ics.forth.gr,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_151208_598006_B7F124AA 
X-CRM114-Status: UNSURE (   9.51  )
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

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byByaXNjdi9saW51eC5naXQgKGZvci1u
ZXh0KQpieSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+OgoKT24gV2Vk
LCAgOSBBcHIgMjAyNSAyMToyOTo1NyArMDIwMCB5b3Ugd3JvdGU6Cj4gRnJvbTogQmrDtnJuIFTD
tnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IAo+IEhpIQo+IAo+IEZvciBvdmVyIGEgeWVhciBh
Z28sIERhbmllbCBhbmQgSSB3YXMgdGVzdGluZyB0aGUgVjIgb2YgU29uZydzIHNlcmllcy4KPiBJ
IGFsc28gcHJvbWlzZWQgdG8gdGFrZSB0aGUgVjIsIHRoYXQgaGFkIGJlZW4gc2l0dGluZyBvbiB0
aGUgbGlzdHMgZm9yCj4gdG9vIGxvbmcsIHRvIHJlYmFzZSBpdCBvbiBhIG5ldyBrZXJuZWwsIGFu
ZCByZS10ZXN0IGl0Lgo+IAo+IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6
CiAgLSBbdjMsMS8yXSByaXNjdjoga2V4ZWNfZmlsZTogU3BsaXQgdGhlIGxvYWRpbmcgb2Yga2Vy
bmVsIGFuZCBvdGhlcnMKICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy80YWJlYzdk
OTZjMTgKICAtIFt2MywyLzJdIHJpc2N2OiBrZXhlY19maWxlOiBTdXBwb3J0IGxvYWRpbmcgSW1h
Z2UgYmluYXJ5IGZpbGUKICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy8xZDU3YTNk
ZjY1NmYKCllvdSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQotLSAKRGVldC1kb290LWRvdCwgSSBh
bSBhIGJvdC4KaHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9wYXRjaHdvcmsvcHdib3QuaHRt
bAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
