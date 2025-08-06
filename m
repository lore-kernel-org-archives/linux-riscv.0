Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECAEC87FDA
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 17:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2h4m+4WUyXnaBbZ/SLPTV6fGYiBeqKNnuUExC6o/J68=; b=XNuwwiUCXbfBFw
	R4nTQm1fiWEXcCkT+0mI60YRPakUdKxGiEIcJFfpCfdvFWA8BaOWk//lpm61c60vdjnpzc+Othmu4
	tMh5/87iiaMzryij4DfaOhZYz53njbxfV1qSbbp/q47KT+xI/21gC8Lcw640/MSHXXAVAzCXU7QA/
	mHflx4QJfNN18f1X7Tyj0nu8Sgjx+KKZEico/Kw1yNepdAIrsnHMi9+mueFakVviyUlIu45KGM3UH
	bpWLwe8Gs0DRiAWr98rPa2l3DFhlqcT+Z7fOzNkryU8iHXiIQbtxDau3M/lizT2gLA2zX6ruAJucA
	WZgvbMcsim8OUIXzNFog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhnw-0000000FtNY-3wYa;
	Wed, 06 Aug 2025 17:19:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhjn-0000000FsCk-0tSU
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 17:15:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4D005C6A98;
	Wed,  6 Aug 2025 17:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61418C4CEE7;
	Wed,  6 Aug 2025 17:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754500538;
	bh=FPoVB0luhGfr8VKdsLri9XQZP3N4vDq2w8LU1u6LXNk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nU0qYDomgCEqLecBnU6y/6JYF3o+P9LYhK81l0Bz+eK0Vuutbwm7DhbRsD+j7ZiYM
	 i8Mps8BULf3Pi9AHuTpABndJJ7z3R5CwOxoqHkj5TWn0yaMgtH7EiMGXOnuDu0Hp2L
	 J/Qp9nLzQSwQR2JOevAy4zAGUZjZ/0OFhWeQuEFtnGPIzywqyUHFa3RfUtxFufDTW4
	 ai4Yp1XK9LMRlw90BbbLI/uuxsT2rVtXpRQj5RVlv3+Njxsb68d3BbiLJtsD+PZS72
	 /oU2t67t/2/AjgcBe/yKP4v5f9xUXQz7w1nXBxWtfTkLa+J/fm0WXFARoqXzAPEgCH
	 G85ztmKqq6V4Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CB4383BF63;
	Wed,  6 Aug 2025 17:15:53 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5] selftests: riscv: add misaligned access testing
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175450055200.2863135.7169449906797738792.git-patchwork-notify@kernel.org>
Date: Wed, 06 Aug 2025 17:15:52 +0000
References: <20250711131925.112485-1-cleger@rivosinc.com>
In-Reply-To: <20250711131925.112485-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, shuah@kernel.org, alex@ghiti.fr, schwab@suse.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_101539_292086_8B25307D 
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZm9yLW5l
eHQpCmJ5IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT46CgpPbiBGcmks
IDExIEp1bCAyMDI1IDEzOjE5OjI0ICswMDAwIHlvdSB3cm90ZToKPiBUaGlzIHNlbGZ0ZXN0IHRl
c3RzIGFsbCB0aGUgY3VycmVudGx5IGVtdWxhdGVkIGluc3RydWN0aW9ucyAoZXhjZXB0IGZvcgo+
IHRoZSBSVjMyIGNvbXByZXNzZWQgb25lcyB3aGljaCBhcmUgbGVmdCBhcyBhIGZ1dHVyZSBleGVy
Y2lzZSBmb3IgYSBSVjMyCj4gdXNlcikuIEZvciB0aGUgRlBVIGluc3RydWN0aW9ucywgYWxsIHRo
ZSBGUFUgcmVnaXN0ZXJzIGFyZSB0ZXN0ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQg
TMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+IAo+IAo+IFsuLi5dCgpIZXJlIGlzIHRoZSBz
dW1tYXJ5IHdpdGggbGlua3M6CiAgLSBbdjVdIHNlbGZ0ZXN0czogcmlzY3Y6IGFkZCBtaXNhbGln
bmVkIGFjY2VzcyB0ZXN0aW5nCiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvYmY2
NTk0MzY3YTkyCgpZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKLS0gCkRlZXQtZG9vdC1kb3Qs
IEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy5kb2NzLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3B3Ym90
Lmh0bWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
