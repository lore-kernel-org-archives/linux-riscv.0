Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B97D3A692
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 19:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVXv+vP3rWDz4Jrv4Cbf8AJt2Hbf/w3fFOXcR4Kk55M=; b=mAn4O9bP6yBO/zid3W0hZRfOwp
	MSKzKOAvdmAAyFMgS1e+fx2gt2W1vlVqZGu8EvD24fITpa5/I7FYULBJ83z79vW3sl+rADJm6J3KF
	CmCt0gxX5QMXOeUdWaFKHmQA23KcsiCJXwvOr17Ah1noswmLmN/LPer9EbF+8mIAb8fK0s72mm+wa
	Ju2tgpGiExEyEHnE2uvedOsbADvIXylwUhT5XCrXhISz+74cWcnOqmOh1+8yAwp0GO9YFeEt5o4nS
	WX6t4/E012kZZWytYv+7w7RKV5/l3FwrMr3Udv/PNpBncMqWUdqEFPOoOInu+0Ot1cMEcEJklK1eZ
	NwslKpUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rvA-0000000FfQS-1C8k;
	Tue, 29 Oct 2024 19:30:28 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rv8-0000000FfOn-0Bbv
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 19:30:27 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20cbcd71012so62856135ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 12:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730230224; x=1730835024; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eZYty5iLNq618ev8kgFv2jOkN8cQs9inuPb0s+iDRZs=;
        b=bw0VY0gZZUdmuy9/OqtlmeNeGzJuEmdZJgEluZlk01FNIoVcZnqvaNw+jLPCbRP7qy
         reAFxrybmMJLYoee5vOKX2S9Slu8zOd8n8Aqgb8Uo4DmlgiPd7Vp6hjh20RJCNqZOcdl
         3oq6tFotyLjul6xl1M8KatF9fKyD7cHN8ZqsEl0YrHBS9WtGUzroVldIR56FkT6K4CK2
         7kgQq/2iLvHbAF9cIlfr5nBqkzd5PMd4Bc/AZH9ZYWf/LaT4wdRdP7Et+UyslZ+wlBxS
         BG+oq05SJvvQ3x8qnb1uzb186dRtqvIpJdfIoowrcgYBjek3t/VvgRNHOJ7b/iIdGB+m
         gxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730230224; x=1730835024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZYty5iLNq618ev8kgFv2jOkN8cQs9inuPb0s+iDRZs=;
        b=ctbwGgcW1FsLpEZwnehwuyulZriJlXEIYWTaU/p03L9OOgTLd86GG8RZlTyAu/R9g+
         sgH2XYlXfOAp/yQDjLY3M+puDVgYTqqwK0P/wblE+DeF8PKO6NzAW+CIRflUbc9MFZ5V
         CTXiq5rEuRK4+zUqp/xjm3DMVTVR5Ie3LmiW1bMUIp/VYJeOI150qE2t4KhJgn1AHzzq
         IU+h3GbFjNQvffIOAHCVXdHIvEd677x2wywkNVcmxH+dgBekEszNyxckXUyWaLIGEFPL
         VULcOD3xZAdtq5p6FjdMmCE5wA+T88lKC8duv57XltL/G+FbyLfjJ+fMOvBPGI8ehM8d
         6uTw==
X-Forwarded-Encrypted: i=1; AJvYcCXjmytHdsMT/9QbMLvXY2nr2d3HwhibiXhX3VrYAJNG5sPKf8Ir4XF8W74mqew4BGVC4EmoB7j9YdXzaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQhqa2m2kzPOLwvCQ/WkPgljgMhuwXRnVYQo+H+JHsKCte/dS4
	ZCKA8c3wIdbPbyfGwivFbmMO3+zK1lfibLLgp7kkdL7rRemqb/cDZ/FmIoCfATY=
X-Google-Smtp-Source: AGHT+IFCGTXJ0m+b8aQG2NJq1Sf6l4nGmP7i3RBj87u6UaZGMbHBTkMdEXBC+/iHz1GLrMqpotUaBw==
X-Received: by 2002:a17:902:f70f:b0:20e:57c8:6abd with SMTP id d9443c01a7336-210c6c95ac5mr165995575ad.52.1730230224422;
        Tue, 29 Oct 2024 12:30:24 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf88490sm69587645ad.114.2024.10.29.12.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:30:24 -0700 (PDT)
Date: Tue, 29 Oct 2024 12:30:21 -0700
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
Subject: Re: [PATCH RFC 1/3] dt-bindings: riscv: Add Svukte entry
Message-ID: <ZyE3zSNnc9qxUPly@debug.ba.rivosinc.com>
References: <20240920-dev-maxh-svukte-rebase-v1-0-7864a88a62bd@sifive.com>
 <20240920-dev-maxh-svukte-rebase-v1-1-7864a88a62bd@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240920-dev-maxh-svukte-rebase-v1-1-7864a88a62bd@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_123026_241900_3BC75DBD 
X-CRM114-Status: GOOD (  10.06  )
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

On Fri, Sep 20, 2024 at 03:39:03PM +0800, Max Hsu wrote:
>Add an entry for the Svukte extension to the riscv,isa-extensions
>property.
>
>Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
>Signed-off-by: Max Hsu <max.hsu@sifive.com>
>---
> Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
> 1 file changed, 7 insertions(+)
>
>diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
>index a06dbc6b4928958704855c8993291b036e3d1a63..df96aea5e53a70b0cb8905332464a42a264e56e6 100644
>--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
>+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
>@@ -171,6 +171,13 @@ properties:
>             memory types as ratified in the 20191213 version of the privileged
>             ISA specification.
>
>+        - const: svukte
>+          description:
>+            The standard Svukte supervisor-level extensions for making user-mode
>+            accesses to supervisor memory raise page faults in constant time,
>+            mitigating attacks that attempt to discover the supervisor
>+            software's address-space layout, as PR#1564 of riscv-isa-manual.
>+


Reviewed-by: Deepak Gupta <debug@rivosinc.com>
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
