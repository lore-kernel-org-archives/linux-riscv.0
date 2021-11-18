Return-Path: <SRS0=Kh2H=QF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A69C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 15:22:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA19D6126A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 15:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA19D6126A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vukcFVF5je4Ink4GA5OlBr+H/7BMFcC2Ngp5DxqF8M=; b=IOxJWA/9l0jgUn
	U9hYhSGm6OHKMqKMSmlODB0C8cwPaHVcSBWFOeTqwEVc7TBSuWh16U4ISh4oYuIawGA3KLTCc4Rq9
	RS9yUd6298fFlf/kR08xGTyBSymSPKFeS1WzSN9O0ru8idIolDsYfTEAmz9+oPD4PGHnSz95WzAKT
	LSr2kBpznnlLULZMuAVAsyJse64I1CirhhShc0smbBnuEVOD6q35KUnLeUXAbhEpBI0vZ+s5V0hfk
	JCc804eDI/D/DNklIhsVPWQRpJlRl+tRXZZ8ASFCIgPaB3Z9zgCmK3Uoi98Joimoj9uleo+RMib77
	wke095iUd1As1GC1Dfcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnjEm-008Fww-Ht; Thu, 18 Nov 2021 15:22:08 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnjEj-008FuV-Ua
 for linux-riscv@lists.infradead.org; Thu, 18 Nov 2021 15:22:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DA69D6E;
 Thu, 18 Nov 2021 07:22:00 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76CBE3F766;
 Thu, 18 Nov 2021 07:21:57 -0800 (PST)
Date: Thu, 18 Nov 2021 15:21:55 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Tong Tiangen <tongtiangen@huawei.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 09/12] riscv: extable: add `type` and `data` fields
Message-ID: <20211118152155.GB9977@lakrids.cambridge.arm.com>
References: <20211118192130.48b8f04c@xhacker> <20211118192605.57e06d6b@xhacker>
 <20211118193332.79799a9c@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211118193332.79799a9c@xhacker>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_072206_063646_BA2DCC9C 
X-CRM114-Status: GOOD (  19.23  )
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

On Thu, Nov 18, 2021 at 07:42:49PM +0800, Jisheng Zhang wrote:
> On Thu, 18 Nov 2021 19:26:05 +0800 Jisheng Zhang wrote:
> 
> > From: Jisheng Zhang <jszhang@kernel.org>
> > 
> > This is a riscv port of commit d6e2cc564775("arm64: extable: add `type`
> > and `data` fields").
> > 
> > We will add specialized handlers for fixups, the `type` field is for
> > fixup handler type, the `data` field is used to pass specific data to
> > each handler, for example register numbers.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

> > diff --git a/scripts/sorttable.c b/scripts/sorttable.c
> > index 0c031e47a419..5b5472b543f5 100644
> > --- a/scripts/sorttable.c
> > +++ b/scripts/sorttable.c
> > @@ -376,9 +376,11 @@ static int do_file(char const *const fname, void *addr)
> >  	case EM_PARISC:
> >  	case EM_PPC:
> >  	case EM_PPC64:
> > -	case EM_RISCV:
> >  		custom_sort = sort_relative_table;
> >  		break;
> > +	case EM_RISCV:
> > +		custom_sort = arm64_sort_relative_table;
> 
> Hi Mark, Thomas,
> 
> x86 and arm64 version of sort_relative_table routine are the same, I want to
> unify them, and then use the common function for riscv, but I'm not sure
> which name is better. Could you please suggest?

I sent a patch last week which unifies them as
sort_relative_table_with_data():

  https://lore.kernel.org/linux-arm-kernel/20211108114220.32796-1-mark.rutland@arm.com/

Thomas, are you happy with that patch?

With your ack it could go via the riscv tree for v5.17 as a preparatory
cleanup in this series.

Maybe we could get it in as a cleanup for v5.16-rc{2,3} ?

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
