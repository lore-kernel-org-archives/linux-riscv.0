Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B588BC3ABAA
	for <linux-riscv@archiver.kernel.org>; Mon,  5 May 2025 16:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6MFj1HeqHbe9G3zc597OWBfnInGGjYfO/TzfVa1XPMQ=; b=FvJ+pAG2QGOKzv
	8R3RfENG1ITzvL8hOjbI+H7r8XHiRQTN7y7zvFfC8ZGB/RQmvU74qBKHTDQ0/RJ2S5UPfYK8IVz1a
	zg0ttt2FtiBSZZLecQr0jKfksi5m2ICMT6KHlnAAs+jbEzDfRjrvo4SYhCP0HAVMUMB2z8CAzy93V
	gzl8MfN85hXTaspfv3IKGpR87ca82mFiK9TS5Rf1LqSHQVpJUW+3IFCMDVTC1Mzcrk60HExsVYpWc
	7eVl0nH4MIPUKcOsam6EJE79mzCkPNkMgx1kAxO7LNBFGW3QneXuh4Vkn+nF4XOUbqyBf8DxbqKHH
	7/HTH/Z9iOXJwgvPyciQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uByMO-00000007vWb-2VqG;
	Mon, 05 May 2025 16:08:04 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uByH4-00000007ucr-2Ziy
	for linux-riscv@lists.infradead.org;
	Mon, 05 May 2025 16:02:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B8F443A39;
	Mon,  5 May 2025 16:02:26 +0000 (UTC)
Message-ID: <c59f2632-d96f-43c6-869d-5e5f743f2dbd@ghiti.fr>
Date: Mon, 5 May 2025 18:02:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Fix kernel crash due to PR_SET_TAGGED_ADDR_CTRL
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250504101920.3393053-1-namcao@linutronix.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250504101920.3393053-1-namcao@linutronix.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeduheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeegvggrvdemvgehvdeimeeiheduudemheefgegtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeegvggrvdemvgehvdeimeeiheduudemheefgegtpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeegvggrvdemvgehvdeimeeiheduudemheefgegtngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepnhgrmhgtrghosehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmp
 dhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehsrghmuhgvlhdrhhholhhlrghnugesshhifhhivhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_090234_806732_678AD719 
X-CRM114-Status: GOOD (  15.89  )
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

Hi Nam,

On 04/05/2025 12:19, Nam Cao wrote:
> When userspace does PR_SET_TAGGED_ADDR_CTRL, but Supm extension is not
> available, the kernel crashes:
>
> Oops - illegal instruction [#1]
>      [snip]
> epc : set_tagged_addr_ctrl+0x112/0x15a
>   ra : set_tagged_addr_ctrl+0x74/0x15a
> epc : ffffffff80011ace ra : ffffffff80011a30 sp : ffffffc60039be10
>      [snip]
> status: 0000000200000120 badaddr: 0000000010a79073 cause: 0000000000000002
>      set_tagged_addr_ctrl+0x112/0x15a
>      __riscv_sys_prctl+0x352/0x73c
>      do_trap_ecall_u+0x17c/0x20c
>      andle_exception+0x150/0x15c


It seems like the csr write is triggering this illegal instruction, can 
you confirm it is? If so, I can't find in the specification that an 
implementation should do that when writing envcfg and I can't reproduce 
it on qemu. Where did you see this oops?

Thanks,

Alex


>
> Fix it by checking if Supm is available.
>
> Fixes: 09d6775f503b ("riscv: Add support for userspace pointer masking")
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Cc: stable@vger.kernel.org
> ---
>   arch/riscv/kernel/process.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 7c244de77180..3db2c0c07acd 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -275,6 +275,9 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg)
>   	unsigned long pmm;
>   	u8 pmlen;
>   
> +	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM))
> +		return -EINVAL;
> +
>   	if (is_compat_thread(ti))
>   		return -EINVAL;
>   

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
