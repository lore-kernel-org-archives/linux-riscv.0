Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82037C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 16:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5di9s4GRSszKIQCAI/3+sEzw27mPYhluTWBScrseFE=; b=SEDIPTqs4+SuBR
	JGxhQomDdhGeDHEJxFBMwNm9OaMtFpNIbeU1IRjKKpYNPxd35dom/rA2zHNN9t1u7JiEbT616CLxy
	4V/zF4dbVkUO2IGgJOdxIWI6EjBq0Xcjc9XsUnIGq276seFtE95xCpnvDI5J5rax1AyhFg6GyMg3h
	Pj6kLNMy+NmpH7YsOItlsF3ZMTZs62zpSlyM8K58CCJAeXJ2bnnNuuetXbURiuaO7Uta6yQJxab3S
	VLFOkdefjhyw+RpwmNM31MnUQ7SDjVxI6oUDEJqZekeE31ao1zkklT28Bo/MWJxLKdecoXgGKx6rm
	O/ziz0XJEcAWaY5gydSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOibD-00DHpo-Bz; Mon, 28 Feb 2022 16:10:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOibA-00DHot-Ql
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 16:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646064609; x=1677600609;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qQF75t3gcJ8otswdA/PKU2/l+dYNyJI3cyfi3dETkyM=;
 b=0cE3+PwRGErUVxEovivJJH1UdVQSY8W2Cz9/AX6ds3y6ZIowTsjtN0jN
 KPVlYF3detwbqptDrWH97pQU7/AbuuxJLUvY+bKzB4o7OxR8aV/f6ccRT
 PMw0BqZxYfHKek04kAV69yrnZlWuISCIthWvt1anfWqjf6nbfThoPHsuq
 gxEyKI60XYtpR9tn3SN6iToJOT3k9sYtT2N4uLloj0yUBtpTOGAP7npm+
 Qvz2oplzCISglH4ZIp06PBS0CC3/PkbFiGF5qm/ujG3IKP1UzclVHWZus
 zU//4cuVIvrQE0fxU8fLFM+7M6eovBjr/VaqDV+zcbIYVyCgjBBMMeSIt w==;
X-IronPort-AV: E=Sophos;i="5.90,142,1643698800"; d="scan'208";a="147518055"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2022 09:09:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 28 Feb 2022 09:09:53 -0700
Received: from [10.12.72.64] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 28 Feb 2022 09:09:50 -0700
Message-ID: <3fedb4c6-baa5-2107-934d-31f8205176b4@microchip.com>
Date: Mon, 28 Feb 2022 17:09:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] SoC: polarfire: fix build warning
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Conor Dooley <mail@conchuod.ie>
CC: Lewis Hanly <lewis.hanly@microchip.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Conor Dooley
 <conor.dooley@microchip.com>, Arnd Bergmann <arnd@arndb.de>, "kernel test
 robot" <lkp@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
References: <20220228152658.3367506-1-arnd@kernel.org>
 <b8eb2e55-b5a8-4a39-86cb-93cadbd67922@conchuod.ie>
 <CAK8P3a1NWuoHVWXVZUGJxSg=D0d3umrMzWqZ75devfOwO-JhuQ@mail.gmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <CAK8P3a1NWuoHVWXVZUGJxSg=D0d3umrMzWqZ75devfOwO-JhuQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_081008_984381_C5DFE87D 
X-CRM114-Status: GOOD (  18.20  )
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

On 28/02/2022 at 16:41, Arnd Bergmann wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Mon, Feb 28, 2022 at 4:35 PM Conor Dooley <mail@conchuod.ie> wrote:
>>
>> I had sent a fix for the build warning on saturday morning - but I guess
>> you missed it.
>>
>> Thanks for fixing it anyway :)
> 
> Thank you for your quick reply. I had indeed missed that fix. You did the
> right thing here by sending it to Nicolas, but he hasn't had a chance to forward
> it to soc@kernel.org yet, so it was not visible in patchwork.
> 
> As it turns out, your patch is correct and mine was wrong anyway, so I
> have now replaced my patch with yours.
> 
> Nicolas, I hope that doesn't cause you extra work. If you have picked it
> up into your tree, you can drop it again from there.

No problem on my side: I was planning to add it to another PR to you but 
it's far easier if you already took it directly.

Thanks Arnd, best regards,
   Nicolas


-- 
Nicolas Ferre

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
