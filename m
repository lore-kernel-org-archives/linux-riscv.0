Return-Path: <SRS0=UPnX=V4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02587C32751
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2019 17:08:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCDA0214DA
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2019 17:08:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IZA6xQIU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCDA0214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHRxXpGQjaX9rhdzoKduiZ+auz83VZYI3NKO3z5rBqc=; b=IZA6xQIUyF8SpI
	HtIKMkpmUqqvBWUAhkZSEHPP6rEhDrISmV60RkyOEKFwI1qecyipvI7l/3MRhyCjUfitX3Cov9L9F
	CJNoPqa9L9s41i49vgowNFX5NgpIc60LZCI6Ola3zGKALCtZkz/l16XnRSYsJFclgSzs291xeYjFc
	+1o+1J9d7QVMt5MY5bmrw8VI6CebZINZvGZrm6qpRCZAD8E+f8CEzO2uuZuQShNsAwmOyXemGVVUy
	A8/KZi1f6nuwtbXyUMh4YeCWJOvKl+yPqwg/cYbnXSLTLx02QPy7c0w48ViBO9Wtc90xNsAoMIQ3+
	WfcQxggxHJfieaCHTKRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hss54-000126-P1; Wed, 31 Jul 2019 17:08:02 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hss51-0000nu-IF
 for linux-riscv@lists.infradead.org; Wed, 31 Jul 2019 17:08:01 +0000
Received: from s01061831bf6ec98c.cg.shawcable.net ([68.147.80.180]
 helo=[192.168.6.132])
 by ale.deltatee.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <logang@deltatee.com>)
 id 1hss4m-0005K0-0o; Wed, 31 Jul 2019 11:07:44 -0600
To: Greentime Hu <green.hu@gmail.com>, greentime.hu@sifive.com,
 paul.walmsley@sifive.com
References: <20190109203911.7887-1-logang@deltatee.com>
 <20190109203911.7887-3-logang@deltatee.com>
 <CAEbi=3d0RNVKbDUwRL-o70O12XBV7q6n_UT-pLqFoh9omYJZKQ@mail.gmail.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <c4298fdd-6fd6-fa7f-73f7-5ff016788e49@deltatee.com>
Date: Wed, 31 Jul 2019 11:07:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAEbi=3d0RNVKbDUwRL-o70O12XBV7q6n_UT-pLqFoh9omYJZKQ@mail.gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 68.147.80.180
X-SA-Exim-Rcpt-To: hch@lst.de, michaeljclark@mac.com,
 linux-riscv@lists.infradead.org, olof@lixom.net, zong@andestech.com,
 sbates@raithlin.com, linux-kernel@vger.kernel.org, palmer@sifive.com,
 andrew@sifive.com, aou@eecs.berkeley.edu, robh@kernel.org,
 paul.walmsley@sifive.com, greentime.hu@sifive.com, green.hu@gmail.com
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH v4 2/2] RISC-V: Implement sparsemem
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_100759_666248_0B956226 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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
Cc: Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Waterman <andrew@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Bates <sbates@raithlin.com>, Zong Li <zong@andestech.com>,
 Olof Johansson <olof@lixom.net>, linux-riscv@lists.infradead.org,
 Michael Clark <michaeljclark@mac.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 2019-07-31 12:30 a.m., Greentime Hu wrote:
> I look this issue more closely.
> I found it always sets each memblock region to node 0. Does this make sense?
> I am not sure if I understand this correctly. Do you have any idea for
> this? Thank you. :)

Yes, I think this is normal. When we talk about memory nodes we're
talking about NUMA nodes which is unrelated to device tree nodes.

I'm not really sure what's causing the crash. Have you verified it's
this patch that causes it? Is it related to there being a hole in your
memory, does it work if you only have one memory node?

Thanks,

Logan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
