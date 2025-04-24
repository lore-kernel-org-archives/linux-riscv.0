Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24277C369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 21:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rkE2rBUcV3Hqm9iHcNjnKcdYTYpPzpxHKCjYwX/LAVg=; b=qh1hyeuQ093Jx1
	Ywmmvk4YobIEjcRFjyWiVhYMWrih0etk3kIVb+W1K3zBmjyo6vHwACW9uLTMIRujiJ5kj4iG7oTlr
	8BBRvl+JDyWjpm4fPqEetaueCa1CA47VCXgE9bYlCfUXfHJEx3bwgc403mvhRTOnQ2hc3olntyRlO
	oE95/0pcLMjXQSfGi/6/uMr2CmN/YwwQJwaj04KL6Poi+qXzrnngN2fuJbrM5MletEEHkpiOtYlQ0
	YhV2aQce+sC2hpN9NSQwaG8mBTZYRobPGOlKQIb/kzLX8LSPJP4RIi6ALS0XV+Bp5DSc0gmVkqy49
	a5jlkgyyinWMtduAPuJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u84G7-0000000FQOc-1QT2;
	Thu, 24 Apr 2025 21:37:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u83Ee-0000000FLWl-0SXP
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 20:31:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A98049B66;
	Thu, 24 Apr 2025 20:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D533C4CEE3;
	Thu, 24 Apr 2025 20:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745526709;
	bh=GXdHlncMv9ouLPoqZADiAiq08DWlsnhc23MqsSVZFRI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=n2SRC5+cvy7e4ZPJlFpABzK8SzX2aAEI90mF5TgRUE2Nud989eLk8M4QBgjq8IsXQ
	 YDQYlRbr7tTmdc5GQqhfXut+EYlLUkOGlQTvJLN/sgKSeQe8cuMMVh1CNHI/jpc47S
	 mTscIsPNF+4s85AqSm3nIVmV7qkSlDkVweINy1bqUsffH6FxxVHJ75EnBSD5UtNyaw
	 geFWrH9tQRLf/LAoKr4m7c80dEaeUTC0R9x1143ofRgl4lcW/T4ruFvgmn8luJ/5VJ
	 Y8NEI96BLd8vFPOCrQs5I3TpoQcxT6DKNsjJn7mgLfWlvJM7m4fdXwIASBzLRMKKJ7
	 1C3ZE2HcfGNpA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E40380CFD9;
	Thu, 24 Apr 2025 20:32:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH fixes v2 1/2] riscv: Replace function-like macro by static
 inline function
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174552674825.3483225.10896050334929236993.git-patchwork-notify@kernel.org>
Date: Thu, 24 Apr 2025 20:32:28 +0000
References: <20250419111402.1660267-1-bjorn@kernel.org>
In-Reply-To: <20250419111402.1660267-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alex@ghiti.fr, guoren@kernel.org,
 samuel.holland@sifive.com, bjorn@rivosinc.com, mhiramat@kernel.org,
 oleg@redhat.com, peterz@infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_133152_164932_6B2984AB 
X-CRM114-Status: UNSURE (   7.51  )
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

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byByaXNjdi9saW51eC5naXQgKGZpeGVz
KQpieSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT46CgpPbiBTYXQsIDE5IEFw
ciAyMDI1IDEzOjEzOjU5ICswMjAwIHlvdSB3cm90ZToKPiBGcm9tOiBCasO2cm4gVMO2cGVsIDxi
am9ybkByaXZvc2luYy5jb20+Cj4gCj4gVGhlIGZsdXNoX2ljYWNoZV9yYW5nZSgpIGZ1bmN0aW9u
IGlzIGltcGxlbWVudGVkIGFzIGEgImZ1bmN0aW9uLWxpa2UKPiBtYWNybyB3aXRoIHVudXNlZCBw
YXJhbWV0ZXJzIiwgd2hpY2ggY2FuIHJlc3VsdCBpbiAidW51c2VkIHZhcmlhYmxlcyIKPiB3YXJu
aW5ncy4KPiAKPiBSZXBsYWNlIHRoZSBtYWNybyB3aXRoIGEgc3RhdGljIGlubGluZSBmdW5jdGlv
biwgYXMgYWR2aXNlZCBieQo+IERvY3VtZW50YXRpb24vcHJvY2Vzcy9jb2Rpbmctc3R5bGUucnN0
Lgo+IAo+IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSBbZml4ZXMs
djIsMS8yXSByaXNjdjogUmVwbGFjZSBmdW5jdGlvbi1saWtlIG1hY3JvIGJ5IHN0YXRpYyBpbmxp
bmUgZnVuY3Rpb24KICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy8xMjFmMzQzNDFk
MzkKICAtIFtmaXhlcyx2MiwyLzJdIHJpc2N2OiB1cHJvYmVzOiBBZGQgbWlzc2luZyBmZW5jZS5p
IGFmdGVyIGJ1aWxkaW5nIHRoZSBYT0wgYnVmZmVyCiAgICBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3Jpc2N2L2MvN2QxZDE5YTExY2ZiCgpZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKLS0gCkRl
ZXQtZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy5kb2NzLmtlcm5lbC5vcmcvcGF0
Y2h3b3JrL3B3Ym90Lmh0bWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
