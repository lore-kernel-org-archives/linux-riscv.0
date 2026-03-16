Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C90F013CA
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 08:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JNCRNV/XzRNlV5Q6hS/LY2fgWe7lWROwv72HAqPEBzg=; b=0MDZCykbKSruUB
	BHmXImYC5Pl0SlOekjRlAWbifs1mujKcJbYz/Rp5kIBRzjzlt0aediKRhBwcV5fc8pZCvY+D0x2Eo
	QzxXnENAKzZJzA2vxv7JhzuI9L9Fdsri1zJYMVksCZSweA0OzGW7cV3ufR4PsRV8KSM+6I2xJYUvM
	KELDNx0k0cEsNqDeJ4fX8qQ+lDoQIxSpy/8ZhsUsQUd2SlJAkdsW+nzqGtSrAAWGPfTx4BLOlFk5T
	Yq1jDD2LdyyRjtiVK+KIDrBbzN27wY7xx5s34GXGwb9ym4ljjchc8JbNpalHO9EjeUljEDITw+Pln
	IqvKQfBwWU/dJ07hC1/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w237C-00000003X7f-0aYm;
	Mon, 16 Mar 2026 08:15:54 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2379-00000003X6M-2Oi8
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 08:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1773648946; x=1774253746; i=markus.elfring@web.de;
	bh=Z4W/zqrkTDQYaERUiX2oWDCjRMTn6duvxiv3djQ7ypM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=V0/pGpWRQhGjMxcNg0cR1h3VKCrjlXfB3jzfSI/AmnDJwG2fk6WYp8Ze1yDv09Na
	 4DLtcy0b9DiJwF0F7NPKWxKe5EsVxHNjz5h+7X9aQ9ImXKayx4Rtr2jT8nBynWt17
	 +jj5W21PLGEg4fsF4x0y4P+0kOkYiVRU6UPBaPTHENhDHORjMuWH2FoOq8Es8acDd
	 leO5b0zCwmxIGwxQ2wSJU+HG4JTN5kkNJRGkRVXJ1dLBBkMPs6i08WmgV2Xwu6S2t
	 Md+Eb6dBqMRlbtRCnRVu6iDB5hezMirgVYbS9DC7fEOGs2hYBaVS5NrqmadTYZgPB
	 5zt7Qp7KyQiOXJQrRQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N2SPD-1vboWD0lHL-00yjAz; Mon, 16
 Mar 2026 09:15:46 +0100
Message-ID: <47798f3b-e376-4b8c-bf44-073bc9d39ffc@web.de>
Date: Mon, 16 Mar 2026 09:15:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Felix Gu <ustc.gu@gmail.com>, linux-riscv@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Anup Patel <anup@brainfault.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Rahul Pathak <rahul@summations.net>, Sunil V L <sunilvl@ventanamicro.com>,
 Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Anup Patel <apatel@ventanamicro.com>
References: <20260315-sysmsi-v1-1-5f090c86c2ca@gmail.com>
Subject: Re: [PATCH] irqchip/riscv-rpmi-sysmsi: Fix mailbox channel leak in
 rpmi_sysmsi_probe()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260315-sysmsi-v1-1-5f090c86c2ca@gmail.com>
X-Provags-ID: V03:K1:NtiC8Lt/b+e1SK1qsoyU/7poF8G8JdVCOj8cwSKzt+6TLcqHtYR
 H2UiqYTQ9ins20/99tvFUJXw46b5cXdVnbT0lhQvkDDMnBjMy3xbbwFOOCN6nsS+XF222v3
 TkvMJxIAZ7VPHpZeKpfxpgeFTL5+hZUnylzliJF1QDczcX51N2WT/KZE5eb0KhUgLURyejS
 wZtA7nkBLdhTXzoY0Gdpg==
UI-OutboundReport: notjunk:1;M01:P0:yhL8NtpJNZM=;ejmb007gQnYs+1XmawuT74xe6fI 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_011551_899287_F3A7F280 
X-CRM114-Status: UNSURE (   5.11  )
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

> When riscv_acpi_get_gsi_info() fails, the mailbox channel previously
> requested via mbox_request_channel() is not freed. Add the missing
> mbox_free_channel() call to prevent the resource leak.

How do you think about to increase the application of scope-based resource management?
https://elixir.bootlin.com/linux/v7.0-rc3/source/drivers/mailbox/mailbox.c#L465-L496
https://elixir.bootlin.com/linux/v7.0-rc3/source/drivers/irqchip/irq-riscv-rpmi-sysmsi.c#L210-L307


Were any source code analysis tools involved here?


See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/stable-kernel-rules.rst?h=v7.0-rc3#n34

Regards,
Markus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
