Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CACC636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 15:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0DZCWUInnDiPQy74y+vxPjmADLDuf0H/907FsoFTH6E=; b=PGAaCnyhA8ochQ
	DNRs6Ri0hqrmOZBF8YgH4g/1xtK3fDsUdiMazkDcVPq3kKzXgLXA7I3bY+Q9/xBjlh88iSmkVqthO
	SKbsWabRwQT1xn9JAemSO5mRKymyvzwdRNujMEN/u4T0sxm6IAQIVeYO3+f41lBn3mjViA+eMNqAV
	rqBLEAdmf1ndiU9NHuQWdhNuANUsiQ6KN/0sCGg1q2XeVjucDgwhFcIR8JKblPwHsbdI0LASTB89j
	F4lvwQhL4dnnwqYAFDdcwbHdR6jOLwyykYws1cSSjvaXuObmaPVP2gB5Je9vg/XQn2S7liuetkH/P
	1RC4IoydeXSAMgP7NIVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJiw-006OM7-MO; Wed, 15 Feb 2023 15:29:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJit-006OLh-2z
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 15:29:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4C355B82235;
	Wed, 15 Feb 2023 15:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98969C433EF;
	Wed, 15 Feb 2023 15:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676474967;
	bh=rEzQKx+wJrHj76zdqFqQEU2CVrCOZPCAoVZj5KBgO1Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=N1CEDQhLA+LBmFw9YASuYhkWV7N2gB+07dG7irjqh+7o8eFyK3WRMp4idQmddTEJJ
	 KHLtA7a5Krn6c1OFgDPFMlr8k+3E63WET1SVo/dSBCcqU+kFYvb9LkW1Mg6/iPeHuV
	 xB/H0ucMJRNuTDJia/i60Md9bpqZ0kygeT4J7e91zQyNzlUrRj2w+ccLktYo/YEc6X
	 xpTWEUpqwB6AbUInEmYYLPvUcxFwAfxgNDssZX+jW1hjF/mukuNg64zWWmmawiHwEs
	 FakDwDtNWhq0ggsY/cjuq8MbPRmGPP/uBOBOYXDME1OYKEIVW2AbAvwQOAyyLi33/a
	 8ngnERXOjIWfQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Mattias Nissler <mnissler@rivosinc.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Mattias Nissler <mnissler@rivosinc.com>
Subject: Re: [PATCH] riscv: Avoid enabling interrupts in die()
In-Reply-To: <20230215144828.3370316-1-mnissler@rivosinc.com>
References: <20230215144828.3370316-1-mnissler@rivosinc.com>
Date: Wed, 15 Feb 2023 16:29:25 +0100
Message-ID: <87sff7lzfu.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_072931_298416_B26FCF16 
X-CRM114-Status: UNSURE (   7.89  )
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

TWF0dGlhcyBOaXNzbGVyIDxtbmlzc2xlckByaXZvc2luYy5jb20+IHdyaXRlczoKCj4gV2hpbGUg
d29ya2luZyBvbiBzb21ldGhpbmcgZWxzZSwgSSBub3RpY2VkIHRoYXQgdGhlIGtlcm5lbCB3b3Vs
ZCBzdGFydAo+IGFjY2VwdGluZyBpbnRlcnJ1cHRzIGFnYWluIGFmdGVyIGNyYXNoaW5nIGluIGFu
IGludGVycnVwdCBoYW5kbGVyLiBTaW5jZQo+IHRoZSBrZXJuZWwgaXMgYWxyZWFkeSBpbiBpbmNv
bnNpc3RlbnQgc3RhdGUsIGVuYWJsaW5nIGludGVycnVwdHMgaXMKPiBkYW5nZXJvdXMgYW5kIG9w
ZW5zIHVwIHJpc2sgb2Yga2VybmVsIHN0YXRlIGRldGVyaW9yYXRpbmcgZnVydGhlci4KPiBJbnRl
cnJ1cHRzIGRvIGdldCBlbmFibGVkIHZpYSB3aGF0IGxvb2tzIGxpa2UgYW4gdW5pbnRlbmRlZCBz
aWRlIGVmZmVjdCBvZgo+IHNwaW5fdW5sb2NrX2lycSwgc28gc3dpdGNoIHRvIHRoZSBtb3JlIGNh
dXRpb3VzCj4gc3Bpbl9sb2NrX2lycXNhdmUvc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSBpbnN0ZWFk
Lgo+Cj4gRml4ZXM6IDc2ZDJhMDQ5M2ExNyAoIlJJU0MtVjogSW5pdCBhbmQgSGFsdCBDb2RlIikK
PiBTaWduZWQtb2ZmLWJ5OiBNYXR0aWFzIE5pc3NsZXIgPG1uaXNzbGVyQHJpdm9zaW5jLmNvbT4K
Ck5pY2UgY2F0Y2ghCgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9y
Zz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
