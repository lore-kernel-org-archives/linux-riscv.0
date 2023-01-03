Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDF4C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 16:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dISoFqZAFwJCKxi+iCZYGE4gMR43uOhu4gtyvGZW32M=; b=trtvHRw05EksVc
	YO3TtPa2bafmSJdU8ushh6hc39m+iaN0Di5RXWKR+bGfMh8ruz0JV8NoPv9f/8VIqhtLTDrJs67MV
	Z3lgEz8sndL0az6h1/kAOeKpUm4zv5MgXnfSNcmtpAip6Qe6DEUJ4Dp4Po9ClnS9Eq+ulzHKLpEPN
	uptd+VqhV0udsEM2JtrSd6IBzZ2++p2gCgzwj8EXH6xWaDfsV07GdWRkzwYoO1qOK5PQcc5ZXXTmF
	jKKv/8BHOxdros6/tExWJak9bsBfKj3uDOxbChx3JJ8CFrpUk+n3uojahaRxq9EissZbIoN90vkw2
	0KR1ReGSi+K0AH2eDetw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCjol-002lfm-1o; Tue, 03 Jan 2023 16:07:11 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCgzA-001O2k-5J
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 13:05:45 +0000
Received: by mail-ua1-x936.google.com with SMTP id t8so1122882uaj.5
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 05:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qBoUROWjuf5ZUYCNjG/g+PT7H00JAGubfmWIHqWiFno=;
        b=LG3dcwLKf5tAGbI5rt2aIWy2XkdGAxgvDX2u5W/cT0Rlwxk26JkI53ckg0EjFBfTKU
         eAZhu4Pj1OMx0WJlfThaU2UnC0+rke06pkTwZcGduzSbZf3xH+hqKVVFUTiobql5eAWf
         7OMyMi0B3paezljyGecRMQLwxYlUfRQtXlpX99OldXISEccoys1Twr9A6ukSf/WFPPOE
         34oc6+7wrCSUZbFEheBkjjabWGNxkLp8f/o7dLjWpHbXi8O1eDHEmjjGiSJCUakYXrwZ
         Wih1WTikjtgPpkPZWZtqPX75mAcnAV2bopj7xZ8cqgencYHUBQ0aIR15CKzagVD3c/Bt
         md5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBoUROWjuf5ZUYCNjG/g+PT7H00JAGubfmWIHqWiFno=;
        b=wRDHo+yVpsjTBQnoLo7Vcwv02kJWrjqVxfuQNLMJnkN1ZpdPukWivPnnFHBfQWPYhb
         lpYvkffBI0d+TEjHXFgWEjozepVtO8x9Z0Wicp1NPvWFFcNBgaRnyFR4w9C36YaCyr9v
         XRzQxhgs7oQKlmMwRerR1RrpXT3HNWJiTPIFmvBhwCZ4SQ5HrVlovfVkjYf2gyIytNwg
         WsY5Wvx16Kg9BpWLxr81nmqnqYAYbvET0WzVw446GlpsxUjU0cXJqBa1Fq98gI51pf9c
         KG75PWH9jJEZ1qTkVw3p1l8LBvd2RWwU1laEVMSvxdD/fnRENlmbxgs5tmNftBE+ndKG
         4uhg==
X-Gm-Message-State: AFqh2kpOdOBd97rvqUHFaYyJQvGd6dVBrPNt9y7/WeulaRB6RGv8O9+G
	VQjGxoMHPqJVIREiOma9jgruMrgp62oOf/P2ABDtQg==
X-Google-Smtp-Source: AMrXdXsabU1gefvs88vYs+DmLmfV8mbDiegq1CGFp4srFkNfmOlOQsYh7UqXWCshayJ3xlbOoVtJxKRC/g/O0jtAdJ0=
X-Received: by 2002:ab0:64ca:0:b0:478:b785:affb with SMTP id
 j10-20020ab064ca000000b00478b785affbmr3920179uaq.52.1672751140736; Tue, 03
 Jan 2023 05:05:40 -0800 (PST)
MIME-Version: 1.0
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
 <20221111044207.1478350-7-apatel@ventanamicro.com> <Y3EQ4JU7uGbIMGiW@spud>
 <CAAhSdy2UAMmX+W5Cm3DuTJzZ0jJ3=CW4PhjctQNdfeS+4hqWqg@mail.gmail.com> <082eb006-75b8-dead-c014-9ba41a697e50@linaro.org>
In-Reply-To: <082eb006-75b8-dead-c014-9ba41a697e50@linaro.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 3 Jan 2023 18:35:28 +0530
Message-ID: <CAK9=C2XnYVtEPqPoLw=+n6Ys_jm8Ndx7fDScDAOM4iNMEj-H0g@mail.gmail.com>
Subject: Re: [PATCH 6/9] dt-bindings: Add RISC-V advanced PLIC bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Anup Patel <anup@brainfault.org>, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_050544_271584_26F3095D 
X-CRM114-Status: UNSURE (   9.48  )
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

On Tue, Jan 3, 2023 at 2:29 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 02/01/2023 17:50, Anup Patel wrote:
> > On Sun, Nov 13, 2022 at 9:14 PM Conor Dooley <conor@kernel.org> wrote:
> >>
> >> Hey Anup,
> >>
> >> Ditto the $subject nit here.
> >
> > Adding "interrupt-controller:" to subject makes it longer than 80 characters.
>
> Because you added redundant double "bindings". Subject line is precious,
> so do not add useless words.

Okay, I will update the patch subject based on your suggestion.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
