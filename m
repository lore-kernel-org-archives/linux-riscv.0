Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354A1C4706C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 06:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TckahNhu3YQ0jPaLJ/FZYI7u7ujZDqhG57Jp7yZ1PrM=; b=LklP+CbPbipwm+
	UkYqmrDjQ9oINbjAmEZbHYXvo4RrFHsl9GT2/802co66JS8En95VDP2XKTfhuqFQ6/7KjDfgzPkXn
	DNKttZC0n2IITVqRMur3Mq74HhRyoL6v1oFgmkoV6e1WLvfJtDEy3r+f6KH51laW426O8XkIiVfFC
	nUjk5NaeI6opnXiBbLbLIf46Ny35A93b5Cc3hKUlI95F3miBNW1Md8SfVdbY408Kc0qjFb+eSIqgZ
	5BI9N1fkp9g82X8apeld7qBrI4zzfHQMQZW7h9fpXYYbLnFDZ+9p3YGM/88mX/ADqUYkqGpX2odvA
	yo4gZDCseopXDSwxJr3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOB3t-0020uH-2b;
	Fri, 12 Jan 2024 06:30:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOB3p-0020sD-0n
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 06:30:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9F87EB82255;
	Fri, 12 Jan 2024 06:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD15BC43394;
	Fri, 12 Jan 2024 06:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705041030;
	bh=nTCKlP8E3w3r918DPScqNt0w2ZJX7f1RmOrFs37dgR4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OGAcbI0VhUEpVkGS4VG3jEOGk3GqOPOr+EdWGx53BE+NE4KQR/yFHpjBuYEL9tKCw
	 RXn26BLLp8IiJIb7iuDuj6N5E4GJhTUJh0yPN8uuE9tw/3OgjDaH59M5YmL8zzC/T8
	 decxw1LmqoBxpIOEmmjyfVxkrIX6+gZI8AWGjtVcBO3I/cTN21lZSwJNMkgiWcMiim
	 2HS/etH3Txt6vLZBk+c8n6O4DuKtgeL16zHL6AEw1oKaaDGzko6j62Ry/IE0rIBT+d
	 CJO9GG4QqwYUIw+Bv/VBVzOTSID0bLM5iQwnPW9AF2umzhuD/AyFbLUCvR63YiquM8
	 lYe+SGt6KVtKw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C34F1D8C96D;
	Fri, 12 Jan 2024 06:30:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] tools: selftests: riscv: Fix compiler warnings
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170504103079.17535.4478051835218795004.git-patchwork-notify@kernel.org>
Date: Fri, 12 Jan 2024 06:30:30 +0000
References: <20231123185821.2272504-1-christoph.muellner@vrull.eu>
In-Reply-To: <20231123185821.2272504-1-christoph.muellner@vrull.eu>
To: =?utf-8?q?Christoph_M=C3=BCllner_=3Cchristoph=2Emuellner=40vrull=2Eeu=3E?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, shuah@kernel.org, philipp.tomsich@vrull.eu,
 ajones@ventanamicro.com, evan@rivosinc.com, xiao.w.wang@intel.com,
 alexghiti@rivosinc.com, andy.chiu@sifive.com, bjorn@rivosinc.com,
 charlie@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_223033_413296_AD805B20 
X-CRM114-Status: UNSURE (   8.66  )
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
ZXh0KQpieSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT46CgpPbiBUaHUsIDIz
IE5vdiAyMDIzIDE5OjU4OjE2ICswMTAwIHlvdSB3cm90ZToKPiBGcm9tOiBDaHJpc3RvcGggTcO8
bGxuZXIgPGNocmlzdG9waC5tdWVsbG5lckB2cnVsbC5ldT4KPiAKPiBXaGVuIGJ1aWxkaW5nIHRo
ZSBSSVNDLVYgc2VsZnRlc3RzIHdpdGggYSByaXNjdjMyIGNvbXBpbGVyIEkgcmFuIGludG8KPiBh
IGNvdXBsZSBvZiBjb21waWxlciB3YXJuaW5ncy4gV2hpbGUgcmlzY3YzMiBzdXBwb3J0IGZvciB0
aGVzZSB0ZXN0cyBpcwo+IHF1ZXN0aW9uYWJsZSwgdGhlIGZpeGVzIGFyZSBzbyB0cml2aWFsIHRo
YXQgaXQgaXMgcHJvYmFibHkgYmVzdCB0byBzaW1wbHkKPiBhcHBseSB0aGVtLgo+IAo+IFsuLi5d
CgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSBbMS81XSB0b29sczogc2VsZnRl
c3RzOiByaXNjdjogRml4IGNvbXBpbGUgd2FybmluZ3MgaW4gaHdwcm9iZQogICAgaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9yaXNjdi9jL2I5MWMyNmZkYjBlOAogIC0gWzIvNV0gdG9vbHM6IHNlbGZ0
ZXN0czogcmlzY3Y6IEZpeCBjb21waWxlIHdhcm5pbmdzIGluIGNibwogICAgaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9yaXNjdi9jL2FjN2IyYTAyZDYyZgogIC0gWzMvNV0gdG9vbHM6IHNlbGZ0ZXN0
czogcmlzY3Y6IEFkZCBtaXNzaW5nIGluY2x1ZGUgZm9yIHZlY3RvciB0ZXN0CiAgICBodHRwczov
L2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvYjI1MGM5MDg5ODQxCiAgLSBbNC81XSB0b29sczogc2Vs
ZnRlc3RzOiByaXNjdjogRml4IGNvbXBpbGUgd2FybmluZ3MgaW4gdmVjdG9yIHRlc3RzCiAgICBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvZTFiYWY1ZTY4ZWQxCiAgLSBbNS81XSB0b29s
czogc2VsZnRlc3RzOiByaXNjdjogRml4IGNvbXBpbGUgd2FybmluZ3MgaW4gbW0gdGVzdHMKICAg
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy8xMmMxNjkxOTY1MmIKCllvdSBhcmUgYXdl
c29tZSwgdGhhbmsgeW91IQotLSAKRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9r
b3JnLmRvY3Mua2VybmVsLm9yZy9wYXRjaHdvcmsvcHdib3QuaHRtbAoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
