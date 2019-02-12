Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71106C282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 08:47:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4103421773
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 08:47:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AkoHEnem";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="oLO9yXAa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4103421773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gosDfd8vUlHxC2niklO5+xBXVCUOYhkRaQn7emFG3/o=; b=AkoHEnemwtcp5nn8D/IDxdYrg
	2/AghjcEDABSccqktJTm+nNuNy39pLHESlrJSCBwgoB4Y/rCTKjZYs6WSU5HIB0Gn79sguTBIzJJL
	GA4lluD5igr6ucXFDUKulT1v9VZYaM5xctkBDkUNz20jHFeSmXVP5i5PxIBos8A05b0ZIv5zPSUAI
	gi+IvB0DRYtaXZX81V6j35CHfKqaY2VNBeOzs/Fpbyn3Ud+sAwclvDCMXGPH9YKZob2NZA/Fn/ID8
	6dzCJbk9jDum+Y5CGtUyXkxRzVfs/74RC5jUyW4Mw7K/E2ZeS05Doq4ZiKSMaByvJri4B2X/RxJ0+
	bymwVJTag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtTin-0003Dv-5V; Tue, 12 Feb 2019 08:47:17 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtTij-0003D4-PP
 for linux-riscv@lists.infradead.org; Tue, 12 Feb 2019 08:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549961234; x=1581497234;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ENil7zF+PPj1b6qFv3BM0qe4X7ih7B4qbmKtHMoybvA=;
 b=oLO9yXAaJERpDN8t6sgFaiSgf/vXV2yEVDTsf6gUSARR4KbsaKEOOnN6
 0In1rRlh04dWBnsyYObIwabdV9Nt7q44pWtbIhbc+pFaZfGhECKJGkVDL
 uYaVyfukL+5tTduTVfwBleepaq8pgv5Pjl3ERG5uzW1PYFHBSYPvrkG6I
 Rh8gnvRhXTpwe224UCZ5yCCnJhjpfeou/4C73Z+0Nz+m0OxYY3Egyient
 NBkpzoj172GQorvArVr0rdmBA+ruZ/LUE+WmEtQSnT698J5rIxNfUVMVZ
 6jCtstT8YovaBfeudc8IITSsEJu2djlixeab5rr4j5zbkowSui1bnxKzW w==;
X-IronPort-AV: E=Sophos;i="5.58,361,1544457600"; d="scan'208";a="106004013"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2019 16:47:11 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 12 Feb 2019 00:25:46 -0800
Received: from ds141g2.ad.shared (HELO [10.86.48.95]) ([10.86.48.95])
 by uls-op-cesaip02.wdc.com with ESMTP; 12 Feb 2019 00:47:10 -0800
Subject: Re: [PATCH 5/5] riscv: use for_each_of_cpu_node iterator
To: Johan Hovold <johan@kernel.org>, Christoph Hellwig <hch@infradead.org>
References: <20190118140308.9599-1-johan@kernel.org>
 <20190118140308.9599-6-johan@kernel.org>
 <20190212071339.GL26747@infradead.org> <20190212082621.GA26912@localhost>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <6518a7ff-0586-be7a-4a43-6c9a35194a05@wdc.com>
Date: Tue, 12 Feb 2019 00:47:09 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190212082621.GA26912@localhost>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_004713_942569_25A0B678 
X-CRM114-Status: GOOD (  15.82  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Anup Patel <anup@brainfault.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/12/19 12:26 AM, Johan Hovold wrote:
> On Mon, Feb 11, 2019 at 11:13:39PM -0800, Christoph Hellwig wrote:
>> On Fri, Jan 18, 2019 at 03:03:08PM +0100, Johan Hovold wrote:
>>> Use the new for_each_of_cpu_node() helper to iterate over cpu nodes
>>> instead of open coding. Note that this will allow matching also on the
>>> node name instead of the (for FDT) deprecated device_type property.
>>>
>>> Signed-off-by: Johan Hovold <johan@kernel.org>
>>
>> I think this is going to conflict with the ELF caps changes from
>> Atish.  Maybe the riscv_fill_hwcap hunk should be included in his
>> patch?
> 
> Since that patch had some issues (e.g. the node reference underflow) it
> may be better to rebase it on top of this series. The changes are
> otherwise distinct after all.
> 

I have fixed the node reference underflow issue and made some more 
changes based on comments.

Some other patches(1,3,4,5) in this series may conflict with my series 
as well. I can rebase my series on top of yours and send it as one 
series if that's okay with you and Palmer.

Regards,
Atish
>> Otherwise looks good:
>>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> Thanks for reviewing!
> 
> Johan
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
