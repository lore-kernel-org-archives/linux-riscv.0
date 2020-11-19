Return-Path: <SRS0=5I1x=EZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACD3C5519F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 02:00:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3586246D1
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 02:00:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kt6TqnmG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IfNsNGqL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3586246D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/T5FcHmkx4HsR+UYNZqfGzhv9eS/8hS4ATqHMC54+AQ=; b=Kt6TqnmGTkPNjyCCqQZ4hzLyP
	fPxi89sMJIuMayvFeMICSQgUe3JBcouJxPKoMmbEO0HH98R+K9s0S641TedlxNi36QEgwh4Ct7bji
	EHyGBOWoKDkZFpcvsj6WxcyWx8VS8gvQkaHRiIRfZifPd5kPMCZpKdUYm2xg6YXIWmF8wneLi/D5s
	0xoGs4YNkwpSSKghTrEulrsh2gp6yVtYzmye3ALX+tFdiEmkx8gKpk4GOYhjkvpi5xCsO3aI2qz9N
	brljmnJi8cLETLAIIO9iUEzVx5fZPNp2/3RA+Awc9mjDuuITOlNbzOUTsu/NjZEV+WkEbJiChc1ik
	/P0kepHEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfZF8-0004FW-NQ; Thu, 19 Nov 2020 02:00:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfZF3-0004F9-CD
 for linux-riscv@lists.infradead.org; Thu, 19 Nov 2020 02:00:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605751206;
 bh=IF109IuW33A32oN56MmCn4OdUieDnOvrSzFgXKKeaww=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=IfNsNGqL8P6/0ZS8CPrApiyHyaVvEEREcGBNiCui45PTXIU05h/3C47/2EcSrksr5
 ep2fZfXELDpxFiDXabdPQYkkASBZ90Hoxl4eLiG2HiytLIp0KaElM7dJMY80bj2kSt
 a0w6rVGXKMrvWDobpQRVlPiS+jgybFYKmEvmAzk8=
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 0/3] RISC-V selftest/bpf fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <160575120591.17801.17784029868149830449.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2020 02:00:05 +0000
References: <20201118071640.83773-1-bjorn.topel@gmail.com>
In-Reply-To: <20201118071640.83773-1-bjorn.topel@gmail.com>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm4udG9wZWxAZ21haWwuY29tPg==?=@ci.codeaurora.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_210009_550750_8A809160 
X-CRM114-Status: UNSURE (   6.59  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: daniel@iogearbox.net, luke.r.nels@gmail.com, netdev@vger.kernel.org,
 ast@kernel.org, bpf@vger.kernel.org, andrii.nakryiko@gmail.com,
 linux-riscv@lists.infradead.org, xi.wang@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byBicGYvYnBmLW5leHQuZ2l0IChyZWZz
L2hlYWRzL21hc3Rlcik6CgpPbiBXZWQsIDE4IE5vdiAyMDIwIDA4OjE2OjM3ICswMTAwIHlvdSB3
cm90ZToKPiBUaGlzIHNlcmllcyBjb250YWluIHNvbWUgZml4ZXMgZm9yIHNlbGZ0ZXN0cy9icGYg
d2hlbiBidWlsZGluZy9ydW5uaW5nCj4gb24gYSBSSVNDLVYgaG9zdC4gRGV0YWlscyBjYW4gYmUg
Zm91bmQgaW4gZWFjaCBpbmRpdmlkdWFsIGNvbW1pdC4KPiAKPiAKPiBDaGVlcnMsCj4gQmrDtnJu
Cj4gCj4gWy4uLl0KCkhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKICAtIFticGYtbmV4
dCx2MiwxLzNdIHNlbGZ0ZXN0cy9icGY6IEZpeCBicm9rZW4gcmlzY3YgYnVpbGQKICAgIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvYnBmL2JwZi1uZXh0L2MvNjAxNmRmOGZlODc0CiAgLSBbYnBmLW5l
eHQsdjIsMi8zXSBzZWxmdGVzdHMvYnBmOiBBdm9pZCBydW5uaW5nIHVucHJpdmlsZWdlZCB0ZXN0
cyB3aXRoIGFsaWdubWVudCByZXF1aXJlbWVudHMKICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
YnBmL2JwZi1uZXh0L2MvYzc3YjA1ODljYTI5CiAgLSBbYnBmLW5leHQsdjIsMy8zXSBzZWxmdGVz
dHMvYnBmOiBNYXJrIHRlc3RzIHRoYXQgcmVxdWlyZSB1bmFsaWduZWQgbWVtb3J5IGFjY2Vzcwog
ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9icGYvYnBmLW5leHQvYy82MDA3YjIzY2M3NTUKCllv
dSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQotLQpEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90Lgpo
dHRwczovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5odG1sCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
