Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51318C6FD19
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Mar 2023 03:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9z+/l46qr5i4SabNjWYV+ekJ9rMQncZLSzkfTGG24/g=; b=hE9mwGxDYAsiiq
	SRtK0yu/GeJWQGAUqVdIgdyRmngeTldhNLxP1oSp9WSz9h4809hpoZxCejboIihySCTYW0s49OiBE
	hWiiedH5jP6MPuyUsHZlcvNZpTcq7LvApn5WGJgLQkj437ZxBNYUIEzxQGgS++D65Fg+QILS8J8BF
	DkMxEwdmp5x/KhMfXLQzRXOTQXVrPM0OPh+A0YgfaThPlHWCxVyFYxH/JI+/jMbW6IzvaTgI225IH
	OJRaZAuLI6UdINeMSIY7hTN3sjWXTA7qYdVe174syZv2T3+7LnIg9PzVhJmcR9wITc1aWlIAa3GHl
	gSqvgr1PdarerNmkM73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbYeR-0047dp-EX; Mon, 13 Mar 2023 03:15:07 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbYeJ-0047bA-92
	for linux-riscv@lists.infradead.org; Mon, 13 Mar 2023 03:15:01 +0000
Received: from kwepemi500014.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PZhWp2WmTzSkfF;
	Mon, 13 Mar 2023 11:11:34 +0800 (CST)
Received: from [10.35.19.253] (10.35.19.253) by kwepemi500014.china.huawei.com
 (7.221.188.232) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 13 Mar
 2023 11:13:17 +0800
Message-ID: <e02fdfce-4574-8e7e-ec96-8e8eaa4067bc@huawei.com>
Date: Mon, 13 Mar 2023 11:13:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] riscv: relocate R_RISCV_CALL_PLT in kexec_file
To: Torsten Duwe <duwe@lst.de>, Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt
	<palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>, Li Huafei <lihuafei1@huawei.com>, Liao
 Chang <liaochang1@huawei.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <liubao918@huawei.com>
References: <20230310182726.GA25154@lst.de>
From: Li Zhengyu <lizhengyu3@huawei.com>
In-Reply-To: <20230310182726.GA25154@lst.de>
X-Originating-IP: [10.35.19.253]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500014.china.huawei.com (7.221.188.232)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_201459_792037_F7A790C4 
X-CRM114-Status: UNSURE (   8.48  )
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

On Fri, 10 Mar 2023 19:27:03 +0100, Torsten Duwe <duwe@lst.de> wrote:
> Depending on the toolchain (here: gcc-12, binutils-2.40) the
> relocation entries for function calls are no longer R_RISCV_CALL, but
> R_RISCV_CALL_PLT. When trying kexec_load_file on such kernels, it will
> fail with
>
>   kexec_image: Unknown rela relocation: 19
>   kexec_image: Error loading purgatory ret=-8
>
> The binary code at the call site remains the same, so tell
> arch_kexec_apply_relocations_add() to handle _PLT alike.

R_RISCV_CALL has already been deprecated, and replaced by R_RISCV_CALL_PLT.

See Enum 18-19 in Table 3. Relocation types from 
https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-elf.adoc 
.

It was deprecated in ("Deprecated R_RISCV_CALL, prefer 
R_RISCV_CALL_PLT") 
https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a0dced85018d7a0ec17023c9389cbd70b1dbc1b0

>
> fixes: 838b3e28488f702 ("Load purgatory in kexec_file")
> Signed-off-by: Torsten Duwe <duwe@suse.de>
> Cc: stable@vger.kernel.org
>
> ---
> --- a/arch/riscv/kernel/elf_kexec.c
> +++ b/arch/riscv/kernel/elf_kexec.c
> @@ -425,6 +425,7 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
>   		 * sym, instead of searching the whole relsec.
>   		 */
>   		case R_RISCV_PCREL_HI20:
> +		case R_RISCV_CALL_PLT:
>   		case R_RISCV_CALL:
>   			*(u64 *)loc = CLEAN_IMM(UITYPE, *(u64 *)loc) |
>   				 ENCODE_UJTYPE_IMM(val - addr);
>
> .

Palmer, please apply these references to the commit message.

Reviewed-by: Li Zhengyu <lizhengyu3@huawei.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
