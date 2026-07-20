Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE08C44515
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 07:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1zKd9sMOG+eU/8G1HZ7O06J8cp95MPIEHoQyflvON3w=; b=VpZSZaxrycobnX
	iG+7sMvwHwG4XXPuG+p7Sq0LhEqs10TPvNX5xC/uRTr/7lugGkd4F3V4dsd4f4T5Br0NHl2lIvt+v
	SBCwb+Wi52o4by5qClFtTXtRui4QAJuybehxaKogt2eXyo9eJBKEMUf2xpP0xZ9WsI5lquMr5SP/k
	Fl1JWMSwjjHR+ZmbhyIZorlkowp6fLtifi+WKvzdH3wn8HMzDXUat6CiJWpev/SITzAQbULHRsYLy
	SaaHfooHNnrKSxHymtsCZA9pHjXHuuO4W/lPFasMAqoGdjWIOrbFQNlfBIOqwboheZFSuGUDf9BNb
	KjZlDqP+TJw1L2sMTXlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliMU-000000064UG-2Yp4;
	Mon, 20 Jul 2026 07:24:27 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKd-000000063Kv-2ask
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 07:22:34 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-38e88b60121so154259a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 00:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532151; x=1785136951; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BreNlZNT5ZTae8ushLrJu7lRuJzqIG3wpbhbbx2mYvM=;
        b=SCYotGmCBddzBRfKjozlcogJNH75Sr3Rjh4oXS4HpWDjKoONvFSGI/pR+ru6HCcD7e
         gge+/Rpiry6rEV2uOfLgmfY7Q8KdMJcHqa1SY4GqxucGCrTLt+2Rl0PR/doTh9v7BgHo
         BTkYOE6tWAtaYkZzB7FKId4dAQbYa45+Xvbx6XWgpaOPfKVecRxXyTQ6zhgxXcs+QFZD
         JrJbevwhop28/CeSW0QDkm6ff/oqLhyZknQrKy+zMRMVG6Ov/DQ+QhVo6xG/VOg8rztr
         N3IswnXo0CHQQX3F9krFGd0tMJ9sLBw73MfnyRwgilzyHRjcs/Qjw1s9V8M6NRNK5Uec
         n5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532151; x=1785136951;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BreNlZNT5ZTae8ushLrJu7lRuJzqIG3wpbhbbx2mYvM=;
        b=nwNwOJ6c2Bt0BN7bZUusbx97J2CfEnanTtTeQPFRYb2IN2s3y/QjkRF3rdwVpO5axk
         gEMMMVC51yKxd9+2z31NwUxA+0WwPxMdDZlUPbK2SblOhNN2btAB+eEf0UMcrEMOemYt
         nwFDn9kwaJgwvA5HMfoQc1j9ZoshaeieR9Hi34/KT5d7Oo4Wioy8VZ/VwpfRX2Lbl+He
         glO+Nr2Kp8LEQ6vx66WMwrnkKHA0fJddqDpPQHe4Mou9+sIS2m7OsD7ioVnvhWEMuhIS
         JMM35tT1lnXEzl/xu7fnyvZeVXKUCTt1RG9NxsfUMvlz88kP7JmlKECC0GnpTn7M9xGU
         FB2A==
X-Forwarded-Encrypted: i=1; AHgh+RoC8dF/bCRMgI8GdqR4qIngg9Hq7G4j3kUgeKao2EG7cXdLlIR/ESw78o4zHnGQxzagoqJSsBS/1Nzcuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLckaRzy2MkKX8uXkG0ZOGvqClTZf8NUKYHKTidOsIRkoRXMl3
	sxzlzxvOcvVTybtNh9jfpkXHTW9cowo8IJogI0orZedP1Ek9zP2+GNZk
X-Gm-Gg: AfdE7clbmToXlHghSBwv0fslNvhjMjLVa0YgXn/T+/JRKWPS878xV4spDrjER9kyYIk
	Ipieq48hlXLDzTAm1pfKEU6FrV5xFy/nIji6+JsfNoQ4aicdew3z6k7Skbtp4s9GV3YAjKiwriL
	i2eYdtikHOpCgdbgOgnat3cqq/nVTw4UO5DNEY8nDqJkcEYOpF3heiz4w/O+bCu92p3yQPRh79R
	5Lq+ThzLV2UwKQWOauDkLmyvzz8IgRkIKxXtY2WHWvP2AQhUZerhVz8hUlcex+62EBp3xm8Qds0
	s679ETIkRmLapq+R868rqbtuNCO9PMkxXOo0dvusY73JkcQAviM0fGP/OzoLUom2LpUxtaaACdI
	RQZAD/WfyWa7rYeDKzH2eNnlhb1vcHRZAhAIUOzj6KRxWdphb6mn/Ylr8EyluDyx2tkg52DF5cU
	S8kzA3Lq+wZbVMxhzABj2jpeyhNw2p
X-Received: by 2002:a17:90b:5288:b0:38e:3542:212 with SMTP id 98e67ed59e1d1-38e4b4462f1mr13603782a91.13.1784532151069;
        Mon, 20 Jul 2026 00:22:31 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:30 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v8 18/22] RISC-V: perf: Add Qemu virt machine events
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
In-Reply-To: <20260701-counter_delegation-v8-18-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-18-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211941.543975.9634559400279652785.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=763;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=vDMk1wbG7BpjO3r0gVy/Hpmtm/NTf4pFWtYcM8bSSl0=;
 b=dmChx5rGUuDAMnuQtfGv9m5CW9Vq2JsgbQMCPFYlQwlS3eI3VeyPYIFdDGrGWQEMegLQ9tc8z
 K8oWm1FcKBQCC0SbvGetMGFrcPiKGQMa9ah+iJXURfEGhOJ6+spv4/0
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002232_157183_C9B656ED 
X-CRM114-Status: UNSURE (   9.77  )
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

On Wed, 01 Jul 2026 01:47:06 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> Qemu virt machine supports a very minimal set of legacy perf events.
> Add them to the vendor table so that users can use them when
> counter delegation is enabled.
> 
> Qemu is identified by its marchid. Older Qemu reports all-zero
> mvendorid/marchid/mimpid, while newer Qemu reports the marchid 0x2a (42)
> allocated to it in the RISC-V ISA manual [1]. Register the events for
> both ids so they are available across Qemu versions.
> 
> [1] https://github.com/riscv/riscv-isa-manual/blob/main/marchid.md

Thanks for doing this.

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
