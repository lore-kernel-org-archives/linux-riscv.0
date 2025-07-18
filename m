Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6849DC83F17
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 09:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c3D2hbz5dyQI3EwnPo9uYiCOJ/c4rz7Kr9OWl8dSbzw=; b=4lPJX2jbKv6zhA
	z37tW+0FiKZGFJwaMSN74zIkdHbGCVLZw/93djuFrmrAr0IQhSk43pnwau/OjFJ7Ta68WjQopQm3H
	pUinDJDHuXuSs/3iJJE/PRl7e/PRFQq2UqgWPS/DSn2DsFMMgM2rP8dO1BLtlW8vUDMiO4hiw7i6O
	1rUgFcIL4989tOQmrLCcXqiGvlWDmJeQhVHwgzpJLaYnO1jX8XTA07FN+Ti8+NccdpM4n0KBN9WDr
	6U7q+2rRbhQK0RClN8HScN2ecb6NpMD3itTV1iWkpEZW21GzYlTyec8F71cu+EfypuTWfJhvwIZeT
	86Hrny5F7JEAexz7cU+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchQN-0000000CBbE-040C;
	Fri, 18 Jul 2025 09:30:39 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uch72-0000000C8PG-0kqf
	for linux-riscv@lists.infradead.org;
	Fri, 18 Jul 2025 09:10:42 +0000
Received: from [192.168.0.106] (unknown [114.241.87.235])
	by APP-05 (Coremail) with SMTP id zQCowAAnulp+D3poBZ4XBQ--.32570S2;
	Fri, 18 Jul 2025 17:10:23 +0800 (CST)
Message-ID: <8ade99a6-84a0-4e69-8ebf-d9dfdc9141b5@iscas.ac.cn>
Date: Fri, 18 Jul 2025 17:10:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: Add OrangePi RV2 board
 device tree
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, dlan@gentoo.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 palmer@dabbelt.com
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250718084339.471449-1-hendrik.hamerlinck@hammernet.be>
 <20250718084339.471449-3-hendrik.hamerlinck@hammernet.be>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250718084339.471449-3-hendrik.hamerlinck@hammernet.be>
X-CM-TRANSID: zQCowAAnulp+D3poBZ4XBQ--.32570S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4kWr4UWw4ruF13AF1fWFg_yoW8Ar1DpF
	Z7uFs3AF1DtF4fKr42g3W8Way8urn5XF47t3y2g3s09Fn8XFyFqwn29ay5uF1UArn3uFWq
	yF4UW348G3Z8ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUqiFxDUUUU
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_021040_589432_58173B71 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Hendrik,

On 7/18/25 16:43, Hendrik Hamerlinck wrote:
> Add initial device tree support for the OrangePi RV2 board [1], which is
> marketed as using the Ky X1 SoC but has been confirmed to be 
> identical to the SpacemiT K1 [2].
>
> The device tree is adapted from the OrangePi vendor tree [3], and similar
> integration can be found in the Banana Pi kernel tree [4], confirming SoC
> compatibility.

This isn't particularly crucial, but I wonder if we can do something
similar to a jh7110-common.dtsi arrangement, where most of the boards
sharing similar designs can also share devicetree source files.

Easier said than done, probably, but I think it should be possible by
just comparing the vendor dts files.

Again this doesn't need to block this patch.

Yixun: I'm assuming you'll be handling this. What do you think about a
k1-common.dtsi?

Vivian "dramforever" Wang

> This minimal device tree enables booting into a serial console with UART
> output and a blinking LED.
>
> Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-RV2.html [1]
> Link: https://www.spacemit.com/en/key-stone-k1 [2]
> Link: https://github.com/BPI-SINOVOIP/pi-linux/blob/linux-6.6.63-k1/arch/riscv/boot/dts/spacemit/k1-x_orangepi-rv2.dts [3]
> Link: https://github.com/orangepi-xunlong/linux-orangepi/tree/orange-pi-6.6-ky [4]
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> ---
> Changes since v1:
> - Added the aliases section to the device tree.
> - Removed the memory section, as it is populated by the bootloader.
> - Replaced unclear copyright similar to the other K1-based boards.
> ---
> [...]


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
