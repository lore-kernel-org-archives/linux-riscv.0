Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CF6C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 15:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/7ICs/fupgiCWJYmBrQxdfeJjtTzEsndZE/9XBGSpc=; b=NBWbFr6pxiJt/2
	WBdwYFiA4NI1RYes8OKI18lbHUBbBW1lptPGf/0gxsm7VbLf19lmiilRAPV7zYZCvc31PK9iqyTKX
	FhoaX+HpX5avMPGL8xjTAIYk3Nkb2gh8nzNbqBTCmeJschlMwXFYt49D4d1uDfjAO8pDES+U5egf0
	QI3B1+t15/i/qrS9uSxuYKQ+MDTY9OI620k+j34Z4mS7i1Hcm0ZRqBV6Qau68IcQFSFPJet+rQw6Q
	3cW4dOYAhqXlNHL+zXhakHH+sZGJPgUBltyaRYhO+F7FxrAu5p07HtauRpxY+yEz7baa0T5BKTmkU
	UZqgltmK+1FY1w4cEDeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3fUX-0062d1-Jj; Tue, 21 Jun 2022 15:08:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3fUV-0062cP-GK
	for linux-riscv@lists.infradead.org; Tue, 21 Jun 2022 15:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655824110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zUfLoKzkVAlW2Smcn1hCVbKkiGHkkqH1tY8/PyMPFmc=;
	b=fVYjVf4ET9Y1ym79e07b6Io53syXbVR8jq+yUNUsIA06aaG1oZjuTez8Bw8Uqd8ypHUmby
	dQ86I4FaxmbaQeuQuBroZsXVLk7bGZBYAVlP06x65PFvj1p0c5nArAz+nGTe6/MwowKXX1
	EIo6JmFYEaa6K/rSjktFfT8ccH1flBA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-yJ7nw58YM5iNu96pCFOFnw-1; Tue, 21 Jun 2022 11:08:23 -0400
X-MC-Unique: yJ7nw58YM5iNu96pCFOFnw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B19BB185A7A4;
	Tue, 21 Jun 2022 15:08:22 +0000 (UTC)
Received: from [10.22.34.147] (unknown [10.22.34.147])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D60AC492C3B;
	Tue, 21 Jun 2022 15:08:21 +0000 (UTC)
Message-ID: <7adc9e19-7ffc-4b11-3e18-6e3a5225638f@redhat.com>
Date: Tue, 21 Jun 2022 11:08:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V6 0/2] riscv: Support qspinlock with generic headers
Content-Language: en-US
To: guoren@kernel.org, palmer@rivosinc.com, arnd@arndb.de,
 peterz@infradead.org, boqun.feng@gmail.com, Conor.Dooley@microchip.com,
 chenhuacai@loongson.cn, kernel@xen0n.name, r@hev.cc, shorne@gmail.com
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
References: <20220621144920.2945595-1-guoren@kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20220621144920.2945595-1-guoren@kernel.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_080831_687939_CB037ADD 
X-CRM114-Status: GOOD (  10.55  )
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

On 6/21/22 10:49, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Enable qspinlock and meet the requirements mentioned in a8ad07e5240c9
> ("asm-generic: qspinlock: Indicate the use of mixed-size atomics").
>
> RISC-V LR/SC pairs could provide a strong/weak forward guarantee that
> depends on micro-architecture. And RISC-V ISA spec has given out
> several limitations to let hardware support strict forward guarantee
> (RISC-V User ISA - 8.3 Eventual Success of Store-Conditional
> Instructions):
> We restricted the length of LR/SC loops to fit within 64 contiguous
> instruction bytes in the base ISA to avoid undue restrictions on
> instruction cache and TLB size and associativity. Similarly, we

Does the 64 contiguous bytes need to be cacheline aligned?

Regards,
Longman


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
