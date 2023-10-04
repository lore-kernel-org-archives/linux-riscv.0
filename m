Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0799E936E3
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 20:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SNGSWSqzBPQ0ksfXVKto82bxa+hwX2N2yJvYWjJJcGA=; b=nIaxu/STP3RZhs
	7zYwSZ+v4E1kwpUDu37A08eO5+MQBoJ1OWYo/cNJrWg156xmqV0IdWuHQBV6En34yKvUNkxdn4r3w
	34JDhho9kaHcgRbn3yD3h2HdUUSRFnLsA5PJIERUSaP9BZIoNEE2CIG9xM0INmHTkqYUNOh/CmnyF
	ffOi7fqaTTMBjpLPnB1nnvEL1YM+EUSE8PtS1Z0tDOG4KAuHxUd9YiZ7dPx0rXo+7loE3o81teqDi
	Uk9rEG1htj3KvfB+f12f9mqq3g4C3j8Js7LJqs7r2FXGJiYrixKDNroc5emvSFN/7QjqlOuIoH3Sa
	Pgho6S8x8GJgHfy3PHwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo8fa-000sY0-1T;
	Wed, 04 Oct 2023 20:40:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo8fX-000sWl-22
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 20:40:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C6EF5CE1EFE;
	Wed,  4 Oct 2023 20:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34070C433C7;
	Wed,  4 Oct 2023 20:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696452028;
	bh=9yZh2beLb9G2aKpM6U7zBwPSD2FoKcYtlW6kX68GteU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GpfoRLTt6lNmVwofbWMhFGJxZ82HcDCnBclDn3BiHTGVC2EMtiOR6DfEUsPdCfzUw
	 cfVlMOixBU8LEKwB8yg1gvR/3BWMeE5zwvyBhv02z3h9DlMLEBJe2OjOYcOL56Stsy
	 8F3eOcxrVdyiiDdD1vx18RRAF8tKPyefmV3OleIjCDkjvavNSNE3w2VucDIe4rGxS4
	 Mj46nrbflO6qS+K9Sz04L5NIQI5CIEHQWAoa5znvmoQxlj829ML08rd/VS3JTWGKMN
	 M3Y6zdnYdHeLFrZmTA4YgYm8cW5GHfjxhpCnHA5JM5m6OAUAOHM3GU3JHu6AyxUeVD
	 fY9z58Em1TiIA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 158A0C595D2;
	Wed,  4 Oct 2023 20:40:28 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next 0/3] selftest/bpf,
 riscv: Improved cross-building support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169645202808.14504.11589049001858545591.git-patchwork-notify@kernel.org>
Date: Wed, 04 Oct 2023 20:40:28 +0000
References: <20231004122721.54525-1-bjorn@kernel.org>
In-Reply-To: <20231004122721.54525-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, mykolal@fb.com,
 bpf@vger.kernel.org, netdev@vger.kernel.org, bjorn@rivosinc.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_134031_844324_EE31F9C1 
X-CRM114-Status: UNSURE (   6.39  )
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

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byBicGYvYnBmLW5leHQuZ2l0IChtYXN0
ZXIpCmJ5IEFuZHJpaSBOYWtyeWlrbyA8YW5kcmlpQGtlcm5lbC5vcmc+OgoKT24gV2VkLCAgNCBP
Y3QgMjAyMyAxNDoyNzoxOCArMDIwMCB5b3Ugd3JvdGU6Cj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8
Ympvcm5Acml2b3NpbmMuY29tPgo+IAo+IFlldCBhbm90aGVyICJtb3JlIGNyb3NzLWJ1aWxkaW5n
IHN1cHBvcnQgZm9yIFJJU0MtViIgc2VyaWVzLgo+IAo+IEFuIGV4YW1wbGUgaG93IHRvIGludm9r
ZSBhIGdlbl90YXIgYnVpbGQ6Cj4gCj4gICB8IG1ha2UgQVJDSD1yaXNjdiBDUk9TU19DT01QSUxF
PXJpc2N2NjQtbGludXgtZ251LSBDQz1yaXNjdjY0LWxpbnV4LWdudS1nY2MgXAo+ICAgfCAgICBI
T1NUQ0M9Z2NjIE89L3dvcmtzcGFjZS9rYnVpbGQgRk9STUFUPSBcCj4gICB8ICAgIFNLSVBfVEFS
R0VUUz0iYXJtNjQgaWE2NCBwb3dlcnBjIHNwYXJjNjQgeDg2IHNneCIgLWogJCgoJChucHJvYykt
MSkpIFwKPiAgIHwgICAgLUMgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMgZ2VuX3Rhcgo+IAo+IFsu
Li5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSBbYnBmLW5leHQsMS8zXSBz
ZWxmdGVzdHMvYnBmOiBBZGQgY3Jvc3MtYnVpbGQgc3VwcG9ydCBmb3IgdXJhbmRvbV9yZWFkIGV0
IGFsCiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2JwZi9icGYtbmV4dC9jLzk3YTc5ZTUwMmUy
NQogIC0gW2JwZi1uZXh0LDIvM10gc2VsZnRlc3RzL2JwZjogRW5hYmxlIGxsZCB1c2FnZSBmb3Ig
UklTQy1WCiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2JwZi9icGYtbmV4dC9jLzcyZmFlNjMx
OTk2MgogIC0gW2JwZi1uZXh0LDMvM10gc2VsZnRlc3RzL2JwZjogQWRkIHVwcm9iZV9tdWx0aSB0
byBnZW5fdGFyIHRhcmdldAogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9icGYvYnBmLW5leHQv
Yy9lMDk2YWI5ZDlmNDUKCllvdSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQotLSAKRGVldC1kb290
LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9wYXRjaHdvcmsv
cHdib3QuaHRtbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
