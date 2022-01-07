Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F2BC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jan 2022 16:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOzZxnoZ+RIxtMO9yYH3eXp9hZSK2Tb/T9ngsQuzICk=; b=CRHbVSHg38rDYPjA/JyCsEuWhz
	04hc0jPzfUYe8J1OozMHyJ83lBnP6qZu8A1F6EC+pha77UExFwgS688/r80RMZbYVa94HQWsWuS/B
	6uck/S0woBCkmIoFShKRFHl1vf6oL6RJI9MzAA1S3dReSCF/cQuQzFMEFffCv0gVoIVVaO6TNbfHz
	lmDVu3txJT+54VF5Nxue/j//2Tj27a7BkcIRTe25U4r2bR9PBpuCX8ap3CJ8JEkR7gmc9BmgGhhTe
	nXw3nd1Ggfhf8J2aG6KCDbMDLOprfiiA+Eyxl06AYO9rrc/d6McWYPS80caaAs3CThnFEhu/GhBix
	DOeQGEYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5sZ6-004hE2-9I; Fri, 07 Jan 2022 16:58:08 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5sZ2-004hCX-Lb
 for linux-riscv@lists.infradead.org; Fri, 07 Jan 2022 16:58:06 +0000
Received: from fraeml710-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JVq6700Cbz67Nt8;
 Sat,  8 Jan 2022 00:53:02 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml710-chm.china.huawei.com (10.206.15.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 7 Jan 2022 17:57:59 +0100
Received: from [10.47.89.210] (10.47.89.210) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 7 Jan
 2022 16:57:58 +0000
Subject: Re: [RFC 00/32] Kconfig: Introduce HAS_IOPORT and LEGACY_PCI options
To: Niklas Schnelle <schnelle@linux.ibm.com>, Arnd Bergmann <arnd@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-csky@vger.kernel.org>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <00c5a9e2-1876-e8d1-68f3-2be6d3bd38cb@huawei.com>
 <64d4b0d66379affd59c5a24ddb71a8f208330362.camel@linux.ibm.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <38c595ea-f2fb-db54-397b-41c67fa59208@huawei.com>
Date: Fri, 7 Jan 2022 16:57:44 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <64d4b0d66379affd59c5a24ddb71a8f208330362.camel@linux.ibm.com>
Content-Language: en-US
X-Originating-IP: [10.47.89.210]
X-ClientProxiedBy: lhreml745-chm.china.huawei.com (10.201.108.195) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_085804_895716_0A25DBB5 
X-CRM114-Status: GOOD (  10.45  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 07/01/2022 07:21, Niklas Schnelle wrote:
> I checked again by adding
> 
> config HAS_IOPORT
>         def_bool n
> 
> in arch/s390/Kconfig and that doesn't seem to make a difference,
> allyesconfig builds all the same. Also checked for CONFIG_HAS_IOPORT in
> my .config and that isn't listed with or without the above addition.

Strange, as I build your branch and I see it:

HEAD is now at 9f421b6580ed asm-generic/io.h: drop inb() etc for 
HAS_IOPORT=n
john@localhost:~/kernel-dev5> export ARCH=s390
john@localhost:~/kernel-dev5> export 
CROSS_COMPILE=/usr/bin/s390x-suse-linux-
john@localhost:~/kernel-dev5> make allyesconfig
#
# configuration written to .config
#
john@localhost:~/kernel-dev5> more .config | grep HAS_IOPORT
CONFIG_HAS_IOPORT=y

> 
> I think this is because without a help text there is no "config
> question" and thus nothing that allyesconfig would set to yes. I do
> agree though that it's better to be explicit and add the above to those
> Kconfigs that don't support HAS_IOPORT.

So maybe something like:
config HAS_IOPORT
	def_bool ISA || LEGACY_PCI
	depends on !S390

Otherwise you can build inb et al from asm-generic/io.h and get the 
original compile error about arithmetic on NULL pointer, right?

But I assume that there is a more elegant way of doing this...

Thanks,
John



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
