Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87484C433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 10:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ucQr/4ipm4bL9jjcw7PszUm6nfsQAv7ZTFTZj4hsSK0=; b=bx3r0nZcn9LvNm
	AfdzytS5/DIKQWKXM8DiAUa54aT+YDQKRyHf0I14R7Ycs0Ehgllwiiget0cSPXUsvhJpTpSV6OmDt
	T2Xu2kfSsASOXVjEgs6C7fm4AZiCXZMU7qiMVYfUZpuxgn7EDuG8xfU9xHcWDcCRvLjM5hdbomBzh
	31Z2rNzpKFrkk7YjTowfHe5JX/jflRvvWDS4NzII1HcVgh9rIaROboDBEImkiwVmeIb1VGSOJVSsR
	d2IvkfvQM3LaTDN8tMKO1BZ9leT8gGoNr5VS8+3ihhpGenyFkmc4WEgdBbHvJvKr8dyPM1glIjSDU
	Kcp+A/IiujIrdqV4wYXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ4qA-009V2F-Vq; Fri, 04 Mar 2022 10:07:15 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ4q6-009Uzu-TU
 for linux-riscv@lists.infradead.org; Fri, 04 Mar 2022 10:07:12 +0000
Received: by mail-lf1-x134.google.com with SMTP id b11so13255999lfb.12
 for <linux-riscv@lists.infradead.org>; Fri, 04 Mar 2022 02:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9N/+0wL229i7Cr0s0i/SfdtJ37Scr7qSFfPXGXOJAb8=;
 b=B/YZnZmXk+cPE+SLnVMTvL+U2S/CtlbWn/U739600NjbYOgcXAxG8WCU2yRBjisfuC
 +frjfu2rY/SnANWK1dLGAs/0z1xu7B6DMA4m1YJIPk6A5xYTqTdbpk1y8XsPv3rb+ga9
 aDtun+/h+dXbSFZ/5ob3bzGHlmieDmC4xIvkXgsUOfl4qY5PqH9CQ/hvmc0f2DgjtcjD
 6hxGudm6kdVDwI/hu7kQHrEgGbfFv0cXFp2WfCwF+sfhF1HNVMieAimy9bR8wXOvddAm
 8iE9QbWxZfCyZBjLWHfefjQFIR7RxOBlFW50NClzGubgPOstEkzQwNEErKE0juDYUCVK
 ck7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9N/+0wL229i7Cr0s0i/SfdtJ37Scr7qSFfPXGXOJAb8=;
 b=YOPgo61Y0Em5hya/tRYaIHI9lH+YGhfRnXmv8gnt6bXRvJY1gumTf2R+X487FuUad0
 C8LUyA/vbR9zDHY0BFz2tRlgmLZfsMu/b2zFFQpqpjct5aGmrRCVB0Wft0vV6enVDApT
 CVRT1k4/uPI28CxBo2233jB7fBqY/hQ9Ntta0db7iHNjRirntj+Cyr6DxuU2kUnUjtn8
 j/yAMgwgwv1A1FeFfCUxY7K7kLW2fYKo+FOBigra67v+o9pcoaMT+kvop+YwQ5/tvvzT
 nHGxZuPHKpLMex9JYW8QEJmNwMw7Thd3TTuQJvjzo09kAmVKjiSX7xemYhzJP4XGQiHQ
 tk+g==
X-Gm-Message-State: AOAM5310GkxcQQxaKRgBhQIYPxB0l0pcs1Tkm64Su1/siLksr12k1yjN
 8j6uwXuz+m9eYKE0jK34R7IM90QQLrEOAqSh05Tyxg==
X-Google-Smtp-Source: ABdhPJzzsckyVKUW8W1OIZWYaDHSOvqmRFodfGrIYlID4E+90v/KNHd9qlpABx0N56/55lpGFlwSygo+aAATq1UOy80=
X-Received: by 2002:a05:6512:1510:b0:445:cbc3:a51f with SMTP id
 bq16-20020a056512151000b00445cbc3a51fmr4227577lfb.116.1646388428750; Fri, 04
 Mar 2022 02:07:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1646383150.git.zong.li@sifive.com>
 <12cff3b68de1bd02a8915bd70999bb4edafaca1b.1646383150.git.zong.li@sifive.com>
 <1664de3d-8e33-596e-19ff-4fb174f2a178@canonical.com>
In-Reply-To: <1664de3d-8e33-596e-19ff-4fb174f2a178@canonical.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 4 Mar 2022 18:06:57 +0800
Message-ID: <CANXhq0o68-_jYgZD=iVjQDrQeo-vB6iP+FR3PDTLy5bvD9QVug@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: Add dma-channels property and modify
 compatible
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Bin Meng <bin.meng@windriver.com>, Green Wan <green.wan@sifive.com>,
 Vinod <vkoul@kernel.org>, dmaengine <dmaengine@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@rivosinc.com>, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_020711_064376_5B75F5E7 
X-CRM114-Status: GOOD (  14.17  )
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

On Fri, Mar 4, 2022 at 5:09 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 04/03/2022 09:42, Zong Li wrote:
> > Add dma-channels property, then we can determine how many channels there
> > by device tree, rather than statically defining it in PDMA driver.
> > In addition, we also modify the compatible for PDMA versioning scheme.
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > ---
> >  .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 19 +++++++++++++++++--
> >  1 file changed, 17 insertions(+), 2 deletions(-)
> >
>
> Can you add subystem/driver prefix to the subject? In current form it
> looks generic, but it is actually specific, so:
>
> dt-bindings: dma-engine: sifive,fu540:
>

Thanks for your correction, I will send the next version to change it.

> Best regards,
> Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
