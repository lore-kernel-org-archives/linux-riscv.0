Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E71CC7EE24
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 15:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v+8hfJ7tKd/VflGjXjLxXXpndaNSmyl4K1NSk0UoFCo=; b=cuV+DcuC7stYpJ
	BxC1XHEqmOmtGUGzFwHr0IWfKhmpZrrwCu6skxIAOnIBPHvLtNKRuJOKrMhO4k1RQr3CrIElvOXqm
	MCH/98MnXhPeTPfUFIJSedoCMZHTSA+M5kEnBUgEc/leL7ZcN3U0jzhx9AcWIxhYMyfWxKc6q9mgk
	a4876p8hPqJd59pYYT2e/OorwRGFL87TYUHHXWGz6mqcXkLc0PUNbqgHc7ekndoFeZUC1Wb8YdJD6
	ZA+HcyqGBMpiUZMoutNc5gM11w0wR6I+nsy/IbhrHX8IzsomuwCPupgFCWJb6cC0sKWw5fzV/DGGJ
	75da41y2GU9kO6ZMtIAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Z25-002Jp8-1s;
	Tue, 06 Jun 2023 15:55:41 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6MKC-00HQrL-0R
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 02:21:33 +0000
Received: from ed3e173716be.home.arpa (unknown [124.16.138.125])
	by APP-05 (Coremail) with SMTP id zQCowADndBAjmH5kCLQdDA--.6981S2;
	Tue, 06 Jun 2023 10:21:26 +0800 (CST)
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
Date: Tue,  6 Jun 2023 10:21:21 +0800
Message-Id: <20230606022121.37914-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowADndBAjmH5kCLQdDA--.6981S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZF1rGw4rXw1UCFy5tFykuFg_yoWfXrX_Kr
	4vkr13uay0krs5J3Z0qrZ8CF4DZw48Gr4jkr4kCrnaqw43Ja40gaykKF9Yya42qwn7K347
	WryF939xAry2qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
	WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
	67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
	IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
	0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
	VjvjDU0xZFpf9x0JUCg4hUUUUU=
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_192132_582387_9D47349A 
X-CRM114-Status: GOOD (  13.72  )
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

On Mon, 5 Jun 2023 17:15:53 +0800 Andy Shevchenko wrote:
> On Mon, Jun 5, 2023 at 12:13 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>>
>> On Mon, Jun 5, 2023 at 4:49 AM Jiasheng Jiang <jiasheng@iscas.ac.cn> wrote:
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


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
