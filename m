Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AE6C7EE29
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 15:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=jZ3NXGydGWtfOPo5NYuShmuyN/Wy/Z9dSyUfYNwR4dk=; b=g9L
	nzlBVUQTWTl7DsQ9RylN6e05zOpVTYjIk9+M+K0WA9oM3vtW0GGDClZg/+b+gyODruz6EyK9vrRI7
	ReT36IRZm4mKVDpf6OrNwJSlgIHvzxwLvOXRlNQpfG4voJtlMu0lZUQh4oeU7wA8xOJ7Vr4ETnmBm
	tPkzAEPp3Hpl/W4MO10eCl2IJlAB0MtAFlWVjTzp1OTnHBDBlDbLHm2YQnUGo6XhRgIZ/wSR742XZ
	d/1VVxcrMYG0WXUQlZK0+vgihmd+GdsvqIc+dkkzWOX7QEG2LPBzCpcxn0EoVhVTVxtXghPghbdeC
	W4DyPG/2Zc1jTfR13kVpH/W7Z76O66A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Z25-002Jor-02;
	Tue, 06 Jun 2023 15:55:41 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6MJO-00HQlU-2j
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 02:20:45 +0000
Received: from ed3e173716be.home.arpa (unknown [124.16.138.125])
	by APP-05 (Coremail) with SMTP id zQCowAC3v4vol35k4p4dDA--.5770S2;
	Tue, 06 Jun 2023 10:20:26 +0800 (CST)
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
Subject: Re: [PATCH v3] gpio: sifive: Add missing check for platform_get_irq
Date: Tue,  6 Jun 2023 10:20:20 +0800
Message-Id: <20230606022020.37863-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAC3v4vol35k4p4dDA--.5770S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZw1DXrykXFW3trW3CFW7urg_yoWfXFc_Kr
	4vkr13uay0krs5J3Z8XrZ8Cr4DZw48Gr4jkr4kCrnaqw43Ja40gaykKF9Yya4aqwn7K347
	WryF939xAry2qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa
	73UjIFyTuYvjfUO_MaUUUUU
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_192043_299700_DF184883 
X-CRM114-Status: GOOD (  14.06  )
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
Content-Type: multipart/mixed; boundary="===============7223659901041230082=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7223659901041230082==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 5 Jun 2023 17:15:53 +0800 Andy Shevchenko wrote:
> On Mon, Jun 5, 2023 at 12:13 ¯PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>>
>> On Mon, Jun 5, 2023 at 4:49 ¯AM Jiasheng Jiang <jiasheng@iscas.ac.cn> wrote:
>> >
>> > Add the missing check for platform_get_irq() and return error code
>> > if it fails.
>>
>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> Actually, the change is functional and now the wrong IRQ numbering in
> the DT will fail the ->probe(). This needs an additional explanation
> in the commit message why it's not a problem.
> 
>> > -       for (i = 0; i < ngpio; i++)
>> > -               chip->irq_number[i] = platform_get_irq(pdev, i);
>> > +       for (i = 0; i < ngpio; i++) {
>> > +               ret = platform_get_irq(pdev, i);
>> > +               if (ret < 0)
>> > +                       return ret;
>> > +               chip->irq_number[i] = ret;
>> > +       }

I will submit a new v3 adding the explanation.

Thanks,
Jiasheng



--===============7223659901041230082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7223659901041230082==--
