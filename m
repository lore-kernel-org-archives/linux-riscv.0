Return-Path: <SRS0=qfeT=V3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01037C0650F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2019 11:47:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBF98206E0
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2019 11:47:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IN+gW0iD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBF98206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+sGDVL2m2Qde06fQ6nopyXvjib8RjfqwsFdIVJMqEww=; b=IN+gW0iDyF0qoE
	Nks4gbEdv0bq4BVnqvCUqWrIFjtNQHdy3B1tKGWHdG9ufra/Und3g3WChg1HCVKCs2XvD7g3c9Rcp
	91PNxKxulHVBoIFiUB0OvLdzMn1R4+Y0TbkWfz6ZqoZH6poiymYMwx+cjKoSoTLUBmt3HA0T6oe9m
	G5fu1OqBSIxLLUQUmDpYXTyLgHqDxC0lYSJe8WSOKoptvaQxV+YD5yZSFaW29Z4YFRUqbhQFvecDp
	Lx9GMEqJ38O+Wn4WrWlvuhiyyIjKs/t3rAWfXL7pRy3airr701bp/Pl7ApaqCjAN2DAoD5eA1GF53
	ao0ap4ABrd8Z0ir/MbEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsQbj-0001dg-QX; Tue, 30 Jul 2019 11:47:55 +0000
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsQbh-0001d9-80
 for linux-riscv@lists.infradead.org; Tue, 30 Jul 2019 11:47:54 +0000
Received: by mail-wr1-f65.google.com with SMTP id 31so65455702wrm.1
 for <linux-riscv@lists.infradead.org>; Tue, 30 Jul 2019 04:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=URLGMXYUvPFwf9Ds8JQxcBHzIr6dahYGzK+VoJD8QhE=;
 b=WLDIplcUybLAWAOyEirZMdnSFZX8iTJzrTBLUJj0HWce8JXal4CEa2OQq/886yAHea
 CRGg9PE65vtlnWod9Rs8iNpqzgerJpjENI5VaecHY0a9brFY7DHULZIlm7thb/dL26YH
 lWwUkziJOM53KOemQmaLRRup3LPJjwg1PioRRn8L8dV7N+MYwaYDMrN2T+1hF1UMUgBh
 zW2VB+6Pfged0nBPP9WhgzpeYF/N2Uil7fTU2zmDz2o4h7gle5GwU6J3392Xh99HIusC
 zrmPONw+fdEWOn50ixElH62nxcsbrbusZjRyCBfUevqhZNJOX81rxndPUrVoDjXNxdxq
 GZBg==
X-Gm-Message-State: APjAAAXEMbKz8VvdVgXfe2QLyAMlh+COc1n4xaUVNZM+uvFPp0IiCnP1
 EXuR+TrCXddSWvLDU2XUmVjHFw==
X-Google-Smtp-Source: APXvYqwaB3fvd7fbhIEykGUUPwA19XqyBzPVtdZ9LEL3jMPxSoL5kvVaSAXhjUtKnKuuDk+TdhmILw==
X-Received: by 2002:a5d:6a05:: with SMTP id m5mr54665638wru.305.1564487271786; 
 Tue, 30 Jul 2019 04:47:51 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id b8sm83186767wmh.46.2019.07.30.04.47.50
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 04:47:50 -0700 (PDT)
Subject: Re: [RFC PATCH 04/16] RISC-V: KVM: Implement VCPU create, init and
 destroy functions
To: Anup Patel <anup@brainfault.org>
References: <20190729115544.17895-1-anup.patel@wdc.com>
 <20190729115544.17895-5-anup.patel@wdc.com>
 <ade614ae-fcfe-35f2-0519-1df71d035bcd@redhat.com>
 <2de10efc-56f8-ff47-ed69-7e471a099c80@redhat.com>
 <CAAhSdy0OH9h-R=2NxhhPs6jmFPNgZVSwFtCjtJrf++htu82ifA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <00ec47ef-6c03-ec27-3894-7afd4757ee61@redhat.com>
Date: Tue, 30 Jul 2019 13:47:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy0OH9h-R=2NxhhPs6jmFPNgZVSwFtCjtJrf++htu82ifA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_044753_288254_B6728FCD 
X-CRM114-Status: GOOD (  10.79  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Radim K <rkrcmar@redhat.com>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 30/07/19 13:45, Anup Patel wrote:
>> so:
>>
>> 1) indeed we need SP2V=SPV=1 when entering guest mode
>>
>> 2) sstatus.SPP contains the guest mode
>>
>> 3) SP2P doesn't really matter for KVM since it never goes to VS-mode
>> from an interrupt handler, so if my reasoning is correct I'd leave it
>> clear, but I guess it's up to you whether to set it or not.
> Yes, SP2P does not matter but we set it to 1 here so that from Guest
> perspective it seems we were in S-mode previously.

But the guest never reads sstatus.SPP, it always reads, vsstatus.SPP
doesn't it?  In any case it doesn't matter.

Paolo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
