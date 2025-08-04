Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4485C87FDA
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 07:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m64N8lljECUWLm54hWvg2gJDJIwd32BkmFmHAF00+WY=; b=mHbbgxvgDfCmU3
	6EFrJcIOcBtIecS3KUr0sRdXvpbaT2vFw9dVfM4p4eC5Ew8bHhw394rXXSRQCdxb4BraGM4OQH9nY
	fzfPw00P6/dJzlLenHWCB33yHTO5qhts0b60XA20mt50InMFSpnIuoSOn6XjeIU4v832spQlOCX2X
	kVfpkBP/vaBtvgoxyUcLZc3XPARr58EHhOfpPpapLUwg3jO3WM/P0FbZozgrsF2pMEXAuc8wOxCI3
	po5/Y1lmO/VaT/c8iy0W4TWz8Vc1mrxBXvqvTTKvwT4+zsljWHHQZBoTtSUE4f2EfETBAzQSMV6k8
	U9ukcKmRp3yJGJTekJ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uips7-00000009qfK-05Hw;
	Mon, 04 Aug 2025 07:44:39 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uips3-00000009qcM-0VwE
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 07:44:37 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250804074430euoutp02168ac428de8aee5b87f222a639b36c29~YgJ3QonwN1189011890euoutp02V
	for <linux-riscv@lists.infradead.org>; Mon,  4 Aug 2025 07:44:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250804074430euoutp02168ac428de8aee5b87f222a639b36c29~YgJ3QonwN1189011890euoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754293470;
	bh=XCJ4mUS0Zqljxl+0xsR/Xtr1rtJVfd83zF4hgcLgcl0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=YmCZicYT5HoZX3M1/LaR+Jmyyq2lLLXBPgiL3pXa9gYoHic8us3f1wyxeFENatqcb
	 KAOKZqN3yiBn66HXbYLOQ+FS6Cs75FPrI+uwYu6gwNYKvezeOxWjtWyTWTXZfuWfNr
	 SbZ8uE4egR1Rj07WFZGDnQAz9P+zYuyDRtuAqGZ4=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250804074429eucas1p2e907080fb8c5fb239004bcc0a2bcd7e6~YgJ2oZ12f1992219922eucas1p2x;
	Mon,  4 Aug 2025 07:44:29 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250804074428eusmtip16818df9316fcfbaa64df92efe7047970~YgJ1kJHR50614106141eusmtip1O;
	Mon,  4 Aug 2025 07:44:28 +0000 (GMT)
Message-ID: <6caeecdd-cf9a-41af-a744-40831c81fb96@samsung.com>
Date: Mon, 4 Aug 2025 09:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/4] Add TH1520 GPU support with power sequencing
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel
	<p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, Matt Coster
	<matt.coster@imgtec.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, Marek
	Szyprowski <m.szyprowski@samsung.com>, Drew Fustini <fustini@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20250804-sociable-sceptical-snake-f5ac8d@kuoka>
X-CMS-MailID: 20250804074429eucas1p2e907080fb8c5fb239004bcc0a2bcd7e6
X-Msg-Generator: CA
X-RootMTR: 20250801103104eucas1p1dae57601c48faae879b154f11af8a4f1
X-EPHeader: CA
X-CMS-RootMailID: 20250801103104eucas1p1dae57601c48faae879b154f11af8a4f1
References: <CGME20250801103104eucas1p1dae57601c48faae879b154f11af8a4f1@eucas1p1.samsung.com>
	<20250801-apr_14_for_sending-v10-0-e85802902a29@samsung.com>
	<20250804-sociable-sceptical-snake-f5ac8d@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_004435_794508_95A05CB5 
X-CRM114-Status: GOOD (  15.64  )
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



On 8/4/25 08:13, Krzysztof Kozlowski wrote:
> On Fri, Aug 01, 2025 at 12:31:00PM +0200, Michal Wilczynski wrote:
>>
>> v10:
>>  - Squashed the two dt-binding patches back into a single commit.
>>  - Simplified the B-series GPU rule by removing the not clause.
>>  - Reverted the removal of the items definition from the top-level
>>    power-domain-names property, per maintainer feedback.
>>
> 
> You are using b4, so where are all the lore links for each previous
> version? b4 creates proper changelog, so why are you removing them?

Hi,
When I started this series, I was also just beginning to use b4 and
wasn't aware of that feature. I didn't think it was appropriate to
rework the changelog later, so I continued with the manual method. For
newer series, like the Rust support for PWM, I am doing it as you
suggested.

> 
>> v9:
> 
> Best regards,
> Krzysztof
> 
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
