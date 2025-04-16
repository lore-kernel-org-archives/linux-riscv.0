Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0494C369C5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Apr 2025 18:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oUHgLkq9ySJ5DgBbu8rkwbz61lLMRyZJdavsOu/Pc08=; b=mP2asl/OFae5rS
	kW7UlCLCTGeNVKxYerQl1mArWSHgWbBcGTOc1UryaP/uAeQx2jAQ9bHkIP+45BwGn/qKnhIP7wftL
	hJXdBiZ3LymdzKUPkZgwomeVgcFKPTRAK2WfqSkHyVnFMIqbAF68d4EQB8Upl6D1PdOrmloeon/d7
	qG/9Fpn3OIR02AHgfkqnDWy3ymnx3Il4hEyP1F5PoEofp1fGHEg3vaAcR4QzpSzThN17EJpWwhtBw
	kl/Liw9/cuZqqZb9UW4G+IstjVyE/KhD2cxtT87BscMUqxjn7Uz20YhGzFLDQ79Hmtwb3zVm2uy+3
	qIwTPae3mi0wZv2lcfjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57iU-0000000Ab0x-1ldL;
	Wed, 16 Apr 2025 18:42:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57hq-0000000AaqN-3HdI
	for linux-riscv@lists.infradead.org;
	Wed, 16 Apr 2025 18:41:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 03748A415CC;
	Wed, 16 Apr 2025 18:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1DE7C4CEE2;
	Wed, 16 Apr 2025 18:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744828913;
	bh=Pa8CtMrmRipcqHnGu0QHHTWFJIGboQCpNY3td+rS4TQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hZokQCCjsyaqOsKwoPCDRQzfnyuArN0+KoLoUAaLtGjuQGurYmNpqGD9Tcd9ZAJ63
	 w6G0gV1YLVaJaIhG/ep4CfVEicIqNLwVZoeYFsRCSg0C7e5AWIjkbKzfpo/2XjR+S5
	 PIPD8hoJ9HP7he9h+7ZVFt7mGOKlW3y0RMHUhzXqwNz1I1hXuO8N5LemN6/eQnqqjk
	 ojD8p3bBsjFLsgj1cHcbtUJ8TYyJagVW6vR0nlUN2ZZmI4Gq4bZWyIIDi8KC9mLnyK
	 QHyUj1e3F8pSjPJSaQgZDYu1uO1tJiExFl72MotovVN0J9tbiRKUFTrsvweOlXBc66
	 GC1EVIrdDDUOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DB33822D59;
	Wed, 16 Apr 2025 18:42:32 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH fixes] riscv: Properly export reserved regions in /proc/iomem
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174482895074.3460781.13932594280682555131.git-patchwork-notify@kernel.org>
Date: Wed, 16 Apr 2025 18:42:30 +0000
References: <20250409182129.634415-1-bjorn@kernel.org>
In-Reply-To: <20250409182129.634415-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alex@ghiti.fr, mick@ics.forth.gr, bjorn@rivosinc.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_114154_879801_62B55D52 
X-CRM114-Status: UNSURE (   8.71  )
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
CmJ5IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT46CgpPbiBXZWQsICA5
IEFwciAyMDI1IDIwOjIxOjI3ICswMjAwIHlvdSB3cm90ZToKPiBGcm9tOiBCasO2cm4gVMO2cGVs
IDxiam9ybkByaXZvc2luYy5jb20+Cj4gCj4gVGhlIC9wcm9jL2lvbWVtIHJlcHJlc2VudHMgdGhl
IGtlcm5lbCdzIG1lbW9yeSBtYXAuIFJlZ2lvbnMgbWFya2VkCj4gd2l0aCAiUmVzZXJ2ZWQiIHRl
bGxzIHRoZSB1c2VyIHRoYXQgdGhlIHJhbmdlIHNob3VsZCBub3QgYmUgdGFtcGVyZWQKPiB3aXRo
LiBLZXhlYy10b29scywgd2hlbiB1c2luZyB0aGUgb2xkZXIga2V4ZWNfbG9hZCBzeXNjYWxsIHJl
bGllcyBvbgo+IHRoZSAiUmVzZXJ2ZWQiIHJlZ2lvbnMgdG8gYnVpbGQgdGhlIG1lbW9yeSBzZWdt
ZW50cywgdGhhdCB3aWxsIGJlIHRoZQo+IHRhcmdldCBvZiB0aGUgbmV3IGtleGVjJ2Qga2VybmVs
Lgo+IAo+IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSBbZml4ZXNd
IHJpc2N2OiBQcm9wZXJseSBleHBvcnQgcmVzZXJ2ZWQgcmVnaW9ucyBpbiAvcHJvYy9pb21lbQog
ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jL2U5NGViN2VhNmYyMAoKWW91IGFyZSBh
d2Vzb21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90LgpodHRwczov
L2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5odG1sCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
