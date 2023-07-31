Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAC9C00528
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 15:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFhb9t18xjp8HEqnJoSVbAELnBMIYLFr/tXV6otLZgc=; b=FqcY+mncvr0PrY
	rkig3ysqLQIhL/WykV1q7PuKJZlvhmvOrGJMBFRCL0QE2qSjKLWPlRLllKJU4IHHT4kFKYZ3zTa04
	U02FlDBCKM5fCYx+iRkMoGYRPfdLA4/sUy9cTb0V3jJrLn3YZBjVK68u9wpvaMzQgT6Hr0WYoMBHr
	79MXybWEqINokG8J9PwUQSmVGaW7eF3gqDqLfsffcNN5Po34e752z1jR7DH0kCykIglfWKsWTo/p8
	YuTYHN8z2sNRRIGNYKAafojqO3D63+OanejMWRvuf0w0VAAQtfJ8kCYDiMPE2GwKErlmpgRrwBilR
	QnnA0Fhwey5hGs8l8QcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQVBJ-00GOAm-0A;
	Mon, 31 Jul 2023 15:51:37 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQVBF-00GO9i-2s
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 15:51:36 +0000
Received: from [192.168.0.107] (unknown [111.197.209.91])
	by APP-03 (Coremail) with SMTP id rQCowAC312Re2MdksdyvDw--.16505S2;
	Mon, 31 Jul 2023 23:50:54 +0800 (CST)
Message-ID: <c2077e70-98ef-158f-fc82-4ed484f7ee37@iscas.ac.cn>
Date: Mon, 31 Jul 2023 23:50:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] riscv: Handle zicsr/zifencei issue between gcc and
 binutils
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Bin Meng <bmeng@tinylab.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org,
 Guo Ren <guoren@kernel.org>
References: <20230731095534.22842-1-xingmingzheng@iscas.ac.cn>
 <20230731150511.38140-1-xingmingzheng@iscas.ac.cn>
 <20230731-legume-commend-9aafd84c1fb2@spud>
From: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
Organization: ISCAS
In-Reply-To: <20230731-legume-commend-9aafd84c1fb2@spud>
X-CM-TRANSID: rQCowAC312Re2MdksdyvDw--.16505S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw4kuF4rKFyDXr1rXw17Awb_yoW5Gryrpr
	WfuF1Durs5Kw18J3Z5JF1UX3WYgrZ3G342gF15t34DWrs5GFykKr4S9w43uFn8ZFn2gr1Y
	vrn29FZYgw1DAaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvCb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
	nxnUUI43ZEXa7IU56c_DUUUUU==
X-Originating-IP: [111.197.209.91]
X-CM-SenderInfo: 50lqwzhlqj6xxhqjqxpvfd2hldfou0/1tbiCgkJCmTHu5c2qAAAsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_085134_293602_05DABADD 
X-CRM114-Status: GOOD (  14.07  )
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

On 7/31/23 23:24, Conor Dooley wrote:
> On Mon, Jul 31, 2023 at 11:05:11PM +0800, Mingzheng Xing wrote:
>> Binutils-2.38 and GCC-12.1.0 bumped[0][1] the default ISA spec to the newer
>> 20191213 version which moves some instructions from the I extension to the
>> Zicsr and Zifencei extensions. So if one of the binutils and GCC exceeds
>> that version, we should explicitly specifying Zicsr and Zifencei via -march
>> to cope with the new changes. but this only occurs when binutils >= 2.36
>> and GCC >= 11.1.0. It's a different story when binutils < 2.36.
>>
>> binutils-2.36 supports the Zifencei extension[2] and splits Zifencei and
>> Zicsr from I[3]. GCC-11.1.0 is particular[4] because it add support Zicsr
>> and Zifencei extension for -march. binutils-2.35 does not support the
>> Zifencei extension, and does not need to specify Zicsr and Zifencei when
>> working with GCC >= 12.1.0.
>>
>> To make our lives easier, let's relax the check to binutils >= 2.36 in
>> CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI. For the other two cases,
>> where clang < 17 or GCC < 11.1.0, we will deal with them in
>> CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC.
>>
>> For more information, please refer to:
>> commit 6df2a016c0c8 ("riscv: fix build with binutils 2.38")
>> commit e89c2e815e76 ("riscv: Handle zicsr/zifencei issues between clang and binutils")
>> Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc [0]
>> Link: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=98416dbb0a62579d4a7a4a76bab51b5b52fec2cd [1]
>> Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=5a1b31e1e1cee6e9f1c92abff59cdcfff0dddf30 [2]
>> Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=729a53530e86972d1143553a415db34e6e01d5d2 [3]
>> Link: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b03be74bad08c382da47e048007a78fa3fb4ef49 [4]
>> Link: https://lore.kernel.org/all/20230308220842.1231003-1-conor@kernel.org
>> Link: https://lore.kernel.org/all/20230223220546.52879-1-conor@kernel.org
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
> This looks good to me now, thanks! Hopefully the next time we look at
> this code is removing support for binutils 2.35 :)

Thank you for the quick reply.
Hopefully no more "with weeping and gnashing of teeth". ;

> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> Cheers,
> Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
