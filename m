Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF016C636D6
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 15:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W07wM2+Ib4oI10BpqEhT+3s1MVFwXyQl4VOU9ZSola0=; b=lh2RQivCMlhDmO
	gLQFdiNJx2sT024cnudSIQd9XPNDHThR7Hb0ACWMpNXVLwV7JASlxZFvC4cbaWC9VcLuwPpM+rMr/
	IXEkJkLMjH5upL5/05LkfEWgC2A44nHnVt7OyOqpQ/D2R/F7sCXXbxSXsXRu3Nawk2Il0XBTWhe7Z
	W/8XxuYrkxpy+MmF2RSOvEEAK5/nDzpCqOGPDITWSlkqwwtsJMqC/+wEukw0MOdhvSVeYzm643xsY
	ITIwYzPt1WV5yxNfhQ2QKwy0KRLKIMIvGdC86mU8QxMTPp8+JFESKcokI+fNUBdDmH3z76sPfGNUA
	GIeoSPHWMuvHxjliw/4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqbg-00Cm92-Bu; Wed, 22 Feb 2023 15:00:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqbZ-00Cm54-2M
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 15:00:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D2C63614B2;
	Wed, 22 Feb 2023 15:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66797C43443;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677078022;
	bh=0oDUe0Xt/tqWs2ZxwJwubY6IyWBJxtkUnsBIUqtVhWM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kV9DJquxEHU02JBWtaMKauDl9LVCTnoMmVVWpipucOh1AnDtdGGttPPtWXKd3hJMH
	 RS5V9w+khbSkP6XQGVjBDXknt5dHLcPAuEMeTgZcJTjHwmEVKYItJDtJCKRQeYTMML
	 MRxJxzHS2ANxRXj/iiUkNOk5wkJH/GEDfgIKweqLoi83i5YoTaqA3cMSLZrr0Uo3hp
	 HwWDsYxgu8N2xlPzpwbJyL+GkkZAtCZou9e4P8bwHBMW4TanRlEl+NuuJlZ76Flam6
	 n2l7Q9ODHLfjJFGNkuPvXvjTDJkqt5OsdeJi5HpnxXcPFXzqBuh+F5iqIni6O8piZ0
	 V1PaeNRT92T2g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 422D0E270E2;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv, mm: Perform BPF exhandler fixup on page fault
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167707802226.24438.2156387825530343210.git-patchwork-notify@kernel.org>
Date: Wed, 22 Feb 2023 15:00:22 +0000
References: <20230214162515.184827-1-bjorn@kernel.org>
In-Reply-To: <20230214162515.184827-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, bjorn@rivosinc.com,
 bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_070025_251279_4266F8CC 
X-CRM114-Status: UNSURE (   8.96  )
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
eHQpCmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIFR1ZSwgMTQg
RmViIDIwMjMgMTc6MjU6MTUgKzAxMDAgeW91IHdyb3RlOgo+IEZyb206IEJqw7ZybiBUw7ZwZWwg
PGJqb3JuQHJpdm9zaW5jLmNvbT4KPiAKPiBDb21taXQgMjE4NTVjYWM4MmQzICgicmlzY3YvbW06
IFByZXZlbnQga2VybmVsIG1vZHVsZSB0byBhY2Nlc3MgdXNlcgo+IG1lbW9yeSB3aXRob3V0IHVh
Y2Nlc3Mgcm91dGluZXMiKSBhZGRlZCBlYXJseSBleGl0cy9kZWF0aHMgZm9yIHBhZ2UKPiBmYXVs
dHMgc3RlbW1pbmcgZnJvbSBhY2Nlc3NlcyB0byB1c2VyLXNwYWNlIHdpdGhvdXQgdXNpbmcgcHJv
cGVyCj4gdWFjY2VzcyByb3V0aW5lcyAod2hlcmUgc3N0YXR1cy5TVU0gaXMgc2V0KS4KPiAKPiBb
Li4uXQoKSGVyZSBpcyB0aGUgc3VtbWFyeSB3aXRoIGxpbmtzOgogIC0gcmlzY3YsIG1tOiBQZXJm
b3JtIEJQRiBleGhhbmRsZXIgZml4dXAgb24gcGFnZSBmYXVsdAogICAgaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9yaXNjdi9jLzQxNjcyMWZmMDVmZAoKWW91IGFyZSBhd2Vzb21lLCB0aGFuayB5b3Uh
Ci0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90LgpodHRwczovL2tvcmcuZG9jcy5rZXJuZWwu
b3JnL3BhdGNod29yay9wd2JvdC5odG1sCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
