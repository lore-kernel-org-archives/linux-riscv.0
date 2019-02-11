Return-Path: <SRS0=4uv/=QS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A99EC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 13:23:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29D16218A6
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 13:23:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U472RwtP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29D16218A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r24jQ894VFtq3cl5CHi8TzHVopR26o/YOrxszoZVwTQ=; b=U472RwtP7MJi5H
	VOfwRbco9YYnRBahEo9pa/PZvACSDrCCUdPNd+f8bgGPGAHTW7z7e8b3hk5peKwjaxl1meM2LFa9k
	teDRJiHuClhj7G68o8/6x+i8R6x0ETf6RA3xmpmnp+SvdMMiq8oWqrudkRT4XuGCaiF8g8vVhc/vJ
	jdMYIPGMiG2bQcwyBYTy2bwov4oOaXfYrwydhSZGaYMGkL+RDIWzjuwKJb0SSJxxRQrsx41cczZ66
	PouaWJ4biBmemA0yDenlfJGvtO4FnhgluseL/X7GIYjP91Siyuuutoru6pUQPD8MDYoOgSMXOq68f
	tavDKi0puGwz8HxJ3Llg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtBYR-00025t-SD; Mon, 11 Feb 2019 13:23:23 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtBYP-00025D-8f
 for linux-riscv@lists.infradead.org; Mon, 11 Feb 2019 13:23:22 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AD3C2AED6;
 Mon, 11 Feb 2019 13:23:17 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [v3 PATCH 8/8] RISC-V: Assign hwcap only according to boot cpu.
References: <1549590681-24125-1-git-send-email-atish.patra@wdc.com>
 <1549590681-24125-9-git-send-email-atish.patra@wdc.com>
X-Yow: I just heard the SEVENTIES were over!! And I was just getting in touch
 with my LEISURE SUIT!!
Date: Mon, 11 Feb 2019 14:23:15 +0100
In-Reply-To: <1549590681-24125-9-git-send-email-atish.patra@wdc.com> (Atish
 Patra's message of "Thu, 7 Feb 2019 17:51:21 -0800")
Message-ID: <mvmo97iv4qk.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_052321_450240_115126EB 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Patrick =?utf-8?Q?St=C3=A4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Jason Cooper <jason@lakedaemon.net>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Zong Li <zongbox@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Feb 07 2019, Atish Patra <atish.patra@wdc.com> wrote:

> +	while ((node = of_find_node_by_type(node, "cpu"))) {
> +		if (!node) {

That can never be true.

> +			pr_warn("Unable to find \"cpu\" devicetree entry");
> +			return;
> +		}
> +
> +		hartid = riscv_of_processor_hartid(node);
> +		if (hartid < 0)
> +			continue;
>  
> -	if (of_property_read_string(node, "riscv,isa", &isa)) {
> -		pr_warning("Unable to find \"riscv,isa\" devicetree entry");
> +		if (of_property_read_string(node, "riscv,isa", &isa)) {
> +			pr_warn("Unable to find \"riscv,isa\" devicetree entry");
> +			of_node_put(node);
> +			return;
> +		}
>  		of_node_put(node);

[    0.000000] OF: ERROR: Bad of_node_put() on /cpus/cpu@1
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.0.0-rc6-00020-g5903f30f1310 #12
[    0.000000] Call Trace:
[    0.000000] [<ffffffe001076812>] walk_stackframe+0x0/0xa4
[    0.000000] [<ffffffe001076a12>] show_stack+0x2a/0x34
[    0.000000] [<ffffffe0015cf9ea>] dump_stack+0x62/0x7c
[    0.000000] [<ffffffe00149fed4>] of_node_release+0xbe/0xc0
[    0.000000] [<ffffffe0015d465a>] kobject_put+0xa6/0x1e8
[    0.000000] [<ffffffe00149f44e>] of_node_put+0x16/0x20
[    0.000000] [<ffffffe00149b45e>] of_find_node_by_type+0x66/0xa4
[    0.000000] [<ffffffe0010755ca>] riscv_fill_hwcap+0x14c/0x1ce
[    0.000000] [<ffffffe0000026d4>] 0xffffffe0000026d4
[    0.000000] [<ffffffe0000006ec>] 0xffffffe0000006ec
[    0.000000] [<ffffffe000000076>] 0xffffffe000000076

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
