Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61780C32771
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Sep 2022 15:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jktQM1OBx6bjOvaK7ZqKACsFWjjfyJStaPG6xWT4/5w=; b=ZwoK1ExmG7Gjza
	1Vi0+CJYMf74+1oaaXHiObsAnabcT3iBqnfCKVptgwi5aTx89z++Nxeyfy6lQyv6QvY04MOiuwgSY
	5V3PA4I3N51l4v3OVo9rqkJg4Xmy9IzHMcDlFnP1+96CvB5p6ong1LUtGF/O8UIaHCGP+R2BaBYfR
	mOcLLxfv0mIXgG5SBpx5OUQl3tJZ7TKAYIQ53TRiVuB92nYje2oOLNUd4215H/OSUdSrNQNTWlPOX
	Hpnp+GQy04ZN2nkgPaNq5t0lddceFO65ZA58T4DpPR+Zc2tUs2LR0c4n3XyV98MuYNFFQWilC8rsK
	bUc6zqe0+lKXi1X/iIQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odYdR-00Gn4w-DY; Wed, 28 Sep 2022 15:06:05 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odWja-00GPjR-BL
	for linux-riscv@lists.infradead.org; Wed, 28 Sep 2022 13:04:19 +0000
Received: from fraeml745-chm.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4McxXC3LFtz6HJRn;
	Wed, 28 Sep 2022 21:04:11 +0800 (CST)
Received: from lhrpeml500002.china.huawei.com (7.191.160.78) by
 fraeml745-chm.china.huawei.com (10.206.15.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 15:04:16 +0200
Received: from fraeml704-chm.china.huawei.com (10.206.15.53) by
 lhrpeml500002.china.huawei.com (7.191.160.78) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 14:04:15 +0100
Received: from fraeml704-chm.china.huawei.com ([10.206.112.182]) by
 fraeml704-chm.china.huawei.com ([10.206.112.182]) with mapi id
 15.01.2375.031; Wed, 28 Sep 2022 15:04:15 +0200
From: Dmitry Kasatkin <dmitry.kasatkin@huawei.com>
To: "cl-cheri-discuss@lists.cam.ac.uk" <cl-cheri-discuss@lists.cam.ac.uk>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"cl-cheribsd-discuss@lists.cam.ac.uk" <cl-cheribsd-discuss@lists.cam.ac.uk>
CC: Wang Kui <wang.kui1@huawei.com>, Jan Erik Ekberg
	<jan.erik.ekberg@huawei.com>, "Horsch, Julian"
	<julian.horsch@aisec.fraunhofer.de>, "Auer, Lukas"
	<lukas.auer@aisec.fraunhofer.de>, "Ahlrichs, Vincent"
	<vincent.ahlrichs@aisec.fraunhofer.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RISC-V CHERI port
Thread-Topic: RISC-V CHERI port
Thread-Index: AQHY0xj5issePbSyp0Kh6CV3gQk2w630zNYC
Date: Wed, 28 Sep 2022 13:04:15 +0000
Message-ID: <954c082ac0db4384828ef5baca519bb2@huawei.com>
References: <1c0ba05578f1487980b071da1377fb3f@huawei.com>
In-Reply-To: <1c0ba05578f1487980b071da1377fb3f@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.122.225.45]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_060418_556001_B10CB3D0 
X-CRM114-Status: UNSURE (   3.49  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 28 Sep 2022 08:05:51 -0700
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

I would like to inform here that our work on CHERI support for Linux on RISC-V has been open sourced on GitHub:

https://github.com/cheri-linux

Information about CHERI can be found here:
https://www.cl.cam.ac.uk/research/security/ctsrd/cheri

The work has been done by Huawei and Fraunhofer with the great support from Cambridge University.

BR,
Dmitry

PS. sorry for first email. I press "ctrl-enter" by mistate :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
