Return-Path: <SRS0=qfeT=V3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CACB6C0650F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2019 12:11:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A153F2087F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2019 12:11:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PTgItuts"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A153F2087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iGhMN9ybooxfShQ+W4oDUv64cSPpsAWQZM/mZuQLWQY=; b=PTgItutsPBatIh
	xl7hcQv1hAFVafOFsoiJmCzEWxsgz4uS94t64d4yEVmNSFrFlKEY2lC+rdeqABKDFQI9VkD9/voo+
	YXk4rRbx/HWi/UFM8nL6i6gSzbA3ygbMarg7+g3JdGpmsnLiHB0W2Sf5QYGIiWXFIw+ftMnOEcK8b
	16tdGHw8GM1RmiSVyTtBSQbRjy8Bn0X0NXyXrvzPzD0ulmrl51Z8VfSlN3dVS+OHq2B3P/gusPIGh
	EuUW3rDM7yQhbQCAFzulg/l+df8q4q8gmhE6iCCnv8JY9GNH2318VR+o4+zh0/IC9UdTtdRZprhR/
	4SKG1ycmTShH0+uKz4OQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsQy4-0003o5-Dx; Tue, 30 Jul 2019 12:11:00 +0000
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsQy1-0003nY-GN
 for linux-riscv@lists.infradead.org; Tue, 30 Jul 2019 12:10:58 +0000
Received: by mail-wm1-f65.google.com with SMTP id s3so56900551wms.2
 for <linux-riscv@lists.infradead.org>; Tue, 30 Jul 2019 05:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9L0zBGqIjlWL1IQrDXZZd5jCWfrUHuNyOkNCDrFw/Cs=;
 b=hSOZnImNn5rBm3V7xkjq+ZrqFEHcAnENiIbOrgsYUUv2bdVd2rMUKlJp6/NNhcZlLN
 6gPN4hIZLF5cyum9J8884Szf/DNspdGFVHs2rh4bhWlPPN14+b8NkW5KHp2vXW5mgoIK
 cvqiyDtGeXYvc73t3x8eo1gbhFjCFT+qLLq+sHFRV/kbIq10AwHdlHZWb8VDpmaRMgIS
 JlrdopwL71eP/FmZb0aAT+E/r9qwPn5mEWVsXlcUdKVgEDgDqLFB4noM5sx82Tm+4xZQ
 7fOHQSl2yABkotYfXZHwQbiOkcnJYjxh0svWaykXoy7zX8CRx9wokbhfKtaBUdKnNFnf
 N09g==
X-Gm-Message-State: APjAAAX8otkf9PwONrj02IjTjxV9wIgWIcJO9MpIAbaCYo7XK/QMi9xP
 dPFe+/uPcZOpgM4g6mEG9F7lasUR60k=
X-Google-Smtp-Source: APXvYqzRKfHoZNVIgIXgBiYl7T8xPjJrXf2ElRHPMC0DZvjUOPtbRAo+bHcxkpSIp0MMlJYsQjsIbQ==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr105796251wmk.79.1564488656203; 
 Tue, 30 Jul 2019 05:10:56 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:29d3:6123:6d5f:2c04?
 ([2001:b07:6468:f312:29d3:6123:6d5f:2c04])
 by smtp.gmail.com with ESMTPSA id t15sm56691815wrx.84.2019.07.30.05.10.55
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 05:10:55 -0700 (PDT)
Subject: Re: [RFC PATCH 06/16] RISC-V: KVM: Implement
 KVM_GET_ONE_REG/KVM_SET_ONE_REG ioctls
To: Anup Patel <anup@brainfault.org>
References: <20190729115544.17895-1-anup.patel@wdc.com>
 <20190729115544.17895-7-anup.patel@wdc.com>
 <3caa5b31-f5ed-98cd-2bdf-88d8cb837919@redhat.com>
 <536673cd-3b84-4e56-6042-de73a536653f@redhat.com>
 <CAAhSdy2jo6N4c9-_-hj=81mXjHjP8mvZy_8jOdRZELCyU9Y8Aw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <9f84c328-c5ad-b3cc-df0f-05f113476341@redhat.com>
Date: Tue, 30 Jul 2019 14:10:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy2jo6N4c9-_-hj=81mXjHjP8mvZy_8jOdRZELCyU9Y8Aw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_051057_547549_76F61C4B 
X-CRM114-Status: UNSURE (   9.44  )
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

On 30/07/19 14:08, Anup Patel wrote:
>> Still, I would prefer all the VS CSRs to be accessible via the get/set
>> reg ioctls.
> We had implemented VS CSRs access to user-space but then we
> removed it to keep this series simple and easy to review. We thought
> of adding it later when we deal with Guest/VM migration.
> 
> Do you want it to be added as part of this series ?

Yes, please.  It's not enough code to deserve a separate patch, and it
is useful for debugging.

Paolo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
