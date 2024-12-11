Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7826E77182
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 22:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ESISa+F6gXNL1Vn9sFeTLqUo3uyYioM4qOvPXF8T30=; b=nU2P+RaoEB+sNW
	pUUtFTHId1FcHorwhTDkPYvEXUdrF4cUHo8kkickEsPkqhaO79k60HvGJeWcmXTW2sBszPluB7ii3
	2OX12rWTEM/9DT+Pe0WRVGIohna8q10KArC3v8imkRSE4dP5bdL9zCLoLUMoypYnVG191DfFieLR+
	3pP+vF2AZlA/Y1LMTwT/T0A9bm5MS0SlGolP1jjnczj+YP/vaapH96fkFibFdyEiQEiwFlN+lrH84
	A7Nw7WufsrTZCqG4oBSiINv/p//LSs3OVj5Vp1n3bM6ahINWsOzNwe4St+eEwvohcUPHM59VpT2F9
	dnuM0Bm1SBqJNU4Ma6vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVM3-0000000GMtm-2zhW;
	Wed, 11 Dec 2024 22:38:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVG9-0000000GKZS-0Yyv
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:32:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 86A155C67F5;
	Wed, 11 Dec 2024 22:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D83C4CED3;
	Wed, 11 Dec 2024 22:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956364;
	bh=iRwxC1s0tO/FMsHuvL9jXdyPxujIqKEggAX45W0Slqk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gXv2yfYI3u6DpqV1QgWdlFHngfCsoqTqn8qFlW9vmxnxqkmi2e0lXapKqCP1xq6Sq
	 m27jAoArETLE59h3MnbPfeV3Du7pXd51diP7+E1kuOCkhI7BhHN3DecsGyqg69HYCz
	 4dtnfhgmCNmsRYRIPBaEYy8l1+tEE1pvCJwTuJ6jZQE2vL5C5Y4TlG7IFgF7jCU0ML
	 EPY3X047UtqYUWAN70PGlmC02VnScPkoy5P16UdK6QQNkRg9BsWNI2Pw7GnLtv9JBW
	 l0EMIp8cQD51ifM8V58DpUd37Lm02CBpfUmo+wcLANw+3geztRTyBkXlx98+9U2bsW
	 EaiC7JsiZtyNQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EBAA4380A965;
	Wed, 11 Dec 2024 22:33:01 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH fixes] riscv: mm: Do not call pmd dtor on vmemmap page table
 teardown
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395638049.1729195.5190256802330820237.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:33:00 +0000
References: <20241120131203.1859787-1-bjorn@kernel.org>
In-Reply-To: <20241120131203.1859787-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, alexghiti@rivosinc.com,
 aou@eecs.berkeley.edu, david@redhat.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, osalvador@suse.de, bjorn@rivosinc.com,
 abrestic@rivosinc.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 virtualization@lists.linux-foundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143245_220678_58DD4163 
X-CRM114-Status: GOOD (  11.23  )
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
CmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIFdlZCwgMjAgTm92
IDIwMjQgMTQ6MTI6MDIgKzAxMDAgeW91IHdyb3RlOgo+IEZyb206IEJqw7ZybiBUw7ZwZWwgPGJq
b3JuQHJpdm9zaW5jLmNvbT4KPiAKPiBUaGUgdm1lbW1hcCdzLCB3aGljaCBpcyB1c2VkIGZvciBS
VjY0IHdpdGggU1BBUlNFTUVNX1ZNRU1NQVAsIHBhZ2UKPiB0YWJsZXMgYXJlIHBvcHVsYXRlZCB1
c2luZyBwbWQgKHBhZ2UgbWlkZGxlIGRpcmVjdG9yeSkgaHVnZXRhYmxlcy4KPiBIb3dldmVyLCB0
aGUgcG1kIGFsbG9jYXRpb24gaXMgbm90IHVzaW5nIHRoZSBnZW5lcmljIG1lY2hhbmlzbSB1c2Vk
IGJ5Cj4gdGhlIFZNQSBjb2RlIChlLmcuIHBtZF9hbGxvYygpKSwgb3IgdGhlIFJJU0MtViBzcGVj
aWZpYwo+IGNyZWF0ZV9wZ2RfbWFwcGluZygpL2FsbG9jX3BtZF9sYXRlKCkuIEluc3RlYWQsIHRo
ZSB2bWVtbWFwIHBhZ2UgdGFibGUKPiBjb2RlIGFsbG9jYXRlcyBhIHBhZ2UsIGFuZCBjYWxscyB2
bWVtbWFwX3NldF9wbWQoKS4gVGhpcyByZXN1bHRzIGluCj4gdGhhdCB0aGUgcG1kIGN0b3IgaXMg
Km5vdCogY2FsbGVkLCBub3Igd291bGQgaXQgbWFrZSBzZW5zZSB0byBkbyBzby4KPiAKPiBbLi4u
XQoKSGVyZSBpcyB0aGUgc3VtbWFyeSB3aXRoIGxpbmtzOgogIC0gW2ZpeGVzXSByaXNjdjogbW06
IERvIG5vdCBjYWxsIHBtZCBkdG9yIG9uIHZtZW1tYXAgcGFnZSB0YWJsZSB0ZWFyZG93bgogICAg
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzIxZjFiODVjODkxMgoKWW91IGFyZSBhd2Vz
b21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90LgpodHRwczovL2tv
cmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5odG1sCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
