Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F260BC282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 05:55:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1585222C0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 05:55:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KHVu0V/i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1585222C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m30Munq+W/6lwhU30MAHounoLeXhvLfzuO/iVBqmO98=; b=KHVu0V/i/sJqDS
	eVgOkMTIzl9La/+Ozd7LIiMmwiSHzyLMvcltpuAI4kFRdEwPX0daTcvuFuSi6TS6UklJmy3Z4pIkE
	+jxztEJfDFiGWQUhlcxj10/ID7kgY9BK9IHhfsT4wMYNmhHL2Fv2935E4hyfeVRzQCKRXWCHfk1o+
	P8Dtag4aW2Hy8o8fbnDLMxGgimkOOluSSefDqvCzHEbEHcxj6KuuyyHAgs95fezyAJ3d1oJ4tcBCy
	oI9210TXJqAxTQQ8VfM0N/Gj8a40iJes9T2fqMisovYBA03/jOReiq1jHOe1smvi0pLs/pteqpwSF
	FF7YJqTVIgdD7kfSRrGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtnVo-0002xA-TJ; Wed, 13 Feb 2019 05:55:12 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gtnVm-0002mt-6O; Wed, 13 Feb 2019 05:55:10 +0000
Date: Tue, 12 Feb 2019 21:55:10 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH v2 6/6] RISC-V: Implement keepinitrd kernel parameter
Message-ID: <20190213055510.GA5725@infradead.org>
References: <20190119132650.9978-1-anup.patel@wdc.com>
 <20190119132650.9978-7-anup.patel@wdc.com>
 <20190212070807.GD26747@infradead.org>
 <CAAhSdy1NED22YyYrAJDqPkDqT1c2ms2QC9OjHP0qLwHT+o2zvg@mail.gmail.com>
 <20190212184505.GA10984@infradead.org>
 <MN2PR04MB60615E8737B56B1B213B5FA58D660@MN2PR04MB6061.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MN2PR04MB60615E8737B56B1B213B5FA58D660@MN2PR04MB6061.namprd04.prod.outlook.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 13, 2019 at 03:43:06AM +0000, Anup Patel wrote:
> Sure, the keepinitrd=0 by default so it will always free-up initrd by default.
> Please look at v3 patchset.
> 
> Of course, we need separate patch to update documentation of keepinitrd.

No, we need to not just blindly copy what arm did for historic reasons
unless we have a very good reason of our own.

In addition to not having a real need for any of this in a new setup,
it also is duplicated by the retain_initrd parameter which is
implemented in generic code - and for that the commit message at least
has a rationale related to kexec:

https://lkml.org/lkml/2006/12/7/15

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
