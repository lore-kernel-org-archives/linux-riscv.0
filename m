Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAD9606A338
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 23:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1Dwn7xui;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y2PEt20h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=Rs7W3PQYobLQEEgzpgq4hbwgKnxSuK0ubPe2jaFHKkM=; b=1Dwn7xuiN9bg5PyJrGO3gG2hMF
	oM9LD81eLVGHx+fBEymO92Ey4q8Ncbc2BHW1qfzpo2oKTyThWBigGQugFncfR5BwFE985eY/iIVqc
	j3lYhnEYavOFKA+Mm4hraV39gKaFH6TV1pW2a3B1pCRfoGCQG2yncc9P26dM69MS/vv6IP8LXN50Z
	ugMJLGxK6iTiRjOZZ6JJgt+xfVB/amDqxcOcg6hYc74oGL+oURr1YxAwxgKc2Ggjg+BYesMXgrja8
	NtYqRJZlnS7Ou3UwzXJcj0VaC6dY4gM1UcTImh0K+NX2IBl72rr9ghBGkuO27sUrtVlf7Krfp1fp8
	oCYYHTow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUY7h-0000000GQEZ-46fW;
	Fri, 20 Nov 2026 23:34:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUY7g-0000000GQEN-3WXp
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 23:34:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1295E618A8;
	Fri, 20 Nov 2026 23:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5987C1F000C4;
	Fri, 20 Nov 2026 23:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795217667;
	bh=d5UxhRENKrjN2WqdptUK5eL7RckbgwjJ8al7suyNLmw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=Y2PEt20hYB0QZOMD0OeEAk5QiWb5GsEhbQISV/J8JRgTMESexeBZSyyBn/GJ7Dkts
	 BPSScWrUW4D1lPyP/Yl5Opvhc+rCtmL17H2wYb4MSvy3n/VQsb+il/Ypn53lFhXRrn
	 KDtZ1sUs+OLaBOmSxUq3gDsNkEkfQFsoAO5hWTJ2hDC9Nh5MHGLnR8BklKbwmJvStD
	 xiNhjBu6WXTQkoeY2Y8gUHJsskeLwfs+5J5BF1A1CYMGHGTRiJMleuVQqJkAaUv4fv
	 zpJ6OdWgJkcGGcWkt3vEJziGVWFSEv/ryhiZ2il04mqK2P13/HHJyGwI9ustKvp893
	 mSJXDE0GySgqg==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 93458198003A;
	Fri, 20 Nov 2026 18:34:23 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 20 Nov 2026 18:34:23 -0500
X-ME-Sender: <xms:-tgAa40WMd_EPWFNg07JZwyPJcDR9Hl4neZG2sZ60S43JjZakvJQFw>
    <xme:-tgAa94btA2FcjGmKSDp7fs53-xd9zJUgeojcI1BpmZaQ8Kz0eLzPAdMkS9qQ_7FU
    OZr59jIhg8MHlYyQnwbZeEYlF7PpV4Vxlr8KoLe3U5t0r5NWyCYNKk>
X-ME-Proxy-Cause: dmFkZTFL9seTInIL2hUW1OvhO1WNW9/yDQMQ3sNpaBykWH23VqJykrvUISWN+rBSHQ+5bq
    /JQwHxFYPIkL2Xu86dfOWtqtRPVNB/qIKe2+3mjFHHflxOdiuobuj78Hw/FMM8RVcs5xMb
    dS/DET/rxsPx6SEKm1JZ2K/buPZvqwh9FNjgcHALkKy/XLVkevo5sDDIARq2Z//kZnp9CA
    rSEoHmeWmhoezQror9Ty81ka79pfF/gOgXmZ1GkKqAi2/yxezmh6ijdV1UEGYFqsznmeWL
    g6Y1Onmgdfw7a6cltPUu6V6KYEQymMJvNVprAPmF42FlCo/F4k4Y9IbQe/ue2Z+ZHcN6bR
    AVBfQNgkF9KQh6PxBWA+qfee9aUYQOqptwYa8VjqHfwnjVYok5TV5bLTBLvGn0rIl/+57i
    WO2CFNlMLurWUHycX9pn9FDh03suHQbu/a60gn8A1Unl1x/x+0E2LPeaCXK7ov30TPL9HY
    o2ezFIxHQHCXTJI7edwpEegWtCs0Eg73XGWZUHhg6NY3KaNTAF6vI4OBcklGStE1NtEpHe
    N3vHrVedPTfuvnZlHDtl4lFSJEfm8EUJI7Pvrs07l9xMCrxgGBfUi29jmIbjOM3Gg8ZgCg
    sI/r+DEJkCrbUJ/3Cs8u1BxQF8UUwcuBBDKvKM9/eCBqk19JS3CGIDZU1VMg
X-ME-Proxy: <xmx:_9gAa8qH40BxQBQvJaXjFARB-PhdRsMar2JTklrPA3z4SJQHVTmxBQ>
    <xmx:_9gAa3xjvPAkaVp2Sku5NRZNcCLQid1uQn0F3mHKuHRTI4Ze8YW5dw>
    <xmx:_9gAa4fNmE8P0lI-MJYK8bBx9g6OJsEHDExPpHD4o_STbil2bs93ag>
    <xmx:_9gAa7et2LQJdchwIic0GV_SClr-FVPrJ93hKkhrIDg8-j26-Wdt_A>
    <xmx:_9gAaya0K8B0H7iHsoh_BofrwBklH8I5ogjHkW64OyKf3gN1PHCDP1na>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id CDCA4F80093; Fri, 20 Nov 2026 18:34:18 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 21 Nov 2026 00:33:58 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Jonathan Corbet" <corbet@lwn.net>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 "Justin Stitt" <justinstitt@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev, "Mark Rutland" <mark.rutland@arm.com>,
 "Bill Wendling" <morbo@google.com>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>,
 "Randy Dunlap" <rdunlap@infradead.org>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Will Deacon" <will@kernel.org>
Cc: "Jonathan Cameron" <jonathan.cameron@oss.qualcomm.com>,
 linux-integrity@vger.kernel.org, patches@lists.linux.dev,
 =?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>,
 "Ross Philipson" <ross.philipson@gmail.com>
Message-Id: <243c6d70-7c81-4ad3-9a67-eb8cfbf454d9@app.fastmail.com>
In-Reply-To: <3-v3-22d1a1eb7d2e+17de-arm64_drtm_jgg@nvidia.com>
References: <3-v3-22d1a1eb7d2e+17de-arm64_drtm_jgg@nvidia.com>
Subject: Re: [PATCH v3 03/11] efi/libstub: Have efi_kaslr_relocate_kernel() handle
 extra_size
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jason,

On Fri, 20 Nov 2026, at 18:51, Jason Gunthorpe wrote:
> extra_size is additional memory required that must be immediately after
> the image.
>

Given how extra BSS memory is essentially free at boot, is there no way
we can establish a worst case upper bound for this memory, and just add
it to the image unconditionally for DRTM capable kernels?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
