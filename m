Return-Path: <SRS0=Dqti=TV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1265BC04E87
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 May 2019 18:16:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD4872173C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 May 2019 18:16:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ss3Ck0Sc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="W0VBtO84"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD4872173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J9OYIG2UXb2vCrhLIYAZUO8x03Mq5/z1Pfyt0JJuGMk=; b=ss3Ck0ScgOkq8IOETaEUFZNo+
	Vr+giMFYcvx/UZ4C9S6GiV9LHlyQLzvnm6OFxTDPjHjhtf9Ukzwfoxaw9YuC34SXX1nAuOjAshpou
	haqBBof2KRlPmQkYnGXbBYsqRgkzFhRsxq4r8oI8yw7fs6fSsM3A7boJhioyfHLK2/Pg5db+jYatD
	IFgrOF0RR4ZI3aha7G7OjJoJICfZuK9+QAE8AMNdrfJsFvm9ZK2p1yOHzTQZvLAUgtiOCHgLZOxeV
	1UWyaCO+pGIs1/wtWvbqNZVZFw8D1x3LMxM7M6mheqjjukQplCtNG2SXB1+OBNXuLhEmsqPWDR//a
	bQNq7Yjhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT9Ix-0005s8-2j; Tue, 21 May 2019 18:16:03 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT9It-0005rm-MO
 for linux-riscv@lists.infradead.org; Tue, 21 May 2019 18:16:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1558462578; x=1589998578;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=RmRhGFd5d0WPndyAga0qfp0VKYeBTSEJvEPUOa+OJ8w=;
 b=W0VBtO84EGoK32mtcHx90/Ldc3oFLE3kULesTuiC4gpcneDM+Vt+uDJn
 1SgrDPRqE4tjLZYupvjwcTAo62o5rdGuNaAw48eZ10hVINx0JlvVXYKrI
 syoA3AghpcjDttzvnI3bEu+DK6EHi87+Gvd04+bgHc1CmABema2+eHqua
 BksT2u60FAGMtPEFsAaU4AIJglxyFbCwaa8N0uvkp5VkrNRMoM9XLxKx1
 x4ioRvX1w0dWXnCUqc3WViK5jZka7fB9lbwwVfCQH3BgWV3QT7xE6s/YK
 /3BD5Tf6f5bNfEebccZyZs/XkYrjk2cilSYEXrECfK6EM/5r/mhp0ob4J g==;
X-IronPort-AV: E=Sophos;i="5.60,496,1549900800"; d="scan'208";a="208243313"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 May 2019 02:16:13 +0800
IronPort-SDR: R0P9ohy86OlyzB4F0chAVJb2jCZT9yeM+sOlSEaeAixzR1HyCjdj4cpN6giKBaMoCco7kEzYYR
 UflFBrmyeH0A0N4P8latfjO1sitvZ97718wGQ2HoS7ukArhc68lqVe5H4L+sdO1VAa2RkFk8Q6
 hRPgyI3XXjJiyUZQXiZXXY8kH+ykI5IkGuhfcY3IMbocJ0whOcXxnUfVjTUJkkEfj0XnKt2afl
 dsjCDWKDXMl2KCPBl9/omx1JgqxED57VLsJcCpTwjbE2ClTIJb5eHSfOSGkxYJ1VxkVH41xg3/
 teHdoXhY5gzbeuDMxxm79bUP
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 21 May 2019 10:51:20 -0700
IronPort-SDR: Wfi1cwjTXOmRWeyff5nYRoxogvnHR0B3EIUn/8NK8Nv7ZYF1vNmQDlzqY2ACriMUuS1z4HN76l
 tig0UxizmRtLR9y7YK1oeqi9QoiNUp4ozuEXEgAJEh5tOxbCsm7Uk7H/8ywtRmamX5PxC9ac3n
 dBsL+8hQXht16ZV/2NMfF0gWYLc9YBOmyik3Nb3vnvW2cgRkOqHsp2fD4aqUdzAnn9Rs1Vwp8Q
 VAEMo5AL8e3DZD0rVP0Bi1s4c1Q9xbcjVlU3fiubfwqQzxMrTVODVCRIOgDGpyV09w0Qb9lWrt
 BWE=
Received: from usa003163.ad.shared (HELO [10.86.58.71]) ([10.86.58.71])
 by uls-op-cesaip01.wdc.com with ESMTP; 21 May 2019 11:15:56 -0700
Subject: Re: 5.2-rc1 boot on Unleashed
To: Andreas Schwab <schwab@suse.de>
References: <5c1ffb76-b18a-dbae-d3ad-f3d2cd41ee44@wdc.com>
 <mvmtvdoi1re.fsf@suse.de>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <636f53d9-1800-df14-896d-c95737203b2d@wdc.com>
Date: Tue, 21 May 2019 11:14:00 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <mvmtvdoi1re.fsf@suse.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_111600_041274_E4BE416C 
X-CRM114-Status: GOOD (  10.02  )
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
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 5/21/19 2:40 AM, Andreas Schwab wrote:
> On Mai 20 2019, Atish Patra <atish.patra@wdc.com> wrote:
> 
>> 1. Thanks to Paul, uart & clock drivers are merged. However,
>> 	a. upstream clock drivers require DT changes
> 
> How does it look like?
> 
> Andreas.
> 


Here is prci dt entry in Paul's patch series.

		prci: clock-controller at 10000000 {
			compatible = "sifive,fu540-c000-prci";
			reg = <0x0 0x10000000 0x0 0x1000>;
			clocks = <&hfclk>, <&rtcclk>;
			#clock-cells = <1>;
		};


while current DT from FSBL
(https://github.com/sifive/freedom-u540-c000-bootloader/blob/master/fsbl/ux00_fsbl.dts)

prci: prci at 10000000 {
			compatible = "sifive,aloeprci0", "sifive,ux00prci0";
			reg = <0x0 0x10000000 0x0 0x1000>;
			reg-names = "control";
			clocks = <&refclk>;
			#clock-cells = <1>;
		};

The details of error can be found here
http://lists.infradead.org/pipermail/linux-riscv/2019-April/004259.html

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
