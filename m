Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984B1CCD185
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 23:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xgja2Y6RBeaXr+rTrg3TnbyIw39SS1+xrGgb69E66Qw=; b=1AKKX7MfW/xSzf
	TbekIcbWAO2lz+XsUaPa+ybkEgm7/oo4vpjPt0wH4S1EwxDZhLZ8PFVld5aQT0xpS30PbCt2eXMw6
	MQSsglrSugShQAZVdhpghR3C8TElt8A2nCTj8ODe/ZE7e3kxYjfSKEmMF4iPFQfu9UsccII/ht/8z
	bBzaqSPMQtKf1ufIKS5HvVDchsQG7Bj1KcrArqXqiEr17pzYUWtJvbBoa/slfHkjFU6tat6+HK9vy
	r86ydI79fawFCuudht3X98JEAL9oPyTelaIpQd/rOgLI1nYRDBoXmSbkeWM00oIm+W1Feon1SYYwh
	pxclOE8efMSznohNBejw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Mh7-00000009Xew-0dQ5;
	Fri, 10 Oct 2025 23:38:41 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Mh4-00000009Xe0-39kW
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 23:38:40 +0000
Received: from [192.168.0.109] (unknown [114.241.81.247])
	by APP-05 (Coremail) with SMTP id zQCowADnihT2mOlo80OIDQ--.18197S2;
	Sat, 11 Oct 2025 07:38:30 +0800 (CST)
Message-ID: <035e00c5-6144-4eb9-bad8-1f425832d697@iscas.ac.cn>
Date: Sat, 11 Oct 2025 07:38:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] riscv: Use __riscv_has_extension_{likely,unlikely}
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Paul Walmsley <pjw@kernel.org>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Xiao Wang
 <xiao.w.wang@intel.com>, =?UTF-8?Q?Christoph_M=C3=BCllner?=
 <christoph.muellner@vrull.eu>, Vivian Wang <uwu@dram.page>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251011-riscv-altn-helper-wip-v3-0-d40ddaa1985a@iscas.ac.cn>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20251011-riscv-altn-helper-wip-v3-0-d40ddaa1985a@iscas.ac.cn>
X-CM-TRANSID: zQCowADnihT2mOlo80OIDQ--.18197S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtFy5Aw1kCFy8Zw1UtrWkZwb_yoWfAFX_C3
	yUXr9rAan0vFs0gw4rtw17GrZxKay0kFy5Xa4kJrWakr9xWa1kJ392kr9ay3ZxXwsIg3Zr
	Kr95Ja1xZr48ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVAYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxh
	VjvjDU0xZFpf9x07b0SoAUUUUU=
X-Originating-IP: [114.241.81.247]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_163839_161554_0E2C4D5F 
X-CRM114-Status: UNSURE (   7.90  )
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

On 10/11/25 07:35, Vivian Wang wrote:

> There are about a dozen uses of asm goto in arch/riscv just to select
> between two code paths with the alternative mechanism. Convert them to
> the existing helpers __riscv_has_extension_{likely,unlikely}.
>
> In each case, I have preserved the existing code's choice of asm goto
> pattern while picking between "likely" and "unlikely", namely:
>
>   ALTERNATIVE("j %l[no]", "nop", ...)   -> "likely"
>   ALTERNATIVE("nop", "j %l[yes]", ...)  -> "unlikely"
>
> Since the helpers are just implementations of these patterns, the
> performance should be the same as before.
>
> These patches are also available at:
>
> https://github.com/dramforever/linux/tree/riscv/altn-helper/v2
I made a mistake while writing the cover letter, the correct link is:

https://github.com/dramforever/linux/tree/riscv/altn-helper/v3

Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
