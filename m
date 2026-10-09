Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E424DCA6012
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 08:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nLCsfnf4+LliywrrFdH0i4MSzjzHnLwwTYxOinlB2k=; b=fqov09wxGZG16Y
	6GuwiTrJ84yN5KSkUf/lljQ9dsf1diA5gcbAn/gY78rU1FLTc3K1nOgoYG0wdZgKqZov6SXaUSLdB
	PJTHIV2yOyTxCPZmtI6vbIO9xNrxozZqNNO0cuN/ffIGmuVmtNfLCpc3neikdR83oAM4k62pzgXJj
	spC/bBcAobydGkpHZvjVVGZHZ4oTgMddRoAabISD1oqRcILSOVNC1xAbnXO1+Cz64VzNHEA3r7C9/
	Yua1nLYwcBGPRzDDHHi3l77eZEB+jQBMtKK11aO6EgG2k3RQAkkxi4NKPwHliYZ52o8yeuDM/s9F9
	WapgipyBfva75aC0yJGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6IC-00000005r9G-3Prq;
	Fri, 09 Oct 2026 08:49:28 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6I9-00000005r8x-2Tjr
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 08:49:27 +0000
Received: from 8bytes.org (p200300f6af404a00448550d0471e54ea.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:4485:50d0:471e:54ea])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 0F1B41C77A4;
	Fri,  9 Oct 2026 10:49:20 +0200 (CEST)
Date: Fri, 9 Oct 2026 10:49:18 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Zong Li <zong.li@sifive.com>
Cc: tomasz.jeznach@linux.dev, will@kernel.org, robin.murphy@arm.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	mark.rutland@arm.com, andrew.jones@oss.qualcomm.com, guoren@kernel.org, 
	david.laight.linux@gmail.com, zhangzhanpeng.jasper@bytedance.com, yang.yicong@picoheart.com, 
	nutty.liu@hotmail.com, iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Chen Pei <cp0613@linux.alibaba.com>, Fangyu Yu <fangyu.yu@linux.alibaba.com>, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v15 2/2] iommu/riscv: create a auxiliary device for HPM
Message-ID: <asiqePAyXAWkaeMq@8bytes.org>
References: <20261002063315.1535817-1-zong.li@sifive.com>
 <20261002063315.1535817-3-zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002063315.1535817-3-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_014925_799703_DAB74E04 
X-CRM114-Status: UNSURE (   8.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 01, 2026 at 11:33:12PM -0700, Zong Li wrote:
> Create an auxiliary device for HPM when the IOMMU supports a
> hardware performance monitor.
> 
> Tested-by: Chen Pei <cp0613@linux.alibaba.com>
> Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Yicong Yang <yang.yicong@picoheart.com>
> Suggested-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  drivers/iommu/riscv/Kconfig |  1 +
>  drivers/iommu/riscv/iommu.c | 58 +++++++++++++++++++++++++++++++++++++
>  drivers/iommu/riscv/iommu.h |  4 +++
>  3 files changed, 63 insertions(+)

Acked-by: Joerg Roedel <joerg.roedel@amd.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
