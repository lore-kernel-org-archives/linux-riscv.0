Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35B4606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 19:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WggF4psY;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=O13ecu1l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iFFZKHT6hrWYknLnMxRFE3scaCO0KT28b88QB9rtjMA=; b=WggF4psY15uTt3y4xZwSrDYIFn
	GgHyUwnWKJR2Budev6ySCi4BBI9ZgtTrachTpNryAViqlZIPUaG8lFpUe115qqzt1DmJ3wECEg0P6
	LPRxIpx2xB4a547ob4NabjF6idI6zw7Kz0Re7FLjZNQIODUPyoE2NGns71RIZok7jy01t0QGlLgLl
	A6FPF+0FvzkCaXpFQi5+F28KlQXXH6wg3E6q4iVeCdNuANHNyQ9hmuFk6FFWp/n1OEBaIiZ+iwPym
	A0LMGPu+tzMSazGZraoLFGL/hH+4DqfQex1e6KIgqrysrVorQANO5lj2OZ2AuZD2x+CRtU8XEVXMm
	IqVgrB5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrZQ-00000004vBf-3TnF;
	Tue, 10 Nov 2026 19:31:52 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrZN-00000004v9G-0R9T
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 19:31:51 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E40D03F97D
	for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 19:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794339104;
	bh=HlDh8YMmHEBtzHMVqB6csYqKYNKf7MABmovW9DqJSao=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=O13ecu1lE0fY9ozGK0wADVTciwDl5oh4wWejqscWQGPEHm9+cXEzVoTYuGVpkcVLk
	 hq94WGJd9CUjJsIPIFTDIsG4xJjI9sZgC3L1W+0wxjB6rXjoKAYNS658eBTdTMHhmZ
	 W/cdXta6dacpVo49NLwXls6GE3lPZFQO6AZK1TJGZrpnIxC0hQLmvri8WoocWyMneF
	 wCbVaJVEbnq7ufxHUAp5U0cbcnp0xTm+2x6nWVdHa7upjL2k9V/Izf/jsfqwYsLfbk
	 mpuDEAjFmo7pW4EG4NsxyOhCUlokKyYRpFeLn6UZLCoLl0W9oYWvamlKkPu0C0UxeS
	 OKYUuT8DX3U50ZVkW00nITkHPbRNQ73UCMnvxcNYx6uDdrAsEwcaHxIH7V3G1+8k7M
	 is6vPH8+7GYE6Ylvx/Il/j5vSUCp/YwubrF0THfnQBrvQSueNFTy0w/su/CK/Grllf
	 v0xVO54cq8ln/h3bfKJEQbxMo4y/BM7pRtXKYKmQNZd2V80TAnCx0ZHxIgOx6OGYlq
	 6biHiLr87/FHjCqBeG6S2O8+6qzGjLwZsWqbBbBpxsbqIoH/HSm6m5bx0jBJMoMvwv
	 SWcMOLfEWkxDm5WBTwYGbYvzQvaliHMkNYCMrXTdojyapbxO/FfHP3V5QapEMTyEE9
	 XavCVlxpgOBIoRwm2cS9J9AU=
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c3f04e0e481so205737466b.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 11:31:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794339104; cv=none;
        d=google.com; s=arc-20260327;
        b=ZwYPkG/ubdwBpdTW1ZKq3CZS4huBph5GBbs0HCR+kuvxyTPmCODzXRJFHRIikulvao
         mwMldUS4XLT2a//vg9EeiJvHgKkscdXIx+OxidBqhGl8WJiFCQVRD9eyOWD8LWFHi4sV
         r68NKJEpD643QTAmN15AcZ7GQHZqBNzJ+yWOC5BADLq4NdAKleX20tZH7UOZnhQ/QVT4
         JYPh4MLCupAi3rrfN0EejNXi7L0P9Mu3+GzMrSLcgArBfucePvdEq2aS8wCWHxFt09TF
         K4Jh/kvvf+jmqBLGse4b5R73J6nBgBkSDYcet1U6ciYr806FBZ43dG+Aog6w6k7pYXJf
         Bb6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version;
        bh=HlDh8YMmHEBtzHMVqB6csYqKYNKf7MABmovW9DqJSao=;
        fh=tijX1vse2KosHTbFV2Kxs8uUqPrQyRbHciRE1sw1iM4=;
        b=B0iPJpHaD6IUsUz0ZBvmGjOEtvFaIXeRIIYZmxQwxPSVfPK0g48wqnQKnpnUV7x3Ck
         4CegUVZ0kanX+hyHLwzsfrKqvw1LexHcefYlAEaM4UTiePbvBZMX4mLA6o1P9iL16Q1G
         aRyiY2/aj7p2Y2cOUaUr+wz8OHG7wackJtaOdD2Sq3aFOyfSXHe4W08cehJQXH918B6I
         46yXxwDbqEDHcNNqOIj2UMPvEztEizNPKy++10Nvn47Y5uMxxpAx8s086rMRV3p4Txl1
         caGIdoohL33YbVc4YaP9xvJWQDG/NQDVs2i+YnP9fAtmiXW90Ft5PdMHZEY0RrLkNXBT
         TBSQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794339104; x=1794943904;
        h=content-type:cc:to:subject:message-id:date:user-agent:from
         :references:in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HlDh8YMmHEBtzHMVqB6csYqKYNKf7MABmovW9DqJSao=;
        b=pDpeKgwWgLX4cS1Ufw3oxU3WH4LPUvovV1XHNLPQ7+IOx6mf8y2sBEhabRDNOHSj6p
         DhrkrlyX53gT1av/XnyIx+VubJ7v8Q2MiLbW9UPWS/7RUej3J69RQc9FBTvQN80Uv5em
         /0JLkUtUNMaKGviq6lmxIMsAN7qSbfh05fm85ZbMUK3ZbQL7DFj4SiiiG5umnwKY0DIR
         vmF4YSAgjdQvtE1cphSd18h5CGE0rmVIJNJg+5f9IKZRwT5vfw8fZbLh9jhuYf4tzXMj
         JZK4TQbMMKUqhf8MfPOBjgGjJwe3WaY9pwOZq/OcOzMFGVtC5glWpR0AArnblWJnlRKv
         0jJw==
X-Forwarded-Encrypted: i=1; AL+hErHqTr1UxnfSO8R8sRPZq9HIOH2exSWp7OP5jHEkPE59pYdV8ugRz1dN+aawdTjhYol7Alc2zSza8P8rnw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+Yz/PvNGN7qOXHtrPdW2x0mKPa+CiiSpS43X9ZGS9U7KzrHZNc
	ketwspOEBUPLB9eL4fvQONB4nxzUy5cWW8nHPLlZbncyyIJcSC28LGrNNGGzn3IOs2+a9lS1kGw
	o+S5+swKZQUQSbwUP6S6VzTvJtH5A57WIzB8JRU1+8vGG66iLmvfjiufO0BRDbvKa6qzobJ92u6
	Za4u6lLYWej4eidmVUsNDiJBUccjn+cGY+xqFqNT/RZoDhhEHpZj5aSX0OWz+1
X-Gm-Gg: AYBFou3CNK1stvaDd6aZpDD4fICp995tsCxgPRtVHhqZIZUgRbzflmmmQoZw1DnujnV
	Ij+JHfdz/d0KGnpvw4/WNMJ7zPdAZX1UKkg1CQbsy8uFAMBNwYEWxaxG9VTyuUSRZLnesA4uUCz
	kTQQYgRAOqvFzB3t8IsNLhtObWdGTdvmv8/cV0yyDhll+Byz01VsvsCWmq
X-Received: by 2002:a17:907:2d9e:b0:c50:4b7a:de71 with SMTP id a640c23a62f3a-c5066c973bfmr7684866b.28.1794339104483;
        Tue, 10 Nov 2026 11:31:44 -0800 (PST)
X-Received: by 2002:a17:907:2d9e:b0:c50:4b7a:de71 with SMTP id
 a640c23a62f3a-c5066c973bfmr7681666b.28.1794339104008; Tue, 10 Nov 2026
 11:31:44 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Nov 2026 11:31:42 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261109051050.105623-8-joel@jms.id.au>
References: <20261109051050.105623-1-joel@jms.id.au> <20261109051050.105623-8-joel@jms.id.au>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Tue, 10 Nov 2026 11:31:42 -0800
X-Gm-Features: AclHuK9fQA8Jgn0xTRsqLvStB1Q8zamqe0b0Aq0C1Bxekl-A8FrsSuWOeKP0fC4
Message-ID: <CAJM55Z_zrUjaWrxSqZ=8VWEJqbh_Oa6gTHf=UJZyR2__MCVueQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] riscv: dts: tenstorrent: Add Atlantis platform
To: Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Gleixner <tglx@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, Drew Fustini <fustini@kernel.org>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_113149_534334_C63F3870 
X-CRM114-Status: GOOD (  12.38  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Quoting Joel Stanley (2026-11-09 06:10:47)
> Add initial support for the Tenstorrent Atlantis platform, based on the
> Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.
>
> The evb machine represents an internal bringup vehicle with just the
> interrupt controllers and a UART. This will be updated in time with a
> full featured machine once details are available.
>
> The chosen node sets bootargs to earlycon=sbi to aid debugging early
> boot, as the platform may not have a bootloader to fill out the chosen
> node.

Does this mean OpenSBI uses a different uart from uart1?

If not that means both Linux in S-mode and OpenSBI in M-mode will
both try to use uart1 at the same time. It might work by chance,
but a much better solution would be to just use "earlycon".
You already define chosen/stdout-path to point at uart1 and the
driver for 'snps,dw-apb-uart' implements earlycon so it should
work much the same.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
