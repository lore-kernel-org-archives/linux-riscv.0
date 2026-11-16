Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38296606A31C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 19:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jasQrJnq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DoF307gz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=ENSlz2XRe3o+DvMv2Udb/kj/RQzN4+zQap4jIrEl/8U=; b=jasQrJnq6Qv6+xQPC8rwVBc5hv
	0jxibJTfvvM3htf7BTXjZaMiSDZSFsbYWgZxe4i8G/7IBozN1enGgj8tXS5Wt7CxUtE51dzDbSvxX
	r2uwiirH3+HrZWiNgkZHQGLXG5rgcu7yJdX34WCT/Cvn1K+ZQ7HqQkuXq2CL3p4oKSDipCPYdB/bx
	/hIlWr6NmxPgizVyfP+l7N5Ax2G+M+wKe859cV7QNpfBXxtX1I2r+9GVfgUNlg9DvAVB/4C146jTL
	qYFMBFbN7dng95Jg28dKotaen+j+anB4JjLxwB2NkrBGv0w0J08KhVhTbxT7bybRGl80GvlcQ+B9C
	drPYhvpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2SZ-00000003m5s-3UYy;
	Mon, 16 Nov 2026 19:33:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2SY-00000003m5O-2hpk;
	Mon, 16 Nov 2026 19:33:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DB3260A06;
	Mon, 16 Nov 2026 19:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C8F1F000C5;
	Mon, 16 Nov 2026 19:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794857625;
	bh=PVpms2o1EVmRGV9LLOQ7J/09tS82gfik30j3xDX0yg0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=DoF307gz5M1yrgDz53bvqPNhfpUVTF3k7asrDIxmNb1O0HXbUjiZWFEehcnyk4L6c
	 Rc1wxZ2LSw9N2TW6TUgVvJhza3XZ3rODeFFqC+Jz+Ozphc7CGXUGQy8/UGAWXB0sBD
	 25bT2TJRsJ5ncG7GA/r+r3k/YqFH1Q+H0Kho09e5GrhitgkdrKHhsaM9/5OHjzRVmT
	 ISUwD/L1QSxCGMpRJuwwXxkIYmbdBDw/c3/m81kKu9fzu4ywocsXu2eOmlSTsonUs5
	 5FtFYF0xs4kn3X3+DB0dXCkU3P6C6a/L4sxG/uhsLFrNhI83jpRaoKd/WmEBtHLp0k
	 Afd9xplXmC+EA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 4D0C5198003A;
	Mon, 16 Nov 2026 14:33:43 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Mon, 16 Nov 2026 14:33:43 -0500
X-ME-Sender: <xms:lVr7amuD3NuJhkSrpWp3VzZUR3jOpvkWDvXaegYsFvV86bEzMcaazg>
    <xme:lVr7amTqKIc2VuyaiZwhDWThqZXwXbVRzr7h7UA2s-Hb8lmhPDYVY2qmwdoQD6Of_
    sXli3_8BsneC929ZGNnqvEVa3T8-phI-ra4Gp3ZkaG0stnPx1zwCJ6A>
X-ME-Proxy-Cause: dmFkZTEsUjVsRuDkUa7AsdpqUHn/DF5gSGtgp0t8TzPcoTvUuShZj8JJiVDC3OOXEtCV2r
    HxvjuTO6TDcDBy4GimavF8rjlflLcDYxuACE4bWE8jDIzLK6SKIeI4JBs4haT51OcvNaKx
    9e+X0NK037q9wSnPrajH28ZKGPxwsGVq7FukXREgnna0dCjjQX7q+MOjOKLt9MoAsVeVOi
    Jm52s0xdZY71jDkcx8KTwcECX1OQpEaFUqPHUAVdZWlHMaUdAwjh2E4c6P6aeqx2q+U1/N
    x79WnOCzEspF2JvrVc78i54LZo+ejlLcS7YeDpkJyRkZZpFY9i1JAJXPwzjylm9ORgKtQF
    /aMbxdJUQWK81aLhl19MdNhjdVB9Q+ACijf9YH1N219JKM1YqIcEv6IwgjxHpwO5GOD2N2
    siWcWFDKFV+DA6wrBaES/aFDc6a7ieB7Ji2wB3QNEv3hf1xYArHqfbsgc6b2ndSQHiMlNc
    A9XBKaDJBDkXlVewYP87uORVQgpWsN3fcazwC76qgsJkN3mO/52EohAtJ6BhioFEAOav4u
    IUImWAFMCtziV2O0XBeGYfnqxojIg4z93Bwv+gA3EfMmnpPdKLHv67BnTSDHALDySWsIZK
    lzHLeAOzrIOGH+RbDtd9abhxcuC39anQmauxMw7nKt0mBDWfK0srTa80+ErA
X-ME-Proxy: <xmx:l1r7aqRlQwBrmsGSQoSroK7Eep_8sK5kGLtajL4VxTRLDVji1VAZiQ>
    <xmx:l1r7arpxGIzlQHI5imELvfpHUUzhULRwoA6c12SbhurpD4Wv8Dsgug>
    <xmx:l1r7ak2j2I9BdDpP7SYYFsBvWH05IiZYZdJ98OE8_LWw0pOKR20EBg>
    <xmx:l1r7aq4gIvAKsDs_Jr9kGXhDzNnekzOFgKqq86jNrQPlC_whL6ruDA>
    <xmx:l1r7aoR3nbTsrOemmnE0wakAmdbT8ugINVyDE11rW1COkcAB4HBeCpug>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 03D94F8008E; Mon, 16 Nov 2026 14:33:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 16 Nov 2026 20:33:20 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>, "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Huacai Chen" <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
Message-Id: <49bd9e1e-abfb-4dd9-9de5-fe4e94308fd1@app.fastmail.com>
In-Reply-To: <179485513572.2274641.13924640952978903053.b4-review@b4>
References: <20261116142618.1687025-17-ardb+git@google.com>
 <20261116142618.1687025-25-ardb+git@google.com>
 <179485513572.2274641.13924640952978903053.b4-review@b4>
Subject: Re: [PATCH v3 08/15] efi/libstub: arm64: Use struct efi_image_info to access
 image properties
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



On Mon, 16 Nov 2026, at 19:52, Jason Gunthorpe wrote:
>> [ ... 53 lines skipped ... ]
>> @@ -22,23 +21,23 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
>>  				 efi_handle_t image_handle,
>>  				 const struct efi_image_info **image_info)
>>  {
>> -	unsigned long kernel_size, kernel_codesize, kernel_memsize;
>> +	unsigned long kernel_base	= efistub_kernel_base(*image_info);
>> +	unsigned long kernel_size	= efistub_kernel_size(*image_info);
>> +	unsigned long kernel_codesize	= efistub_kernel_codesize(*image_info);
>> +	unsigned long kernel_memsize	= efistub_kernel_memsize(*image_info);
>>  	efi_status_t status;
>>  
>> -	if (image->image_base != _text) {
>> +	if (image->image_base != (void *)kernel_base) {
>>  		efi_err("FIRMWARE BUG: efi_loaded_image_t::image_base has bogus value\n");
>> -		image->image_base = _text;
>> +		image->image_base = (void *)kernel_base;
>>  	}
>>  
>> -	if (!IS_ALIGNED((u64)_text, SEGMENT_ALIGN))
>> +	if (!IS_ALIGNED(kernel_base, SEGMENT_ALIGN))
>>  		efi_err("FIRMWARE BUG: kernel image not aligned on %dk boundary\n",
>>  			SEGMENT_ALIGN >> 10);
>>  
>> -	kernel_size = _edata - _text;
>> -	kernel_codesize = __inittext_end - _text;
>> -	kernel_memsize = kernel_size + (_end - _edata);
>>  	*reserve_size = kernel_memsize;
>> -	*image_addr = (unsigned long)_text;
>> +	*image_addr = kernel_base;
>>  
>>  	status = efi_kaslr_relocate_kernel(image_addr, reserve_addr,
>>  					   reserve_size, kernel_size,
>
> There is a further consolidation here, the two places that call
> efi_kaslr_relocate_kernel() get the args from image_info, so we could
> just pass image_info directly and remove the duplicated extraction and
> extra parameters.
>
> It could then handle the image_info adjustment too instead of open
> coding it twice.
>

Indeed.

> I wonder if riscv should have the segment_align and image_base checks
> too? Maybe the whole function is just a call to
> efi_kaslr_relocate_kernel() ?
>

IIRC they were added specifically for RedHat's spectacularly buggy
GRUB fork at the the time, so maybe by now we can just remove those.

>> [ ... 9 lines skipped ... ]
>> -asmlinkage void primary_entry(void);
>> -
>> -unsigned long primary_entry_offset(void)
>> -{
>> -	/*
>> -	 * When built as part of the kernel, the EFI stub cannot branch to the
>> -	 * kernel proper via the image header, as the PE/COFF header is
>> -	 * strictly not part of the in-memory presentation of the image, only
>> -	 * of the file representation. So instead, we need to jump to the
>> -	 * actual entrypoint in the .text region of the image.
>> -	 */
>> -	return (char *)primary_entry - _text;
>> -}
>
> I think this hunk belongs to the previous patch which removed the
> caller?
>

Indeed.

> Anyhow, the logic looks fine to me
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
