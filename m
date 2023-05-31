Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C8CC7EE23
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 15:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C5kUoFI1AKgK8QMPnuxTcxWarOtNTbhytMv33ZvHfgc=; b=1gDLqSjEmwMEwV
	x6tsDP2zkHoQ42+yIM7i0ARbVaOGpqA/LJoj6W/B/n5qLDBMwTfz4fjDNg/wnDB7lOD8SUSmdCxyW
	PhKcYBiZzzoAqJU0fK2Onb2/s0UY8rv/Y9zgPBVFfHXty+vgitd/yR7x33QfageJjo/MeE/6bwiKP
	IKo1chW1gEVS30uXNsfd3sK3wbErN7blJQ+WV3+K718WmiM80qxQEQDbLETyfAeheFTtplFkq9VIG
	VpOcF8pgF22B2bNidW2NwoUOqGCNGjxqlTFuk3hh2Dyz1NBJ4EWHdbLPBF67f1pP4DEbCG6UfCiuu
	LJh4TzuZmceyXVXhivfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4NT3-000FMw-1X;
	Wed, 31 May 2023 15:10:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4NSz-000FKw-1X
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 15:10:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 89ED160BCB;
	Wed, 31 May 2023 15:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF5E3C4339E;
	Wed, 31 May 2023 15:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685545822;
	bh=5lizdQwgDjzOGRTGSgGaTLL6eAMn99hHqlDNrARDpUk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=E41USqB9H6f/NtMA+9VU3/1/VbnKpMqBKUz3W5QQZ+/M5i0WlFNEC3xQ2KDAU6PEU
	 cXr7n0Xy3Gbciq65TDQxyRhnh5V0bmRMCHf5HdW6FDjo3huHXGOvY2UQBi2PK7m/gg
	 +NQHOQfe8HfjwVQqT4TvuFruAlM4Qg7mgMquQZS6MXsUieaHC2En8T4I3Iysxvbb+e
	 4E7Iz4EKXMcjcIrXwlRqc/WgD+NPnDob3XzDAxRbgMrNlsIM6dlHgeYgW/DTaoFW10
	 4TLIsvhFC7ZT2vfvtQ3pTUCo7x3ZU9CcT6NQJ9puqviZ/H8OhksUFkG6PGHRA5SGBn
	 cWxnlDni2icsQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D6AFDE21EC4;
	Wed, 31 May 2023 15:10:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: Fix unused variable warning when BUILTIN_DTB is
 set
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168554582187.8247.15042711269697974982.git-patchwork-notify@kernel.org>
Date: Wed, 31 May 2023 15:10:21 +0000
References: <20230519131311.391960-1-alexghiti@rivosinc.com>
In-Reply-To: <20230519131311.391960-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_081025_572074_5CB091B5 
X-CRM114-Status: UNSURE (   9.01  )
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZml4ZXMp
CmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIEZyaSwgMTkgTWF5
IDIwMjMgMTU6MTM6MTEgKzAyMDAgeW91IHdyb3RlOgo+IGNvbW1pdCBlZjY5ZDI1NTlmZTkgKCJy
aXNjdjogTW92ZSBlYXJseSBkdGIgbWFwcGluZyBpbnRvIHRoZSBmaXhtYXAKPiByZWdpb24iKSB3
cm9uZ2x5IG1vdmVkIHRoZSAjaWZuZGVmIENPTkZJR19CVUlMVElOX0RUQiBzdXJyb3VuZGluZyB0
aGUgcGEKPiB2YXJpYWJsZSBkZWZpbml0aW9uIGluIGNyZWF0ZV9mZHRfZWFybHlfcGFnZV90YWJs
ZSgpLCBzbyBtb3ZlIGl0IGJhY2sgdG8KPiBpdHMgcmlnaHQgcGxhY2UgdG8gcXVpZXQgdGhlIGZv
bGxvd2luZyB3YXJuaW5nOgo+IAo+IC4uL2FyY2gvcmlzY3YvbW0vaW5pdC5jOiBJbiBmdW5jdGlv
biDigJhjcmVhdGVfZmR0X2Vhcmx5X3BhZ2VfdGFibGXigJk6Cj4gLi4vYXJjaC9yaXNjdi9tbS9p
bml0LmM6OTI1OjEyOiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUg4oCYcGHigJkgWy1XdW51c2Vk
LXZhcmlhYmxlXQo+ICAgOTI1IHwgIHVpbnRwdHJfdCBwYSA9IGR0Yl9wYSAmIH4oUE1EX1NJWkUg
LSAxKTsKPiAKPiBbLi4uXQoKSGVyZSBpcyB0aGUgc3VtbWFyeSB3aXRoIGxpbmtzOgogIC0gWy1m
aXhlc10gcmlzY3Y6IEZpeCB1bnVzZWQgdmFyaWFibGUgd2FybmluZyB3aGVuIEJVSUxUSU5fRFRC
IGlzIHNldAogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzMzZDQxOGRhNmY0NwoK
WW91IGFyZSBhd2Vzb21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90
LgpodHRwczovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5odG1sCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
