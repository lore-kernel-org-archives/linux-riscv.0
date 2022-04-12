Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12295C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 11:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SwmDPEPsC+LDXuhaj+38BbyO6dyDkrjLFVVi5Ozs4M=; b=BsTRH4l+I4NBhc
	rF2lBk/sxqll0oqNaHjli1yHAWRiO2V+2eEitHJzzJUKU6H3BNwmlYHirFGqhHd9pD+/CQ1bKxeak
	V6bCzzUE2Wh6R2vZr73idqAF/7zEFmlahaGbHydDivJ99KCOc3rpQ1mnIa7QtMYhKUzUWiVzufuYF
	wcokyqyF9NGPQl8yFdIZCvA6zvQswyHSYi8Qp/08wyM1JtBFfCrZXBNLAITzg5zUOIZfXDD5ugcDO
	XXP9v8h/SIkgVers0EUDHQo5NyI56ZMCEJuHKqKbsY5IbNFeAS+ox8K4odYz9QSyPA0kotpKxPwzs
	mIl/SMl7MeVCfxj4OEYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neEzj-00DpAs-2l; Tue, 12 Apr 2022 11:47:39 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neEsu-00DmDL-US
 for linux-riscv@lists.infradead.org; Tue, 12 Apr 2022 11:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649763637; x=1681299637;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CEPm7umbMupxMebiwkuP+fJcBJ3QXrLrjof4l//fGl0=;
 b=eeWNJ68u+wtPl0SOkcXHH1//R1RfhZZrmZq/dZH3hTI9eM8LhHjCpoft
 tORAuf/4aQB0gqYGmoz4rrDmGgl9aHcjRv1KoljDLpfLgXDZDbWhJqYzN
 6q0lVwvbz5+MjH5JI19hE6Opwl56ps/sSnuv+WfK7QSVeaTrm9i4gQ7cG
 BLyIIPN81Wkggb0zf0e1RwsVRT4FOeKUTX9NGTo6aFNlR02y6B7iz6L0W
 AWA6Aq2XRcYFUhITyuSMB0fhkGAD03TnM2cSIpn0Y9sxmy6mp/icu2RIl
 YKKW59jcEsoeNmRo8pO7mBUmsGAp2HUmhDpvTHjC32wi/7SdnKpscbDmq g==;
X-IronPort-AV: E=Sophos;i="5.90,253,1643644800"; d="scan'208";a="196589480"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Apr 2022 19:40:33 +0800
IronPort-SDR: Ae0JffKKrLli6cSmYxcKFp21oo8vswx2Dg4WNe9Hl3BCsXMgH+oguSNqLEBgvnG2vZ5w6E/sfI
 Wx9m7l2lF4DUic/T2OjpmuzyN/4xDF9f4g+8UvuqBjDg1TpC+ERtd2/2HipmqjEFowiLzSzMar
 AqyrTOhQrp23RDAN02b66HEGk4j5AV07VkmHn3/1T+gFzACkloBfboKWH0PcNOJFouxAzCSmKp
 K+XyzbOfesFdGMXfMoFfWC50Otywh6AA3zz6BDuIxSARYgp4Gv0d0R59av6+MuLbNJpCndT6HW
 wnmakl/HJlKB8dF/r0XS/zeI
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Apr 2022 04:11:49 -0700
IronPort-SDR: yS3fvuDqDZPZRkUBmel/4t0E5hLle0XNIk77k6cGSnL/46wGvZtGujf6RbyrN48MOlXMRoi2hb
 9idfV0EOT0XDOw66t5wwkClqJjtYazp+0WAKbSa0XnhI5Sb7xqgJZtXXWBW/W2bRNn0y2JAUBx
 i0fgMfiFUTKKOiHWM9Sn7N2ehjHGPdHVTDiEgqLcM1DLPNA9Tdp1pBPE59L6slmXvKkYZ6DduK
 sdZkBC+rqOk4XM9T6JbeJWZn7BqMXZiteXUQqO4iarZV5IFMJ6KzNaSZQhEL3g1H1+JtRlbZ0K
 tsQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Apr 2022 04:40:33 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Kd3gj0ClKz1SVp2
 for <linux-riscv@lists.infradead.org>; Tue, 12 Apr 2022 04:40:32 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1649763631; x=1652355632; bh=CEPm7umbMupxMebiwkuP+fJcBJ3QXrLrjof
 4l//fGl0=; b=ShLvYqbc7ZlHbuJKbi61QqHOdYGpOLufVFi1DysgrX71oT87qkj
 ewEx4EutPBOvmS7DJDUVH2F6XZqqHh5jCJtICuraBHfciXIYOkZ7oj2ak8/fIgdT
 1F8tP4ATGMn/Gvu08lL/cMemk0XoWWqMSWuzL84LVJ9izxB5FV6Q3Gj7YlvYeuE9
 vefWPDyp1VznyAEoqUCadqDk66N4A9uTlRA/YjFuHw+5Vsr4//N6gyEtYCHlMSpE
 0jAyJ3uJccWfVPlAfk274gvtro6vaQgvNTWjMEANmAj9HTRCxUZ+YpNDdI10cIBa
 xzXotA80k5/mMN9oVq4GwxGIw3JT+4pl9Zw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id YWQ-WcfBmkU8 for <linux-riscv@lists.infradead.org>;
 Tue, 12 Apr 2022 04:40:31 -0700 (PDT)
Received: from [10.225.163.9] (unknown [10.225.163.9])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Kd3gd37GCz1Rvlx;
 Tue, 12 Apr 2022 04:40:29 -0700 (PDT)
Message-ID: <9437ce7f-0553-3688-5695-69add6b2971c@opensource.wdc.com>
Date: Tue, 12 Apr 2022 20:40:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] binfmt_flat: do not stop relocating GOT entries
 prematurely
Content-Language: en-US
To: Niklas Cassel <niklas.cassel@wdc.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Mike Frysinger <vapier@gentoo.org>,
 stable@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org
References: <20220412100338.437308-1-niklas.cassel@wdc.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220412100338.437308-1-niklas.cassel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_044037_093828_50F5A19D 
X-CRM114-Status: GOOD (  34.02  )
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

On 4/12/22 19:03, Niklas Cassel wrote:
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
> that has the first word (two u32 entries for 64-bit archs) set to -1.
> See e.g. the binutils implementation for architectures [1] [2] [3] [4].
> 
> This causes the binfmt_flat loader to stop relocating GOT entries
> prematurely and thus causes the application to crash when running.
> 
> Fix this by ignoring -1 in the first two u32 entries in the .data section.
> 
> A -1 will only be ignored for the first two entries for bFLT binaries with
> FLAT_FLAG_GOTPIC set, which is unconditionally set by elf2flt if the
> supplied ELF binary had the symbol _GLOBAL_OFFSET_TABLE_ defined, therefore
> ELF binaries without a .got input section should remain unaffected.
> 
> Tested on RISC-V Canaan Kendryte K210 and RISC-V QEMU nommu_virt_defconfig.
> 
> [1] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/elfnn-riscv.c;hb=binutils-2_38#l3275
> [2] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/elfxx-tilegx.c;hb=binutils-2_38#l4023
> [3] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/elf32-tilepro.c;hb=binutils-2_38#l3633
> [4] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/elfnn-loongarch.c;hb=binutils-2_38#l2978
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
> RISC-V elf2flt patches are still not merged, they can be found here:
> https://github.com/floatious/elf2flt/tree/riscv
> 
> buildroot branch for k210 nommu (including this patch and elf2flt patches):
> https://github.com/floatious/buildroot/tree/k210-v14
> 
>  fs/binfmt_flat.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
> index 626898150011..b80009e6392e 100644
> --- a/fs/binfmt_flat.c
> +++ b/fs/binfmt_flat.c
> @@ -793,8 +793,17 @@ static int load_flat_file(struct linux_binprm *bprm,
>  			u32 addr, rp_val;
>  			if (get_user(rp_val, rp))
>  				return -EFAULT;
> -			if (rp_val == 0xffffffff)
> +			/*
> +			 * The first word in the GOTPLT header is -1 on certain
> +			 * architechtures. (On 64-bit, that is two u32 entries.)
> +			 * Ignore these entries, so that we stop relocating GOT
> +			 * entries first when we encounter the -1 after the GOT.
> +			 */

		/*
		 * The first word in the GOTPLT header is -1 on certain
		 * architectures (on 64-bit, that is two u32 entries).
		 * Ignore these entries so that we stop relocating GOT
		 * entries when we encounter the first -1 entry after
		 * the GOTPLT header.
		 */

> +			if (rp_val == 0xffffffff) {
> +				if (rp - (u32 __user *)datapos < 2)
> +					continue;

Would it be safer to check that the following rp_val is also -1 ? Also,
does this work with 32-bits arch ? Shouldn't the "< 2" be "< 1" for
32-bits arch ?

>  				break;
> +			}
>  			if (rp_val) {
>  				addr = calc_reloc(rp_val, libinfo, id, 0);
>  				if (addr == RELOC_FAILED) {


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
