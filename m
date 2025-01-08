Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C2DE77188
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 18:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w+BPvppJAt0wvC1KaWkMCAXUNrQWm4QD1lrzflpjlBw=; b=ppguc+kn6rWdXs
	Qhv+dZ7+3BGDqn67awDRINfBgdCVIwzzQxtvIoPAjjmjOX0+msea8WVnL/2fgr+tuvE3GbpGT+WFy
	aBiCtobvxr4lXKv1Su3uMII554dTm3sGJFv/ZEgvFqL3jXgNbsKunQhiLb3kNWVYasCt9tes//sOm
	m/ZvzmyM+SKxtYDBtoH0uuuQSS7y1u1gnujCLtc2j2wiprsJQc/uCgI1FFFiAvwKXaij9Tobhkl49
	2TgjtpaXux+AFudF5IChgfC1Q2xbDBpjViN6n6MBa24FSfnuMf4QN55Si8Hspy2tG82cWExdLwhh4
	vYPDoNqL6hmH86Pc03PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVafh-00000009VME-2i9L;
	Wed, 08 Jan 2025 18:20:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVaff-00000009VLO-11p2
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jan 2025 18:20:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DED78A41502;
	Wed,  8 Jan 2025 18:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD61C4CED3;
	Wed,  8 Jan 2025 18:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736360446;
	bh=q6+aG3vfylT8FjOjczPsjWU9/3/Zl6eXZowl2wc5e70=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WMLPCBxVq2PB87kBc4QyF2TX7pldv+33KbA7HOLURDyJ9VZJonDyqAN+79PSTPmqS
	 CXWX+8zx3dsMzcz3QECPZIEh+oQI9FCvcdvr6fZdBJcj2K+zKjBEEZyVleVvrls/cW
	 f9qFLSHRonp6VwSIeulTIlIqLqRxRJ7R0jqb6OOVBl+BOaO39akAiUCYfjAe/gDPif
	 rI24RAPvQT1g8U9Lqqrtn55PUvTmHBYK4TyPMLYBJQxaD9S5aeRPzZmkWvFjrcJv93
	 Xz6jCUo/VGRKcFCA62HBaZ15Wn+K1FjUIBRz7H+QuAS+ZmB+tlnDzJvE8a+O0Wj5fW
	 V6eCEsxd9z4Eg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB39D380A965;
	Wed,  8 Jan 2025 18:21:08 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6] riscv: selftests: Fix warnings pointer masking test
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173636046749.736486.2528657694526835016.git-patchwork-notify@kernel.org>
Date: Wed, 08 Jan 2025 18:21:07 +0000
References: <20241211-fix_warnings_pointer_masking_tests-v6-1-c7ae708fbd2f@rivosinc.com>
In-Reply-To: <20241211-fix_warnings_pointer_masking_tests-v6-1-c7ae708fbd2f@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, shuah@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, samuel.holland@sifive.com,
 ajones@ventanamicro.com, alex@ghiti.fr, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, palmer@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_102047_343177_1C169F3D 
X-CRM114-Status: UNSURE (   8.61  )
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
CmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIFdlZCwgMTEgRGVj
IDIwMjQgMjM6MDE6NDMgLTA4MDAgeW91IHdyb3RlOgo+IFdoZW4gY29tcGlsaW5nIHRoZSBwb2lu
dGVyIG1hc2tpbmcgdGVzdHMgd2l0aCAtV2FsbCB0aGlzIHdhcm5pbmcKPiBpcyBwcmVzZW50Ogo+
IAo+IHBvaW50ZXJfbWFza2luZy5jOiBJbiBmdW5jdGlvbiDigJh0ZXN0X3RhZ2dlZF9hZGRyX2Fi
aV9zeXNjdGzigJk6Cj4gcG9pbnRlcl9tYXNraW5nLmM6MjAzOjk6IHdhcm5pbmc6IGlnbm9yaW5n
IHJldHVybiB2YWx1ZSBvZiDigJhwd3JpdGXigJkKPiBkZWNsYXJlZCB3aXRoIGF0dHJpYnV0ZSDi
gJh3YXJuX3VudXNlZF9yZXN1bHTigJkgWy1XdW51c2VkLXJlc3VsdF0KPiAgIDIwMyB8ICAgICAg
ICAgcHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOyB8Cj4gICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+IHBvaW50ZXJfbWFza2luZy5jOjIwODo5OiB3YXJuaW5nOgo+IGlnbm9yaW5nIHJldHVy
biB2YWx1ZSBvZiDigJhwd3JpdGXigJkgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUKPiDigJh3YXJu
X3VudXNlZF9yZXN1bHTigJkgWy1XdW51c2VkLXJlc3VsdF0KPiAgIDIwOCB8ICAgICAgICAgcHdy
aXRlKGZkLCAmdmFsdWUsIDEsIDApOwo+IAo+IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdp
dGggbGlua3M6CiAgLSBbdjZdIHJpc2N2OiBzZWxmdGVzdHM6IEZpeCB3YXJuaW5ncyBwb2ludGVy
IG1hc2tpbmcgdGVzdAogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzQ5OGQ1YjE0
ZGI4YwoKWW91IGFyZSBhd2Vzb21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3QtZG90LCBJIGFt
IGEgYm90LgpodHRwczovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5odG1s
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
