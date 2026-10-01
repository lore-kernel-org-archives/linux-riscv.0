Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A14BCA5FC1
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 03:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ecsAce5IKYSomZc2MuOarcVJC3zmcCEhY/GTROJiQPY=; b=rTfB+F2smB28sZ
	rzWYT7iide2IGK5ehTfyK01NEFG2TpUFRsXjPTss8GtHMT6paFKy0hE/LyVbQSacMBS/A8X03DBGt
	i5V6nOAk2ibhordw85DLLb/u2/NJjfz3MOloUvU3zNnDl6l4cOEVdRQwsWUknKPy0lQM4wzL+nQqQ
	KSzODFGBqmKc7jzd7/niNUTnaoQ1UM2Lw54mLD8XTuDYuGrhE5UBckHbj7Tlp7Mu9Hm13d+JBswpq
	BPTzoAdGNegwWY7oOVRO7qPPsZdW/necXzLZ0ZN447LnoZrVuJIRDUKVtptgdxnpdh6AzIzXLgKmI
	RE56+tocBQ8FMg93CMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC74R-00000007dag-48px;
	Thu, 01 Oct 2026 03:02:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC74Q-00000007daE-0nRG
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 03:02:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 52C9360142;
	Thu,  1 Oct 2026 03:02:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCDD1F000FF;
	Thu,  1 Oct 2026 03:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790823773;
	bh=UO/EZ+4mK/RfywN7jxK0ju9lZ4rxM5xI5JsuM9aYX1k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=CzN2KcBAxFhJhVSEPt9BiT/U4v8A4huAm8aAKHOcncmc6vb67yzz61gXMdLQCMBZA
	 0iEN8r2JujkattLoXvq+AwdLLt+d/Id9ORSIlygLc4q0+1CF3O8DDhnM/5OhD61Xlq
	 0HvlErMuEHuI7lCb0brpR4V1IVlOLUzNodnY/L8b7n9QARj4e1XSLSa5DFveYbug5z
	 0rXtvOheeHRWJCEpR6zfKN7omfKJ01kFdoEQfSqvGpRoGZRXoVxhX7QDrMjz/iJDfI
	 SY/GCsuCCTTKh9EiySmvejbjIrsDSRh+15CZL2QyUfZ1KE6vJhN36E6svD+j1OZPw8
	 ip59IOlMKrWzw==
Date: Wed, 30 Sep 2026 21:02:51 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Samuel Holland <samuel.holland@sifive.com>, greentime.hu@sifive.com, 
    vincent.chen@sifive.com, zong.li@sifive.com, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: errata: Add SiFive MAL-9092 workaround
In-Reply-To: <20260817-sifive-errata-v1-1-6a80f1a2743d@sifive.com>
Message-ID: <a26672ca-adb7-a715-37d3-99da4a28403e@kernel.org>
References: <20260817-sifive-errata-v1-1-6a80f1a2743d@sifive.com>
MIME-Version: 1.0
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

On Mon, 17 Aug 2026, Yong-Xuan Wang wrote:

> SiFive cores with MAL-9092 require fence.rw instructions around
> HLV/HLVX/HSV hypervisor instructions to ensure proper memory ordering
> when accessing guest memory.
> 
> Note that HSTATUS.HU is cleared during KVM initialization, restricting
> hypervisor instructions to HS-mode only. If future changes enable
> HSTATUS.HU for U-mode access, additional errata considerations will be
> needed.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

Thanks, queued for v7.3-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
