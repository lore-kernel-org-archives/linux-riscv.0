Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A01FB3CE5
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 09:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNB7hbQxx50fOW71YwwU8xgODGXHUJueLrLTh8B0mF4=; b=jyxyL3sgdLIFnzSZFdvcqKVI1/
	4QLIOSe6r2UQuwJgF3rQxIWQQ6rbh7RPWfm8Cn9oexA6cJPU3L6jfPI/R87eFWpUiNkbZs8ZtXYdV
	GkaRTgOESnywsI41eJYh+jvNXBpvqeKbX1t+5/PVZ7df0xz3Jmp0ZCAyKACCpEVCkmniJoVH/RHz3
	Aa4mG09N/kFwSa29BMlw8Kij6jLEzHqm+iSNUnR3JF0P1h/3AFYSQZ6N3D7JUF0aC+4t4jmNRBosD
	TTia0sHJT5n6kkLvr8j2gKFuMqTjxl9aMS+9FlqDxTATNBIO8b/xox2hbgPj97o53514/ZtxCsyvM
	oMCzL5lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78mt-0000000AxE8-1opU;
	Mon, 30 Mar 2026 09:19:59 +0000
Received: from slateblue.cherry.relay.mailchannels.net ([23.83.223.168])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78mp-0000000AxDE-33T2
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 09:19:58 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id F405A8A2DE6;
	Mon, 30 Mar 2026 09:19:53 +0000 (UTC)
Received: from de-fra-smtpout1.hostinger.io (100-122-165-184.trex-nlb.outbound.svc.cluster.local [100.122.165.184])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id B80098A2893;
	Mon, 30 Mar 2026 09:19:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1774862393;
	b=Ojv4nw/nJ2FlBl7DACVPMLFpgUl3ZMZFtXPXJTa59gkUXwtQXcgS9PoGTpYpVwXiOGgLM7
	PYbLDeijs24UXvtuW4CUM0x1EUkgMjSlGe4u7VFS1oN8YV+Yr0klPUS6BGyErfbP113Wdc
	011i7GqZwVAu1wbTJfzpQXkLm9nhEFJei2m1bGyaZTBcBdtljZWlWjSZY3JKDTUx/0MoCz
	+Ackpwny/+cJZ4qH93UVjY82cJ4xK8PRYfdg7KhLNuOun/aQaWXM67l4/UkLNC0Qtg1RVi
	hOec+jsFzcqm1op9Jx5kJdmnAki6FVNZcZ+48ry7icPb7eOPvFu1Y/SlsQj0RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1774862393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=xn8ytO1cIDErWyKt0Aui97W2ei8LosNrt38/Xqsonzc=;
	b=RUp95xcfeT5Z9+ljYt05kwCrTwtBCXfTEkHyH8dGF/ILePW0DugnsFy8Ve6112GsSk9mj+
	4cKXWTvOl9A4ykYVZl00wIg8Tmy69Yj5HKFKsIVguKHvR3Jt1Hc/hhF4PPnyk6LuqByZ46
	i7TiugtxnN1Z3eUV4BfMkcGYzL1hvDcwh5cp5tntzcJ6Q2Srihb4KcxGAkX+WfPEF22W8g
	W/GrtYb4HzdorcQBl9ymFp6v8SpfPYvk2mDGfQ8Aj49j3DHqvGpeKN3LFZM93udYIl9H3m
	zSnAS4ivnT+LI5dPlFL50pW4J/V+D6YYG1LXnFlhpBfG2ukFdL2L6oSpQ5L2/w==
ARC-Authentication-Results: i=1;
	rspamd-7f98bb5847-j2s98;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Cooperative-Gusty: 181656a42e71f35d_1774862393775_183899981
X-MC-Loop-Signature: 1774862393774:2731040531
X-MC-Ingress-Time: 1774862393774
Received: from de-fra-smtpout1.hostinger.io (de-fra-smtpout1.hostinger.io
 [148.222.55.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.122.165.184 (trex/7.1.5);
	Mon, 30 Mar 2026 09:19:53 +0000
Received: from [IPV6:2001:861:4450:d360:dd36:70ba:d0ec:421] (unknown [IPv6:2001:861:4450:d360:dd36:70ba:d0ec:421])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fkm0z1Vp2z3x5h;
	Mon, 30 Mar 2026 09:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1774862388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xn8ytO1cIDErWyKt0Aui97W2ei8LosNrt38/Xqsonzc=;
	b=EsU/fRpB4bMNr1MbcjiJcFxFaQrImPdZP8Esq/9JO/3pYYnkpDwzzei3vtoSLw4TGqJ9Q+
	TNmzMMMjaO57rvtNuIeBP58jf00XaB0KWEpAusBlaZBmzNEAzfQsR5LYAusd9T76XwYYYF
	DgAn+A5DSahBLtvY4N6wz/MWQor5m4DCe4Y9rUN2Rr23LyUhJoNvI1cv4mQ9GZQMgvtgbW
	9+ylL8QYrtLYLOWLNwiUWCEReIJiKHjsiUq3B/9DiwyGpCQEVOr4kUAVQFiYT80CH31YR9
	1wNxXYV5rejUx0twMXT9FiqHulqymKbIrDFsa4NYodEO5fakub07vMFEWnQiwQ==
Message-ID: <17eb09e8-280d-4a41-8a8c-8c8287160e97@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Anand Moon <linux.amoon@gmail.com>, Trevor Gamblin <tgamblin@baylibre.com>
Subject: Re: [PATCH v5 0/9] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
To: Iker Pedrosa <ikerpedrosam@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yixun Lan <dlan@kernel.org>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
Date: Mon, 30 Mar 2026 09:19:47 +0000 (UTC)
X-CM-Envelope: MS4xfAFrx90go/FDvQ2bCCAciVHZL0elbEQjsnIdsRspr6lsybI6rwV23lYlEa2ApzbvkTfe89o15JrIn57IsD7safNPyhyROCHNc3oWDPM8tqByr5qxkPCt N3cQlUyVDJxYfM80eMvfYbsJ1FGwCJ7ejYjJAkAoFJA7FC25rvWdm0IIeAdFGpq8m14+p6O4Eim/8vOdn1M/WK+43lQmNsAlNaknEzm4mRBa9zn/INJ/1PmR VPkeWM0QNjDPNRY8AMEMY9+GQWWf3lUZ+6vWTOuC+R2evMO4JyXUTxNKoKaWeYpo5WGW81yfsiYOYV7lOTGaButPF7e+/zBFx8TbbNu870v4U3d0NCp0ca9j O8LPNwbs9O59fhMxe4CElqmqn7lj69GmTatAWistWMsC1R3PDJYXi7LS3ARNv58JmfSuxhh3Q+rhnnpAiRwwEA8upv3oUsyya3S3/N/J3z5yz29NFy8Tkiyv D4++CwJMR7mJY0sQETdD2XzKvDgfm+q/NU6hO1Tt8B/L039PqEXVVBj5imzVGsoVwvCsOEiY0g5Z9PlfM8XiZXtjXrLuNxvCqor0lrfF2vQJyj0rAnDHHvIH vpTwCGah5jhet9ix3dmQt7FQMl3haN9C12FhnU+3CrFySGdgv6boOmxRgrG4Kw+RfkXpg7Wl+ycoNpH+uPFmhTbFseqWkfKhK9h8CbZsgDxG1ce8yLIJyamv GVZbdVU2Sgm9NifCORf6pVE0vGKKTtPu9AYanBW2z9D943JQovtJOeVZNZCCHAoVritoDEmWW83RPfjUQNWGE3Xp4ir6KWSQsj7xyjZa/+mey9Kxo+M7Jq3B UgbmtygCKATLhIeqPzrji1a+AX7iEzoyDo912b0lJTeZPw2NkIl4x+UFvKWnGUWiVGIHKZHo9/n1PBdt3dLX1A2sPdi7l2OsXhu9/NS41ehwK4/qwaX7fPS+ +ecuYw==
X-CM-Analysis: v=2.4 cv=ALriHGRn c=1 sm=1 tr=0 ts=69ca4033 a=UGNOvlGp38Csz17LMCzH0g==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=d70CFdQeAAAA:8 a=np_wIC4uXEsaGhWusoMA:9 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_021956_813236_9AA61E06 
X-CRM114-Status: GOOD (  12.04  )
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

Hi Iker

On 3/30/26 10:38 AM, Iker Pedrosa wrote:
> This series enables complete SD card support for the Spacemit K1-based
> OrangePi RV2 board, including UHS (Ultra High Speed) modes for
> high-performance SD card operation.
>
> Background
>
> The Spacemit K1 SoC includes an SDHCI controller capable of supporting
> SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
> currently lacks basic SD controller configuration, SDHCI driver
> enhancements for voltage switching and tuning, and power management
> infrastructure.
>
> Implementation
>
> The series enables SD card support through coordinated layers:
>
> - Hardware infrastructure (patches 1-2): Device tree bindings for voltage
> switching hardware and essential clock infrastructure.
> - SDHCI driver enhancements (patches 3-7): Regulator framework
> integration, pinctrl state switching for voltage domains, AIB register
> programming, and comprehensive SDR tuning support for reliable UHS
> operation.
> - SoC and board integration (patches 8-10): Complete K1 SoC controller
> definitions, PMIC power infrastructure, and OrangePi RV2 board enablement
> with full UHS support.
>
> This transforms the OrangePi RV2 from having no SD card support to full
> UHS-I capability, enabling high-performance storage up to 208MHz.
>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
> Changes in v5:
> - Document optional pinctrl-names property supporting "default" and
>    "state_uhs" pinctrl states for coordinating pin configuration changes
>    during UHS-I voltage switching.
> - Link to v4: https://lore.kernel.org/r/20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com


Thanks for the update!
Successfully tested on OrangePi RV2 (on top of mmc-next... doesn't work 
on top of master).

Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>

I'm excited to have this feature in the next kernel.
Cheers
Michael.

-- 
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
