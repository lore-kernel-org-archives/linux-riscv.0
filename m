Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D10DEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 23:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3PNgP6KyKD+3yBQ7mlijQ0lmyRa051mFKg+pDIXkoGQ=; b=o+o+AiOi4DEQpS
	rL0ND9eU4p9alMEPNTCPPM7ve51gJOe8EXEV6oQvRycQrQ96HVQXr+UulSrlo+F1esKQ3oLdw5lhN
	xM/0s+uTe6kUMrCED51+47K3hhEoumgnIhouij2uIT+0StQz/XNI/9EpPI1Kz74TeLGx2AMk0rcf9
	qqdB0ZomGZnXl9l+BLI/nEwv5N6rf+oyOql8GSkbKmk+HlpmoSvG8qqZlzEqNXaF39s4frXZil1Ec
	wd9HaEpx4kyKlblyYz9pJm8z3Dpsi9wNsZCUYYH9nQmkql0bC3noUsPPPmjl0wj9NGiTtVCGp/kdq
	ufvdX0ZTbuZ/PZgHuaUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHCGT-00HOMx-27;
	Wed, 05 Jul 2023 23:50:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHCGO-00HOJK-1W
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 23:50:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 568DC617D6;
	Wed,  5 Jul 2023 23:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADB1EC433CB;
	Wed,  5 Jul 2023 23:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688601022;
	bh=QC3N5FVDNiAZMmLVWV062ludq+R2W6w7g38+nOSTnWY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=u6KQwRVwHXDmLQPVdu4F1jHwH2h5UfG4IISxdZGmCs5+fDx08aEaH7AqTfY02MBHY
	 fwyD/Eic2PZq11b8OanRW5LdHb/AT+oA3VKDxbILPychrJ+D8MuFwi1dYyfZ7f76Rw
	 pc5270W2z9lsZQwAyS50bNKebX23BBCVLpvqPDpo2EOao2ksv2v4Nr3TJT7PLrBdFG
	 dnTAAAc5/QGbaUw+nGdLCH2OXTzAKRBMYce2I5h5thW4YY6x1PgkEcLMdn+L7hNXVp
	 /SxmEAWiu6Fp+uctMwUBRgsJyq/yiThetzyhF3vYNGIysUzr6hFv7Ur28sk0N/85po
	 fu3zWO3zcsEdA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8BB2DC561EE;
	Wed,  5 Jul 2023 23:50:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4] riscv: Discard vector state on syscalls
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168860102256.23922.12744250095114433729.git-patchwork-notify@kernel.org>
Date: Wed, 05 Jul 2023 23:50:22 +0000
References: <20230629142228.1125715-1-bjorn@kernel.org>
In-Reply-To: <20230629142228.1125715-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, andy.chiu@sifive.com,
 bjorn@rivosinc.com, linux-kernel@vger.kernel.org, linux@rivosinc.com,
 palmer@rivosinc.com, remi@remlab.net, darius@bluespec.com,
 conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_165024_568428_9A95DCD3 
X-CRM114-Status: UNSURE (   8.22  )
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
eHQpCmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIFRodSwgMjkg
SnVuIDIwMjMgMTY6MjI6MjggKzAyMDAgeW91IHdyb3RlOgo+IEZyb206IEJqw7ZybiBUw7ZwZWwg
PGJqb3JuQHJpdm9zaW5jLmNvbT4KPiAKPiBUaGUgUklTQy1WIHZlY3RvciBzcGVjaWZpY2F0aW9u
IHN0YXRlczoKPiAgIEV4ZWN1dGluZyBhIHN5c3RlbSBjYWxsIGNhdXNlcyBhbGwgY2FsbGVyLXNh
dmVkIHZlY3RvciByZWdpc3RlcnMKPiAgICh2MC12MzEsIHZsLCB2dHlwZSkgYW5kIHZzdGFydCB0
byBiZWNvbWUgdW5zcGVjaWZpZWQuCj4gCj4gVGhlIHZlY3RvciByZWdpc3RlcnMgYXJlIHNldCB0
byBhbGwgMXMsIHZpbGwgaXMgc2V0IChpbnZhbGlkKSwgYW5kIHRoZQo+IHZlY3RvciBzdGF0dXMg
aXMgc2V0IHRvIERpcnR5Lgo+IAo+IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlu
a3M6CiAgLSBbdjRdIHJpc2N2OiBEaXNjYXJkIHZlY3RvciBzdGF0ZSBvbiBzeXNjYWxscwogICAg
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzk2NTdlOWI3ZDI1MwoKWW91IGFyZSBhd2Vz
b21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90LgpodHRwczovL2tv
cmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5odG1sCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
