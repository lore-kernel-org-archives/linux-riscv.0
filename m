Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BCCCD1299
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 14:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Dzhtz3MGIKrTMbxQ0XG6iA0/TK2kwNHkblLD55yZ1E=; b=AkMpCyeSulQCRf
	L96N5JLg6bZLmBr+oTDatMtOSjhIx6l6/Gzr2uRAIajHcoHxICou43Mn9SVX5nWSze7ac40zbSBxH
	vX/OljW/6eOBVimCTrTTTsHKEmydarpnAFyctIrhOZLQxGWAZqX0piuheMHmuw/a5c8e0WoPg9MRJ
	+jo4Kb5tRlYeMqasDY7iHxGuYxUq62YyZls9dtTmis7r7TohfuAbeIFdPB80N0ZL7S/c8FSALwRLv
	qHB745fa5+/eCIpRjIvaQMDwp0qOU1cdD2er84WSM1pk1oWaPXeSRDn7dHpddCX8PMSmzZg74NA2L
	GirY4MK8hUlBG61pn5Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsOQB-000000036R6-3Q3Y;
	Thu, 04 Apr 2024 14:50:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsOQ9-000000036P0-00Yd
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 14:50:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75D3A616F1;
	Thu,  4 Apr 2024 14:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C071C43390;
	Thu,  4 Apr 2024 14:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712242228;
	bh=ku2YBuJik1s7SEiP8w3doooX/ZXddO29iUvYxp6Frm0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nPMJDeX9sGvtjPadXq7idWRrp18Bxa/O9lJLCNfNttFl6kNJ/Rxel6WpRI+UUOLGR
	 3BNc1+GEIhmovtwQXIP9jT+yuLPhBP2LDA5ZT6pq3z+cPxWiFqKYou01YVY9JrFkjK
	 jv+NuohscEc4Y0rggb7V3rAZNW2pQyZJlxS/xQ6Z6qeRDV3xLfnVWxgXDoxUS3L0mG
	 D5X33u0lPsTldX2FTmciZbxtRAf6dRs+pF0QhnizeY7gJ3Hoqvi7Ka74j0Lb5ib78D
	 6kQyBH4pka0gDPdFBmN9/cPnEkSWbhpaWPr92+PhNULdHKFwps1Fp0yy2fJXk+L3Mr
	 YO8a+BLw0bQ9g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0622AD9A150;
	Thu,  4 Apr 2024 14:50:28 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v4 0/2] bpf,riscv: Add support for BPF Arena
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171224222802.6630.17532386539061151793.git-patchwork-notify@kernel.org>
Date: Thu, 04 Apr 2024 14:50:28 +0000
References: <20240404114203.105970-1-puranjay12@gmail.com>
In-Reply-To: <20240404114203.105970-1-puranjay12@gmail.com>
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@google.com, haoluo@google.com, jolsa@kernel.org, bjorn@kernel.org,
 luke.r.nels@gmail.com, xi.wang@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 pulehui@huaweicloud.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_075029_169249_591B207B 
X-CRM114-Status: UNSURE (   8.68  )
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
ZXIpCmJ5IERhbmllbCBCb3JrbWFubiA8ZGFuaWVsQGlvZ2VhcmJveC5uZXQ+OgoKT24gVGh1LCAg
NCBBcHIgMjAyNCAxMTo0MjowMSArMDAwMCB5b3Ugd3JvdGU6Cj4gQ2hhbmdlcyBpbiBWNDoKPiBW
MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwMzI2MjI0OTQzLjg2OTEyLTEtcHVy
YW5qYXkxMkBnbWFpbC5jb20vCj4gLSBGaXggc29tZSBzdHlsZSBpc3N1ZXMuCj4gLSBBZGQgVGVz
dGVkLWJ5OiBhbmQgUmV2aWV3ZWQtYnk6IHRhZ3MgYnkgUHUgTGVodWkgYW5kIEJqw7Zybgo+IAo+
IENoYW5nZXMgaW4gVjMKPiBWMjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmLzIwMjQwMzI1
MTU1NDM0LjY1NTg5LTEtcHVyYW5qYXkxMkBnbWFpbC5jb20vCj4gLSBVc2UgUkVHX0RPTlRfQ0xF
QVJfTUFSS0VSIGluIHBsYWNlIG9mIERPTlRfQ0xFQVIgYXMgdGhlIG5hbWUuCj4gLSBVc2UgUlZf
UkVHX1pFUk8gZm9yIHRoZSBhYm92ZSBhcyBpdCBpcyBndWFyYW50ZWVkIHRvIGJlIG5ldmVyIHVz
ZWQgaW4gYXMKPiAgIGRzdC9zcmMgcmVnaXN0ZXIgaW4gQlBGIExEWC9TVFgvU1QgaW5zdHJ1Y3Rp
b25zLgo+IC0gVXNlICNkZWZpbmUgUlZfUkVHX0FSRU5BIGZvciBSVl9SRUdfUzcKPiAKPiBbLi4u
XQoKSGVyZSBpcyB0aGUgc3VtbWFyeSB3aXRoIGxpbmtzOgogIC0gW2JwZi1uZXh0LHY0LDEvMl0g
YnBmLHJpc2N2OiBJbXBsZW1lbnQgUFJPQkVfTUVNMzIgcHNldWRvIGluc3RydWN0aW9ucwogICAg
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9icGYvYnBmLW5leHQvYy82MzNhNmUwMWQxYTIKICAtIFti
cGYtbmV4dCx2NCwyLzJdIGJwZixyaXNjdjogSW1wbGVtZW50IGJwZl9hZGRyX3NwYWNlX2Nhc3Qg
aW5zdHJ1Y3Rpb24KICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvYnBmL2JwZi1uZXh0L2MvMjFh
YjBiNmQwY2ZjCgpZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKLS0gCkRlZXQtZG9vdC1kb3Qs
IEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy5kb2NzLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3B3Ym90
Lmh0bWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
