Return-Path: <SRS0=vm5i=MN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FORGED_MUA_MOZILLA,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,INVALID_MSGID,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA95C07E9B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 01:13:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02C736113A
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 01:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02C736113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.com.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8e8Sr0EY4uqGZMkY4D+TfgHoI7b9vL4hA6UbhNUmqs=; b=oDaADMXZhMpHT6tX+kx8MsjUmZ
	vjutnhlH94R47JmzKt4XJJ3E+fFVvutQBRJFxR3fc9JuQtD+0yQN7IUJ9jtNu5WPMBDXmwjmC9ls5
	MTdiYVKCrQ2mk3tnJLR4HE18klu1DhujK++fYEPRMwQcdYjC8YpVKkVCzE69VICXWCrba++uoJhbR
	k9O3UVnqzS6UMpXMPjH/t2S3vzcuQJC1bMhixNxULKJhSWMwSnVbg2TtiCo1uyMplYqGMP+b2ksqR
	/JPozURNRvaXjiOG4hYfiAEBZgLam7RlhS40MujcDDrlUtwXLpkQ+WjPWo3vjHqB41k4uJrjHRRUy
	tcvpkmrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m60nZ-00EDxC-Bx; Wed, 21 Jul 2021 01:13:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m60nY-00EDx6-9g
 for linux-riscv@bombadil.infradead.org; Wed, 21 Jul 2021 01:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=yyz+nnjX1/MRSAO25pN0GBOAsWTtXsBUUiniihM1QDM=; b=de9o+y02F2ksFt2brOu6UHoN74
 auajtDbDmThn+M+kLC7209cyphUXUrpjOwZvn56Ev2++RoC34Li6CZRNCP18OttPhWjOgqmlboFMU
 6fgJmvkMs6fHvFaDWHJHv3L6Oep7ho3NNU7B5R6r2J2BcMZ5exxL20EdQGmalO3hA4KALxt+XWJuW
 W2dX2ENbCGZlCiEo4eT1940eWTlncwATQHfPg+mKIV7U39+bL1tQ+ivfrUB6ZDbisKLqN2aYx9KFU
 owxCzzKdHo4L7q8PkXRzFAqU9Taqc0ST/KIsiCzCrNRxqSkxA4gJI48syeM6lEBF5w5Gq2VmBkOCm
 ERgnnVkQ==;
Received: from smtpbg501.qq.com ([203.205.250.101])
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m60nC-008gG0-0M
 for linux-riscv@lists.infradead.org; Wed, 21 Jul 2021 01:13:06 +0000
X-QQ-mid: bizesmtp40t1626829948t802dcfv
Received: from [0.0.0.0] (unknown [104.168.173.65])
 by esmtp6.qq.com (ESMTP) with SMTP id 0
 for <linux-riscv@lists.infradead.org>; Wed, 21 Jul 2021 09:12:15 +0800 (CST)
X-QQ-SSF: 01400000002000B0H000B00A0001000
X-QQ-FEAT: 0VmwRkEgV1HhZqLOqqBPTS02Sh6Rg57NkKfrPMxiyCvicrUG1ZfAMFEdEsBLu
 vwBXbWYMmB2l4/f4VehDbbsoUZ5uQEiacJ3unru02lWGnSKW53FdtS2sty7DNflI2OHLuCD
 RMT3ur1yLcc6rtmZFSU8DxX6o7VMukmbNA3U/CZixAoGEc5wh/xgkuOt5O6mfalvytDXSv1
 RSNX9W7qEnYIgNLPV3uwVOVbqQnXZ3tgJ3rQ/sNZ/5gDxJ2UfDatMKzk0q+DnrcroONd4Rv
 cJ06NPGgWpOOoFpu+KjeRSXACgo7bV16VtVdYevsEN+jj0Av6SdlvvTaL4uutG4eT4FbvqC
 LEDb8VzeXEuBkluz78=
X-QQ-GoodBg: 2
Subject: Re: [PATCH 0/4] __asm_copy_to-from_user: Fixes
To: linux-riscv@lists.infradead.org
References: <37097718-c472-025a-2058-55667badc5b9@gmail.com>
From: Qiu Wenbo <qiuwenbo@kylinos.com.cn>
Message-ID: <e97c4292-a6e8-4821-09ce-34c979383672@kylinos.com.cn>+36AFF53D37B3F7A3
Date: Wed, 21 Jul 2021 09:12:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <37097718-c472-025a-2058-55667badc5b9@gmail.com>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:kylinos.com.cn:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_021300_742949_53A9DC1B 
X-CRM114-Status: GOOD (  12.68  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Tested on HiFive Unmatched by compiling several large packages.

Tested-by: Qiu Wenbo <qiuwenbo@kylinos.com.cn>


Qiu


On 7/20/21 4:49 PM, Akira Tsukamoto wrote:
> These are series for the fix reported by Guenter, Geert and Qiu.
>
> One patch to fix overrun memory access, one patch to fix on rv32.
> And two more for clean up and typos.
>
> Have tested on qemu rv32, qemu rv64 and beaglev beta board.
>
> Thanks for the report and instructions to reproduce the error on rv32.
>
> Akira
>
> Akira Tsukamoto (4):
>    riscv: __asm_copy_to-from_user: Fix: overrun copy
>    riscv: __asm_copy_to-from_user: Fix: fail on RV32
>    riscv: __asm_copy_to-from_user: Remove unnecessary size check
>    riscv: __asm_copy_to-from_user: Fix: Typos in comments
>
>   arch/riscv/lib/uaccess.S | 27 +++++++++++++--------------
>   1 file changed, 13 insertions(+), 14 deletions(-)
>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
