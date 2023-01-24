Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CBFC54E94
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 14:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IBhgg3IhPulD+MPANCWiIIBGr30szbJT+s61X3mn/Jw=; b=DH2hTCHY4+aWsQ
	UwEHG8Ma5gvZ60zsSDZLyqRDi1hzKkNSLrZ3OXIOrkOc//b3eFGFwiqOGYOGGY8UDxQhi6bFaZLEU
	1+2LIhi7g2TJ8cqdWa/QvAyKInWcAjbyqJ/jWY6vMCVqlUQlGJZ5ZZikjRpVbHudWwOwPmytNzXh4
	ra5kkaUhp8tga6UILAjMnU3uFWb+F1/IMLUd4o/e6v6lrvWHSXa4PpDoTMbjRvj+ZiMfX1hzgBasU
	84VY9bY1KUYBw1RKuskieLPOTc9ObzzIHJO1JKfokgJAsKezRBrezZzdcJ4AzRJxUmmpKSsZEG4zr
	RlV12txCwO3X1t3rW7Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKJzq-004Dri-Um; Tue, 24 Jan 2023 14:09:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKJuW-004BIA-BD; Tue, 24 Jan 2023 14:04:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B86024B3;
	Tue, 24 Jan 2023 06:05:06 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3F2E3F71E;
	Tue, 24 Jan 2023 06:04:22 -0800 (PST)
Date: Tue, 24 Jan 2023 14:04:20 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Pierre Gondois <pierre.gondois@arm.com>, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Gavin Shan <gshan@redhat.com>, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 6/6] arch_topology: Build cacheinfo from primary CPU
Message-ID: <20230124140420.4srnufcvamvff77v@bogus>
References: <20230104183033.755668-1-pierre.gondois@arm.com>
 <20230104183033.755668-7-pierre.gondois@arm.com>
 <CAMuHMdUjgxgOXf5He1x=PLn7MQTjZgFQUHj8JrwbyweT4uOALQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUjgxgOXf5He1x=PLn7MQTjZgFQUHj8JrwbyweT4uOALQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_060428_455365_9724E87C 
X-CRM114-Status: GOOD (  14.28  )
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

On Tue, Jan 24, 2023 at 02:50:16PM +0100, Geert Uytterhoeven wrote:
> Hi Pierre,
> 

[...]

> > @@ -840,6 +840,14 @@ void __init init_cpu_topology(void)
> >                 reset_cpu_topology();
> >                 return;
> >         }
> > +
> > +       for_each_possible_cpu(cpu) {
> > +               ret = fetch_cache_info(cpu);
> > +               if (ret) {
> > +                       pr_err("Early cacheinfo failed, ret = %d\n", ret);
> 
> This triggers on all my RV64 platforms (K210, Icicle, Starlight,
> RZ/Five).
> 
> This seems to be a respin of
> https://lore.kernel.org/all/CAMuHMdUBZ791fxCPkKQ6HCwLE4GJB2S35QC=SQ+X8w5Q4C_70g@mail.gmail.com
> which had the same issue.
>

I need to recollect my memories reading all the thread, but even after the
fixes there were few platforms that failed with so early allocation but were
fine with initcalls. Are these such platforms or am I mixing up things here ?
Do you still see all the cacheinfo in the sysfs with initcalls that happen
later in the boot ?

Conor might help me remember the details.

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
