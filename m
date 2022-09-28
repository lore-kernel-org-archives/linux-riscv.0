Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7F8C32771
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Sep 2022 13:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J9GXH+o0chAvQt+psbdShu44cQvfJV4NQsf2ypKPqpY=; b=qPSByhBPCz7COR
	wVUKBM9MnM7gKxzrJ+5O2kq+0MPhsGe8z/hthzlRewgkKA4pOnqKeLtWpRY8S8oaN8iU6tkWO+uyr
	9cH8bsA2a9fbLWGM/kav3ChH0mwmuByn46gcladvhuhC0MVqaznjTHR93I6gQqlKPdDncZrvol76D
	sdekVX1/31K2oz/QgtFmeBe30WMKMrPj56Tn83100jxkjXPJtb+j9ROheK1uxRf/YL55Xqzqq/Sky
	VQxuvz7Moa2GIG2sNb/UxLPt3CSF7xc8NQ8RtwDTQEaZqME+cv0qllaMNr2vah5cCfHRv72lKq0ua
	weNu+yGP8UFp0OgKnckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odX2E-00GT3w-Gq; Wed, 28 Sep 2022 13:23:34 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odX2A-00GT27-KL
	for linux-riscv@lists.infradead.org; Wed, 28 Sep 2022 13:23:32 +0000
Received: from fraeml704-chm.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Mcxvz0lVMz67yqK;
	Wed, 28 Sep 2022 21:21:19 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml704-chm.china.huawei.com (10.206.15.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.31; Wed, 28 Sep 2022 15:23:25 +0200
Received: from fraeml704-chm.china.huawei.com (10.206.15.53) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 14:23:24 +0100
Received: from fraeml704-chm.china.huawei.com ([10.206.112.182]) by
 fraeml704-chm.china.huawei.com ([10.206.112.182]) with mapi id
 15.01.2375.031; Wed, 28 Sep 2022 15:23:24 +0200
From: Dmitry Kasatkin <dmitry.kasatkin@huawei.com>
To: "cl-cheribsd-discuss@lists.cam.ac.uk"
	<cl-cheribsd-discuss@lists.cam.ac.uk>, "cl-cheri-discuss@lists.cam.ac.uk"
	<cl-cheri-discuss@lists.cam.ac.uk>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
CC: Wang Kui <wang.kui1@huawei.com>, Jan Erik Ekberg
	<jan.erik.ekberg@huawei.com>, "Horsch, Julian"
	<julian.horsch@aisec.fraunhofer.de>, "Ahlrichs, Vincent"
	<vincent.ahlrichs@aisec.fraunhofer.de>, "Auer, Lukas"
	<lukas.auer@aisec.fraunhofer.de>
Subject: Linux support for RISC-V CHERI
Thread-Topic: Linux support for RISC-V CHERI
Thread-Index: AQHY0zzzcG4OFWFxQUCCNWe8ch6m/A==
Date: Wed, 28 Sep 2022 13:23:24 +0000
Message-ID: <5c3e670c2bde4ae5beb04d4fd3010756@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.122.225.45]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_062330_828182_50D9A52E 
X-CRM114-Status: UNSURE (   6.05  )
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

Hi,

I would like to inform that our work on Linux support for RISC-V CHERI has been open sourced on GitHub:

https://github.com/cheri-linux

CHERI is an experimental ISA exention providing architectural capabilities for different ISAs including RISC-V and ARM.
CHERI is not available in mainstream CPUs and available on certain experimental cores for FPGAs.

Information about CHERI can be found here:
https://www.cl.cam.ac.uk/research/security/ctsrd/cheri

This work dedicated to RISC-V and has been done by Huawei and Fraunhofer with the great support from Cambridge University.

BR,
Dmitry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
