Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E83C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 15:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DArXrFXPzmn4Gw4UiiDOUKPLMkFO8IE6sQlpFkbSvaU=; b=kQGx4Y7mZpEQqp
	mv7PX/reESg13daE8VLOF0jmgWkDeM1NzmkHZl5+ZpsSOLsGuRXiViEj8DFiBC9ZbHDUBoW3QgffP
	K8FmMrBvruuVUg/Rzu9wkSb5r5hurOI/462MOfEtMnfEJ12ewZaH7Ho0zFt/731MC5KFnH2rAk8mx
	zy9ht1WC3lBiiuzpSoDBDrBWEIekNlfffktfNeHnjytUaeovLOoWI2X21PmOoBRQK36z21a351E8D
	f0+vJPTws/YvYNZdMRISAj0aQxzZe9PPBYtwL6erOQoXLA1BL+BgGcmm2Wsl4hn0AqswZ0OLbIbvy
	w/w/R7IvGG7kVgLg9wQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muFud-004WZJ-GC; Mon, 06 Dec 2021 15:28:19 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muFua-004WYd-RS; Mon, 06 Dec 2021 15:28:18 +0000
Received: by mail-oi1-f177.google.com with SMTP id 7so22005831oip.12;
 Mon, 06 Dec 2021 07:28:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vmY9WY/IdHkBubH/d9+H2NnZMjAMu0umDpKHxPiSoSU=;
 b=FnL8sKE5QcDbut6suDsSdWKxxMz8pIPvyp7jLZ7QS4xON0CzrNpE7ZXt6ctksBVLoT
 EYlKHq/QDk26wW5ZN906mM1XnMiKy7lW7reohZ9pG9CMWefr/1vvTinKQRwoywYca4qU
 TD9A/nW0AmgA6FT2b/n+vm66NZ2Ui9SJ4lOqAeagiH1RPD4V0ciUWrb5OvdEbvju6pKG
 sMqdejadnxpBqgcQJejMl5RL2jwQRgXxDxrOpAMT60aWqdrccYk1QZhKaUAeDXpr0oqs
 dQtBIatUMjGm8VnimsgbBEG+L2b93fvwZ4/ySdv8mN6Q0vOizBABWqSPmlw0jedP23/G
 PQ7w==
X-Gm-Message-State: AOAM533IOLyD6iGKFzT16hZlXUkKu5TLpLP4/CU6Ot7AiE+LnV5+Xmsg
 GXlsLESuFRfPVQSkuY5a25AYInLj3Q==
X-Google-Smtp-Source: ABdhPJyfHepTpy+8C5WIBaswVad+pb+ARigaK7+tiIrrbzB1awNCTodg/k/StbwlXs0D2pl0zwBHtg==
X-Received: by 2002:a05:6808:218b:: with SMTP id
 be11mr25541435oib.80.1638804495458; 
 Mon, 06 Dec 2021 07:28:15 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o10sm2141225oom.32.2021.12.06.07.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 07:28:14 -0800 (PST)
Received: (nullmailer pid 2069157 invoked by uid 1000);
 Mon, 06 Dec 2021 15:28:13 -0000
Date: Mon, 6 Dec 2021 09:28:13 -0600
From: Rob Herring <robh@kernel.org>
To: Atish Patra <atishp@atishpatra.org>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
 Anup Patel <anup.patel@wdc.com>, Greentime Hu <greentime.hu@sifive.com>,
 Guo Ren <guoren@linux.alibaba.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ingo Molnar <mingo@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
 Nanyong Sun <sunnanyong@huawei.com>, Nick Kossifidis <mick@ics.forth.gr>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Pekka Enberg <penberg@kernel.org>, Vincent Chen <vincent.chen@sifive.com>,
 Vitaly Wool <vitaly.wool@konsulko.com>
Subject: Re: [RFC 0/6] Sparse HART id support
Message-ID: <Ya4sDX974/dVEOQw@robh.at.kernel.org>
References: <20211204002038.113653-1-atishp@atishpatra.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211204002038.113653-1-atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_072816_916486_712DE270 
X-CRM114-Status: GOOD (  12.26  )
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

On Fri, Dec 03, 2021 at 04:20:32PM -0800, Atish Patra wrote:
> Currently, sparse hartid is not supported for Linux RISC-V for the following
> reasons.
> 1. Both spinwait and ordered booting method uses __cpu_up_stack/task_pointer
>    which is an array size of NR_CPUs.
> 2. During early booting, any hartid greater than NR_CPUs are not booted at all.
> 3. riscv_cpuid_to_hartid_mask uses struct cpumask for generating hartid bitmap.
> 4. SBI v0.2 implementation uses NR_CPUs as the maximum hartid number while
>    generating hartmask.
> 
> In order to support sparse hartid, the hartid & NR_CPUS needs to be disassociated
> which was logically incorrect anyways. NR_CPUs represent the maximum logical|
> CPU id configured in the kernel while the hartid represent the physical hartid
> stored in mhartid CSR defined by the privilege specification. Thus, hartid
> can have much greater value than logical cpuid.

We already have a couple of architectures with logical to physical CPU 
id maps. See cpu_logical_map. Can we make that common and use it here? 
That would also possibly allow for common populating the map from DT.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
