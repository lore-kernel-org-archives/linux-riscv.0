Return-Path: <SRS0=cYQk=TU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF080C04AAC
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 May 2019 23:33:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8170520863
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 May 2019 23:33:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wny646s3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="jsy7vTcW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8170520863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EUwYQTKinkIycNWV7hkBcKgYfzMiu7Ll/Qf+Zg9Sytw=; b=Wny646s3Ljn4tfOpLC55mYdEog
	ZuzppcfT7bKEpZBktO0QiC0N42JxHW4/ppiFMAEpAMDIfHLNny0EiiuM23Sv6krYBuasZTqPlouZI
	yk/UERocC+K23LveMJACLvPS7cVNrp403BkekmbYBqglZgot6aKJu1RrR3zBrRpMgIH7E6bGv0ja7
	JyIMdhCK+BCi54WHm3kZZ0CAn3S2ipF4YQWPWylQz2Ir0RqBRTtoYY+d8Gf4TrQzBCiH5czlJCIYI
	mZ17cgCY40AtqTVK184knkDHYJXbePbqB4Wq7zxrab9vPq0HYB+pAH0kxnJcX7DkPHsxbqgJdl1LW
	iYHYP+cA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSrm8-0005MX-3j; Mon, 20 May 2019 23:33:00 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSrm4-0005M6-Am
 for linux-riscv@lists.infradead.org; Mon, 20 May 2019 23:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1558395177; x=1589931177;
 h=to:cc:from:subject:message-id:date:mime-version:
 content-transfer-encoding;
 bh=vPJM6hX4sspHFpK1cuKTW4lyCzryM12ErZJ37U+ZIDY=;
 b=jsy7vTcWGACxan6wlcnPf2G0GOF9Ye7yvjS5vgM2CXArHYSYDy/dXAey
 uoXcGd9et8bjqX2jnut3KW9LZw9PWBhHcV10DPezQaJA/YoR3oYUhCTxt
 NAcsZ7mn/cUSXnK5rDC3TIgNbGzefUcMXkNKL9TchnqhE2/BDYq5FacVj
 pvyWvDdMZ8mumhry5xsYOBpCA1QoK07kkoB6jJeCgpXPHwL9z8URm6do0
 DXXmP4wQb9LLvl7B9iq9g+9v30Giuo5PxmRR/42PYqB1fWIwuRjSnXuBp
 37GMazKQblQ7kZB35SoCX1eXtKs8fwB+wXDb8iDjfYrq6+EQfuBiAO4nr Q==;
X-IronPort-AV: E=Sophos;i="5.60,492,1549900800"; d="scan'208";a="109940063"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 May 2019 07:32:53 +0800
IronPort-SDR: 2pDJ9JGeY+XD4PJ6f4n3D2AoPdd8ebX1WR/Q/2MhzNul7plwNlhQvG9YLKH4IMhWgDdfGScYDA
 xYHfxjkfWFydFfuH1qklmy/lz8VjEzrsoXdi89U5OB7iinpOY5MlWAPCHxVeqsb+S4I3IFb/Sv
 fMdCn2/4I1MRFoTHpkQyd3kc5IbCkU+16PsPmsSjtij5wKpSPQ+GQYOGpfBKHF2iFdfdchjTPi
 8tNCCbrMzW7YA7N+EPSFyzgMH1ur81j9eAQmc7eBUbR63ZFCF3t3678WF8a4s6ZaXvlIMwMM31
 4fWLjmjPRFhUddhBBH0MaySe
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 20 May 2019 16:08:17 -0700
IronPort-SDR: EKSWNfBtZM8J9LNs2K2CyPNhfk5hTp8FQmMD9WsvN1nbqUzl8aClm9ceul5KywiLIGW3zk3Qaz
 FjNWgtqJ/NwCHUCD5PhOwCBsxiWSfDvSeDmoUJmSrpCMdUn5Euur29W1t4JhUPnZPzsw2KNAc0
 yKy70hVKVm0L/8osQ5JaXhbDFPIRxSGGAVGQoz2lqH5Ihjx/PC8W2VgR8FdqucDrUHiYBSuJyq
 RAykJFhWZkaSGTRJMS8CB8Waw1Yxs7yXRN9uj0KID2oym6QOskwEts2/eIF28ONwoLjLT3ZZ8y
 jO8=
Received: from r6220.sdcorp.global.sandisk.com (HELO [192.168.1.6])
 ([10.196.157.143])
 by uls-op-cesaip01.wdc.com with ESMTP; 20 May 2019 16:32:52 -0700
To: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn.topel@gmail.com>
From: Atish Patra <atish.patra@wdc.com>
Subject: 5.2-rc1 boot on Unleashed
Message-ID: <5c1ffb76-b18a-dbae-d3ad-f3d2cd41ee44@wdc.com>
Date: Mon, 20 May 2019 16:31:13 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_163256_509333_A84CC079 
X-CRM114-Status: GOOD (  12.90  )
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

Hi,

5.2-rc1 still requires some out-of-tree driver patches.

Here is my tree (successfully tested on Unleashed.)
https://github.com/atishp04/linux/tree/5.2-rc1_unleashed

Issues:

1. Thanks to Paul, uart & clock drivers are merged. However,
	a. upstream clock drivers require DT changes
	b. Those DT changes are still being reviewed.
	c. FSBL need to be rebuild & updated for these DT changes.

That's why I am still using the old out-of-tree clock drivers for now.

@Paul, @Palmer: Can SiFive share the updated FSBL binary so that 
everybody can use the upstream clock drivers without having to rebuild 
FSBL by hand?


2. We still need the following networking hack. I had to rebase the 
patch on top of 5.2-rc1.
-----------------------------------------------------------------
commit 1cae94e4f38f (HEAD -> 5.2-rc1_unleashed, atishp04/5.2-rc1_unleashed)
Author: Atish Patra <atish.patra@wdc.com>
Date:   Fri Sep 7 10:22:27 2018 -0700

     RISC-V: Networking fix Hack

     It looks like that kernel driver now supports reseting the
     signal one additional time. As it had been  already reset
     twice in FSBL, PHY gets into incorrect state causing below error.

     ----------------------------------------------------------------------
     macb 10090000.ethernet (unnamed net_device) (uninitialized): Could 
not attach to PHY
     macb: probe of 10090000.ethernet failed with error -110
     ----------------------------------------------------------------------

     This patch is just a temporary fix until we have a fix a FSBL.
     It is just a **HACK** and **NOT TO BE MERGED** into mainline.

     Signed-off-by: Atish Patra <atish.patra@wdc.com>

diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index bd04fe762056..4b99b226c885 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -94,9 +94,6 @@ int mdiobus_register_device(struct mdio_device *mdiodev)
                 err = mdiobus_register_reset(mdiodev);
                 if (err)
                         return err;
-
-               /* Assert the reset signal */
-               mdio_device_reset(mdiodev, 1);
         }

         mdiodev->bus->mdio_map[mdiodev->addr] = mdiodev;
-----------------------------------------------------------------

Can somebody please look into this so that we can avoid this ugly hack ?

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
