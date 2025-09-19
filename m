Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7B6CAC59A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 14:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Cc:To:From:
	Subject:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=11IcY6j105REAOsod+ee1dpth0IkIGau9XozfTltgfo=; b=pw4f2ErfCkO7Nq
	2Vj3i/kZ9SQenVNpBPCbyNaoN7yUqj3QzE6b+U5bMhVkcuH2J43jFigOf3NK5EoL0jUK6u610lgqX
	mGT5wctPxAajV9jKEMgQX/5L2gzJZ1PbDQ6kvtac/4V5j7Ogh+A2+3WTjoTOylOTAQT8YOVQN8ymN
	4munxqqCh3BBJvpbDa/rnOQ4DEDCkeN6pVCHAziW10MkcImMGm32DaGronvXPnEFulK0mSvly+/4T
	wxq/WCEaHlfdySfl1SUT9t5fYbkcUllirnccheri85/ZTtGAfIVpDRtPImq3b7ckFdCZNe1oHe4ij
	JTvVcRuCYb7CxI1rFwrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcZp-00000003Ell-0u94;
	Fri, 19 Sep 2025 14:59:09 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcZn-00000003EkK-2ZbT
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 14:59:08 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-77e69f69281so847315b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 07:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758293946; x=1758898746; darn=lists.infradead.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+1oaj913MKNqaBevOphiHNrDtxzxcnVJ845ccXPHec=;
        b=aVvGuq8Qrjv/pJTaUGA8Pb8348qxbTmfxYluoT/gMSCVvRuO57eQPO23dnQFwbkMaK
         8DV7V5AL2wDMm8SbMDb5yi0JmBjUghpIVcsJfOcBcVR1ubgE4uksboffQlw+Tni89z27
         nTeGli9lSo91Id6jkv7OBiUjkWZuRlC/zjMjXoR6HWAzE+5DnswvXzSaVZ6opwW7H84j
         tdl71juFEtb4CwCcQeoRdbU99uejdTCh8lX6ZP1irzmbyVgGWnB13Vo8LVdwHapX6qwt
         YM2UrtTVz8xku5zGXVKjvBeHhQACUsWWbF3QGstEsN96n/J6LyaSgvvvjJytnAg8hjYJ
         gfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758293946; x=1758898746;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I+1oaj913MKNqaBevOphiHNrDtxzxcnVJ845ccXPHec=;
        b=gSmfRKzCRekgibZBtJhydgdy64LuY3I3FhbpNhDJim1iv6unmfCwS5N6tKi0itxjh5
         TssXDjP+amePjKvJ/qs3EVM8S3nbitnMr+jGZtKwcxq/zIweZRV1ckCD+/Y5Bta2IIBt
         RjVDKB7Uza4H4TIR3ZMWKvOXwmJkPNFnUQkcq9RL+BeydieEgL75nDytsXMRa0EqhJU8
         6yDryeEgRmlCkywn8g4NJZYT0dRFD2N6zm7BmfMfuskSZIZLZM+83vrPfsm45NL+Gncw
         rMvOlz4YK8XwArWojODiKSulkLYaA3lhRmn34NYW+sNF+bd3NdzbuedeFaKaKa2pAvyy
         rMoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrKUf1GsnBfAsxa8EBFAIZRIOHh5ogAOClCh6Bq6SQGYG+uuDzr5eniNKEbKQkolxipfaT15bOAW9Ojg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9nIHvPybiWDGT3ztjU8BK41jHmDJYSA8A/X9g8wn1+K12bFhQ
	K1p+M105lhc0vJyEFW5/nYfepJhqPFh0wdmXOdobe/bAuq34IHBxtQ67Tlffc8vdWwM=
X-Gm-Gg: ASbGncvhpctr0od2wHbDdaKMtNluxzChTtNQDJNL4dEJmxX7MdhIHvr07hvZzFqIPXm
	S/7ngdFAAFmARwX4ZNizhxOngD3OPK6M8A2afolhpDzuO40O/4FR4FYUZTA1FLEoiwwp472J25K
	Id93ttIb7wHkAq3oXwGBK2ybcXbVCRG67MIIdcUCWjIj7S8sVygKEW6ELWRDGLerPXk23cpprCG
	vDqyPQEge3lQMCefA0Qpf4/bacQVDMkN2VZ6XFLU0Azkjh0MNUXjzBD3xXRS9ckjzf9rK7ThE5A
	00JvriSrRyL/D5k2q9uRSG4MQ/YW8sO5zHc0B38sfi2vDgghb4wWxsdjmYYwY9e149v1d2X2FUs
	o/TiThFpsORwflZhufRRimR/1w8Y=
X-Google-Smtp-Source: AGHT+IFFZacYrP9LuAdO/G/eB3yru0znMIk726z4N3uDy6qR+Epo6GHsw3izcq8/C5XRXoqAtVbSuw==
X-Received: by 2002:a05:6a20:728b:b0:243:b62c:8a7d with SMTP id adf61e73a8af0-291e4b6ba51mr5661567637.0.1758293946202;
        Fri, 19 Sep 2025 07:59:06 -0700 (PDT)
Received: from 166871acc15a ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfe6691d7sm5606523b3a.56.2025.09.19.07.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 07:59:04 -0700 (PDT)
MIME-Version: 1.0
Subject: [REGRESSION] riscv/for-next: (build) in arch/riscv/kernel/entry.o
 (arch/riscv/kernel/entry.S) [logspec:...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: gus@collabora.com, linux-riscv@lists.infradead.org
Date: Fri, 19 Sep 2025 14:59:04 -0000
Message-ID: <175829394378.230.11893936339643702468@166871acc15a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_075907_748733_0DFF2362 
X-CRM114-Status: UNSURE (   5.38  )
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
Reply-To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org





Hello,

New build issue found on riscv/for-next:

---
 in arch/riscv/kernel/entry.o (arch/riscv/kernel/entry.S) [logspec:kbuild,kbuild.compiler]
---

- dashboard: https://d.kernelci.org/i/maestro:b5288fe5157b1f4b4c95bb5102588c7874794ba5
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
- commit HEAD:  a054965b36af884083add1a286cabf98caca549e



Log excerpt:
=====================================================
arch/riscv/kernel/entry.S:458: Error: unrecognized opcode `alternative(".dword do_page_fault", ".dword sifive_cip_453_page_fault_trp",0x489,0,1)'

=====================================================


# Builds where the incident occurred:

## defconfig on (riscv):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68cd6d0c75b320799d2ffc60

## defconfig+CONFIG_SMP=n on (riscv):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68cd6d1075b320799d2ffc63


#kernelci issue maestro:b5288fe5157b1f4b4c95bb5102588c7874794ba5

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
