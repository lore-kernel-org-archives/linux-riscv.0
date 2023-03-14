Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F722C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 22:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D/MLVbosASWYRS1joLTkGc2HyrxlG2tLV3dBD7IaBas=; b=m4xyG6ASdGapMD
	qlofr5OQI7rTrQ+8AX2mV7TOg4LXQx8jHz3Jq7SNsUjT5cge4K1wk8+wnCRApEtn6bKHKiEGz0FAj
	v9KCDzyUIJqEKN+Ei8JOtBY/KZQ2fO8cKT55ABgkQkguK2cIIaREpLeGHv1DnQsSbERE7yCYnnwzk
	QiRekfDjMI23LgMVLeBopYKXR6Nz88ogsxXsnst1LfjBzHTHD4SmV+6Ez/KXa/mg1wkF7sSN1q6rs
	H6YcWEFSdaBReKDxxPIKrht9ipaS43nLU2hW3iDqmhd4J0DBCbqze4oJtnU1ZJPVsNASq8XAEq+6P
	bynql4DCCBhkN4iTNs5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcDZb-00BkA6-1y;
	Tue, 14 Mar 2023 22:56:51 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcDZY-00Bk9N-2T
	for linux-riscv@lists.infradead.org;
	Tue, 14 Mar 2023 22:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1678834608; x=1710370608;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+E8pmmwHhgh7vdhIb+zwxnTey/wAa0W8HsUhFIWhutk=;
  b=GEL7t5sB9GyWWOrb+ioi9ZItp/tSuBuUkxClKw3RNZnUSJLY4U5ER2hi
   spXKj473/ruaE82kK80QPnKNLDpk/7uY4O3lL4gXImLDo7uV21Narl6Zf
   KXbTCP4juM893ZFhKdmehEJkJslJEQRlq2SgQD6CSP3qKcCCp0qS9nnpi
   7vy4kqHfeVhK4VOPkbQGgK2DX9x4qBPCZIGdHoJFITNmInPhVJB39BqQX
   2jNsQAH05sD69QfwMYYxa9hBck77IZXYsJMdd01KBZIg4A2gX1u5gXjfI
   P6d4to8hRi34JkbzwbQ+5rk5okuDmPS78arozEHnbWSEYnHkbj1aFrnA5
   g==;
X-IronPort-AV: E=Sophos;i="5.98,261,1673884800"; 
   d="scan'208";a="225424761"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 15 Mar 2023 06:56:48 +0800
IronPort-SDR: ksgqF/JZA8F1x7/aVVD1f7Vj5w1rueSLgN7Ik9PgsnR1SUl+ZIpJ850PCkf+qHsL1DSsCluTrf
 3tyJ7FfdynUuBdJcqorAAcWN9QmeS9JZVATsmBnfFsem3GxRF1ne7WWBSaM7YfM6eKz9FIU3NT
 lkZJNsQz/WzwVhebYlA3t9WQL+HEzjAyV5awXAfBwtZYAh7zRXjalmcAfT8uJS+P7kRndVLRmJ
 /H6zp2MW+mO9Zmv0kYQb+tld20Hrj8V56spgOVgnasvACe4kC3Ls0FTZtBl0xhSQQi2Z7HWR8f
 AUA=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Mar 2023 15:07:34 -0700
IronPort-SDR: y86+nJL327eVQ1ECnxJo84htyUT2Xn31868MilK78RiCT25MzRRXvgnr4Zk6ZnSCYeUsrZ83OQ
 bRtaJXu38RM/wAlPvr2LTqaFXKCW9t54y3YkzRqvouk2LN+teKuN2s15DSWlyNuvJ/9t28APae
 No7IvXvCMpk8oO1HJvN/A6n/E0jrIAPMfP2vUh2FjPBr252YMVvBCwKSRpJlbVE44Ff/pEZGJS
 ARKVUF815DuACZcveiTC9eolITnR346mkhAKusLzJxTCm3vw9yH5qp4MzQ2mYV1O7Hh8kqiR9h
 P6E=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Mar 2023 15:56:49 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Pbpmw0tNSz1RtVv
	for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 15:56:48 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1678834607; x=1681426608; bh=+E8pmmwHhgh7vdhIb+zwxnTey/wAa0W8HsU
	hFIWhutk=; b=pb5Ubts9uFeMDy3UPBwLFJFAL6FZv2yzDlpU/CfNTgSpj5k+KMf
	shzvJMdo6TLqyeeUegM7dT0ya0VSgtw4Ubh5Rb5xCXiqbc4UMMUAAO7ZXIL1CFTY
	4inbstQ+c84/Y9bT7lfIDXBnYkKhEyj9tCbhqrv5texA/lvkBuR/smueU7EGkZDj
	lumPjmvylCfty5HRr/yu82EUadbDb7R8ZW725Yz6mpb38H51RUkIrUp4ZCeD4t/H
	/o2AG3/RKG3fBYnnlvjtAPBTXHsFG024/hxhipjr7gQg2nUULt1J+DgmvBlRE2Q7
	34JJWv9GpA04YPJI7IYXntrkAcayH16HEBQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PwNcaeehbzB7 for <linux-riscv@lists.infradead.org>;
	Tue, 14 Mar 2023 15:56:47 -0700 (PDT)
Received: from [10.225.163.84] (unknown [10.225.163.84])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Pbpmt099tz1RtVm;
	Tue, 14 Mar 2023 15:56:45 -0700 (PDT)
Message-ID: <5d4c882f-3d7b-e97b-b36c-82c928c31d25@opensource.wdc.com>
Date: Wed, 15 Mar 2023 07:56:44 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1] RISCV: CANAAN: Make K210_SYSCTL depend on CLK_K210
Content-Language: en-US
To: Jesse Taube <mr.bossman075@gmail.com>, linux-riscv@lists.infradead.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>, Stephen Boyd <sboyd@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Conor Dooley <conor@kernel.org>
References: <20230314211030.3953195-1-Mr.Bossman075@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230314211030.3953195-1-Mr.Bossman075@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_155648_852230_3E5AA9C2 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/15/23 06:10, Jesse Taube wrote:
> CLK_K210 is no longer a dependency of SOC_CANAAN,
> but K210_SYSCTL depends on CLK_K210. This patch makes K210_SYSCTL
> depend on CLK_K210. Also fix whitespace errors.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Link: https://lore.kernel.org/all/42446784-a88b-df09-41e9-5f685b4df6ee@infradead.org
> Fixes: 3af577f9826f ("RISC-V: stop directly selecting drivers for SOC_CANAAN")
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>


-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
