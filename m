Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176A8C5AC67
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 02:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nhAxvY6Io9ncbzQ8/Oy6glrBmOHsChobzHYH6GZKaZI=; b=kkKWyNc1qCE95M
	m6lLmQkanOu8SdPHYyV2ju5X78i6EllkT2Fygac9p3SNP79FhFhUuJ+HTKBWX3ePdQuJXy5TlG9Vd
	rEdtqIjLUp3GElpSOs6/SacyyGrGcxWnpoWbruTRGavbsIY6YBJK0e2zViHkotDAIa1qtwo2PFIeR
	CYp9WGXqBgzS2qAdY2ijMKtGP8xMf4RHPH4mCzrGQo6+0CaN2FS5h2xRJlQUUF8xx5W0en+N+1bZ9
	3cOtJja33vQN6cIOH/3lOzTf9j3IR8QdBlHBPfH0nG9VAj0MfTbNu3zowLLuYUU3Gka6knb+H8mdj
	7kM/x5EBmgsa8hvL5vVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws9tR-00000006x27-0IEO;
	Fri, 07 Aug 2026 02:01:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws9tP-00000006x20-40wO
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 02:01:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3802C42A2B;
	Fri,  7 Aug 2026 02:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A711F00AC4;
	Fri,  7 Aug 2026 02:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786068063;
	bh=NDE5kji9v/BodtdudkyOarUMWe0ARm+7S7FVSarZPAM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=EGuIVJCvf3Zae598y8tAVDuHu9NI5f++iK0KXYgH/ijRp8+2JDmqCynCJunivJ90n
	 IUCezUcOiHgX9KXUXZpqrzHwN8a+6vcpRQ7JJm5PBpxBIBbeKSNV0ydjChR8ACJslr
	 J/Y+QeeVbUJdSa6LRGBbrpGifvo4caAsWA7cAJJfOUzkdhXnLMwdgRMAGMazCmZd44
	 jKn5VHY1tHM/i6Hs5A2C4+IBbBf4swZ0U1b7Z6lObSOjLmIHK9TUSZgDbAnzSsUd10
	 jm4cm0BqXYI0aIqu4zKFVUPVFdZ1/Ajs4iWKmHomKbicNizdqvg4i2DtyzLKxMAB73
	 jlR2n7Ck7komA==
Date: Thu, 6 Aug 2026 20:01:01 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Xiaofeng Yuan <xiaofengmian@163.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Nam Cao <namcao@linutronix.de>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] riscv: fix kprobes on minimal kernel configs
In-Reply-To: <20260720032258.5188-1-xiaofengmian@163.com>
Message-ID: <af1fb2be-871f-035f-e4a7-9ad1f4ec3029@kernel.org>
References: <20260720032258.5188-1-xiaofengmian@163.com>
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

On Mon, 20 Jul 2026, Xiaofeng Yuan wrote:

> When building with an allnoconfig-derived minimal configuration
> (without CONFIG_STRICT_MODULE_RWX), kprobes fails because
> instruction slot pages from EXECMEM_KPROBES are read-only and
> patch_map() bypasses the fixmap writable alias.
> 
> These two patches fix the infrastructure.

Thanks, queued for v7.3.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
