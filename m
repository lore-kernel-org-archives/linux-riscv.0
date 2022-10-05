Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF27C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 09:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=02jr878KStQZOCPfLpyk8dZtptq7jZUuBvpVBDtuECc=; b=aAi4MqGB+xpKAy
	tnIA3k7C7tAfmxMHp2dQ7ewIQd43JI14F1OCko7Wg2Lk6WJ2nQQjEZDPnzSBF8FJB3KFuxNt84IGZ
	nsm+JvnfL/euuoPWR1lfIPhr0J4B9yr1sclMxEszKz+KD7/RNVrAG+mb2Vl2/uwgzsBT8s5fHARtn
	hi2p9vb0jqNmytoSOhT6Y+C9YpiL6Pz7Or+ggsHL4Qpf2NxRmAo52XSdN9KX/RiKp+Udl7kKsC8EV
	bSj2DMwPenkIv56k8VjMC6HokLRdWSeL0CVGyjfdf33MiACRI2xL0YETzy/liGhsjpGCGdmHE2fU8
	EeZy921NsXX5xyQ7W9Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og15L-00DU3b-Tg; Wed, 05 Oct 2022 09:53:03 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og15J-00DTz9-EI
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 09:53:02 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1og159-0000EE-LB; Wed, 05 Oct 2022 11:52:51 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org
Cc: panqinglin2020@iscas.ac.cn, palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org, xuyinan@ict.ac.cn, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v5 1/4] mm: modify pte format for Svnapot
Date: Wed, 05 Oct 2022 11:52:50 +0200
Message-ID: <2317598.NG923GbCHz@diego>
In-Reply-To: <Yzx8YfVUmHc/3CJl@spud>
References: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn> <20221004170027.duk2nc6pq52d4vcf@kamzik> <Yzx8YfVUmHc/3CJl@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_025301_520211_984F9047 
X-CRM114-Status: GOOD (  21.43  )
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

Am Dienstag, 4. Oktober 2022, 20:33:05 CEST schrieb Conor Dooley:
> On Tue, Oct 04, 2022 at 07:00:27PM +0200, Andrew Jones wrote:
> > On Mon, Oct 03, 2022 at 09:47:18PM +0800, panqinglin2020@iscas.ac.cn wrote:
> > > From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> > > 
> > > This commit adds two erratas to enable/disable svnapot support, patches
> > > code dynamicly when "svnapot" is in the "riscv,isa" field of fdt and
> > > SVNAPOT compile option is set. It will influence the behavior of
> > > has_svnapot function and pte_pfn function. All code dependent on svnapot
> > > should make sure that has_svnapot return true firstly.
> > > 
> > > Also, this commit modifies PTE definition for Svnapot, and creates some
> > > functions in pgtable.h to mark a PTE as napot and check if it is a Svnapot
> > > PTE. Until now, only 64KB napot size is supported in draft spec, so some
> > > macros has only 64KB version.
> > > 
> > > Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>

[...]

> > > +	switch (stage) {
> > > +	case RISCV_ALTERNATIVES_EARLY_BOOT:
> > > +		return false;
> > > +	default:
> > > +		return riscv_isa_extension_available(NULL, SVNAPOT);
> > > +	}
> > > +#endif
> > > +
> > > +	return false;
> > > +}
> > > +
> > >  /*
> > >   * Probe presence of individual extensions.
> > >   *
> > > @@ -301,6 +316,9 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
> > >  	if (cpufeature_probe_zicbom(stage))
> > >  		cpu_req_feature |= (1U << CPUFEATURE_ZICBOM);
> 
> While in the area, could this be converted to BIT(CPUFEATURE_ZICBOM)?

It already is [0], although it looks like I need to ping Palmer about
that series.


Heiko

[0] https://lore.kernel.org/all/20220905111027.2463297-5-heiko@sntech.de/



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
