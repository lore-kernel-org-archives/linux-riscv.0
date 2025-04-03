Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1674C3600C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Apr 2025 11:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C2sV9VsVYfK/tdhcKfNG3uAw/p8lSj4PtjcWZYlpd+s=; b=sPWdwD1qwrHotV
	pr7yu1cGSwR9P5Hfemao7wVe+kUENocWmh7rgvK+UZXOEEUAlXnHDq9KJDr1ZBHQCNRG7QsJwohYv
	Bym1yEuMk05L9I1hui9V3jC055tBVf98Szxx9MAuVzMTKaksweQvN9WYxxCzMhyDcS0px86DiI1Rh
	+Y/LqRxNzo4bsjBwhncGUGPon5KErikN0aoBfdJmP5JcDhi7k6gl7x1IBnFj8noCWWySZMKwrogTt
	dWWWpm9hkLqIwYfeAUK1GJ1LawzL0wmwfp9zaLFq4r+P+dtHxjFUv26vkSunmIKhAOS/Jad4sZLVD
	DGyLu+L+ZHUZDcQ3PCLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ItG-00000008jWK-36d7;
	Thu, 03 Apr 2025 11:37:46 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Iny-00000008iVS-2nNZ
	for linux-riscv@lists.infradead.org;
	Thu, 03 Apr 2025 11:32:19 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43d72b749dcso288855e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Apr 2025 04:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1743679937; x=1744284737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oR6PqtGhCEjz92xi+hsij6mLCExpfkTVXIEuhpc1C/o=;
        b=cs70dOfEIqOscK6oD9cLjRmygZMNOq6ywiGh0Lyl3BPsbhCvjFb+HOgdRnimRT34HL
         9AFyJ8GqovjW2StxAE2yV8Vv5hoUAcB2w3F2qGvSDfdozF28zEPOig5XYoZVQmiAapT/
         jxD2eQccorQSlbT9AVVcU/xRdwt78+Aw4PGY3fVgZBbENOHSU3JOAEmpW5BDeo5gEARd
         eBbQYdUoqfTCkGojDP8phR/aDv/HJcJVXzG560TP4SbSPXg7/k2u3t3LWFenb3eKXPyN
         4pd2SNiF5SluNIAMi5A1ASDOX1ybHVBlEwIaVMlffYXtB2EhndmNFOQ6RMrVMOZiUnCO
         y7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743679937; x=1744284737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oR6PqtGhCEjz92xi+hsij6mLCExpfkTVXIEuhpc1C/o=;
        b=YgIFArBecL3do3DJPuwdHOeEMYuwwooPAiiZWt+UH7c8TJJgIR/IplnZbFkKyCEkR3
         aQny/39O90inoZ38Xu8vu0egUX/TKJrVD6q3mqCV/E/L0RL7b1XoRTr5mV3FnGhojdiW
         MxapIFSFUI0lQy80MEixlc3Wd4iepo5XCYmbn3JccGNHKnCYBsAO2npljsNEE7K5WSeF
         xVSAAow9jrNXQXdc3FcNYFJK1AWf53E7NBScV9vK374gC1O6YIsQ8fXKaj2LCQGd/Lvw
         pinwjyPVqiWt6GH4M71NBExKGoEdT5pxXbXEITAyd/f7bVqRjI6Y+JleuaAXO/9OwKMG
         nyzg==
X-Forwarded-Encrypted: i=1; AJvYcCWIi1s7QbSXgEJ0RsnoNwbFQdeHMnV2JBbTVqQWiOLNqKNWpfSbQrPCcUwuE5Xy8QzGiopf7AGkJlqKFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yye7KNjzShhu2L89GRc5YlWVH8dHcClBuwJFp4i/k1Yk3WrWOWz
	D0K3z0dKUILkdCPNo5csLaREY4lv3c7jvv1X896XB/VKSWWHPqX+rTEexs6i+xg=
X-Gm-Gg: ASbGnct/Jq6lmiDuKjxJYAzlokuOaarvC+BzNpCZ5Qe2FgEHQOfM3Gg6syV173qJC0h
	cjK9vPv6MoAncrSbRRqD+4PtH6Lh/604yyhhkQeKkSiBOyil1jIsH5mvnGmOq0GhAftBFBlZB8z
	T5k+k8nGWxiDEcapNUymSeuMN2fANAjeuFkvFD3fEK27UMNsCRePLB1pPlTvd9DnRX3ytefxEE9
	juVtjdOKoiYJdxTmy9Wwk2q9W8u2bMfto7WoSDLVV8YgBNKWq0hCF6u7vK9GjEwZy6D0swLdHyy
	k/cYEiMWdAVlGDZFbN4O1m9XslDWuDNsMqe1quGHMJ+mkZtrdu59lRgI+V//pwe2M7QPD5ca1fx
	idg==
X-Google-Smtp-Source: AGHT+IFLuPHIJtkY001V8NzGfGDvy4KWQWKKGAIqS8lFxrZ1d/GjyGP4Yf4pmkBcRsFqmKnj2gYoIw==
X-Received: by 2002:a05:600c:1d12:b0:439:8c80:6aee with SMTP id 5b1f17b1804b1-43db62bc0femr69162255e9.4.1743679936757;
        Thu, 03 Apr 2025 04:32:16 -0700 (PDT)
Received: from localhost (cst2-173-141.cust.vodafone.cz. [31.30.173.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec169b4e4sm19424775e9.20.2025.04.03.04.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 04:32:16 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: kvm-riscv@lists.infradead.org
Cc: kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH 5/5] KVM: RISC-V: reset smstateen CSRs
Date: Thu,  3 Apr 2025 13:25:24 +0200
Message-ID: <20250403112522.1566629-8-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_043218_741085_2C6C83E3 
X-CRM114-Status: UNSURE (   8.82  )
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

Tm90IHJlc2V0dGluZyBzbXN0YXRlZW4gaXMgYSBwb3RlbnRpYWwgc2VjdXJpdHkgaG9sZSwgYmVj
YXVzZSBWVSBtaWdodApiZSBhYmxlIHRvIGFjY2VzcyBzdGF0ZSB0aGF0IFZTIGRvZXMgbm90IHBy
b3Blcmx5IGNvbnRleHQtc3dpdGNoLgoKRml4ZXM6IDgxZjBmMzE0ZmVjOSAoIlJJU0NWOiBLVk06
IEFkZCBzc3RhdGVlbjAgY29udGV4dCBzYXZlL3Jlc3RvcmUiKQpTaWduZWQtb2ZmLWJ5OiBSYWRp
bSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2t2
bS92Y3B1LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwppbmRleCA0
NTc4ODYzYTM5ZTMuLmFjMGZhNTBiYzQ4OSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNw
dS5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwpAQCAtNjUsNiArNjUsNyBAQCBzdGF0aWMg
dm9pZCBrdm1fcmlzY3ZfdmNwdV9jb250ZXh0X3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkK
IAogCW1lbXNldChjbnR4LCAwLCBzaXplb2YoKmNudHgpKTsKIAltZW1zZXQoY3NyLCAwLCBzaXpl
b2YoKmNzcikpOworCW1lbXNldCgmdmNwdS0+YXJjaC5zbXN0YXRlZW5fY3NyLCAwLCBzaXplb2Yo
dmNwdS0+YXJjaC5zbXN0YXRlZW5fY3NyKSk7CiAKIAkvKiBSZXN0b3JlIGRhdGFwIGFzIGl0J3Mg
bm90IGEgcGFydCBvZiB0aGUgZ3Vlc3QgY29udGV4dC4gKi8KIAljbnR4LT52ZWN0b3IuZGF0YXAg
PSB2ZWN0b3JfZGF0YXA7Ci0tIAoyLjQ4LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
