Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DABC433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 05:56:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5800B61244
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 05:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5800B61244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tqHGiCUV7rhFyAAU8NxLVDeU9uxeusnkthJ0iPAIlAA=; b=hOSHRU6UH3KlH5wtxstGzo0Q/
	vhfw+JIm0BpAT7VTsFI10E8uch10gpKfk28ZsfYaoQWdColOVYUk4MP94o3Ktdx1N9gkM5ci1p4Up
	RxsqMptuTLiW8pysV+rV+TG6UaVc60DQq0vqlwFfCMX8utyOQ+fChECwxMGYAb/7N0otgYSbOPqO3
	qm/th1klx+quEHuJlQo8++HES5GCcIZtf3hfAwn1GKY9fXjtj+HvxBw1jnhYAH4ap7M6yjpjEWMhE
	yW2Pk1/+66DwC/kRkdwyUVmyuN3cpUfCfwfaSrqcYOaoRKqO3N6/dyDZxJLQgaVShWc/MF/xs9Egv
	aKXh8bwbg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljFBd-002vnd-QR; Wed, 19 May 2021 05:56:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljFBa-002vnL-Hj
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 05:56:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=JTKiz4ZX28aFJRoJp3iaJNnqvEtS+Q/rUUy9wxbQXZw=; b=nvcVu4iYr0heA3c0IGqZYHc4cP
 Z/zkQv0KYa0QUAE3jnovu+7PDSwvituXGo4bbgk78W6b35z5H1ILNiRop8EtI91E1wRHUfaOhWEFS
 3kSYKrz+sB65q70rR1vFbJdhxOTLYBAOl/cxezknHCjDpUZ6gc3Y6IKrYfPAq4nOv9eybbnJXO0qO
 TFHo6iszwKJwFzZ3fMlfnXeTw1PHrnwjtYfzGjXvOlKGc67k9vAfHLI+LeketVN9ozq+6M9njRgUo
 AfSM0y1T+39qRoA2P5lyrZAtZKi03AWQUFLc+VcHLl9D5NBv4+3GzQB2iDBJbSEjDPU81wPtfct++
 NcYoziow==;
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljFBX-00FAAO-Tw
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 05:56:01 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3E3AF67373; Wed, 19 May 2021 07:55:55 +0200 (CEST)
Date: Wed, 19 May 2021 07:55:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: Guo Ren <guoren@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, drew@beagleboard.org,
 wefu@redhat.com, lazyparser@gmail.com,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Message-ID: <20210519055555.GA27451@lst.de>
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_225600_138237_EBA04EA9 
X-CRM114-Status: GOOD (  11.24  )
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

On Wed, May 19, 2021 at 01:48:23PM +0800, Guo Ren wrote:
> The patchset just leaves a configuration chance for vendors. Before
> RISC-V ISA fixes it, we should give the chance to let vendor solve
> their real chip issues.

No.  The vendors need to work to get a feature standardized before
implementing it.  There is other way to have a sane kernel build that
supports all the different SOCs.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
