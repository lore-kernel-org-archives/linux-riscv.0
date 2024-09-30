Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F3FCE8377
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 17:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sh/s++F8vHQgsbQewFRRctkDEb25f1KjuG4gHWa0Qfc=; b=MPorlwD0qavHwAz4ksj83lIxQX
	dnAM96tj40co/DASAcjk56RAkfC5Ai5T+dk/yJdgFWcNkIZe2nHBpc39prrDQvXSXIh4cMmcEx4VE
	S5zq3HadOKO8jbHNBaCVAhH92pF4ST+1rnQBIsCY/M2W7mTEhgJw+AQz52vhaFIk3K8NBVuDB9/lX
	H0+2AELyukOPJbsDyYqvFR8gIXaFafQdBU/nSQNM3wAowysipaED+WYM6Va3uM3hLrPbLVQYspyOb
	bVbUGuS2kO5VhoEG5zeAsa1zjtDWYrNDDCu/5GKIfqsVGPDydsy5UytsV/d75tl7mgxvprPnCFeLN
	V2nrCSYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svJpQ-00000000KpJ-0Rho;
	Mon, 30 Sep 2024 17:04:56 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svJpN-00000000KnN-13Bf
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 17:04:54 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-71781f42f75so4303947b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Sep 2024 10:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727715891; x=1728320691; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xz+bkfejvthPlgPdQSvVCfDsoTn99Xm9hmAjc8LPyr4=;
        b=AzquUq/pWT+Cen+VsuoFZLlVjZYkc49jz7T5XspWY3v77TDoMpixMcYyfSTxnmtRd7
         Ui9C0AKpXj5ijrvzV6NTi0VIWCJgB3nxtFkftjnxXtraxsOgfT20RAmh3nPZNvKHCKo7
         Wgs2coM3ukWjtgesjqU1N8p59QJGShCY/of8u+pFspsCl0R7vyKKWFfkYyO+PvOWu1zj
         /y1o4yijKKIafwL0CLIHZ1PQVEVBwnIrlOncTwa6pKyB8z48kuvgr0pU51makf+wTAmp
         NmZgdzj2hbuYyi0IE/aDM46mCh0sXFEz0xTTSeEeEb0/U2yU6nLc5WZCTAn5GRykkZH+
         n8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727715891; x=1728320691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xz+bkfejvthPlgPdQSvVCfDsoTn99Xm9hmAjc8LPyr4=;
        b=di0ClVGaVdAtnLEd730iqmlKZheOUy65zcYVRjexg7Wdu/jsZe2hUvoYEEQ+6lnFdB
         TETpadlt+tHX6LPXsKr65Pp393adooTlBuuoZhBndaejUJkTVnQZHlgfp+zz8q1YSVjk
         Dq8QKfMLg9zC4jTrCqS2vv8qWXTMOwKResfd/zkXc4yW0ocWT3UIr5+rGgShftiFPk+9
         Ag8r11xRgAzZXo4hRmBDwnxUR0Kzyf2TlaGV5chVAqCqdobmzqSOGN4RvqBf1nVmYbEc
         OH1/827rTCKeGzqJ9S1VCfoJMag/kJYJx074sZ4PtqPsf/RDTzl1iYdqul3EJbedyKZ9
         R7Fw==
X-Forwarded-Encrypted: i=1; AJvYcCV3PKC74kAqCGDw6X3rDOgN9qTC50HFKkK7IjmkIw9g7JWBj2/ulXeTfoL3YVqkzZJMjhUQjpFQBAhReg==@lists.infradead.org
X-Gm-Message-State: AOJu0YysxYCwuuU5FJxscZ6OKph92zNroArT6W3fNYB1mcYtkPg8Rsxt
	ZXNkD43AJQ/Ai6W1gUdJfZZHdUsJX5onVRl+qAJFrvV75NuJD+x0/AS5iIhMjqgvBuYjh/uWofS
	W
X-Google-Smtp-Source: AGHT+IGj3wqkwReKg8OnHSxdCc7zaYOfFfaOE8qXpsQ0EjTy/gbYQvbdblFQ+sQxStUGKpCkov+09g==
X-Received: by 2002:a05:6a00:4fc4:b0:717:950e:b589 with SMTP id d2e1a72fcca58-71b26049452mr18911436b3a.19.1727715891519;
        Mon, 30 Sep 2024 10:04:51 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db2cadcdsm6784562a12.56.2024.09.30.10.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 10:04:51 -0700 (PDT)
Date: Mon, 30 Sep 2024 10:04:49 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Max Hsu <max.hsu@sifive.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH RFC v2 1/3] dt-bindings: riscv: Add Svukte entry
Message-ID: <ZvraMdZa8Shs/yyQ@debug.ba.rivosinc.com>
References: <20240927-dev-maxh-svukte-rebase-2-v2-0-9afe57c33aee@sifive.com>
 <20240927-dev-maxh-svukte-rebase-2-v2-1-9afe57c33aee@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240927-dev-maxh-svukte-rebase-2-v2-1-9afe57c33aee@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_100453_312207_1E385EA8 
X-CRM114-Status: GOOD (  11.22  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 27, 2024 at 09:41:43PM +0800, Max Hsu wrote:
>Add an entry for the Svukte extension to the riscv,isa-extensions
>property.
>
>Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
>Signed-off-by: Max Hsu <max.hsu@sifive.com>
>---
> Documentation/devicetree/bindings/riscv/extensions.yaml | 9 +++++++++
> 1 file changed, 9 insertions(+)
>
>diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
>index 2cf2026cff574d39793157418a4d4211df87315f..9f730e3aaae949debc18396183b989b504dcb899 100644
>--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
>+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
>@@ -171,6 +171,15 @@ properties:
>             memory types as ratified in the 20191213 version of the privileged
>             ISA specification.
>
>+        - const: svukte
>+          description:
>+            The standard Svukte supervisor-level extensions for making user-mode
>+            accesses to supervisor memory raise page faults in constant time,
>+            mitigating attacks that attempt to discover the supervisor
>+            software's address-space layout. Currently under review as Pull
>+            Request number 1564 at commit 81dc9277 ("Svukte v0.3") of
>+            riscv-isa-manual.

Reviewed-by: Deepak Gupta <debug@rivosinc.com>

>+
>         - const: svvptc
>           description:
>             The standard Svvptc supervisor-level extension for
>
>-- 
>2.43.2
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
