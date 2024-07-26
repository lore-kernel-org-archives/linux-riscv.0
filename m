Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1BCC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 17:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bT6YOFIS+ZzUF5J6CGgxVzwg0e2JKfA7efOjXj6RxL8=; b=lNAoK5ukUCRSU4
	8eOwULX6WT7TuWEe7Z2hdpvMM2CBp2XEqb/ERxOV2ZoNM1DesVtrxE2vZ0/dSu8Dx0O+K0HG2QSHC
	Ie1JajMEz701rf5uhr0bGXQo3eHdHsLxQ3UC9lyzeRk4jJATMMgjs6gG5dN5lKj7mIFBmotO21c36
	r5pPdmc3ZnjORxS8fuC4ZkE/lw1SqOtpXR4U+V1eY0FvlJwIZzSzkFeeite/pGB9iWVyGwXCiMxfm
	rdXfnItNIXnVw72+iFT5pM+5gXxjnwPuRIJq9IPqHLhjYNzW4lRXlQhgAo1v5fZ1g1cCabRar8OZ3
	57bwgRTrZ28Q9PYwOWew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXOml-00000004XMg-1DqG;
	Fri, 26 Jul 2024 17:31:19 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXOmi-00000004XMA-31q4
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 17:31:18 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-52efc89dbedso1996315e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 10:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722015074; x=1722619874; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xl5MBziS7MMtJNQ+8lr6PG6+ExQShs8U6WB+5kJjGVI=;
        b=OqMgnCA5K2GWU6MSgGLzJHMi+eCu1TagXgOph25hrWYYNMQofuYvAIiUl8PUlTrgK9
         0GNdlOps0wSqFI2pa56nmnC2XKcgLDupezgWJkrFleKYfKT5z5qAO+wuCxTgQN0joxuR
         +KVH2c+k5mpVJ09mqs4fYcW+3jTUYt3KOEXBwmtfr6VR8iO0MsQ7o7rHDT18BKC6inUK
         V3RoSUdtFQFEaF/Eb7X39Vz3+5AZOlaYzBts5zEI5RwDrH55G5AoEaT4rFYJPTppaTu7
         dChq5cQfDNMGEbdqDkKSi5dnfulBjdCI4QAhwPdr4+4Jmz2CzF1Ii06d0cRoQvcuTACL
         tTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722015074; x=1722619874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xl5MBziS7MMtJNQ+8lr6PG6+ExQShs8U6WB+5kJjGVI=;
        b=RK6J1M918UtiYQhNttszcI1t1OEXYe6N+MLtQVr0ELKP9hSYt3puITzhIPAnsni8Wl
         81jFO64lYtpdhbxJ2txQ0WbiaUG+Yn3NWVM3S7WxnCxDaYBhs5+Pv9U++b4wp8OIK5ZJ
         TOsNKuMkiC3vU0qN0uSMfMF6Wc6GNm4/lL2gNCZQIPKfE1rU8ogwJEhVjjrDNYqo8Gwx
         g7uev2G2yntPlZc52DNyaOa61C4Nlt4nn3RrbMuacVToqB7RYe5EzoRz4q+QcT9ASN5V
         rFeTXbGJ1xWVUxKbmEN9mP6LXAGmQulxY2iHJuH8mmmNWhdodzOc4jKBZR4ySZ/H1ELe
         XPcg==
X-Gm-Message-State: AOJu0YymcD58hySPEMz41SauhK3LZ2aExWhNYP+JRgwSfoo7cRCmlJ/T
	6XPKvbKkEAomY3hbfyldU+6pPUh9OzJbcSUkP3OTg7GPTM2zepiBS82P5RgT8NYMLZAW0wMC7py
	N+g4eOVtzR2sakFnIky9jRFjCceK7pie9GWGf/Q==
X-Google-Smtp-Source: AGHT+IHl0keqbTpli0qtFCDOs9KQPvh5FiTCtZnHeHGftMUia5rWkyP0BFbDvmTVhCAd2RbboRnEBTXgj6gIcpDtNJw=
X-Received: by 2002:ac2:518e:0:b0:52f:2ea:499f with SMTP id
 2adb3069b0e04-5309b2803efmr341676e87.24.1722015074240; Fri, 26 Jul 2024
 10:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240726163719.1667923-1-jesse@rivosinc.com> <20240726163719.1667923-7-jesse@rivosinc.com>
In-Reply-To: <20240726163719.1667923-7-jesse@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 26 Jul 2024 10:30:38 -0700
Message-ID: <CALs-HsubnuBw_jTfx+fcD0s=9KEmZ4zFauzyTTnUCpJxYq9Djg@mail.gmail.com>
Subject: Re: [PATCH v7 6/8] RISC-V: Detect unaligned vector accesses supported
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
X-CRM114-CacheID: sfid-20240726_103116_781770_137FB018 
X-CRM114-Status: UNSURE (   8.57  )
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

T24gRnJpLCBKdWwgMjYsIDIwMjQgYXQgOTozN+KAr0FNIEplc3NlIFRhdWJlIDxqZXNzZUByaXZv
c2luYy5jb20+IHdyb3RlOgo+Cj4gUnVuIGEgdW5hbGlnbmVkIHZlY3RvciBhY2Nlc3MgdG8gdGVz
dCBpZiB0aGUgc3lzdGVtIHN1cHBvcnRzCj4gdmVjdG9yIHVuYWxpZ25lZCBhY2Nlc3MuIEFkZCB0
aGUgcmVzdWx0IHRvIGEgbmV3IGtleSBpbiBod3Byb2JlLgo+IFRoaXMgaXMgdXNlZnVsIGZvciB1
c2VybW9kZSB0byBrbm93IGlmIHZlY3RvciBtaXNhbGlnbmVkIGFjY2Vzc2VzIGFyZQo+IHN1cHBv
cnRlZCBhbmQgaWYgdGhleSBhcmUgZmFzdGVyIG9yIHNsb3dlciB0aGFuIGVxdWl2YWxlbnQgYnl0
ZSBhY2Nlc3Nlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEplc3NlIFRhdWJlIDxqZXNzZUByaXZvc2lu
Yy5jb20+Cj4gUmV2aWV3ZWQtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5j
b20+CgpSZXZpZXdlZC1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
