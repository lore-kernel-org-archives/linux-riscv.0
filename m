Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC225C25B75
	for <linux-riscv@archiver.kernel.org>; Sun, 19 May 2024 14:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ZGZbMZNmEOn4OGb4NHVs7wpsfG7GUh60V5FSL7+QsE=; b=yki0W1u8+DeQGC
	niKuhlgFhIJCgbIqGsxH3jpVDZ4p5ryBXYhjHZm28Df8U1Dd7Gc9mAEtHger37kOdCmqo49UHOJB6
	SuKxNjxrbMrUJegr+4evXR98hhM1JNkXguubU0dPJKhbPrwizg41jAxN0cGBdukcN+VwxqeGYQ8WK
	duTNRT62pVG7wtXRVd33V3j6SKzSCmC08TxbrP48aBn0ar2N7M6f8rcXgXUXvVxnF6kUMvvLW/A2E
	Hr5TJsrvXbEDhbHIJOrzKBp5pP4PZU7YiOkn6+rAEeVlMSXpsjnNntNtJl6q2auedSPIyNquo3Ofe
	ImhM+rQtRQsLyhxZ5uKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8h4z-0000000C6Lq-3UM9;
	Sun, 19 May 2024 14:00:02 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8h4w-0000000C6LK-2Jwm
	for linux-riscv@lists.infradead.org;
	Sun, 19 May 2024 14:00:00 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-56e1bbdb362so5011610a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 19 May 2024 06:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716127195; x=1716731995; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZcAosKVRRNn3zbNdga7WpFXthPaMuTi09+NpFi9cn4=;
        b=jPZcwK0Xc/ySyFDCHxM4kyw4+ZQOmYkSqyMZVZq56bf+ZDf1bi9o+FYRiMux+BEAq3
         6Ip8ff3hQvJ0fQ5mRoyElL7KsmcjwZo8ywGeYcZhXGnZjItxTACMkLjfrAVFECIivlG+
         Kvo75Flwfsq6LLxxqTP/1+PqDyceDX2kp+1RgjppS04Y6HFn2m6mx7ThoQVh1vVyUQTt
         AHUyLxK7XpqCYwWA3clegNzgOK7r71UWlrYbOneAYjxFv8SuGXbz0KKnZMkCHG41c31s
         lMVMHfbwxUMLtiHMf5t7Mdy7Rllk3pSSJX82QOoBkBi3pkyjP/6eJLh14Po4I00wfu+A
         1gAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716127195; x=1716731995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZcAosKVRRNn3zbNdga7WpFXthPaMuTi09+NpFi9cn4=;
        b=OzVQs9V6nVdQ+B+CLCmlIs59w57ijVXj5jH+PIhQE8158RlQoQ3P7mRb88otHLtXzM
         P3Jn4PPUv6toSZHUa7fXNL7EOOwdw7JjJ8zvs5h/PIl9oChVoameOCyeSl98eWZoyJuN
         QOLE3yRk8tFxwZpI60RnhBEN3EYrz1xZAQemn+1w24TH6Nod3lG4tFh88LRrk+9NiC95
         GdkFPHQlBtxNYelxJ17mk9UCXK9hnAlWIKpZal8PZ+xKHtZB2vx2m1B9Ft5uQKv6ZaR4
         8NC1RW9MjuJJHt+EjkFe7elWSt5ECGIDe8y8OiJBOi8IWoGOwlFuQZNQRrBhIJUq9PzU
         T7DQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzPFz2nGnUMEIJ0zom0Fzw0uU6oMjYMxl2MiY5HRUr1K0Iz9aEDc2uBZEkMFCOStI755g5GoyCPjbubSqh9TdQBSkHPQf+2a4H58+IcZjP
X-Gm-Message-State: AOJu0YwyOfyGSc+zQmmKibNX2Zs/HwVR3FT5RbdkgobJLbB3gRIT4pDK
	lpSKkj/1s9bRAzrZtSGQVXQlwrOJTOzMSIlmmM4SivCKyNh9frNM2QpBXzO3pY4tIHxDCZyfAdo
	cbJ5eP1pOMVRWzflkSwDMsGoF9kA=
X-Google-Smtp-Source: AGHT+IH6xNDTbIhtdz7Y3rIQnrvN4RVVfAL2ZOJM/V7vjiY8AVeMhq3fp/vw7cqOpjmMsLzsCi0dGK2mS4SaJR/2EAY=
X-Received: by 2002:a50:ab0c:0:b0:572:459f:c7ab with SMTP id
 4fb4d7f45d1cf-5734d6f004bmr26176500a12.28.1716127195350; Sun, 19 May 2024
 06:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240518061925.43549-1-kanakshilledar111@protonmail.com>
 <20240519-ideology-nervous-eb30a92e1e42@spud> <CAGLn_=ugjbdszvN1PQ2eN-pLFQmz-EUmhj=2kOUKWWEsbFMKNg@mail.gmail.com>
In-Reply-To: <CAGLn_=ugjbdszvN1PQ2eN-pLFQmz-EUmhj=2kOUKWWEsbFMKNg@mail.gmail.com>
From: Kanak Shilledar <kanakshilledar@gmail.com>
Date: Sun, 19 May 2024 19:29:44 +0530
Message-ID: <CAGLn_=uuTOXRGYJGe4wV6u77Ew9aBakg99TNRRcAxo4W_khuGA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: riscv,cpu-intc:
 convert to dtschema
To: Conor Dooley <conor@kernel.org>
Cc: Kanak Shilledar <kanakshilledar111@protonmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240519_065958_690538_45C84990 
X-CRM114-Status: GOOD (  14.25  )
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

> > On Sat, May 18, 2024 at 11:49:21AM +0530, Kanak Shilledar wrote:
> > > +allOf:
> > > +  - $ref: /schemas/riscv/cpus.yaml#/properties/interrupt-controller
> > > +
> > > +properties:
> > > +  compatible:
> > > +    $ref: /schemas/riscv/cpus.yaml#/properties/interrupt-controller/properties/compatible
> >
> >
> > Unfortunately, this is still not what I was asking you to do :/
> > I said to make the copy in cpus.yaml a reference to this binding.
>
> Sorry for misinterpreting the comments. I will fix it right away.
> > Cheers,
> > Conor.

I have done the changes and created two commits for the respective
files cpus.yaml and riscv,cpu-intc.yaml.
I am having v3 for the riscv,cpu-intc.yaml but cpus.yaml will be on
v1. So shall I mail them separately or
merge both the commits in a single one?

Thanks and Regards,
Kanak Shilledar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
