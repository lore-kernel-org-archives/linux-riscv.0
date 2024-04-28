Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABF6C10F1A
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Apr 2024 22:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kklIYffzJmhIsLo6doMQxKvH8fSFX3eQBHMZdCqOI8=; b=1+FyYbHR9dGQsN
	vPYZH+pAexbsvuBhYktiLDgTMcUA9/hRlXgt1sk+N5/qy9G/YHbvBKcGxKO34LrlXwZcrX/sdiwqh
	ioMBrppHkvdW+Ensgprpdd2LRScMTDnLze55GxlKK1GLIGjMgYPFh5uJJHY7SSMt2LARWEcgq66/q
	x4tnGtaCR3V1hU1yHvx+FwjPonwJxrvTiaxBggsDiS5l1blYNoF+zyubld0S2IfnVoraqrLUVSVxS
	bKr1f72fgpb84k8zfxPWdz6iuUcMBUcr+jjAiVTzjTE+V1pSfe6/pMNpTx7XOt0uansKLxLnUSwtX
	X/2sZoqofjLI0ULGRZlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1CZm-00000000nr6-2DEU;
	Sun, 28 Apr 2024 22:00:50 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1CZZ-00000000nj0-2fm8
	for linux-riscv@lists.infradead.org;
	Sun, 28 Apr 2024 22:00:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9E515CE0A21;
	Sun, 28 Apr 2024 22:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C455FC4AF18;
	Sun, 28 Apr 2024 22:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714341634;
	bh=dcRqllzvCViq7JroGLfFRXWzRjL6MWy0dXcchL9hte8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kELx0uKi/H6bF9F8IQEsxAQ9T2dAnlx1PbdCIu98xcGm9MjoIRLYSKIsKVVmNwfRP
	 2JfASZ8kxefbl2gMOSF68JtoDFKejRMSH5Gs4UzW429IWKbowqj/8Ay3J1iu9yC49/
	 F0xzk6jNXDxTmE0lHLdirvgKp1nmE9/SzLlYQjtiavaiOfMGvuT9c561oDtcUFsu16
	 6OCXvwrgSy+bVIDmDxFZJhqdAXTUskIe+9m7x484damGNUrtxzgvj/tNQi43QXIS0p
	 7egOTOBaYK3n6DROAglIgSkcOrOah48QT+WyTGDmULo5NpHbMTkk63eKGXZrIl3nsT
	 jPgwCmh9egPsw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B986CC4361C;
	Sun, 28 Apr 2024 22:00:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: hwprobe: export Zihintpause ISA extension
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171434163475.22130.3242508482383867837.git-patchwork-notify@kernel.org>
Date: Sun, 28 Apr 2024 22:00:34 +0000
References: <20240221083108.1235311-1-cleger@rivosinc.com>
In-Reply-To: <20240221083108.1235311-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rehn@rivosinc.com, atishp@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_150037_871107_B95B1288 
X-CRM114-Status: UNSURE (   5.98  )
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
eHQpCmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIFdlZCwgMjEg
RmViIDIwMjQgMDk6MzE6MDYgKzAxMDAgeW91IHdyb3RlOgo+IEV4cG9ydCB0aGUgWmloaW50cGF1
c2UgSVNBIGV4dGVuc2lvbiB0aHJvdWdoIGh3cHJvYmUgd2hpY2ggYWxsb3dzIHVzaW5nCj4gInBh
dXNlIiBpbnN0cnVjdGlvbnMuIFNvbWUgdXNlcnNwYWNlIGFwcGxpY2F0aW9ucyAoT3BlbkpESyBm
b3IKPiBpbnN0YW5jZSkgdXNlcyB0aGlzIHRvIGhhbmRsZSBzb21lIGxvY2tpbmcgYmFjay1vZmYu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29t
Pgo+IFJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiAKPiBb
Li4uXQoKSGVyZSBpcyB0aGUgc3VtbWFyeSB3aXRoIGxpbmtzOgogIC0gW3YyXSByaXNjdjogaHdw
cm9iZTogZXhwb3J0IFppaGludHBhdXNlIElTQSBleHRlbnNpb24KICAgIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcmlzY3YvYy82M2Y5M2EzY2E4OTEKCllvdSBhcmUgYXdlc29tZSwgdGhhbmsgeW91
IQotLSAKRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVs
Lm9yZy9wYXRjaHdvcmsvcHdib3QuaHRtbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
