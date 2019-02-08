Return-Path: <SRS0=OMI1=QP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F22C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 06:08:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06F2421916
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 06:08:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DtaPMMUM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="OIRJvAkO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06F2421916
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zzTII+12yKWVXqJoUd0valyb6BrRkcUDvyuBauAxZ/s=; b=DtaPMMUMwQH0CxoBqVW+1OzcmF
	3iMJdxbRgc/qF+WVawgUaS41woEM4DXJ41EWmRSP056AwVlRWsvhYKkTAzFbKrqsGn4mZKYDBl2wH
	RB0bEXpVmon2dgAVKJbq+Uy8UIFPBLDVqTE5MpoEzKhNFK7oIEv/n3gWWP5yaPoCnx8KDlPXPYzon
	TQFw8lNdevMA6qr4zgpI1WSQmMj0OhphQiZ8WKCkHl1OerSikh1Yjt5fMW6L+B9ehRiwUKKqd5Jjn
	bYMUuy+XwaPTtpb2oNUo5F+UjHgv1ejDPn9x7ZG3ZqZxOlTjt/pNssNQYnbIm8Q2b7Ik9Le+HQEqZ
	gUa//VDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grzKp-0001Jt-IV; Fri, 08 Feb 2019 06:08:23 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grzKl-0001JW-Fy
 for linux-riscv@lists.infradead.org; Fri, 08 Feb 2019 06:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549606100; x=1581142100;
 h=to:from:subject:cc:message-id:date:mime-version:
 content-transfer-encoding;
 bh=ts2sn79IxWxsbmZvZieWU748NJQ1s0bybWPNNf5884E=;
 b=OIRJvAkOktiAMT2uyXsvjkSxINRdjY5B2L8sxacNosmo0QYl8evIeY1S
 yqLj8k6CgLgOw7T7WSXr1/VVYgEQGEQmX90UdfnN+8QUch6L5fAQKbNRX
 Xt0MVenJormFecvo7Kboa5530GW0csQQnzXhZUWkVRx42Z1I7T8+U7LFY
 aIpS2WXBzTktyYUewYpFzc7n+NDzc4lD6dWwpvPaJ7LqrwUtfa2IDqLED
 aETHHCZTBlHz1paNmHrL7uc2FwdzniWgqQI4Nm7gAfnRIJ7PgcjN34nZ0
 JOsqpYdxYAWXTBnVBm5Lem3T5PORM6ZnpQ3BU9PxBcfxW7KMGVJaxIpCU g==;
X-IronPort-AV: E=Sophos;i="5.56,564,1539619200"; d="scan'208";a="105753698"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2019 14:08:16 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 07 Feb 2019 21:48:58 -0800
Received: from usa003678.ad.shared (HELO [10.86.58.216]) ([10.86.58.216])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Feb 2019 22:08:15 -0800
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
From: Atish Patra <atish.patra@wdc.com>
Subject: kernel after 5.0-rc2 may not boot using BBL
Message-ID: <4b647c0d-86de-fed3-aca6-d248b9aff762@wdc.com>
Date: Thu, 7 Feb 2019 22:08:14 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_220819_668472_0925FC5A 
X-CRM114-Status: GOOD (  12.04  )
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
Cc: Andreas Schwab <schwab@suse.de>, Anup Patel <Anup.Patel@wdc.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

If you are building a larger kernel image, it may not boot using BBL 
after 5.0-rc2. It works fine with OpenSBI though.

Here is the reasoning in case anybody else is facing the same issue.

The following patch was added 5.0-rc2 which helps reduce the flat image 
size for Linux kernel.

"22e6a2e1 RISC-V: Make BSS section as the last section in vmlinux.lds.S"

As the BSS section is moved to the end of the ELF, flat image will not 
include it. As BBL copies the DTB at the next 2MB page boundary, BSS
section may overlap with DTB address. Kernel clears BSS section during 
early boot which may clear the DTB as well leading to a boot failure.

OpenSBI always copies the DTB far ahead in the memory (0x82200000). 
That's why you won't see any issue with OpenSBI.

Here is a BBL fix that can solve this problem. I will submit a PR to 
riscv-pk.

diff --git a/bbl/bbl.c b/bbl/bbl.c
index 1b96a9d5..0d448d82 100644
--- a/bbl/bbl.c
+++ b/bbl/bbl.c
@@ -14,7 +14,7 @@ static uintptr_t dtb_output()
  {
    extern char _payload_end;
    uintptr_t end = (uintptr_t) &_payload_end;
-  return (end + MEGAPAGE_SIZE - 1) / MEGAPAGE_SIZE * MEGAPAGE_SIZE;
+  return (end + 16 * MEGAPAGE_SIZE - 1) / MEGAPAGE_SIZE * MEGAPAGE_SIZE;
  }

Thanks Anup for the explanation and above fix.


Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
