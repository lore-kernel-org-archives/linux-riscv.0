Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F1FC04A6A
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 07:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+JS6KfSqiP6H1nFvm0PlNDZO9RSPTWRQCnXVK0c8HP0=; b=dKZM/1Nw8Xps20
	CvIddxqFyCLx4uzcUxyelL8sthCiQHQ5pFRReVKmfCjZnfIQCmh3N/dOGd+ckTV7pD7BLdSk2vXLQ
	2HfkwhqiiR1r7T9qViW0YoRMAHDeMD4abXrYlBpy1s20hsq0QCOgMAsV5jb2NUhLrlcFp5Zp+Sjq1
	vSs+x9n8Ip/hlmdwCw4Qh8MkuzAK+yOSrBy8T3q2JMsxcqa64t2VARqZiobqKLw40tXaRx1dafn8I
	FyzLw+JWDVzNtMmGPCu8hlC4P0ITRsvFcE0lI1Oq6EiwfZZDrc8ekFQ/fmW81le28cA1KVnXutqGw
	n4C7NsTe2tktUBFw1rzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCmb-006eoV-1X;
	Tue, 25 Jul 2023 07:48:37 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCmX-006emI-01;
	Tue, 25 Jul 2023 07:48:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2380FF80F;
	Tue, 25 Jul 2023 07:48:22 +0000 (UTC)
Message-ID: <cdb56d2f-1e52-46fd-5d89-12b34749e823@ghiti.fr>
Date: Tue, 25 Jul 2023 09:48:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RESEND PATCH -fixes 2/2] Documentation: kdump: Add
 va_kernel_pa_offset for RISCV64
Content-Language: en-US
To: Song Shuai <suagrfillet@gmail.com>, bhe@redhat.com, vgoyal@redhat.com,
 dyoung@redhat.com, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, xianting.tian@linux.alibaba.com,
 anup@brainfault.org, robh@kernel.org, ajones@ventanamicro.com,
 alexghiti@rivosinc.com, conor.dooley@microchip.com
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230724100917.309061-1-suagrfillet@gmail.com>
 <20230724100917.309061-2-suagrfillet@gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230724100917.309061-2-suagrfillet@gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_004833_174320_FCFED139 
X-CRM114-Status: GOOD (  12.59  )
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


On 24/07/2023 12:09, Song Shuai wrote:
> RISC-V Linux exports "va_kernel_pa_offset" in vmcoreinfo to help
> Crash-utility translate the kernel virtual address correctly.
>
> Here adds the definition of "va_kernel_pa_offset".
>
> Fixes: 3335068f8721 ("riscv: Use PUD/P4D/PGD pages for the linear mapping")
> Link: https://lore.kernel.org/linux-riscv/20230724040649.220279-1-suagrfillet@gmail.com/
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> ---
>   Documentation/admin-guide/kdump/vmcoreinfo.rst | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst b/Documentation/admin-guide/kdump/vmcoreinfo.rst
> index c18d94fa6470..f8ebb63b6c5d 100644
> --- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
> +++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
> @@ -624,3 +624,9 @@ Used to get the correct ranges:
>     * VMALLOC_START ~ VMALLOC_END : vmalloc() / ioremap() space.
>     * VMEMMAP_START ~ VMEMMAP_END : vmemmap space, used for struct page array.
>     * KERNEL_LINK_ADDR : start address of Kernel link and BPF
> +
> +va_kernel_pa_offset
> +-------------------
> +
> +Indicates the offset between the kernel virtual and physical mappings.
> +Used to translate virtual to physical addresses.


You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
