Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48025C25B4E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 14:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgrKmrLrmzhFIkA27rtAfN6ZBpvTofZwoH1NhlMgJS4=; b=qIbBEWJsr9r9IW
	kEYBfDLpfbI4OJaalO/FcSwnvmEVspLBRd6cC4iksCNiENF6H7IuglOnWqff1Wnik+ygNU1k1fwcH
	acyfftZ/x/xIlLsUU366DkY/OQx9IvSGOC2kWGxKAE0osS5MMkFpVUm0vTTXzW/1vv0QLzr5b4que
	f6l7/F2i9xsERNtgpfRy2B8MKn07bbuoId7uG5Nxm2hb6glqPFIACqKAbqWTQ46cDwSR1jMv8PsdS
	MSzHkyLE1MFfNPrR9tECB9VOS/5xNTS4wbJiYP2kA88RpFkO3h4OKfGLpkablJw16RxUhKw714c2t
	LhIJGXL7LqOzUtel/dXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKKiS-004Qxh-F4; Tue, 24 Jan 2023 14:56:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKKiE-004QsZ-DG; Tue, 24 Jan 2023 14:55:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BC7F4B3;
	Tue, 24 Jan 2023 06:56:27 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 983F83F5A1;
	Tue, 24 Jan 2023 06:55:43 -0800 (PST)
Date: Tue, 24 Jan 2023 14:55:41 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gavin Shan <gshan@redhat.com>, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 6/6] arch_topology: Build cacheinfo from primary CPU
Message-ID: <20230124145541.2xwtr7ro2bjnsjd7@bogus>
References: <20230104183033.755668-1-pierre.gondois@arm.com>
 <20230104183033.755668-7-pierre.gondois@arm.com>
 <CAMuHMdUjgxgOXf5He1x=PLn7MQTjZgFQUHj8JrwbyweT4uOALQ@mail.gmail.com>
 <20230124140420.4srnufcvamvff77v@bogus>
 <Y8/tl999NQwbPL/R@wendy>
 <20230124144839.2szjjv256j3pdaif@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124144839.2szjjv256j3pdaif@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_065550_516962_8D9001BE 
X-CRM114-Status: GOOD (  14.63  )
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

On Tue, Jan 24, 2023 at 02:48:39PM +0000, Sudeep Holla wrote:
> 
> Ah, that thread, I remember that :).
> 
> I still need to understand how this is related to memory allocation.
> Pierre was suggesting(in private) if we need to keep fetch_cache_info()
> arch specific but I really don't want to go down that patch until I
> understand and there is no other option.
> 
> Thanks for your time. I will try to recall boot flow and see if I can
> gather the reasoning for the seen behaviour.
> 

OK, I must have atleast taken a look at the code before I replied.
smp_prepare_boot_cpu() is called quite early before page_alloc_init()
and mm_init()(in init_main.c) while smp_prepare_cpus() get called
quite late from kernel_init->kernel_init_freeable().

Geert, can you please try with the patch Conor pointed out and see if
that helps to fix the allocation failures[1]

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20230103035316.3841303-1-leyfoon.tan@starfivetech.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
