Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B125FEB7EB2
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 09:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6SzCltvGksRw9hyK1EkYMFptz8/PVD0EJzlf1X9irM=; b=MVgk9gDjP1RAsB
	cJWOLN9FfXv96bl5sewdlLo9clfGXjb2GTgjmX75ic+vKAFWLIzVH3eZ/xPzPeKvhBYrN4TifnYG1
	10bAKlPYZuY4Mn8BQUkvhPTrVqP7Iy0UJLdwR3podxD95etQymh3fQkk4K44/5FDN+JjXFHCLDsyt
	rCIGKctWQ1MZROj6V4k5wF+Lh4qoee/qdxWK9THpZO4bS+I51y7WEJ5gf0gpl5SgjFmgMhc7KpP0T
	hfO6l3hXK/pS+Zl0CmoleimVt5mOxvoyIC0WT/E/Q1CvSe4HNPNJiIt21I4jD0/zBV+eefiCPCmVT
	TGI8HMFb1zSz+2fuqlLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiUN-0000000Grhq-0Pop;
	Wed, 04 Mar 2026 09:25:55 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiUJ-0000000Grh7-1PqS
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 09:25:53 +0000
Received: from duge-virtual-machine (unknown [183.192.221.67])
	by APP-01 (Coremail) with SMTP id qwCowAAHsm2V+qdpyDQ6CQ--.5966S2;
	Wed, 04 Mar 2026 17:25:42 +0800 (CST)
Date: Wed, 4 Mar 2026 17:25:40 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: ulf.hansson@linaro.org
Cc: pjw@kernel.org, krzk@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, gaohan@iscas.ac.cn, me@ziyao.cc
Subject: Re: [PATCH v2 2/3] mmc: sdhci-dwcmshc: Add Canaan K230 DWCMSHC
 controller support
Message-ID: <aaf6lBLUP+5J7hcU@duge-virtual-machine>
References: <20260226115923.75670-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260226115923.75670-3-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260226115923.75670-3-jiayu.riscv@isrc.iscas.ac.cn>
X-CM-TRANSID: qwCowAAHsm2V+qdpyDQ6CQ--.5966S2
X-Coremail-Antispam: 1UD129KBjvdXoWruF4DGw1ftFyrJw1rXFy3CFg_yoWxurX_Ca
	43Wa4fGa47CFWv9a47tr1Sy34YyFs0g3WDWFyYg3y3Wa1UZr1DXa1Ivrn8Xr4Dur4UCFZr
	Jr98JrWxJFnFkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsxYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z2
	80aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07j0fOwUUUUU=
X-Originating-IP: [183.192.221.67]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_012551_756313_C752AA94 
X-CRM114-Status: UNSURE (   9.63  )
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

On Thu, Feb 26, 2026 at 07:59:22PM +0800, Jiayu Du wrote:
> Add SDHCI controller driver for Canaan k230 SoC. Implement custom
> sdhci_ops for set_clock, phy init, init and reset.
> 
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ---
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 288 ++++++++++++++++++++++++++++
>  1 file changed, 288 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> index 2b75a36c096b..21c77e908d77 100644
> --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
Hi ulf, could you please take a look at this patch? Thank you!

Regards,
Jiayu Du


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
