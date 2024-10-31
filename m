Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A3EE6748F
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 23:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cITVX5ISmG40PPqo7QSjZOIuedTH8MMjncA1BCQVV+c=; b=Vdh1llTr2TMHL1
	MYvgWvX3fGmouw8jrVbY+U6ZowKZiuYzzaUqbLw3IxzoajELbvikSztTVhCruCG4jt1ahaaUsEqbV
	Hcu1J5f+kNaxfe3eR+rXLjdEVKEJXyAiJgusgZMOgXj62YKHIo4S9s3TZDUgT8Y9GPb2g9Baksb5d
	bta2T5tIxAFanjrWhQxizJaHfL6BXaT7iGoaZgiN3aYMFZezuIM9nDC1qRr5paPhL+RTOJH0t7Gmc
	iT2Kid/YYNjv0n1GnoZuy48Ae07nfcTCfon7oIXpKlHVm5XHjdzVurUk5+AS7lK3dp6mqY1+hdgIs
	iynmnZCa79kvrCbqvUwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6eMD-000000059cF-0KWf;
	Thu, 31 Oct 2024 23:13:37 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6eM9-000000059aR-0hia
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 23:13:35 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2e2eba31d3aso1087723a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 31 Oct 2024 16:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730416412; x=1731021212; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ii0kEwrxMeKD6ai8F4P/+h5BX5m5f6101kjzvcy1Bp8=;
        b=cWpMHsJUKL4crVx8qu9L6UjIAyZX8Fjfjr5JUIK7VHWs9VTJXRnNqHnqejxTggZoXO
         sJxdsGXrIYnt1iHWpBRQw8GiyagMO9fjPKEtZViECjPEFf7IAcj8pB4ghTz/pzw25mhB
         mUSLZL1PSZ8Zl0QWM/xIey/WfNAmclexzHHmozOcS9tW4hYLJ1D3ynSMjE90Uqx51zOh
         2jIbh6LhwOaGzD4YzHOc0/RhOO20rkTWPNzZGMK9EXq4EMQDDGz5L3q1xxI1Ui8r9o5G
         7wlKozECBeGNxvpavK+znngNrfY9rak5X/TNzyH/Qn4GDiTuAeWwxHk1C0fgjTcEJEj1
         jmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730416412; x=1731021212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ii0kEwrxMeKD6ai8F4P/+h5BX5m5f6101kjzvcy1Bp8=;
        b=W4A1zZ9r10nvuitzd50zVbc3nH3EGxqLpUclrr8E6yKHtB4WQzD9R1g5UKgpNe1b3L
         DLtQbpy/+e/+O0jsIaTODvfNhO7gRWuiTAcp9VwO3vJDwoOrQCtmbJGygaZf3oPRIz5c
         mSGoi56pDYtd/2XnvSSnPg98mc+ZtgACaZKqK0LhtBHW0JXk3pzeN7azvHmNnAJ09R3f
         hNuSUqcjXnFdd6/l+yidWVEIBXR/4cznKc91uTZTJmC8GI0+HOO92nZ+wCoXWEmjlhsV
         hLoN8d0SBCkq5YApAF/894t49t+bM1SOwal8X+9pu72kfrdce2lkBSk+pgodbE47tmaW
         vgpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDgC9ihjKYh26KUDhn0npkTBljcBvVtyFv8YZxu0RvN0ysDCJhxIYa88y9f2R5/gbN8TVx8SXGnBgMpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBuK1IYhyvFONaTUTV4u81PK/Qdg16fZRSjTQOZFyLb15znlsN
	rq1oaZimrdkuBdKJASzTLLjwBarcOnFjoztoDW6CdNRlRSwjGrEm
X-Google-Smtp-Source: AGHT+IGT9BughKRRNW5nz1IyDJrjjO/pXrWdnusD1MQeMuR+s0APSOVSBqdDkMHvxgC5e8Kip24JwQ==
X-Received: by 2002:a17:90b:1c10:b0:2e2:cef9:8f68 with SMTP id 98e67ed59e1d1-2e8f1059571mr24207222a91.4.1730416411738;
        Thu, 31 Oct 2024 16:13:31 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa57cc3sm3936055a91.32.2024.10.31.16.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 16:13:31 -0700 (PDT)
Date: Fri, 1 Nov 2024 07:13:03 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, Conor Dooley <conor@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Peter Zijlstra <peterz@infradead.org>, Inochi Amaoto <inochiama@outlook.com>, 
	Guo Ren <guoren@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Yangyu Chen <cyy@cyyself.name>, Anup Patel <apatel@ventanamicro.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/3] dt-bindings: interrupt-controller: Add Sophgo
 SG2044 ACLINT SSWI
Message-ID: <tjoe7t45tbogrjmyip6lhkqprpc42mkmgysb7xinoreehsgnz7@uqqsp6llevy5>
References: <20241031060859.722258-1-inochiama@gmail.com>
 <20241031060859.722258-2-inochiama@gmail.com>
 <esuteqvz37blehx6wa5cj5ixlglcbullhuls3rcvjtuiviqqpb@ojho3arlnwst>
 <20241031-armored-marbled-36cfb6d599e3@spud>
 <87ikt8wh8l.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ikt8wh8l.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_161333_239010_2405A138 
X-CRM114-Status: GOOD (  17.13  )
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

On Thu, Oct 31, 2024 at 02:10:18PM +0100, Thomas Gleixner wrote:
> On Thu, Oct 31 2024 at 12:38, Conor Dooley wrote:
> > On Thu, Oct 31, 2024 at 02:14:40PM +0800, Inochi Amaoto wrote:
> >> On Thu, Oct 31, 2024 at 02:08:57PM +0800, Inochi Amaoto wrote:
> >> > Sophgo SG2044 has a new version of T-HEAD C920, which implement
> >> > a fully featured T-HEAD ACLINT device. This ACLINT device contains
> >> > a SSWI device to support fast S-mode IPI.
> >> > 
> >> > Add necessary compatible string for the T-HEAD ACLINT sswi device.
> >> > 
> >> > Link: https://www.xrvm.com/product/xuantie/C920
> >> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> >> 
> >> Hi, Conor,
> >> 
> >> Could you review it again? I have updated the description of
> >> the binding and mark the device is T-HEAD specific.
> >
> > Only thing I would say is that
> > title: Sophgo sg2044 ACLINT Supervisor-level Software Interrupt Device
> > should probably be
> > title: T-Head c900 ACLINT Supervisor-level Software Interrupt Device
> > or similar, since this isn't Sophgo's IP.
> >
> > w/ that,
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > (dunno if Thomas is willing to change that on application)
> 
> Yes

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
