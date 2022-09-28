Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734B6C04A95
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Sep 2022 12:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LQEdBnozex+OXrGzG/o60Ihd4A0nTG3fysjQOMrJF5A=; b=0Bi7rgaldAg4Zy
	saSOTTJXEdRIGE5wEnctw+WYXcPmCKDMSOBdAagA1uS6/jR5MMYsQa0vY55gDu1VtqH54iMJBTL+U
	xSnCr/6jSnf63uCitYlXmwX7QNWacWwAuUukdjtnBrrOuv40q3kXxZ5Mrg3OEaPunR8deuLskzHGP
	0S3iavV9sCgXlty7Otk5316XjAzqKkAFlP83h/y+MjbIGXHlrprH+abR9yZB1FUJ/8476q8cl0neq
	F92R987CTPOlF4qcrw1Yu95XQ1L3k/k86MwvJN3BNnHwJT5hEaWNb/wJnFjXD8Rj+fWnX15uMM8I4
	uvr6wTHWLn7J0oeruwww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odWaX-00GNlN-1g; Wed, 28 Sep 2022 12:54:57 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odWaU-00GNhp-0w
	for linux-riscv@lists.infradead.org; Wed, 28 Sep 2022 12:54:56 +0000
Received: from fraeml710-chm.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4McxGq6XJ4z684cK;
	Wed, 28 Sep 2022 20:52:35 +0800 (CST)
Received: from lhrpeml500006.china.huawei.com (7.191.161.198) by
 fraeml710-chm.china.huawei.com (10.206.15.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 14:54:42 +0200
Received: from fraeml704-chm.china.huawei.com (10.206.15.53) by
 lhrpeml500006.china.huawei.com (7.191.161.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 13:54:41 +0100
Received: from fraeml704-chm.china.huawei.com ([10.206.112.182]) by
 fraeml704-chm.china.huawei.com ([10.206.112.182]) with mapi id
 15.01.2375.031; Wed, 28 Sep 2022 14:54:41 +0200
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
Thread-Index: AQHY0xj5issePbSyp0Kh6CV3gQk2ww==
Date: Wed, 28 Sep 2022 12:54:40 +0000
Message-ID: <1c0ba05578f1487980b071da1377fb3f@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.122.225.45]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_055454_247062_35A8D5E1 
X-CRM114-Status: UNSURE (   1.41  )
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

I would like to inform here that our Cheri Linux for RISC-V work has been open sourced.


BR,
Dmitry


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
