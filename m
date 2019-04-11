Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31DE9C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 18:53:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 025552083E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 18:53:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iHMbMk1E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="TJhIfxuj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 025552083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oxLN5+lOIknmcjDCskJL7jyKZE8mgGyYnG6UwLBPnKs=; b=iHMbMk1EfQZ3+Z5MFaXe6naG4
	qqRtNNUHLpHn3CXTJ4r+iiM4c509ZFbQvQDkUWtlglRANBi+GfLeN/gOwYRHMcn5wuDfv7iwtR+Rn
	XylcAff9wzbqJzq1AaNZ237jjPASol94VjhVFeSiscM2euO16fsqU4wLwpkFaJ7dnyG2x1WemHIhI
	UWCyRVHqalSCqyEjBsp4y5Qg5oOnRB6XGEJvAAs1rPxd2j6NlIOrOM8qf+O47F7tbEIfcF7+KfN7z
	G/aiTnxrTryp/WQpFXysi0xP+17/PpLtcov9iNDXL8U/HX6SHppbLRJaJP0R9j4UAYzRSdSRH2NFn
	/oey8YC9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEeom-0006Lq-SY; Thu, 11 Apr 2019 18:53:00 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEeok-0006LM-M8
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 18:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555008779; x=1586544779;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=M2uYZJicHWyYCoU1OYOyUbXgouHMW8NV4QpgQcpq7Bk=;
 b=TJhIfxuj7uQNdbZID8ZQ8VCiiOu6s4oBK7vdZnhjFuUiF+yD6Teg9D58
 HROWRCzAGEE/kA0nwjSSRgj0ryoHswD99nz4conkh3pzg3yJ4VqyeahME
 mLD0EJNYrWbhWRd10U20Fu1HKfTqMPjzYtb2LElatJ50xiopOMTljUaGD
 NQm5bWfJ+3XGH3LllKSohljVgV6zlzIsH9y/1OEs7xEeVZ4RgSz/RDWs/
 DoIYypnoz/xquICPVEfPDTH7nMnkc9yoVMzUxc+8R0lfAeRR/caSMAZeJ
 eMRDiNtJAduD/gxQS8TIl48Pjn+nyAgEq6bvvEEwoK3AlqP8LTQX4TUG2 Q==;
X-IronPort-AV: E=Sophos;i="5.60,338,1549900800"; d="scan'208";a="110650834"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Apr 2019 02:52:57 +0800
IronPort-SDR: VNdbFrTeAUMEoEuDjuSHIguvF22RPUJVCMdMn76NSS2mQZZ1q7sYK/W1Hf2GjKNnYt4qY3/EO2
 BE7arcLiiotm7ZuvANPhLW63paHjAnbry1x0/I5AT2UjoB2S4aOdGJpFp0740ZX8hWYOvY47wH
 /U78oOoFvXwBV3AyJQDGC9M3erJzQ4Geo0ysUnIVNQHEmcWKePuXXMtwG+Xa/mNLhJ5hHSpuJw
 jW+5jYu53Qw/Z7LcBKupfH8D+Ad5nEVzT7NHAKIQzijDcRwyKhD0gOu/ITwvhf4TEyd6NX9pNn
 T+Yco7gKEkv41FCLJfc6b7xA
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 11 Apr 2019 11:31:57 -0700
IronPort-SDR: DW1MR7gDtegOiGsld08l9mrbzDlNwfq+DSqvudP4C3JTMza352LSqA8KxyiaWU6psoT95BqHdW
 pw9QeWhhGvm/rtHMM1rMz7snAO5y9t5jvs5MjpZIDuDFn1EpEFykLUIU7qyjMGhLThMEMuMGtg
 KwjTW+KYthTN2W7NhVczt9YvaZIBLiBAQjjUrYtLjqJCOgbLDSRD/K3fKSKrtSjpNd1BJ1YJxx
 XTJh8JBCjP1nxkax/ZE/hO/ma4g7P1nvq1btYRaI/wmPncXYm3/lbnVxJzk44HmN4z1AfQjcVF
 XQY=
Received: from r6220.sdcorp.global.sandisk.com (HELO [192.168.1.6])
 ([10.196.157.143])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 Apr 2019 11:52:57 -0700
Subject: Re: [PATCH 6/9] riscv: also clear all pending interrupts when booting
To: Christoph Hellwig <hch@lst.de>, Palmer Dabbelt <palmer@sifive.com>
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-7-hch@lst.de>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <c0ec1014-e2fb-0524-d60c-5baa29566750@wdc.com>
Date: Thu, 11 Apr 2019 11:52:55 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411115623.5749-7-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_115258_837611_6BBC25A5 
X-CRM114-Status: GOOD (  14.98  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/11/19 4:57 AM, Christoph Hellwig wrote:
> Just in case an old interrupt is pending make sure we clear everything
> asserted before this kernel started.  Based on similar M-mode code in
> opensbi.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   arch/riscv/kernel/head.S | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 9344d9ceda24..62d2c9c85433 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -22,8 +22,9 @@
>   
>   __INIT
>   ENTRY(_start)
> -	/* Mask all interrupts */
> +	/* Mask and clear all interrupts */
>   	csrw sie, zero
> +	csrw sip, zero
>   
>   	/* Load the global pointer */
>   .option push
> 

Reviewed-by: Atish Patra <atish.patra@wdc.com>

Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
