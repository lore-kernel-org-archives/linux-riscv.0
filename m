Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1719FC77B60
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 01:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5/gpHB5aMRS1CzElfNCkvJ6/MAwsLcGcme99VdP/FE=; b=j6mJLF1swGvBXR
	1F0dfBfngOB0hk7XOEc/xU8CLm3f3ywPzh4LaOiwd7tG2pz4CtmiyaVhqMQHCOB8aAMuZ1fkKYjzV
	cb9HCvu9f42O1N4zl1D18/gEVStZ8sp6h7wExx3WRCy/dv9uDRIe1iZie+6RWhYqgF+kquP6Mst95
	Aw7giKTKeKYlVJpD6EbgTlExjV6kS4FYsCx1Li8cPFOSQ1CxleeDYHntTDc/jJ88UALnMOJ6MhpUT
	SPH7qarpASxmGybwL4LaDlw9jrQ/PqdE1AGFPxFS29tlg4zbr2gKTn+f7mIhCvM2L3xtZQ5vo4Wh2
	AQgRbtPSZ9TnZ0V+2wFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psZJE-00C36k-26;
	Sat, 29 Apr 2023 01:23:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psZJD-00C36c-1h
	for linux-riscv@bombadil.infradead.org;
	Sat, 29 Apr 2023 01:23:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2EoMvi2adSSoaNZmpzyHXeamo9kdQu7BIgeFh0Uxkas=; b=VVhTl4vHgVyZasj5Gf4glUdJRM
	oWWdLdtoQ+GZxkQ3BKIMZHBiaCmH2oRWSbWmy5uKophoJ9OCD3SZ1dG56g9ns2tMdPlJp3zew+YtH
	63etgnsxGGp2/Q4rc3yYDZAQq9+ENtlODQw9Me5TKCCzzIL0LrFCO3UpmamCdzClATfjBMLAhgZpJ
	j9Pf7vmaMfH2dxJ1eyDM1SarsfqlSde+X3lQrfsfXlKGWygJ2kkdH63OPFvdtPpzusQmZxhynFT7O
	M1fpLgPslTlqhwkzLgoRdG/lh+CfgvAKN7wn8ZzYRs2T+aQVPB+MsUsP0lBDb/2byOArBTYeBPk5v
	BgeyGGrA==;
Received: from [187.19.238.117] (helo=quaco.ghostprotocols.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1psZJ9-00DWyF-1x
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 01:23:28 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 02A12403B5; Fri, 28 Apr 2023 22:23:23 -0300 (-03)
Date: Fri, 28 Apr 2023 22:23:23 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: p4ranlee@gmail.com, jolsa@kernel.org, namhyung@kernel.org,
	irogers@google.com, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, acme@redhat.com, anton@ozlabs.org,
	dja@axtens.net, mpe@ellerman.id.au,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] perf tools riscv: Add support for riscv
 lookup_binutils_path
Message-ID: <ZExxi7KAW7W/OSwa@kernel.org>
References: <20230315051500.13064-1-p4ranlee@gmail.com>
 <mhng-534349ae-0594-455c-bc27-da0d8a70d0be@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-534349ae-0594-455c-bc27-da0d8a70d0be@palmer-ri-x1c9>
X-Url: http://acmel.wordpress.com
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

Em Tue, Apr 18, 2023 at 08:41:21PM -0700, Palmer Dabbelt escreveu:
> On Tue, 14 Mar 2023 22:15:01 PDT (-0700), p4ranlee@gmail.com wrote:
> > Add RISC-V binutils path on lookup triplets.
> > 
> > Signed-off-by: Paran Lee <p4ranlee@gmail.com>
> > ---
> >  tools/perf/arch/common.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/tools/perf/arch/common.c b/tools/perf/arch/common.c
> > index 59dd875fd5e4..e80d4d22cabf 100644
> > --- a/tools/perf/arch/common.c
> > +++ b/tools/perf/arch/common.c
> > @@ -43,6 +43,20 @@ const char *const powerpc_triplets[] = {
> >  	NULL
> >  };
> > 
> > +const char *const riscv32_triplets[] = {
> > +	"riscv32-unknown-linux-gnu-",
> > +	"riscv32-linux-android-",
> > +	"riscv32-linux-gnu-",
> > +	NULL
> > +};
> > +
> > +const char *const riscv64_triplets[] = {
> > +	"riscv64-unknown-linux-gnu-",
> > +	"riscv64-linux-android-",
> > +	"riscv64-linux-gnu-",
> > +	NULL
> > +};
> > +
> >  const char *const s390_triplets[] = {
> >  	"s390-ibm-linux-",
> >  	"s390x-linux-gnu-",
> > @@ -166,6 +180,10 @@ static int perf_env__lookup_binutils_path(struct perf_env *env,
> >  		path_list = arm64_triplets;
> >  	else if (!strcmp(arch, "powerpc"))
> >  		path_list = powerpc_triplets;
> > +	else if (!strcmp(arch, "riscv32"))
> > +		path_list = riscv32_triplets;
> > +	else if (!strcmp(arch, "riscv64"))
> > +		path_list = riscv64_triplets;
> >  	else if (!strcmp(arch, "sh"))
> >  		path_list = sh_triplets;
> >  	else if (!strcmp(arch, "s390"))
> 
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks, applied.

- Arnaldo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
