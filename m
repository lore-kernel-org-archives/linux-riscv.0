Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD09EC2BD09
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 01:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vqVc6OgidJbz+wtRcct6liy57/Z0F3RT7KvPhwL9bJ0=; b=WO7DjxydAW2wdV
	9t+mIWGhLE0GPBoiQnKmu4vtqVEIxPDaJScJxDRs/KVUbHzH3bk50kHN8v8xAk35Xy0l80TsGV5v8
	4yyGyeDiSnFfI5CG/T+pYWNNgWsBH6FRJZAipvyIBsQQFuFtkaKSs4CXOiLxEr8AmnC1JSEqajaCE
	ITGoDu71Uknes+fF/G0rRs1kzdSq39kD3vMel3cUXOTteR7BYnM/BOcBBKJIcNm5sxwm6NXPyD+wH
	6dsbOsxpNft9rRMLyz+UdRDzdg5rcKvw9Gesx0J41Lh8IlwmQNZN8OOXQbPnA3GZBWFQVthY4i7cJ
	Upnxxaem9RYfTtAY8AzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPBjZ-0000000Btej-3O7E;
	Thu, 04 Jul 2024 01:58:05 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPBjW-0000000Btdw-2OfV
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 01:58:04 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WF06x1n8lz2CkwM;
	Thu,  4 Jul 2024 09:53:45 +0800 (CST)
Received: from kwepemd200012.china.huawei.com (unknown [7.221.188.145])
	by mail.maildlp.com (Postfix) with ESMTPS id 0BF8514010C;
	Thu,  4 Jul 2024 09:57:52 +0800 (CST)
Received: from kwepemd100011.china.huawei.com (7.221.188.204) by
 kwepemd200012.china.huawei.com (7.221.188.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 4 Jul 2024 09:57:51 +0800
Received: from kwepemd100011.china.huawei.com ([7.221.188.204]) by
 kwepemd100011.china.huawei.com ([7.221.188.204]) with mapi id 15.02.1258.034;
 Thu, 4 Jul 2024 09:57:51 +0800
From: duchangbin <changbin.du@huawei.com>
To: duchangbin <changbin.du@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: vdso: do not strip debugging info for vdso.so.dbg
Thread-Topic: [PATCH] riscv: vdso: do not strip debugging info for vdso.so.dbg
Thread-Index: AQHau7U7yIu3oUXsbUGaQgARcdrle7Hl86SA
Date: Thu, 4 Jul 2024 01:57:51 +0000
Message-ID: <ef2b1430475140c88a929b1678338726@huawei.com>
References: <20240611040947.3024710-1-changbin.du@huawei.com>
In-Reply-To: <20240611040947.3024710-1-changbin.du@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: kwepemd100011.china.huawei.com (15.02.1258.034)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [10.110.54.75]
Content-ID: <C5A0E03790833640B3CA9AEEE9FF2CC6@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_185802_790608_70AFA255 
X-CRM114-Status: GOOD (  13.58  )
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

Hello,
Is there any problem with this change? Ping~

On Tue, Jun 11, 2024 at 12:09:47PM +0800, Changbin Du wrote:
> The vdso.so.dbg is a debug version of vdso and could be used for debugging
> purpose. For example, perf-annotate requires debugging info to show source
> lines. So let's keep its debugging info.
> 
> Signed-off-by: Changbin Du <changbin.du@huawei.com>
> ---
>  arch/riscv/kernel/vdso/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index f7ef8ad9b550..960feb1526ca 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -45,7 +45,7 @@ $(obj)/vdso.o: $(obj)/vdso.so
>  # link rule for the .so file, .lds has to be first
>  $(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) FORCE
>  	$(call if_changed,vdsold)
> -LDFLAGS_vdso.so.dbg = -shared -S -soname=linux-vdso.so.1 \
> +LDFLAGS_vdso.so.dbg = -shared -soname=linux-vdso.so.1 \
>  	--build-id=sha1 --hash-style=both --eh-frame-hdr
>  
>  # strip rule for the .so file
> -- 
> 2.34.1
> 

-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
