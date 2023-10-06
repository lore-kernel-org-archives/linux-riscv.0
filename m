Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8A5E94139
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 22:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=VKUatJYWoUXZxMsTw//iUbYfOcwtbh3+Ny5Ls8Fwz8c=; b=edi
	NsENv+Z9f/dhVCkDnN/pdbYMlRZIW6nTAqwXTDH5JngKQiAwnziZdbkaKjGFlYYXRk6aoWseiW+Rj
	ThbumNpOPUy60kPxvchHdUiloXOjcs17nlUbFwMmf77LL/svnXLGiSMiwhXIrrk338eFq16DaQQcZ
	vRXWNGGItUnCIdJTS21YyRGNNY5Yu1mx7QmpFEqQVjeKEjy2erzW/fimmt1NXOXERksmzBUic7XII
	IEd4m2vwt3ox5QDW2DQmsr4d0iGV7HEA2t4hApBIMc9zAt28Fp0oeNWr9aLo78/s14pZHKaQwrasd
	xAyXpE3jTJV+wVCxQZDh4nHUif0I7dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qotZ2-006bWK-0g;
	Fri, 06 Oct 2023 22:44:56 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qotYy-006bTG-2p
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 22:44:54 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-504a7f9204eso3257787e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 06 Oct 2023 15:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1696632289; x=1697237089; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZoOCflLBRCemGQr/P9aSeGrlTrrTlas23Fm9Hg/OLis=;
        b=BHP4hbqjDO2cOpHNQkGPhuTsLUGZBR7PJ7cqWNu8UCeZKMyHTL7JY76xY+Wk7A+F1q
         Ek5OjaxXnaAkMHTNBAdTJJ4ZpHhSBJJWH75i3165LCuVV0lGPi7o2PHnuchxIznW93hk
         U+xND3P35BOo5YaRJ7X1rFN9d9TmxzUlZaP3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696632289; x=1697237089;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZoOCflLBRCemGQr/P9aSeGrlTrrTlas23Fm9Hg/OLis=;
        b=H+aiMdYbIVepKA1eoP9e+mdnMMv9KvuarvxRbf62xNgVq0WGEq4uj/mW5z1VAeAgKe
         MOCh1tHZFgEdmix3uDzw6jWh7iXszzhSVSqqyKf4pVatVENN5faHTr8Ew76Q8fgVl4J2
         AC+MXyYp78DR2HbMM9OF1nf+VrXAG65Vv9iq+7dmnAAHYAsou9evZlCGJmZfhj/tJtZd
         VQ7k+sJVKhMRXmdYOyh9awjeKEXQFqgEf+vxsa0qvIiQHroaIRNLDFd6mt56nCPo+LmG
         1F3S40dGHW3Uiv+37jLyhB6/QMaVrDK/7Wh4PBuSkxjAiEVpcGI21K/l+838xuCx8/Xl
         qisQ==
X-Gm-Message-State: AOJu0YxUWdLs2x9KrNXwFsfJZl+N/HWO7u+FyiyF9+KvaE05BfWrXZ72
	hOwSRR1KvgeJK6iAeyWJC+x6TucisoUxMXR/SqNOXT48c99UrzEmQQ==
X-Google-Smtp-Source: AGHT+IFGKPFTCYk3TWjHM9I+XgDBf1KdGy6H1FSKy9l9uM8P4TcQaq8Lk2YzTBp8uoPdFUrAHKc79v93l5ygU/3PNEQ=
X-Received: by 2002:ac2:4da7:0:b0:505:7113:1d0f with SMTP id
 h7-20020ac24da7000000b0050571131d0fmr7020889lfe.13.1696632288903; Fri, 06 Oct
 2023 15:44:48 -0700 (PDT)
MIME-Version: 1.0
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 6 Oct 2023 15:44:37 -0700
Message-ID: <CAOnJCU+BdTMQSxaXChUBLiiz71yx5e6mqngOxvD+cXNxSabzSQ@mail.gmail.com>
Subject: Public Review: Advanced Configuration and Power Interface -
 Functional Fixed Hardware
To: isa-dev@groups.riscv.org, tech-prs@lists.riscv.org, 
	tech-announce@lists.riscv.org, OpenSBI <opensbi@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_154452_915123_90342E36 
X-CRM114-Status: UNSURE (   3.43  )
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

We're excited to kick off the public review for ACPI FFH v1.0.0.

Review Dates: 10/06/2023 to 11/06/2023

Specification Details:

PDF Version: https://github.com/riscv-non-isa/riscv-acpi-ffh/releases/download/v1.0.0-rc7/riscv-ffh.pdf

Source Code: https://github.com/riscv-non-isa/riscv-acpi-ffh

How to Give Feedback:

Email your comments to the public isa-dev mailing
list(isa-dev@groups.riscv.org) or PRS mailing list
(tech-prs@lists.riscv.org).
Or, add issues/pull requests to our GitHub repository.

All feedback will be evaluated by the Platform Runtime Services Task
Group. Minor corrections and straightforward changes will be directly
implemented. Any other proposed changes will be discussed in a summary
report after the review period. If no major changes are required, the
updated specifications will be recommended for approval by the RISC-V
Technical Steering Committee and Board of Directors.

Contact:

Group: https://lists.riscv.org/g/tech-prs

Task Group Chair: Atish Patra (atishp@rivosinc.com)
Task Group Vice-chair: Sunil V L (sunilvl@ventanamicro.com)

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
