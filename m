Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A68606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 10:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MSL+HtiJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ve7NRkQ4h7FmA32I9JlgUvo4MEW5uLnbZMjv28Hb13I=; b=MSL+HtiJARCe+E72IQwpz5dQy3
	APTzAz82tWViKtV2PFxQPpk87NKTYaCgxb+oJBzFzH6eL3fKAhq0LV+Ju4lGaNVfJg0iHTVtiLKfk
	lpwsvDN+nXVy4Bn+2/It3dmb9d3gpN2ogewmRjHQKHGgmJ0m7kEEIqr7W616MbouTn02uQJ4C1949
	b5AgJvkqu3xo2+4xz3te62xtk5SUQ/rW7yDbyu5u/ffkNLe3mIwimjMStcQWimCOvsLMECJBTsz51
	TsezlSzWcIMN+b5LFFICgWCg1riuzU1t8TCBByYqjc0CU/RQdwBdY01CKKP5/h1BgQof7VAtrV+V4
	7ONjykHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGB4-00000005Eej-0yHg;
	Tue, 17 Nov 2026 10:12:38 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGB1-00000005EeK-2x5M
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 10:12:37 +0000
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AHABtbI090783
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 18:11:55 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Tue, 17 Nov
 2026 18:11:55 +0800
Received: from atcsi01.andestech.com (10.0.15.32) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Nov
 2026 18:11:55 +0800
Date: Tue, 17 Nov 2026 18:11:55 +0800
From: Mina Chou <minachou@andestech.com>
To: Conor Dooley <conor@kernel.org>
CC: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <jic23@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <geert+renesas@glider.be>,
        <magnus.damm@gmail.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <az70021@gmail.com>
Subject: Re: [PATCH v2 17/19] riscv: errata: andes: generalize cache errata
 for Andes cores
Message-ID: <avwoa/UDFV8iKG11@atcsi01.andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-18-minachou@andestech.com>
 <20261113-voice-pledge-d0b4e1420676@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261113-voice-pledge-d0b4e1420676@spud>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 6AHABtbI090783
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_021236_130591_E822D494 
X-CRM114-Status: GOOD (  20.80  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 01:59:11PM +0000, Conor Dooley wrote:
> > -static void errata_probe_iocp(unsigned int stage, unsigned long arch_id, unsigned long impid)
> > +static void errata_probe_andes_cache(unsigned int stage, unsigned long arch_id, unsigned long impid)
> 
> Just call it probe so that you dont rename it again when the next
> erratum shows up?
> 

Thanks for the suggestion, I'll give it a more generic name.

> >  {
> >  	static bool done;
> >  
> > @@ -51,11 +51,12 @@ static void errata_probe_iocp(unsigned int stage, unsigned long arch_id, unsigne
> >  
> >  	done = true;
> >  
> > -	if (arch_id != ANDES_AX45MP_MARCHID || impid != ANDES_AX45MP_MIMPID)
> > -		return;
> > -
> > -	if (!ax45mp_iocp_sw_workaround())
> > +	if (arch_id == ANDES_AX45MP_MARCHID && impid == ANDES_AX45MP_MIMPID) {
> > +		if (!ax45mp_iocp_sw_workaround())
> > +			return;
> > +	} else if (riscv_isa_extension_available(NULL, ZICBOM)) {
> >  		return;
> > +	}
> 
> Is this correct? The code goes on to always mark noncoherent stuff
> supported, so this means that every andes device must then support
> noncoherent. The commit message's wording isn't that strong.
> 

Yes, this is intended. IOCP is configurable on Andes cores: a core
either has no IOCP, or has IOCP that the SoC can enable or disable
(RZ/Five, for example, disables it). As this is up to each SoC, we
would rather not check it for every core and configuration, so the
errata marks non-coherent DMA as supported on every Andes core without
Zicbom.

This does not make any device non-coherent: a device is still coherent
unless the devicetree marks it dma-noncoherent, and the CCTL cache ops
are only registered when the devicetree has the LLC node.

I will make this explicit in the commit message.

> >  
> >  	/* Set this just to make core cbo code happy */
> 
> This comment is no longer accurate because you gave this value special
> meaning elsewhere in the series.
> That patch needs to change this comment.
> 
> Cheers,
> Conor.
> 

I will update the comment in the patch that gives this value its meaning.

Thanks,
Mina

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
