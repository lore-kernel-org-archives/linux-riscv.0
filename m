Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C5ACAC5B8
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Oct 2025 01:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o3d0wFfmcTnygvRJg4aOsrk5WXf9+K4sljccXJXHhS0=; b=EwxM7GIiCQwP5h
	9Ix4UmQNtD0sefQUg8LQ4eOlTiYRrF9wiatLODRUZ6MUKl+vSB65LWeCYEucGctwJVYoq3s3BDSLv
	XogcoL49gAhKB0w60MQXtja7FMxAFZUg84Tj7A+Q7MR8XJZswmNoykOr7e3cwlHC/xCdXXaE/nTDD
	NPkR881hc8/HBrU+nqOxlQKmpkp84ck6E7EbBqxNjEas8K2Lyjj9kqTV5JB4VsI3BaJv0htd8oN8S
	PPGVzCt0Lro0kje3e0gkSSf5mH042ITDwAfxunoqpZaAvt5DavrtS4jtbOreftvdWzIfzB0mB/7C4
	oR7FdDKHHPViSqPrXatg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4UiR-0000000BVlD-1eyM;
	Fri, 03 Oct 2025 01:36:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4UiP-0000000BVkd-1SV7
	for linux-riscv@lists.infradead.org;
	Fri, 03 Oct 2025 01:36:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B72A4084C;
	Fri,  3 Oct 2025 01:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE729C4CEF4;
	Fri,  3 Oct 2025 01:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759455368;
	bh=o5ZrKPm3f5fdOQjrylL+m8t+7kJdXF7YP5CE6XUjsFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JGRXJShaP0zq8waSMcFmiO3ORn6oOMujk+o/qjQp92L5fJmWvMWLNy+ek76OZS7c7
	 Qf5fdzp4GQ37gnQGEfYwDo4zzy0DksHlcXdLDNg/aVFBg/S7BSOAfFHbboy5GF/xTq
	 tuhjy58Dtkdu7NzmD9vtWzu/u9YVlbx7pIXyNLPjbI4lqAUmyXqweuIs/AxGPQNmK5
	 9600+3yeC47cuCbdQXmFcwzkc+fHDPJ21vqK0zl+VLfmg1Q3EPi1zHHzfyGDKdpR7E
	 xIp639JLUiMxIRWcuAPnLEjRLJkJ4CbagXJJxekQOZCOKdg49QVv4uypxztOuvICfg
	 GqFFuKxLlXxeA==
Date: Thu, 2 Oct 2025 18:36:06 -0700
From: Drew Fustini <fustini@kernel.org>
To: Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: dts: thead: add zfh for th1520
Message-ID: <aN8ohrxMOCvFlBTk@x1>
References: <cover.1758228055.git.rabenda.cn@gmail.com>
 <38abc793c2fcb9dd26c89bab10dd4450d91ced4c.1758228055.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <38abc793c2fcb9dd26c89bab10dd4450d91ced4c.1758228055.git.rabenda.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_183609_405029_D1164ADF 
X-CRM114-Status: UNSURE (   7.09  )
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

On Fri, Sep 19, 2025 at 04:44:49AM +0800, Han Gao wrote:
> th1520 support Zfh ISA extension.
> It supports the same RISC-V extensions as SG2042.
> 
> commit cb074bed1186 ("riscv: dts: sophgo: add zfh for sg2042")
> 
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
