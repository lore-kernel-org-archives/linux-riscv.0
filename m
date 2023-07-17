Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4EBEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 06:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NOLAV8ZcfPt725oCUAXSeYu5NDHg4ofgxtDhvD2XktM=; b=kCHYTn0m4b5Sp4
	3laey/zrVvVmnu5lMt1WCPb73I4tQbEWu301y9IwDewyUBafYUmnE/sNb9i/jQCHD8jiz9vPzA6Mf
	JMIaU6t+yhj/Wi69mRra6N3u3oZRnIrcVYWEd+qgGA6b8LPvl4uvqQ/ZNyCqi9h+p5vAkRj6j8Aau
	LcGXBecZQGBr8f78aYYcRVQdsNrHQ78GQrKRnL4uL0jY9jj6I55alBX48/Pj3I0l66W05vTPXkxKb
	uM5Vc0EZN+ErvkcFkH6ekR2vVGUr6G7wxBAc8KRRNO5MdGPv28ypRcK+m1zmV4iwLbYvV7D1RrLEm
	a0VNJBLXsudW24LiMoQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLHts-003Dyx-0o;
	Mon, 17 Jul 2023 06:40:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLHto-003Dy7-0w
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 06:40:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BC2A060F32;
	Mon, 17 Jul 2023 06:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E34C433C7;
	Mon, 17 Jul 2023 06:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689575999;
	bh=5JoJzx5joWOWwC1I3CKZCIDyHqC15Ue/96/QUCSqZCg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j3noJRlY2sKqDkd7XXeOk7WmnSmVSHHg0IpqwJ6DqVRvrcH3nzuLwaDlmsGmOY+G6
	 9vynavRO2zTFtTO0NJxPis/ea1Qq7dOifE9nl60PFlFiyQ4c+zAO6OIvh9HEGPfFEK
	 saoPoV44vsu75DY8jTdx3j30M4eTRBDTE8VOzZehoh+HQuchGtaubssG2yRM3afguH
	 r0fiA/2kNT2s+/viE+vjcH28zCcAm5G8+JnLWmct+L8kBgUsOcuWh5ko1S8vvuY6XL
	 C7y7alMc6FqWe+IRV+cOuuCWvoGa6DiGmhrzlAw6MmgGM5ICUBvdTrJW00zysjqhKo
	 iTORW+59fLJWA==
Message-ID: <9cd339c0-5e96-beba-e567-0a18d11d06b4@kernel.org>
Date: Mon, 17 Jul 2023 08:39:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/4] riscv: dts: allwinner: d1: Add CAN controller nodes
Content-Language: en-US
To: John Watts <contact@jookia.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-can@vger.kernel.org, linux-riscv@lists.infradead.org,
 Fabien Poussin <fabien.poussin@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>
References: <20230715112523.2533742-1-contact@jookia.org>
 <20230715112523.2533742-3-contact@jookia.org>
 <dd5d7fed-cda1-8ab2-d502-7466def675ac@kernel.org> <ZLQf5AYOCT3EQXyC@titan>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <ZLQf5AYOCT3EQXyC@titan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_234000_371615_DB9737B4 
X-CRM114-Status: GOOD (  15.82  )
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

On 16/07/2023 18:50, John Watts wrote:
> Hello,
> 
> Thanks for spending your time replying to this.
> 
> On Sun, Jul 16, 2023 at 06:35:17PM +0200, Krzysztof Kozlowski wrote:
>> On 15/07/2023 13:25, Jookia wrote:
>>> From: John Watts <contact@jookia.org>
>>>
>>> The Allwinner D1, T113 provide two CAN controllers that are variants
>>> of the R40 controller.
>>>
>>> I have tested support for these controllers on two boards:
>>>
>>
>> Please use scripts/get_maintainers.pl to get a list of necessary people
>> and lists to CC (and consider --no-git-fallback argument). It might
>> happen, that command when run on an older kernel, gives you outdated
>> entries. Therefore please be sure you base your patches on recent Linux
>> kernel.
> 
> I ran this script and selected some of the emails and CCed them, at least I

So the others you skipped  Like let's pick this maintainer, but skip the
others? This is not how does it work. You are expected to CC all
maintainers (and to clarify the obvious: maintainers, not random
contributors). Some maintainers explicitly agree to be skipped, but
where do you see such statement from me?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
