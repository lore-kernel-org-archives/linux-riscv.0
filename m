Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24427C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jan 2022 17:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWetnG/HsXwSv1zPHfroWsn3CYJrPE/x/JoaTACylF4=; b=f3YXWEBmgGG9V0Xqz/ReS23/mf
	tOobr//qAULJy86hmD2SkpcscMM74C6x61Vac59FAp+rQRoUyN5g2Zl399Ln4BeVtl2fO5vySSYoT
	RLYIgx+mMwNWMLJO6eQl9ejp4hvIdrf3Zn8q7mn2udZuGfOVcOHk1bRq+hRM2dfFI4DM0/YnWloif
	5SfDYX05DtUh+eV/5p/rb5aESMo4m6faD//C8csxGeCX4JXBGE1JdeMEJAkhfyyK+ACQukvPD3k4u
	DwXDheHi+dSh/KkzIv4Yi7ttQXg55601ShJSnRORDcch9Mqqk6yFEzQNRYC/ZZzT8nk8iFc4FAm/t
	FNRIRV/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5Wpe-000sMc-LV; Thu, 06 Jan 2022 17:45:46 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5Wpc-000sKz-EN
 for linux-riscv@lists.infradead.org; Thu, 06 Jan 2022 17:45:45 +0000
Received: from fraeml715-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JVDFV64LGz67PH4;
 Fri,  7 Jan 2022 01:42:22 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml715-chm.china.huawei.com (10.206.15.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 18:45:40 +0100
Received: from [10.47.27.56] (10.47.27.56) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 6 Jan
 2022 17:45:39 +0000
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
From: John Garry <john.garry@huawei.com>
Message-ID: <00c5a9e2-1876-e8d1-68f3-2be6d3bd38cb@huawei.com>
Date: Thu, 6 Jan 2022 17:45:24 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20211227164317.4146918-1-schnelle@linux.ibm.com>
Content-Language: en-US
X-Originating-IP: [10.47.27.56]
X-ClientProxiedBy: lhreml736-chm.china.huawei.com (10.201.108.87) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_094544_666651_6D9BA0B5 
X-CRM114-Status: UNSURE (   7.49  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Niklas,

On 27/12/2021 16:42, Niklas Schnelle wrote:
> I performed the following testing:
> 
> - On s390 this series on top of v5.16-rc7 builds with allyesconfig i.e. the
>    HAS_IOPORT=n case.

Are you sure that allyesconfig gives HAS_IOPORT=n? Indeed I see no 
mechanism is always disallow HAS_IOPORT for s390 (which I think we would 
want).

> It also builds with defconfig and the resulting kernel
>    appears fully functional including tests with PCI devices.

Thanks,
Johnw



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
