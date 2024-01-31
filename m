Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB0FC47DB3
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 11:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fyGjSD9a5g9p4l4lA54qFRTnV8jWEZ8MKRgCSZ5H2Hs=; b=Nmf4cK5BD2yvDV
	MMVBVxHuuTolSb6p7Kr/Y6j9TGZH0XiziSe8fxd7OjKwKgBp5NIrt0Dge11qL/XQ18RylcSOAQcR2
	CwMFnbflqFU5LFTVZKQrmV2/3eF6cfXTzJaJurnIniagTmrZGGuimbOswD5xm3ou4Y+E9U83CWYiP
	1bbmLb76foufOUCTlzFZaAZ+P6f4gu/7Ec9cHENrTgEKezdyFphdqDiDJMN5tBKLEec3yLKH9nY2m
	VzF2Bl85rMCtJo3ePqVoNF8eaQ1hDK0g0rFscwL5aDgShf+tQz7G5UbR+OJFMrSY9gSACPhrJwn/G
	yzwp9Jo0JHw3uQaVG1pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8mw-000000036IB-3O1y;
	Wed, 31 Jan 2024 11:29:54 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8mu-000000036Fv-023P
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 11:29:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706700589;
	bh=qqKn/biwXyEmqx6ult4octRmHalYzxtwPzsQnX5EA2o=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=teoPUFL/0ROoVKEHUzEGThvqfQM4FRTUMhwZb/7s4qYklFDOJiwzfgPm5vBTBg9dW
	 rZfzVnBk2Sy7oxYMJyq3y1rujW5vOkE+nBv75sx2h80TMYM5DIdDGEa0Vt/E+u8P7q
	 rsCg5vv0M31XaMdu0C8iM3JHmt4uMX9JaDRzOQZgEr1UNwUM4JKdkbdKDxMr27qQ0H
	 yki7hF77YS1zqxMcPsxXq5rTGdXbfZQbk/r7ITp5qM0FUFVR5UbB1wZta38I/RzGZ2
	 llYEurU6M5KBo5M4ytURWLE7LuR85XzmzynsWyeChfXabyHmyQcSe8uUAY2MQ4+VOr
	 uBvL1lvBkA1Xg==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2BEF83780C22;
	Wed, 31 Jan 2024 11:29:48 +0000 (UTC)
Message-ID: <f9fe53a4-c3b0-4e61-b607-40959c2d6c4c@collabora.com>
Date: Wed, 31 Jan 2024 13:29:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] Enable networking support for StarFive JH7100 SoC
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
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
 <ae15ab84-fb1b-4da6-803d-6fd5ad46ce24@collabora.com>
In-Reply-To: <ae15ab84-fb1b-4da6-803d-6fd5ad46ce24@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_032952_259946_659FB8FF 
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

Hi Conor,

On 1/10/24 18:17, Cristian Ciocaltea wrote:
> On 1/10/24 15:57, Conor Dooley wrote:
>> On Tue, Dec 26, 2023 at 02:38:26PM -0600, Emil Renner Berthing wrote:
>>> Cristian Ciocaltea wrote:
>>>> This patch series adds ethernet support for the StarFive JH7100 SoC and
>>>> makes it available for the StarFive VisionFive V1 and BeagleV Starlight
>>>> boards, although I could only validate on the former SBC.  Thank you Emil
>>>> and Geert for helping with tests on BeagleV!
>>>>
>>>> The work is heavily based on the reference implementation [1] and depends
>>>> on the SiFive Composable Cache controller and non-coherent DMA support
>>>> provided by Emil via [2] and [3].
>>>>
>>>> *Update 1*: As of next-20231214, dependencies [2] & [3] have been merged.
>>>>
>>>> *Update 2*: Since v5, the dwmac patches will be handled via [4], while the
>>>>             clock patches subset via [5].
>>>
>>> I'm not sure my rb my sense when I'm listed as a co-developer, but this version
>>> looks good to me:
>>>
>>> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>>
>> Cool, thanks. Cristian, can you ping this series once the binding gets
>> picked up by the netdev folks after the merge window closes?
> 
> Sure, will do!

The binding has been applied on net-next [1].

Thanks,
Cristian

[1]: https://lore.kernel.org/lkml/170669882745.1676.8675995195978883744.git-patchwork-notify@kernel.org/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
