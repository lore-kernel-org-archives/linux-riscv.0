Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96723C54E65
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 18:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UJ6mwyQmMjP1OXlHuYXGmm+N9wyXxvaDE+5z0XHPGyc=; b=mFtqlHbVAbO6bo
	9fLlSiRLclKP/u9QqF7YOwl7fuRprL8+ehAAL8600+OMhXtcL9dlSmeiaZYE7pmDT4HLTCJkAgCTh
	+oxwCVcZYkX+d1ukCHhRima3O5+Z610sO09oQ3zYG9+Kd9T0I5/MLhY6LqeE++cX6I3UAV79clonM
	iGV7k1Ypg6YQvlEw+XZfKkKoYHngO3gJjHfdgyQ0/Z9NGSrO+hwY3h/ot5QFYVz8qnHt/Ol8vY3ot
	/kTMsrL6RCEpkKb1rmgxMpX+/BZj3fHlvOpWFrTXAWLOYAbEtLyLnTA529+kEHZEtQlsl4qKBiH4s
	wZRYXVzrg5JAbPYZDy0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIAiK-00000001s2a-0qKW;
	Thu, 22 May 2025 18:32:20 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIAe5-00000001rW9-3dRk
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 18:28:00 +0000
Received: from [198.18.0.1] (unknown [58.60.1.25])
	by APP-01 (Coremail) with SMTP id qwCowADneg2ibC9oVD80AA--.7569S2;
	Fri, 23 May 2025 02:27:48 +0800 (CST)
Message-ID: <2f33a148-2a6d-4906-b2fc-6a8c853af3db@isrc.iscas.ac.cn>
Date: Fri, 23 May 2025 02:27:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: vector: fix xtheadvector save/restore
To: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>,
 Jesse Taube <jesse@rivosinc.com>, Andy Chiu <andybnac@gmail.com>,
 linux-kernel@vger.kernel.org
References: <c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com>
Content-Language: en-US
From: Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>
In-Reply-To: <c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com>
X-CM-TRANSID: qwCowADneg2ibC9oVD80AA--.7569S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYh7k0a2IF6F4UM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j
	6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Jr
	0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv
	0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z2
	80aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF
	7I0E8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxAqzxv26xkF7I0En4kS14v26r1q6r43Mx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	WUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7GYLDUUUU
X-Originating-IP: [58.60.1.25]
X-CM-SenderInfo: xwdq5xprqjuxxxdqqxxvufhxpvfd2hldfou0/1tbiDAYKAWgvPnNZZgABs1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_112758_289423_FDFE2168 
X-CRM114-Status: UNSURE (   2.34  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

I tested this patch with llama.cpp while adding xtheadvector support.
Surprisingly, this bug did not prevent the LLM from generating plausible
output, though the model's responses became noticeably less coherent.

Tested-by: Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
