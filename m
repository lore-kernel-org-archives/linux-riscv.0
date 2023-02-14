Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA68C61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 14:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iv9JRiO0qjKSaL4FcRM62wLYg6ao1SE3yXERmOPlRaE=; b=D1PRxRb1jX3Q01
	QTG9NJvMQz2P6EdEX5jLScvncr+3LSprJdZcZYbqjmJ6rBle1SSpMf0/wiQAqZi2I+wEMwS+Au8+y
	AbTApV3GRYxde/nfZjli6ETw17xjhvoku8Nj+7vFl0+L1/I3AeiDcdHM69GNIAWaIeLvU95lBLCsz
	hRgfKBxywMnzKaZHbOT6G6NRY1j0iYbFl9CirkgOFQoabnFreR1o+WS46EP2pp+/5wPQ0BBizwn89
	ZL65tdyRRg0aMx4hYzNyB4Mkg7OHLUnLVs2k2RN8BRmULeTWsnd2ikCI8T/RrRQAUj8kU4McAe6Of
	XL6AuqDhxAO5eTti/8zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRwjR-002Klz-D5; Tue, 14 Feb 2023 14:56:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRw2M-0022Gy-Kx
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 14:12:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676383921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7edBYp6qpX/SlmDw/QknJtcx6m2SrqGm1x4V+hfCBb4=;
	b=ZAGptpoI/ux+GfvZ07slRWaUJcQcV4Sw2DI88B2wyFHNmL00l7tB3LtQUM57/tt+6nIzqP
	1yWUPx7eMD7dzeQ6paBMxZosiefwFR0uXMpf0OGSog3rV+asOmrRjUlNFvIgDdlqIo+ekV
	HCXSHaUo16TquvFg9Y0EVs3cJVWBl3c=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-346-lp5-GzNkNmiEmL6pKxh9cA-1; Tue, 14 Feb 2023 09:10:50 -0500
X-MC-Unique: lp5-GzNkNmiEmL6pKxh9cA-1
Received: by mail-qt1-f199.google.com with SMTP id bs11-20020ac86f0b000000b003b9b4ec27c4so9353722qtb.19
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 06:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7edBYp6qpX/SlmDw/QknJtcx6m2SrqGm1x4V+hfCBb4=;
        b=DTn2R4HyuXYq4zJzEiPZ38rCqDYPHpkTY1PPogCozJOM4m0T3gK0BLVdSHVj5BFwmD
         ErR5sAGIM0vW0GR3d6EwX+CzbiOt6/OgQV5cJAzPJCNy4kuyU+9qrKmdLrAuW4HVBFMW
         1107tvBtPapzur0wnX9n9Qmu6plmNuIvyIwCLnHQoHduXnAQL8nXxJc5VOTiW+etaoK8
         M25r1Jkd7RLjNEtX8FMZ8lI4l8jfiX+mpYCizHEYqjpKPfKa7ts3p2ltqh9sZgSgwtrb
         DqY2zJFe1VpMzDIp28Ztc9rgkNCYXBFPjlB/hFye/b8fD4hIX4KNLppXO+KnBNB05j2R
         x53A==
X-Gm-Message-State: AO0yUKWmg4crwZOBJtbtWbv8MGsDGwanN43eE7nyqBto08JC+LtLuvnY
	LK3T6zvTEv8RgPwn4z53jspn7yUxluEPfzK7Mjw9+LyjQJQhwflY6a9cRg+jgm9ZaButf1kG1y/
	sQv2YQGlWlEp18XtzdyjOHtrzkfhr
X-Received: by 2002:a05:622a:50:b0:3b8:691f:271 with SMTP id y16-20020a05622a005000b003b8691f0271mr3386013qtw.63.1676383850310;
        Tue, 14 Feb 2023 06:10:50 -0800 (PST)
X-Google-Smtp-Source: AK7set98OEMKfsGkU19OgnlE6heJ9O6LLo1g6QDlcHkAXfWHsX591p7/3MvgrPqMUwlWB9z0tPx4tA==
X-Received: by 2002:a05:622a:50:b0:3b8:691f:271 with SMTP id y16-20020a05622a005000b003b8691f0271mr3385969qtw.63.1676383849978;
        Tue, 14 Feb 2023 06:10:49 -0800 (PST)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id s184-20020ae9dec1000000b0073b38652b9csm4892065qkf.122.2023.02.14.06.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 06:10:49 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Peter Zijlstra <peterz@infradead.org>, Thomas
 Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Daniel
 Bristot de Oliveira <bristot@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Frederic Weisbecker <frederic@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Marc
 Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell
 King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Guo Ren
 <guoren@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v4 0/7] Generic IPI sending tracepoint
In-Reply-To: <20230119143619.2733236-1-vschneid@redhat.com>
References: <20230119143619.2733236-1-vschneid@redhat.com>
Date: Tue, 14 Feb 2023 14:10:43 +0000
Message-ID: <xhsmhh6voqqvw.mognet@vschneid.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_061202_780163_1FBDF154 
X-CRM114-Status: GOOD (  11.83  )
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


Hey folks,

On 19/01/23 14:36, Valentin Schneider wrote:
> Patches
> =======
>
> o Patches 1-5 spread out the tracepoint across relevant sites.
>   Patch 5 ends up sprinkling lots of #include <trace/events/ipi.h> which I'm not
>   the biggest fan of, but is the least horrible solution I've been able to come
>   up with so far.
>
> o Patch 7 is trying to be smart about tracing the callback associated with the
>   IPI.
>
> This results in having IPI trace events for:
>
> o smp_call_function*()
> o smp_send_reschedule()
> o irq_work_queue*()
> o standalone uses of __smp_call_single_queue()
>

This still rebases cleanly on top of the latest tip/sched/core, any
objections to parking it there?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
