Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D034E9B249
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 11:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SWBi91aSbYwKxLVCs3bIIk35c+DGe5VT5mhA+PwZwF0=; b=ZsO8coqNKeui0I
	dMQWOz5A8CsSj8+OU4u2JgLppKaZ4nGSv9BGUH+34MyqgfLsJBgGMFSNN/LT+u1VrCT98Uc8PPZsO
	YveiY6IuWhJAEst3oQDsFVUEsgVsNs37ONjH1O+CRhX7sjturWryPzWz3vAsm0lQBavPycJ9NL/1p
	SJKJLJUxl3gcMFy6Rj0qxQqnpWWGdvP+fpxLrv/0rkD0y17MqUztfs53USQAv++Ey+qB9n1+Hr4Xe
	NKxDR9Hv5WJrd1rdGzjjVyWS2FfY+fSU+kgxUO32O7N5B8m4rU/JeHjJzQBk2Gnd6b8SCv5dUKlF1
	tl1LHQibriR1NoNKISDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuq9U-00000001vXV-2wDW;
	Tue, 24 Feb 2026 11:00:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuq9Q-00000001vUp-0cUL
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 11:00:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BAB9B416D1;
	Tue, 24 Feb 2026 11:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEEDC116D0;
	Tue, 24 Feb 2026 11:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771930823;
	bh=sp1M4Ecc7+UyoVNV1sWpueKrBy61exxNm/nEsh4CawY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gN62UtsA6LT4fYW6UioynrJkR2jF1vx72Sxb4EktxYCQz/zxjx/HO1ha2EMV/7sDK
	 +0NB0gB8lOBEu4loFmQCQxGpmN+7aneDObggIC4edrgt8DWDGweEEehPLen5nFEhaT
	 CUL6Xixlwz2wUYr/ootObaPXd7N1WAxIQcK2f8LragVSfwtCcGkUbYuK69EnCipb2j
	 uehBhQK6QDOMZelnhk4WsWgMfx/v8IaVKdVi/lvgAUIorRPwN03QpE5pNLzlZk+ayo
	 3MszTbK4fMkTuPeOxLnRxJOFAlhvtnchTF8TUBuDwSh/bc7NXLf6fv5sFbG+oIMp6L
	 nwFKYnQu6lT5Q==
Message-ID: <13b8d60d-1209-4650-9fa5-982381c53512@kernel.org>
Date: Tue, 24 Feb 2026 12:00:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mm: Regression with v7.0-rc1 on RISC-V
To: Ron Economos <re@w6rz.net>, wangkefeng.wang@huawei.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: ziy@nvidia.com, jackmanb@google.com, jane.chu@oracle.com,
 hannes@cmpxchg.org, willy@infradead.org, muchun.song@linux.dev,
 osalvador@suse.de, sidhartha.kumar@oracle.com, vbabka@suse.cz,
 claudiu.beznea.uj@bp.renesas.com, Mark Brown <broonie@kernel.org>,
 akpm@linux-foundation.org, pjw@kernel.org
References: <1b17c38f-30d3-4bb4-a7e1-e74b19ada885@w6rz.net>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <1b17c38f-30d3-4bb4-a7e1-e74b19ada885@w6rz.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_030024_245698_20B86B58 
X-CRM114-Status: UNSURE (   6.48  )
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

T24gMi8yNC8yNiAwOTozNywgUm9uIEVjb25vbW9zIHdyb3RlOgo+IEknbSBnZXR0aW5nIGEgQlVH
IGR1bXAgZHVyaW5nIHNodXRkb3duIHdpdGggTGludXggdjcuMC1yYzEgb24gUklTQy1WLgo+IAo+
IFvCoCBPS8KgIF0gUmVhY2hlZCB0YXJnZXQgc2h1dGRvd24udGFyZ2V0IC0gU3lzdGVtIFNodXRk
b3duLgo+IFvCoCBPS8KgIF0gUmVhY2hlZCB0YXJnZXQgZmluYWwudGFyZ2V0IC0gTGF0ZSBTaHV0
ZG93biBTZXJ2aWNlcy4KPiBbwqAgT0vCoCBdIEZpbmlzaGVkIHN5c3RlbWQtcmVib290LnNlcnZp
Y2UgLSBTeXN0ZW0gUmVib290Lgo+IFvCoCBPS8KgIF0gUmVhY2hlZCB0YXJnZXQgcmVib290LnRh
cmdldCAtIFN5c3RlbSBSZWJvb3QuCj4gW8KgIDE3My45ODUyNDldIEJVRzogQmFkIHBhZ2Ugc3Rh
dGUgaW4gcHJvY2VzcyBzaHV0ZG93bsKgIHBmbjpmODg1MAo+IFvCoCAxNzMuOTg1MzExXSBwYWdl
OiByZWZjb3VudDoxIG1hcGNvdW50OjAgbWFwcGluZzowMDAwMDAwMDAwMDAwMDAwCj4gaW5kZXg6
MHgwIHBmbjoweGY4ODUwCj4gW8KgIDE3My45ODUzMzZdIGZsYWdzOiAweGZmZmY4MDAwMDAwMDAw
MChub2RlPTB8em9uZT0wfAo+IGxhc3RjcHVwaWQ9MHgxZmZmZikgQ01BCj4gW8KgIDE3My45ODUz
NjVdIHJhdzogMGZmZmY4MDAwMDAwMDAwMCBmZmZmZmZjNTAxZTIxNDQ4IGZmZmZmZmM2MDBmMmFl
ODgKPiAwMDAwMDAwMDAwMDAwMDAwCj4gW8KgIDE3My45ODUzODZdIHJhdzogMDAwMDAwMDAwMDAw
MDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAxZmZmZmZmZmYKPiAwMDAwMDAwMDAwMDAwMDAw
Cj4gW8KgIDE3My45ODU0MDNdIHBhZ2UgZHVtcGVkIGJlY2F1c2U6IG5vbnplcm8gX3JlZmNvdW50
CgpTbywgd2UncmUgZnJlZWluZyBzb21ldGhpbmcgZnJvbSBDTUEgaW4gY21hX3JlbGVhc2UoKS4K
CkluIGNtYV9yZWxlYXNlKCkgd2UgaXRlcmF0ZSBhbGwgcGFnZXMgdG8gZGVjcmVtZW50IHRoZWly
IHJlZmNvdW50CgoJVk1fV0FSTl9PTighcHV0X3BhZ2VfdGVzdHplcm8ocGZuX3RvX3BhZ2UocGZu
KSkpOwoKSSB3b3VsZCBleHBlY3QgdGhhdCB0aGlzIHdvdWxkIGZpcmUgYWxyZWFkeSBpZiB0aGVy
ZSBpcyBzdGlsbCBhIHBhZ2UKcmVmZXJlbmNlZC4KCQpBcmUgeW91IHJ1bm5pbmcgd2l0aCBDT05G
SUdfREVCVUdfVk09eSA/CgoKLS0gCkNoZWVycywKCkRhdmlkCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
