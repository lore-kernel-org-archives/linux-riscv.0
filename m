Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7B7C71148
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 18:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q3bT96vDwT76Y9nGJSiPXjsU5c6f788r5Ud6jbak3O4=; b=bDrno2j7GrYY1M
	j5bUIaSopD3IRrltOzQGgHGM7aISkji5eiNT1gs9k2eq+M8MGCMQ6t2g7KAQNhl60ZQXYRUKYMji+
	nWLQOZk/rxmjDb7tK48boF+UleVCiMmWGT3nYL2xln3rMCi/eKxsHyQ32PjrER+lADqmnE0sG72zh
	C8vqV2L1e7YbrsDkd3Zqs3XNKQXbhUSnZovDaNDGw4rU/QT9CsQ1rlgZjqY7xj8zHGe881MkfD+/C
	g7kS4gTuB0+l7/Q0A8m39m5UF0/fqmsB/THdXaACDf96UN4CRzUVTs4JC6uMVRsWspYxTLVtOoklI
	bBwTo3loTtztCF2R1tLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8x7-0000000HFQJ-1vBP;
	Fri, 13 Jun 2025 18:16:33 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6hh-0000000GxiJ-2GdH
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 15:52:30 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a522224582so1300171f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 13 Jun 2025 08:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749829948; x=1750434748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/A3BrYCrv39DbsgbB/mMrX15vuVGEbL7oR3ajVbCV20=;
        b=DjV9/yFJkOi7gt9rppNUtDIfG84Tfzv8uYspKvuPIYMmDDeTkIUDBAFIF9oxa+qF7j
         zQ0bvFmrp02nfzF0pqb53t3C+rX9da97fd1hS3AqiRQmXSC4/SVx3Oa93pvcF4wRgjXG
         SvqAL9s2SoOPKIEo4gxqyf1LHiJm1dnBjWDregJtPk+DnegwlLdmvPX3+s+rEqs/5aUE
         Eavxy0SOZuJqXeycxLxUhq2l9+FAtToCav57ZcBrYkYQjlT+7Xa2hxsKeqc5DJcBjSqa
         zQFkQUY7e1OH6rbyxlqurQgy79lCXjF5z2C3Y9dnzl0RoyvUsSMGro6VydKN4HUjPs4U
         NP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749829948; x=1750434748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/A3BrYCrv39DbsgbB/mMrX15vuVGEbL7oR3ajVbCV20=;
        b=AveplUr2CyLL6nF6B6yg8VjIRxLbXCjBDNL+dyqRiew/OXhV5NindOoHZTvdvJebms
         3X46X+pYBB6hGN77Yl2Mqi4DZYVh6HeXgb0DfNbbt21lduZwbcJVxY7t9Tu9OZH6jIeB
         6od5nn0DsYvm5XkoHtnUH0ysLoD4O1NIaCqBO6JWzO/tOdh1vkFNNAOl2qjqjF+AjVTa
         gtTDWDkblyKBHfLhwnTycDATUL6HAgcjqxISRwkPLt8oste+DYd9Q4CCnA0oJeQPn3Lz
         hXCqPiNqkLcuLxrz8187Ijcfls+gYxkOR2FvnEicSRNJSGVRcJtNjhVKPXtq7QrsG6RX
         IXiA==
X-Gm-Message-State: AOJu0Yy7Hu22QzxsWTS1R50/5r77em+b8ioNSWhz1tZQplXkZubKjNyz
	/wnO/+xExfzYgK9hC2eIEsc7yu/e8RTsTfx4rxnTH2x0IVACLqoiMC+G
X-Gm-Gg: ASbGnct4/FqpvhRLajfK0znHDXKmjeiJG0UT8MuR6OhbtIpH1kKFSziil4wgS5Lu8+J
	1uegcucQUR6A3CExdpXRlCEpoj4grU69FcUwCd8cK9osCeo4nha0Ve7bKHy8dQziQji4T5m1mp9
	IJA3SxZyw75xVaLiqKv552qLN7P4KLMydyBBcqZ88b6D7dcRgR+iMIASGNjHL1aIn+gFvTjNvXB
	8V8ErGt1tFpFMRrOvnYyTehU/i2/fEJBMRn8wjiqZLB4QY4cy2b4EnpwPwk4H3Jax43/Ssmxyb5
	zwLc/tFJZPykSIf5DP+22dd/fgWzDLXo9iutRv9R/KxeJntJNJilqVnmTN8SJcdw8WV0NvKkEpe
	z0T7TrHRoas9H6cKzbsKi9ZLJ
X-Google-Smtp-Source: AGHT+IElMqUUk1YlnmEZZhYHFJv1in0BvsowUK458/pFR5pgfb3KnXFmtZ1cu5Epd8Tzf9xWRjLFJQ==
X-Received: by 2002:a05:6000:4305:b0:3a4:dbac:2db6 with SMTP id ffacd0b85a97d-3a572e553e0mr213678f8f.49.1749829947747;
        Fri, 13 Jun 2025 08:52:27 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7cb65sm2772544f8f.38.2025.06.13.08.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 08:52:27 -0700 (PDT)
Date: Fri, 13 Jun 2025 16:52:26 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Atish Patra" <atishp@rivosinc.com>, "Andrew Jones"
 <ajones@ventanamicro.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, "Anup Patel" <apatel@ventanamicro.com>
Subject: Re: [PATCH 2/2] RISC-V: make use of variadic sbi_ecall
Message-ID: <20250613165226.751541c6@pumpkin>
In-Reply-To: <DALGSCDW0GIG.10I22KD2SCSNX@ventanamicro.com>
References: <20250612145754.2126147-2-rkrcmar@ventanamicro.com>
	<20250612145754.2126147-4-rkrcmar@ventanamicro.com>
	<20250613115459.6293f929@pumpkin>
	<DALGSCDW0GIG.10I22KD2SCSNX@ventanamicro.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_085229_588621_A9058457 
X-CRM114-Status: UNSURE (   7.44  )
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

T24gRnJpLCAxMyBKdW4gMjAyNSAxNjoxMDo1MiArMDIwMApSYWRpbSBLcsSNbcOhxZkgPHJrcmNt
YXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6CgouLi4KPiBUaGUgbWFjcm8gd2lsbCByZXN1bHQg
aW4gdGhlIHNhbWUgYXJndW1lbnRzIGFzIGJlZm9yZSwgYW5kIGl0IGlzIHdoYXQKPiB0aGUgc2Jp
X2VjYWxsIGFjdHVhbGx5IHNob3VsZCBkby4KClVnZy4uLgpBcmUgeW91IHVzaW5nIHByZS1wcm9j
ZXNzb3IgJ21hZ2ljJyB0byBhZGQgYSBwaWxlIG9mIHplcm9zIGFuZCB0aGVuCnNlbGVjdCB0aGUg
Zmlyc3QgJ24nIGFyZ3VtZW50cz8KVGhhdCBvdWdodCB0byBiZSBiYW5uZWQgYXMgZXJyb3IgcHJv
bmUuCgpJIHRoaW5rIHRoZSBvbmUgZm9yIHN0cm5jcHkoKSByZW1vdmVzIHRoZSBpbW1lZGlhdGUg
Y29tcGlsZSBlcnJvciBmb3I6CglzdHJuY3B5KGRlc3QsIHNyYywgMSwgMik7CgogIERhdmlkCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
