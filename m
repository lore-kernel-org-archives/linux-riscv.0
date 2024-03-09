Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB49C54E58
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Mar 2024 02:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=buYhTCWgJp0OCowd9b7lFUkfeLrmoEu0A8r6+VVtHyU=; b=0UR75TmsKfV23X
	j1/mNdiNjznpZ+UK6LCvbaaqAknoNHne7VMwE+1ffFo6fimh7g1UbveviO+AiKB6YBUOyKrB0Zx0F
	KVqa7V9geB3/+LP4R5w6sJLsMOy6TSVdLob6WusDnwJoIE9lPxjskiuEGBY2ZQoucbqEmxEe71vcl
	cPpVVm83BGtZ5ATRGAhjCUOaX8fSTKOEltKylnaHU/kKbF2JKWUrmzj7hKnqNjWJunSLtx9/iGIbd
	7kfXEHCABsP7qCWL5JFIv9JIHOAeJzNRpcJC+WjVi+L3GC14VIbD8WroZYDPRfZzLnud1Ru/thteq
	/Tqcbs0uxiV5HAHbdx/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rimCX-0000000C760-4AhJ;
	Sat, 09 Mar 2024 02:12:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rimCV-0000000C74u-21UR
	for linux-riscv@lists.infradead.org;
	Sat, 09 Mar 2024 02:12:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B475D60E9D;
	Sat,  9 Mar 2024 02:12:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53CF1C43390;
	Sat,  9 Mar 2024 02:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709950358;
	bh=I4Llxs/mkHYecNgMkWeDzb5d5ohYY0ybnjRdQ/uNRRE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=s5HYpbJr79LAi14UNgqaavQgnx50oXr5T6zFxr7/FZFvc7BWMfMyrAWX2i0TLTpOO
	 0dzRE6DbfF4CtZtDywHd6NGz8koqUB7MDEyYydEeFtM2yOjNkH6rsHHwcbirU5HAUH
	 Hwvyj0gcrqL8xWNVzxGYBhEAPuSuihZ3wR1NjpS7dqZ0wc4VECro+jn7hivdDOe2JX
	 edL8GR4Bs+bZ0WqIL6YbhZhb3FMufYlLLJGQ44ejcVTkQl/gCMOhONRHPkxxyyr4v8
	 vQYJqREXAYPpeb/seG9OwdHLTqgOwO8EZv5Rp/g3dYWMRemGYT4pNTByxkbFZfZBac
	 a4Dznd/JwvVdg==
Message-ID: <30eaec5e622af4ebebfab4f8caf72f60.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <cebef63e3e704db58658b5eae3f1fc4dfd1a587e.1708397315.git.unicorn_wang@outlook.com>
References: <cover.1708397315.git.unicorn_wang@outlook.com> <cebef63e3e704db58658b5eae3f1fc4dfd1a587e.1708397315.git.unicorn_wang@outlook.com>
Subject: Re: [PATCH v11 3/5] dt-bindings: clock: sophgo: add clkgen for SG2042
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen Wang <unicorn_wang@outlook.com>
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, devicetree@vger.kernel.org, guoren@kernel.org, haijiao.liu@sophgo.com, inochiama@outlook.com, jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com, robh+dt@kernel.org, samuel.holland@sifive.com, xiaoguang.xing@sophgo.com
Date: Fri, 08 Mar 2024 18:12:36 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_181239_608930_3DB78E6F 
X-CRM114-Status: UNSURE (   4.84  )
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

Quoting Chen Wang (2024-02-19 19:09:18)
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add bindings for the clock generator of divider/mux and gates working
> for other subsystem than RP subsystem for Sophgo SG2042.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
