Return-Path: <SRS0=pIoZ=R2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DAC7C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2019 08:06:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29C1C21019
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2019 08:06:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CIgFufkr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qKvg0Znt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29C1C21019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YMpFuVT5/SlLzyunlqIu0bsrIE7pQWQO7YULwmBOIOw=; b=CIgFufkrq4jWATFg2TVL0RVHI
	SXJQTZhaL34TlKE1tz8h6fcIbXk+plLvJmRWQzLsvKT78aO6XL/l4sZ79pcAB/MnYDYuHlYHNcOmy
	PYHrj86UWRkQCmP4famD477hoj3JXuoUTH85JJu5zo8t5ITbL19/PBIgYq1iMIHApIWvhgLZoLUlQ
	pmUQokhLVSr7afQvqkMj+pLiv+6YB0UTaD7AyYPGurMipgWo95Mw8loP6IQ1gH8Xaa8lre9ttybvM
	/UcMDDRDc0xIzsv2AXJQdknNZ01IAbt+zP22O10Awz5TfIvhHfQVg6qRsCywbArO2F16uKxWugd+s
	JMCFGJmhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7bfz-0005Vs-M9; Sat, 23 Mar 2019 08:06:47 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7bft-0005Qg-O6; Sat, 23 Mar 2019 08:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5ZyeHhk8jX7F5DZbMSHEyIXXEHxKDW+apBnMTk88T7w=; b=qKvg0Znt2dxzzTQBydVswNkfbN
 MtC3UyAYLKFw/UJYiiZc5QT7k29L3xFBSduZFud5Vy/s+gWfvK0IjJkqjkvNDxmqVdKWHqqpFCze6
 h2XInQako5JaR+seDUqlVY1LcksT/Lp+pZebOzl0bEkDn7KTHsy8tMLMJHl1s4CgmlpnUIvfstRc2
 8L1eOKbr0n9CT3e10YKKVxsqPhQDN/2lDdceaPTOQ3owWMoApIdKLICs555vBoLzHlBB0EczWe9Q3
 GGEX277JmcgXVtpfgA+wa1tfQXz6GgIoLqkGqR5DVCGuNQCs4QZfEvOzvA77sQpc7lXw9OGmuuSEP
 gwvTI//A==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7bfq-0002kg-5y; Sat, 23 Mar 2019 08:06:39 +0000
X-Originating-IP: 79.86.19.127
Received: from [192.168.0.11] (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 6F8B9FF808;
 Sat, 23 Mar 2019 08:05:50 +0000 (UTC)
From: Alex Ghiti <alex@ghiti.fr>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 4/4] riscv: Make mmap allocation top-down by default
References: <20190322074225.22282-1-alex@ghiti.fr>
 <20190322074225.22282-5-alex@ghiti.fr> <20190322132246.GB18602@infradead.org>
Message-ID: <f556e3a3-c4a7-3b4b-90ad-e59686efcd7b@ghiti.fr>
Date: Sat, 23 Mar 2019 04:05:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190322132246.GB18602@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190323_040638_384153_F6D726F6 
X-CRM114-Status: GOOD (  10.27  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Burton <paul.burton@mips.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, James Hogan <jhogan@kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Luis Chamberlain <mcgrof@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/22/19 9:22 AM, Christoph Hellwig wrote:
>> +config HAVE_ARCH_MMAP_RND_BITS
>> +	def_bool y
> This already is defined in arch/Kconfig, no need to duplicate it
> here, just add a select statement.
Right, I will fix that,

Thanks Christoph,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
