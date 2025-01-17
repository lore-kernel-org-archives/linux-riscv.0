Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EA1C02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 10:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pHJ1YD4jR/Bc/o5YJKrwhQpjuRB5ZhkoW/RFCQnfzoQ=; b=rgfUtfzFtznuoX
	GfoRcxyoSzXq+sOWFTRt5Qvn/2oB41E6N9U4rzXDHczgS6u/Wj5ApUlNvZq13UPXbSqmemnkkU7Mc
	Z3iNHlWbnqIuwjiOjQKgNn+i6Lw9de2z/LeuSFJUHLPg0piIQFx09d9KIkual7J95AhDH5+UTkejZ
	qPToj+Gk4MfgmiBp2fYp2Jhcrzs3dkYXGm9X/+9KQF+IbBh3COb+fqqVcxssJM/WiWlFypkzkJQGB
	PQNPwuTIGk+S1ppsBDNPTvPGFdn84G6PKQtGrwnyw3ysjcXHOboXM/64XAXHdZFEnUmzwUEE6fQrl
	atqozZ3g87rCqWzJiqeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYjhk-000000002Vt-1g85;
	Fri, 17 Jan 2025 10:35:56 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYjhh-000000002Tx-0x9W
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 10:35:54 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1737110151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kJ2kv/1rlnnXeEw5Xrh2XCElzdIj6/ZqbMeXkDt/4sE=;
	b=1ufwZp+MdggMD1gfYxrxBv5RrtmNfABJtcVSxXENkw7ofHq1hNwdimO1I8RWvPhVLFi6pJ
	BbcZ84hriEpEJcB4hCR3Pl0FE17k1jaIRdkNuStD4NNUN27WAXXIGNAsuBdco8Egz0TZtK
	FtWKb8zS0+KLGiKhdvh0o80Lxu7N/nyLQKw79MQu3l3X87+3Hpl6JIiJ0vVEuyA6BmKeR3
	ZXXdNHOodgexoQmHFNGPxXfs5olVV4o++OKYGAQlWgJShG+3ii/9EbA8p5OWFuAMQfTP6h
	BIdYStwvEXtD1zHjhOl3Izjx8LlFGmPdl96IYCkCETz5Wf/kjKvDONNV5919dA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1737110151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kJ2kv/1rlnnXeEw5Xrh2XCElzdIj6/ZqbMeXkDt/4sE=;
	b=H/k683fbRi1hdZKWI7aHHNFZY7076K+lLa7jz8AcCkMrM44Fd/RnkBqAEGuFC+YA7xxw6Q
	y+OP+6x8JJiFPLBg==
To: Charlie Jenkins <charlie@rivosinc.com>, Xu Lu <luxu.kernel@bytedance.com>
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 lihangjing@bytedance.com, xieyongji@bytedance.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip: riscv: Order normal writes and IPI writes
In-Reply-To: <Z4l1fklnUPyTSLO4@ghost>
References: <20250116120710.51673-1-luxu.kernel@bytedance.com>
 <Z4l1fklnUPyTSLO4@ghost>
Date: Fri, 17 Jan 2025 11:35:51 +0100
Message-ID: <87ldv9afso.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_023553_406473_8352CBC7 
X-CRM114-Status: UNSURE (   7.68  )
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

Charlie!

On Thu, Jan 16 2025 at 13:09, Charlie Jenkins wrote:
> On Thu, Jan 16, 2025 at 08:07:10PM +0800, Xu Lu wrote:
>> Replace writel_relaxed() with writel() when issuing IPI to ensure all
>> previous write operations made by current CPU are visible to other CPUs.
>
> Did you experience an ordering issue from this?

That's not the right question.

      CPU 0                     CPU 1
      store A   // data
      store B   // IPI
                                IPI handler
                                load A

The real question is whether the RISC-V memory model guarantees under
all circumstances that A is globally visible before the IPI handler
load. If so, then the writel_relaxed() is fine. If not, the fence is
required.

That's not a question of observation. It's a question of facts defined
by the architecture. People have wasted months to analyze such fails
which tend to happen once every blue moon with no other trace than
"something went wrong" ....

> - Charlie

Please trim your replies...

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
