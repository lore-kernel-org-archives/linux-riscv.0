Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AF8C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 18:29:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 577E260C40
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 18:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 577E260C40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kuv0zJI9kA5ZllWmXDym9N0nseZVKbBJr3XmZejHdqY=; b=aQznq4BMv1s3O+
	uaLjw5OwUSZEYPTlj/Kz2r+D7sA0lcmyH7kIh1d0TYAEVezFcrE4MfzbSiDfczWl540sZrh+T5pwz
	QpoVJbqzJ+82T1AGce+hUccI3GufwTWhcbXDh6EfZLlNn5d6kuGF3ONO4iUYw7D7YmmsLS1c1Dj0R
	OSuE7tUEB2uaPs1UohUokB8E/BBNwoIrUNCGUeZ47EaJvqlG8eHTcR/4lCSOhCcVDWSFZkZYQst/J
	fuAog9Ig6l2Ar0rgVlSpel2uK9XZG815Nj0CEPyP2po7WBF2MIPmHQYYrM+ODbjQNE2UZSGzs5wl1
	5gWjsrqJSiTdNgyNErWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maMWR-00Dkay-J5; Tue, 12 Oct 2021 18:29:07 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maMWO-00DkZ6-Hf
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 18:29:06 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id z5so616470ybj.2
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 11:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0j5ViPa8JOR3UpqB5rh54uhlCKgBclmUScArWlGBF58=;
 b=oSBsdEeWv+DN5zAyzjr4bx37dTkhPFpUDTuw0YG8l/7DaoLwXKmbCqCe6bCw9KpnzJ
 rybWt+juTODrKhPgyOcs7xQx3iAsn418kY1mj7fceg1nbrM53Jgt1D5oqZ9zEpGEe9Ld
 EUNrSoLoK46A3ipPlqKmq9+a86W0I83HhuGGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0j5ViPa8JOR3UpqB5rh54uhlCKgBclmUScArWlGBF58=;
 b=n4kWEqs78bbhC6gBrKto6g+diR8kkcTt4FN4l7XDiaH1EDfW7VOSFw2Dk7Pn7LvUlX
 UwpiuzkrysPsBYoTsLPqsJYhuE/9wcPlIi0ZuMcanVddQdve1YsWXDB+xeWMxHjfxB0v
 blHcwxJD9FUd+u4fEee3d5jmGcDGuGNCIAGQZc7R+0qCvear8ki3ENBy9ke9czaKzo5d
 vTHnjA+9hvdmuzKMrt31PSiIQgfvHZfClDxybTjRjNlkd5CDNwtC2K8RoDTdWq8i+kUr
 ltrZA4mOjsxFRSp1eeZOSHzDaII/r41TLwvfTgwfn5dU/MfeYfocPSC0b5gHr4IFVu4/
 LJbA==
X-Gm-Message-State: AOAM533zX6vk8lhjmIEJQalEKW4XekDRfwZSZhieBr9WYxpIrc547afM
 Mdt1EPgE7uabTgHgm6TWWcsoHHWsjZZAqXF3e6r4
X-Google-Smtp-Source: ABdhPJyE/49JgvtXgB89DwKy5L7vD0ETkMChhFXkBXvvEhsu2bgmx/1+S8hBgtSRHyEamqLLY6mwWnzzh8tVVyUJ7NI=
X-Received: by 2002:a25:d47:: with SMTP id 68mr29552470ybn.204.1634063340918; 
 Tue, 12 Oct 2021 11:29:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211012153432.2817285-1-guoren@kernel.org>
In-Reply-To: <20211012153432.2817285-1-guoren@kernel.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 12 Oct 2021 11:28:49 -0700
Message-ID: <CAOnJCUK9brNWCBxS3NVDv81t+0eZNA90rpq2XLw_megKHN6uFA@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: update riscv plic compatible string
To: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>, 
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Rob Herring <robh@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_112904_659325_B84A33DE 
X-CRM114-Status: GOOD (  16.36  )
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

On Tue, Oct 12, 2021 at 8:35 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Add the compatible string "thead,c9xx-plic" to the riscv plic
> bindings to support SOCs with thead,c9xx processor cores.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Atish Patra <atish.patra@wdc.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> index 08d5a57ce00f..202eb7666f9b 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -46,6 +46,7 @@ properties:
>        - enum:
>            - sifive,fu540-c000-plic
>            - canaan,k210-plic
> +          - thead,c9xx-plic

I think it would be better to document the difference between sifive
plic and thead plic in
the description section.

>        - const: sifive,plic-1.0.0
>
>    reg:
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
