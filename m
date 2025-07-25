Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BD0C87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 13:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=68QoG1eKg21dzNOWW8jcXYs9iEmWCMNF+XafLjD9ERw=; b=kn59uVEP+nXtAt
	h56QfHpgrtvVwPHNDk9ZgVt3DjkSRDz1HzB+LyUzAkVZME1RePtzGDFWRM0tgaKJUtZENXZnm85Hd
	cEjSg2+8IMWawO9LgZZvz5+6CBqB3W38yqzfEQMcbP+ZPvE8cFkYLYhZ/kQQNbsBPsh/iCHllTl5B
	PnHlUK9VcEh6z+94hfmVAGPR97/inPoqUN7rmPJta8B94Zrv2YzVf05140a4XW0mJhig+g4oDERDF
	AeI/wuXLCKFarqO5r8G0dGdIUmPRFkRZYG9mokd6LNo08f3zDeS7y1IumDRuCS7P8Ac9jJM4kpU/C
	Y69Xtp0yCzbzZxagyEyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufI43-00000009sk3-1XJi;
	Fri, 25 Jul 2025 13:02:19 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufI3z-00000009sjG-1q1u
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 13:02:17 +0000
Received: from localhost (unknown [223.72.91.65])
	by APP-05 (Coremail) with SMTP id zQCowACH3l5KgINoNwX+Bg--.20513S2;
	Fri, 25 Jul 2025 21:02:03 +0800 (CST)
Date: Fri, 25 Jul 2025 21:02:02 +0800
From: Jingwei Wang <wangjingwei@iscas.ac.cn>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	Alexandre Ghiti <alex@ghiti.fr>, ajones@ventanamicro.com,
	Conor Dooley <conor.dooley@microchip.com>, cleger@rivosinc.com,
	Charlie Jenkins <charlie@rivosinc.com>, jesse@rivosinc.com,
	Olof Johansson <olof@lixom.net>, dlan@gentoo.org,
	si.yanteng@linux.dev, research_trasio@irq.a4lg.com,
	stable@vger.kernel.org, alexghiti@rivosinc.com
Subject: Re: [PATCH v5] riscv: hwprobe: Fix stale vDSO data for
 late-initialized keys at boot
Message-ID: <20250725130202.GA53568@iscas.ac.cn>
References: <20250705150952.29461-1-wangjingwei@iscas.ac.cn>
 <mhng-2F811C61-A512-4742-A00D-7D01203DAB14@palmerdabbelt-mac>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-2F811C61-A512-4742-A00D-7D01203DAB14@palmerdabbelt-mac>
User-Agent: Mutt/2.2.14
X-CM-TRANSID: zQCowACH3l5KgINoNwX+Bg--.20513S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYh7k0a2IF6FyUM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j
	6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gc
	CE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxI
	r21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87
	Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4c8EcI0Ec7CjxVAaw2AFwI0_Jw0_GFyl4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2JKsUUUUU
X-Originating-IP: [223.72.91.65]
X-CM-SenderInfo: pzdqwy5lqj4v3l6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_060215_837133_9540AAE2 
X-CRM114-Status: UNSURE (   4.71  )
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

I plan on adding your Co-developed-by tag to the new patch. Thanks again
for the help.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
