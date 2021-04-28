Return-Path: <SRS0=fWiV=JZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9CEC433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 04:15:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ACFF613ED
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 04:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4ACFF613ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A3bJqTMUpdKd62WnbrVQqP39pXb1Ed/ZC5gQ8J6xli8=; b=Mdu4QhxS+vXOH3FRUgN7qaraUm
	riy+LL9yev83Kd69TnvcTRz6WoK4XDVjG+Mg4+ic+7peRFj+PDiCnGDBlu2XxeCsYagEwL51wQUjX
	ogZzuZqyc+9FrOQJ8vZZk0U+sZARFYADfgIFXigmm4+P19zkoHuSsWXZqgy4AxdCb9qRzW3Jcpuhf
	dvAqSSdWuXkTKZs6w0prbrAdhcHnE37zHkfONSjh4Xcg29nTCS3G/KEv39mLBrRT5oljHN1elc4j2
	60srK0dU3kHXGF34YFn/UM4RCoN+TghAKxoPncm7OEcaGNRmcX/3GOlUEcozT3QWYpynq2KXbkzVw
	tlfb+f+w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbbb1-002jYf-03; Wed, 28 Apr 2021 04:14:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbbax-002jYK-Uw
 for linux-riscv@desiato.infradead.org; Wed, 28 Apr 2021 04:14:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=KDHkVVYm6hBaMYBkXAgpTY990Od3VDPZXR1b+LSLQhs=; b=G4a8HCgVNx1oi1ty9RiyTAlH2k
 7Dpw39FvCUx48JS+pHE49T/+1NUhwexdt3HHvJvkwNFg6ZQGI07qnJPPi0ZMwUJH/lvhhAdcKwiul
 Qvk7gp0BQb6UM08UT84/4qLws0POjMjPDENNhEUR95x03IoI3FwjE41luteUY44TeH4797fPQaq4z
 ATjqgP5wbzhdtRxox/6+maFfIZe4WZSc1X82483iiEavlca4d35v22NTeYvPE9hvrYDyddrku3ZVV
 1wRfWnDz+pyRmpmD0gkv8KUz7GTH2pXbcd0RKUBObkzPpVv3crEYMCJ74ILS35DMHKk10DtBNkF3P
 vwJbMWFA==;
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbbav-00HApo-8i
 for linux-riscv@lists.infradead.org; Wed, 28 Apr 2021 04:14:38 +0000
Received: by mail-io1-xd31.google.com with SMTP id b10so4033595iot.4
 for <linux-riscv@lists.infradead.org>; Tue, 27 Apr 2021 21:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=KDHkVVYm6hBaMYBkXAgpTY990Od3VDPZXR1b+LSLQhs=;
 b=MOowmMYbDUTZkJIMiIiyFJQDwoM0MvifXfJ9UIQS56WaiI7rVfKcDPSAGxr4jR64nz
 vXplAyQma4c8Nj7rQWrhpv1zNZxC9q5ak0ng3DKupwJvJP4XTftAm0jdTFDcNUFHcgwU
 xnawjMr58La0AkcNxWE0bm4KGHLKBcem/uJhB6yCaw4hXFgN9JhXOQ/FBPXhb/V02vkq
 NOr+ogZ7UzYQDlKuOX+wIA9npB2aowT5pPHxqTYlmZECfgXhZstfdK1lsnGKNRVSn8ve
 9GZ6Py7fqfmBOkKYLSt50YCCyZgYjR6P950GEcb40zxUNGgQmhR7DKW3XghWM2OkEmfA
 r82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=KDHkVVYm6hBaMYBkXAgpTY990Od3VDPZXR1b+LSLQhs=;
 b=DlS46ZpZRb2xzjdWF55oqrAO9mTl5AfW8JiwOIsOiGDETYv0OQ3rlaGv1Rp/ReMTVr
 X8RXk54kQyNHRhetXRlJA1dwLLaFOHYdzWwi5AV05dUMtIr22Ul3ObmbwTbaNVpFEtgY
 Vj/qb/Qq+MyD3/i420TsF0jKzc/VXKaxWWJnUXzZpZAktoeEXgHTTW/R5o8rsXPe1rJr
 6813vkjtegRvMd9Qb8KZ3zXiYG9AHtrL7UhfyUTUQvSdorXX25dUMl/b9fg0mdhfD/2M
 faQFAKxg+TGWV8dArMokxcWi3NDVyYAbbw6YIWXnU0nF4eNJNqi6YettUcfsp3MXmmGD
 4cYA==
X-Gm-Message-State: AOAM532XvDgYUNBGsqaETsgQI9zJ9I8H+Nos078uZW1oZPtSK2O+c37+
 v+yrZOFHpc1FbOGoY8hGYkHudbdtYEfVt6xxYMs=
X-Google-Smtp-Source: ABdhPJzFK5pECLSZt+y9EL4BdEG0TjzDlptbkrW7xj+Yi0w+J2WCxoZWB4HHJA9heFBOiZ7Ox6jVGcOYLnThaXOBm38=
X-Received: by 2002:a02:662b:: with SMTP id k43mr24443251jac.139.1619583275234; 
 Tue, 27 Apr 2021 21:14:35 -0700 (PDT)
MIME-Version: 1.0
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 28 Apr 2021 06:14:24 +0200
Message-ID: <CAKXUXMz51GMRM6s7YqGYgfZwRhW=y0aCALM-C3APU0=GjZ+X_g@mail.gmail.com>
Subject: MAINTAINERS section RISC-V/MICROCHIP POLARFIRE SOC SUPPORT with
 invalid file references
To: Atish Patra <atish.patra@wdc.com>, Conor.Dooley@microchip.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_211437_340605_56EAF5DB 
X-CRM114-Status: UNSURE (   5.33  )
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

Dear Patish, dear Conor, dear Palmer,

Commit df29598aaf5c ("MAINTAINERS: add microchip polarfire soc
support") adds the new section RISC-V/MICROCHIP POLARFIRE SOC SUPPORT,
but that section solely refers to files that do not exist in the
repository.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches    F:    drivers/soc/microchip/
  warning: no file matches    F:    include/soc/microchip/mpfs.h

The patch series, [PATCH v4 0/5] Add Microchip PolarFire Soc Support,
never adds those files, though. Are they coming through a different
patch series into Linus' tree or do you intend to refer to other files
instead?


Lukas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
