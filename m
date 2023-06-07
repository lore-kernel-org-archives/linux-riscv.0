Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72448C7EE2E
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 19:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vw2AqRJJjQrrKzQA9Ng6lvMQYMvCe6JdqGQuubxeS2g=; b=L7om63oZnrGi0V
	nO288xPI48gJCNqmrw9baPQirfbJEC0lRiMC1LxkVkxZN+0+4bfsW+jijJz+keKVxUnwVGTKrfD24
	JFlaBX8TJ41aOFPs+c4C4NJF+AD+Ytxe/FvX3fKibKhInU3zHfH/XkZUwyp2MOTupBcxE5yhAiZA+
	yf5XjZzGjRG6qmuUu8xoW6BESbTTdVKcp0XeG//gaiB0usYJjycb1TQTw+Iu6u+IS7aWBpAUG1l7Y
	wA6wCGWy6fG/53QwDf4RPrE+vG3tXBrGmssBel0FGsPmngpMMqHVqlhxmcxL7GtzVI5KjKe43R3lT
	9IqJgbcce/yK9G7AMJgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7LBl-00AJzH-1D;
	Thu, 08 Jun 2023 19:20:53 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nI2-004fc8-0K
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 07:09:08 +0000
Received: from ed3e173716be.home.arpa (unknown [124.16.138.125])
	by APP-05 (Coremail) with SMTP id zQCowAA3P4vlLIBk8SHQDA--.699S2;
	Wed, 07 Jun 2023 15:08:22 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: andy.shevchenko@gmail.com
Cc: oe-kbuild-all@lists.linux.dev,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH v3] gpio: ath79: Add missing check for platform_get_irq
Date: Wed,  7 Jun 2023 15:08:19 +0800
Message-Id: <20230607070819.48553-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAA3P4vlLIBk8SHQDA--.699S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF15Gw4kWr4kGrWxAF1fJFb_yoW8Gw17pF
	W5KFWvka1kGa1j9wn7ZrWruFW0yan3KryrArWrta45Kwn8ZF9a9r4fKw4Y9FyxCry8Awn2
	vw4ruan0gF9rZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
	nxnUUI43ZEXa7VUjGXdUUUUUU==
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_000906_543267_4D540A5B 
X-CRM114-Status: GOOD (  16.08  )
X-Mailman-Approved-At: Thu, 08 Jun 2023 12:20:52 -0700
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

On Tue, 6 Jun 2023 17:46:36 +0800 Andy Shevchenko wrote:
> Tue, Jun 06, 2023 at 12:28:17PM +0300, andy.shevchenko@gmail.com kirjoitti:
>> Tue, Jun 06, 2023 at 11:18:41AM +0800, Jiasheng Jiang kirjoitti:
>> 
>> Is this v4?
>>

I will submit a v4.
 
>> > Add the missing check for platform_get_irq() and return error
>> > if it fails.
>> > The returned error code will be dealed with in
>> > module_platform_driver(ath79_gpio_driver) and the driver will not
>> > be registered.
>> 
>> No, this functional change and has not to be for the fixes unless _this_ is the
>> regression you are fixing. Did the driver work before at some point as after
>> this change?

I will remove the fixes tag in v4.

> 
> To be more clear, answer to the following questions:
> 1) does driver work with wrong DT configuration?
> 2a) if yes, does it make sense, i.e. the hardware functioning usefully?
> 2b) if yes, can we guarantee there are no broken configurations in the wild?
> 
> Depending on the answers correct your code and/or commit message.
> 
>> Otherwise you have to _justify_ that this functional change won't break
>> existing setups (with broked IRQ in Device Tree, for example).

Sorry, I do not quite understand what you mean.
I have no idea how these questions are related to my patch.
Do you mean I should not fail the ->probe() if there is wrong IRQ numbering in the DT?
Please tell me the relationship between these questions and my patch.

Thanks,
Jiasheng


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
