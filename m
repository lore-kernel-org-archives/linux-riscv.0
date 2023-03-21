Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD372C74A5B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 14:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+GTiNsQrjAlQ2NG+e/DgCNQPxdZynS49HB9H6usNPG8=; b=NxZSv6Sd+VXLlA
	2ejUGxiE5w9opgDzYWJYNnZ8417wLFJmHPrErET/32NxXgx814RIlyFv8shJozGsswkffrTSkwI6C
	BHyluIAUmgk2GHXaDxp1hcTZRNM0gw10iieoqiLDlsWmkWpPOaUKwnlGHxTEtE2Y0mbbXOPEO0Jm1
	cm9057Jo+qlR/89SCL2CNaKYoUQ/vlUZMoqO3TwjEFa0Px+Fd44Oosg7c1FYV00pAdSJ1HHStTaGh
	T8AmiTRf+//m4MrDF4DlOPYxP2Gi2vsajeFg4gwym+CVoBeu/0IiduBsuS8rUyld2PSc6BUUnGU82
	dhPwh5xHLsIk/uWuLrkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pecgc-00Cf9C-2Y;
	Tue, 21 Mar 2023 14:10:02 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pecgX-00Cf6V-31;
	Tue, 21 Mar 2023 14:09:59 +0000
Message-ID: <2eeef5a3-cbe7-7a01-489a-87c5ac00adf7@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1679407791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r5H8ASVSpeYXRfPAZlDn5w3NGbDKpfLoIK9F2WWvxoA=;
	b=EGvo+aT61qfofgcSXv3K8G1MMOu3tStw9OEXH1vZb9SoRHZ2B7mO8S7Ao9XQMjibgFggcn
	18eURZVuSD/DA9p6M3KChX3Zrz9mF2GXbX4hV744zO+HObNbQfhGatkZwpwfXX4dyNWCgV
	hejHnLgymlGYeugr9NJTw1nssYjITT4bfXCDZRxGFBmW6E0yaOfUIkRT3b3HeppCbSuQQj
	BcNWv4Yv4a6BYx/QdzvLqypvJkq3Sk7lxpMUPhZEuAImEywmT5A2wDixCRnOJLhGQkne9O
	t+Z/wOBYt/st0WrZyqnK37ngNAJm+HOeTvnglw1IFenWaAbkhUOHLiLT9Rck+Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1679407791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r5H8ASVSpeYXRfPAZlDn5w3NGbDKpfLoIK9F2WWvxoA=;
	b=/MOUIY6Jl9ficd77bzu9nZrapxO1JboBPr+MC/oT4b3oCnf2sw+mCQLVAVMZCTRnryoMMp
	X502lf5YhjeA2VDA==
Date: Tue, 21 Mar 2023 15:09:40 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Donglin Peng <pengdonglin@sangfor.com.cn>, mhiramat@kernel.org,
 rostedt@goodmis.org, linux@armlinux.org.uk, mark.rutland@arm.com,
 will@kernel.org, catalin.marinas@arm.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, tglx@linutronix.de, dave.hansen@linux.intel.com,
 x86@kernel.org, mingo@redhat.com, xiehuan09@gmail.com,
 dinghui@sangfor.com.cn, huangcun@sangfor.com.cn, dolinux.peng@gmail.com
Cc: linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230320131650.482594-1-pengdonglin@sangfor.com.cn>
 <20230320131650.482594-2-pengdonglin@sangfor.com.cn>
From: Florian Kauer <florian.kauer@linutronix.de>
Subject: Re: [PATCH v5 1/2] function_graph: Support recording and printing the
 return value of function
In-Reply-To: <20230320131650.482594-2-pengdonglin@sangfor.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_070958_157150_790A2DCF 
X-CRM114-Status: UNSURE (   9.17  )
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

On 20.03.23 14:16, Donglin Peng wrote:
> When using the function_graph tracer to analyze system call failures,
> it can be time-consuming to analyze the trace logs and locate the kernel
> function that first returns an error. This change aims to simplify the
> process by recording the function return value to the 'retval' member of
> 'ftrace_graph_ent' and printing it when outputing the trace log.

I just came across your patch by pure luck and it helped me a lot
to trace down a problem I had, thanks!

So you can have my
Tested-by: Florian Kauer <florian.kauer@linutronix.de>
 
> New trace options are introduced: funcgraph-retval and graph_retval_hex.

I would personally prefer to have the second option scoped better, so for example
"funcgraph-retval-hex".

Greetings,
Florian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
