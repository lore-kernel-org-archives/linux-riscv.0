Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DCE606A8A3
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 16:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hiUeRLr9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m9cRC5y4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=rGnQ5nHW5xVogbYerYtW99ewB6EO3fzNfBlcU7XMruY=; b=hiUeRLr9k/z6mcvTOVHsXcpvkP
	y+VBDYXZH4a5jOmbQE4tbkirKAeyCauGVJWaNIszeQGjt/1aqK/Dzi/yiyVf+oiHVKpumyNLRMHhk
	Zxax3M6NEpQ5iiB07CnRpgIt28NNYIXI75YOPTqr8kA3iHh2BCfezbNkg48S+uzJygsWM8ooNZPVm
	DYAdOZfSjNz8g96VrxYOxNA/dFjdaZg6HlVkZvzXth28AXa8wgC6zkEkRWGruewmmA2BSBN6qrMDC
	nLg2VEBY3Dg4YiucbfFpl6bWaLnLJLYyT06SdbGxhA22EUQzAaZSewzXiuirEEOaXMXIMjNWgehay
	PuFFUdlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtwU-0000000DWGu-2zhr;
	Fri, 13 Nov 2026 16:15:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtwS-0000000DWGQ-1Mr2
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 16:15:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B05E045045;
	Fri, 13 Nov 2026 16:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2881F000C4;
	Fri, 13 Nov 2026 16:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794586555;
	bh=UvoCI+F3UN/r+kCCyYEcI97wbIPvzPchSwyBMSLm3Yw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=m9cRC5y4jEqyeUfTSiVv1SHJ/FydJ1utrE8vOHrzFWXR2EPMNSdg41+mwBMikFNz4
	 /MBj2cfNiV7S/OblzgS4W3wbSJAbURSzCfBuqgPpiaX+qPtP4pUftzY10ikl0jP4JU
	 DxQ+ryIydfzMgIC9Jld37fyVF36gJIHuIZmjOzN1BpYWEYtejmGT2rHBltgVVY43A3
	 YTtv4eMONGxHzrpotvKXTcqaOOssYWGYUboJiWiwCJrPOMTz05fkPkfxH7m+yfEpo2
	 zpX9c2q+5rgsDzx48oYn5q8rjdufVgTLIDNnnCpjdKszr5Pp9WnCLmwtw1hr7/aNi2
	 3+n20jkvBiauA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 0240D198003A;
	Fri, 13 Nov 2026 11:15:53 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 13 Nov 2026 11:15:53 -0500
X-ME-Sender: <xms:tjf3anI-XrM1rzyEKV3TsVn0tQkQzK2XUXBxRhJP5kB-KddizlLQ0w>
    <xme:tjf3akk4lCV2YgUyysfOinfbMl0AeVuHNAC_TQGRnH4c7vErfaPMU63i_RYmyECVR
    cmHz6vQlxJXJZKRdm4TljeAYvoPcntPZ4L4Vn961g_nqmsamp1ivLSO>
X-ME-Proxy-Cause: dmFkZTFAQfv4vgc59PJfnI7+gnjbFo5pjWqPci2q637Dc+jTlN98BS3SOu191Kx5oeX5zT
    cpsU4696TXwbo6E9T70+3zgZ4ZQT4u2WZYZrLNrdudOZVkNXMyzUwvt29gWlqjMBSeCuS9
    xWLhKpKLiLkYBm/I4/mkEe9fPCWkZoThd9No+pzePTALJyZz0DWj5omvVUsTJm/N8GHQYm
    DOd8INghd05soloR06GFbIa7ZzhmJnA5LN2JEN1zSxA5iEYfypiw5rdG7NEX58RL/EvMbS
    7slEaTvIn0pajVNLktDqnig4nTGsVfUSIfAs0Ux0u7J4sDsFCJhyhxUP6Frqsgl8B1A/CG
    s/j6i18iK4vWXI1FdcRk9LnIkKn74i9Yhk81YCSMJfEnMcLY20EVMRM/6UGEolaZOYQCzg
    ZvC+RNRsBxv3IJxnLtOn70i8xsFr9xBrv/ED+iFr2bHy4x+BpbFRBEf7SfIb8XLr6hK8kF
    Baaop2OXhbUjF5ZuU5duB/0k6jn1CPCJdS4dvDXPS3Bt8iXz9s6WH1dFfnVd7zGCchXAQG
    E2n7fVlr1OZ0/+MDkpS4Kv5tFhlIodvqjId3+7qOGwlktbRSBVu8JWi6yCOMroglq/vqEM
    4wP+wSNywxxU1uJBN1CbH4i7HphUnvs7PZo4+opuiJE8SPFkwU3I+VU4lUQA
X-ME-Proxy: <xmx:uDf3ajCoYN_KPZOMcB6qtN-R6od7UDzch01jyl6v8tk6cBQxj2Cj4Q>
    <xmx:uDf3avEbNlME5ubNM4a2O4OrZanjSXdVtBK6BowjWnUXilDqtk7mXA>
    <xmx:uDf3aoLzod8yEADhATBJWWS2gEZOnq8dAHTLTmA0h7i_jo60t5MVIg>
    <xmx:uDf3amq4GdBo6Xpqdf1_bUNO_PW5EFSPUTAP7JF17vb9ewtylzlYhg>
    <xmx:uDf3avjcVhpjhgRD-idErmSAru7l6xJZID9o6TemQcneI_udBuOohP9R>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 768CAF80093; Fri, 13 Nov 2026 11:15:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 13 Nov 2026 17:15:29 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>, "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Huacai Chen" <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
Message-Id: <274609cc-2c17-4bde-bcf3-f309655f0594@app.fastmail.com>
In-Reply-To: <179458262195.3625095.6692761412463057203.b4-review@b4>
References: <20261110121731.2728824-12-ardb+git@google.com>
 <20261110121731.2728824-16-ardb+git@google.com>
 <179458262195.3625095.6692761412463057203.b4-review@b4>
Subject: Re: [PATCH v2 04/10] efi/libstub: Capture loaded image information in struct
 efi_image_info
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 13 Nov 2026, at 16:10, Jason Gunthorpe wrote:
>> [ ... 131 lines skipped ... ]
>> @@ -80,7 +87,8 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
>>  
>>  	kernel_image_offset = image_addr - (unsigned long)image->image_base;
>>  
>> -	status = efi_stub_common(handle, image, image_addr, cmdline_ptr);
>> +	status = efi_stub_common(handle, image, image_addr, cmdline_ptr,
>> +				 efistub_get_image_info());
>
> efistub_get_image_info() always returns the pointer from the EFI stubs
> location, but at this point the kernel has been relocated and now we
> are passing an info pointer that is outside image to everything else
> while the zboot path passes an info inside the image.
>
> It would be better if info is always pointing inside the final
> image. Then you can use info to always get a pointer inside the
> ultimate kernel, which is what all the DRTM values need.
>
> Having efistub_get_image_info() take in image_base, and then using
> weak to overlay it with zboot's version would give a consistent
> interface.
>
> The adjustment can be calculated like this:
>
> 	return (const void *)(image_base - efistub_image_info._text_offset);
>
> That would allow cleaning up the primary_entry() flow to just use
> info, and remove the weak functions:
>
> void __noreturn efi_enter_kernel(const struct efi_image_info *image_info,
> 				 unsigned long fdt_addr,
> 				 unsigned long fdt_size)
> {
> 	void (* __noreturn enter_kernel)(u64, u64, u64, u64) =
>                  efistub_kernel_ptr(image_info, entry);
> 	enter_kernel(fdt_addr, 0, 0, 0);
> }
>
> (see below for macro)
>
> You could do the same by passing image_base and image_info everywhere,
> but that seems less nice.
>

I'd prefer to handle this by adding another offset, and an API to update
it after moving the image. That way, the EFI stub code can still grab the
info struct pointer without threading it through the API, while it will
always remain valid.

>> [ ... 20 lines skipped ... ]
>> +++ b/drivers/firmware/efi/libstub/efistub.h
>> @@ -1148,11 +1148,53 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
>>  				 efi_loaded_image_t *image,
>>  				 efi_handle_t image_handle);
>>  
>> +struct efi_image_info {
>> +	s32	_text_offset;
>> +	s32	__inittext_end_offset;
>> +	s32	_edata_offset;
>> +	s32	_end_offset;
>> +	s32	entry_offset;
>> +};
>
> This ends up in a cross-arch header.. It seems OK, the x86 voffset.h
> parts can fit cross-arch like this too.
>
> For DRTM I will do it like this:
>
> #ifdef CONFIG_EFI_STUB_DRTM
> 	s32	__drtm_measured_start_offset;
> 	s32	__drtm_measured_end_offset;
> 	s32	drtm_entry_offset;
> 	s32	drtm_handoff_offset;
> #endif
>
> Which should be fine, every DRTM will need those four things at least.
>

I think that is fine. We could add an arch substruct once we need it
but that seems premature at this point.

>> +
>> +const struct efi_image_info *efistub_get_image_info(void);
>> +const struct efi_image_info *zboot_get_image_info(unsigned long image_base);
>> +
>> +static inline
>> +unsigned long efistub_kernel_base(const struct efi_image_info *image_info)
>> +{
>> +	return (unsigned long)offset_to_ptr(&image_info->_text_offset);
>> +}
>> +
>> +static inline
>> +unsigned long efistub_kernel_size(const struct efi_image_info *image_info)
>> +{
>> +	return image_info->_edata_offset - image_info->_text_offset;
>> +}
>> +
>> +static inline
>> +unsigned long efistub_kernel_memsize(const struct efi_image_info *image_info)
>> +{
>> +	return image_info->_end_offset - image_info->_text_offset;
>> +}
>> +
>> +static inline
>> +unsigned long efistub_kernel_codesize(const struct efi_image_info *image_info)
>> +{
>> +	return image_info->__inittext_end_offset - image_info->_text_offset;
>> +}
>> +
>> +static inline
>> +unsigned long efistub_kernel_entry_offset(const struct efi_image_info *image_info)
>> +{
>> +	return image_info->entry_offset - image_info->_text_offset;
>> +}
>
> As above a little helper to get a void * would be useful:
>
>   static inline void *
>   __efistub_kernel_entry_ptr(const struct efi_image_info *image_info, 
> s32 offset)
>   {
> 	  return (void *)((offset - image_info->_text_offset) +
> 			  efistub_kernel_base(image_info));
>   }
>   #define efistub_kernel_ptr(image_info, ptr) \
> 	  __efistub_kernel_entry_ptr(image_info, (image_info)->ptr##_offset)
>
> If the rework above is done this would replace
> efistub_kernel_entry_offset()
>
>> [ ... 15 lines skipped ... ]
>> +++ b/drivers/firmware/efi/libstub/image_info.S
>> @@ -0,0 +1,12 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +#define REL_REF(sym)	.long	sym - 0b
>
> The code could consistently use the offset_to_ptr() macro if the label was
> included in the macro?
> 
>   #define REL_REF(sym)	0: .long	sym - 0b
>
> It would make the efistub_kernel_ptr() simpler, and the three size
> calculations would look like:
>
> 	return efistub_kernel_ptr(image_info, __inittext_end) - 
> 	       efistub_kernel_ptr(image_info, _text);
>

Again, probably cleaner to just refer to the copy of the struct once
it exists.

>> +
>> +	.globl		__efistub_efistub_image_info
>> +	.p2align	3
>> +__efistub_efistub_image_info:
>> +0:	REL_REF(_text)
>> +	REL_REF(__inittext_end)
>> +	REL_REF(_edata)
>> +	REL_REF(_end)
>> +	REL_REF(efi_primary_entry)
>
> Can you put a
>
> +	.section	".init.rodata", "a"
>
> Here?
>

Ack

> The DRTM patch points this to various things in .init. sections and
> modpost will complain. I think nothing outside the efi stub should
> touch this stuct and it should be freed as init data right?
>

Yes.

>> [ ... 18 lines skipped ... ]
>> @@ -93,9 +100,15 @@ efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
>>  	}
>>  
>>  	// Decompress the payload into the newly allocated buffer
>> -	status = efi_zboot_decompress((void *)image_base, alloc_size) ?:
>> -	         efi_stub_common(handle, image, image_base, cmdline_ptr);
>> +	status = efi_zboot_decompress((void *)image_base, alloc_size);
>> +	if (status != EFI_SUCCESS)
>> +		goto error;
>>  
>> +	auto image_info = zboot_get_image_info(image_base);
>
> auto is allowed in the kernel now?
>

Yes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
