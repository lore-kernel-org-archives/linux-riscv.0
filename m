Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD095C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 18:14:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEC842084D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 18:14:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="InoU+jvB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Eb99j8MX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEC842084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B1bv1fZVLDvf7+eJBi1FgCHmfhHTnCJgxxsoEOUb50w=; b=InoU+jvBwBJTAh8if/BFsUrk5
	7RUaaBQ6LLcM/1BHEzeKSXQn6gErxEvRyyWa93U4WGakpcPVUrxuT/aUpEHcKeGrKlonv+Vysuj76
	y7vdQh7r+xLZJ+1UyZMC5cZjljEnFnsvL6a7Elh+2/NBWAplaGksf7lF0khCHJiYsDR/N0eXBBjuW
	TewYbwgursj+Fkb0GGOnLLFUGcy+2KeBJRNimXTvpO75NI77/nsw5Q0WskHYipEqPkmODsjrM1lvl
	92Pfq5oyMhnlmIT0pTKR4SFXjG1q4gWIRoR9U1I6ZVj+yZHAMnQxeskdoi0KPymfJzUWl8kjprDnm
	LNopVzKXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEeDG-0008EP-FC; Thu, 11 Apr 2019 18:14:14 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEeDE-0008E6-Au
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 18:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555006452; x=1586542452;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=TA1nweJzazRcI8nGG0xaae8sgqSHrilFQeoJtWiH2Y8=;
 b=Eb99j8MX6cCxXJVP6rH4O0QZJfbwUEyc6KAqziJ4KDchfpEy7sGm6B3t
 scRyVwMIG/5av6NCpS25WaCYiosZjl/FnKPeAHLxuZoMAjv2EgrmfQ6I9
 ofMqIC4gef+/fEeSHAIoAXklV7gP4LLyp2rkfcwD1b91qHjA3XkofETZB
 fDJMgGlTf3OF9MzhkmsEPeeRwkEAZ+7YhwqlgS2yv/GWoSwIV0OiV8w0M
 V9xh+TmQZsyGr5uvCgUv2Mg9vfdhuekvA3qqK1HuuPgxZaeOLOqEhXIur
 oO2O2roMLW5edSw1Sb3M0KqXt+5TCW+gFOGLKXuIEjyoOQxbZ81eRSUFM g==;
X-IronPort-AV: E=Sophos;i="5.60,338,1549900800"; d="scan'208";a="106943939"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Apr 2019 02:14:10 +0800
IronPort-SDR: 9L9sHmGRyIRZtS32hEFyjjhT2mK8d0eDpKCC5rVv7hEFUSt7Hncc+hT+ktHthAaTByCEFRkw2h
 DEw4qaApKS73thJqg73bJC7wpo+tmP8tcWjleBSkBVoE44MWhqQpzBiG71abv6fRvW3GA61PzZ
 ZtZ1mIKVFERCRXy5P8pTv0eshh9VgMUgaVz5URa8Jb/hMSBCYJqFDBKzhT53ys+D8sX4Z8VVYa
 ps9+AnwJdJKy+ObLpoFtJPoWoWzckLAkRygfTCnrpQa+RvZ5RdWwipY7QbxDhC9jHcaW6o/E6+
 do1DQ41teubD40hldwOIy9r1
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 11 Apr 2019 10:53:11 -0700
IronPort-SDR: ElvWdcaZMzVpcsef1OmngfWr+osjSLfdQXNLcrk/lNFkajTJlJZd9dBiZfXJkXZGHKYkAVSABB
 3LrXyxlWwgw9YtCu7ox59/ZX0UKof7p/fxMhFG4nipAy6B9o1KZlR2FJh2+zKNJpvhpLcc6vhH
 kUZEYx5bw4p54PBMkwmLGIvLEOzQe+2BiYaOU2UaaT7Ly5hQMulH0F/FiSV5YoRAE0B977Ijse
 I1qsLZIf5xMfwldJONebJi86MKM/W2gR7Syqf6BRVVNW32yi3ybGr7f9+vS34/8RJ3rM7XRPd7
 19Y=
Received: from r6220.sdcorp.global.sandisk.com (HELO [192.168.1.6])
 ([10.196.157.143])
 by uls-op-cesaip02.wdc.com with ESMTP; 11 Apr 2019 11:14:10 -0700
Subject: Re: [PATCH v2 2/4] RISC-V: Fix of_get_cpu_node usage
To: Christoph Hellwig <hch@infradead.org>
References: <20190410230443.15729-1-atish.patra@wdc.com>
 <20190410230443.15729-3-atish.patra@wdc.com>
 <20190411065904.GC29422@infradead.org>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <2c078b17-625b-b3d0-7914-9cb2d05580e2@wdc.com>
Date: Thu, 11 Apr 2019 11:14:09 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411065904.GC29422@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_111412_501865_CBC79DB4 
X-CRM114-Status: GOOD (  11.63  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Andreas Schwab <schwab@suse.de>, Palmer Dabbelt <palmer@sifive.com>,
 Johan Hovold <johan@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/10/19 11:59 PM, Christoph Hellwig wrote:
> On Wed, Apr 10, 2019 at 04:04:41PM -0700, Atish Patra wrote:
>> of_get_cpu_node expects a logical cpu id not a hartid.
> 
> But only because you changed that with your patch 1, so it should
> be folded into that.
> 

Yes. I should merge this to patch 1. Otherwise, git bisect will have 
issues later with patch 1.

Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
