Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DBFC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 17:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H2UHt7cZyUhTMH16n0Zg4JrfRVIbOE3l14HS0psAUWw=; b=g/pK8eXbTf4gxX
	QLoUvNE0O5i39bVOMBlj+R2clBc4QfEpDwa5hT4TWFyJniTKBEGN33MIQIInlCXLJj7pMP9PQRzAb
	YzCA/Ba5sHV73A6P0r/AmU6acbinn48o9JYL0g7HOFS54GrUSd/udoyHuDScvbUjhPfiU8BU764mQ
	Dal6FHkOntym/k1st5lKFliyPYpoAEfonqfygbjgbqMi48Ktu2iIqtsGgLHzNQdov89kEAuU7lnVe
	nBJIJ+81HVHIg4NzO7ZPVezobaRFEAtnOIcDwX5R5boQwrUfOj5m/VWNolbtrT4cA/5qjuRv1rJQt
	D91hbOol5iFk5No1qYwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p59Fz-003n3W-M5; Tue, 13 Dec 2022 17:39:55 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p59Fw-003mya-Fm
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 17:39:54 +0000
Received: by mail-pj1-x1030.google.com with SMTP id hd14-20020a17090b458e00b0021909875bccso1803316pjb.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Dec 2022 09:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5F9AtUEP+wPsfyeX4wEFq6wShCPSdC4aRzGQU/HQ1k=;
        b=RyPMMBRtn1LCyL0Y9vrIED3FhSg0IzMGKxcfnkBG2bQo7wpRNtr6//qBgK50QmJgBa
         wCMnvC9UGJrDBTDP7VD3FM0eU7mH4udUmGmnH15KDyy9ZXhIPVU++laNaZzwIFIDI8iJ
         4I0Y67RTbJF0o+MeiXNbKVHwdgCZkFSr0qjT7Gsk0GeX1jRb0H/89oXbEqmZC4MFT4HO
         sQBgLTwuFVFu09Ge20yzyDgJrXmpAX78vlsYrNZYqo1SO45e35/ZO5JdzwhlDjes2YNh
         AB0KMqPZ2kJ14FyeTLaXKeFPTF3iqeKlJuJCEMlT83Ol3pgOfalY5a1Q1jyAXDZ+14hy
         NmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5F9AtUEP+wPsfyeX4wEFq6wShCPSdC4aRzGQU/HQ1k=;
        b=IMDXq1awm5NtWuzUavLFydz3dbroR6rCh6EfgVpJiz6nshy7pNBktzax2PPbl2gbdg
         jHxCv8L9MYBSHdfJ/gCwSjwul3MTeFn8FezTxBSI3K1lQ1SLNNDnz2Cnt/MXTYn0UXno
         hqeyynB55qF7ADVfhuj34BIij54+YCl/ZLPVh3Tu72X3AXj60Pxk07P6F0U6+m+GX9ml
         FzSpKXUc+elzezKBA643KPcWSUXcNW1MrVgbFBr25Kcq2bU7TpFze9wz/FW2SSEKa4yN
         c2zqcBqa2q66uUkoGHeUcbkoQq/o/YXiJO0uhlRLEHXPFWgxNOu/x38kpzlvYFeP1q/o
         FAAQ==
X-Gm-Message-State: ANoB5pnxi5vyLvUsRIApDmu0Zi1pHXUfeEfqd+hhOD0mkstUPmjuNrar
	9JDW+k07psmj0/KPIxH0gbZaU1FEgip3ZP66
X-Google-Smtp-Source: AA0mqf4YtvcCqawq2rMHnyP4UpIyI13L0om9HY0LXmB/lpfZUP0VRMiPHbLNt4+qRLtthqawbECgPA==
X-Received: by 2002:a05:6a20:d489:b0:9d:efbe:2077 with SMTP id im9-20020a056a20d48900b0009defbe2077mr29256241pzb.45.1670953191895;
        Tue, 13 Dec 2022 09:39:51 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id a27-20020aa7971b000000b00572c12a1e91sm7951233pfg.48.2022.12.13.09.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 09:39:51 -0800 (PST)
In-Reply-To: <20221207020815.16214-1-palmer@rivosinc.com>
References: <20221207020815.16214-1-palmer@rivosinc.com>
Subject: Re: [PATCH v3 0/4] Documentation: RISC-V: patch-acceptance changes
Message-Id: <167095316652.17956.12741382362110839506.b4-ty@rivosinc.com>
Date: Tue, 13 Dec 2022 09:39:26 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
From: Palmer Dabbelt <palmer@rivosinc.com>
To: anup@brainfault.org, Paul Walmsley <paul.walmsley@sifive.com>,
  Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_093952_727608_6C07B22F 
X-CRM114-Status: UNSURE (   8.78  )
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

On Tue, 6 Dec 2022 18:08:11 -0800, Palmer Dabbelt wrote:
> This has a small textual change since the v2, but any change to the text
> is pretty important so I'm sending out a v3 rather than just silently
> squashing it in.  Folks seemed generally OK with it, so unless there's
> any other feedback I'll target this for the merge window.
> 
> Changes since v2 <https://lore.kernel.org/all/20221013045619.18906-1-palmer@rivosinc.com/>:
> * Remove the published timeline wording, to match the standard Linux
>   policies.
> 
> [...]

Applied, thanks!

[1/4] Documentation: RISC-V: Fix a typo in patch-acceptance
      https://git.kernel.org/palmer/c/37f0ab147799
[2/4] Documentation: RISC-V: Allow patches for non-standard behavior
      https://git.kernel.org/palmer/c/936100d4507f
[3/4] Documentation: RISC-V: Mention the UEFI Standards
      https://git.kernel.org/palmer/c/68eabc72023f
[4/4] Documentation: RISC-V: patch-acceptance: s/implementor/implementer
      https://git.kernel.org/palmer/c/a39c636506cb

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
