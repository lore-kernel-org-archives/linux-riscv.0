Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11EBC07CB1
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 12:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BReZg7HhA3t3KM446DW0E1BqjI4fqXARr+FVESYkFFY=; b=BIFwJEVuijFMai
	Jd//STEkexM9hWhWlNe2R0WdRur9NeAioyNflYV7gGhlSzQE39Gdg2ws7gK/9DKDHwbSrTb+39F3z
	7/a4H0RXL7YCnttvE7RHx+RU9wcCOd1yOnuneaug/qaO7qTbt7mhU4kfJy5eKXmvtzN3echJDiuwh
	w2McjdNc/BSmnN9q9AfWWAyh/7wKNxovfm5CKIux8sCc6lLobzQFIMEe+BJh6plUXDSgcT4AG0UuG
	A5j0QN+E62mWsWYJj7oVC17lIL07hXv3/VeVds/jJZoJrQ8HNhRCokv+CWrHqclUNAj2F2fSzKgqG
	vC4CRss2jSYt3wKhnreA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7b6u-002UWK-0Z;
	Mon, 27 Nov 2023 12:53:12 +0000
Received: from smtpout.efficios.com ([167.114.26.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7b6q-002UTz-0q
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 12:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1701089581;
	bh=WSl+QHzAtYy6sQQZvZFHvD5JXIRKPvHVb76cAb3EPMM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T/b6WydylQPSDPwnZryY/4LIdmNEvSWIeSNeOCkmOa6BPdCro8a0Z5rsvqgrz3Udi
	 ZzhOk6+6Bk1FHYRHCNjgmw/e1jiBj4IrobkRWfvsgT6/2o19+sUcrDIZKjGIoW1Jh0
	 E3797ED0tSDGLD6Z7ZBbf0jcu8dajFtrv2Cxk4FZ3p630DBQBC3R2XDcPfM5PX3m7o
	 MI6cYUFxaOkdyfsFyEKIYlG/EqYmawnbj4wZTanwK37QjEkxwdJYbwrfYo/qsBHbJT
	 s4fUH8jDMNWwXooAQdnM4T8p/uPPvMJTzl+1fhLlcJWP/d5RZ1V4LMlMgc/P+RHZsS
	 tiltlaabC5uTg==
Received: from [172.16.0.134] (192-222-143-198.qc.cable.ebox.net [192.222.143.198])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4Sf59870zLz1dCj;
	Mon, 27 Nov 2023 07:53:00 -0500 (EST)
Message-ID: <1a9275e7-db07-42e8-9c34-8cd6ffe185d3@efficios.com>
Date: Mon, 27 Nov 2023 07:53:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] locking: Introduce prepare_sync_core_cmd()
Content-Language: en-US
To: Andrea Parri <parri.andrea@gmail.com>, paulmck@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu
Cc: mmaas@google.com, hboehm@google.com, striker@us.ibm.com,
 charlie@rivosinc.com, rehn@rivosinc.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231127103235.28442-1-parri.andrea@gmail.com>
 <20231127103235.28442-2-parri.andrea@gmail.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <20231127103235.28442-2-parri.andrea@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_045308_592549_F61946F6 
X-CRM114-Status: UNSURE (   5.59  )
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

On 2023-11-27 05:32, Andrea Parri wrote:
> Introduce an architecture function that architectures can use to set
> up ("prepare") SYNC_CORE commands.
> 
> The function will be used by RISC-V to update its "deferred icache-
> flush" data structures (icache_stale_mask).
> 
> Architectures defining prepare_sync_core_cmd() static inline need to
> select ARCH_HAS_PREPARE_SYNC_CORE_CMD.
> 
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> Suggested-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
