Return-Path: <SRS0=diLN=LP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E23C4743C
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 11:46:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F0A46109E
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 11:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F0A46109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0EThyTcMFAxqzmOU5QmzqlGWv1kUf0kx34v6opw/tyA=; b=xPLhKGACOh7mum
	R/YHKFCz/2UaXuz2x6IlqxUjtpLYGCIcWDpRVDq2urxgunDtQ5V/Rx0T4BF619scr8WF6bXEjpCks
	VeZ+0K10iodzLsIlDTltxh5gP33cyI/p0M1Y2pZvOijJbHi7I+yzy+YQgFK6pRfPghWx3olgYmAOG
	IPLOiX3mfSg85nsXJdll1kD3DqWhLkTizIqDkgXrp1dYsKT4ZbIYMl7efcEzSZVYnIoia7hpQA8oJ
	Af6f6jp6tjo0wfSdzBuqUGfIzGiTaYdVLgiPxwwWLsVLUp4xYgdxG30ftkApvku4IHnTl+3hAwALW
	oK3mmUZ866Fsgg7+Xqbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvINF-003LkJ-0o; Mon, 21 Jun 2021 11:45:53 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvIMy-003Lhe-In
 for linux-riscv@lists.infradead.org; Mon, 21 Jun 2021 11:45:38 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-109-nWRBjBSGNeG6D-38leVvdw-1; Mon, 21 Jun 2021 12:45:29 +0100
X-MC-Unique: nWRBjBSGNeG6D-38leVvdw-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 21 Jun
 2021 12:45:29 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Mon, 21 Jun 2021 12:45:29 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Akira Tsukamoto' <akira.tsukamoto@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH 1/5] riscv: __asm_to/copy_from_user: delete existing code
Thread-Topic: [PATCH 1/5] riscv: __asm_to/copy_from_user: delete existing code
Thread-Index: AQHXZP+lIK7h/tQ6cE6o7pGE4+9AKKseW68w
Date: Mon, 21 Jun 2021 11:45:29 +0000
Message-ID: <fc86aa3f50a24a30891bf032aef591cf@AcuMS.aculab.com>
References: <5a5c07ac-8c11-79d3-46a3-a255d4148f76@gmail.com>
 <1b454390-cee5-a414-509b-3adb25ec0330@gmail.com>
In-Reply-To: <1b454390-cee5-a414-509b-3adb25ec0330@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_044536_928179_24C8EAA7 
X-CRM114-Status: UNSURE (   5.08  )
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

From: Akira Tsukamoto
> Sent: 19 June 2021 12:35
> 
> This is to make the diff easier to read, since the diff on
> assembler is horrible to read.

You can't do that, it breaks bisection.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
