Return-Path: <SRS0=kixk=WB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425EAC32754
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2019 11:56:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13D65206A2
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2019 11:56:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B6hV7UsJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13D65206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b0BQSkrZ9X1BxiNdT1RCGRoVjQLykhABrM3fEmi1gwM=; b=B6hV7UsJUm5FJg
	FtWtNiAeHCKseMKIWIABmI3EPRcF2zsrdiwsfuI/WjJskfpUy0NbkTvfS3ixL49UmhmYIPHclmi2b
	xuMa/8GeqSaAiDQ2aMQmtQmuhoCTFpeqlmFQcKISpXwH0DUcobozwfq4fuYRjQjfCxcHI/p0am5UZ
	injktjJhr4SSCBOMp/AmgNHwWxZSeotB2oTO3GBYN7cXZ/EHyGwY0uuYroa4XLcb0xvCKklDadF6a
	6O0B9eWodW9rnWM0Ow2kspjRf61AeqXlNYvkVTupgZuzmR3iuEstb1aFfqgAfTvKxR4b75BsZgyYL
	AGm2XX2x7xGOJOaQyEMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hubbU-0008Ej-Cu; Mon, 05 Aug 2019 11:56:40 +0000
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hubbR-0008Bi-Ab
 for linux-riscv@lists.infradead.org; Mon, 05 Aug 2019 11:56:38 +0000
Received: by mail-wr1-f68.google.com with SMTP id r1so84082488wrl.7
 for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2019 04:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TY4SwjXmEN9gc5bLylSn4Hg0/dB7NKueAsPGd6xGBoQ=;
 b=Y+U97MD+tMG0P1nO6MbEzjPAyAs4PvrdN6qSFHYjr9s20LPDd3CnOkvJA/qPiH8a8H
 VxZLoL6AKuiSM5ytQ5Bur/9rpDPEYr1PYG0G14tooebpR7aU9xaYWRJlkcsvqC1YvGXy
 YlnaHGRHzygpysRE3K9+5aIb5ndGdUg5hU6hKgZuItC7y3+uoIjTX5bIU50M+mK4cJnA
 ADPD6RY+qLq8bR/dDOw9g+IEyVjKZ4oIO8GSDAtJR5y+FaYRC3DI/pLSLwErQzI2cfDL
 i2pV2KjM5Hxo9Poy8FLfMOEHNLn6EAO0D3TVxpWthSEbvtCAgg0vUCSdIyKIZ4DVNmaf
 BQhQ==
X-Gm-Message-State: APjAAAUYvTk1ToxAhbiFZF2EuVJS8i+iRwtH2EjqvhqDdTQWsthU3S/O
 cGY90DjOQEcaee1aySUxW3BbsvRD3WI=
X-Google-Smtp-Source: APXvYqyiW6VU1XQOFEG2eUsh/f6zKNWC3klkjjD7J05dOiekrtpHuIxq6IVPBKdC0E3ZEqXFzkJjhg==
X-Received: by 2002:a5d:4cc5:: with SMTP id c5mr107334032wrt.278.1565006195708; 
 Mon, 05 Aug 2019 04:56:35 -0700 (PDT)
Received: from [192.168.178.40] ([151.21.165.91])
 by smtp.gmail.com with ESMTPSA id v15sm77198646wrt.25.2019.08.05.04.56.34
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 04:56:35 -0700 (PDT)
Subject: Re: [RFC PATCH v2 07/19] RISC-V: KVM: Implement
 KVM_GET_ONE_REG/KVM_SET_ONE_REG ioctls
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Radim K <rkrcmar@redhat.com>
References: <20190802074620.115029-1-anup.patel@wdc.com>
 <20190802074620.115029-8-anup.patel@wdc.com>
 <edbed85f-f7ad-a240-1bef-75729b527a69@de.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <8563b869-1ab4-d0f1-afad-9cd864b6019a@redhat.com>
Date: Mon, 5 Aug 2019 13:56:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <edbed85f-f7ad-a240-1bef-75729b527a69@de.ibm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_045637_359397_FCA9F3B9 
X-CRM114-Status: GOOD (  10.32  )
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

On 05/08/19 13:37, Christian Borntraeger wrote:
> While have ONE_REG will certainly work, have you considered the sync_reg scheme
> (registers as part of kvm_run structure)
> This will speed up the exit to QEMU as you do not have to do multiple ioctls
> (each imposing a systemcall overhead) for one exit. 
> 
> Ideally you should not exit too often into qemu, but for those cases sync_regs
> is faster than ONE_REG.

At least in theory, RISC-V should never have exits to QEMU that need
accessing the registers.  (The same is true for x86; Google implemented
sync_regs because they moved the instruction emulator to userspace in
their fork).

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
