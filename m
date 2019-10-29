Return-Path: <SRS0=1ux9=YW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C10E1CA9EAE
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2019 18:22:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94AE320679
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2019 18:22:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pb6b/icT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94AE320679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pwsan.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9S+HdCLWSWaXS0TWGhvEaLoJbXy0FmjoJd7QmcCtd88=; b=pb6b/icT7EihRd
	vXmrVwZs1jFBM8tLsIc7nZoILX0RDh8LGPXecX4Fnby/qfn37/b4V6rDF4vZ022WFN0kSpZoC/UEg
	YiBQup8rasTyyGYiCjoqzz5zcEJ+trMR7vVbzNsrxlyAPvIZDGspStrtbxg6dVq24za3Khmz1bknq
	2bSPF6pJPbI7R8R2isf0JKARbYX/uzRw8oWrbLNVctJloPZGgqKVU56VAh1ntitZaMeIZSGeXdBlC
	rRZgCSWYqAIH9ROuuHFxhnbd+NULQpC0iv+KKs+tzk+SJoCh6h4ipr9LXjy2Db1mLCSl4J2zmgQZu
	VJq0IMmX4FMRUZOW5+TQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPW8l-0005Fg-Eg; Tue, 29 Oct 2019 18:22:47 +0000
Received: from utopia.booyaka.com ([74.50.51.50])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPW8i-0005Eh-Cp
 for linux-riscv@lists.infradead.org; Tue, 29 Oct 2019 18:22:45 +0000
Received: (qmail 19504 invoked by uid 1019); 29 Oct 2019 18:22:39 -0000
Received: from localhost (sendmail-bs@127.0.0.1)
 by localhost with SMTP; 29 Oct 2019 18:22:39 -0000
Date: Tue, 29 Oct 2019 18:22:39 +0000 (UTC)
From: Paul Walmsley <paul@pwsan.com>
To: Yash Shah <yash.shah@sifive.com>
Subject: RE: [PATCH v2] RISC-V: Add PCIe I/O BAR memory mapping
In-Reply-To: <CH2PR13MB3368A6E99DAB164A52D2954A8C610@CH2PR13MB3368.namprd13.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.999.1910291822280.15841@utopia.booyaka.com>
References: <1571992163-6811-1-git-send-email-yash.shah@sifive.com>
 <alpine.DEB.2.21.9999.1910250852420.28076@viisi.sifive.com>
 <CH2PR13MB3368A6E99DAB164A52D2954A8C610@CH2PR13MB3368.namprd13.prod.outlook.com>
User-Agent: Alpine 2.21.999 (DEB 260 2018-02-26)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_112244_514255_1D28DAC6 
X-CRM114-Status: GOOD (  10.36  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "sorear2@gmail.com" <sorear2@gmail.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "alex@ghiti.fr" <alex@ghiti.fr>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "Palmer Dabbelt \\\( Sifive\\\)" <palmer@sifive.com>,
 "will@kernel.org" <will@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 Sachin Ghadi <sachin.ghadi@sifive.com>,
 "Anup.Patel@wdc.com" <Anup.Patel@wdc.com>,
 "Paul Walmsley \( Sifive\)" <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "logang@deltatee.com" <logang@deltatee.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "allison@lohutok.net" <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 29 Oct 2019, Yash Shah wrote:

> > On Fri, 25 Oct 2019, Yash Shah wrote:
> > 
> > > For legacy I/O BARs (non-MMIO BARs) to work correctly on RISC-V Linux,
> > > we need to establish a reserved memory region for them, so that
> > > drivers that wish to use the legacy I/O BARs can issue reads and
> > > writes against a memory region that is mapped to the host PCIe
> > > controller's I/O BAR mapping.
> > >
> > > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > 
> > Thanks.  And just to confirm: this is a fix, right?  Without this 
> > patch, legacy PCIe I/O resources won't be accessible on RISC-V?
> 
> Yes, this is a fix.

Thanks, queued for v5.4-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
