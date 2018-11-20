Return-Path: <SRS0=wErq=N7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04475C46462
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 18:23:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C463120684
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 18:23:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kqmAW9eS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="SxnDDkEJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C463120684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eL6Irew8d6meaubM6i1RViGBen2ptDnmZGL3UrUr5nw=; b=kqmAW9eSYhZdPL/1a+ANONwry
	rS2CwTyfpfG2PSNJtgmMaBkIa+3BpDAVPiu72YX+GoJZB6kRL80iPz+TsgqJ+55p+0ri5J7HnmMHu
	flTUAm62wPk0M4k4NjsdTbWsdbRBjcccViM77yiqdiIQNQ/yWHSffSeMrF/hHcOYe1peiy9VaqrEd
	dG9R+pRsQiAZkDuSgCf01FcFc9CcfzHFXvYE17LKx3qn4bmAmlN35d8m0Mz5deAAqFUAR4Yjvy+yr
	7Y+SidKoDN59RfUFsOqPg/vEgvOVGmq20of6CjQ082zXr8WOYPknVlBJL1beITiimWIpxHNVnVl0b
	HMLbIwHHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gPAgQ-0001q8-Ae; Tue, 20 Nov 2018 18:23:34 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPAgM-0001ok-So
 for linux-riscv@lists.infradead.org; Tue, 20 Nov 2018 18:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1542738212; x=1574274212;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=o9Ly71lAr+EGKbfDA2D/2K8CEGUQSVMePF2krACBSIM=;
 b=SxnDDkEJIMWGDRYCzkZMjcrX6wC/PbUxAA+AMd8v11RyfNXXsrWYjhhr
 UUvEHsfTCw4gKU0uI8d513M2+Ct4zkTwCpT1Ey6XjFzPlFNPmLNdPgqk9
 G4KAKVR5EwR//8Rak8LSb+mxg9lp/UeBiE7rWuIm9yfuuYGhJs4Vb7txt
 jU489kppOTJu1W1ntzjLUNb/0BT9fC9Vmm0IS+G422sov8EMiTaYnenmM
 eA6JWvVCrXyGzbxg4mXgwqdwUKG0IVmDlt85AnWj5xcqSjCUmqpnPWmDN
 dUUAJGNySXuDpb0Pk2Da2ezgGViFpiqJ9irlrNIB3ggDDGCqdET5K5Rt/ w==;
X-IronPort-AV: E=Sophos;i="5.56,258,1539619200"; d="scan'208";a="95896101"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Nov 2018 02:23:20 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 20 Nov 2018 10:06:34 -0800
Received: from cnf003109.ad.shared (HELO [10.86.54.248]) ([10.86.54.248])
 by uls-op-cesaip02.wdc.com with ESMTP; 20 Nov 2018 10:23:19 -0800
Subject: Re: RISC-V Patchwork
To: Palmer Dabbelt <palmer@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <mhng-f1f11265-f6fe-4284-8dc0-a28ac937fdb4@palmer-si-x1c4>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <7b7de9a4-42f7-59d2-c952-bbc5ec023e56@wdc.com>
Date: Tue, 20 Nov 2018 10:23:18 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <mhng-f1f11265-f6fe-4284-8dc0-a28ac937fdb4@palmer-si-x1c4>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181120_102330_965178_C9FA56C7 
X-CRM114-Status: GOOD (  15.40  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181120182318.EktLX7hSAHWf1_QjYPLnagM8ApG6eDNIRA14PcBIYeI@z>

On 11/20/18 8:21 AM, Palmer Dabbelt wrote:
> Atish tracked down the documentation for creating a patchwork, which now lives
> here
> 
>      https://patchwork.kernel.org/project/linux-riscv/list/
> 
> I have no idea how to use it, so we can all learn together :)
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
Awesome. I think you can change the status of the patch from a dropdown 
box, after you logged in with your patchwork id. The available options 
looks pretty much self explanatory unless there is a hidden meaning to 
it ;) ;). As a contributor, we can take a look at the patchwork to for 
the status of the patch. No need of email replies :).

pwclient was helpful in applying the patches directly in case lkml was 
not cc'd on the patch.

https://patchwork.kernel.org/project/linux-riscv/

There is git-pw also. However, I could not get it to working for 
linux-riscv.


Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
