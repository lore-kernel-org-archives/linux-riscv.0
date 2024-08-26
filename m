Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B97C5321D
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 17:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fyq4V6Mgsw+n7ZIVXGfX4G/DRKR4Fb8A7Dv+UcyhR2k=; b=hKIBe1pWVsgVFq
	7d1T2sHunonRuIrOvWjG9i4uuFUTU9FXHPLKqsJQJVEmnngNUEnNRYZK5ngu6/YdGqx6uBoUCg6jQ
	zFaahD9/SlvcfXRUHlwYbgFuc+n4kXyYyW9nxM41hKn9L9BbsqmZJCp7pflSFGvhL7QDuT41lHOBQ
	0L82LFSQ0yI6Zhonu9avcyWfFaSBS879bs4kwUjSbbU5Dp0SAgupZhIV/maifzgPFGD72j7G3q8jV
	FaSAuU/ina8+JKVDnWxKjDaryeRASTK3aBsMp6jLOl73JwGXP61bkUZ6LWVjAS/Ntq1k8l23aROG9
	fSO7DHKGKsOUmGZ+7OTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sidg4-00000008G3v-1Gnw;
	Mon, 26 Aug 2024 17:38:52 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sides-00000008Fkl-0L5w;
	Mon, 26 Aug 2024 17:37:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 332B7C0008;
	Mon, 26 Aug 2024 17:37:31 +0000 (UTC)
Message-ID: <0e694f91-aaed-4412-a919-49779f37dabc@ghiti.fr>
Date: Mon, 26 Aug 2024 19:37:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes] drivers: perf: Fix smp_processor_id() use in
 preemptible code
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240826165210.124696-1-alexghiti@rivosinc.com>
 <20240826173143.CxUkM4j0@linutronix.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240826173143.CxUkM4j0@linutronix.de>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_103738_295022_71BFB811 
X-CRM114-Status: GOOD (  10.74  )
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


On 26/08/2024 19:31, Nam Cao wrote:
> On Mon, Aug 26, 2024 at 06:52:10PM +0200, Alexandre Ghiti wrote:
>> As reported in [1], the use of smp_processor_id() in
>> pmu_sbi_device_probe() must be protected by disabling the preemption, so
>> simple use get_cpu()/put_cpu() instead.
>>
>> Reported-by: Nam Cao <namcao@linutronix.de>
>> Closes: https://lore.kernel.org/linux-riscv/20240820074925.ReMKUPP3@linutronix.de/ [1]
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Tested-by: Nam Cao <namcao@linutronix.de>
>
> I think this also needs:
> Fixes: a8625217a054 ("drivers/perf: riscv: Implement SBI PMU snapshot function")


Indeed, thanks for the tag!


>
> Best regards,
> Nam
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
