Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120CCC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Mar 2022 18:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bbgrxq8H2hqwKEcYvmsQ/vHlWU8GyJL19thnvZ1sR8I=; b=3qy12/LQe99B02
	GUkJP8fYiQvBNDj2c1qcnx2LAqXOeLu2MQq8r9I2RacWkD4w4uqehfmITtsfIhizG+/BPJ9/WeZT3
	2Mmz+EAsEvzqTqk9FWtC1S7cMJONtJ/k4YNlDZp9VAWNyF02LEDD4PV9Bn1gzo0ttD0BCsOfzH24g
	zFUI6gAJWMwIPFMUkYozpmV3lQkqc+74wPOYkA9DgGcVMVHVC9c8KB9C2f0qa9y1WTVMQT1PzdJd8
	KxynTj4LkV08JOj1En13dvnFxNbiuSrgCXn5TyLyjmSUPKYDZEhNbVGJkksTaQrHVdnNPZByqOaFZ
	c3g0E+9ZcMeMUlbLl2MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWj5O-00BqwE-Lr; Tue, 22 Mar 2022 18:18:26 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWj5L-00BqvJ-OL
 for linux-riscv@lists.infradead.org; Tue, 22 Mar 2022 18:18:25 +0000
Received: by mail-wr1-x433.google.com with SMTP id u16so23612263wru.4
 for <linux-riscv@lists.infradead.org>; Tue, 22 Mar 2022 11:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Au0wuGbmyZQRc3YRooDi+lrIszQt6rNnlcrfEDXqtwM=;
 b=mXhuIMjn3uChtCcb9K8CZhFjjPYtbSBGn8NMsUNFxDideafXuSwJUpedM6R5NkuD41
 FWodwy/Zvv2BSJCJ6e32JpS18fFx7FY0lvk37TkItGCwdtB+yU5idyhXuiemVKE18V0C
 l0QquQJW2o06l3mJTYCKgD3MpzmwURJInuRHOM7HTvRdIxV6/dKbwY9BEuIJdlyqLswQ
 yu7D6bN6COkQhTMw+tRbDgkQycyMvHZLHG/AH8r/GHfE9g148SbWHA7YERGAvqYSLwn3
 v0FU5xXPaWOTSku+mt5Szj0T2gQQXoVEKOnOWDR7bAukdFSUyKm3n3XOLAHcO2q3zcsw
 dfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Au0wuGbmyZQRc3YRooDi+lrIszQt6rNnlcrfEDXqtwM=;
 b=7SBPSYWQTlH59A3esF3x6kRBydEcbRrfkkTQPSe5wyFjBk7JpV90EznkRzQpbmxwF3
 3p/nMO2d6ZezjCW53xJ+llZ9GUYVINPTQtsdqULC7ri5rrJb1xrmSSLKdZt7fxpP3FH/
 dWuen7ChZN1GezHqK/RhOKHLOo4qBI1+zQD651VdJJyHeAUmebTqRMRnXrTYKUpZy2Fr
 NLqLAccjTvnQe1LwWGX1ED0YjNELNkpMye4F3ov4TExgPE/BEgh2ngvlHswhHttzSHrv
 95AENZiKEMnpmGZSkF0ebCopUHVmAIl9rhLxlBl2ARwQ/d8s/wvSwTQ0bW9dfo6/ztIa
 ejFw==
X-Gm-Message-State: AOAM533fKTIFxOhkhvnjeyarby3VVWsFuPVPJmL7ZLYuiQTWs6voUS6H
 C6qrIYiHsmkUQkk3Gr5ZD2MwLw==
X-Google-Smtp-Source: ABdhPJzo+v251N7F/kHeIIlbL9L7OkMaXL6JiW+aiVCl9WMXHup3N+5Shv6bcH5nGjpVfy+o5CVcdw==
X-Received: by 2002:adf:fe8d:0:b0:203:e02e:c6c7 with SMTP id
 l13-20020adffe8d000000b00203e02ec6c7mr23986364wrr.37.1647973101291; 
 Tue, 22 Mar 2022 11:18:21 -0700 (PDT)
Received: from [192.168.2.116] ([109.76.4.19])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a5d440d000000b00203f2b010b1sm11796069wrq.44.2022.03.22.11.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 11:18:20 -0700 (PDT)
Message-ID: <c0328672-6dd1-b65b-1e2f-6f2562084f2d@conchuod.ie>
Date: Tue, 22 Mar 2022 18:18:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/5] Generic Ticket Spinlocks
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
Cc: jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 mingo@redhat.com, Will Deacon <will@kernel.org>, longman@redhat.com,
 boqun.feng@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, jszhang@kernel.org,
 wangkefeng.wang@huawei.com, openrisc@lists.librecores.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 peterz@infradead.org
References: <20220316232600.20419-1-palmer@rivosinc.com>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220316232600.20419-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_111823_895506_8723A581 
X-CRM114-Status: GOOD (  19.93  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 16/03/2022 23:25, Palmer Dabbelt wrote:
> Peter sent an RFC out about a year ago
> <https://lore.kernel.org/lkml/YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net/>,
> but after a spirited discussion it looks like we lost track of things.
> IIRC there was broad consensus on this being the way to go, but there
> was a lot of discussion so I wasn't sure.  Given that it's been a year,
> I figured it'd be best to just send this out again formatted a bit more
> explicitly as a patch.
> 
> This has had almost no testing (just a build test on RISC-V defconfig),
> but I wanted to send it out largely as-is because I didn't have a SOB
> from Peter on the code.  I had sent around something sort of similar in
> spirit, but this looks completely re-written.  Just to play it safe I
> wanted to send out almost exactly as it was posted.  I'd probably rename
> this tspinlock and tspinlock_types, as the mis-match kind of makes my
> eyes go funny, but I don't really care that much.  I'll also go through
> the other ports and see if there's any more candidates, I seem to
> remember there having been more than just OpenRISC but it's been a
> while.
> 
> I'm in no big rush for this and given the complex HW dependencies I
> think it's best to target it for 5.19, that'd give us a full merge
> window for folks to test/benchmark it on their systems to make sure it's
> OK.

Is there a specific way you have been testing/benching things, or is it 
just a case of test what we ourselves care about?

Thanks,
Conor.

> RISC-V has a forward progress guarantee so we should be safe, but
> these can always trip things up.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
