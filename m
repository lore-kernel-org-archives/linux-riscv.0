Return-Path: <SRS0=TPRL=V6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8410C41514
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2019 09:14:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B39CF205F4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2019 09:14:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hF3kkShz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B39CF205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tbf3VAox1rQDBL0xg6BUZwYnjEx+q7Wv51wYlYxyMN8=; b=hF3kkShz87s9C4
	XPO0KKwpAMEVazV4TUamlXaNBQbHvwZZNuPe7+GDipBaOnqjRUzd9uHV8r0EDTZM7zzYasxnrWUnC
	KdW890/3EUh6c+2VqIG/OkdtGNiM2um3JFzwIkR50hnOXEqpGw4uI+DzAtEHLweRozPFFMQywTZPQ
	e3QfoG3m7bRKwXY87k/+a/qdyEAZh17gXfAfl6FJTbuTKBsALi26IdVZnYVyt8WlWFam1c0+V+PeZ
	rKZMFN/2hw5HdrRvA5ip5X1GJ5K4+vtQ1D1QKm/fGXhkxijmPwA9acPzw44Fjn9MQk3gohi2RK6N/
	BcABpoq2SsYssu2/aH9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htTeA-0002uj-UQ; Fri, 02 Aug 2019 09:14:46 +0000
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htTe7-0002u9-Rd
 for linux-riscv@lists.infradead.org; Fri, 02 Aug 2019 09:14:45 +0000
Received: by mail-wr1-f66.google.com with SMTP id 31so76433885wrm.1
 for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2019 02:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qip0/4niVe3t0eqLUXzaEsnThAuuUjr0Sl7TEveH/lY=;
 b=XbLLO9uzYNhDRq7HuWAXF4e32YK+3U4+8V14JyH6XtZoThDWBRLJUSfzrRo4NwRRvE
 Z/KhLoqEgKNg+pwV5kPbfMCzpL6HYc37wUBpYuWCd1HXANVfbYuXgEVSiOT/W97iIeoh
 GIxWvFi39qoEHJbpZKVViMm8cUblBsu4W21oeDMB3IX6RTNliaw52pTfLS22l5OK40OI
 aNJoblZZQjmNgMWuLqmCjp2xhkRylVfqHs94LnKMSgyiY3FHv2lQTbswtypZeoOVqre4
 b5cC7cLxMGkgYBvILRyG4J57ihbzSocYtXGtZFPwX36J8+3ZJyQ1rH5VR+iVVyYubuaz
 WtZg==
X-Gm-Message-State: APjAAAU2IBPWUP7grRW9VxE408oeuhhP2lbWwrgVh2NQacl5WFYHbfjZ
 +w35luLpm+P5rahjCt1FM8q6Nkn+X1I=
X-Google-Smtp-Source: APXvYqzBUUchxm6j0ktdj9jreOdHWCW7hMz3Yz24xUQA2HVmbvwbX1hgS8nU0BDDul8xNizaVm6PxQ==
X-Received: by 2002:adf:e8d0:: with SMTP id k16mr1884801wrn.31.1564737282526; 
 Fri, 02 Aug 2019 02:14:42 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:4013:e920:9388:c3ff?
 ([2001:b07:6468:f312:4013:e920:9388:c3ff])
 by smtp.gmail.com with ESMTPSA id y6sm62931619wrp.12.2019.08.02.02.14.40
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Aug 2019 02:14:42 -0700 (PDT)
Subject: Re: [RFC PATCH v2 12/19] RISC-V: KVM: Implement stage2 page table
 programming
To: Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Radim K <rkrcmar@redhat.com>
References: <20190802074620.115029-1-anup.patel@wdc.com>
 <20190802074620.115029-13-anup.patel@wdc.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <949b75ef-5ec6-cdfd-5d5d-5695f35bd20c@redhat.com>
Date: Fri, 2 Aug 2019 11:14:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802074620.115029-13-anup.patel@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190802_021443_898033_576EFD8B 
X-CRM114-Status: UNSURE (   7.66  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 02/08/19 09:48, Anup Patel wrote:
> +	hgatp |= (k->vmid.vmid << HGATP_VMID_SHIFT) & HGATP_VMID_MASK;

This should use READ_ONCE.

Paolo

> +	hgatp |= (k->pgd_phys >> PAGE_SHIFT) & HGATP_PPN;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
