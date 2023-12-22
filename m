Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F8EC46CD8
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 11:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=or0vnn+jQ3kVLp9WAagdfTbC0pnUbPFjGoubQK8ucmk=; b=MQAqWX/9tIfxWC
	cfp4Pb9IZhjuFFpHcMh5CJBopFvsLynn4tHZh1iKNVCl3FAbCdVpE26NwBI0ejIRq3WPr1vThr24U
	XelaABgzi+p8B21lH0hdKZ+RXag27SHetpRgrUBwWG7zJZZAkM+dqKtBx2DtaNDc32W0wueGpdOc5
	s+C3XiF7mITZLvsfdUox8GKlqe+SDwZgkGooPr22A1F6jjy5p3Zukbty65u9S60zSnxfjJh63PXOP
	kw6aXTTfo9HSueNnrUQi4957oUg23HqkmDZjOWDoVjcSrP0DnEzLFiD3WdonPLiVMLhnEWxIVwo8e
	8WiGlC0vNE3tFWokRJpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGe5N-005rqV-1E;
	Fri, 22 Dec 2023 11:53:01 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGe5K-005rnt-16
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 11:52:59 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-101-xeT26KtROmq9ThAudnAjmA-1; Fri, 22 Dec 2023 11:52:54 +0000
X-MC-Unique: xeT26KtROmq9ThAudnAjmA-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 22 Dec
 2023 11:52:39 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 22 Dec 2023 11:52:39 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Guo Ren' <guoren@kernel.org>, Leonardo Bras <leobras@redhat.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "alexghiti@rivosinc.com" <alexghiti@rivosinc.com>,
	"charlie@rivosinc.com" <charlie@rivosinc.com>, "xiao.w.wang@intel.com"
	<xiao.w.wang@intel.com>, "david@redhat.com" <david@redhat.com>,
	"panqinglin2020@iscas.ac.cn" <panqinglin2020@iscas.ac.cn>,
	"rick.p.edgecombe@intel.com" <rick.p.edgecombe@intel.com>,
	"willy@infradead.org" <willy@infradead.org>, "bjorn@rivosinc.com"
	<bjorn@rivosinc.com>, "conor.dooley@microchip.com"
	<conor.dooley@microchip.com>, "cleger@rivosinc.com" <cleger@rivosinc.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Guo Ren
	<guoren@linux.alibaba.com>
Subject: RE: [PATCH V2 4/4] riscv: mm: Optimize TASK_SIZE definition
Thread-Topic: [PATCH V2 4/4] riscv: mm: Optimize TASK_SIZE definition
Thread-Index: AQHaNMmXQnV6P1CryUOzF1IfQQ8rsbC1Lv+w
Date: Fri, 22 Dec 2023 11:52:39 +0000
Message-ID: <e3f1521a9f04463587d07d0c99534d5a@AcuMS.aculab.com>
References: <20231221154702.2267684-1-guoren@kernel.org>
 <20231221154702.2267684-5-guoren@kernel.org> <ZYUZ8QUJxCL93Fgv@LeoBras>
 <CAJF2gTTX7AjexoRUw=ZS34HEWno7H3zvnXA+Q7TYsztNU=k2cg@mail.gmail.com>
In-Reply-To: <CAJF2gTTX7AjexoRUw=ZS34HEWno7H3zvnXA+Q7TYsztNU=k2cg@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_035258_647678_1FD5CF36 
X-CRM114-Status: UNSURE (   6.68  )
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

From: Guo Ren
> Sent: 22 December 2023 11:25
...
> > > +#define TASK_SIZE    (is_compat_task() ? \
> > >                        TASK_SIZE_32 : TASK_SIZE_64)
> I would remove is_compat_task() in the next version because your patch
> contains that.

Does TASK_SIZE get used in access_ok() ?
If so the repeated expansion of that 'mess' will slow things down.

OTOH access_ok(ptr, len) can just check (ptr | (ptr + len)) < 0)
and rely on the page faults for everything else.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
