Return-Path: <SRS0=2wW0=KX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F48BC47087
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 12:03:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B061061176
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 12:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B061061176
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XaT9CqEzimZndTGJ44WO0rQRcc8x3Z0uL8/BFasCXC0=; b=LevgfEsQbCrbZ+
	jfq3PWdHFmkbD7PYlbxh0SmlmQxctBdpV/SfRRLTAH1xVPvHfQaLRDLDW9FvhctVDfjriyKFnyLo2
	Xu48uphXRlCO9jmIWwmtQrlduKC3ZkGihKE3PmCmVRjbiGqe6qO6LzkTYkYkxXkTrkRwgozu4GWLQ
	Fi9P+/531mpwUw9g5EBsbSLyYQAnKhH0SuPiyVh8gt6EqLvs58L8mkIV0gTgmOXhMpRkYafL/Qc4V
	KAgzhhjqmBe6y1L6ZeCiB+zRAHDNMKHIgDQVPdAUayVoH8OdZarJbeOiddwXvC8lgmw36J+mP9d3L
	UMfhQeCEXkVMe2umLQ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmbCi-00FB0c-3A; Fri, 28 May 2021 12:03:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmalx-00Eudq-L7
 for linux-riscv@lists.infradead.org; Fri, 28 May 2021 11:35:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B24461378;
 Fri, 28 May 2021 11:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1622201725;
 bh=FvEGdzWGkZ7iczpg1RLQ58Pbdxq0D2KwOK1g5mLUTqw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D9XQdo8NrMTWJ2oXbVaSNctdww9mrtIy217fS1XBWfVLA8V/nSucu6ng83sYXCSOF
 dlG+i2UKXnsbzZwvvISUnLc22qS0ErShwToV2+BihivLR7mppoaxcoV4dPcuE3EpQD
 sx+rPqSDDAN3Jc5Y6q4yWrSP5UA/H5OyxVyp2oUQ=
Date: Fri, 28 May 2021 13:35:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: arch/riscv/staging
Message-ID: <YLDVdiCop9jgDbav@kroah.com>
References: <9eb59267-542b-8adc-07-d795f5a43098@sifive.com>
 <CAAhSdy3RFGEq0+ZWUjsVCsmR8EvQzs6JOQMRXt7+92wNnCE27w@mail.gmail.com>
 <53424413-4a31-7a12-759a-49e3f41f11a@sifive.com>
 <9f107eaf-cc6e-d554-c923-62fb317c4d4b@redhat.com>
 <YLCvdmwPrm/S/GKg@kroah.com>
 <CH2PR04MB70782F16D88C700AB621D1B6E7229@CH2PR04MB7078.namprd04.prod.outlook.com>
 <YLC211VUeTrUdo3v@kroah.com>
 <efa8b40b-4c64-4323-7070-223329a52872@redhat.com>
 <YLDNEbm+M/geZkHG@kroah.com>
 <e6160b1f-7e13-d277-1996-fe1fefb75a73@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6160b1f-7e13-d277-1996-fe1fefb75a73@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_043525_753188_EB3B78D2 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
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

On Fri, May 28, 2021 at 01:28:16PM +0200, Paolo Bonzini wrote:
> Anyway---I understand that you don't care (you shouldn't).  Just from my
> point of view it's ridiculous that I cannot merge code that is completely
> standalone just because it has one file in arch/riscv/include/asm/uapi, and
> that RISC-V maintainers cannot participate in the community the same way
> everyone else does.

I don't care, but I do agree with the riscv maintainers not wanting to
merge this now.  I would do the same thing if I were them.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
