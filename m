Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36D7C3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 19:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eibpcUyCX7z4kAf1qdJg9BitSj9UB4J15DcqpH+u3so=; b=FjSZvVjvyoEdrR
	e1JLKvXEbPGb6XvgOxNW4cLoQdjtIawY1Mt8iRn82mBO0KCNMVsuBuvvzGmIgqR3WSRfszxjiLFAI
	KOXwjRHnZmf6WN/kBbfX9cXjumOTmeaK5XaUxkVDVxFil4pmg0PKoSQKr1fRRZiMW3TtG7ZM9DyWT
	RYvxynk2hCJmP3jw38XN1RC/99VnoC9pjDyiJp7WQ4NhTAHhlyYOxVmBX4IyAIb42+489H90j62zx
	2p7sqd5CaieE2AFbCRlTWjwBF/lAJz71muXdIwxNc/rFuB4zPzhgxNfRpBrNsguzke4jJ8JWXdy+n
	RANsFOBPFl9YG8jQ4lmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUtjT-00000003h3h-1i5V;
	Fri, 19 Jul 2024 19:57:35 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUtjQ-00000003h1q-0ubi
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 19:57:33 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-52e9a920e73so2315417e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 12:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721419050; x=1722023850; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8aLNC8rU70Zjs3Uh/UPocyKDEXo99TS0oP0YsHJFOw=;
        b=iXghg4szO8uRE8WTpU4j5gyNI57y85gGNdSpp5A/i1Y5AcHN+RJNu1KdS8W9jwd5ck
         R2IrOJriquE5H+ZlMTeavS+9ULqA4xCzOu5u6OWfHTqgWkhc9Y6opcJ+SzVVMB6yerh1
         rsEwvmd0V40ePomu6MoYNRj/LfMerJNK1w0lUnB4EqYbfWdGzD9+GTV+frbEHExfWsNq
         5+6ScHEsXTnX45pRIsB0pMHgdVJx30ZD1mDIBWF640jyAPoHa8Ns1hJFuMZ+sgOKxV5I
         gGYXNlIBhGypbMOA1jMjRRfmHBu08+2iAzl8i9C9KmmKCN1m0zMZTpJ/LDDRdgwrPRMC
         Setw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721419050; x=1722023850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8aLNC8rU70Zjs3Uh/UPocyKDEXo99TS0oP0YsHJFOw=;
        b=h1mliH20EJEnDApDE4YfK+lemnEDlxmGLj7PtvUHXeRl1U48L2Nwfr4o6tDV6Vbbv/
         +HSlVtDg4eYweKKMyB+Ru1WBK8OJH1caP8jBAINoeUDRpOVnVwI/2jDCuD+LPe0CgH77
         jEQc5Mmhx+1pzPN8skvCtvo91UhI8zmTvNEe7C9j8jCCWZOEj9oBm/wy8IeozZoAm1bw
         D5FW1LGxNCIq6L2D3Mb8bxzFCA1be88VJxVQqBw8K249WBM6tI+6mPY9HgcpY9a+e5Z+
         gKDREd2EChG8r2IsUGjtMJr5qQ3/TK2GeUxEoMAH9KB+YjFvZ5wa8Zz3a4r+nLvYpiYd
         7Dag==
X-Gm-Message-State: AOJu0Yw/vhkMAND6Hdaw3LaA8mB6DENe0wz3rVkNDaikkNIbD6BsjMzb
	zxijW7eodjqnyE3xLHpXghQsgzSah3O4cSG6OtM0eJscN5u6A2bfu8ldgd0AzJ7bvNyQ1Kg4VUD
	XXHckzpZiZjGt3hu3TdwCYjz+1/m1eFKs8D7zmQ==
X-Google-Smtp-Source: AGHT+IGLg0Zec4iHQMawiM7bkM9+i3kahZr0JAjZ2I8oWLHvoCCPg25fvrVDiKEktiVDPxl/yiCHdhaZSmY8GsEWCOg=
X-Received: by 2002:ac2:4c55:0:b0:52c:e10b:cb36 with SMTP id
 2adb3069b0e04-52ee53dc66fmr6231799e87.33.1721419050254; Fri, 19 Jul 2024
 12:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240717180727.4180475-1-jesse@rivosinc.com> <20240717180727.4180475-8-jesse@rivosinc.com>
In-Reply-To: <20240717180727.4180475-8-jesse@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 19 Jul 2024 12:56:54 -0700
Message-ID: <CALs-Hsu-jNSpoOq836GQjREChEYVWy=osYzS0KQzBB79_uKSrA@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] RISC-V: hwprobe: Document unaligned vector perf key
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Eric Biggers <ebiggers@google.com>, Greentime Hu <greentime.hu@sifive.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin <costa.shul@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_125732_282170_7C5B5391 
X-CRM114-Status: UNSURE (   7.34  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdWwgMTcsIDIwMjQgYXQgMTE6MDjigK9BTSBKZXNzZSBUYXViZSA8amVzc2VAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IERvY3VtZW50IGtleSBmb3IgcmVwb3J0aW5nIHRoZSBzcGVl
ZCBvZiB1bmFsaWduZWQgdmVjdG9yIGFjY2Vzc2VzLgo+IFRoZSBkZXNjcmlwdGlvbnMgYXJlIHRo
ZSBzYW1lIGFzIHRoZSBzY2FsYXIgZXF1aXZhbGVudCB2YWx1ZXMuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBKZXNzZSBUYXViZSA8amVzc2VAcml2b3NpbmMuY29tPgo+IFJldmlld2VkLWJ5OiBDaGFybGll
IEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgoKUmV2aWV3ZWQtYnk6IEV2YW4gR3JlZW4g
PGV2YW5Acml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
