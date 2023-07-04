Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8448DEB64DD
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 15:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Q1pIffPIY9hTjSkjrY+Ai+EtpsIRG1buZCwhdVdU1Y=; b=0z3rf/Pi5Z54Km
	f6kD4WrVPrTB+q3FnCSWcqWcsTK3qWW3QAbhWgMWly6xOAuepGmidb1nvoAao7Goc8Pktav1mN45k
	i8PwkqP+6a6/7M4i3geSZXZkbyT9zOJHHFCUFKix4lCdoc1Qt2yoE5B6hyheHlEU4wH5M9pfjOdUZ
	uwpQ7ohGSbAkqe7GzYaBxG/el/LlzTaTuflt2BZJgNymBydWD0/mXTszpkqwkfq5YNQ5FUNUVbNCI
	CG8LpKoXWyPAaoznNWHdNlbGwCWA1opSo5CtNaeLT9o1geaiRME9QExoEze/y16X2/2+SdW7RdfEl
	r08Lk9Ey0PkMalH4mi/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhYB-00Dab9-1K;
	Tue, 04 Jul 2023 15:02:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhY8-00DaZ3-0a
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 15:02:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1227F61276;
	Tue,  4 Jul 2023 15:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 744BDC433CA;
	Tue,  4 Jul 2023 15:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688482952;
	bh=GanEO9tzsFXzdZ9rw5soKIvD9cv+QVE41939hvOjQVI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=E7dTPSjnlbZLMChdSSHvQ6TziYusaBUqgGgIoICKg4z1Ayh1gh7sFjPpJAsazIXSz
	 g/BVddlXf6RgvxlCCYN7yciqYDRtnLgCTSV0Sc4z5gdDVB+m3jvKtyGbLTX2X0Lnw+
	 vRwwbqwJRI3L8+brtVLd+9t15nT0XRVfeSuEkzVHIMSbuG2123S8mSir1VbloGSsgB
	 kII55jNAR3a6bCfSsxAcvqJvGoeOfLqzQXXhEQKU2ToGBpu9xDgU5Yebu3Q+ZKkraI
	 XNU7RnnsnEF6HnijSXSqmlU3OUUg28inQd/5tzMy70zPV6QJW6WvcE0kYVPqGI4/lz
	 /2YGOTZcHoTIg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 55539E5381B;
	Tue,  4 Jul 2023 15:02:32 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: Fix up some vector state related build failures
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168848295234.29521.18391408484047784927.git-patchwork-notify@kernel.org>
Date: Tue, 04 Jul 2023 15:02:32 +0000
References: <20230619172101.18692-1-palmer@rivosinc.com>
In-Reply-To: <20230619172101.18692-1-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_080240_286879_74E4FFC9 
X-CRM114-Status: UNSURE (   9.00  )
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
eHQpCmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIE1vbiwgMTkg
SnVuIDIwMjMgMTA6MjE6MDEgLTA3MDAgeW91IHdyb3RlOgo+IEkgZ2V0IGEgZmV3IGJ1aWxkIGZh
aWx1cmVzIGFsb25nIHRoZSBsaW5lcyBvZgo+IAo+IC4vYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL3NpZ2NvbnRleHQuaDoxOTozNjogZXJyb3I6IGZpZWxkIOKAmHZfc3RhdGXigJkgaGFzIGlu
Y29tcGxldGUgdHlwZQo+ICAgIDE5IHwgICAgICAgICBzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0
ZSB2X3N0YXRlOwo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
fn5+fn5+Cj4gLi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vc2lnY29udGV4dC5oOjMyOjQ5
OiBlcnJvcjogZmllbGQg4oCYc2NfZXh0ZGVzY+KAmSBoYXMgaW5jb21wbGV0ZSB0eXBlCj4gICAg
MzIgfCAgICAgICAgICAgICAgICAgc3RydWN0IF9fcmlzY3ZfZXh0cmFfZXh0X2hlYWRlciBzY19l
eHRkZXNjOwo+IAo+IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSBS
SVNDLVY6IEZpeCB1cCBzb21lIHZlY3RvciBzdGF0ZSByZWxhdGVkIGJ1aWxkIGZhaWx1cmVzCiAg
ICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvZTUwZGIzNGVmZGM4CgpZb3UgYXJlIGF3
ZXNvbWUsIHRoYW5rIHlvdSEKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8v
a29yZy5kb2NzLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3B3Ym90Lmh0bWwKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
