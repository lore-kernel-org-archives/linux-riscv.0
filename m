Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79358C678D5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 17:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yUzieVhJyAry2yIrRBNh69xr8v+yk6rFtZH5Iero9AI=; b=W5IYTQtf1+bIV5
	/vRxxbWfsmxZ6QkX2H/AGg2zo3tus1CxiTfZtPwY360cuAElQc5TYz4PRj+ShsBWv6rItbXVN7kCA
	NoHMNUiRh7S7UgWvejjM5zTm8r9dG63t0Op+fDLRY9cCraQtdQMUPYNWrYkPPp/dBnIO98Q3oyVCu
	Frvv37LZKpYJikehqzzUyrBbTafdKrKl5tKJBteZaBDVo2ZGYXTh74hQrOdBnRE0MW+tQ2I5aUh/c
	OHU9JWv1IAHiA0IbMNsLdxgoPwv0TxCWOtFfcMdZSda+R3GpNcJmVrTppd59Hib98Ud05wLa9+RfV
	lsPz1MTSK/Cxf7cE7Uiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZay0-001m24-2q; Tue, 07 Mar 2023 17:19:12 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZaxw-001lyw-7u
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 17:19:09 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DF1C02D3;
	Tue,  7 Mar 2023 17:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DF1C02D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1678209536; bh=8mHF0O3YfgYgjO86Zx5MqmA2n1FtdZ5q94ZnAzXKQHk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TA1Kh1nUJp+ndkKE7tTuK49XstwoJ79hgmzatGO49o4kG7v8UGieor19lTh7MOZYi
	 ZqZr78FxJgkMgFYuBKlpP3hpFKPSX5xNK0i8Nk4NPfwhsCb6sQFGqPhr06i5gWom/K
	 4cc+uf7U603k/ij91CMd9/m8zg4MFrD2v8mvl8b4E3ZNbd6TNPQ52blbx6zvKMSa2P
	 kcz0om7VsEQgXN0IQFCOVkP35IaKXCqTS0kUdwOeHeoxcscOeZp5DnrKjVjVUn4wYv
	 DPcrGCNDvI9BiGktazub2xVnS9rjus2Wy/Rdyk4uwaLm+9Bag0oEtA+R3xIDhnMz2H
	 235zXcBXZ2tLw==
From: Jonathan Corbet <corbet@lwn.net>
To: Palmer Dabbelt <palmer@rivosinc.com>, suagrfillet@gmail.com
Cc: alexs@kernel.org, siyanteng@loongson.cn, robh@kernel.org, Conor Dooley
 <conor.dooley@microchip.com>, leyfoon.tan@starfivetech.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, suagrfillet@gmail.com
Subject: Re: [PATCH] sched/doc: supplement CPU capacity with RISC-V
In-Reply-To: <87wn41wi9b.fsf@meer.lwn.net>
References: <mhng-90a89c61-02e7-4f1a-b18d-189d9b7fff72@palmer-ri-x1c9a>
 <87wn41wi9b.fsf@meer.lwn.net>
Date: Tue, 07 Mar 2023 10:18:55 -0700
Message-ID: <87y1o8o4xs.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_091908_306045_03FA451D 
X-CRM114-Status: UNSURE (   8.78  )
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

Jonathan Corbet <corbet@lwn.net> writes:

> Palmer Dabbelt <palmer@rivosinc.com> writes:
>
>> Happy to take this through the RISC-V tree, but I'll hold off for a bit 
>> and let the doc folks have a chance to chime in (or just pick it up).  
>> I'm planning on sending something later this week either way.
>
> "Doc folks" are fine if you just include this one in the pull you're
> doing.

So it looks like that didn't happen...so I'll go ahead and apply this to
my fixes branch.

Thanks,

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
