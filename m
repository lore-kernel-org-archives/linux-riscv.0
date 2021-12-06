Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FE8C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 10:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9IzHUUFh4jn60tceej12SEDhcZtUOqV/HykmdwD7gRo=; b=iFqhHFgYL/2DXL
	NvQymj7ryQvB6UTVj3o5fbY5TPHJPsZWvR80aNGEg8J6a90YtDVbmlWXwc5Q8gC8RI26BKtHm+MO+
	m564idBt2cGPe+AqG0aNrGKVNNL7zZvCBj2oqRVhRpeo2Xqdqp72UIO6qd71JA8FVAj2uoIpdkDTn
	1JVo63Hc6WPxtTRWnswiojltYXjOr7JT/oeMLV/FcaKzSmFykgOKy9Wl7Pi2RPRit8Z15SQhUah8O
	O8U5M4fzD4Qxhk3pWdF9RoRxa2eP63XWup9DEMWE8KK6bTivxtUIfK0+voSxJjf3H1I3YEBUYvOr8
	BVXjE37QF9KzZpVP0XyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muBfc-003SYE-Jz; Mon, 06 Dec 2021 10:56:32 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muBfZ-003SW0-FQ
 for linux-riscv@lists.infradead.org; Mon, 06 Dec 2021 10:56:31 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 386764003F
 for <linux-riscv@lists.infradead.org>; Mon,  6 Dec 2021 10:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638788188;
 bh=CS+lflLGdqIBScWk3+o9lUxh8jVqR8Nq2WKSyjwTWok=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=kRQvGMmQbwuxrGCad0acS+UGXUGGVmvUr4mRKUgt8rHEOMcve4eyFknePpdsT746v
 SS6OxmxtIpZbVX1X21I7NjyK1DTWV1nS8pjNcJ1mr6CZ2fSal4r8cU5TviNX0+jv/7
 oPMP5l8JvSIDIJ0DYdCDZ596F/QyxwbF45GuIY+yC+xfYZH3bEHeZbK5c9VKnOEAwM
 g32jxTT33g+qtNGvlyF0DUQuVEROczp0r6vlU5bckHFnFDtnWjuJfWeJ9EzGNhHoF2
 uhyyAUwmN9H/9Mnv2geFNQCCSbAgQgSmx9CP2GRW1ONHIYvIEoVTBLWfNUGQEjf1X7
 pK8R7KgDaDOBg==
Received: by mail-wr1-f70.google.com with SMTP id
 q15-20020adfbb8f000000b00191d3d89d09so1908495wrg.3
 for <linux-riscv@lists.infradead.org>; Mon, 06 Dec 2021 02:56:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CS+lflLGdqIBScWk3+o9lUxh8jVqR8Nq2WKSyjwTWok=;
 b=Q99F8X+x/bVhY26AQ9Z0qVG7tgykzqFRdgUPKKbs8Ut7TSHMGPQrh2WxkQw/4Pyq6n
 t7LcgVEwd9+WlR9sEfGQoOT42isJtOyx5tk7J3Yo/keMOFkOBOwd98Rb1dWB+k/nfqlc
 0YEE+D7Xivg5tDj4vfQaV/KRXaZsU/L1MzMyhDopPKos7HG/UdG7XwpcJuHNKUoI+Ows
 R4EE+vw1ovZ+jpabD3cpSiOES97zPophIdY8YEZqyJSiiFKyi+0RGT+xtCVQrRaBRNr9
 /rG0Y+SRSOfidfIYZeTUT/BPmGG25cDHri7objcwQ/ZDaMoJ9i5OUkET5ULdXaI717FM
 TS5g==
X-Gm-Message-State: AOAM531dIWt1mBpa2Epr9ygOQ0aZYcRdNACqGkgMoilb2UdJeRf5olqy
 ZxLvAqAtjfRn2Lu4H/WCyaGmZwJIIEQl7NAzQN46lh1dZgmQvzuI94m3ga6CJd5uN2PZYqjatbL
 XhpclhA3Snj2rpBX9JI5u7AYC7QwE7EFVlzAZ6LeBYB7KbA==
X-Received: by 2002:a5d:6447:: with SMTP id d7mr41714899wrw.118.1638788187818; 
 Mon, 06 Dec 2021 02:56:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVLYW0mXNza0Vbe+pg2BAchzw+eMDx5NF0VjULPJd5GzhsW1C+AKsPuIExWWzzUawkBQmTeg==
X-Received: by 2002:a5d:6447:: with SMTP id d7mr41714859wrw.118.1638788187621; 
 Mon, 06 Dec 2021 02:56:27 -0800 (PST)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr.
 [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id v6sm13522985wmh.8.2021.12.06.02.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 02:56:27 -0800 (PST)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@rivosinc.com>, Christoph Hellwig <hch@lst.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, panqinglin2020@iscas.ac.cn,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-efi@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [PATCH v3 09/13] riscv: Explicit comment about user virtual address
 space size
Date: Mon,  6 Dec 2021 11:46:53 +0100
Message-Id: <20211206104657.433304-10-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
References: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_025629_695272_9AE146C7 
X-CRM114-Status: GOOD (  11.92  )
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
Y2x1ZGUvYXNtL3BndGFibGUuaAppbmRleCBlMWM3NGVmNGVhZDIuLmZlMTcwMTMyOTIzNyAxMDA2
NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKKysrIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKQEAgLTY3Nyw2ICs2NzcsMTUgQEAgc3RhdGljIGlubGlu
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
ICAgKFBHRElSX1NJWkUgKiBQVFJTX1BFUl9QR0QgLyAyKQotLSAKMi4zMi4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
