Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F196CCD4F57
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 10:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EkrTVH1cpIrC2FUIxG9VuHzjPNucoxTurAzV0jsFtpA=; b=CKFEE/pOMTzgpkQyevzEqPZQ6W
	bktiMszXHAXfO+q67ZGQe8ZM49UVksZ4QONkE8+Ucj+9hN6YBCWijsbQ6odo3vhtbUI9S1vggcny+
	rIie6NnX53zAVcZfR0d9QY4njPFkbIOw2g9LH743aDjderYl4R7RD9ZExtdcabsrvJETaMUPpjRrX
	U0pxAs/lJTIpC3MReWqywdMJkMmfXWs2iQrdhywFNz4gfn1JxgZ6mfD5V0AWdEbxpCDTlaLaNBf0D
	yvRbRPp0+Tjn2BeWgh0Wgsv+T/NYIKZFh5q+L5rA0Y3A1X+1AHlJ1TM6Tzv/kpcNZSO9mcEQKeca8
	9mG6/raw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjdal-008sYU-2J;
	Fri, 22 Sep 2023 10:40:59 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjdai-008sXB-2I
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 10:40:58 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 05B133F129
	for <linux-riscv@lists.infradead.org>; Fri, 22 Sep 2023 10:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1695379251;
	bh=M9atEZ8pv97FGsnY/ZWo7vn5sZBlwoU9NTKpTiNkhYY=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=QfaPhUydREmq4YdwmKCkJLfZN7K1udPKQrfT376W7C0lpcR0fJxdiCN04/2G0siTQ
	 sAHj0fcZpKkt3UmuNZT7JyssfVlVU7+n9TVinKCpZn5oWszgbaN8fYYC/Y4KXvOKsm
	 xJ8mKV9Q6ezbn6DDh+g6wA1qzzMr5LgD0p6GCWVerU+KCLAr8wQZ08X/XhJnYMIUtu
	 UEYa6831+oZcy7D6pVjJ+JOwaAYuTXJ6GIBEhtBLx7OFWc4jR5nPvrGNTY7/vKgmPL
	 BTkF+E+iq2q5gzLc0PP6yNt9vaRdqmWSIcgFV6BaTJWYf3891azn9d/u4gC/YQL1H5
	 QkhiYQpUujLew==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-414bd030211so21646521cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 Sep 2023 03:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695379250; x=1695984050;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M9atEZ8pv97FGsnY/ZWo7vn5sZBlwoU9NTKpTiNkhYY=;
        b=dI5XoaGi2kCcGpN4JzVRuAlfYooRxaYRk44H/bWIjWNwquRKx6lDjUhXUsy58WBCxe
         nzf2IfTVW+HSnMeGBYf8GnJytsdbzxJciKC8hWVpxOhNRozBiqIiomXd+qPa0k1lNGkJ
         s8NQrUeqXKZiQ2Gl662IuriLu7Crz3z1s8GVlVHpa/nAjbGVeoJboeFR/5nT/hrgo5si
         X2HDO3RMJ8FZ3A7bu5sNDYLAeoOJQC1nl+v3DZo/UK4ibSi35tR5rG4frRJM4eUKdvbv
         CMlM1i32PtJjqi/B1iUANushIIKVRT43i3/8Rt5B4Hj/tP23HwRqjCLdTm/FuQEkltVp
         Rzyw==
X-Gm-Message-State: AOJu0Yw5171UQOJpiAizn5CzCiJYrLUrREcdB8OyvWy2sn0YqNWyRij/
	Dwf7TFlv3m1RkHKnR0WP+/Q7cE+YdztxogrhAmfj8o2Ebs5KyrOle3vHY4UmR7pI6wMDFohZ0pD
	1foShvhrDgox3vwJgw494hmXTJR9Mqtc7cyha4j6qJERo7EbnKmGXqGhOmH7n4g==
X-Received: by 2002:a05:622a:182:b0:417:a209:c250 with SMTP id s2-20020a05622a018200b00417a209c250mr8885225qtw.36.1695379250045;
        Fri, 22 Sep 2023 03:40:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPQTZrz7rs3Pmta65dRQOYdSqi6ed3c6QhACApdSCdCSWiGdK7A08VO8v8WV3bKXwpAriTIN7dUIJh1owv9yE=
X-Received: by 2002:a05:622a:182:b0:417:a209:c250 with SMTP id
 s2-20020a05622a018200b00417a209c250mr8885206qtw.36.1695379249804; Fri, 22 Sep
 2023 03:40:49 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 Sep 2023 03:40:49 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <bcdc4623-a37e-455b-8f10-c539e2b04554@codethink.co.uk>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn> <888d57a2d5e62affb8e29e0098402e428facd969.1695189879.git.wangchen20@iscas.ac.cn>
 <bcdc4623-a37e-455b-8f10-c539e2b04554@codethink.co.uk>
Mime-Version: 1.0
Date: Fri, 22 Sep 2023 03:40:49 -0700
Message-ID: <CAJM55Z_o7Z8HhaUjrSqjxy1cPjud9Q3GrdqjgFThToxxOCrkgw@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] serial: 8250_dw: Add Sophgo SG2042 support
To: Ben Dooks <ben.dooks@codethink.co.uk>, Chen Wang <unicornxw@gmail.com>, 
	aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, 
	devicetree@vger.kernel.org, emil.renner.berthing@canonical.com, 
	guoren@kernel.org, jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, 
	xiaoguang.xing@sophgo.com
Cc: Chen Wang <wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_034057_088258_F6526B02 
X-CRM114-Status: UNSURE (   8.03  )
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

Ben Dooks wrote:
> On 20/09/2023 07:40, Chen Wang wrote:
> > From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> >
> > Add quirk to skip setting the input clock rate for the uarts on the
> > Sophgo SG2042 SoC similar to the StarFive JH7100.
>
> I'd love an actual explanation of why this is necessary here.

Makes sense. For the JH7100 the commit message is:

  On the StarFive JH7100 RISC-V SoC the UART core clocks can't be set to
  exactly 16 * 115200Hz and many other common bitrates. Trying this will
  only result in a higher input clock, but low enough that the UART's
  internal divisor can't come close enough to the baud rate target.
  So rather than try to set the input clock it's better to skip the
  clk_set_rate call and rely solely on the UART's internal divisor.

@Chen Wang is this also true for the SG2042?

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
