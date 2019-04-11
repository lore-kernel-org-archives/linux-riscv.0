Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C000C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 21:38:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 531792146F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 21:38:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WBFfUi/3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="G4DNFNZ9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 531792146F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rgLXbVEaAIA2EGYPE0XoJJXiQE2zZcYNqH//MXacfO4=; b=WBFfUi/3CEcC1q31OnQsqfr5Q
	EOdp4iWQV4DUMBDmxXc4bC6VtljzHhDAgF3ObGtjOENsbskg7tcs0SgsiVi1ZtQaiX6rvLu/EbUY8
	ktmnmm58cLJuaRGcNi+/GwqbKKaD25UfMYkJcbQLqL2uxzLO73tB1hcH2ubc41q5shceeMh/ATYF7
	EptORpAqab+7kKBwEIqcjTxKn/KRCQakh/GPYOX5vx9Hhb96OwwyGYC+hxE8zLAS5Iuhu+/jb4CDX
	xTUUKE8qc+ywwn6qSQA3RcpWyW6gJuyQbDbnbUR5YvVpp/MpUJUPcR+zqWkVw8iPYuR/i/7HPCWdy
	mwANmIspg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEhOc-0002Bt-2F; Thu, 11 Apr 2019 21:38:10 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEhOY-0002BR-Tg
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 21:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555018712; x=1586554712;
 h=from:subject:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=NtI2VCs09OfggKYynEKfYppzyRx311u5nZ4KBIOzIW8=;
 b=G4DNFNZ9as+hBSX68n8AC1UYF1y0plyDY0WmXiOahxwC77dWhDbTPnsr
 pfj9euwfc/Kufk9nW1s2pWLfl9L2meHtsR2kcMtceDMA9HI8h0NpNt2Bi
 O6+o/zmLvw8AEev8Lqf9nzG1nk4JAD0pvQNHK4SlvucYuAg+q5qge5tWp
 es2VfDfAIPuoqA8578mknCF8rqmngLZYt7FmmqNYjRwL20N2oa9TtsfCe
 V1zZAnedVvQEfOcQN4Ufy8ob/w+Lhu8ABZzKR+ZZqsFkteVx22u1oeGSZ
 2/a1icmgYEkMGxZtKgU7Rsw/bMi6P6lqYHUTI1OZZvA98C6ltyVg5l34O Q==;
X-IronPort-AV: E=Sophos;i="5.60,338,1549900800"; d="scan'208";a="204594021"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Apr 2019 05:38:29 +0800
IronPort-SDR: XsHyxc7YabgwJwNMJbkyKnNkMfZU0ByaYqnSfYiZBqtQ7ig5DbeFYDRmQJGJWhqO+AXlqV2ch7
 01ZsF1PuStXjqVdoGw3yTp8yliVIqiYVra/K+LfgIVNsfhInb5kmVuXjibSeyqlXtzamsGCx+R
 yImbKzWdygQRfp3reH/Hy3LgTsK7Sz/g25SZiVtTw/7DhoQf+R2h50yjkhWmeDxBbpK/E1UxXA
 1MYEiaUkyZI8mEKbeKKGBS2BYPjp9642GeGt9myVtOeZjUzra1X5IKc/uOIletdF1gSvi4qyfi
 Ix6m2zk0a7feqF0Xj5e2czn6
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 11 Apr 2019 14:17:05 -0700
IronPort-SDR: oFMBs+ixy3Mxisl+X4Lv2ip0TCwJpkuq8TKEsIcw9gml3/WDhk/75Kf3oMq4vG8YFukkBtsmwj
 sye+UQCyG6Xjv62LzqAplZnWWkmD7zI0+EUhgDyJalpQyyBShs/foVV6S2zFWDLawDJkFWj1jR
 0Ylz2OBO4eu2va+BT8lnAbglWAwqpL7KxGgWJqXlnZWVY7phcyMLL8lhO2x1VtXVwn13FiZdOl
 Xl5rXsw4VE1uk4zoe0oPkb8zh2Bb/5BLhAOusJpFKuf9COGOlQA+iFvKbpiv2DkgrCAm6SxFxS
 egg=
Received: from usa001883.ad.shared (HELO [10.86.51.17]) ([10.86.51.17])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 Apr 2019 14:38:03 -0700
From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 1/6] arch: riscv: add support for building DTB files from
 DT source data
To: Christoph Hellwig <hch@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <20190411084304.5072-2-paul.walmsley@sifive.com>
 <20190411114616.GA10032@infradead.org>
Message-ID: <b1f10ff7-6c45-1468-c97c-ff301bb66966@wdc.com>
Date: Thu, 11 Apr 2019 14:38:02 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411114616.GA10032@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_143806_995749_87A1B8A2 
X-CRM114-Status: GOOD (  13.49  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/11/19 4:46 AM, Christoph Hellwig wrote:
> On Thu, Apr 11, 2019 at 01:42:59AM -0700, Paul Walmsley wrote:
>> Similar to ARM64, add support for building DTB files from DT source
>> data for RISC-V boards.
>>
>> This patch starts with the infrastructure needed for SiFive boards.
>> Boards from other vendors would add support here in a similar form.
> 
> What do we build it for?  We'd really need something like this:
> 
> http://git.infradead.org/users/hch/misc.git/commitdiff/d6242aa147baf57e05e2932199c74d8d24b9926e
> http://git.infradead.org/users/hch/misc.git/commitdiff/0cd5413c8094ab57b68e0629dacfed695f4c1ef1
> 
> To actually use the DT files.
> 

We also need to modify the DT, as the default DTS file in this patch 
series has hart0 status as "okay",

Or we should set hart0 status as "masked" in the .dts file now.

Regards,
Atish
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
