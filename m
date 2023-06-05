Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0050C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 15:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+ldg1HDY8pG6o8HWTnMCymaRI1B7TFMCcEfbqKuDLcA=; b=zbUz2v8IiKp72Z
	sJgL6A4yWF2sovCi7BgHzvVn5StntxMoRkBvEyR15T84VtzKyMIYqD3VfDqolLlnF9tB4fcxS1Dmf
	nNQFBqrD1KKPCTkz+pxYAeNz1ml3DX6uVZad868RxeH39jD/hLtE8J8mQwQtl6J7McZxcGP3rn/rK
	xyA69aH9/u6+o8dbDpt7nmnXz8A4MrjHC8jj2Dq3f9ZpcgnKrhEYPEI/VKThttnbldNjUT02fnfVY
	X4Ml5HGHqRxBwaZkYsn/Bh3v3O97k6XdcwKAbMGHH3aLjRmqetcsCrsoCyHrPbIK/unpsapGiHGCD
	HWHANO2J9i6+cI0AqQCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Z23-002Jnv-2d;
	Tue, 06 Jun 2023 15:55:39 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5yxP-00Dc78-1r
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 01:24:29 +0000
Received: from ed3e173716be.home.arpa (unknown [124.16.138.125])
	by APP-03 (Coremail) with SMTP id rQCowADX3i6eN31kn3EDCw--.9557S2;
	Mon, 05 Jun 2023 09:17:18 +0800 (CST)
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
Subject: Re: [PATCH v2] gpio: sifive: Add missing check for platform_get_irq
Date: Mon,  5 Jun 2023 09:17:10 +0800
Message-Id: <20230605011710.52-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowADX3i6eN31kn3EDCw--.9557S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYf7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2js
	IEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIF
	xwACI402YVCY1x02628vn2kIc2xKxwCY02Avz4vE14v_KwCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr
	0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VU1ItC7UUUUU==
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_182428_003061_EED402FD 
X-CRM114-Status: UNSURE (   7.22  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 06 Jun 2023 08:55:35 -0700
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

On Sun, 4 Jun 2023 04:59:46 +0800 Andy Shevchenko wrote:
>>    224          for (i = 0; i < ngpio; i++) {
>>    225                  chip->irq_number[i] = platform_get_irq(pdev, i);
>>  > 226                  if (chip->irq_number[i] < 0)
>>    227                          return chip->irq_number[i];
> 
> So, this should be
> 
>   ret = ...
>   if (ret < 0)
>     return ret;
>   irq_number = ret;
> 
>>    228          }

I will submit a v3 to fix it.
Also, the same goes for the other patch
"gpio: ath79: Add missing check for platform_get_irq".

Thanks,
Jiasheng


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
