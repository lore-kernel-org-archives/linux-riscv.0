Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E571C7115B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 03:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIBToT6kWA1wtsKX55OBZTMFLvFrhW9rb/I/9OfAPN0=; b=ueBrAH89OSThAF
	lN2DYwBVGVqXrf11SynBbtl7oL2+tt1GW1EZ+Cvw1zxARaGnIjK17v/RSxf8habxLuqsGNda3pW8F
	zqnpGZcmsis2xRubxdNwweCdOdI230d+xAcqlN5SpM7ip4fCUQmutvXlNwXkTc9xQxYCSnqP9zQiy
	bzB7O7CH//hweHPa/W4Ypa5rux9HIe/d2+0gIw8oP8hUumQwSKnw+JUQnSEbL0fCn7uqDR0Py22n6
	ma+jujqdgpWQqbdKuPAcyHRxPQbat+JjPo19Q8aRloPdPLGi3NoZFBMTZlkbwa8z8Y/n1hX873cp3
	fgkK6D+flASrEsmK9OCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTu1K-00000004WMq-234R;
	Tue, 24 Jun 2025 03:08:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrr4-00000004KVq-34EU
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 00:49:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A58B627CA;
	Tue, 24 Jun 2025 00:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB1DC4CEEA;
	Tue, 24 Jun 2025 00:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750726182;
	bh=oZx4kiMTZ7OFx470+Dr/BC+poOIjM3y43rIaqC5bYSU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tWUMDohETfbJkqNFsEtYj3C1Dq923Me8JwaTDk1fyrZ119ihuV/yknGDP5ADArYNz
	 b+XYKWn442TvccaAGf2UoXuce+AssxuN6p00VwuXQ/AuLnTll3FoMEzTZ8zLF4Xjxh
	 9KU6DO5DnKY2vusz1O9KiP5x5+lsYeXqX0fjh9pHtzMSDiivbkklUsBD2nmbYaUJ9b
	 FFXdPyM4BZoSrDmd5HGbFKOqUc1l4Jha8xv04KW+fgmGUakENEe4pKmQqBHUwNA4Fv
	 6ZcUhrw+dsAJpfv5vpXMDgmC5NBo4fH3gN3pT40xR5/3fXJfoTeB2yLN2jPCKnckYA
	 GvwQvFp98E9kg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E3D39FEB7D;
	Tue, 24 Jun 2025 00:50:10 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "riscv: misaligned: fix sleeping function called
 during misaligned access handling"
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175072620874.3349808.15747931060584353769.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jun 2025 00:50:08 +0000
References: <20250620110939.1642735-1-namcao@linutronix.de>
In-Reply-To: <20250620110939.1642735-1-namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 cleger@rivosinc.com, nylon.chen@sifive.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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
CmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+OgoKT24gRnJpLCAyMCBKdW4g
MjAyNSAxMzowOTozOSArMDIwMCB5b3Ugd3JvdGU6Cj4gVGhpcyByZXZlcnRzIGNvbW1pdCA2MWE3
NGFkMjU0NjIgKCJyaXNjdjogbWlzYWxpZ25lZDogZml4IHNsZWVwaW5nIGZ1bmN0aW9uCj4gY2Fs
bGVkIGR1cmluZyBtaXNhbGlnbmVkIGFjY2VzcyBoYW5kbGluZyIpLiBUaGUgY29tbWl0IGFkZHJl
c3NlcyBhIHNsZWVwaW5nCj4gaW4gYXRvbWljIGNvbnRleHQgcHJvYmxlbSwgYnV0IGl0IGlzIG5v
dCB0aGUgY29ycmVjdCBmaXggYXMgZXhwbGFpbmVkIGJ5Cj4gQ2zDqW1lbnQ6Cj4gCj4gIlVzaW5n
IG5vZmF1bHQgd291bGQgbGVhZCB0byBmYWlsdXJlIHRvIHJlYWQgZnJvbSB1c2VyIG1lbW9yeSB0
aGF0IGlzIHBhZ2VkCj4gb3V0IGZvciBpbnN0YW5jZS4gVGhpcyBpcyBub3QgcmVhbGx5IGFjY2Vw
dGFibGUsIHdlIHNob3VsZCBoYW5kbGUgdXNlcgo+IG1pc2FsaWduZWQgYWNjZXNzIGV2ZW4gYXQg
YW4gYWRkcmVzcyB0aGF0IHdvdWxkIGdlbmVyYXRlIGEgcGFnZSBmYXVsdC4iCj4gCj4gWy4uLl0K
CkhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKICAtIFJldmVydCAicmlzY3Y6IG1pc2Fs
aWduZWQ6IGZpeCBzbGVlcGluZyBmdW5jdGlvbiBjYWxsZWQgZHVyaW5nIG1pc2FsaWduZWQgYWNj
ZXNzIGhhbmRsaW5nIgogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzJmNzNjNjJk
NGUxMwoKWW91IGFyZSBhd2Vzb21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3QtZG90LCBJIGFt
IGEgYm90LgpodHRwczovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5odG1s
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
