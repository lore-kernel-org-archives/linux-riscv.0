Return-Path: <SRS0=hgxb=OT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98AAC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 14:58:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB4F9613CE
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 14:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB4F9613CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/xYxILEIGHehDJBi7Taf7xiatRnwMPpd8drH9ppeG4Y=; b=GlOObDKyuOhYX5
	rBpHWjBjEb27BdRvhpg8eU4nLZWWigWeqN34NzEbTvqO6REAMYN4Ph9FL06/9GSK0PE2iNuLGdx4i
	DqAC+FFzjY0IVikji/Aw4vdJguEAQq+qYJmghxej4n03gL5q3eOeWYAYG2DH+bV0c5PhhIUERZUdZ
	4zEnByCkTkHygeqRn79f7ktWgTJKBWMqDk7cMcHdn+6ez4g2GQM89mS3SIgdD69PZi0DS+TiWnqkq
	Fd05cB7FKbgikAnbRwBjeRLtTPntNEoA0ALi9UBFCuTzhlJycxoNn6PMwDMM2rW/M2fweOrtvRcR+
	sODJbB9RoIMWbYBipQtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVb1o-00BQmD-MA; Wed, 29 Sep 2021 14:57:48 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVb1m-00BQjf-0M
 for linux-riscv@lists.infradead.org; Wed, 29 Sep 2021 14:57:47 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E05B83F048
 for <linux-riscv@lists.infradead.org>; Wed, 29 Sep 2021 14:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632927462;
 bh=OQKNU2zsWxm9Jo/LuBgWw8xEdpf0SBZ+oU39CLxAstw=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=QXbTcDat8bahnrgDcpSWmEir2E4aqRm5zRmQ1nu4e7UyPzZg4MNMcynVmfxCiMlwv
 IeSsj9ggUBsRN/0peKAMPDlGxAANJ8cvfAYU4+2mgFek4h/hnawOACdsaoUwYVSheY
 aTkRwgwadZN6seK1kx5cSQcUZOD3TpaFjuinH9McxFfV0bfICLZr4j0PYwptf9fwU2
 vjuXoqrudYYe23qAShgAdLpc+32e94vTfx6f+/wRgzdzwBX7m1PnrW6tjuMr4+yjip
 XIjkf5cz2ENHjR5E/lZxoew9jqkmrKwnGhV1wOVkCWi9B5DxJyr/a6isVMshul/mxc
 FGK/EfqtxxYFw==
Received: by mail-wm1-f69.google.com with SMTP id
 z137-20020a1c7e8f000000b0030cd1800d86so1348101wmc.2
 for <linux-riscv@lists.infradead.org>; Wed, 29 Sep 2021 07:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OQKNU2zsWxm9Jo/LuBgWw8xEdpf0SBZ+oU39CLxAstw=;
 b=s1/2+9T2209f+rsmJRmtFcMNpSU7ex38RYAuO14pLpumh6TMWvfmpxop9/cwLFSyyc
 cFuojFq/+BROoYpth8mT4/W+6aABBw6QwMCQSb20BiMNKTeLQdq8yXko+0TeHRIihl6/
 V8fySiEEgF2GsL5brgb2ZrAsTSrUTQXdAxjbLY6N5R7PnEDXBmD12TjQPuoKClI2x8n4
 Ji+zXZIv6G/RFe3Qylou+uPWQeNPFAzRRz2PK3dl2XZn09gZsnVzztXALsoxDl6BAkGR
 IpdBYKiQxUfdJ8sn1tZEitTla/C9317UrzGu+tC2SDppBytV0FvaPSNQNvDAlXjr11QM
 chmQ==
X-Gm-Message-State: AOAM532dUsPakqv3872AxfMmHELUC5IYgiPf0YwN3dqR2myA8g/vXA+h
 c78bn0BpfHUjawBnL5tewMYkSN1l4DQQniqlg4ecsDGlujsfeSkTIcB3Qnimx/SkH3UcY17i2U1
 44Bir3eJfMxJ/G5l/JwC4GlXma2r43U9ktz3FC/06YxNIlQ==
X-Received: by 2002:adf:a4cf:: with SMTP id h15mr370308wrb.56.1632927462558;
 Wed, 29 Sep 2021 07:57:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWeSWC8Cet11Ro5/xO8f14KgL4rhrNIaUyTxHnc/lR/+aHCeqyv0GI/LbfJlrDouaKDo8Q7w==
X-Received: by 2002:adf:a4cf:: with SMTP id h15mr370287wrb.56.1632927462418;
 Wed, 29 Sep 2021 07:57:42 -0700 (PDT)
Received: from alex.home (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id a25sm1888009wmj.34.2021.09.29.07.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 07:57:42 -0700 (PDT)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@wdc.com>, Christoph Hellwig <hch@lst.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-efi@vger.kernel.org,
 linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [PATCH v2 06/10] riscv: Explicit comment about user virtual address
 space size
Date: Wed, 29 Sep 2021 16:51:09 +0200
Message-Id: <20210929145113.1935778-7-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
References: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_075746_225319_A7AA5384 
X-CRM114-Status: GOOD (  12.21  )
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

RGVmaW5lIHByZWNpc2VseSB0aGUgc2l6ZSBvZiB0aGUgdXNlciBhY2Nlc3NpYmxlIHZpcnR1YWwg
c3BhY2Ugc2l6ZQpmb3Igc3YzMi8zOS80OCBtbXUgdHlwZXMgYW5kIGV4cGxhaW4gd2h5IHRoZSB3
aG9sZSB2aXJ0dWFsIGFkZHJlc3MKc3BhY2UgaXMgc3BsaXQgaW50byAyIGVxdWFsIGNodW5rcyBi
ZXR3ZWVuIGtlcm5lbCBhbmQgdXNlciBzcGFjZS4KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBH
aGl0aSA8YWxleGFuZHJlLmdoaXRpQGNhbm9uaWNhbC5jb20+ClJldmlld2VkLWJ5OiBBbnVwIFBh
dGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgpSZXZpZXdlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBh
bG1lcmRhYmJlbHRAZ29vZ2xlLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFi
bGUuaCB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3BndGFibGUuaAppbmRleCAyZjkyZDYxMjM3YjQuLmZkMzdjYzQ1ZWYyYSAxMDA2
NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKKysrIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKQEAgLTY2NCw2ICs2NjQsMTUgQEAgc3RhdGljIGlubGlu
ZSBwbWRfdCBwbWRwX2VzdGFibGlzaChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIC8qCiAg
KiBUYXNrIHNpemUgaXMgMHg0MDAwMDAwMDAwIGZvciBSVjY0IG9yIDB4OWZjMDAwMDAgZm9yIFJW
MzIuCiAgKiBOb3RlIHRoYXQgUEdESVJfU0laRSBtdXN0IGV2ZW5seSBkaXZpZGUgVEFTS19TSVpF
LgorICogVGFzayBzaXplIGlzOgorICogLSAgICAgMHg5ZmMwMDAwMCAofjIuNUdCKSBmb3IgUlYz
Mi4KKyAqIC0gICAweDQwMDAwMDAwMDAgKCAyNTZHQikgZm9yIFJWNjQgdXNpbmcgU1YzOSBtbXUK
KyAqIC0gMHg4MDAwMDAwMDAwMDAgKCAxMjhUQikgZm9yIFJWNjQgdXNpbmcgU1Y0OCBtbXUKKyAq
CisgKiBOb3RlIHRoYXQgUEdESVJfU0laRSBtdXN0IGV2ZW5seSBkaXZpZGUgVEFTS19TSVpFIHNp
bmNlICJSSVNDLVYKKyAqIEluc3RydWN0aW9uIFNldCBNYW51YWwgVm9sdW1lIElJOiBQcml2aWxl
Z2VkIEFyY2hpdGVjdHVyZSIgc3RhdGVzIHRoYXQKKyAqICJsb2FkIGFuZCBzdG9yZSBlZmZlY3Rp
dmUgYWRkcmVzc2VzLCB3aGljaCBhcmUgNjRiaXRzLCBtdXN0IGhhdmUgYml0cworICogNjPigJM0
OCBhbGwgZXF1YWwgdG8gYml0IDQ3LCBvciBlbHNlIGEgcGFnZS1mYXVsdCBleGNlcHRpb24gd2ls
bCBvY2N1ci4iCiAgKi8KICNpZmRlZiBDT05GSUdfNjRCSVQKICNkZWZpbmUgVEFTS19TSVpFICAg
ICAgKFBHRElSX1NJWkUgKiBQVFJTX1BFUl9QR0QgLyAyKQotLSAKMi4zMC4yCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
