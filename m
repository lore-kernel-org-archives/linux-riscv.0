Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E746C74A5B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 15:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYc/n+r+gi13yUJDpZm/NP3iP2PQQhI7vLq1EBymKNk=; b=L4DQ6q+qWpXoDh
	oOdtC7bnDJm5yWwAmvjaQx2I2bI0asOJRQm0Oh06WyxsIumaN+3gRGDQOd8xG07fctF/HmsgnQtwu
	cZg4wMoYplhrwc9ZYwGJDGQ4uELEDmXEuiWrbePjDoANmqAIiS/ysUkv/UkvpGEhgH43GdjE6uinj
	MU/hCoxei0vrkf+xGkH/bOk46X9yuwrqF/WL5QtDloUbrK0iiWaPRgEJVn3NoRZqHQLMwMHgKQIm1
	XdP7mimljlsPRllpqouEe8ACoJfjSxuI3SYudHNi2Z7BJUt/eXeKtxjMVa0cpiR0zd7ujJnygNqU4
	HSfzfJ65yeHGnanAG+iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pedX8-00CqKm-1W;
	Tue, 21 Mar 2023 15:04:18 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pedX4-00CqJ2-0Y
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 15:04:16 +0000
Received: by verein.lst.de (Postfix, from userid 107)
	id 4431A68CFE; Tue, 21 Mar 2023 16:04:09 +0100 (CET)
Received: from blackhole.lan (p5b2ece7e.dip0.t-ipconnect.de [91.46.206.126])
	by verein.lst.de (Postfix) with ESMTPSA id 078CC6732D;
	Tue, 21 Mar 2023 16:03:52 +0100 (CET)
Date: Tue, 21 Mar 2023 16:03:49 +0100
From: Torsten Duwe <duwe@lst.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Li Zhengyu <lizhengyu3@huawei.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Conor Dooley <conor.dooley@microchip.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Li Huafei <lihuafei1@huawei.com>, "Liao
 Chang" <liaochang1@huawei.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <liubao918@huawei.com>
Subject: Re: [PATCH] riscv: relocate R_RISCV_CALL_PLT in kexec_file
Message-ID: <20230321160349.3b3a46df@blackhole.lan>
In-Reply-To: <e02fdfce-4574-8e7e-ec96-8e8eaa4067bc@huawei.com>
References: <20230310182726.GA25154@lst.de>
	<e02fdfce-4574-8e7e-ec96-8e8eaa4067bc@huawei.com>
Organization: LST e.V.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_080414_374954_27A210E8 
X-CRM114-Status: GOOD (  19.40  )
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

On Mon, 13 Mar 2023 11:13:17 +0800
Li Zhengyu <lizhengyu3@huawei.com> wrote:

> On Fri, 10 Mar 2023 19:27:03 +0100, Torsten Duwe <duwe@lst.de> wrote:
> > Depending on the toolchain (here: gcc-12, binutils-2.40) the
> > relocation entries for function calls are no longer R_RISCV_CALL, but
> > R_RISCV_CALL_PLT. When trying kexec_load_file on such kernels, it will
> > fail with
> >
> >   kexec_image: Unknown rela relocation: 19
> >   kexec_image: Error loading purgatory ret=-8
> >
> > The binary code at the call site remains the same, so tell
> > arch_kexec_apply_relocations_add() to handle _PLT alike.
> 
> R_RISCV_CALL has already been deprecated, and replaced by R_RISCV_CALL_PLT.
> 
> See Enum 18-19 in Table 3. Relocation types from 
> https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-elf.adoc 
> .
> 
> It was deprecated in ("Deprecated R_RISCV_CALL, prefer 
> R_RISCV_CALL_PLT") 
> https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a0dced85018d7a0ec17023c9389cbd70b1dbc1b0
> 
> >
> > fixes: 838b3e28488f702 ("Load purgatory in kexec_file")
> > Signed-off-by: Torsten Duwe <duwe@suse.de>
> > Cc: stable@vger.kernel.org
> >
> > ---
> > --- a/arch/riscv/kernel/elf_kexec.c
> > +++ b/arch/riscv/kernel/elf_kexec.c
> > @@ -425,6 +425,7 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
> >   		 * sym, instead of searching the whole relsec.
> >   		 */
> >   		case R_RISCV_PCREL_HI20:
> > +		case R_RISCV_CALL_PLT:
> >   		case R_RISCV_CALL:
> >   			*(u64 *)loc = CLEAN_IMM(UITYPE, *(u64 *)loc) |
> >   				 ENCODE_UJTYPE_IMM(val - addr);
> >
> > .
> 
> Palmer, please apply these references to the commit message.
> 
> Reviewed-by: Li Zhengyu <lizhengyu3@huawei.com>
> 

Ping?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
