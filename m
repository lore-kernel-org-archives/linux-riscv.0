Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC40C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 23:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KxhVRAOXdMb4Eex+4A6Du1aDihtrWE0orex3nZF/0Q4=; b=uGe3FLx3kuAbYO
	i4Y8Ps2+V3VIK1YcYXuqpO3pZJMwtcd1Wz4AxWlWLvcnFUUSjFMfLnC48/Sn7tEj9/KHrc6tz1oJT
	KJImjixPKHT+klsknN+Pzm+lUxxm7aCNatfRdfHMcQvCwChEHBTgGZW/8rPWENWq8lbIDf/+p9+sT
	WV80OQLPxOi3Jpbv9z0oKsY1Vqdj2P6kskJ0oZaEpnh8ibEgwlJGgd6Nff/eLpWZjaEtZfIBZRoPe
	7Jb8SH0IksABjVl1O63WPbENTACn1R7HA5ixi0QZOsv1/dyUU1cFRQSMByxCLY3D+4YbMfb2i0CuE
	RTR2++UIJg0ydVpcB1cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf9FW-007qIt-E5; Thu, 14 Apr 2022 23:51:42 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf9FR-007qHF-Kt
 for linux-riscv@lists.infradead.org; Thu, 14 Apr 2022 23:51:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649980297; x=1681516297;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WbVM9cfScKKYc/EursZygzoF86dsBLIRg6xwYxy7W0E=;
 b=cMI2cIC+O8E71nAKZx8g2VKZVqet9M1BHPzSn4mo6iOnrxX7epVGz1Ak
 xL/LcDAcrUlK14bzrwDG5XDiKJlJ3xv13Fv3hvO4W9aDt+0030EWV117V
 2Fisgz/a0s7wanRON3E9BaClOA6TTADk8KTuCp511AF0yDU8omdoqD9rp
 RjZngpsvtq9vlBqyKn1s3huAgCzFkErdA21fWjaFRYPpt/DYU9ZRuxy5X
 CJWUXnyFYZSbcZSGHNlxT43zmbKTr2lI1/zuchfxYJSUmy/mcNdmnFLd1
 crq7BJMLrz5beVX3eKbsvGCdBujvk+GyhgJD6cpsTk7UEI8UOIDMAhPHM A==;
X-IronPort-AV: E=Sophos;i="5.90,261,1643644800"; d="scan'208";a="202814114"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2022 07:51:32 +0800
IronPort-SDR: 0kJVkryqHpInb2XTF251PYQfnhPD8/jYFiV1b9YcxUFlFLqES85FwxMtDi2fqwrN9u6DC71t3Q
 erWxCZEKIh0p6irOJeIWH0/rwrrVkGA8VS7HzVrQHIyLLmzU6jTHDrV14nFaVjqRwxUuVp/fwb
 s2WrsO0YQgZQZoJPspZYFYwO+Us2TKb5BMOMJh4fzmXUX0CriBENRfSIVtCCDBfY8CzZn5eTzU
 fsUVw/Wnpv7f6Z295F0doUbLx3gg2hIve6jJzAslA4cn8r2nAGcIph+0kCpc67mPbmI64mFVEG
 +7vL6qdKdeWjUx4G3mJflZuD
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2022 16:21:57 -0700
IronPort-SDR: bSxu+hf2Cgh3u2w0DFocKvriaqsCATVMUZfUpFXlVd7nJKL04ttjbVqxyVn6f6KnUkv204MirU
 FoFwEUZ1oGBZ6jLWYlOYmKU8UJvlLtH/rcEPnWN87qH9ai17x6XTT9PfhxPNi5ThNj4Mmk0ZOJ
 2hGZ5KJdYaOd3s4bDaX10gB3nN49+NUpyBzpNDUbtfXWOkKjYIOKi8xLY0hvu4r7juQjLEDxuM
 HGHdSoA6asY27e86/xD10vnyMYu9unJf6HPXkH7wvMw0HON7PLrIP6Cnd4Gd1yMDTrVrRxi5Cd
 8Io=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2022 16:51:33 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KfbpD5z91z1SVp0
 for <linux-riscv@lists.infradead.org>; Thu, 14 Apr 2022 16:51:32 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1649980291; x=1652572292; bh=WbVM9cfScKKYc/EursZygzoF86dsBLIRg6x
 wYxy7W0E=; b=cKEhB42giErCT2IlFVEQa2gh6lHnR8sHxTTUPuQWALBSpaAGvGT
 mGL4PdrltRTNgGcZVQhmNWj+iOhhaj7raUOIsMozPAD3jvXBE4Y7rhE6kYmMW+GU
 SqbqYrYbDcdJwswoJ2O7p/OylgnhOC4xbRfuY15N5vs8YrmxwMdkVq4zffFXHgY0
 I/FAgjKzXKzRjN6jSnwKZA0MrTdAW2KKLPtvrD9a0EBVi3Vt/yPxqUCF4cBm7Xaa
 UPjYAq3mJb+Z7jFuHA0DJkxAcDC3tz3bWT8y1s99lGuVm4JPrILm0NvTCS6AUgRb
 9frurXIYEBUxcziyVQUXnkBzincyCOiaBLQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id wmPmqtG9MdH2 for <linux-riscv@lists.infradead.org>;
 Thu, 14 Apr 2022 16:51:31 -0700 (PDT)
Received: from [10.225.163.9] (unknown [10.225.163.9])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Kfbp91f4qz1Rvlx;
 Thu, 14 Apr 2022 16:51:29 -0700 (PDT)
Message-ID: <f379cb56-6ff5-f256-d5f2-3718a47e976d@opensource.wdc.com>
Date: Fri, 15 Apr 2022 08:51:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] binfmt_flat: do not stop relocating GOT entries
 prematurely on riscv
Content-Language: en-US
To: Niklas Cassel <niklas.cassel@wdc.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Mike Frysinger <vapier@gentoo.org>,
 stable@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org
References: <20220414091018.896737-1-niklas.cassel@wdc.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220414091018.896737-1-niklas.cassel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_165137_715733_E70C612B 
X-CRM114-Status: GOOD (  37.19  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/14/22 18:10, Niklas Cassel wrote:
> bFLT binaries are usually created using elf2flt.
> 
> The linker script used by elf2flt has defined the .data section like the
> following for the last 19 years:
> 
> .data : {
> 	_sdata = . ;
> 	__data_start = . ;
> 	data_start = . ;
> 	*(.got.plt)
> 	*(.got)
> 	FILL(0) ;
> 	. = ALIGN(0x20) ;
> 	LONG(-1)
> 	. = ALIGN(0x20) ;
> 	...
> }
> 
> It places the .got.plt input section before the .got input section.
> The same is true for the default linker script (ld --verbose) on most
> architectures except x86/x86-64.
> 
> The binfmt_flat loader should relocate all GOT entries until it encounters
> a -1 (the LONG(-1) in the linker script).
> 
> The problem is that the .got.plt input section starts with a GOTPLT header
> (which has size 16 bytes on elf64-riscv and 8 bytes on elf32-riscv), where
> the first word is set to -1. See the binutils implementation for riscv [1].
> 
> This causes the binfmt_flat loader to stop relocating GOT entries
> prematurely and thus causes the application to crash when running.
> 
> Fix this by skipping the whole GOTPLT header, since the whole GOTPLT header
> is reserved for the dynamic linker.
> 
> The GOTPLT header will only be skipped for bFLT binaries with flag
> FLAT_FLAG_GOTPIC set. This flag is unconditionally set by elf2flt if the
> supplied ELF binary has the symbol _GLOBAL_OFFSET_TABLE_ defined.
> ELF binaries without a .got input section should thus remain unaffected.
> 
> Tested on RISC-V Canaan Kendryte K210 and RISC-V QEMU nommu_virt_defconfig.
> 
> [1] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/elfnn-riscv.c;hb=binutils-2_38#l3275
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
> Changes since v1:
> -Incorporated review comments from Eric Biederman.
> 
> RISC-V elf2flt patches are still not merged, they can be found here:
> https://github.com/floatious/elf2flt/tree/riscv
> 
> buildroot branch for k210 nommu (including this patch and elf2flt patches):
> https://github.com/floatious/buildroot/tree/k210-v14
> 
>  fs/binfmt_flat.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
> index 626898150011..e5e2a03b39c1 100644
> --- a/fs/binfmt_flat.c
> +++ b/fs/binfmt_flat.c
> @@ -440,6 +440,30 @@ static void old_reloc(unsigned long rl)
>  
>  /****************************************************************************/
>  
> +static inline u32 __user *skip_got_header(u32 __user *rp)
> +{
> +	if (IS_ENABLED(CONFIG_RISCV)) {
> +		/*
> +		 * RISC-V has a 16 byte GOT PLT header for elf64-riscv
> +		 * and 8 byte GOT PLT header for elf32-riscv.
> +		 * Skip the whole GOT PLT header, since it is reserved
> +		 * for the dynamic linker (ld.so).
> +		 */
> +		u32 rp_val0, rp_val1;
> +
> +		if (get_user(rp_val0, rp))
> +			return rp;
> +		if (get_user(rp_val1, rp + 1))
> +			return rp;
> +
> +		if (rp_val0 == 0xffffffff && rp_val1 == 0xffffffff)
> +			rp += 4;
> +		else if (rp_val0 == 0xffffffff)
> +			rp += 2;

This looks good to me. But thinking more about it, do we really need to
check what the content of the header is ? Why not simply replace this
entire hunk with:

		return rp + sizeof(unsigned long) * 2;

to ignore the 16B (or 8B for 32-bits arch) header regardless of what the
header word values are ? Are there any case where the header is *not*
present ?

> +	}
> +	return rp;
> +}
> +
>  static int load_flat_file(struct linux_binprm *bprm,
>  		struct lib_info *libinfo, int id, unsigned long *extra_stack)
>  {
> @@ -789,7 +813,8 @@ static int load_flat_file(struct linux_binprm *bprm,
>  	 * image.
>  	 */
>  	if (flags & FLAT_FLAG_GOTPIC) {
> -		for (rp = (u32 __user *)datapos; ; rp++) {
> +		rp = skip_got_header((u32 * __user) datapos);
> +		for (; ; rp++) {
>  			u32 addr, rp_val;
>  			if (get_user(rp_val, rp))
>  				return -EFAULT;

Regardless of the above nit, feel free to add:

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
