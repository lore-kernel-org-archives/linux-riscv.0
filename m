Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E882C43219
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 12:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DVHNYshV/8yB/BHLvVpN/NvZSMCyePhv5GOnz/FNELo=; b=UtnCn3X32n9Vyx
	iM2dyYdZU3ucpAPvWhj8FEYmpkGGl+XAwBMQKaNg9GvNmbCoOcfQwZolxDj50F8qaZkgo3wiMLf00
	zGSCMDN5SHjXbfhI1c/KZU3Vg/y6JgwCoWxEuOh2Y5z7MLNiAw3a4dRId1mHbkp0MOx7YXa3tn6QK
	BeGAjqvrYB4Mfto6ZfXoU1w4fPZIIwzE+MzHeFuEpgCu1E9OEcwVNWKZqkI11zyxfiTQmiIqCQHLt
	Y24J5ioaPk41D6qEfVWgI4rsnhTx124qCl7dhHh8fSO0OUxbARkl8klW+oIABqAbVSt9kmFXqm3+r
	5unEEDHaijCp+eHMewdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEVi6-009JnF-Bw; Mon, 31 Jan 2022 12:23:06 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nEVi4-009JmW-Jp; Mon, 31 Jan 2022 12:23:04 +0000
Date: Mon, 31 Jan 2022 04:23:04 -0800
From: Christoph Hellwig <hch@infradead.org>
To: guoren@kernel.org
Cc: palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com,
 wefu@redhat.com, drew@beagleboard.org, wangjunqiang@iscas.ac.cn,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Anup Patel <anup.patel@wdc.com>
Subject: Re: [PATCH V4 05/17] riscv: Fixup difference with defconfig
Message-ID: <YffUqErSVDgbGLTu@infradead.org>
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-6-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220129121728.1079364-6-guoren@kernel.org>
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

On Sat, Jan 29, 2022 at 08:17:16PM +0800, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Let's follow the origin patch's spirit:
> 
> The only difference between rv32_defconfig and defconfig is that
> rv32_defconfig has  CONFIG_ARCH_RV32I=y.
> 
> This is helpful to compare rv64-compat-rv32 v.s. rv32-linux.
> 
> Fixes: 1b937e8faa87ccfb ("RISC-V: Add separate defconfig for 32bit systems")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>

Wouldn't a common.config that generats both the 32-bit and 64-bit
configs a better idea?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
