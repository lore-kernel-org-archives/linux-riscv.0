Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C37DC0218C
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 08:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMDb9AO8I9lkAgGCk6t6StcSIOCl/37XAhz1sxdWcyY=; b=QzkFLYZjaQocr/
	WLBWP0CA0LxaJB9ICdnDICYVfTLNUaptVtK+IaRP0LpD7vNrp9c9y9kAOF78NYVn7PH4slLSB9k7c
	2iN5tbSy0TZJ7caTWwQHjXL1wKmdwX3bZox7VrtHJ91xtR+e9vVc9FhMlc/nHqtbIYJ637i/2JemM
	VEjtIaOMZCZJ6qT8NzIuAQINYVK62R/x1HF1lO2sgRQvVIOafKfpReJuPt2SE3AhB9Hffk0Xa1p78
	kwRzUgSpYTarbJc0+0vQfbqv71j/2oJwN476O451stQBXb5QtVvgGBDz4DUtAUgcFVrCqhZHshP5L
	mfHUjMdo6vP7dSUYwpvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcKpv-00000001v4E-1fnL;
	Mon, 27 Jan 2025 08:51:15 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcKpr-00000001v3L-2qeF
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 08:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wriQl75Gusa955YmjwJpTlRf/EoZrjPRFhU8Bvkz6ew=; b=J5B2xJ4vUC14eZa5Tu1EzFnKyb
	FVqI21yrxH2FqFG/IwHOiCd1tTJqgXV1KheDmY9gWvWK5kRZ60Td43kWSFs+PpKKGJ0Ad2yLIn4kH
	3poXc7mlLgUP6M69YVRYlLDGT8wqmd1LSb4AwD+fUg2+3ijsn1d2Nqm/PbSSQBjESd3IegIuxL+Hd
	QoBmbOFuKwJeQj9TTK5AcG+4OLX2mDIzCwd8zeWKa33KR0GHLaCdxyUhxHLbX76b2PpEJQSaBvG+7
	XGCqwQ1PyCNitsFG2TKuug4yv/LIZITD310s+6CatmoO3adlRxyUhbSPFku7O4tt+QzDRk39SYfAm
	d3Ni6/rw==;
Received: from [167.98.27.226] (helo=[10.35.6.157])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tcKpk-006uH5-QI; Mon, 27 Jan 2025 08:51:04 +0000
Message-ID: <dc193d9d-e8e5-4906-9fcd-ee8cc919acd7@codethink.co.uk>
Date: Mon, 27 Jan 2025 08:51:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Add runtime constant support
To: Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250127-runtime_const_riscv-v1-1-795b023ea20b@rivosinc.com>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20250127-runtime_const_riscv-v1-1-795b023ea20b@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_005111_822142_47534508 
X-CRM114-Status: UNSURE (   8.02  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 27/01/2025 08:18, Charlie Jenkins wrote:
> Implement the runtime constant infrastructure for riscv. Use this
> infrastructure to generate constants to be used by the d_hash()
> function.
> 
> This is the riscv variant of commit 94a2bc0f611c ("arm64: add 'runtime
> constant' support") and commit e3c92e81711d ("runtime constants: add
> x86 architecture support").
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

I think my only comment on this is we should treat instructions as
__le32 type and add the proper conversions when maniuplating them.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
