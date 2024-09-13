Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C208EEEC08
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 03:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6IumsXRURrUXs364VF904a+WSRyyaBU5rLG6P3mZs1o=; b=YB9XEuIfIMDF4V
	eRl8htKlGWuktSsQ+bGJFYaoJHN8IJJzRrYmdQTAEtDazMAde596uWL3AsONiMGFD8T4iPQ7dIgFm
	xkPsHdP9Be0U82sBsZmqXPgfO5rqMcMfeieymnz4VRdpERcA8wFj/AsrUghwlFtt0uI4c7NWgBhfJ
	431qKFVuHJzlQeHN536YbAwnod9TQqUni8blJ+NfdtVhrW2zxbR5SQQubOKa5tFFV55S5WDcYfnAT
	1k6p+7lCR0HguotVQH/nLa6sSA8pyXLb8Tjny1PR4w6zPQUn88RjBKR9Ex9q4cXNQod5D4CkZxm+Z
	jpNl+OQwwMk5uojxm6wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soxBz-0000000EpsK-36Vx;
	Fri, 13 Sep 2024 03:41:55 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soxBw-0000000Eprv-2afG
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 03:41:54 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3e0438e81aaso264178b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 20:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726198911; x=1726803711; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WiG+fM+7N9Q40JfTc9raIwTA9+J99+5kuXFj+tWJcxo=;
        b=MtXhaNGhiMgQavApZwk/ClFQWq2BoeLCaSq21C4dX/ddA85C9T1mrfm2MX7IJJHGox
         Uef0OHhMfoNUGYLzZ+YDra1klSDKn+MD+lG9wNvSzb5a1q3KZNehLqxoUogbqHCFCbIO
         /+EIE/tP4cdERJpXu/eDFIpMJWHuS6G2L1A7mandjv2rzrBrV7dGaJIyB2VTNB1UnFJu
         668bbDHXIk7xI4fKQZ0K/QG46d8Apl4qR2fK2JQvG4Njb/wW0isS05/zK9AMS7qtlzgj
         Qrsrk0VYhDyFbKJBUYFPRMISGlgQTGR5Z7uSfONK8gRQeG/MYw1tQn7R/X59WBSHsrI/
         eEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726198911; x=1726803711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WiG+fM+7N9Q40JfTc9raIwTA9+J99+5kuXFj+tWJcxo=;
        b=P8QYQOcbAWH89Gzt2SMwhhVWIieLTz218/wPY79kfFQL75A46az13BQV+CNbq8W50g
         s4I643fPfUVmgxafOjz7C5vk3y5NpIa73bWFeuVvzlXdacHh+NeIG8mI0bH3yrzSiJ4C
         aWHLGN4VpwYSfKxqeMVXSDlvbjAI+CrsoWWcXo3W2SFnJYtsbs8dB3FQkE9XH3Ai6PnM
         Wb6qJRnzo1Gt32o0ai7ikrwUuA6Ylurk397mLSmj72Mx3nUsMrpS8ZkH34IjzMgBiqIn
         YZXrIqSQQeXL77czNw0oDsqtw6yLux7141TaioWb5FVzBHNQmioGxhmrolorddLBnHdA
         imvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHhA5K3klM8mJ601sgz3eIU50IiCpFfwmbdRFHRjevHPCJ0hMv86mcvuGFeUtvtc2Og+DcQ83AYiQZeA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yylpt76kPxXP5XbqnJl2c62mnlY2roDT5aUzurFKu1nplnO+Nv/
	Pi2Tn8TvsT6OV+1TtanygLmsJ5lln5O6OdMVfmkR1cOEfXuwvFvVfQk7VU6TH4Q4NFDqxrTfnYi
	s8o0MWg836GTa/KFna06O8RcpvdA=
X-Google-Smtp-Source: AGHT+IFapc1fMjHxFBGJ0qkUtd+XJG4w0zAhtt6ixANanpzleOSJATkFV4GdeXlL/n6mICeMMpYCQrQW1V9fRfCBD5k=
X-Received: by 2002:a05:6808:192a:b0:3e0:45ea:7fbe with SMTP id
 5614622812f47-3e07a1103c3mr858054b6e.13.1726198911381; Thu, 12 Sep 2024
 20:41:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240913022635.751505-1-zhangchunyan@iscas.ac.cn>
 <20240913022635.751505-2-zhangchunyan@iscas.ac.cn> <ZuOv55YsorfvhlQi@ghost>
In-Reply-To: <ZuOv55YsorfvhlQi@ghost>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Fri, 13 Sep 2024 11:41:15 +0800
Message-ID: <CAAfSe-vQCG=RRGwxEEWR-HE5LGH4XniMWi=nTzOOQMrW_fvRUQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] selftests/mm: skip virtual_address_range tests on riscv
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_204152_683913_76EEBA4A 
X-CRM114-Status: GOOD (  15.62  )
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

Hi Charlie,

On Fri, 13 Sept 2024 at 11:22, Charlie Jenkins <charlie@rivosinc.com> wrote:
>
> On Fri, Sep 13, 2024 at 10:26:35AM +0800, Chunyan Zhang wrote:
> > RISC-V doesn't currently have the behavior of restricting the virtual
> > address space which virtual_address_range tests check, this will
> > cause the tests fail. So lets disable the whole test suite for riscv64
> > for now, not build it and run_vmtests.sh will skip it if it is not present.
> >
> > Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
>
> Which tree does this apply onto? It is failing to apply on -rc7. Also,

Oh, it applies to -rc1.

> since this is the second version of this patch it is good practice to
> put v2 in the subject like [PATCH v2 2/2]. Anyways, the content of this
> patch looks good!
>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

Thanks,
Chunyan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
