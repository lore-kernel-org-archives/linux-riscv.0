Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E05D3B7E5
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 16:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZNgvCTMEkMc3bIARJp59URjoDNW+CxwC/lxw+YmauM=; b=p5KE+GgZI7BZkN
	EFTk8pXW9bvzG4qpP5i5GZMlBVH1VqBba3J9WePtPnRLC51Y5gUPShxjtbBEUCG8pMOBDJFeDL9QS
	pC3m7VCtvfvINMFineDbi0Yp+s+Hzx4fz0OG58YTfPZLPw8z5udZqBCKwf1JiVzl4WFRza5wqwXpO
	YG0dMk5MBw7X7C9OGLb2EM7ZKaBOyqXFfMogmKZgNAWcMxU2N6ucpwxSviqk3fE1IUhiPHijDEe/T
	p1UX+zlpV/CkO3HC7CnWDaCH5zRiy3YSJl1lhPzoBcvKLl327nTR0QwVdUMYnvOLVzjCmhe2CbaRD
	t0k9l3asb4MOiElPH2Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZtGV-00000002s5K-3WTl;
	Sun, 28 Dec 2025 16:05:07 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZtGS-00000002s4b-3gGZ
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 16:05:06 +0000
Received: from duge-virtual-machine (unknown [183.192.221.253])
	by APP-03 (Coremail) with SMTP id rQCowAC3vcQaVVFpqqlXAg--.17060S2;
	Mon, 29 Dec 2025 00:04:44 +0800 (CST)
Date: Mon, 29 Dec 2025 00:04:42 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: linusw@kernel.org
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc
Subject: Re: [PATCH 1/1] pinctrl: canaan: k230: Fix NULL pointer dereference
 in device tree parsing
Message-ID: <aVFVGnU7g6xst7Wo@duge-virtual-machine>
References: <20251228085005.155760-1-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251228085005.155760-1-jiayu.riscv@isrc.iscas.ac.cn>
X-CM-TRANSID: rQCowAC3vcQaVVFpqqlXAg--.17060S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZF43Kryfur13Ar1fCr4rZrb_yoWkJFb_uF
	1Fkw1kCw4UGr1DGw17Cr1fArnxAay29rW0qa4UWrZYq39rJw17trWFgrW3uw47uw1UX34D
	Ga47uF9Iqr1jgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbIAYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_JFC_Wr1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z2
	80aVCY1x0267AKxVWUJVW8JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF
	7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
	uYvjxU7UDGUUUUU
X-Originating-IP: [183.192.221.253]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_080505_352505_2FD5110D 
X-CRM114-Status: GOOD (  10.43  )
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

On Sun, Dec 28, 2025 at 04:50:05PM +0800, Jiayu Du wrote:
> When probing the k230 pinctrl driver, the kernel triggers a NULL pointer
> dereference. The crash trace showed:
> [    0.732084] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000068
> [    0.740737] ...
> [    0.776296] epc : k230_pinctrl_probe+0x1be/0x4fc
> 
> In k230_pinctrl_parse_functions(), we attempt to retrieve
> the device pointer via info->pctl_dev->dev, but info->pctl_dev is only
> initialized after k230_pinctrl_parse_dt() completes.
> At the time of DT parsing, info->pctl_dev is still NULL, leading to the invalid
> dereference of info->pctl_dev->dev.
> 
> Use the already available device pointer from platform_device
> instead of accessing through uninitialized pctl_dev.
> 
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Please ignore this patch. I'm sorry, I forgot to add the "fixes" tag.

I have resubmitted this patch. The link is provided here[1].

[1]: https://lore.kernel.org/all/20251228154947.194684-1-jiayu.riscv@isrc.iscas.ac.cn/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
