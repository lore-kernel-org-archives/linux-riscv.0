Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F54C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 09:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=obKTzbNlR89NZ1fpF4T4tBTvzOrbqMKI2mfTHl+O1/0=; b=LcB4Rcj+AXjAUz
	IZ+O0M8bjOae3Vh6nUnBM1Ij38qytrijz9Y4RQXry6uR6vtgnecm+dY+m2rNIKwtrELf/fC7oWW/q
	wvoDOml+Pd+fU+hUnWC0d5t48NILu3FqIHDc9Eo8Zf66lIsDSdubOU5bZAqWl/RUS0INZS1N81evb
	x3u4SjOe2bsRZ8r9sd4QUUNt+QbIBpR5+SQNuwZf2iF2F7EQhwNe73Wi/0fsoq83doSwaRA67FEdf
	uRfYSrdwWvDOkRU4LHf9NwJV1V6MgLVh3By01ElK57KC5aS7nSDtU68BLthhaeZNd3IRyRXhuMLc4
	a77VdYFYNSO6uFYK8cAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGbO9-005NYI-1F;
	Fri, 22 Dec 2023 09:00:13 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGbO6-005NXT-21
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 09:00:12 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-33-OhDEaeKjMoSgrizogtDWdA-1; Fri, 22 Dec 2023 09:00:02 +0000
X-MC-Unique: OhDEaeKjMoSgrizogtDWdA-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 22 Dec
 2023 08:59:47 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 22 Dec 2023 08:59:47 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'guoren@kernel.org'" <guoren@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"alexghiti@rivosinc.com" <alexghiti@rivosinc.com>, "charlie@rivosinc.com"
	<charlie@rivosinc.com>, "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
	"david@redhat.com" <david@redhat.com>, "panqinglin2020@iscas.ac.cn"
	<panqinglin2020@iscas.ac.cn>, "rick.p.edgecombe@intel.com"
	<rick.p.edgecombe@intel.com>, "willy@infradead.org" <willy@infradead.org>,
	"bjorn@rivosinc.com" <bjorn@rivosinc.com>, "conor.dooley@microchip.com"
	<conor.dooley@microchip.com>, "cleger@rivosinc.com" <cleger@rivosinc.com>,
	"leobras@redhat.com" <leobras@redhat.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "Guo
 Ren" <guoren@linux.alibaba.com>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH V2 2/4] riscv: mm: Fixup compat arch_get_mmap_end
Thread-Topic: [PATCH V2 2/4] riscv: mm: Fixup compat arch_get_mmap_end
Thread-Index: AQHaNCUDLOr76Y7kz0WYFR/4SG7VuLC1ATgA
Date: Fri, 22 Dec 2023 08:59:47 +0000
Message-ID: <367b05acb90d4a6e898dd34e4254b697@AcuMS.aculab.com>
References: <20231221154702.2267684-1-guoren@kernel.org>
 <20231221154702.2267684-3-guoren@kernel.org>
In-Reply-To: <20231221154702.2267684-3-guoren@kernel.org>
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
X-CRM114-CacheID: sfid-20231222_010010_946205_CF89578E 
X-CRM114-Status: UNSURE (   5.87  )
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

From: guoren@kernel.org <guoren@kernel.org>
> Sent: 21 December 2023 15:47
> 
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> When the task is in COMPAT mode, the arch_get_mmap_end should be 2GB,
> not TASK_SIZE_64. The TASK_SIZE has contained is_compat_mode()
> detection, so change the definition of STACK_TOP_MAX to TASK_SIZE
> directly.

Why 2G ?

IIRC for 32-bit native x86 the limit is 3G, but in compat mode
it is (just under) 4G.

There is a special mmap option (for programs like wine) to
limit mmap() to 2G.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
