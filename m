Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CFCC5B549
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 00:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2M0ab4BPzT97Hb8AMP5eUHIy1wiWm7v9eGphr/eh29Y=; b=mq+pQxDv6W4JWV
	Zg4MONhMNGcUBfwUdNQnnzlmPjxVE5Gq1bu4KwD1KlAUYbesRYWp2qzFbyaxLUq6G8xf40vQc3LDR
	FxaTxN5cbss/sGlcnJBXCMbT9+3vPkEIHtLHoI1+sdd+dLfW0NXwm0i5/3IP6h53D/KeAuUvGcpMK
	3Epht4hqkGKl9rrck1jH0wuEowz+8F7lQmb8ATg5NIWzCl5ESH0i81F9XBMShRC36UqCdIt+Shjug
	5xuBG2oreWIZQ2XUtQijMDihNBZOnO88ddUIfcgzfcqz601ZcYre7R9lR78MtUc/z1AcT7B3dEMAg
	aTigjYh8dmBQ6L8vnHAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMFVy-00000009PuM-1KaO;
	Tue, 03 Jun 2025 00:28:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDOJ-000000099ro-2P1V
	for linux-riscv@bombadil.infradead.org;
	Mon, 02 Jun 2025 22:12:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GG34qV7Pzpt0cKGjmoxf9eVfkU8Bs+KpxZx1W1xTjgk=; b=fOk3O4KNKhgoPDEA2n5DD/bV+b
	VPjZqDA29R2+1eV6rynEXparNPE6R3h/7sJi7NhM9v7AUQadGp3MMlzRc4RmPrt5JbKx4t/GYjL/S
	xILJbyMWxZq1XuC5jVJMVq1+N+6Sw/+HS9JUHr9Qt3b2RPRMdDQSu3zBzGgH0TwNF+upb5scbcEEo
	xy2S9RDHMw2h8qH3F9crvCu7Cunu3OnzcvaZ51pxvTTWusEH2RqQHeIt4uUu4u4E8Pq+J/Z46xjJi
	FkZ7Yd2YMYVrvsz91GG/isw9df738fudOZim1WMeaJUKW49S0V/kaKN4Xi3KgAE92ZVEUgZT8E+i0
	6E9fT7fA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDOG-00000000gEJ-1vJO
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 22:12:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0727242B9E;
	Mon,  2 Jun 2025 22:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA5FC4CEF0;
	Mon,  2 Jun 2025 22:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748902337;
	bh=EAN1XwgJlvPo/BNWCc6cUUyZbeib7/bZo7uYUrfqrHI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=a5NFzYfOtX5wtRgJYyeb+GFL2x+QTHCi95m1hd2JaGBXA+fd3qmh6T+KNG/LP/QiN
	 Opxb17z0MzWtwdzQNpDBn875fS9TNAsBpsHHmKeNnDq9ec2q5Mq+94MY32936AS7KC
	 HPtazlwfUNxraRcMEP3M026isjVTSjWpOIsJ5i8DXwaxcfwuwGpGEqJ8FkzsBMpbtq
	 vSmUy+cM5ZDhjqy+p/aFQQg1TYNEzWWWnnHzuUB8c6KlxRbpB+hdOfq4+o6D/mSNWd
	 LoBcR/XwYQe9WIaq3fUYDufSyDZy7IC+3MUTgKkokAVJghZzFpR2cAzX2m3McBIMCn
	 dSBhzT80EYUbg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE6F3380AAD0;
	Mon,  2 Jun 2025 22:12:51 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] Improve Kconfig help for RISCV_ISA_V_PREEMPTIVE
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174890237024.925497.18416911728600663313.git-patchwork-notify@kernel.org>
Date: Mon, 02 Jun 2025 22:12:50 +0000
References: <20250501130309.14803-1-mikisabate@gmail.com>
In-Reply-To: <20250501130309.14803-1-mikisabate@gmail.com>
To: =?utf-8?q?Miquel_Sabat=C3=A9_Sol=C3=A0_=3Cmikisabate=40gmail=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alex@ghiti.fr, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_231220_692661_28B10D1A 
X-CRM114-Status: UNSURE (   9.07  )
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZm9yLW5l
eHQpCmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+OgoKT24gVGh1LCAgMSBN
YXkgMjAyNSAxNTowMzowOSArMDIwMCB5b3Ugd3JvdGU6Cj4gRnJvbTogTWlxdWVsIFNhYmF0w6kg
U29sw6AgPG1pa2lzYWJhdGVAZ21haWwuY29tPgo+IAo+IEZpeCBhIGNvdXBsZSBvZiBzcGVsbGlu
ZyBpc3N1ZXMgcGx1cyBzb21lIG1pbm9yIGRldGFpbHMgb24gdGhlIGdyYW1tYXIuCj4gCj4gU2ln
bmVkLW9mZi1ieTogTWlxdWVsIFNhYmF0w6kgU29sw6AgPG1pa2lzYWJhdGVAZ21haWwuY29tPgo+
IC0tLQo+ICBhcmNoL3Jpc2N2L0tjb25maWcgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdp
dGggbGlua3M6CiAgLSBJbXByb3ZlIEtjb25maWcgaGVscCBmb3IgUklTQ1ZfSVNBX1ZfUFJFRU1Q
VElWRQogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzBlZTMwMDJkNjZjOQoKWW91
IGFyZSBhd2Vzb21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90Lgpo
dHRwczovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5odG1sCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
