Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 507B8C282CA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 08:54:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FEC52080A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 08:54:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aWp8Rodo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FEC52080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zj+2oC0qm08NwUZqX772kfpPB/T8nQa1EDG4sSNIy/8=; b=aWp8RodovbJfj4
	jz2sQeQrwODDf6zuiusgKF2ghN7kikVdvaNbaSxe87UtparIzQveU7luu00YSuldkbn84tcrCFkGh
	TDYR4PmLk6Sqcgh2BgduqaPpUKx2dsW8gwvAP+HV7d1p2uPx99GW2cTE0skXpVRBpRe8tC9r0jzCs
	smKaK81v0W7JA5LfRB6Swa/YuZpoy0sQ8NGk9ZRUza130FnKX5Mg3AAAbkLG0Rcto5jobpuj31P08
	fv8tWFDV8O+WPcA5wY0aK/3fSgTJg2mUgXAidQYcvHWZqtA4zJ9wLloACDPnzrzPkIrckouADVCfQ
	woCNLeSeAnggQe83wAhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtTpF-000527-C1; Tue, 12 Feb 2019 08:53:57 +0000
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtTpD-00051i-7N
 for linux-riscv@lists.infradead.org; Tue, 12 Feb 2019 08:53:56 +0000
Received: by mail-lj1-f194.google.com with SMTP id e17-v6so1493335lja.8
 for <linux-riscv@lists.infradead.org>; Tue, 12 Feb 2019 00:53:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EKvsYtgzxxN2IFq90tTBe+XystKVPP02/T9yj2UzJjs=;
 b=thA1UzsZjvkDNkW2Ebn8yQWn8rVrKWFOVkso+svOIqVHrVwv2lwUpN7XEflCjW9J2+
 fh4xOv8L3fb1v3pjCuUz6XJvpfM+K1iF4OEj6JrhGdo5swUg7FOORzkJWdV21511oMmb
 TpNPbzic8taUaPfDidcb/w43fDJ2ax6M4K383M0Sqo5zm16qN/RiTyNPDAyLSRBAflY1
 Fp4DbrYcephrh558pywA6cOTerEZl61hIoFhrdF/Pd/mcIZJjT5oChkG9Qb8juE7257u
 uyAN6yv/lLSmb6CZeqKFONTF5vAO8Qq+sl/lvjaGJDzwE/ix+4kYlDcst5ffw8LKnZFH
 8YZA==
X-Gm-Message-State: AHQUAuYFR/j2YRBGI6OZt2xARVnWUbeaILs5bFtHlEaYJDzvfPmBKzgq
 XGG8f1DICenjTbLp+SR02nk=
X-Google-Smtp-Source: AHgI3IYlWrp1TuyBfHAGCvZqaIRtxwLnYnl0wM5o5uEkRIm0jo1bF3N/lpWfCak+oXcWA4dRnfx23g==
X-Received: by 2002:a2e:90ca:: with SMTP id
 o10-v6mr1621904ljg.134.1549961632951; 
 Tue, 12 Feb 2019 00:53:52 -0800 (PST)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se.
 [85.230.190.116])
 by smtp.gmail.com with ESMTPSA id q6sm2803135lfh.52.2019.02.12.00.53.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Feb 2019 00:53:52 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.91)
 (envelope-from <johan@kernel.org>)
 id 1gtTp3-0007O1-2c; Tue, 12 Feb 2019 09:53:45 +0100
Date: Tue, 12 Feb 2019 09:53:45 +0100
From: Johan Hovold <johan@kernel.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 5/5] riscv: use for_each_of_cpu_node iterator
Message-ID: <20190212085345.GA28278@localhost>
References: <20190118140308.9599-1-johan@kernel.org>
 <20190118140308.9599-6-johan@kernel.org>
 <20190212071339.GL26747@infradead.org>
 <20190212082621.GA26912@localhost>
 <6518a7ff-0586-be7a-4a43-6c9a35194a05@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6518a7ff-0586-be7a-4a43-6c9a35194a05@wdc.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_005355_266896_A50B2009 
X-CRM114-Status: GOOD (  16.90  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>,
 Palmer Dabbelt <palmer@sifive.com>, Johan Hovold <johan@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Anup Patel <anup@brainfault.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 12, 2019 at 12:47:09AM -0800, Atish Patra wrote:
> On 2/12/19 12:26 AM, Johan Hovold wrote:
> > On Mon, Feb 11, 2019 at 11:13:39PM -0800, Christoph Hellwig wrote:
> >> On Fri, Jan 18, 2019 at 03:03:08PM +0100, Johan Hovold wrote:
> >>> Use the new for_each_of_cpu_node() helper to iterate over cpu nodes
> >>> instead of open coding. Note that this will allow matching also on the
> >>> node name instead of the (for FDT) deprecated device_type property.
> >>>
> >>> Signed-off-by: Johan Hovold <johan@kernel.org>
> >>
> >> I think this is going to conflict with the ELF caps changes from
> >> Atish.  Maybe the riscv_fill_hwcap hunk should be included in his
> >> patch?
> > 
> > Since that patch had some issues (e.g. the node reference underflow) it
> > may be better to rebase it on top of this series. The changes are
> > otherwise distinct after all.
> > 
> 
> I have fixed the node reference underflow issue and made some more 
> changes based on comments.
> 
> Some other patches(1,3,4,5) in this series may conflict with my series 
> as well. I can rebase my series on top of yours and send it as one 
> series if that's okay with you and Palmer.

No need for you to resend these patches as they are reviewed any ready
to be merged. Just rebase your series and mention the dependency in the
cover letter as I did with Andreas's patch which this series depended
on.

Thanks,
Johan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
