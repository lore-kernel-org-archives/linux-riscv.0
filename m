Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A439C3601A
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 07:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBxVZnRuk3gW8eo27AN6/SNrF25i+eL95XCYzEZyMA0=; b=cL1UdVAE2NPMBBoIGe0MwAN9Sr
	vDCaC8yLOp9IXsDHiFJgH0MYxSjmtb5dhqHVxTPURLcCjhv0CdWPaUpg51vrt+3TpRfneLO4BDJEv
	EPSobTKHfSDakHz2ZhYLZBVRjrfLg2DuERi1SsVO5o2S6q87kYWQRvu136vIZEH/wyabClBt3nXdH
	YAg7NfPhaV52dyciWJXn4pAzagfgif3p9LewKgZHTikyJKtEIY45ab6ReS6aFT+Izqc0t32BvhPUE
	bm1qB1sHrlmA0V0Nme1PhfZ+BQTt5uQScRjTiBEUETB9w2URJn14CQ0bQLdoNF4lGnqtPMfLfxvi4
	2j1SrkZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hHi-0000000Grxd-20FQ;
	Mon, 07 Apr 2025 07:52:46 +0000
Received: from send35.i.mail.ru ([89.221.237.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1grZ-0000000GlC8-1Kms;
	Mon, 07 Apr 2025 07:25:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=k6FsebLrg7ctDUE6wppDzVYatcO3TME3ex+VU2y2SJg=; t=1744010740; x=1744100740; 
	b=RKKbQXkQH7G9TzlKzj7Z/75WLCIbX7IIlx3q4juqjMGpHin3Ml6CYM2DcNbNIfmkvHBWQ82wGw+
	KhH0CSzTDM6v7KfN00biEliiof3dM8Ykl6bnbJArmS8vID2DYPKPc0qDT0FUojmewO5vs2S1+qGRF
	ALu1ntMm3kxWCXrKdXIBJKbf81HYiUI6NZzbeRg4PB7R6dywLxbLxBXB++2Yg9+WNb5RnpQSbHme2
	TRTgUU/MhHuEkCFsX3H1y7jptsUOuLBhC/1yCX5jCiGyp90W8fI67LCA2seUz4f8Vz+a5FP74juYl
	w8Lb1xNs7/UxMpolL0NZfZbhegUg66T95P1Q==;
Received: by exim-smtp-895bd549-2zq5x with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1u1grP-000000004YM-2RmK; Mon, 07 Apr 2025 10:25:36 +0300
Message-ID: <f57e8a74-4124-457c-b5c9-d193505ba093@inbox.ru>
Date: Mon, 7 Apr 2025 10:25:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] time/sched_clock: move sched_clock_register() out of
 .init section
To: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, peterz@infradead.org, elver@google.com,
 namcao@linutronix.de, samuel.holland@sifive.com, daniel.lezcano@linaro.org,
 apatel@ventanamicro.com
References: <20250404050540.13507-1-fido_max@inbox.ru> <8734ekwkqk.ffs@tglx>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <8734ekwkqk.ffs@tglx>
Authentication-Results: exim-smtp-895bd549-2zq5x; auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9D636D1752D35745ABEA41E1096584FC65AC47060FE4698F5182A05F53808504055E70B2624D29F4A3DE06ABAFEAF670507A7D4AB3B778E9F48986B5E6468EC384E897E529B7F4697
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72E4E5201E1C2E308EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371D5B197C6EC5B4BE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B2C025A3674B67DD5A2E070BE324C7D3C428A6C4467C1B0D09BB0A4F435E46E6718B35066C979671628AA50765F7900637A596F99EC23ACBE8389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B1F8789D36234D406A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249D082881546D93491E827F84554CEF50127C277FBC8AE2E8BF1175FABE1C0F9B6AAAE862A0553A39223F8577A6DFFEA7CE31A2885C41F97C443847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A538EAF4A272C10B4F5002B1117B3ED6968F973DFBFD076981AD0703CEB2EF9A27823CB91A9FED034534781492E4B8EEADD0953842B444AAC3BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742424CF958EAFF5D571004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D3474B2583E513159845E51CE5AC2E01B9AD104CE80A7A6E911836DA156F4083C3EA7495C8E6A64FB6B1D7E09C32AA3244C55A9727374D5D39377DD89D51EBB77426BE7A47F26C8637AEA455F16B58544A21E304C330D73BD2357ADA2CBCE38F05762A0BE504FE5E636F1E3461735CEBA253FCF178C6DD14203
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVS2bpaGes9W5uUxxY0MEu7A=
X-Mailru-Sender: 689FA8AB762F7393FE9E42A757851DB6EBF9A7E99EE885915BBD2BAF715B64A64E4050EF2BCA4E6C90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_002545_711662_0CF7E3BE 
X-CRM114-Status: GOOD (  13.66  )
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

07.04.2025 09:26, Thomas Gleixner wrote:
> On Fri, Apr 04 2025 at 08:05, Maxim Kochetkov wrote:
>> The sched_clock_register() is widely used by clocksource timer
>> drivers. The __init prefix forces them to be initialized using
>> macro TIMER_OF_DECLARE with __init prefixed function.
> 
> No, it does not. It requires that they are built in, not more.

Thank you for review.

Let me explain some more. I'm trying to solve similar problem, as 
described at 
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20240312192519.1602493-1-samuel.holland@sifive.com/#25759271

I have both PLIC and clocksource module configured as Y (not m) in 
Kconfig. So both of them are included in kernel Image binary. But I 
still unable to probe clocksource device because it depends of PLIC irq.
And PLIC probes much later than TIMER_OF_DECLARE part of the clocksource 
driver. I tried to convert clocksource driver to regular platform device 
and it works fine except warning:

WARNING: modpost: vmlinux: section mismatch in reference: 
dw_apb_timer_probe+0x136 (section: .text.unlikely) -> 
sched_clock_register (section: .init.text)

Dropping __init from sched_clock_register() helps to solve this issue.

Is there any real point to keep __init in sched_clock_register()? I see 
no issues to call this function at any time later after kernel boot.

Is there better way to solve this issue?

>> So lets drop __init prefix to allow platform device drivers to use
>> sched_clock_register().
> 
> s/So let's//
> 
> "So let's" means nothing.
> 
> Also this has nothing to do with platform device drivers. It's all about
> modules and nothing else.

Anyway, this patch opens opportunity to compile clocksource drivers as 
modules and probe them much later.

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
