Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32B2C64EC7
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 04:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=irpKEmhjpCEuv+EcgS+5dzs0JporDAuU4cLvBAa0LAE=; b=aFz3LilCj80JLu
	szNvTUFxfCuAEqY/5jfIu6020edPIUdMwtXAVM/0DlSwKtvQPYIpb0E+DJncGsGX0cWhpCq2tQOpl
	0VDB1mhI/v8dMHsv8f9+Z9A8HVkd+8g6Xw0AqbA+wT7+Ng1TP4+9ZXr/uL61Pn/b36fzpbqfeVdIw
	DWfPpmKH05FLprT2Zf99c+TMUtT82x3ZVg2nzKBCYcyptomfM3QAK8RcLmBEDlm56ue1vkeZgQrup
	IKXB4SjnyvORNhJSWbwTl7qX8fPqflwrHycTzYfmj3J3UBSf9u+FtzmMOytB2Uh39r0v2yMnuFxeD
	geCDwKA4Ta9WkBj+U6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXEIq-00F7Lj-0v; Wed, 01 Mar 2023 04:42:56 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXEIm-00F7K9-PJ
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 04:42:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1677645772; x=1709181772;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8XAiocMESlyEQB3/IA8FOwC8IwIUE9dV7mZk2taKSqk=;
  b=CsScakky14kSrVDYbsrNXYuPk8nD02oxxSsz1F6z0qvctgPky5stgzci
   zu/k8vuIrBVt2KQyFdRPM9XY6hIUr0D5hOh5JO8kz2WSxagB5BkyTKUGD
   qs9qpFepY94ojkIgCyoGQjzDz4qLhDSMy5wLoGWXePBmBQmxbmqWGrlw3
   X3IZE6ghszSFrIuGoZBLPR7RPNRYB6MYUGogl23IfxH5nCTXwFOOvM0wk
   lQ1NDVOKWQdEXKOPlgrsjKnA/ql20iA7EUReE4DlIzueow+LQYHNP0SEk
   JhQ4pB7+RTW6mm4EU2pzhRyiv/aQu0sAESe2Peqc07aYxZnWtSEiQQfdp
   A==;
X-IronPort-AV: E=Sophos;i="5.98,223,1673884800"; 
   d="scan'208";a="336470848"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 01 Mar 2023 12:42:47 +0800
IronPort-SDR: RKjBIKH3uM28nXuLxkbG6DNzzqx5w9+nTFfPK5AUhGj2A0MdYFLqo7s0oU3nrR7aJVje0KGAuJ
 NepgJHukdMVzqTsbZfxvDC9TtLTfnalqVhQXqAxmX9QKExIZGBTqnDeXjGhRhQzpstjO8xE0g2
 fKM+yDEygdZ+rhS+9WaFACZzrNXsFm3Cdc09zEQn4eABUSknakRm+sodvvy9Pzd8f2IAOquRBi
 RCAHVWbRM41omTR3f9/iFBnTrqb/9lCIEPUSbUZdLoeA1tzFqPjAOb2IvcN5TX/C6asGauHhrz
 rLk=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Feb 2023 19:59:37 -0800
IronPort-SDR: 738/U0YdKQOW4iIym+tidFoef5TBZWd3SNSnA1+BJAKoelxrXupiDZjvhGcC9THTddYD24WUaz
 wOq8c1AAtR5MJLBGQm2ayJpcNgoktGaLKck7NY4UTPG1LpRvtbRACAh1LE1ZUHbWbkpGRf6ULk
 BycMupmu8YHwB7n2ptAEWjoDb1+HApsf6I9JJNjDFXIstZRj7RO2KuSoNsFZf6ncMfUhuMVPCb
 WNMp8Xf93uagUFc//pF4nU2/A3iO8orVI+bi6JAS93wbdNZPZMmLZcyEllej3SrpVFfAfBBQyz
 1ik=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Feb 2023 20:42:48 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PRM6b0hGBz1RwtC
	for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 20:42:47 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1677645766; x=1680237767; bh=8XAiocMESlyEQB3/IA8FOwC8IwIUE9dV7mZ
	k2taKSqk=; b=qbzczmvN2UP4M6Rj2OuoMDUHqho8nBbzp0BBakka0Pvrx+5u+Pt
	3hxvQxgTFbNXZmVQw6o/KYO20mZ2RyWRiOjCsruih91UZ4XinODrhDv+6+/NwM5G
	5aGMBtksyu2cm0Ee7BnwRJQlTQjGjiwyaEr9PmqMEZB6gKBLasX9sDfvptSKzymT
	7cRbQsLcS56tW0YUuB2zgmZUtuwbfnv/jyELxZyW1w09BD75syayElBgEzB2ZJQv
	rX4Oq+czz4G1s1I4naWfnyDXl0nYOfq5m/+zTVAtLDCE1q8LKxeixhyn9cqGF/JT
	uqegCwXJaeaWaizK5cjpWp2rzjq1CA+DP8Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ZX41gBvfGSVC for <linux-riscv@lists.infradead.org>;
	Tue, 28 Feb 2023 20:42:46 -0800 (PST)
Received: from [10.225.163.47] (unknown [10.225.163.47])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PRM6X04XNz1RvLy;
	Tue, 28 Feb 2023 20:42:43 -0800 (PST)
Message-ID: <556ce787-80eb-dc48-f8d6-83e415538e36@opensource.wdc.com>
Date: Wed, 1 Mar 2023 13:42:42 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/3] Add RISC-V 32 NOMMU support
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>,
 Jesse Taube <mr.bossman075@gmail.com>, linux-riscv@lists.infradead.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yimin Gu <ustcymgu@gmail.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Waldemar Brodkorb <wbx@openadk.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
 <42446784-a88b-df09-41e9-5f685b4df6ee@infradead.org>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <42446784-a88b-df09-41e9-5f685b4df6ee@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_204252_835247_15BD4F0F 
X-CRM114-Status: GOOD (  26.47  )
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

On 3/1/23 13:07, Randy Dunlap wrote:
> Hi--
> 
> On 2/28/23 16:26, Jesse Taube wrote:
>> This patch-set aims to add NOMMU support to RV32.
>> Many people want to build simple emulators or HDL
>> models of RISC-V this patch makes it possible to
>> run linux on them.
>>
>> Yimin Gu is the original author of this set.
>> Submitted here:
>> https://lists.buildroot.org/pipermail/buildroot/2022-November/656134.html
>>
>> Though Jesse T rewrote the Dconf.
> 
> Dconf?
> 
>>
>> The new set:
>> https://lists.buildroot.org/pipermail/buildroot/2022-December/658258.html
>> ---
>> V1->V2:
>>  - Add Conor's clock patch for implicit div64
>>  - Fix typo in commit title 3/3
>>  - Fix typo in commit description 2/3
>> V2->V3
>>  - Change from defconfig file to a PHONY config
>> ---
> 
> Is this 'rv32_nommu_virt_defconfig' target the only build target
> that is supported?
> 
> I ask because I applied the 3 patches and did 25 randconfig builds.
> 5 of them failed the same way:
> 
> riscv32-linux-ld: drivers/soc/canaan/k210-sysctl.o: in function `k210_soc_early_init':
> k210-sysctl.c:(.init.text+0x78): undefined reference to `k210_clk_early_init'

Arg. Forgot about that. k210 is rv64 only and while the clk driver could still
compile test with rv32 (or any arch), that driver provides the
k210_clk_early_init() function which is called very early in the boot process
from k210_soc_early_init(), which is an SOC_EARLY_INIT_DECLARE() call. The
problem may be there. Probably should be disabled for rv32 if no SoC need that
sort of early init call.

> 
> because
> # CONFIG_COMMON_CLK_K210 is not set
> 
> 
> Maybe SOC_CANAAN needs some more selects for required code?
> 
>> Conor Dooley (1):
>>   clk: k210: remove an implicit 64-bit division
>>
>> Jesse Taube (1):
>>   riscv: configs: Add nommu PHONY defconfig for RV32
>>
>> Yimin Gu (1):
>>   riscv: Kconfig: Allow RV32 to build with no MMU
>>
>>  arch/riscv/Kconfig     | 5 ++---
>>  arch/riscv/Makefile    | 4 ++++
>>  drivers/clk/clk-k210.c | 2 +-
>>  3 files changed, 7 insertions(+), 4 deletions(-)
>>
> 

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
