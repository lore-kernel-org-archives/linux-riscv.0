Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5C0D172BE
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 03:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jy0bcgFdVO/oCP7SZIViyerFuutkgTAYKWkVhjTPwqg=; b=lVDFFOQldHQXb8
	H2QWxHh6ZttGzWOykGEvnuSA8UeonBiCVsYRThyhj4nb1AFd/a2B1GbG+dOv6TSBr4WREoKHIrzPk
	n2b+ogNkzfWZdgtNN4ybV9zReTpAr37j4LXE6jMHnuHXt3QZtonOB4ApwxYQKjT8FAUEl/BzRwdPs
	2vB7cJ9lYxKJtTZyNan4Y0gtCEOFZVmoT1XpwwJVqEUUhsnV6gg2rqmYgiTDhQp1s6uduhG3WmY2Z
	9wTrmUX+LrXeirKsFzKZjmUiqZQlUH31k66N/wHo4065yZyOp5JRg/rNEnmq2s/rSyVbL16poPyYh
	+m7u8r88wqs8OENd5hAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmkYm-00000004NrM-3fjm;
	Mon, 02 Feb 2026 03:25:08 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmkYg-00000004Np6-1mOa
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 03:25:07 +0000
X-UUID: a3ea2898ffe611f0b0f03b4cfa9209d1-20260202
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:650c2ba8-0de9-41d5-b1e4-a5d1a5c681a0,IP:0,UR
	L:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:2
X-CID-META: VersionHash:a9d874c,CLOUDID:ac3f64aecb564f5a94453d2e355e200f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:4|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a3ea2898ffe611f0b0f03b4cfa9209d1-20260202
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 707133680; Mon, 02 Feb 2026 11:24:10 +0800
Message-ID: <484c9672-75a6-450f-b677-548000031942@kylinos.cn>
Date: Mon, 2 Feb 2026 11:24:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/8] riscv: optimize string functions and add kunit
 tests
To: Kees Cook <kees@kernel.org>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 akpm@linux-foundation.org, andy@kernel.org, ebiggers@kernel.org,
 martin.petersen@oracle.com, herbert@gondor.apana.org.au,
 samuel.holland@sifive.com, ajones@ventanamicro.com,
 conor.dooley@microchip.com, charlie@rivosinc.com, nathan@kernel.org,
 linusw@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260130025018.172925-1-jiangfeng@kylinos.cn>
 <202601300936.6EDA32E96@keescook>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <202601300936.6EDA32E96@keescook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_192504_720514_64BDE0F0 
X-CRM114-Status: UNSURE (   8.66  )
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

On 2026/1/31 01:37, Kees Cook wrote:
> On Fri, Jan 30, 2026 at 10:50:10AM +0800, Feng Jiang wrote:
>> This series provides optimized implementations of strnlen(), strchr(),
>> and strrchr() for the RISC-V architecture. The strnlen() implementation
>> is derived from the existing optimized strlen(). For strchr() and
>> strrchr(), the current versions use simple byte-by-byte assembly logic,
>> which will serve as a baseline for future Zbb-based optimizations.
> 
> I'm happy with the Kunit elements here, so unless Andy has other
> feedback, please feel free to take this via the riscv tree. (Or if riscv
> maintainers would prefer, I can take it via string.)
> 
> Thanks for working on this!

Thank you very much for your review and the previous suggestions for improvement.
I truly appreciate your patience and guidance throughout this process!

-- 
With Best Regards,
Feng Jiang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
