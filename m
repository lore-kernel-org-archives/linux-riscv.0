Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF40C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 21:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XpHsaZzfOlc2meVlKOChcp1bE3AC281rYegh4JwPWVs=; b=0l2y6CnLmjRHCH
	CQGopgRRl35vyJJMfILs74WtF0/1TtEj3voMIhjFLinm3J/qOEuEdCtzf6LLgOCA5Hvhq5E9Rqb2f
	PLw9CEqUMQqM/Oykg8S7eAe/oJa7vxny6AjLd8+6niqF71xj+dfxs20rF8a1OcefLdVuAJpAhBmB8
	0nevTPJa0bQ4yy3WOqAEGquZ2ePrp32KPeeiXVJ+XLpBSGqE7L7WkSFQ3u6BDos8eETnQzzwwTond
	T37VHb+ORVF+3KE0MPzGqC0yASLoAB+h2l6tdiNUDh47lBR/qFFmZh9x0FzztHlmQ0EHbT2YjH174
	C+8DpyJ2S27uAVwHFzrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL8sc-00CARL-2l;
	Wed, 03 Jan 2024 21:34:26 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL8sZ-00CAQx-2i
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 21:34:24 +0000
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0049A8E3;
	Wed,  3 Jan 2024 21:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0049A8E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1704317662; bh=r4lpFrTdY5NQA/tWluRONgdtTT+sQFjhp4ggRHBRa7s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LJCLgv9zJ9OqoEEDmzYYBLH71jM3uc0inH+HJtf9JUBYCMFNHsd0MDvHQk8uGDkLY
	 Pke5g20OTI0sjabBIrwRNBjJzR9+uf9ynriUsAZdsgHaltECagBL3ggyGX+8hfloP/
	 Vb5HBGmtXZLEn2/MTJmgLREtS+XPuAADjL86uoq+TjZgHR/3GjYPRMPws9/J89rkRw
	 LbvmAc7uytPQnCgc48NKCBsnrE6P4OuRo6hCzM81qULCuixsaJhPUh85lEFted32kg
	 XfoFda9cza2H6nuhLujLcy0D/SuXfnKMy1apOJnA+HDdt7BXUn9YXpeO6QJmQSvwdt
	 NbNCNBTt7UNgQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Yanteng Si <siyanteng@loongson.cn>, longjin <longjin@dragonos.org>,
 alexs@kernel.org
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] Translated the RISC-V architecture boot documentation.
In-Reply-To: <9ecb2a82-2eca-4909-9c33-00ee8b13b804@loongson.cn>
References: <20231218092924.200165-1-longjin@DragonOS.org>
 <9ecb2a82-2eca-4909-9c33-00ee8b13b804@loongson.cn>
Date: Wed, 03 Jan 2024 14:34:21 -0700
Message-ID: <87v88a6qzm.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_133423_907399_56186FCB 
X-CRM114-Status: UNSURE (   8.35  )
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

WWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPiB3cml0ZXM6Cgo+IOWcqCAyMDIzLzEy
LzE4IDE3OjI5LCBsb25namluIOWGmemBkzoKPj4gVGhlIHBhdGNoIGFkZHMgYSBuZXcgZmlsZSBi
b290LnJzdCB0byB0aGUgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vCj4+IGFyY2gv
cmlzY3YvIGRpcmVjdG9yeSwgYW5kIGFkZHMgYSByZWZlcmVuY2UgdG8gdGhlIG5ldyBmaWxlCj4+
IGluIHRoZSBpbmRleC5yc3QgZmlsZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogbG9uZ2ppbiA8bG9u
Z2ppbkBEcmFnb25PUy5vcmc+Cj4KPiBSZXZpZXdlZC1ieTogWWFudGVuZyBTaSA8c2l5YW50ZW5n
QGxvb25nc29uLmNuPgoKSSd2ZSBhcHBsaWVkIHRoaXMsIHRoYW5rcy4gIEluIHRoZSBmdXR1cmUs
IHBsZWFzZSBjb3B5IG1lIGRpcmVjdGx5IG9uCmRvY3VtZW50YXRpb24gcGF0Y2hlcy4KCmpvbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
