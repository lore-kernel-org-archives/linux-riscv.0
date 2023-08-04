Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE20AC001DF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 00:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eNT67v5tTJXMwrjpma7HTVcuCqaR6Wb8iZAbN5i2Elw=; b=cvDZqr0d2CjpcJ
	R8PSuWVQlPer2yUSstplQBQ4NZ8iECEP3jObAzjrOfFggEQM9HvuUYt3hEW6LdHVvH2143d1xlkw4
	ykFHBjQHAIm32E20/1kZeCzCBFP8IfdT2Kw5szVXo+Td4N/S4yIQrIqjqRBXhgCBYQoLAhv+7OREV
	lXto+gq2cH8FIWiujtimJxjuU90aS/P++y7g9RVos7/grl3HEPJM4v0R2ztyO7U8rDQmzKSrcAPhU
	HYJ8rsLYnVrHi3X9CxJwkdYaboRPuAqEfyx1BcaIoTei+lpFxLxNTUogcy4GkMIHQzLvI5qF25A+p
	7JPUbzZAi1UdMmArmp6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRiVL-00B9IW-0C;
	Fri, 04 Aug 2023 00:17:19 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRiVH-00B9HE-1y
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 00:17:17 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99c3c8adb27so206960466b.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 17:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691108225; x=1691713025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=78WVpSFpmXIbenrd24m7JltYbyEgqWinokwRiqNn9QQ=;
        b=E/jDfIK2P7ezXzkHxMjGuX+UXJ25ZnGTJfHravOriqzEKVZuGwR5WHHZntMJ+3qi3X
         39pSODl09eX5RxwlK1rpY7wmFWVmZ/RKoC4E6ozOqYwFi+Kt4o3LThVRyNXSFC93SteX
         GR41mxvguKLqiMd4E4m/JR5oyQNEBFTDKYWldraPle/wraXYV0weMeJmybgmsTP3p59m
         j3/hQhbpSFsrg0prGYnmFfORmDCI9NNcs98ql5kQtklo5y5vFjLQAxOFlLydYm+0L6po
         /PO5fyg80tWctmW8TT6H+JgPFO3u7BAAgx/Bk/BCIUny71pNKVpuVHg9QPydoyFuLWsj
         u8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691108225; x=1691713025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78WVpSFpmXIbenrd24m7JltYbyEgqWinokwRiqNn9QQ=;
        b=hhlYxYzTwQ7mObdTM2C0IyK2jfg5Irt26y88PerPBaKO2u31h9+gGTDmnqJM6YHKXm
         IE/bKZdw2cuzqIBCIAluy3D3+pCAcEsBC+S2Mpxd+bcITG/30tWSE5UoPPf2/IxtORmH
         067HTd9qy5y6jxDpYrEA/x7IviEFWRK3QpPxwjsXDwTx7eX5j0xf2VtIryoaUM4siHPA
         uOO5ktsLo3kEWBD8UNdyro5MJUzfdczOZckcMzQ51xeRe29VH0h3U9uZa5O92BVh9qcj
         JwM2I97mNb29sFaWPbxmcVQXnCB6nch+vdIC03gVsCbMxIFNsU5yqx2gMSVqlcnQCfEd
         6IcQ==
X-Gm-Message-State: AOJu0YxLN3UejOstvjekXa7EQjMFZsvDv0svoRRKjCgaLKXD4fGdEFz+
	W+N6NKuCXVJY8JY/W0yN01w=
X-Google-Smtp-Source: AGHT+IEVYwWjSGw0bWdHrfva2E1QUgg7WDVWqP78y5nlSx4Cenv4Ku+OxLKP+jOA7Ks4k0GA3uuw3w==
X-Received: by 2002:a17:906:8a5a:b0:969:93f2:259a with SMTP id gx26-20020a1709068a5a00b0096993f2259amr130217ejc.73.1691108224562;
        Thu, 03 Aug 2023 17:17:04 -0700 (PDT)
Received: from andrea (host-82-57-177-142.retail.telecomitalia.it. [82.57.177.142])
        by smtp.gmail.com with ESMTPSA id r23-20020a17090638d700b0099bc8db97bcsm477089ejd.131.2023.08.03.17.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 17:17:03 -0700 (PDT)
Date: Fri, 4 Aug 2023 02:16:59 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: paulmck@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, mmaas@google.com, hboehm@google.com,
	striker@us.ibm.com
Subject: Re: [RFC PATCH] membarrier: riscv: Provide core serializing command
Message-ID: <ZMxDe0gXKYbY5jgt@andrea>
References: <20230803040111.5101-1-parri.andrea@gmail.com>
 <ZMvLoI6PxLR8RJvR@andrea>
 <4bf79f06-4593-134a-04dd-b8f89e96a1b8@efficios.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4bf79f06-4593-134a-04dd-b8f89e96a1b8@efficios.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_171715_665894_AB25D306 
X-CRM114-Status: UNSURE (   8.43  )
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

> Can you double-check that riscv switch_mm() implies a fence.i or equivalent
> on the CPU doing the switch_mm ?

AFAICT, (riscv) switch_mm() does not guarantee that.


> AFAIR membarrier use of sync_core_before_usermode relies on switch_mm
> issuing a core serializing instruction.

I see.  Thanks for the clarification.

BTW, the comment in __schedule() suggests that membarrier also relies on
switch_mm() issuing a full memory barrier: I don't think this holds.

Removing the "deferred icache flush" logic in switch_mm() - in favour of
a "plain" MB; FENCE.I - would meet both of these requirements.

Other ideas?

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
