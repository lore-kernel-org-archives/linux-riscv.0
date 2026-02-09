Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC385E78D40
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Feb 2026 08:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9dUlug3G+YyYiTgJFs1ax6maUHcJvl11gKhThPIXLw8=; b=RPhQBfecy17Hp6
	HMQh+m6iWhO1Gho5DdSB1QCusHWKvV2iQLSsmHYh7rxqwrEyEHBWBl/kKBwO4xEaZmowuoLKJOuYs
	ju6ExlDs0q6cSmKpBPlThV8OECZ7Jis/cGWx7eofOg7iR/PgGNuvx3nvs/iBF647su4RRcDS840p9
	u35FeAdQX4QuYsJUX+yZlQ+qV6If1HHpj/N6fd/78rVb4VxgXzETo3dUojaiLfuwFD69p+VR7THW1
	KWoxdCgkfpj3zwSbT5FifvTGw83tg1p58tcxfLBHjHY64A3ySKZQeoDgZfHGIxdRB0B8axjxrn/AW
	QgOdG4jDUTe5gK1ZdrKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMo8-0000000F3DK-4AtK;
	Mon, 09 Feb 2026 08:39:49 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMo4-0000000F3CK-2B3X
	for linux-riscv@lists.infradead.org;
	Mon, 09 Feb 2026 08:39:47 +0000
Received: from [10.213.19.201] (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowACHFQlKnYlpGebgBw--.56384S2;
	Mon, 09 Feb 2026 16:39:38 +0800 (CST)
Message-ID: <aedfd0d8-271c-4b98-a826-a21f3a244a21@iscas.ac.cn>
Date: Mon, 9 Feb 2026 16:39:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: fpu: refine FPU save flow
From: Vivian Wang <wangruikang@iscas.ac.cn>
To: Hui Min Mina Chou <minachou@andestech.com>, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tim609@andestech.com, ben717@andestech.com, az70021@gmail.com,
 Charles Ci-Jyun Wu <dminus@andestech.com>
References: <20260205055342.572379-1-minachou@andestech.com>
 <3ed8b576-723f-4c3b-8394-cd9255c2b63c@iscas.ac.cn>
Content-Language: en-US
In-Reply-To: <3ed8b576-723f-4c3b-8394-cd9255c2b63c@iscas.ac.cn>
X-CM-TRANSID: zQCowACHFQlKnYlpGebgBw--.56384S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYd7k0a2IF6FyUM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj
	6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r
	xl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv
	0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z2
	80aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF
	7I0E8cxan2IY04v7MxkIecxEwVAFwVW8ZwCF04k20xvY0x0EwIxGrwCF54CYxVCY1x0262
	kKe7AKxVWUtVW8ZwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jwCzZUUUUU=
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_003944_939666_FAA9DA70 
X-CRM114-Status: UNSURE (   2.99  )
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

On 2/9/26 16:34, Vivian Wang wrote:
> [...]
>
> This doesn't really make sense. fstate_save checks for ((regs->status &
> SR_FS) == SR_FS_DIRTY). Do you mean that a platform can be !has_fpu(),
> yet come up with a task_pt_regs(...)->status that's SR_FS?

Meant to say: SR_FS set to SR_FS_DIRTY


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
