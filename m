Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6A1C76196
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Apr 2023 12:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rqLYWVwxm71jD8dmHipt5Uo0ELfpMAD1qVM7U9dE1zE=; b=sou1ZjYwD6pNyM
	g36W47kIdusHivvQKZNoiInkCxIZHWrQzq6bYWG6ot0n0aCdjzY83KUKdmF2kBSPIualqLNgUaj01
	FqwjFYucz2mXzvHb9OUmg6CRRjles4+fwZfAQq2CjQLm4sZlftnK72r3E2s6ypVAoobanGbgI43Rr
	ZKFo2GUYaEBVkE0xzkWSLKXMiGPQ3edZfIGwOQTjVIKnmc8vf39PfXiHZh/PGWzbZRdhrTx3YXURy
	CHBXaYKhPD8sMYDloaYdiDq84TYSQREX3VcedpgT69ecA4+MjmAA4QP1heKRBRohZyGjEU8mrsLuP
	RPWg4XLS0IscAyQpesZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkkpN-00A8k5-2L;
	Fri, 07 Apr 2023 12:04:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkkpK-00A8ix-1f;
	Fri, 07 Apr 2023 12:04:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0C30260F90;
	Fri,  7 Apr 2023 12:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD1AC433EF;
	Fri,  7 Apr 2023 12:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680869061;
	bh=HUoYspjdbgbF+auGyH8Dkb8DfJn7/2ux/sbLEBn5Zw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s4vlYCLyUDl8dCY3ktLig+sybIAlBRK9ce9MbL/snbo3irp+sdTZybezHP6b/ECEZ
	 zjvwEud9PeYQYlmLJB+VaRFOt1uuhvdgNrRU4O+vsegGJj19CST4EBGEM389CLx7UK
	 37rCQOlfDwk6BGhYeC2SYhpzgORnKoqYzAZcBZ/NwQNc7qGrJkFBclaF5YcwQAKB5Q
	 yBiRCp0YKBfc/rX4/8R0fPqE4zs5kCiBNjrvDT+vEziSfT+OuG7zW8gDTLvCgz/+Ax
	 ECF3eTIEYv2OMc0uaVFZ8gtNFlVSKOJFXQThA3d/CKxgDI7BtnUQrLnQWQJLXW2MJX
	 efgysCmqU06zw==
Date: Fri, 7 Apr 2023 14:04:15 +0200
From: Simon Horman <horms@kernel.org>
To: Chen Jiahao <chenjiahao16@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, guoren@kernel.org, heiko@sntech.de,
	bjorn@rivosinc.com, alex@ghiti.fr, akpm@linux-foundation.org,
	atishp@rivosinc.com, bhe@redhat.com, thunder.leizhen@huawei.com
Subject: Re: [PATCH -next v3 2/2] docs: kdump: Update the crashkernel
 description for riscv
Message-ID: <ZDAGv7dMyirW9aqd@kernel.org>
References: <20230406220206.3067006-1-chenjiahao16@huawei.com>
 <20230406220206.3067006-3-chenjiahao16@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230406220206.3067006-3-chenjiahao16@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_050422_638470_87E4B36A 
X-CRM114-Status: UNSURE (   9.06  )
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

On Fri, Apr 07, 2023 at 06:02:06AM +0800, Chen Jiahao wrote:
> Now "crashkernel=" parameter on riscv has been updated to support
> crashkernel=X,[high,low]. Through which we can reserve memory region
> above/within 32bit addressible DMA zone.
> 
> Here update the parameter description accordingly.
> 
> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>

Reviewed-by: Simon Horman <horms@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
