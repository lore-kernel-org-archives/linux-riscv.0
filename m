Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDEA606A31C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 19:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kj55nqNZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VV7bP3e5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=bduAZMHCgy963lWli7FJI3ErOidGKKXi+myEOWHNiSQ=; b=Kj55nqNZtQEly94/aiJBxqfVMh
	5t4uNOwplKIz/bKQJ2bg3AVK3K9nIopqE3DG6W67zlOd/A002G9oBtTbsfHAIvwr+Bplfgmlr3Qfy
	uAoqbhJgRRMjuK26VF1SEeUoJCl3i8CWyt3pMkhFemVFKsKTh/haeeuFWVfBUMg29MMOGY3gh40Z0
	oOvDGVbTZ3D2iV6nSOoFOCCS70UxsctVgrk3yb9yErxTM3++9uDRVxDReNRY8PO9sI4JG9q5SAU2A
	XAc8vZ0vypy3gCJsREUV2jNBFUrXvEK+RC4VB4/y8CdEekUub2/1w6iPl5idgDz0WXVoZfkLhUKrp
	vdlFD+jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2QU-00000003ljX-0FeV;
	Mon, 16 Nov 2026 19:31:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2QS-00000003lih-2r9u;
	Mon, 16 Nov 2026 19:31:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BBC3C62342;
	Mon, 16 Nov 2026 19:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D4A1F000C4;
	Mon, 16 Nov 2026 19:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794857494;
	bh=lwgT/KrjrpKLxweIoceB8B3882no6dAeURpV4XCqn7g=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=VV7bP3e55Boddh0j6MxEfBLo4MGG2V6tMiKzob+D1sSI8upbcG+V6Hn8//z15ub57
	 +02mbojGdX8Yc2wLPgtzqcQhvihekm9a+jfO/SPq8uH7YWRpkz/S5xmiP/F73Ex34Y
	 iR6HUNtIUzt2fzxCxTdme21/53m8jSnAY+QJZ0NyBkz0YrflpJDJZ9uFvFnqprTEQX
	 4nyLhG/ZEn1FcU04oR2CUF7OBYuB25V44rrys64odsYwORaa8ubvmb6OFYrQ1dnrB5
	 tqZzL1FF0k6XEBfKq0eLXzvCY7fmsw3PNig6Tzm2j+V9mwiX9cq5rAcNRgJKEbZFtn
	 5x3vYA7F23Fhg==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 39357198003A;
	Mon, 16 Nov 2026 14:31:32 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Mon, 16 Nov 2026 14:31:32 -0500
X-ME-Sender: <xms:EVr7avBdQVFoEfowz_bCbI5AdAT0mX5c34086tEkESODrdbqV9IQEg>
    <xme:EVr7agVzCehMdtLffyQbJHnXG8DSh4qEPdQYRsxUAX5ou_gjacQCb6W9LKGt6MAzt
    5hRd_pOWxQMaEgqmGscM5MyX7mslg8LAfmZyYh3wplu2GDnvTE7t3me>
X-ME-Proxy-Cause: dmFkZTFvCSGQHIu2yMjqWjpgcdZz154dIWM3uIczS4ecJ9T1Ot9xsnK1FzpDfU7202u8Ud
    q7tiI18YF8mpIMH06FRZlmiB1jFalJ5440vUqFqxj/gg2qhCC5NZSZ62XdMx+f7jVnynWL
    HTCM5imh7D+AWkoosndmN5k7FtUBeF0Eo4Ddl5Lq/Q21QofGB/Ye9ZIwuw6xmRjLOVNytf
    jxQqfomoBdZDQkDoVs2fNuaxqhr9eqOTZtFb9C42AT+UgmAq7VeuYKVKVUp24WCxXrCZCA
    xqhAY3v1ng6ccB6zLwefGZC6yZx3mZXc9BInfEFSzH8SY31iDHCIcio1OKHUDFpq7b6PVD
    g8pNSAMFmuIJkbemCn1MkIDL/LJhxk7hRG0JmMA46RM+wnmhSx0OZe5ZNy89a6qE132frM
    7I1MOm2OdvuVNKL05fA7AA33M7ProFlTF+G/qPfop9/Ac93XU/h9PDXnKxc2GOYRkc6F/+
    DSE9g2XIaog3F0ybFwotpVuxuivvTeiHNikqlFA4IvnBs03FRTvyJ9gmd699qSny7pPIhh
    id3qZPScO+40bcQOTg1c4bkHcEIE4cr3pBQVW7lm9bqkOoko+bVKfXD/GX6E+Gu7jML8Nw
    LvZn4IE9GrQ6FzU6xIDNyhWknd+pRIXDAWiRsMf2OdAP+IT+SGTxTV7gJLxg
X-ME-Proxy: <xmx:FFr7aslYsOJph0XSW_kFMQQ36WrX3X2k7xR0Cdvtcy63Y400LuLnNA>
    <xmx:FFr7ans2CxP6SXmGsHQgLCGmqziYBKMMa7kPqLrYYTX6s9QXCCxL8Q>
    <xmx:FFr7anrP5-GXyz7S3dl4xB-7Ze-tIxT_tkTdoqnv0kXuhhv7cIyI3A>
    <xmx:FFr7atddxEE9RgQaekTFHf2s51GF1m1I7ZVqLOxYIz28nzsmqZ3PMA>
    <xmx:FFr7avlXcCklzkuiFbGTbCcVudYgjHjYNqy-jhU5MzgrKYzv5QaHu0oK>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 5EF9FF80093; Mon, 16 Nov 2026 14:31:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 16 Nov 2026 20:31:09 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>, "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Huacai Chen" <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
Message-Id: <3aca714b-9296-4a87-b5e9-636f9f3f7bc8@app.fastmail.com>
In-Reply-To: <179485513561.2274641.9183102461241695856.b4-review@b4>
References: <20261116142618.1687025-17-ardb+git@google.com>
 <20261116142618.1687025-24-ardb+git@google.com>
 <179485513561.2274641.9183102461241695856.b4-review@b4>
Subject: Re: [PATCH v3 07/15] efi/libstub: Pass kernel entrypoint down to
 efi_enter_kernel()
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On Mon, 16 Nov 2026, at 19:52, Jason Gunthorpe wrote:
>> Update the EFI stub code shared by arm64 and RISC-V so that the kernel
>> entry point is taken from struct efi_image_info rather than from opaque
>> arithmetic performed on linker symbols.
>> 
>> Notably, this results in EFI zboot to enter via the actual kernel
>> entrypoint rather than byte 0x0 of the loaded image on these
>> architectures. Beyond that, it is mostly a cleanup that will allow
>> special linker exports for global symbols to be dropped in subsequent
>> patches.
>> 
>> ARM is a special case here, as it combines the EFI stub with its legacy
>> decompressor, and so the generic image_info carrying direct references
>> to vmlinux symbols cannot be used there. Instead, it provides an empty
>> struct efi_image_info, which is passed directly to its implementation of
>> efi_enter_kernel(). So on ARM, populate this efi_image_info with the
>> base address that the callee expects.
>
> Does this mean that the EFI stub never sees a decompressed image on
> ARM and jumps into the legacy decompressor?
>

Exactly. x86 used to do the same, but I fixed that a while ago for
other reasons, so there this efi_image_info approach is still feasible
as well.

> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
