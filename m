Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506C2C64EC7
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 01:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GP+giryYZjKNLIClaaL7KXL5jE6qKXUQO/iDginr9kM=; b=46rA8kwL4sA3/b
	DFHkkaAX+Uc2RbK6lDfb/xWJYJNYNv0DAmPWqWvGfquAzd+GuvG9FdC4v8JvFwIFaetan/9s+Y90/
	bNyBEcvCYSSvASoUD8lLpU1QvRbijE0CtlYltRYyUYaw2G2GJqYfS3utO7fvyBkI4uuWXNVGoMZRB
	4u4pKcRGxIb2Gz2beKwjFFKMYiyvd6dlTHH4LnbLyYnZEJ1SHq+EL59kGuXMgGYHlW2tcgoIY25sH
	Hi4454TPEeUhQNs9kQ7Lq5r1uLOryEcYqzR4yRPiqHHEMqzLwOhZ/hp9gF0h1x9q0GVUUks4vLxrO
	aezmlJCDD6At2SSxLJvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXB87-00Eipi-L1; Wed, 01 Mar 2023 01:19:39 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXB83-00Eioz-T9
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 01:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1677633575; x=1709169575;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=V6miA8MHSGYGrEI6DdpNRW7sdj0ZbxKqOIltGcg9nuk=;
  b=S+/9vKhs/ODLQv+PGf1poLRt+E1qME0gqU9TQD6c8s5FmJC83Bnv21Cg
   fKKSzq7J0U+mLmQAmyG+IFEJaWNDBcmSbWoJ1/btYnVJAQvXrjsdJ4fiP
   ko3wSSwqwAc7fJf/9eJjxQJrRRKOP5dYboS/CDYwWocqojSrOgFJcLzoE
   rPJuDLGPNA4MRDyglAeOkcFBFFTBloa/Hmn6DSsUovj6wgRQOacImKRra
   NdlDzhYeLGs1WiMqz1qmTXH02zQKwjqtM0Mgw7HZ4dyk4FhyNSBH0cxKo
   QPcbhMpScZl2kMrdX1vKcI87OYSTkF3wL1s5THXyHt81Hp4dKjYRr0cg4
   w==;
X-IronPort-AV: E=Sophos;i="5.98,223,1673884800"; 
   d="scan'208";a="328798250"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 01 Mar 2023 09:19:31 +0800
IronPort-SDR: F2DfHO4+JCIjxagUPYVioUvcVF6opLXu8T/IJKCI+QjXsbiOO+q9b/mM/li8wqKdxOKzjnsow3
 Wr9PKmglLknOrdcHbgk4ur5wynA8yZeLYUdLUVxeMf2aW5tCpkXDSHxWE36yI2PWwleMi+/FBc
 JNytoGRKtXZI/nMsMi4kaZXQtD3Oeh980w/JHIYLnpQfgYJZ2JQafTqfzWCrQYoC++WPgFO7c5
 yQqQyZqLcA4oN9jd8jW2tgvyQX6l042EwH8cIobS1rjos8MW04ddoGpiXclqga95gz1gu8/NpB
 z3M=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Feb 2023 16:30:37 -0800
IronPort-SDR: AlidHf7HkA0Eecm1QBcSoN1Fk1A08zwlnn6PGW8TMeXXlEQ92KxqggOPStDib4KsmZkkfpzeOH
 FRdyhYzq/0wBuqpOKPeuSeVQk6gGKbCA9k4kcKN7FTBd3L8sSnDN9lPG43jKhyzjpojl5istbX
 vm1MG9g090UWSMpgO0JFL5+Wll4I9fNEcrT+9XJpyYGCWTQKdfcAmtYgHNrbFUEmIoesAHVJ7A
 fvGvzubhpOnZPPWZXoOYsKLhOuoVR5GFDPS58Qug3mki61lBx98AIX2NNKZFhLvCK7SKQH5bVM
 308=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Feb 2023 17:19:32 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PRGc30Zmmz1Rwrq
	for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 17:19:30 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1677633570; x=1680225571; bh=V6miA8MHSGYGrEI6DdpNRW7sdj0ZbxKqOIl
	tGcg9nuk=; b=VN0P4sqB/z5su4BfULi1dB/UhJIijWBF0zYcZ7gYhjJpCBz66Oy
	K8tYHQxWl5vxxESY6HehsGMSdJP7twl1dMLiXO2D3BBwLrGYW6jgPMWoakFiXh9f
	GWWUbIiry3GQqYbBnqpEYmHu7pmpvjrFBENqDmVm1jdelhzokjALHFSakDK80DOd
	LlpGJj689B9OzC80nFDwiXCcZp2O0sS/ZV+Sz5zIq8XUpKO0hvS4UJhlLJnqxZXM
	TC1OGiPk0WGMJVyQoryANk5VgECIxkZqF6Gsq0mMoW8c7yj/u59MxJGzyBtoWU6q
	AyUfWQWafGS9OK+eRXFbibeTJj7iJa2nkUw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ZsSi5ulguFEK for <linux-riscv@lists.infradead.org>;
	Tue, 28 Feb 2023 17:19:30 -0800 (PST)
Received: from [10.225.163.47] (unknown [10.225.163.47])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PRGc023zmz1RvLy;
	Tue, 28 Feb 2023 17:19:28 -0800 (PST)
Message-ID: <5a727aa8-4620-7019-4f45-e78ab6c52b04@opensource.wdc.com>
Date: Wed, 1 Mar 2023 10:19:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/3] clk: k210: remove an implicit 64-bit division
Content-Language: en-US
To: Jesse Taube <mr.bossman075@gmail.com>, linux-riscv@lists.infradead.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yimin Gu <ustcymgu@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Waldemar Brodkorb <wbx@openadk.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Conor Dooley <conor.dooley@microchip.com>,
 kernel test robot <lkp@intel.com>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
 <20230301002657.352637-2-Mr.Bossman075@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230301002657.352637-2-Mr.Bossman075@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_171936_039101_CD1AC4BF 
X-CRM114-Status: GOOD (  12.81  )
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
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The K210 clock driver depends on SOC_CANAAN, which is only selectable
> when !MMU on RISC-V. !MMU is not possible on 32-bit yet, but patches
> have been sent for its enabling. The kernel test robot reported this
> implicit 64-bit division there.
> 
> Replace the implicit division with an explicit one.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/linux-riscv/202301201538.zNlqgE4L-lkp@intel.com/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Looks OK to me.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>


-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
