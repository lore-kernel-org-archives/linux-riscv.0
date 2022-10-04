Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FA8C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 17:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hpHisLQfX4i8m8CdcgX8BBHu1kA3AHuqbtr/xjsiwYE=; b=ihqV16yea0a+xD
	86n5WSwAWYnXRAt589hHFOOZnf+srMpHIY8q9oOcLHoVdbrZ7wuXgLqObm7+bS8oQpvCJ8vVWMPqG
	SxXFbS3oc1dIo5Z8Ac2MF/y4F9vFSvNCnKSVgDENvv5xH8KGQHXEoRurzYeAQIFdkTHAvBHA8lSX2
	6OoRI+rWal8NXQoNZeEDgRkxNFdR55aY+L2nEfIDDEZH5w6EXBCcQlDUeyhAkXb7rX/IKGfcHa/bX
	GnA9t3FD2ILO3uqcm9G0Kw7SX+MKU4r48R1xuztx63HQSoSTuBQO/Hn9KhJFKn7EPZu71LfCNfyND
	HQ3KcPHOmzcARxgWfp8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oflQk-00AGRY-Jf; Tue, 04 Oct 2022 17:10:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oflQh-00AGR0-Uk
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 17:10:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C7F076132D;
	Tue,  4 Oct 2022 17:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9ED8C433C1;
	Tue,  4 Oct 2022 17:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664903401;
	bh=GGkrC22X2cSGUa49ffymIL6e1YrADSDA77hl6GJabKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IQjttXMJISiKA2Xi991eLXEek9cEwHCzKH7G5O59CUMfzTsWqyoji06Rs3UXcLhmU
	 t39BQz6Y8/2TPzsqU0DtQVM3lV8zyU+YqJjsMkP6g84tjDUQEgIhJiQRpMCjgpREdq
	 L2fAIvzL7t88vVy+r00Y2JzSxrRdY+kb/hvmuHA7gvng2JdIuSkHhB3n8iM7U0nHV5
	 EwTz2Eo6vdWobH1fg6yS227KAqVyQqwS+Nt7O1uNp2hUWhxE9oXnHu01Afwwa2hwj2
	 n5q3kOpZFxuGspWn4AANs9aqLiIJKbpfmcURoEuKzHfa0Ce+OwQCQNWDB7oMbv79Qg
	 7+/IGRK5POi6g==
Date: Tue, 4 Oct 2022 18:09:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: panqinglin2020@iscas.ac.cn, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org, jeff@riscv.org, xuyinan@ict.ac.cn
Subject: Re: [PATCH v5 1/4] mm: modify pte format for Svnapot
Message-ID: <Yzxo5bemVt2AKNyr@spud>
References: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
 <20221003134721.1772455-2-panqinglin2020@iscas.ac.cn>
 <20221004170027.duk2nc6pq52d4vcf@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221004170027.duk2nc6pq52d4vcf@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_101004_066231_A190FBB4 
X-CRM114-Status: GOOD (  21.61  )
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

On Tue, Oct 04, 2022 at 07:00:27PM +0200, Andrew Jones wrote:
> On Mon, Oct 03, 2022 at 09:47:18PM +0800, panqinglin2020@iscas.ac.cn wrote:
> > From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> > 
> > This commit adds two erratas to enable/disable svnapot support, patches
> > code dynamicly when "svnapot" is in the "riscv,isa" field of fdt and
> > SVNAPOT compile option is set. It will influence the behavior of
> > has_svnapot function and pte_pfn function. All code dependent on svnapot
> > should make sure that has_svnapot return true firstly.
> > 
> > Also, this commit modifies PTE definition for Svnapot, and creates some
> > functions in pgtable.h to mark a PTE as napot and check if it is a Svnapot
> > PTE. Until now, only 64KB napot size is supported in draft spec, so some
> > macros has only 64KB version.

> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index 0be8a2403212..d2a61122c595 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -96,6 +96,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
> >  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> >  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> >  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> > +	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
> 
> If we want to do a separate isa extension alphabetizing patch, then this
> array would be a good one to do since it's the output order.

Just quickly jumping in to say that Palmer's already sent one:
https://lore.kernel.org/all/20220920204518.10988-1-palmer@rivosinc.com/

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
