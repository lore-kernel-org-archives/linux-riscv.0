Return-Path: <SRS0=kixk=WB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD49CC0650F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2019 12:01:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 958032147A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2019 12:01:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uWcmYCM6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 958032147A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vV5U/L/NJTwIHCiuCXElyCO46KP07P6sbgKC5bh2AAg=; b=uWcmYCM6EHBybz
	k/Wdf18tTBtEGAL3QC+cDgvNn2ayY/plDtyj+z5+pBs/WsK1WRzAlSG4inPHn6oKNBXYFJddy8fq6
	kICI8Qt/FU0sqR5AEZa+CgfdSQ2v7/TpbldlCC4bNr7eu8+g0vlFrGFJCnK8ITS9i7xteWz/rKk84
	Tj257oKWRtM0E3AGXMAtfe+lLnW+LqVHUlEfAIepUm1CO/lFua4WvowPhYdOqaZ5F1Yyp3IA5CCJC
	r2j5Bog9SCd5Ar6ZtNIEbh+TyQ5yW72RxKv9wGbzWt0fFxwnjl5ARRQ8IcFfoJxqAy6EV2hvx/gVr
	b9Drrs8oW9nXrIRQ9Kow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hubgY-00025v-D9; Mon, 05 Aug 2019 12:01:54 +0000
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hubgV-00024u-LD
 for linux-riscv@lists.infradead.org; Mon, 05 Aug 2019 12:01:52 +0000
Received: by mail-wr1-f65.google.com with SMTP id p13so9578426wru.10
 for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2019 05:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2nagADd5jn/PM+jdv3CsfqiPWcm300QiQQSn7jI3dpY=;
 b=cps1NCmU9Ws6u3znzDdy751Af/9r+yplDoRJ5lbPyxM+lzkPPMFrrA3i9G4feGs/B2
 X+Fj5XHipASV3FsRtVRrPE3OlwmoU89c2Qrqxq6g8k4cD5OyY2uUz5Qdqb6BiNp8/hk7
 jUuIEzjQB+jYXhyhv66p0okCL/IljNHc0EB/1d/oyC99lO+7x0z7VZmeDNl8CVqn89AE
 m2xsub2DW9wbsUhq/7aR9QpUwZbe+ZeKcqcmqsUDg3UrVzl6JDzyS0aRlYkMryQo8e0F
 zmqlYov4EkYFDcOXmSnIESIpgQu7oC+rGA3KFq2fguzbu5k0KNSFd0lsflQaY0QdZN05
 A17Q==
X-Gm-Message-State: APjAAAXV9JbtOIs/X/MUnWbSyS32w53K4G+ysQfOAgUm7l6t6szY96EP
 cm1u5cOeapqOkL0bW4yzbbvaCg==
X-Google-Smtp-Source: APXvYqxE67uGRsevI1zEKu6WcCvy7LGAqb+5YSaaPfzVS62blyzVnMo0SSHLm4YD1CuRcd1v857erg==
X-Received: by 2002:a5d:6508:: with SMTP id x8mr42706085wru.310.1565006509205; 
 Mon, 05 Aug 2019 05:01:49 -0700 (PDT)
Received: from [192.168.178.40] ([151.21.165.91])
 by smtp.gmail.com with ESMTPSA id c1sm192489759wrh.1.2019.08.05.05.01.47
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 05:01:48 -0700 (PDT)
Subject: Re: [RFC PATCH v2 07/19] RISC-V: KVM: Implement
 KVM_GET_ONE_REG/KVM_SET_ONE_REG ioctls
To: Anup Patel <anup@brainfault.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20190802074620.115029-1-anup.patel@wdc.com>
 <20190802074620.115029-8-anup.patel@wdc.com>
 <edbed85f-f7ad-a240-1bef-75729b527a69@de.ibm.com>
 <CAAhSdy2PDSpTy1JEEC2LCB4ESvZHBbkVEZ2wqz-D2b7SKD5VSg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <09417197-36e8-718f-f106-29466ef406e3@redhat.com>
Date: Mon, 5 Aug 2019 14:01:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy2PDSpTy1JEEC2LCB4ESvZHBbkVEZ2wqz-D2b7SKD5VSg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_050151_699598_6D6C0DC1 
X-CRM114-Status: UNSURE (   8.76  )
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
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 05/08/19 13:56, Anup Patel wrote:
> We will certainly explore sync_regs interface. Reducing exits to user-space
> will definitely help.

sync_regs does not reduce exits to userspace, it reduces ioctls from
userspace but there is a real benefit only if userspace actually makes
many syscalls for each vmexit.

Paolo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
