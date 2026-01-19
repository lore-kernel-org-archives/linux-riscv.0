Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D1ECCF2D2
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 09:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZwKvbeTIImD9qgBppJfWncxlnxoY0rQvglNP7kShMw=; b=Ra9HUAFUt3cWv7
	uZj04/zaMOAObOJi9pdbtbK33T+3sWnIwszfCnVc6RcmemFh74EGndHfTMnRzlqFAeWzrBkQAEZkB
	bguXDubrUarOo83hlYQazVqLI8rKhNJQAOcVKb0Myx3lCX+4UWrwtyaH9rsajaaoahFGu6HG04btM
	jgacF5AJvr/kZ8cDvnWVTmmoPOJ0N/GscjwB5AF+yfac9Z1u1HqSCrRfGqriIX5FvoyHgA+ro68j8
	R9DXu4l8lZKouBjBUE3PEUZurOGmFaqZK/Cmk8zGswDpdoNwTvTkuxujt2oWLxiUjsNVPnqi0/fM2
	UTV8zfapyPL2jhhKYYEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhlVT-00000001dHi-3joQ;
	Mon, 19 Jan 2026 09:25:07 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhlVQ-00000001dH0-2Esr
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 09:25:06 +0000
X-UUID: b6c1495cf51811f0b0f03b4cfa9209d1-20260119
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:856d4e8e-050a-41bd-a991-c28f59ac7069,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:27605276af80639d37ed3d12c814a6b5,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b6c1495cf51811f0b0f03b4cfa9209d1-20260119
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1072398959; Mon, 19 Jan 2026 17:24:54 +0800
Message-ID: <298c3f7c-42d3-4514-864a-104d64363cd8@kylinos.cn>
Date: Mon, 19 Jan 2026 17:24:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/14] riscv: optimize string functions and add kunit
 tests
To: Joel Stanley <joel@jms.id.au>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 kees@kernel.org, andy@kernel.org, akpm@linux-foundation.org,
 ebiggers@kernel.org, martin.petersen@oracle.com, ardb@kernel.org,
 ajones@ventanamicro.com, conor.dooley@microchip.com,
 samuel.holland@sifive.com, linus.walleij@linaro.org, nathan@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org,
 "dfustini@oss.tenstorrent.com" <dfustini@oss.tenstorrent.com>,
 Michael Ellerman <mpe@oss.tenstorrent.com>
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
 <CACPK8Xc2inE8=mbPFt+iTtgOqF_1U9m+76014aDaQxVyTYy2UQ@mail.gmail.com>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <CACPK8Xc2inE8=mbPFt+iTtgOqF_1U9m+76014aDaQxVyTYy2UQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_012504_910601_4DE77276 
X-CRM114-Status: GOOD (  11.24  )
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

On 2026/1/15 12:43, Joel Stanley wrote:
> On Tue, 13 Jan 2026 at 18:58, Feng Jiang <jiangfeng@kylinos.cn> wrote:
>>
>> This series introduces optimized assembly implementations for strnlen,
>> strchr, and strrchr on the RISC-V architecture. To support a rigorous
>> verification process, the series also significantly expands the
>> string_kunit test suite with both functional correctness tests and
>> performance benchmarks.
> 
> I ran the kunit tests on Ascalon, a RVA23 CPU, in emulation. The arch
> optimised version showed significant improvements over the plain
> version.
> 
> I didn't have time to investigate if the numbers made sense. As Andy
> noted, the 'long' benchmark had a much higher ratio improvement than
> the short and medium.
> 
> Tested-by: Joel Stanley <joel@jms.id.au>
> 

Thank you very much for your time and the test results.

You were absolutely right to question the numbers. I've realized there were
some flaws in the previous benchmark logic that led to those inconsistent
ratios. I am sincerely sorry for the confusion this may have caused.

I am currently refining the implementation for v3 to ensure much more
accurate and reliable measurements. I'll send out the updated series
once it's ready.

Thanks again for helping me catch this!

-- 
With Best Regards,
Feng Jiang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
