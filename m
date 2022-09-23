Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2747ECAAD8
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 14:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YfQt9SZ0gHeA3LVAfA811d4wKNzvouHdTs3mPOsUSsQ=; b=NiLyVH1qz1UgxF
	fl/C9E8VWJDwEInTpR9cfgaCPOyrwVl70szE7m2rxHoB1GdRV4BWHuNvpmwVf2kP+a9caU1PwUD0E
	aMlnjLf9R0rpJEenxJFPPFKQ2Fu9CyzwqiKwPrfpvknPlrOkubyltpl7KMEAOdbtssY67j6zQntjt
	cV79/v4gKwuBe/7T/tzAAszcRrFm1aMcIPtkBnoIpDcXjqQrtOPlbMkjV0qhQG1DnlV15LeEcCRTT
	ImxTsuUndyEZaJQ8r+NU/GB/Ky9HdZ9M0hxq5lKhYvLKjPRr2SCfjZf0vPwQVwhqTzGsFl5cFpeSP
	vTYQpKznsiLW2sFo2QVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1objHT-004Yb5-K0; Fri, 23 Sep 2022 14:03:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1objHR-004YaB-JE
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 14:03:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 60D10B81A09;
	Fri, 23 Sep 2022 14:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0609C4347C;
	Fri, 23 Sep 2022 14:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663941826;
	bh=uNH64xYhRKbSQJzlen7Vjk+u1EvoGE8+anLh59m1sl4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tD3ufd43Bo2iK5QOds4TzRAl3PKKZBGP9jMTH0uINTDN/ow6bULydyCEDJnaoHZo7
	 37x/YXoADi+gpeNzUALwmy5Y9gTNP/g6CCsEQtO23l0uBTf2lD2xfdd17MvFGI7Wz1
	 JwcUrcm6oTusI/0zjnYiPrDJXkWmWRYTsMQi2n8vmwdhqNmKqcdv5M+M1OWSZWxGEx
	 6N2kwUVbVhxRnZWQoiC5P4dUVzZ7SlWinLhpa1DyNxJpm2Y6Y6ijbTuU3/SJst1vNc
	 xqQoyjiGcgUKntyPhToR5l75pBMrMqwTGKq1jZt3HIwAuog5Y80B6DSdP2EbMh4ZBF
	 Xk0VqYbCmBirw==
Date: Fri, 23 Sep 2022 23:03:40 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Yipeng Zou <zouyipeng@huawei.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <rostedt@goodmis.org>, <mingo@redhat.com>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <zanussi@kernel.org>,
 <liaochang1@huawei.com>, <chris.zjh@huawei.com>
Subject: Re: [PATCH 1/2] tracing: kprobe: fix kprobe event gen test module
 on exit
Message-Id: <20220923230340.cc2b2c714a4f45624f9f23bf@kernel.org>
In-Reply-To: <20220919125629.238242-2-zouyipeng@huawei.com>
References: <20220919125629.238242-1-zouyipeng@huawei.com>
	<20220919125629.238242-2-zouyipeng@huawei.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_070349_828165_7BD2D352 
X-CRM114-Status: GOOD (  17.63  )
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

On Mon, 19 Sep 2022 20:56:28 +0800
Yipeng Zou <zouyipeng@huawei.com> wrote:

> Correct gen_kretprobe_test clr event para on module exit.
> This will make it can't to delete.

Looks good to me. (actually, both tests will use the same root
trace_array, so the test itself will not fail, but this should
be fixed.)

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thanks!

> 
> Fixes: 64836248dda2 ("tracing: Add kprobe event command generation test module")
> Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
> ---
>  kernel/trace/kprobe_event_gen_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/kprobe_event_gen_test.c b/kernel/trace/kprobe_event_gen_test.c
> index 18b0f1cbb947..e023154be0f8 100644
> --- a/kernel/trace/kprobe_event_gen_test.c
> +++ b/kernel/trace/kprobe_event_gen_test.c
> @@ -206,7 +206,7 @@ static void __exit kprobe_event_gen_test_exit(void)
>  	WARN_ON(kprobe_event_delete("gen_kprobe_test"));
>  
>  	/* Disable the event or you can't remove it */
> -	WARN_ON(trace_array_set_clr_event(gen_kprobe_test->tr,
> +	WARN_ON(trace_array_set_clr_event(gen_kretprobe_test->tr,
>  					  "kprobes",
>  					  "gen_kretprobe_test", false));
>  
> -- 
> 2.17.1
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
