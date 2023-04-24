Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DA5C77B61
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Apr 2023 20:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aUdxtUUC4UfJ/ODD91kuttUN+AI/TGPH5vCN/SDqxHo=; b=JCT7GJlFBh7skB
	ko1qw8MJlN3w2BwfaAclY32Q1wNjOmztTmLR/WiFkKgdq6JwKv82a84ixXKpfybADXzacsnrdt9tM
	BI0QNWq0+wR+mDPq1wI9Hq/VHAErUL2oyTyJpU8uk/afXhu53nowBVcNhfDJzRsrgEvymKjSxia+G
	NrB2qAtAs7fR3vCeXQm3z+qvO/ltVH7ScqqnsAW9GtwQVkGIhUA1ZcVR+XtenS9VR9JHMJSFA0aR3
	gp+inmqCb+O8/T2orfsANRUAGJ6qO626lW3r6Ol3GZs7UFWgQU5NZIVC5REelUzCHdHaerfnd5/8a
	wNGnqlEgCOvmEjtiwbrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pr2iL-00H8Pp-1p;
	Mon, 24 Apr 2023 20:23:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pr2iH-00H8O7-29;
	Mon, 24 Apr 2023 20:23:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 31D8C61F71;
	Mon, 24 Apr 2023 20:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37CD0C433D2;
	Mon, 24 Apr 2023 20:23:02 +0000 (UTC)
Date: Mon, 24 Apr 2023 16:23:00 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Donglin Peng <pengdonglin@sangfor.com.cn>
Cc: mhiramat@kernel.org, huangcun@sangfor.com.cn, dinghui@sangfor.com.cn,
 catalin.marinas@arm.com, mark.rutland@arm.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, bp@alien8.de, tglx@linutronix.de,
 aou@eecs.berkeley.edu, rmk+kernel@armlinux.org.uk, linux@armlinux.org.uk,
 will@kernel.org, peterz@infradead.org, mingo@redhat.com,
 zhangqing@loongson.cn, chenhuacai@kernel.org, kernel@xen0n.name,
 dolinux.peng@gmail.com, x86@kernel.org, linux-trace-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Florian
 Kauer <florian.kauer@linutronix.de>, dave.hansen@linux.intel.com,
 hpa@zytor.com, xiehuan09@gmail.com
Subject: Re: [PATCH v11 1/8] function_graph: Support recording and printing
 the return value of function
Message-ID: <20230424162300.67daca4f@rorschach.local.home>
In-Reply-To: <7eabae11-6a65-c51d-ff39-8205057e497a@sangfor.com.cn>
References: <cover.1680954589.git.pengdonglin@sangfor.com.cn>
	<1fc502712c981e0e6742185ba242992170ac9da8.1680954589.git.pengdonglin@sangfor.com.cn>
	<66fe9288-05ff-1bf3-dd40-e7b3cbdf1af9@sangfor.com.cn>
	<7eabae11-6a65-c51d-ff39-8205057e497a@sangfor.com.cn>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_132305_760063_FB73AA8B 
X-CRM114-Status: UNSURE (   8.23  )
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

On Fri, 14 Apr 2023 15:55:05 +0800
Donglin Peng <pengdonglin@sangfor.com.cn> wrote:

> Hi Steve, could you please correct this mistake before merging it into
> linux-next?

Will do.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
