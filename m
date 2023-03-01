Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61427C64EC7
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 01:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wY6zlEoua2p3wgLdpO2GOxkpK2fllAqLeeM6NxvoKmU=; b=3zMLlG5dMvWnyj
	WWoElIBnOnCQpsIv97hgQlRs9d8uqRM3pVm4j6IyXy1GKzOzCVa/9jPz321vzXL6DTaH3pu+TfwJs
	cHfgEXohJBkpum5JlbKV9SVqePUnl5Fx5cnrRqSIkDjuDaMZTcK/bf6CcCHURfDRiiOGgJUVdzjZ3
	T35iAZzdbc3uFkyoryqDFo+PdEfRIPqg7KF4dB9XMmQ/QOBymV2VySq+GVoTmdcRYFXdVXGnCiWd2
	hkTvzidRkeXN6TB6kGA3z6X2fiqNPhl+y8wLpSXC4IrWGQG5YRGjPzEmkFcH1JSP9P/Q3YPdJdKJn
	8LkO5G9zGhGSyJY/4NLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXBAi-00Ej6L-1K; Wed, 01 Mar 2023 01:22:20 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXBAe-00Ej5m-FU
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 01:22:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1677633736; x=1709169736;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DByreY2GJXdAGvq71tt9Fo41tXYu1N83vt1UZRvOcNg=;
  b=c7K2aTZ8WSmts75e3ovzetb+MPg9cjFqtiYr8hwdklkaZdUr2tz7oV/B
   PeNr8ADv/G8OH8GzVFBR11cPIUnMJ1zcVAbaFlD5+P8wJr8kQdCkuQj5M
   Huya/VV1VHTmdslWQZnBwY5yqsLQnFv4/3IgvvOesOSekgMmggb1tQi3J
   jqWTyx1S9sKndvqttSS1L/fyr9IB/f1aQ+dxEwlykNrYuvjo2/uzfzwI0
   Hq4dNIdzZyoS5Qb1jqlVwxC4TVZ+Q3mEc6zZEO3zmEmq8eLnklg5ASEfK
   fOsm+1Z1+ZM2Oc6JaU1HGAYhwNPphojNeDgNkAkMCY1dLenX6n4plcwUC
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,223,1673884800"; 
   d="scan'208";a="224259738"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 01 Mar 2023 09:22:10 +0800
IronPort-SDR: WFBPTxGBhoIc8u0YAcc9msn15i5VpCLhlwdoSdDsTYY2SDN24q1VWvcCGbvYq4hh3hP18obHee
 iSb/pkGGTbo1UlkgnJQOT3ppIA9Aw9suwWazwFt4n1HF6lLuvN5q6ZQrpgsYiJAtHZkV5K9tQw
 vsGUr+chMe6aji98vQ0Y4XWp2GmNNgkSxIWw8h90Truuqc72lTJlu/cW3cML/RETFtc48YHDzx
 sbNJQypV4Lsrkf3dF2BczUwTMi5Tiy3b46W7YEUu1hsqoAHMaNpxp0m4Ff3eKZvZhSgU3CwLWT
 Yd0=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Feb 2023 16:33:16 -0800
IronPort-SDR: 1lgIuGkSEqOGBUqdkJMOXNItq4/3hkjqy2nZLSoCZdQ3+waSGRYoXf/CkeRsyNU3cP2i70RhYu
 foLXfd4new82PuW5Oxu5xelQ2s6kRbr6/6kj5I7AG7QPxZyLeUDx8Shn6REBQcfyVL65/6004B
 jGRsYqtrpCJ5y4BjxbEFvtQQovwRl4nwZoRZ7KelS2MeHQAe+NLQqxn1JQQs0wD+oAyRmkW+Zp
 klC7/NjK0LlE2ssrjRJCsNJQkJZEs6U5WZK9atlFqL5QPESpM4HEFr9iOn/J3lgZ+TCiQxyZGH
 mqs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Feb 2023 17:22:09 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PRGg56ZQYz1Rwrq
	for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 17:22:09 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1677633729; x=1680225730; bh=DByreY2GJXdAGvq71tt9Fo41tXYu1N83vt1
	UZRvOcNg=; b=aRZcjnIWzTDBFw+lwAK0yQ8I8bxlc+Ac1zRjAR1GywFhY4yN1yH
	aI+zVMJ6Q0eG41nPwWDXNKq/hOWxeI01P52EdQGYIOYzXOkufeBRfJIy6NRF23nX
	Mv/CsRYiuYhXA9RxOcnGN3cKK70ZZzHyVwwLeiPp4Q25wXt4ULnXNHNK/fyeKyA1
	72yG9x6b5NEawCA8VtwAC4s21lnwzYOOwwPhvyEQomn5yv9NJmNTstMZIMVrGBKM
	4gtrS+dFAyEVUXJQ5eCYv8E5ukl9iy2YrxwHKqzpEipCj7vPGQzjx2LdG3rpZiBz
	7ie+6OMDK/aILh8Jql2vRDyQiwps+YPQ7Zw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id RKiC0wf1Gsgp for <linux-riscv@lists.infradead.org>;
	Tue, 28 Feb 2023 17:22:09 -0800 (PST)
Received: from [10.225.163.47] (unknown [10.225.163.47])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PRGg32nyRz1RvLy;
	Tue, 28 Feb 2023 17:22:07 -0800 (PST)
Message-ID: <efe45f04-3a7a-3e94-ef79-4dcdd6029f44@opensource.wdc.com>
Date: Wed, 1 Mar 2023 10:22:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/3] riscv: Kconfig: Allow RV32 to build with no MMU
Content-Language: en-US
To: Jesse Taube <mr.bossman075@gmail.com>, linux-riscv@lists.infradead.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yimin Gu <ustcymgu@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Waldemar Brodkorb <wbx@openadk.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
 <20230301002657.352637-3-Mr.Bossman075@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230301002657.352637-3-Mr.Bossman075@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_172216_552163_D8F5417E 
X-CRM114-Status: GOOD (  12.01  )
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

On 3/1/23 09:26, Jesse Taube wrote:
> From: Yimin Gu <ustcymgu@gmail.com>
> 
> Some RISC-V 32bit cores do not have an MMU, and the kernel should be
> able to build for them. This patch enables the RV32 to be built with
> no MMU support.
> 
> Signed-off-by: Yimin Gu <ustcymgu@gmail.com>
> CC: Jesse Taube <Mr.Bossman075@gmail.com>
> Tested-by: Waldemar Brodkorb <wbx@openadk.org>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Looks OK.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
