Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A49ECD98F3
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 13:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O6th+fcXNYyNRACBrO2qcSRLS6R0luEdsWz84wZw8xI=; b=3WkEseqfCaH92u
	5idZ6o0Gj2injyICnT1kV4PkhiOdeZjRgeTo4YabK/Ln/0hl4+XrC8hHuaPOoX8cf3E3wH1Pvr9Xu
	qRM6GYP7mOanrzD2oKaCQqswcd5DeD1IGDo7FALFvQnciqWbWiKmquNozEbKufX6F6cIz0a2mdHjb
	V5JoIt9g0XNcrWd1iQBUpz9MVTmpIcDlapfS3AIHXCsLnym0Hyl4iIUEhNaFjwpCpXXCLF4VMnn4W
	xa/cXbC+ftOxJQeM+jjtAEI4qIxMEc92skPVMY2KurrmvEhbYPYeCoLeUex6yZssdXsA3O4LjXtJx
	JNlnuE2nb9qeSD7Gag2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCX5-00000001KWV-0ckc;
	Thu, 18 Jun 2026 13:11:47 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCX2-00000001KW9-0TeP
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 13:11:46 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 930B73F867
	for <linux-riscv@lists.infradead.org>; Thu, 18 Jun 2026 13:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1781788299;
	bh=Ikyt66TMlNKpG3woAwTQOhNuC+F7tCqH5WhDe9sQD5w=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=l7lBrjx/i4WZD1f4Wfxq71E84Mk5upv5cobBaRXhDUlFm7y6qHXwZy7DRfz8oJfSK
	 KI7degmeiyUGkduQJC+G2el2K2yUTdq9DP8qx8BaMaRgPahfgkmgS/9LmDGV4hCrwr
	 qgNuwcMqAtDucYs2wUOmGoZlYIQKtgNXSwTWOQtouvtDEQjhQERt+Da5NoYFPDJIjf
	 eE0+/wnVNnsXZBVbg7C/TjrM7wtBVs0g/egEnAOldxr1WboZjg3noItr6WGO7u56uS
	 t1UDo9n0sTQZjAElbRNS3w3fVwmIrd70BzioI5OD9Jk24SuoBM3yGeKWCLOky/iVoC
	 siEjw2MwFHZ5JoRhUefwiLDSYQnUUBuoddHieM5ZWl+qJh74xtqSxxkBVVJ00Wki2d
	 WyJ828StNI2NbPEvnxuLto7dKtxqhSTlXYWMTLBgAMfJxllxACcvYPT5eo0O0Ey0v/
	 iGiH71OW+YkCbAo8kxi0pIWmJa8UdGuMe4ZvIFGvqCqMzWPBY9HN53R/+sYOSZ6fCl
	 ibqanGkJxFb2ihN6MR6XuKVzD5s6AR6h4DETyiI/s4S/WZWoP1N2DmNvw8H8RgiUaW
	 T1AHO4aq5WT2kR/vmsSnKgVo+mtT0sE3cdMUvha5LxZg4wXkwpzr1XFJfKBxHtLXIb
	 TqPsm1ri7AFoAUAsgGmjuDmM=
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c074ac8a2ddso89727366b.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jun 2026 06:11:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781788299; cv=none;
        d=google.com; s=arc-20240605;
        b=iHs2cb0xbnysJPrElbrf2W7VSV1TZ6rLKNEnILsPgNzgMWazH5RuIl3NIBFtqkCH5d
         2BGsiyzJSWXcYQ0h+ZqGfILJrxXm66CGFr2r/uMX133hStZlOgxPwBGbNCPQknH8P1rS
         U82Hfe8CuTJn2/3zWcd22n9nTKgbJks0yTRuTMEOMVumA2BZpwgNjIHZ7OxxL9NKnxad
         J2gmPPydzFSECs4OBU7/jRsFjN1DjH7V+Xsv+KxnM36mf3zMY8kk2QjhPDkncmSaVuaL
         COK7cYTnfgMs0hO3E4rELGNcwLW1zqdc9n+J71FUJ6AGbgUYQdw8YsGL7hNHK5zi6gH7
         B/kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version;
        bh=Ikyt66TMlNKpG3woAwTQOhNuC+F7tCqH5WhDe9sQD5w=;
        fh=2qqJb9Umhb10lrQjB1xpo/UPOXgkxZAPXr1b3/k157k=;
        b=SUnJBEndjmAVyWas1lk0qBS5EbgvR8tR/kn8vU+1CGD38Kw00flrKaLJMVJuVcSB+3
         Q10TZiXBPWDdfYtvuhNvN/15MTIhTRlATElQzbgnkDVsf71W53LlrePu6EXC6Fcnogor
         lOQt6g5kWOrTQP8U2+27aS9mqp8RJXJEZjqkp2Q1bVml0Ytv6CT1KFVp6Sk1juhYm3ef
         yNamfJDYj+zntFXWdcJGNiD2NFJCzQMRcDzNvymSagpyTX3lQ4nLZXPBXXAsMkcTsxs0
         RHaaN4THSi3uylcnkgL4vWFPRlXc3y4WUI9LxkIOJ5pxhfhIBbVb2dynpGko7ukeFpL/
         mbKQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781788299; x=1782393099;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ikyt66TMlNKpG3woAwTQOhNuC+F7tCqH5WhDe9sQD5w=;
        b=c1VHYWHg24j+bqhJF3UMdA2/CyUPRL25nW4/apQgig4DUhI259CBVMz0DPQ6/IPGh0
         XwnvlX5H7G56uir7OSTwKA4Icv/5KRe5Q0JCQl3IjLnsgdS4BIpRuS7ZhsmOUvXZ4lrR
         /WsrBZPCs8zie3WW7SvtkQDdRQbQKWmvsfiPO/HIsQDYgev1wukV07sMaWt4okLCfPic
         SnfhFsoyqmuqnPIGE5NZGr2a1HTvhJQ3KeZ40OgGeMH2K9JmOMhaxMeFIJjA4kei7lXp
         6iad0EvkbW82zZUPpDUxZeq7EVAOpyDqFcISrr5vp9yTtWjNvNSuONg8yyhgQCT2nME1
         yUlw==
X-Forwarded-Encrypted: i=1; AFNElJ/u0v+jeOyO9ekkx0fKfDNfLEctZEu/+9dBfAqCNe8fC40KPTcccfavHB3SGRwXyd6hwiwXzgvePSwgqA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/xzb/IJcJqbOCZF6JDDadoOJ96c5gQO2E50wI8GMgKZtFEHkj
	lIFOhaVUEEySBJvEMedX4cP+8I7exLWoOune07OPVHxvZdhS6361KUti3qNZnGt85JMbgSNGlkZ
	XiMzF66N2yoSS/91LzYKXdN8ElHIbPMleFtMXq4VAxyWWrUPPSrlKHFSBXuzTfWnRRRAIkuggHS
	JeQvgu+dGMzLaEQ6ptP9+wb8ZRcjqVSd2y/6+4jigs5QiLcxMCbr36HUX74GB5
X-Gm-Gg: Acq92OERH3YYBUJeTW8gnhTTOWD3hiFahHgbJf3mBfydsDJICGvU6V9lSAo4FpVzRC/
	uBeePsu5VzIQb625Yiz+GEczTPhEJmCROKMh7QySrt6ZEJGkp2RLRS+SQjneNuznsMpG376bGfF
	Hew5lZD8F4wVAZo53ZPW2ybDc3kLF1uWp1WMVp1Pz2JpbH4+R9nrYcZBx7cI9AoS/teQ==
X-Received: by 2002:a17:906:cc47:b0:bec:e6ae:2f69 with SMTP id a640c23a62f3a-c05a4720184mr330889366b.30.1781788299098;
        Thu, 18 Jun 2026 06:11:39 -0700 (PDT)
X-Received: by 2002:a17:906:cc47:b0:bec:e6ae:2f69 with SMTP id
 a640c23a62f3a-c05a4720184mr330886266b.30.1781788298585; Thu, 18 Jun 2026
 06:11:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 18 Jun 2026 08:11:36 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 18 Jun 2026 08:11:36 -0500
MIME-Version: 1.0
In-Reply-To: <20260320222916.19987-1-boqun@kernel.org>
References: <ab2yd35rm6OgZUmb@gpd4> <20260320222916.19987-1-boqun@kernel.org>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Thu, 18 Jun 2026 08:11:36 -0500
X-Gm-Features: AVVi8CdNkaVYBWAhyDgLK0vLSd4h3zxECQx9FcmqMplPRvrgTirU1SNRffTdnLU
Message-ID: <CAJM55Z-hiNDuu5UwoBe7m0wq+_WJrRY0cwopALUgpG+r3ixj8g@mail.gmail.com>
Subject: Re: [PATCH v2] rcu: Use an intermediate irq_work to start process_srcu()
To: Boqun Feng <boqun@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, frederic@kernel.org, 
	neeraj.iitr10@gmail.com, urezki@gmail.com, boqun.feng@gmail.com, 
	rcu@vger.kernel.org, Tejun Heo <tj@kernel.org>, bpf@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrea Righi <arighi@nvidia.com>, 
	Zqiang <qiang.zhang@linux.dev>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_061144_546704_B3AC8A26 
X-CRM114-Status: GOOD (  11.15  )
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

Quoting Boqun Feng (2026-03-20 23:29:16)
> Since commit c27cea4416a3 ("rcu: Re-implement RCU Tasks Trace in terms
> of SRCU-fast") we switched to SRCU in BPF. However as BPF instrument can
> happen basically everywhere (including where a scheduler lock is held),
> call_srcu() now needs to avoid acquiring scheduler lock because
> otherwise it could cause deadlock [1]. Fix this by following what the
> previous RCU Tasks Trace did: using an irq_work to delay the queuing of
> the work to start process_srcu().
>
> [boqun: Apply Joel's feedback]
> [boqun: Apply Andrea's test feedback]
>
> Reported-by: Andrea Righi <arighi@nvidia.com>
> Closes: https://lore.kernel.org/all/abjzvz_tL_siV17s@gpd4/
> Fixes: commit c27cea4416a3 ("rcu: Re-implement RCU Tasks Trace in terms of SRCU-fast")
> Link: https://lore.kernel.org/rcu/3c4c5a29-24ea-492d-aeee-e0d9605b4183@nvidia.com/ [1]
> Suggested-by: Zqiang <qiang.zhang@linux.dev>
> Tested-by: Andrea Righi <arighi@nvidia.com>
> Signed-off-by: Boqun Feng <boqun@kernel.org>

Thanks for the patch, which is now upstream as
7c405fb3279b ("rcu: Use an intermediate irq_work to start process_srcu()")

Unfortunately it seems to halt booting on the Allwinner D1 single-core RISC-V
SoC both on the 7.0 and 7.1 kernels:

https://esmil.dk/d1-7.0.txt
https://esmil.dk/d1-7.1.txt

Reverting this patch seems to fix the issue although it then breaks when loading
modules which is can be fixed by reverting:
d6e152d905bd ("clockevents: Prevent timer interrupt starvation")

This might be a side-effect of reverting this patch though.

We'd really like to continue support for this SoC on the 7.0 kernel, but since
this patch is a bugfix just shippping the revert doesn't sound appealing.
So some guidance would be much appreciated, thanks!

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
