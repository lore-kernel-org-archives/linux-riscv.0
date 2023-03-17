Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA4AC74A5B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 17:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PIVAit654mS+68n67BzZbkY9A9QRTagQl6u5o1PSb48=; b=ccc5MfDTTAT4CI
	R2FowSc0WeqUBGQV2rLyPF84Ayz+Hv+OPGwS87WzoVPKXsr1AX3c6A9ZdG/3bjB/6brQdtxXa04fF
	/I8mnQ+CTEP4FLh8CnXpQp6/QelfsLw6HTLxW9XHwqtufsN4ZaShSB/MvkdGvew2GjtAahKEsfoPi
	RPv39mC/eZjprAYCzNYtW3MfiCnXvKqxqXt06LGoBqyRwDHtDcplNBjsBg1ITnVyeoxq3fVtYNXMo
	IZNncTOlM29b4xe5Qf44vaf6Djc+ltXxb3KXhwGU18G69LI2xLPnVmnziE2tj90i6IUn/Rm5/VGAY
	m6s/UdR1w/AgEiimwc1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdE7W-002vXj-1R;
	Fri, 17 Mar 2023 17:44:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdE7T-002vWj-0C;
	Fri, 17 Mar 2023 17:44:00 +0000
Received: from [192.168.1.90] (unknown [188.24.156.231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4B80866030BF;
	Fri, 17 Mar 2023 17:43:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679075037;
	bh=shPYMuCODMkFNZjlOGCzX1xSspkhpTtkW3qN+SA5vgY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dwBoIYsLp+X4EZ5VGBf9C8ruKohVTzsEh46ctOJfM+2uehmidYGbx2ySpEG6S8XPi
	 PfHEP9cIkHFIDTg/MFj+btE06jGlnQcmTZJy2q/UB+iC9kSbbsm9j1jEGdyk3QDmvG
	 juJn5aJnBZwJVPTXz/VaXKg4bCiAaAfpd3tWNPaEa8wcxtdti81O0x3v+JsC+zwORH
	 2nmd6vw7ir1lsEERedx3pV2T9+xrGXk9wZSOIaDjv7pc6fsqk9p4fnSsp9WpuctEQ7
	 6eTCFCeMGePzaUWoYdEPL/Qntt+hvlfI+a8Yasyqw9Fy2Az0o0IUji6LpEC2reJ9Ls
	 Of5YYPuUEuh9w==
Message-ID: <e81f02f2-e692-e4ef-1510-fdc285dd5964@collabora.com>
Date: Fri, 17 Mar 2023 19:43:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 02/11] dt-bindings: serial: snps-dw-apb-uart: Relax
 dma-names order constraint
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Drake <drake@endlessm.com>, Katsuhiro Suzuki
 <katsuhiro@katsuster.net>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-3-cristian.ciocaltea@collabora.com>
 <3679f2d0-55f0-1710-abc2-b268b6fc6969@linaro.org>
 <8ae57fe3-56aa-7e50-3eaa-a12a40657baf@collabora.com>
 <80796828-7b38-184a-2e8e-3cfe9158b67f@linaro.org>
 <13cb8dbd-994c-4b38-b715-44a3bf3d278d@spud>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <13cb8dbd-994c-4b38-b715-44a3bf3d278d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_104359_227801_89F5EFD9 
X-CRM114-Status: GOOD (  19.85  )
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

On 3/17/23 18:26, Conor Dooley wrote:
> On Fri, Mar 17, 2023 at 04:54:47PM +0100, Krzysztof Kozlowski wrote:
>> On 17/03/2023 11:21, Cristian Ciocaltea wrote:
>>> On 3/17/23 10:31, Krzysztof Kozlowski wrote:
>>>> On 15/03/2023 12:47, Cristian Ciocaltea wrote:
>>>>> Commit 370f696e4474 ("dt-bindings: serial: snps-dw-apb-uart: add dma &
>>>>> dma-names properties") documented dma-names property to handle Allwiner
>>>>> D1 dtbs_check warnings, but relies on a strict rx->tx ordering, which is
>>>>> the reverse of what a different board expects:
>>>>>
>>>>>     rk3326-odroid-go2.dtb: serial@ff030000: dma-names:0: 'rx' was expected
>>>>>
>>>>> A quick and incomplete check shows the inconsistency is present in many
>>>>> other DT files:
>>>>
>>>> Why not fixing the DTS? The properties should have fixed order.
>>>
>>> I was initially concerned about the risk of a potential ABI breakage,
>>> but I think that's not really a problem since dma-names is not directly
>>> accessed in the driver and DT Kernel API doesn't rely on a particular order.
>>>
>>> If there are no objections, I would switch the order in the binding to
>>> tx->rx, since that's what most of the DTS use, and fix the remaining ones.
>>
>> Since we added the order recently, I rather assume it is the correct or
>> preferred one.
> 
> IIRC I checked around the other serial bindings & there was not a
> consistent order that all serial bindings used, so I picked the order that
> was used across the various allwinner boards that do use dma-names.

Thanks for clarifying this, Conor! Would it be fine to switch to tx->rx 
order as it requires less changes to fix the inconsistencies?

> Before changing dts files, it's probably a good idea to make sure that
> the dma-names are not used somewhere outside of Linux.

Right, that means we cannot exclude the ABI breakage concern. Not sure 
how easy would be to actually verify this. Hence I wonder if there is 
really no chance to allow the flexible order in the binding..

> Cheers,
> Conor

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
