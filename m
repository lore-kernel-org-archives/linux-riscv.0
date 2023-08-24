Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEABC6FA8F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 18:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=VQrQsWLYFvV/BNAVtvEdFY7OmAp4Oa30ezFhT74F+zM=; b=ljInyJ5Uh17CSVMtP03i4bQaZb
	ULUHepgC2AZlkQCsE9m1kbKPLibEPVMVqI06VwxC+GrgldJy0uyy54ibZjHB92UiKR1alyStAiRFq
	C67k0sWowsy4ocvWqlne1cdFUlxZY4nbCsUQ0hS/+eUQZ5ddPxHTd+lzFWOkIu0SNrlMTyd9kXFUr
	U/2fDAMmBe2YjmaFA1ehH3frrjENN8tT4eDpo4hDhvFR53Udj8vsz5+48HdMoJiisrultz+pqAZBw
	FxnQ3VWnSTQFyu8QN8GRPHdnpDOnefrRbmN9sLqQ1k/3g2dXb8Syqn19POoOj39Fu6TCm8tGvPAes
	yFvpERyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZF5O-003aat-0W;
	Thu, 24 Aug 2023 18:29:38 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZF5L-003aaD-0C
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 18:29:36 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-26d50a832a9so51452a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 11:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1692901770; x=1693506570;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/1YcSecukI/DFCrztrORLNsZGL+keJIV6eV7Ksjr9Gk=;
        b=BOqwKncfGAv7/sk10fo5h2uyW0w/tgq6WrtbnuolTn8KoRL9jeuPUXIby9JnccqFq3
         CJHaRQTUzGjOy+/HSYJSbQnHhhApCmRk9X1EKYcx4HgrRH3HCGU/GL9P21pxsMRmJQ+e
         TxS+zIrVgqZmXS/K7OWgaxaH4QqkwdK6noTPb+IYTTDrjjPT2rFT7IpfzZOsP2FJkWld
         QmJ8/Yi7gahlB5c723fPBLLGaWi6WHhe+LvqlXg+XcXjTuoGQApRIyLCY/6hyoAi/iKg
         hMw+8S8hD2PiK4OJg103GUAMSZ9Q7OK40HoX4dQ3i19KF0D7DDW6EwiwC4eG86/Kd/TU
         AftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692901770; x=1693506570;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1YcSecukI/DFCrztrORLNsZGL+keJIV6eV7Ksjr9Gk=;
        b=eZt02i6A3FGdgxblBJRcuP5saX/BSkN6txb9+h8E7T0Gz1hfMM5BPcNFSj//E0r7T9
         Qb0ua4NSC7LdqBR16xRlbUj2QxfO/7MqmlBcFXHBIbPm1zSCz1KhJAPS8lpOH598zT2c
         YXIjAtOjG+SxskES+gtVyZAyQUsW5/3UttLfP0+vFjKvLwmk110GCSEWxt3m8XhAGIV9
         hHXasJ1J99zN/kWMrEJanIVZApjK1d7T/wP5vCHKsBGcoK35RpK8YiO1EQFF1jpvKmNJ
         JhlqKWjd6HVsqo5YZjo1F7F+NpWth9jb8mutLrF8TV4jOxdfmmENHbkHYHHXyFr7U7P1
         7+OA==
X-Gm-Message-State: AOJu0YyY6H24geafjRJpdDPWsFbHEAmzxc8+TR7lmQxYwz2lI1u46T5a
	22I0jwYzTDPXhemR3dRdeuV5mA==
X-Google-Smtp-Source: AGHT+IEj3DSxzNiMBroPsK0WsOrwhwhGUAIwXhWz1yAAmXCG0m396XZ+r/VKHLDvYZfeoEJd6N/nvg==
X-Received: by 2002:a17:90a:dc05:b0:268:a691:412f with SMTP id i5-20020a17090adc0500b00268a691412fmr12818362pjv.39.1692901770550;
        Thu, 24 Aug 2023 11:29:30 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q9-20020a17090a68c900b0026b3773043dsm46714pjj.22.2023.08.24.11.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 11:29:29 -0700 (PDT)
Date: Thu, 24 Aug 2023 11:29:29 -0700 (PDT)
X-Google-Original-Date: Thu, 24 Aug 2023 11:29:28 PDT (-0700)
Subject: Re: [PATCH v5] riscv: Handle zicsr/zifencei issue between gcc and binutils
In-Reply-To: <20230824-cortex-mobilize-8b94e059e130@spud>
CC: xingmingzheng@iscas.ac.cn, Conor Dooley <conor.dooley@microchip.com>,
  patchwork-bot+linux-riscv@kernel.org, linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com, bmeng@tinylab.org,
  guoren@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-a2e62840-6065-4435-a82d-b09054e8f254@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_112935_101021_06E837C5 
X-CRM114-Status: GOOD (  11.60  )
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

On Thu, 24 Aug 2023 11:05:13 PDT (-0700), Conor Dooley wrote:
> On Fri, Aug 25, 2023 at 01:46:59AM +0800, Mingzheng Xing wrote:
>
>> Just a question, I see that the previous patch has been merged
>> into 6.5-rc7, and now a new fix patch should be sent out based
>> on that, right?
>
> yes

Ideally ASAP, it's very late in the cycle.  I have something for 
tomorrow morning, but this will need time to test...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
