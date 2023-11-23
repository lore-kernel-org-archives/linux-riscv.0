Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC57C61D85
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 18:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YodStgIQBxePiNvzUhTwUemhxAMBvOuktWUg3/HTsJ8=; b=aSB5/QqfRNpli4
	fqiw3nLgNPRsskHpCfdfHnJPM/BgHdVJK+whoWlErzFlVv35IHMF2/HSJhb4wLsJsnO5nH1v7b0nD
	1saku7XJAdnLfwRURy8PBvdxhDU/enUAYt/lvpUXOQWVF7pcq2RaJ10SNJe/wrRWA83U7XEdMk19M
	DkdN4/SrNtmsetcg8YcT0GVnHM1GZsX/pwd/jll52557DP0Q6u0+aI3a8XNSECQYz+Zy/nJpGcQam
	7yfHQlWWWNaquSVrg9l4LvdoLTYNed4R/LupRNB5VhYHWBDOAKL4jdbxsfl1Ps1nPr2+Y3180F76l
	lKX0s0vBhNiGkwjGq6VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6EuG-005YGu-1x;
	Thu, 23 Nov 2023 18:58:32 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6EuD-005YFs-2r
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 18:58:31 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c873cf9f74so15170221fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 10:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1700765906; x=1701370706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IGDig6YgBY65aRC6yCBQTLGsMwfbG6Dc++Rh1cU7fbM=;
        b=nJU3hJIZcgRmYXfdCgFFrRpS8aIHDYS9Tarb4RQjJLxKuG+ZeFvNRNM2n+btQmP5Yy
         8F4snXFEGPZj60O9lxE9rUn12ZqkiLM4wogIE+UYkXM2OQLdwTJ7pbiBm8m3nE2kDlr8
         X64TuxkL6AC41AWDX8QxvuuIP5wH5qBgBOeWs7NWTtKiTF8K1p+NrxmrSqj0wH+bTVa/
         OPYy9xpyLKCn9As8qJ9Atzn7QWcLUjSiAVcAmaTYK34REjawTGlyDglmEOuCX+hNdxJv
         EMK87+g1T4QtzNP8BkmQ+vQylGqXhpO1mJfE4m6XJKa3jlvRBPhhiaHzLmAXd54mRL2D
         BeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700765906; x=1701370706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGDig6YgBY65aRC6yCBQTLGsMwfbG6Dc++Rh1cU7fbM=;
        b=NN4uLiM1Ljp4LFCX/Mj+CdBB4rLkePVqNiblOWHjx2eWaMKMLZkwDFueVmxXPNPCl8
         Hgj9B67o8Xuqpo5AKGdwQ7kfwCv1P+UIwyQNekT4hJU2FW0Xh8IKHFtob/hEXIFuxgFf
         OhRID7x5G8m8hoLv2b1SW1XS17dwtQVzK3y8Dhaq0fnPCiRxAQbGDN1vxiloCGr3NRxm
         qpgdBMvBjUktohKYCQS6tuP7dZny/x4cwvhEBood1yvMhoAR6Z+PrNrvrg6zbqTzV0YG
         MspF6vkEV1K0Te+8du2zkGPZzOEYKNL/y7Rj6x6pd1kIDNl5ojzGRMmB0TPTUlyA/oG/
         IQPQ==
X-Gm-Message-State: AOJu0Yx/pWyLy8LMu9mKiHZMX9GwTIYNjTVhxGUvxHq0yoJS2PtVhcbd
	nQRWGU8TdkuDaBs44cZtw3xSKKn7d5yxGfKzX+EHuzq+
X-Google-Smtp-Source: AGHT+IFY1/C0dQe7cOOy2B31dSRmgNpyJ4PnGGQCob4NYZKF2UsPTkohGqYxikaY7xsNsW23oO0U/w==
X-Received: by 2002:a2e:9ac3:0:b0:2c5:14da:91f2 with SMTP id p3-20020a2e9ac3000000b002c514da91f2mr219754ljj.22.1700765906008;
        Thu, 23 Nov 2023 10:58:26 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id l23-20020a170906231700b009ff1997ce86sm1115944eja.149.2023.11.23.10.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:58:25 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	=?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH 0/5] tools: selftests: riscv: Fix compiler warnings
Date: Thu, 23 Nov 2023 19:58:16 +0100
Message-ID: <20231123185821.2272504-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_105829_930309_BD8E84EE 
X-CRM114-Status: UNSURE (   9.27  )
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

RnJvbTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+CgpX
aGVuIGJ1aWxkaW5nIHRoZSBSSVNDLVYgc2VsZnRlc3RzIHdpdGggYSByaXNjdjMyIGNvbXBpbGVy
IEkgcmFuIGludG8KYSBjb3VwbGUgb2YgY29tcGlsZXIgd2FybmluZ3MuIFdoaWxlIHJpc2N2MzIg
c3VwcG9ydCBmb3IgdGhlc2UgdGVzdHMgaXMKcXVlc3Rpb25hYmxlLCB0aGUgZml4ZXMgYXJlIHNv
IHRyaXZpYWwgdGhhdCBpdCBpcyBwcm9iYWJseSBiZXN0IHRvIHNpbXBseQphcHBseSB0aGVtLgoK
Tm90ZSB0aGF0IHRoZSBtaXNzaW5nLWluY2x1ZGUgcGF0Y2ggYW5kIHNvbWUgZm9ybWF0IHN0cmlu
ZyB3YXJuaW5ncwphcmUgYWxzbyByZWxldmFudCBmb3IgcmlzY3Y2NC4KCkNocmlzdG9waCBNw7xs
bG5lciAoNSk6CiAgdG9vbHM6IHNlbGZ0ZXN0czogcmlzY3Y6IEZpeCBjb21waWxlIHdhcm5pbmdz
IGluIGh3cHJvYmUKICB0b29sczogc2VsZnRlc3RzOiByaXNjdjogRml4IGNvbXBpbGUgd2Fybmlu
Z3MgaW4gY2JvCiAgdG9vbHM6IHNlbGZ0ZXN0czogcmlzY3Y6IEFkZCBtaXNzaW5nIGluY2x1ZGUg
Zm9yIHZlY3RvciB0ZXN0CiAgdG9vbHM6IHNlbGZ0ZXN0czogcmlzY3Y6IEZpeCBjb21waWxlIHdh
cm5pbmdzIGluIHZlY3RvciB0ZXN0cwogIHRvb2xzOiBzZWxmdGVzdHM6IHJpc2N2OiBGaXggY29t
cGlsZSB3YXJuaW5ncyBpbiBtbSB0ZXN0cwoKIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2
L2h3cHJvYmUvY2JvLmMgICAgICAgICAgICAgICB8IDYgKysrLS0tCiB0b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9yaXNjdi9od3Byb2JlL2h3cHJvYmUuYyAgICAgICAgICAgfCA0ICsrLS0KIHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L21tL21tYXBfdGVzdC5oICAgICAgICAgICAgICB8IDMg
KysrCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3Ivdl9pbml0dmFsX25vbGli
Yy5jICAgfCAyICstCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdnN0YXRl
X2V4ZWNfbm9saWJjLmMgfCAzICsrKwogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvdmVj
dG9yL3ZzdGF0ZV9wcmN0bC5jICAgICAgIHwgNCArKy0tCiA2IGZpbGVzIGNoYW5nZWQsIDE0IGlu
c2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgotLSAKMi40MS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
