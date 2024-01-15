Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55762C3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 09:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HTG3Bo5klOKiqMm3U8e6TNTKsWXGCiA32SPfiXyKcKU=; b=478pDWiHLrrF4r
	01DilTHkzVWpPGk49RU1KqgcVvnnWU04Kvd2UtVRbzQ3wTFu+4KIvdlE43n46PkAcVoMjlrUTtzMa
	sgsu/PUyjgSqa8x0lmxKaRuNDRSBvckkk756aBRC1R28OwymcOKUbUQy+MMi3y9g/J/A2mYzG1+Di
	/WfKpIkaUwqMijdNCfBAOwfWaR97A2xh0fid+zkH9NMAnz9Oaphr+4eHfUyKxlZteTqu9sjRAXh6+
	/A6EngTTIRGVE1HIPt2U0MtnQJA9Dodho1Z9WcM+siibhisME8cAOCnpbs6PyTPqOBV17o1LdMFYC
	Nu0qoIJJ/y1pYzI47TNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJTg-008Sej-2Q;
	Mon, 15 Jan 2024 09:41:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJTd-008Sdk-1u
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 09:41:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705311711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C+Jk1nbj3uW6migT2Vqo+VfpLTraUaZDdhQVwMiE/20=;
	b=YwKhntSq3GMEKNkqqMJ7XPN9Mn9a2HY8KnyLs1RcyTBoaQFAhwvi4NRjR7GwleKX1tq313
	cl4Hq3xdllG8aZxs3m/b1aw/wR4VMYPn0fjXPERGA3rQTDFaChilt6+Y/iA47sdGOye5rp
	h5PIEWelyRMseV/HFfTO3kZybcslk8I=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-4r2ltl5MPsWeOzjRqvwu4Q-1; Mon, 15 Jan 2024 04:41:49 -0500
X-MC-Unique: 4r2ltl5MPsWeOzjRqvwu4Q-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-680c88d31f6so143493036d6.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 01:41:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705311709; x=1705916509;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C+Jk1nbj3uW6migT2Vqo+VfpLTraUaZDdhQVwMiE/20=;
        b=SS40+MZMZQcaQdWd2ayaO2UDd9WGqRhsdQDOHGUF+0wPR3wDJx1Uj2HCDC1v2NEMz9
         hNlOLyyIHZ/8WphufFdyQ3ptpN3I6qzbSdCmRSC78oYqm9A0sbjBQ6L4Xybpngz78u+0
         ZCGaW0e722b1075Ux361NHsH+If3K2a4OoTgxf+WFil4Y2/LrEF7vJ+4UDaDS72ewKDr
         VwwnkD6RKrc64sBNj6oNNO7a/ltlldKAsYMK8vFRbzBQeGmtz0/eCpqUbf2uT2zc1JH8
         qh5P0y+EP59JLQZlBQ8W9mJB6fY++MJ4QdwxKu51V/5YlrwAFHdAwcQPr3V91/6ILYE4
         Fn3g==
X-Gm-Message-State: AOJu0YzRYI+ogdg2tF+0Iyu6Dr0WcLgIcSeGFePBzfvUym79yW5C6yBz
	F6R/fDqTpRa7YwTetfnnmqwyc8NlqZ1JGkyqsruHDF69cFWgYV808llECe/7FTGEYl/xsRQJsv0
	O4k4qeVGROLjF+uhCx/c6Ku/dY2xWu9zemLt3
X-Received: by 2002:ad4:5ba9:0:b0:681:656f:4990 with SMTP id 9-20020ad45ba9000000b00681656f4990mr301097qvq.4.1705311709523;
        Mon, 15 Jan 2024 01:41:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAOOoM1Bm+v8qEYAvYKrGoQCl6CNZBl4IdAdptOpUkzfuoO62Z5TqjIUAbKxWrq0EP1glzaQ==
X-Received: by 2002:ad4:5ba9:0:b0:681:656f:4990 with SMTP id 9-20020ad45ba9000000b00681656f4990mr301089qvq.4.1705311709206;
        Mon, 15 Jan 2024 01:41:49 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id x19-20020ad44593000000b0067f678747ffsm3189342qvu.50.2024.01.15.01.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 01:41:48 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>, linux-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, Yong-Xuan Wang
 <yongxuan.wang@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Marc Zyngier <maz@kernel.org>, Anup Patel <apatel@ventanamicro.com>, Atish
 Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
 Samuel Holland <samuel.holland@sifive.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] RISC-V: add IPI tracepoints
In-Reply-To: <20240115071246.32675-1-yongxuan.wang@sifive.com>
References: <20240115071246.32675-1-yongxuan.wang@sifive.com>
Date: Mon, 15 Jan 2024 10:41:44 +0100
Message-ID: <xhsmhh6jfhr1j.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_014153_719732_D4D9728F 
X-CRM114-Status: UNSURE (   9.40  )
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

On 15/01/24 07:12, Yong-Xuan Wang wrote:
> The strings used to list IPIs in /proc/interrupts are reused for tracing
> purposes. Also slightly clean up the code by removing send_ipi_single().
>

So this is adding trace events for sending & receiving IPIs.

Regarding reception, AFAICT arm/arm64 had that historically because IPIs
were handled directly by the irqchip (see rambling on the first part of the
cover letter at [1]), but now that this is no longer the case they are
obsolete: they show up in trace_irq_handler* events.

I don't know riscv IRQ handling, but riscv_ipi_set_virq_range() looks
awfully similar to arm64's set_smp_ipi_range() and does a "proper"
request_percpu_irq() for handle_IPI(). So if one wants a trace footprint of
IPI reception, there already is infrastructure for it.

Regarding sending IPIs, there now is trace_ipi_send_cpu{mask} which is in
the core kernel and thus benefits all architectures, though it
only covers IPI_RESCHEDULE, IPI_CALL_FUNC and IPI_IRQ_WORK.

Long story short, I know the ipi_raise and ipi_{entry_exit} TPs already
exist and we can't remove them, but IMO they're not that helpful because
they just give a string rather than an actual function pointer, *and* they
have to be manually added to the right place in each architecture. I'd
rather see trace_ipi_send_cpu{mask} extended to cover the missing cases.

[1]: https://lore.kernel.org/lkml/20230307143558.294354-1-vschneid@redhat.com/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
