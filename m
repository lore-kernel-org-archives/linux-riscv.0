Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF1ACCA476
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Oct 2025 22:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d9yAo9ExvJWZAYVqU0M9E+rbTnX+SQzwLn2s1diZqJU=; b=qR1FiDx1MjLI4b
	x2D6r1aXj+VLI+lzrLuKDzyEtP6dDnTJGh5Q/vUsSvNNdNbYW23RBvgsPtqBmk3xrYXcjdvUfJ74j
	hqBZn5jZj+OIAfc0fUqdHF8VIj3eNBG1UvCvAM0pATxm2rZY/uUfnKIpbfSLH5S3Rgf22a3oArHRH
	ATGiF0ND/GknFFTkN6vYKmBJib+hQbUEKJN0kmc2TbW9eyP70ffdPOlZWWghjpoPxeW132C9PiTv7
	3PF8nrJraJIr3n80UTsh1LnICZPpz6eXo4YihpcZB2wi+ooWx5DicezZIGRClpRHaCBqfhp9ATrSH
	lPfVqukhRwvvU3yk5lZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7hy1-0000000AsRX-17IA;
	Sat, 11 Oct 2025 22:21:33 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7hxw-0000000AsR9-3wIA
	for linux-riscv@lists.infradead.org;
	Sat, 11 Oct 2025 22:21:31 +0000
Received: from [192.168.0.107] (unknown [114.241.81.247])
	by APP-01 (Coremail) with SMTP id qwCowAB3zZ9c2OpoVz65DQ--.4665S2;
	Sun, 12 Oct 2025 06:21:16 +0800 (CST)
Message-ID: <60069cae-64fb-45de-8b74-e9a42a4b01b6@iscas.ac.cn>
Date: Sun, 12 Oct 2025 06:21:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] riscv: Use __riscv_has_extension_{likely,unlikely}
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Paul Walmsley <pjw@kernel.org>,
 Charlie Jenkins <charlie@rivosinc.com>, Xiao Wang <xiao.w.wang@intel.com>,
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251011-riscv-altn-helper-wip-v3-0-d40ddaa1985a@iscas.ac.cn>
 <20251011-buffing-never-4911edc10600@spud>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20251011-buffing-never-4911edc10600@spud>
X-CM-TRANSID: qwCowAB3zZ9c2OpoVz65DQ--.4665S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr4DKFWfJry7Xw4kZr1fJFb_yoW8WFWkpF
	ZxXas0kF1kJw42q34kZr4DXF4FqrWfGw45JrnxKry7Z390yryfKrsayayY9F1j9rZYqw4j
	vF40vwn3Zr95ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvGb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjxUqiFxDUUUU
X-Originating-IP: [114.241.81.247]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_152129_374642_1DB0A8EC 
X-CRM114-Status: GOOD (  14.32  )
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


On 10/11/25 19:28, Conor Dooley wrote:
> On Sat, Oct 11, 2025 at 07:35:42AM +0800, Vivian Wang wrote:
>> There are about a dozen uses of asm goto in arch/riscv just to select
>> between two code paths with the alternative mechanism. Convert them to
>> the existing helpers __riscv_has_extension_{likely,unlikely}.
>>
>> In each case, I have preserved the existing code's choice of asm goto
>> pattern while picking between "likely" and "unlikely", namely:
>>
>>   ALTERNATIVE("j %l[no]", "nop", ...)   -> "likely"
>>   ALTERNATIVE("nop", "j %l[yes]", ...)  -> "unlikely"
>>
>> Since the helpers are just implementations of these patterns, the
>> performance should be the same as before.
> Can you explain why you're opting for the __ variant, instead of the one
> without __? They should do the same thing in your cases, and resolve to
> the alternative, since the non-alternative function call will be
> unreachable and the assert is compiletime. There's currently no users of
> the __ prefixed versions outside of other extension detection helpers, and
> I think it should probably be kept that way if possible.

I agree that it's preferable to use the non-__ functions. I'll do that
in the next version.

The only real reason I had used the __ versions is so that it would be
equivalent to existing code, although as you said these should be
equivalent since the uses are already guarded behind.

The "pgtable" code currently isn't guarded behind CONFIG_ALTERNATIVE,
although now that I think about it, it should actually be preferable to
do a runtime check than to do a TLB cleaning, so that one should
probably be non-__ as well.

Thanks,
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
