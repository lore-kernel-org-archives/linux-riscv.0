Return-Path: <SRS0=qfeT=V3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BEAC433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2019 07:42:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C2AF206E0
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2019 07:42:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DwphhJtq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C2AF206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZuLSXVCZoJ7Fm5WFADrxj19Rh1F5A9VpL9XHLpkoqug=; b=DwphhJtqsugYRu
	2NSMlfTA/bZswaZTahahcK10JXZ9m5iyTV+KfsKmRHQytc601n3BkHH2/nhLx+YjJZD2dvjHTiCaH
	4chb3SLYw3gf3Tbvl6r2dTNBVxDl5i6kOof1Klb3zQty1mAQlTPnUJj3R6L1k3gmN8LiNE3cAY9oY
	BQZljwhZefFJ5nqunU6pr+w7+7H1VDnBNfIy8gRs+hVqrHx4ZrPchexmbwt0E6HeCBHQcLmrEOU1Y
	aLq9BMjC+3gw3d/dStCXIzvnaJwDO6nsecIsEQQw92RarH2UXf6qYWlNHLTCrxDV156mLkwkwyMPo
	F7gswQcnyH3Q2pthqu8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsMmR-0002t3-NN; Tue, 30 Jul 2019 07:42:43 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsMmO-0002sX-UU
 for linux-riscv@lists.infradead.org; Tue, 30 Jul 2019 07:42:42 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 61295AE5A;
 Tue, 30 Jul 2019 07:42:39 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [RFC PATCH 00/16] KVM RISC-V Support
References: <20190729115544.17895-1-anup.patel@wdc.com>
 <mvm5znkau8u.fsf@suse.de>
 <CAAhSdy2jKQspZNwvd5VnZ8iyWjwe0fGXR+3WwP9cn5pEOcSfVg@mail.gmail.com>
X-Yow: FIRST, I was in a TRUCK...THEN, I was in a DINER...
Date: Tue, 30 Jul 2019 09:42:38 +0200
In-Reply-To: <CAAhSdy2jKQspZNwvd5VnZ8iyWjwe0fGXR+3WwP9cn5pEOcSfVg@mail.gmail.com>
 (Anup Patel's message of "Tue, 30 Jul 2019 12:55:30 +0530")
Message-ID: <mvmo91c9de9.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_004241_139047_0889CA0B 
X-CRM114-Status: UNSURE (   8.18  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Radim K <rkrcmar@redhat.com>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Jul 30 2019, Anup Patel <anup@brainfault.org> wrote:

> On Tue, Jul 30, 2019 at 12:23 PM Andreas Schwab <schwab@suse.de> wrote:
>>
>> ERROR: "riscv_cs_get_mult_shift" [arch/riscv/kvm/kvm.ko] undefined!
>> ERROR: "riscv_isa" [arch/riscv/kvm/kvm.ko] undefined!
>> ERROR: "smp_send_reschedule" [arch/riscv/kvm/kvm.ko] undefined!
>> ERROR: "riscv_timebase" [arch/riscv/kvm/kvm.ko] undefined!
>
> Strange, we are not seeing these compile errors.

None of these symbols are exported.

> Anyway, please ensure that you apply Atish's KVM prep patches
> (https://lkml.org/lkml/2019/7/26/1271) on Linux-5.3-rcX before applying
> this series.

None of these patches contain EXPORT_SYMBOL declarations.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
