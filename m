Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8EAECAAD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 02:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m3IVPQkjvFpIiGD4oNWqn/o3iUEJjzZNLUAAFcW7eR0=; b=FhvVlYE5SB7vjN
	+fQtXqLS4Wy2e+ocdQeUhPctEJ0CXxivhXNHOsxPi3TvdMvVIFeanlEI1nPItWMr3BEG88h+pCXSD
	247f4VH89meTGNp0k7vHmENOpia8cG7Ce6zZdfIjGQJu6wBiERg5ZHMnKEqxPZI9JW9OosSVy99bs
	nds4zsYtiFaTRJafGzEavfRBsq9dWmzQ0otDnss99Tqmw2tIpmoFBzj4F02m9UOUjzpZ3+DzP0J5J
	TwYSKq4mAIofsItFqcoT3JirmvYT6ctSKNMNQ3pBJ/BRXQ+v4d/63wap1yalyaHWm9SyxC/Zciu95
	Cp1eu7f++3kWAx4qIFdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSrRM-00DfwW-9p; Tue, 30 Aug 2022 02:57:24 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSrRI-00Dfun-67
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 02:57:22 +0000
Received: by mail-lj1-x22e.google.com with SMTP id k22so9908710ljg.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Aug 2022 19:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=ZZT1U3Vd0cEKhLrF7hrqw0ipdClhYds8rb9iRhSYclM=;
        b=ntxeLPc3os+/MRS9ZtbpezqNZASz3UT1qwhwZnXzzdWu7jc5o/5QsyV6b+orylseX1
         XaNu7zhdg17JIRpQurW9vKO44wX79OJQ7pKI3D149s7rsrGuS+K7nu3vJ3FYdBYAyrRT
         ix6rWFxS0koUqtF6d6bgE5OGlIMdJ+vL/XuHUb+RHpq+GnjlEGewFMrxJK9/F6qKJIT5
         eTfZUbxMhF8UdFo7Gq1ClwBvuVTAoiW6MoGX49SlX9dw8CSnb9XHqV6v2wzjP4krI4Yf
         a//3ftpbI4XJnBP8ipA6p2eXqDI2UXozcgu7Xc5CJyyWSdhAIW1zt7ARddZLYZCd4tyz
         hs9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=ZZT1U3Vd0cEKhLrF7hrqw0ipdClhYds8rb9iRhSYclM=;
        b=JuOM2wokNT35cA/6BaLeyrs+Hp4EX5KOIyjtI8mchyB3BGarSulX+ndMr6lhTTBNy7
         04RnN74QyuzQ5TLKpSYLH6geIA0TuJIiJxm8S/jBESjhn7aczvHcEuWzPHlFwBot38YT
         U19d8PciQqBwvIfbDG6BqrZRjdLTOA9BUHhXFnGrFs4qMEwUVsGQUAV/WGywA7Pvk2sU
         WKZVKUo3T6Nsg8gbcgzY+3HaGOvHySXpGVQnpejjjfi9JoPrfUd1RXhsfhnyiIMsj3sr
         QSFGWyu7ZQgg6tp9qbksC9DTPKdMYJzomBoQ6IHBPAPG/kk4N2vMlBEclYRDsb+QyJko
         15rQ==
X-Gm-Message-State: ACgBeo2kTw0QvZK935ibG2usNL16rHDzWEZKAE1KT0T/ZyhT/yV0ntpp
	WF9rdj0m7xU7QYhthB3P/x54eiA4aCFbVr3sLt5yOg==
X-Google-Smtp-Source: AA6agR6AXVORIEDn/RN/pm5ODfxWHPuQBjjbE2B8Rv1Zhb0yNV8iJKWDUAwlMNomfvDEiP/NSQP346vwLH9srJ/z0uo=
X-Received: by 2002:a2e:9958:0:b0:264:ddc6:ad46 with SMTP id
 r24-20020a2e9958000000b00264ddc6ad46mr2350443ljj.443.1661828236796; Mon, 29
 Aug 2022 19:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220829062202.3287-1-zong.li@sifive.com> <20220829062202.3287-2-zong.li@sifive.com>
 <1661798521.316365.2118959.nullmailer@robh.at.kernel.org>
In-Reply-To: <1661798521.316365.2118959.nullmailer@robh.at.kernel.org>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 30 Aug 2022 10:57:04 +0800
Message-ID: <CANXhq0pAbWeYXSTDcemq5gL-fPUD73QTDkcp4+whWyx1OzJbWw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: sifive-ccache: rename SiFive L2 cache to
 composible cache
To: Rob Herring <robh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_195720_496206_6D0ECD31 
X-CRM114-Status: GOOD (  18.03  )
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

On Tue, Aug 30, 2022 at 2:42 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, 29 Aug 2022 06:22:00 +0000, Zong Li wrote:
> > Since composible cache may be L3 cache if private L2 cache exists, it
> > should use its original name composible cache to prevent confusion.
> >
> > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  .../riscv/{sifive-l2-cache.yaml => sifive-ccache.yaml}      | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >  rename Documentation/devicetree/bindings/riscv/{sifive-l2-cache.yaml => sifive-ccache.yaml} (92%)
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/riscv/sifive-ccache.yaml: $id: relative path/filename doesn't match actual path or filename
>         expected: http://devicetree.org/schemas/riscv/sifive-ccache.yaml#
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
>

Thanks for the tips, I would upgrade my environment and try it again.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
