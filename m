Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7903CC4707C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 16:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z69furHqNhAHz2aScNxMKwWSXQ18FmCWXozW6I+0zRA=; b=EBmK21rr420YdZ
	QsKNCtF1LB5agdb+fsLBF7OOkiYKJydI4VDCTxIdWKQ4nQvzu4QzuqrHaEx7mQf3vwtPgpCKoGln/
	1FULoZv5SXOtxz3fOPnCMwuyyZlZ1y1Ww5jDedB6AuzuH73yT2XCUZA7JsEOHUmrxMmzs6zAfkzx6
	CA9P+iPQC9yyu6td1cd6Sm05jXtyuIPda9qu9JXM4ykVoBip2kpz/p9V2Cp9UrR7rlBURx4DF09uF
	nn2RFYetXVkPAgpn6m5Y3KE1vcIgpQF9GeHELmnbrrF7rRCGR9aGjrvKTCpGKaSySOHLHQBN/AFoc
	Wd53DFomdK3icx8VVkQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNbHF-00Cq9U-1q;
	Wed, 10 Jan 2024 16:18:01 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNbHC-00Cq7P-1G
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 16:17:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704903473;
	bh=+EtOCOtdFVZZmu0/IU+2UTQQvee0ExQODJbm8DNms3E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JncVhoeV20g0Hsq8QnhH1inihewaLE41BKwEyxfDoEHDPo7rbIYK46svcliCMadTZ
	 I6XzbHYPrPvrwwyDFXcqJLNYTw16t+5G9TML8ZXXlXN3/VdmBctUuRt3Rnla/YbBLB
	 IePMdQ8QXupA+EuvfqiE57RuRzyeYt2AVUo3N+zc4XynYb+plyMdQ6DQnH6Kmk+Qmw
	 pTo4Czkfh+9yBombWlsZkthP6rbPd4JpQENQFDHo6rJ1x0xMmmgMeN9lDT2OMiQDlj
	 GoTwG3qJ7e6z9pR1b5YahIItC4Mg1OzqlwRpgjCMHTfHSPMq+dAzGNtUVkGL7BR2K+
	 lAk2xddcXaNBQ==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A3A0737809D0;
	Wed, 10 Jan 2024 16:17:52 +0000 (UTC)
Message-ID: <ae15ab84-fb1b-4da6-803d-6fd5ad46ce24@collabora.com>
Date: Wed, 10 Jan 2024 18:17:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] Enable networking support for StarFive JH7100 SoC
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Jacob Keller <jacob.e.keller@intel.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, kernel@collabora.com
References: <20231220211743.2490518-1-cristian.ciocaltea@collabora.com>
 <CAJM55Z9tKQ_hpxrGUq1Rx1kxzzs-dyd=4yT1z=8B7KQ=CZ4mjA@mail.gmail.com>
 <20240110-quaking-unlisted-dcae7229a9f8@spud>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20240110-quaking-unlisted-dcae7229a9f8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_081758_625066_7FD79FB3 
X-CRM114-Status: GOOD (  12.35  )
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

On 1/10/24 15:57, Conor Dooley wrote:
> On Tue, Dec 26, 2023 at 02:38:26PM -0600, Emil Renner Berthing wrote:
>> Cristian Ciocaltea wrote:
>>> This patch series adds ethernet support for the StarFive JH7100 SoC and
>>> makes it available for the StarFive VisionFive V1 and BeagleV Starlight
>>> boards, although I could only validate on the former SBC.  Thank you Emil
>>> and Geert for helping with tests on BeagleV!
>>>
>>> The work is heavily based on the reference implementation [1] and depends
>>> on the SiFive Composable Cache controller and non-coherent DMA support
>>> provided by Emil via [2] and [3].
>>>
>>> *Update 1*: As of next-20231214, dependencies [2] & [3] have been merged.
>>>
>>> *Update 2*: Since v5, the dwmac patches will be handled via [4], while the
>>>             clock patches subset via [5].
>>
>> I'm not sure my rb my sense when I'm listed as a co-developer, but this version
>> looks good to me:
>>
>> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> 
> Cool, thanks. Cristian, can you ping this series once the binding gets
> picked up by the netdev folks after the merge window closes?

Sure, will do!

Thanks,
Cristian

> Cheers,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
