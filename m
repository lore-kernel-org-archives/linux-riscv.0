Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AE9C369B9
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 07:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXaMfrZBa9LK7GcwsgtWen1VERbHF+UiiXE9VW+UXFs=; b=jtxrEttt5puZwE
	7Rd2FX8I9hdOxTbWkpf4bacBqVDS1pSnF4wz1REvOqZTA9NRHrhOttCwssEJOiiDUmGuW2BYCwycV
	nmGbGhVu8n23VviJIYAZbFevKR4esRmq3vVcpc5LDjmrvhB1kNCzGJAfZHdNDrQ/g+cT+UEVZbrEu
	nH1zXZe0+0ntDqRa18oCECQVWT/f0FjAFdALz8qztRwhMC6r2XIJkkIeBFDt8cvCPEIo0rZKp6mdc
	9MrETukN8TqCUpP/nDcKL0WflgCLXop/EY59d6OD2Hnzrp5mQCuT0wJLsZdmHdHbW99h1P1YYBP4s
	2oIng526rp5vmkCg8fVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4b3e-00000004rz5-0KpV;
	Tue, 15 Apr 2025 07:50:14 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4amU-00000004ooe-275l
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 07:32:31 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-30bfca745c7so47784731fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Apr 2025 00:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744702348; x=1745307148; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhQmXgGKa1sqrAMlJVJ+qW76qWOZbNqD9bGXFxISbmo=;
        b=vH6YXyuH6cRwq4AInXNrkOK8/2K5paXjHqzbmoe/VlW8UDOPQz7boN6PGa/sB75zno
         hcJbLsFyqPBvD3jj546bbU5b9mOWprY3krqggBqkO8eXRTmQzQOx2Re7oE3rt5bB67Fl
         Uehtip41ixcAUOFp/DR4lLad2DatoNm4cc11JzdFVrI9V4PWo60Xmua0ZUV0/SNALxKT
         XiEv2Rrw0jhK8eULiBWVhJXyVllnb3Oy2VdF/MPCZU29oYjXWZgOom6SC9DUXZDsMXWG
         7f/U6ZCDEwwyjSPT2xQkqeKtfrg+9ErOO25duRYQQVitsI27r8d2Zo74QcIksuOyNUn8
         FJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702348; x=1745307148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhQmXgGKa1sqrAMlJVJ+qW76qWOZbNqD9bGXFxISbmo=;
        b=B8xQCC34OZwtjcYWC44H4IkId8b2xmkd99pxpOEtdrMMSO29kYBQgeaX+8uAjw+aJc
         MDy2YQgEQy1M8ktQbma669hducHoUqyf40f8YAf1ucBSWwq8conjRhWeSJRxFGPHNr05
         +AqFV3oBNutX8x/Qm34r1+kDXSmP5DqPo9RUcWg9wTx4cwy7V1fYNhgN+qvulK73A6ev
         wpGLPaAXxo6EDJlm87tOgSarBtN3yicjPHpDmwo8gVdiSdq1mgF7YtPOkFwQv+0oZTJj
         PAaAcEM+DgzVmIT3a0Cu1fDCeu2HTEbqltiJK9j0tWZWRiNU/qyzvnMYmjsyHreF1vLg
         AnvA==
X-Forwarded-Encrypted: i=1; AJvYcCUUWfch/Su53ZgV6qSmeFy3Av6Kj6QAhKryFQfnTAEQMqzBko0KbaPHM3vkBFKrEpXQdiPOPWhMW3aTsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxUMq3tMPBBEy6l3rgwpcO84Y3CTqVDtP1mc6N5NK88CgQHiOG
	sLlu4hyWletqYEtojHiHUH2Kn8bflHPaaYoYfeqY2IF6cETeyUkBLLplww0Ve7OB5+f0VBW/uVF
	Rv9cndxnAcUeDTUgX9sgbXEAP9A23QYe+f0vOvg==
X-Gm-Gg: ASbGncuGATJ9bq6N+uyVgHkn3GGgeyCTq61u9uzvjzBqCRAYI5W5fh9I1v/p3ZsRPyb
	DBvNS80IrmJBjMYSf652J7tpEmrL1JYNUUfBqKBzPxxW5TOhJFgwDVjt8suIDJIfNCbtqB9Sm7G
	7ZznHIBoNo8y472V2jXjqssQO26/w/8OmM
X-Google-Smtp-Source: AGHT+IG5h8f4JUB78zhRjxaIrh0H1nzCuXUYX+YRVBh0UXEwBIrUvsqlLX3M1mFXVx5pHR23X5R+19Gz8uYR3GSdZ8M=
X-Received: by 2002:a05:651c:1607:b0:30b:d022:2fd4 with SMTP id
 38308e7fff4ca-31049a7d074mr52085991fa.30.1744702348175; Tue, 15 Apr 2025
 00:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
In-Reply-To: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:32:16 +0200
X-Gm-Features: ATxdqUG7_L4ll5R2NvuDSJ1DXWDqWrMJi8NcaoVkYOT_klHadc44zetWzT1zRS0
Message-ID: <CACRpkdZW0Y8rBux0KcvbnDH92oP=6oco68L79VX2a=uc+2VhmQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] gpio: irq: support describing three-cell interrupts
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, Alex Elder <elder@riscstar.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_003230_543900_B43C2D4C 
X-CRM114-Status: UNSURE (   8.48  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgWWl4dW4sCgpPbiBUdWUsIE1hciAyNSwgMjAyNSBhdCAxMTowN+KAr1BNIFlpeHVuIExhbiA8
ZGxhbkBnZW50b28ub3JnPiB3cm90ZToKCj4gSW4gdGhpcyBwYXRjaCBbMV0sIHRoZSBHUElPIGNv
bnRyb2xsZXIgYWRkIHN1cHBvcnQgZm9yIGRlc2NyaWJpbmcKPiBoYXJkd2FyZSB3aXRoIGEgdGhy
ZWUtY2VsbCBzY2hlbWU6CgpTb3JyeSBmb3IgcmVwbHlpbmcgc28gbGF0ZSwgSSB3YXMgYSBiaXQg
YnVzeS4KCkknbSB2ZXJ5IGhhcHB5IHdpdGggaG93IHRoaXMgdGhyZWVjZWxsIElSUSBzdXBwb3J0
IGVuZGVkIHVwLAphbmQgdGhhbmtzIGEgbG90IGZvciBkcml2aW5nIHRoZSBpbmZyYXN0cnVjdHVy
ZSBmb3IgaXQhCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
