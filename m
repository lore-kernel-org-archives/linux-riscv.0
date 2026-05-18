Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01109CD4F52
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 10:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kkqg1A4tMCEZA3KMJi0cgPRzxq9yG3Wr6WbtOXIBt0c=; b=X4NNjRuwhcnYDQ
	qgFyJz7oW26ozqpppS5sEuKehPm9rtRcVPjNPr4uE6Cgis7I1AMxGFdq/vwOvgjDkSSN29TCZp4e0
	VRmDhZ2VCGAazHkKPhu3cN6qbPsJCzfUkBQSTQs4E35Ou1YlH8JP57WHKR7/810fiHdch/noPgXyB
	NF4WD9hKtG15wFmtE4tj9aYb0NA6igB2wTScTsjeDLNrdMHufO/vfsF+bSoP35wsKSMO3HsvxjYyJ
	MoR1gLnAcVLvfY/ezeWrvxIvEZRtchWL8O9fPRBsD2DbRBBOAGSS28Y6wWlDQ+xIszPUh9kdHKty2
	WCyAF2K4HR0cLaHcsXeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvDN-0000000FDws-3ZRh;
	Mon, 18 May 2026 10:28:49 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvDL-0000000FDuj-0ZKu
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 10:28:48 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so25013005e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 03:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779100125; x=1779704925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYxpbaAOJBEg8u7pNfSvBgIfNUEd56wHaxd4vDulNaw=;
        b=TwyLFi6MoIAeNlNLIXj36ooOMAmbG9MteLrXXBkRntPc3OIBaMM8dhJ0DqZaCuWt5P
         eVxAQuzZAos8HzcihbjEtBacnRHLyvcpvw3lWQTRIYlZSLILN2FzIWzn8RY1rajJ973T
         mqWbn9LSvaATeskkHz8o1Xtt0vdoi2fs078mv4xCE21uNvvp3FKzl0YC1Wzd4aLExrWK
         75sKJv0ZcNwci/bv2tkGmfHLoFlkI6baPMVNV+2Z9/60+XluHykYNQ28ohAIcw8DGCcC
         XneNhv5fDGEKFvsxYTDMJZEL6YaLxk63lJAzQBthadA7ysNR+sFzjlAwp1cNH8PM7wOn
         j0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100125; x=1779704925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rYxpbaAOJBEg8u7pNfSvBgIfNUEd56wHaxd4vDulNaw=;
        b=VOFLWO39F6rHSKCX+ULJhtc0UOuU0bsPG8QwtUQeV8zYB2zRVgWO8De9VfJLVLK+r4
         MnOujINp9J78C5gZaHNh+cdPLV9rU+hgIIjzmX5FYyI9a1nWLOcQyrVAU7/aSbJOisW8
         Y6URE0WToXS+R8tjlGAmLjK162OSmHNQzF1h4Hd9Tt6BS1Y9jJq+QarOptCtQnefhSXW
         UqjJNgslVBnjJPDMyhwGAW1D1spmJfe13kfwMm1vnTAmks5YrCKKB3PBwCzG/VL8FeEo
         Znvs/RK3jZtMA6bly/IO+gptfaqkWWKErYTu5Lm32jC4PCxbTOZ9tah7SbhWx+GxLor/
         DWYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hhwTK0QM/gLq+Ni3ezJn3tkrT9zLfi1WeBbz2mMWATNvM708RXY0pj4TZ/4QOfWu9faqSxn4fdHFp5g==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjm2+csPDw5MJ67gtVTAfMds6X1NT503e3SbS6vv3joGQV5kM4
	5CorUW5DunHZXFstJYWXxoWc11pfX140c5hW9DzcuwVYXQ8YqwuN1cMX
X-Gm-Gg: Acq92OEvlQd+CDMsdx5mw0Utcv27VnB4jnSh8KhJBXUbk05o6h7F9RcBeKrbRFlLtrY
	f8uzGf+pctH6g+Vcxi23dSZPuEABkkJ0WIE5G0NLkZvqD14yik6L1tcnCAEg+fJ6RclQwQAxOd2
	8B2apq4LQH8CMoe5hSphQypqMOcxGD+Ega2BIaMmEbL+D8yywciTJAi+PTTYePKFP2jlpat0q2i
	67UaauQE1Mrt/2mc/TPN5OLBpi8M4XS5xWXPtxgmeWGU63NvdDTHqWyQMo769rXMlUPl8Pm8fvw
	FM1gqZOs0F/uhOxry2xiVfzDc4QVzGmPs6eta/tD0A7/vNaZlDEsspud2+x5XrgGBIeV6WwT9vJ
	o+SyNB7jgI0YczcuZQz6X1TgWa0xL0dfrDiEVIBix8ONH6JYpY3tUICDcowcIYG25JtIQArh5Gi
	ViE3GCy+ejuJwlw6cTXPxiUgj6KNAt2nDkK9TFIdhP17bOemXBPsIhGuB+wAG+YPng
X-Received: by 2002:a05:600d:10:b0:48f:e230:2a1b with SMTP id 5b1f17b1804b1-48fe6630137mr181624675e9.30.1779100124599;
        Mon, 18 May 2026 03:28:44 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fffb9aac4sm234496915e9.9.2026.05.18.03.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:28:43 -0700 (PDT)
Date: Mon, 18 May 2026 11:28:42 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Zong Li <zong.li@sifive.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, debug@rivosinc.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: cif: reduce shadow stack size limit from 4GB
 to 2GB
Message-ID: <20260518112842.07f0f2af@pumpkin>
In-Reply-To: <20260518105725.7afe7a4c@pumpkin>
References: <20260514075036.1432352-1-zong.li@sifive.com>
	<20260514095605.2c7d8761@pumpkin>
	<CANXhq0rY8wb-0x2whLGMSuWLujtZwrEsmpWh_PUhxoZ0gpA96w@mail.gmail.com>
	<20260515102411.4d3e868a@pumpkin>
	<CANXhq0p-YeNHGtQGHVvHSRvSaDtEvoY=KHc019iRBfQM7aV+ZA@mail.gmail.com>
	<20260515201613.243ea49b@pumpkin>
	<CANXhq0qOjCVOQfCe5QqNU+UksAzK3F4OLYAFSfsBrRP3zo9GUg@mail.gmail.com>
	<20260518105725.7afe7a4c@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_032847_183657_C7597CF2 
X-CRM114-Status: UNSURE (   9.50  )
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

On Mon, 18 May 2026 10:57:25 +0100
David Laight <david.laight.linux@gmail.com> wrote:

..
> Actually would it be possible to initially just allocate one page?
> If you get an overflow fault on the shadow stack I think you can
> safely reallocate it at an entirely different user virtual address.
> That would remove all the problems over committing a lot of swap.
> Most threads will never do the 512 nested calls needed to blow the stack.

Forget that - probably breaks setjmp().

-- David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
