Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E023E70713
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 10:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f0pKlCZQe4tD4pL0QN01VrH0Mnrq+dcZ4ypOfAH02Zc=; b=Ptsfiob1BNHVMV
	oSgMozBSVVVfHYZ1GnHrXyn5fDTPK/7IMVVwj0ldLfAc2NymE1UGcwnUfLc0Nu8r+Dc3dDEBN30Ps
	Q+bzfnRz4Wr8D57YKdbFfnRSX+QhTFqLokjhEXopzlV5WDKMYyn5ixgujIMmpBExHLgrAfvI79fBG
	ipwG3g0gpvYzs9kmndLHJlvmpTdaDGRBloPMd+nrnC4MpXrkWi59vu17KdoYBG4qPDf7kW+2+Iby9
	g/eq4frkjmj5sf6so/rRRezMBhg6QrI6oiqibvW0NpI4YncYeN68WEaCfAhgTD8VqNprV9HOgPeEf
	qfs7hmjNgsaS/IoiZteA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjHGO-005rEq-1r;
	Thu, 21 Sep 2023 10:50:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjHGL-005rET-1B
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 10:50:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A571A61EE4;
	Thu, 21 Sep 2023 10:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3349C4AF74;
	Thu, 21 Sep 2023 10:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695293424;
	bh=yzRcHLbR5HG/J4cNCXnrVt/lngYoOjtJirNRF+1vitY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ssVvpTD2Nabr/adKevwcFm2K7fPZgBABoPce84Zyj0FQcMHdgii9A5tprQiCB4+RC
	 doQSNBxrBzeuytOICCS3G7sYH7VHvEfqTG3u0LRw2qFb8vghozBtCCDluv0XLAnNiE
	 RHtpAEUE8jKJbemL60YbLuun0y3gFnxzIZJQNCY0w+vkROHI6BhS02oOqr80ewPer/
	 PLk6jODyacBUc6WhYBCx7QZhBN8oixTNJLTz8gwUhlVkqKrKa+esgESHIS0E2mS8gb
	 lhUAWDOFHAxG7Kny4pHGlS+KU5tbwYd3xyD2pS5HIL7N5ewfagQzpHBXpvj7Tr4984
	 KPPSfujLwwJIA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DFDECC43170;
	Thu, 21 Sep 2023 10:50:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] riscv: Only consider swbp/ss handlers for correct
 privileged mode
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169529342391.31237.16052864619241534837.git-patchwork-notify@kernel.org>
Date: Thu, 21 Sep 2023 10:50:23 +0000
References: <20230912065619.62020-1-bjorn@kernel.org>
In-Reply-To: <20230912065619.62020-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org,
 bjorn@rivosinc.com, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, namcaov@gmail.com, puranjay12@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_035025_469309_4861B33F 
X-CRM114-Status: GOOD (  10.78  )
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
CmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIFR1ZSwgMTIgU2Vw
IDIwMjMgMDg6NTY6MTkgKzAyMDAgeW91IHdyb3RlOgo+IEZyb206IEJqw7ZybiBUw7ZwZWwgPGJq
b3JuQHJpdm9zaW5jLmNvbT4KPiAKPiBSSVNDLVYgc29mdHdhcmUgYnJlYWtwb2ludCB0cmFwIGhh
bmRsZXJzIGFyZSB1c2VkIGZvciB7ayx1fXByb2Jlcy4KPiAKPiBXaGVuIHRyYXBwaW5nIGZyb20g
a2VybmVsbW9kZSwgb25seSB0aGUga2VybmVsbW9kZSBoYW5kbGVycyBzaG91bGQgYmUKPiBjb25z
aWRlcmVkLiBWaWNlIHZlcnNhLCBvbmx5IHVzZXJtb2RlIGhhbmRsZXJzIGZvciB1c2VybW9kZQo+
IHRyYXBzLiBUaGlzIGlzIG5vdCB0aGUgY2FzZSBvbiBSSVNDLVYsIHdoaWNoIGNhbiB0cmlnZ2Vy
IGEgYnVnIGlmIGEKPiB1c2Vyc3BhY2UgcHJvY2VzcyB1c2VzIHVwcm9iZXMsIGFuZCBhIFdBUk4o
KSBpcyB0cmlnZ2VyZWQgZnJvbQo+IGtlcm5lbG1vZGUgKHdoaWNoIGlzIGltcGxlbWVudGVkIHZp
YSB7Yy4sfWVicmVhaykuCj4gCj4gWy4uLl0KCkhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5r
czoKICAtIFt2M10gcmlzY3Y6IE9ubHkgY29uc2lkZXIgc3dicC9zcyBoYW5kbGVycyBmb3IgY29y
cmVjdCBwcml2aWxlZ2VkIG1vZGUKICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy85
ZjU2NGI5MmNmNmQKCllvdSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQotLSAKRGVldC1kb290LWRv
dCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9wYXRjaHdvcmsvcHdi
b3QuaHRtbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
