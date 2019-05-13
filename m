Return-Path: <SRS0=1KMB=TN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DF1C04AA7
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 13 May 2019 23:19:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDFC8208C3
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 13 May 2019 23:19:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K/oQN6bh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="GtLgL2n+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDFC8208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k+W/arbkDxX00iWlfqF/TWW1llkJjBPHqVKV5n+wVrk=; b=K/oQN6bhLPtKFOyWzgMHQGUDp
	CdsvIkwokEx1GJcAdc9MX80jjn2doAbFESnitGosXgQBqIDk15cLnhaNCwcBC4H9syTz3Kk9MeOIz
	LbsUX1TnKv8g5oI5gSbdfT+iSEiesbZXmZtnRWX7kQ4ktFuxBwUPvlVNVCgHvISxGAi8I18wthfKG
	lDj8Wee26QeTp2Tdee4lyqJTaSMD2wgyEidvOJHjfz8d+ErCQXhBh5Xyt3LTMjvM74bQUnvAbyEDM
	GcwqJTfN/c8WWJGauxzg563vjGbBTV4g3Zx+UcpF0TVXgXhgBupwurlgcJB3cQSJpyWGV4Q0c+4VC
	69WABlQCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQKE1-0002DI-O8; Mon, 13 May 2019 23:19:17 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQKDz-0002Ct-8c
 for linux-riscv@lists.infradead.org; Mon, 13 May 2019 23:19:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1557789555; x=1589325555;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=j9JSv3iEB6Xovwkc3ROUtt6XNLJIN55oc6Y7C+ZA8SU=;
 b=GtLgL2n+5g2HLZuko0nIK2xNQyDf1uEOKmzKt3+8ZNAnBwSl0Beft8o6
 +CvMRHBEWEBCJBGRFShUo+jdDfJdz7760dPXhu65wRmQbJma/a2xfVL/c
 3fgkEk/YkxxFhhh0H2Fcw7DwVYLnuzUj7JNyf82dUJaRrEXCj8Sil5oo4
 xioR+gttfEj7FLUlRv38+7Jhd7IPUKTOBRVnrN12yb5k0d4SuNehk9aUi
 tvTBMG+iWiHsi3voOtiCcJRV+0vRWyzXNi4wFgAQm1TbpSbp44F3/BnbK
 SlQNTaXM6HwqUUTjcYsIxoOu9fJTbEnkMgxxroH/4VZo3xXrSmJO94Ici w==;
X-IronPort-AV: E=Sophos;i="5.60,466,1549900800"; d="scan'208";a="214257216"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 May 2019 07:19:12 +0800
IronPort-SDR: Thd3W6OPrQchFDVD+oIKGmJ0u/cC/rXHQuNszdthX8qlCBdg1ZS7EDizvmnHm2Wz/BzTxNQCWC
 6goMTNeImP0xb5rkeIoATrng0tjnbarhddO2AbtdGw3vG5KJn49BQ5HralMcc/y/eZRaHYO/BA
 AssxDCSN0Z9mBfTJsTDfSTeMX83DpY1VpT6sQVa3bAOLRYeiCh6KI2PBY5crrT0nSKkwAQh3SX
 VYMrCyjcGjAwgN2UEYYUXLqcjODA9LEslEnb4oqB50NzZwpy4dtBZlVhGH5KC1m0k3z11eRq0F
 tHzbfnX5RrCSPA8cQ6hMCczq
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 13 May 2019 15:55:02 -0700
IronPort-SDR: 06Vi4gpOH0QgWmrXi+crv4qvXN/E/M6EWSeTgIr1Nuj03KINks0d3wWRouT3Cg6AeCPCjeOpSe
 a9ryK1V/QL9WoAcWNNPPYZisvZ+CiUTrFefNyFGj+g+w/gR+Mo6PYWZzA0NPyypb7JFVlfgVBT
 P/D8XYORs0aQH78XTZX2gLag83NTh+FkWe2ShRBV83AE0iCONJke+NbH4xQ6HMTS7RjBsiKtEx
 w9qifSCTY1n1OPREgE3nZUtb1y4Tt9/0zehYtgCFxYN0nkhT7H9xaY1CLzO9XSzShtrw5B/s8X
 Vic=
Received: from r6220.sdcorp.global.sandisk.com (HELO [192.168.1.6])
 ([10.196.157.143])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 May 2019 16:19:12 -0700
Subject: Re: [v2 PATCH] RISC-V: Add a PE/COFF compliant Image header.
To: Paul Walmsley <paul.walmsley@sifive.com>
References: <20190501195607.32553-1-atish.patra@wdc.com>
 <alpine.DEB.2.21.9999.1905131522370.21198@viisi.sifive.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <a498967c-cdc8-637a-340b-202d216c5360@wdc.com>
Date: Mon, 13 May 2019 16:18:47 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.9999.1905131522370.21198@viisi.sifive.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_161915_318819_6F4A8180 
X-CRM114-Status: GOOD (  18.57  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Zong Li <zong@andestech.com>, "merker@debian.org" <merker@debian.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 5/13/19 3:31 PM, Paul Walmsley wrote:
> On Wed, 1 May 2019, Atish Patra wrote:
> 
>> Currently, last stage boot loaders such as U-Boot can accept only
>> uImage which is an unnecessary additional step in automating boot flows.
>>
>> Add a PE/COFF compliant image header that boot loaders can parse and
>> directly load kernel flat Image. The existing booting methods will continue
>> to work as it is.
>>
>> Another goal of this header is to support EFI stub for RISC-V in future.
>> EFI specification needs PE/COFF image header in the beginning of the kernel
>> image in order to load it as an EFI application. In order to support
>> EFI stub, code0 should be replaced with "MZ" magic string and res5(at
>> offset 0x3c) should point to the rest of the PE/COFF header (which will
>> be added during EFI support).
>>
>> Tested on both QEMU and HiFive Unleashed using OpenSBI + U-Boot + Linux.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> 
> Seems like we're stuck with this basic format for EFI, etc.  Even though
> we may be stuck with it, I think we should take the opportunity to add the
> possibility to extending this header format by adding fields after the
> basic PE/COFF header ends.
> 
> In particular, at the very least, I'd suggest adding a u32 after the
> PE/COFF header ends, to represent a "RISC-V header format version number".
> Then if we add more fields that follow the PE/COFF header -- for example,
> to represent the RISC-V instruction set extensions that are required to
> run this binary -- we can just bump that RISC-V-specific version number
> field to indicate to bootloaders that there's more there.
> 
That would be inventing our RISC-V specific header format. However, we 
can always use the one of the reserved fields in proposed header (res4) 
for this purpose.

Do we need to add it now or add it later when we actually need a version 
number. My preference is to add it later based on requirement.

> One other observation - if what's here was copied from some other
> architecture, like ARM, please acknowledge the source in the patch
> description.
> 

Sure. I will update the patch.

Regards,
Atish
> thanks
> 
> - Paul
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
