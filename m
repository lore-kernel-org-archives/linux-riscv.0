Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3962CA0FE9
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 23:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hqqg7qRIgD1rOJunrKb0YLHZOmp9TAKq76gjYlb+bc8=; b=gx1JzUbtYql+DN
	ZZekJGMzDjqrWYQs/J4gDxpXBGcpCbl1ON4dhdGpKMgtkUoYcOb3vz8laLL3OTD9/kSX2M679haim
	XcVMj5jGq6wHppWfgoYtfnt9LVf1im9wAi3zhHekFrOwfIQKmgsszAORhIfgUDzoOCRgwxayyW3BS
	1iEVU006+DYeMAq4MFnwPwZU3btAcbVCPrg7KeFkmGdY5qRWxr8Jhq5nKuEza0wlrV6qmtp1a7Q4O
	uE/0ubn8DQa7sVDsm+1agOh1zzWrLUFv4RI+GcQZndJrDS0nRkeuWyiV42PF2ReCwx7hrFe4LtX0E
	RnZqtsnbyIi6xo4dYOfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEWE-00000000ug9-41mQ;
	Thu, 21 Aug 2025 23:16:30 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up9Pg-000000006e5-3uDj
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 17:49:26 +0000
Received: from [192.168.0.104] (unknown [114.241.87.235])
	by APP-01 (Coremail) with SMTP id qwCowAB3Z6scXKdo5lsdDg--.19280S2;
	Fri, 22 Aug 2025 01:49:17 +0800 (CST)
Message-ID: <871ca57a-2f0a-4b21-be8f-7a26a76fd58d@iscas.ac.cn>
Date: Fri, 22 Aug 2025 01:49:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] riscv: bitops: Use __riscv_has_extension_likely
To: Yury Norov <yury.norov@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Charlie Jenkins <charlie@rivosinc.com>,
 Xiao Wang <xiao.w.wang@intel.com>,
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vivian Wang <uwu@dram.page>
References: <20250821-riscv-altn-helper-wip-v2-0-9586fa702f78@iscas.ac.cn>
 <20250821-riscv-altn-helper-wip-v2-4-9586fa702f78@iscas.ac.cn>
 <aKcwtXDJKRf4O_tF@yury> <4dba27c4-e7a5-4ffc-8073-08a83c68e527@iscas.ac.cn>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <4dba27c4-e7a5-4ffc-8073-08a83c68e527@iscas.ac.cn>
X-CM-TRANSID: qwCowAB3Z6scXKdo5lsdDg--.19280S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYq7k0a2IF6w1UM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j
	6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr
	0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvE
	ncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I
	8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIE
	c7CjxVA2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4c8EcI0Ec7CjxVAaw2AFwI0_Jw0_GF
	yl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUz_MaUUUUU
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_104925_333252_338D722F 
X-CRM114-Status: UNSURE (   3.45  )
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

On 8/22/25 01:46, Vivian Wang wrote:

> [...]
>
> And, codegen-wise:
>
> ALTERNATIVE("j %l[no_alt]", "nop", ...) -> likely() ALTERNATIVE("nop",
> "j %l[has_alt]", ...) -> unlikely()
>
I messed up the formatting, should be:

    ALTERNATIVE("j %l[no_alt]", "nop", ...) -> likely()
    ALTERNATIVE("nop", "j %l[has_alt]", ...) -> unlikely()

Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
