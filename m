Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86898C3DA49
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 08:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AukoR9xjhgp0k/F5Zd0S2I3WaY4+gDAoMV5opfHclVA=; b=LYJMoJ5mZfcNCmmCzLyFQ239R2
	Lf/nI8KXebmEPmyA+u3PtTrfGw58r5FJWJVKvW94kb+K9PVI54SaXXNu8FAn8yIJ2Y591Xko+5KLr
	0QK9eXqL1kYgsArzRg1sjsb6ZICXmiMj7R1IjOnRtU+cF26MzxBpDroDE7xadjMInHU6/3nFpIaC6
	fbDuxKrOQaUWoBK93oTSSTeOMfRWib3Si6Ei6xQIObshVLgqEd94hVgdAArEjjH1DfIYUcP77HUVz
	tRUGnWXCjIJDSZsvzVwMeLPaOc/jPIZiSQyiqGUywlrMsg5Ov+rlyqpAbNCu7vqYzUN6feIRIuN5w
	pC4gt2hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXGa9-00000003MLk-2Doe;
	Fri, 26 Jul 2024 08:45:45 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXGa4-00000003MJ9-3dFg
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 08:45:43 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0AB653F4EE
	for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 08:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1721983539;
	bh=cpFuacOOU9PyOYqB0WWoaM9Cjcgmb9kMiCLGqJP8J2A=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=uzMY3s7oJw+GVn9vD9W9ua23bhL0lHODBSgGuCcNMI0vv12/Jd0ATAmTe8ZdMmmVq
	 u/wmkvo2yfkVKT9fjHc1Wr4pni+If3MZGF4mSy2j2GL57MdFhQcMBRdHC16cE+/U0+
	 NcUlKguGKfAV4EIyN7Dz/MoJ4UrTg9bib4dr30VINrNa6B1i+NACwQYZcGQyvKkYGw
	 tglkIP8CKpwjVTi59ryDCVMhJFu36Dfrpy1UUYLDKxEjH1lVULmDmFCJAPcvtqs9A2
	 kZ2ancAbE8Smpuf2rTd4Pu3UluFSz6nWUU0mx4DC56uhToiODE9EjkyH9zImxx3cjK
	 3ueI3w44ExZ9Q==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-44f2e97d2c7so5957571cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 01:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721983537; x=1722588337;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cpFuacOOU9PyOYqB0WWoaM9Cjcgmb9kMiCLGqJP8J2A=;
        b=lON97XmlJ1WFNtnZ/p9VsR2kriC7PeKG7HRAKTF72tVeKGz5COnfw9JAMO4dDbPxdm
         MHKLzNxz2xHAieWfwd9gKEbAW0R4X8rGcTFD8PvybqR9T5wqMa34SeY8kq3Q6XOeUI9D
         JsFT27My3Ovox1APZ+lhfhLS5eMo4JHM21UM7XKzU4UG1asTMP3feZxdpwJ/Qv9Ljle4
         pXkcoFubLjt9bM5awYSYtTtb7/JU1cAlc/iej0qAeeC/FR3KXTV2mT37rC+7PRaH6RoW
         Xq6vn3mbpRdtfEeHcnlIAXCuRrN4oW8uy7oV3FWzUAiG9fSmPilzIdJ8ihdcgAsf6gFk
         nTow==
X-Gm-Message-State: AOJu0YycdoZ16DBNI3X3bWXwdcpiMpi7BHYDDyIh/So6KuvffquPr2o+
	CSqd1C8/1tknLr+N6lJ3O1K/c9dnZBRI1/XSQ/yW0tgJWERUJMn+MwOyQP25BoEQ1vi97Qib9QD
	1yUdd/tGt2TWhvYXLwnx//+ssw1pF0/Vr3RxtpjiKVCBgliR4oW6AgmbOdWAzvNDt+HddIsyHSs
	0GYaEWzh8XCkbiNX5SOaw/oTd/+tkuQLN/Gpppds931p6t/jj9gT47Q3hk
X-Received: by 2002:a05:622a:11c9:b0:446:5bbd:4802 with SMTP id d75a77b69052e-44fe92731famr52404461cf.56.1721983537680;
        Fri, 26 Jul 2024 01:45:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfWGnnFaUTMrdZkP7xOyuSJUp3K4zWzDQyC1gqU+SG7p0SaPT/1zgZF/fTQCd4H5ucjGPzcBLx8KLTXn+dlRM=
X-Received: by 2002:a05:622a:11c9:b0:446:5bbd:4802 with SMTP id
 d75a77b69052e-44fe92731famr52404111cf.56.1721983537186; Fri, 26 Jul 2024
 01:45:37 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jul 2024 03:45:36 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <57ef2eef45f2de15e6607da266b37b2a.sboyd@kernel.org>
References: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com>
 <20240623-th1520-clk-v2-1-ad8d6432d9fb@tenstorrent.com> <57ef2eef45f2de15e6607da266b37b2a.sboyd@kernel.org>
Mime-Version: 1.0
Date: Fri, 26 Jul 2024 03:45:36 -0500
Message-ID: <CAJM55Z8iF8yV5JK5v6ZtQqS5AaWwCZ7uwhSYb7hdxh0juDFdqg@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: clock: Document T-Head TH1520
 AP_SUBSYS controller
To: Stephen Boyd <sboyd@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor+dt@kernel.org>, Drew Fustini <dfustini@tenstorrent.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Fu Wei <wefu@redhat.com>, 
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh@kernel.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Yangtao Li <frank.li@vivo.com>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_014541_202066_3AFBA258 
X-CRM114-Status: UNSURE (   5.41  )
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

Stephen Boyd wrote:
> Quoting Drew Fustini (2024-06-23 19:12:31)
> > Document bindings for the T-Head TH1520 AP sub-system clock controller.
> >
> > Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
> > Co-developed-by: Yangtao Li <frank.li@vivo.com>
> > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> > ---
>
> Applied to clk-next

Thanks, but this driver seems a bit incomplete. With this applied the Lichee Pi
4A no longer boots without the clk_ignore_unused kernel parameter.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
