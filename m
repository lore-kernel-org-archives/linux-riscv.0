Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4016DC3DA49
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 17:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FRI4pIT4pRaKATzPVOitAZ4ls29eoH3gYPmzM7rIgz8=; b=ns2Mo8LQQb/sJO
	DvaBcAGoSC4rtuTFsLgVanvsvhzFR8Xo7L84ZPKaFKcQNk6pWLmrM9pEqRpamF7VHC/6tFDMfQRZ9
	Ht6TYmXVuKhs/2FhkYpNazdBFfkAjE2iswlJpcjK68OJGc608kY02VDJiJJ/UlDavQpwl4YyO7zuY
	q2l8V1XlG3Jre/DLM8hiIiOHGxHCSbH+NwLvZxRfQcPzYQNvIi9FxxB+elPzat0Lhl3qYGZqIqEMX
	XIzfcUWJtpRfja7Xmcxmx8ULjxSvR2hx6L8rsFRBIUxHWQtDbU/S8IA7LJ57oTa97LXpVueYU6IWt
	pq4cAVOdoc+PzYWDMkfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXOn2-00000004XSm-0WOi;
	Fri, 26 Jul 2024 17:31:36 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXOn0-00000004XRc-0Y6s
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 17:31:35 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-369c609d0c7so1688406f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 10:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722015092; x=1722619892; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJFfdDn4hCn+JfxAD3q9QsIiCucI1Gx1K/+KVTB4ve0=;
        b=XjUAX7Ny4BqEd1FBu+WW8flmA7G6OH1Q8q9xeDCXUlUOpy3EWYByUSexwtlEILj/lk
         hgyRj/+fBqeH+3caLxww5kVaArZGVHw1i8+l+ydxDirNHjjKHHURg4+318HawUWtXzLg
         md4gPw99ONdQGkDMnSqENNCGErmIAGhCMLra8jZpig49MX7qYgQjw4+EBPs00V2atRLS
         wpsXUoZBeNpE9dTDv5I/HiYc90Q84PA4bSWSODZtBdkDdbweTRpqMHZbSB+z4nfOcrL9
         CqzHRufh74Gj58hkmfzyvmBt63AflquxLuiigHRIZqAXtzseK0Z9yscvt5HC4+xZr3WM
         YiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722015092; x=1722619892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJFfdDn4hCn+JfxAD3q9QsIiCucI1Gx1K/+KVTB4ve0=;
        b=g8c6slEneP+if6dh5+N8kha5xaJYovwg+hWfUQtSmsxt/4FqZNxwuS1gT6b7C0RcP9
         WoTGmKtz1GFvWwK5adW0vtVQJZQIEvHQqMsJIWs14yCm2xqAh0AucxVGm5mUb9H/GHZt
         bSXT49tumvimDObk4/eCZWHQMT+cbpRUVLANbQMgU0/BKVxCiFEqVA4fj1zDcIeVWAot
         6sARtVZ3xQJbI76ksBGAVPoxp9W9dZ2u8Irbz1L3SAkDG0tZJYXutstTZ4Dqc0BAE4cH
         St7u7p+VZ3eu0G0GxGqms/tdIEZH3kmWSm9dq4WpFMQ4OKlpSoR5zPJ/rhFWQVq48gls
         TNiw==
X-Gm-Message-State: AOJu0YztDc78L6+KtYcuTXdzflMGCXwnQXtE/exxtCmtotHXFCduuKz9
	L4//ot+19/PpZ3YvebaOO7xVSAHypvzqa6uJzHAbArAxdj9921eVfs3h/4SUl9/q3iIlqlsgM3x
	Wnj2h3+pJSYu0DjkspafrhW3uhMxgBPPZqqfsQA==
X-Google-Smtp-Source: AGHT+IEcbBIq0QVjjaGO3yyeblxO7j7e77wp+O5wnIUnEO6JQdPn2RcZcLA9pSLULVqKcWiJroK44X/hEvsIxOop/OE=
X-Received: by 2002:adf:f00c:0:b0:368:7943:8b1f with SMTP id
 ffacd0b85a97d-36b5d0d0f9dmr327709f8f.43.1722015091942; Fri, 26 Jul 2024
 10:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240726163719.1667923-1-jesse@rivosinc.com> <20240726163719.1667923-9-jesse@rivosinc.com>
In-Reply-To: <20240726163719.1667923-9-jesse@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 26 Jul 2024 10:30:55 -0700
Message-ID: <CALs-HsuL_eFncoEe=ns2=Lsdr1y+a-QhzSsZ+Yw_LQ_X7fs2EA@mail.gmail.com>
Subject: Re: [PATCH v7 8/8] RISC-V: hwprobe: Document unaligned vector perf key
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
X-CRM114-CacheID: sfid-20240726_103134_188430_22796918 
X-CRM114-Status: UNSURE (   7.02  )
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
c2luYy5jb20+IHdyb3RlOgo+Cj4gRG9jdW1lbnQga2V5IGZvciByZXBvcnRpbmcgdGhlIHNwZWVk
IG9mIHVuYWxpZ25lZCB2ZWN0b3IgYWNjZXNzZXMuCj4gVGhlIGRlc2NyaXB0aW9ucyBhcmUgdGhl
IHNhbWUgYXMgdGhlIHNjYWxhciBlcXVpdmFsZW50IHZhbHVlcy4KPgo+IFNpZ25lZC1vZmYtYnk6
IEplc3NlIFRhdWJlIDxqZXNzZUByaXZvc2luYy5jb20+Cj4gUmV2aWV3ZWQtYnk6IENoYXJsaWUg
SmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+CgpSZXZpZXdlZC1ieTogRXZhbiBHcmVlbiA8
ZXZhbkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
