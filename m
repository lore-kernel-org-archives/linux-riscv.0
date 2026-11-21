Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D472E606A320
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2026 18:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GkANiJdJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=asuLfqv+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=ngc7RuAu3RQY3IVIBC4mh8hXCJV9db4hE1coW3ZVaxs=; b=GkANiJdJH21OToHH9aZOSxHME2
	5o8T3km0J2I7jFE6hc8bkmfgwvU8XN+BKHdUstvGNXhoq4Njl2Ak78k6tITsqjALa7lgyPQL0sA7o
	joebj9Nd9/7a2BLOsaud76y2QuUwU9WbLapSq44mc4GDH/AD2PWGBvjr8QDSea9sLzPLdJSpubAXq
	irxIu4v4DP2gapMhGseNacl5SVqiQ2RDb955TKd12uUnJEYnii3ce6GQSIXI4yYAiVNLjPBzga46Y
	5z0H97eYViAo2ZSevrvgRZoQK9gYM3gnHoVMm/Klhg5amOgWcgOtSaqhnj/1ff8W0s6nS6nSF6kd/
	FRJRSL+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUpdG-000000002Sl-2Zhr;
	Sat, 21 Nov 2026 18:16:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUpdE-000000002Se-2HQi
	for linux-riscv@lists.infradead.org;
	Sat, 21 Nov 2026 18:16:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DD6D5458E5;
	Sat, 21 Nov 2026 18:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511541F000CA;
	Sat, 21 Nov 2026 18:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795284971;
	bh=1X5j7YQdcz6iEhlSddIVL1ix+zetO1vVrxlepqlUlLI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=asuLfqv+WoimE3lnRbXLpEZ4xaibv3RcLStvAWZagJmDQ/94yST4XsB7X8GNlAm0X
	 Fg3p1aMVIg2psOQI1nTL092nU6PoOVLSw0CXn64RcjWi2ktTHFQ4NjdyXvGU3xbgAv
	 lAsZmdeJi462bL+xnUn8JU2JsbxenUG11ucyRLThUOdVUgCA2JV2Iv6gSm7gQUsnwM
	 mz9oN4SPPJQKmbwNOkHkLM7egwl/UPP+9x07Cx2swWtckEFXGyO90IBsUqdjpN8FbI
	 I4PqZaYEdrypOuctVSLvXK/zw8eG35i85BVEpHLwBFhalQlLoIWQGRbNnsiQ+Weh6J
	 bHIoewRY9Xd8w==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 3FACA198003A;
	Sat, 21 Nov 2026 13:16:07 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Sat, 21 Nov 2026 13:16:07 -0500
X-ME-Sender: <xms:498Ba5oRqe_6IRddTVKiT6LhTlnB8Y8L53p9D0szvXvP81pP2L5AYA>
    <xme:498Ba2euU5ISwHA9xnw0ZCN5WNbnbT1FAIwjlRsBbAQqx1yvFtcdB0OVy1okW02AN
    iRGMCtRP9YDLF7QprqrV-RRmYxMtUi8v2HJdwm0g5PHYT6urSoJZ2EO>
X-ME-Proxy-Cause: dmFkZTEtnHGhzDjhdINsG+KI0AoS/50TK6i0wx1kQ//6c35E2ONVRFcccFQwcKMKtHY8mi
    bpKgiKFvgyr5dJzeZ3i9+Wpo9GY7dsrP0B5Q7pRmFO8jNvkYwxDvX72jCnQhaXF/lbhLU7
    cuhmg/0yG+L1AOBY58lznHtSzbcbrz8Tt5TrAGIrXp8x7mTuSDCEy8ZLJ7pQHLmHkCxoN4
    9DNUcTVGGis4QgolqvOmcUwB0NDvIAxwlHDkhKpfEBJuN4KIk2oefdaWg4cVlCAsVFojwu
    6elGZvjbiLHilZ+ggJVlCnal4RSLjOe34UQkgEPyiOQ/osegaaaVWWoJYnVLI5A4H0PPTE
    tNyotbzbZ4WhPf9sGuZUNl3qfvmWh8Mht94TIVZWmom+eLXngnpGxMjmbNIGjC4JMC9Jwh
    HhtxIJ4PxPMGTye2eEOCAqZL7aUeUKPr1nMmlPpxHPnTDiwbXyqcHDI8W+TH5ekEOfBs8h
    tAjM52b23mFqW01Uj3K1WOIm525O/G1o5cbTxA9hwSPiU5Dv8MegKypFQUFCF/EUeyZ4xr
    nOLSiNWkgfTq+Q+atQEShXQdnWnPStC57ECGtQZkhGgtUHCB4uf7XaKcwm81cxHRHOMUUT
    VB5gf9jp2LMf99oh3KXve7qkvCCxRamQ6pvLQadt4w9adP7M/Cwf46VUXZQw
X-ME-Proxy: <xmx:598Ba3oL8wJA71R9Zd8aIE4BGHiYeNHyJbs7NH7qBaM1Q78WegXW9w>
    <xmx:598Baw63-SL2kR2AhznfEySyxH01iOH7gHwj0xlDswYKK5FqEej_3w>
    <xmx:598Ba3B5ED4oSbUHDnx2vPMOjl_TLjH81RAGTI2SNZCbf1ThuNay3Q>
    <xmx:598BayYsMMoatGidertwgS_KZQcP0M5yXhWLDSlWR_HcXVm0l-bnig>
    <xmx:598Ba7I4gThabSsAzvM1bknYm5nzofGQadLXacyxdXTKmUfVLXMscH19>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2505FF8008E; Sat, 21 Nov 2026 13:16:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 21 Nov 2026 19:15:42 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Han Gao" <rabenda.cn@gmail.com>
Cc: gaohan@iscas.ac.cn, "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Atish Patra" <atish.patra@linux.dev>, "Stephen Boyd" <sboyd@kernel.org>,
 "Brian Masney" <bmasney+clk@redhat.com>,
 "Jerome Brunet" <jbrunet+clk@baylibre.com>,
 "Chen Wang" <chen.wang@linux.dev>, "Inochi Amaoto" <inochiama@gmail.com>,
 linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 sophgo@lists.linux.dev
Message-Id: <9a94e434-13b8-4a45-bf3a-78f99a2435d9@app.fastmail.com>
In-Reply-To: <20261121144848.1277368-1-rabenda.cn@gmail.com>
References: <20261121144848.1277368-1-rabenda.cn@gmail.com>
Subject: Re: [PATCH 1/2] riscv: efi: Map runtime MMIO with device attributes
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On Sat, 21 Nov 2026, at 15:48, Han Gao wrote:
> On Sat, 21 Nov 2026 13:42:20 +0100 "Ard Biesheuvel" <ardb@kernel.org> wrote:
>
>> 
>> 
>> On Sat, 21 Nov 2026, at 11:38, Han Gao via B4 Relay wrote:
>> > From: Han Gao <gaohan@iscas.ac.cn>
>> >
>> > EFI_MEMORY_MAPPED_IO regions are mapped with PAGE_KERNEL, so device
>> > registers end up mapped as normal memory.
>> >
>> > On Milk-V Pioneer, GetTime() reads the clock controller registers and
>> > faults:
>> >
>> >   Oops - load access fault [#1]
>> >   Workqueue: efi_runtime efi_call_rts
>> >   status: 0000000200000120 badaddr: 0000007030012000 cause: 0000000000000005
>> >
>> > Use PAGE_KERNEL_IO for these regions.
>> >
>> > Fixes: b91540d52a08 ("RISC-V: Add EFI runtime services")
>> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
>> > ---
>> >  arch/riscv/kernel/efi.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> 
>> Acked-by: Ard Biesheuvel <ardb@kernel.org>
>> 
>> I can take this as a fix via the EFI tree if you like.
>
> Yes, please take it through the EFI tree. Thanks!
>

OK, I've queued up patch #1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
