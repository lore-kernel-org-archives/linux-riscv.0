Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C494ECAC5B0
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Sep 2025 11:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67uprzzc96ZgQjNwXqLguWVtCs7H9qHYYoxbNI/Vo6I=; b=NXCZ8YWHeji0Em
	eSyRncLTHNPWE5xqRc1RYXqcFun68olh9CCF/z8laV+caEJQo208SX5zVr9SxZVLP6oGL82G9duCk
	TWGSucBAgKxqrGFDlif+0XgriKfD6iAHixMZGOdzJyeQq1MJJpG5+7OUpOORUjF5qVdUiUHpSOg3z
	ks8u+LMhuM+vSZN6T8mhhUBJsAjH+32XjVYY3sNrIzo5OJJCp9+rGhtEMEkGR1FNXdLNip4yjd0ei
	ShcmCMgRmGVGgMAzSzMurCqfIdMVjNspazW0Os665hvILU+oMQO1bPp+KMBAA2774Wh8UrrhkTPw0
	IPwsxHs/9hcDnAhK3tew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2TTu-00000009SaT-1PD2;
	Sat, 27 Sep 2025 11:52:50 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2TTq-00000009SXk-1ibQ
	for linux-riscv@lists.infradead.org;
	Sat, 27 Sep 2025 11:52:48 +0000
Received: from [192.168.0.102] (unknown [114.241.87.235])
	by APP-03 (Coremail) with SMTP id rQCowAAXZoD7z9doKB1YBw--.16820S2;
	Sat, 27 Sep 2025 19:52:28 +0800 (CST)
Message-ID: <20a5af8e-ba3d-4cca-8fad-2343455aa0aa@iscas.ac.cn>
Date: Sat, 27 Sep 2025 19:52:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yixun Lan <dlan@gentoo.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20250926175833.3048516-1-aurelien@aurel32.net>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250926175833.3048516-1-aurelien@aurel32.net>
X-CM-TRANSID: rQCowAAXZoD7z9doKB1YBw--.16820S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYD7k0a2IF6w4xM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I
	6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr
	1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAa
	Y2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4
	A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY
	1x02628vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCF54CYxVCY1x0262kKe7AKxVWUtVW8Zw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j04E_UUUUU=
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_045246_833404_558CC5E2 
X-CRM114-Status: UNSURE (   7.86  )
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

On 9/27/25 01:54, Aurelien Jarno wrote:

> The BPI-F3 board has a 24c02 eeprom connected to the i2c bus #2. It
> holds board data. This patchset adds support for it.

Reviewed-by: Vivian Wang <wangruikang@iscas.ac.cn>

I guess now it's up to me to figure out how to wire the MAC address
nodes to the two ethernet nodes, after we get 6.18-rc1 of course.

Theoretically it might not matter for Linux since a bootloader can set
mac-address, but I think it would be a nice to have for less
full-fledged boot situations.

Thanks,
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
