Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3375C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Feb 2022 07:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKIad3AsXClmFDMkMihyODlptLa6RI7DUiZrkFJExfI=; b=BLw1XYNV5QwyFl
	UZ9qkRuaEtF6s4PAH9//RS2R3LhaxwMbXZP/uwhZv2jhCFDpckHb6CgyCorZF9MdTQE+ajU8oEhs/
	t7eZ7faksl83n34ZfsSITGU2714sQrn9vVbrb+zxD2+ek8a4ANn1PS49+GXNB1jcxdp03xn9k/Lbq
	NIvKF+FAjWBa42xLLTv8Cxu4Nt6rLHDgg8V+6NA6c656LLUg7tWsokOANtwkUFqWgoQH5fc17IX0e
	ytDQk3MWyN++Kzt8artFaqgWEeoQZ4DLL9uW7Qv1s7lT16gOD5LVdcihkFdUblVUgYz7+JzUi9b4C
	dXT4W6Wg+aLEAj23/XNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFAR6-00ETSl-Vp; Wed, 02 Feb 2022 07:52:17 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFAQt-00ETOP-Ua; Wed, 02 Feb 2022 07:52:05 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id D45AE67373; Wed,  2 Feb 2022 08:51:59 +0100 (CET)
Date: Wed, 2 Feb 2022 08:51:59 +0100
From: Christoph Hellwig <hch@lst.de>
To: guoren@kernel.org
Cc: palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com,
 wefu@redhat.com, drew@beagleboard.org, wangjunqiang@iscas.ac.cn,
 hch@lst.de, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V5 15/21] riscv: compat: Add hw capability check for elf
Message-ID: <20220202075159.GB18398@lst.de>
References: <20220201150545.1512822-1-guoren@kernel.org>
 <20220201150545.1512822-16-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220201150545.1512822-16-guoren@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_235204_154623_F8C27E54 
X-CRM114-Status: GOOD (  13.33  )
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

On Tue, Feb 01, 2022 at 11:05:39PM +0800, guoren@kernel.org wrote:
> +bool compat_elf_check_arch(Elf32_Ehdr *hdr)
> +{
> +	if (compat_mode_support && (hdr->e_machine == EM_RISCV))
> +		return true;
> +	else
> +		return false;
> +}

This can be simplified to:

	return compat_mode_support && hdr->e_machine == EM_RISCV;

I'd also rename compat_mode_support to compat_mode_supported

> +
> +static int compat_mode_detect(void)
> +{
> +	unsigned long tmp = csr_read(CSR_STATUS);
> +
> +	csr_write(CSR_STATUS, (tmp & ~SR_UXL) | SR_UXL_32);
> +
> +	if ((csr_read(CSR_STATUS) & SR_UXL) != SR_UXL_32) {
> +		pr_info("riscv: 32bit compat mode detect failed\n");
> +		compat_mode_support = false;
> +	} else {
> +		compat_mode_support = true;
> +		pr_info("riscv: 32bit compat mode detected\n");
> +	}

I don't think we need these printks here.

Also this could be simplified to:

	compat_mode_supported = (csr_read(CSR_STATUS) & SR_UXL) == SR_UXL_32;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
