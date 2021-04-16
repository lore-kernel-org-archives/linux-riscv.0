Return-Path: <SRS0=iBqs=JN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DACD4C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 00:22:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 803886113D
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 00:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 803886113D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qaALoHqom7ylNscDPozARiFQiONZmY0dxLyMCSQTm0k=; b=M/4pwIgbH7z6tSFYa6BQYPh6w
	ZWAtBjTlIuypT1USeOdwYHcaeEteJP/Qi6xrNP021G7MTg1ZMQQ9P1OwVfdMGlxnpAYkvZ5UP/jG7
	MpCZ16np341UUHKAxYkau7wtp4o/M2RZ0l5ZbpIJQAWnGWxHy99//js//D3iURQ1SOckJIhYmro4A
	vOSOV2y0ymx55y81ZD7hbGws43Cj6pl0PzQdQKwmElewL+oyNeezJT5c3apfgcP9IVCfItOWH4Tdv
	qQbjhZhmdm5LwAyYOD2lZPL+o3hdvCLVJ2gUiXLsEPSNKf+4dV+Nh5Pht8tFjd9fOwYvQaPtKbjtH
	M6QFRPuCg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXCFQ-000DWH-87; Fri, 16 Apr 2021 00:22:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXCFK-000DW6-CX
 for linux-riscv@desiato.infradead.org; Fri, 16 Apr 2021 00:22:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ory+BrRf/2eyQZ9ZxM920k3MV4fEp484+/PD0vIEQl8=; b=iQD00IAyuBKV6I6TrZ7hdbqJXB
 YlRvXb5LFDEgWk/S7NGyfXhZFQv5Pdci9LW62uvnHRpur/IC7eYqrD0CkMjiPWFKVJRgWygCUCuxY
 EQ1zJyZLGlOygVJTengIZDUafyq/QEwIntM37tCGCyglgvjem32/WKgltDOaniSEcepBTjtRaD14K
 cJ0bcoHPIx0bVyrOfDy2jS0gSdVv3+NbIragRxeo42V3BDSPyM2A9ObwiJVhv70k8ELGghq3Gpwz2
 opuw7ut7tuAijP54jLSkc63J7vcvX/V2jU3sdMio9zB8Pm08f9hO0zMpPIKqYCdivm7N4tx01YkEw
 2he9nb6w==;
Received: from zeniv-ca.linux.org.uk ([2607:5300:60:148a::1])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXCFH-00900h-Hm
 for linux-riscv@lists.infradead.org; Fri, 16 Apr 2021 00:22:04 +0000
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lXCF6-005dLJ-Fl; Fri, 16 Apr 2021 00:21:52 +0000
Date: Fri, 16 Apr 2021 00:21:52 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jcmvbkbc@gmail.com, gerg@linux-m68k.org,
 Anup Patel <Anup.Patel@wdc.com>, uclinux-dev@uclinux.org
Subject: Re: [PATCH v2 0/2] Fix binfmt_flat loader for RISC-V
Message-ID: <YHjYoDA2JPxSYVu0@zeniv-ca.linux.org.uk>
References: <BL0PR04MB65148D80C819A7E3B8365242E74D9@BL0PR04MB6514.namprd04.prod.outlook.com>
 <mhng-61cff5f4-32a0-417d-9a2f-eb6d052cf802@palmerdabbelt-glaptop>
 <20210415055605.GB8947@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210415055605.GB8947@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_172203_610491_C51A19E4 
X-CRM114-Status: GOOD (  12.40  )
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

On Thu, Apr 15, 2021 at 07:56:05AM +0200, Christoph Hellwig wrote:
> binfmt_flat tends to go through Greg's uclinux tree, adding him and
> the list.

	FWIW, my involvement with binfmt_flat had been pretty much nil -
the least trivial had been "binfmt_flat: flat_{get,put}_addr_from_rp()
should be able to fail" about 4 years ago and that fell out of hunting
for places where __get_user() had been used without checking error values.

	It's in fs/*, but I've no way to test it and I have pretty much
zero familiarity with the guts of that one, so I can't give any useful
feedback on that series.  So consider the Christoph's comment seconded -
you want it reviewed by gerg et.al., and it probably ought to go via
gerg/uclinux.git tree.

	I'm reasonably familiar with binfmt_{elf,misc,script}; anything
else gets touched as part of larger series and only with sanity checks
from other folks, if the changes are not entirely trivial.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
