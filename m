Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9738C369DE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 19:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oqtLyD12zB8A5+V+8HVmxw9UsmhtgL3H3lXyIIuwNjI=; b=aVXto3QvNLBgJN
	rDrx/NmFQgzgptKXf3btihW+Ooa9XUrKQ8E8z40xaflq3S75/oqHLWfLW1JidfvIMzX7ddjhRVcmf
	9yfTaXsPFJCeLJuiY4vpRTrGbhsoptZp0gMkO+NQQpX9KlgpHTRNNY/zboaaD/iBbCNTznFz7Jy4p
	3jy64zZqub/e9hNxZFeEWyVGKuuwLfTGggQEW+M5kfWTFDQ7oUyd4OfuCaJ5rGwblfhiZWhkWXqlF
	dTaC6LurjwKNFZfaK1rPQEVLwPnZJftLtXb0kDzLhGAUSb/YURJFZfEIY6mHOEROVVrbYconLdUEf
	CGvFfEgmKjnDGVJxQWRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7JaZ-00000008LgB-41zg;
	Tue, 22 Apr 2025 19:47:27 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GPX-00000007tRS-2Ryu
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 16:23:53 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-739525d4e12so4489670b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 22 Apr 2025 09:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745339030; x=1745943830; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k21lSdGFw1ABvj7WqNf9xvlJy5uS9lN5lvHH4c8/sSI=;
        b=hg5q8As/AYGzsXDxLNviKjTlvHYDw4lhuPnEu2VwQRuxY4w/YL6iVGKwVUq3AiYbGs
         Ejb0O8cnFkOLuYBrXN1a3kIR7wpIo26g6SHdxAD2Z/hRpeOFgF/N3ipIzlxNwEVewjib
         QjN/uMDHzn+fanoqXEeyB6SmgkOBGRPAPFKJzJdOQWmNknU/NCt2tAJgQqrgMokV6cZE
         0niWM/vLjcSzWge+tx+dWGqAb1x2wL4AOhhX8ISeBJc/uLqgft5VQKpIku7cDHcYTg6/
         p8OgoGqYotthnBMESga5qSkgg8UFufgpkuJd+ujWKPzx0J1DS2+J3jlKiJad0AJutVoS
         K/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745339030; x=1745943830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k21lSdGFw1ABvj7WqNf9xvlJy5uS9lN5lvHH4c8/sSI=;
        b=QVkH7MiMiOFdIrl0rPPCzZutTgsnIqDV+TgNaPOy8fSxgVhUOZqqsRJwBv6eIkeOP9
         KDXunMju9TlJOON2UUo7uLzlVRH5AaVL4VJ7ikirOMW1DANtbJ4RhPMT55ML1kMkSIDm
         ARQ0+DryQ33USi+xPa6TMRA/ytw8Qe0QrBSi5BjagATe+Zwi7UPfhLH/UBtapRdSYtiI
         3EkvxF0mJGljqyr5znwNCqdTIKDSrq8ByYm/43VFZpbng4RosdH32Z2MNYpcBxgsGhOQ
         SXF/yzPFYaENtzZo2AVylRTd0YLDXwCcEh9eW31toLDnA60eSA8J6Dkm0mDTI595ZnlG
         pLTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW+ohhEbLgINVHPZB0zQkgdooRuHQ6BUReI/dBUJWwxWxOmY2QxiTgpL6suc9WwnB3LmUKZLb8kXeQMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFvDU/j/KJRlPHOSDbNgnEPqnESbYmhWLnpJGSCvQ3CUtng+Es
	Zv8vYkKsC1jDY0D2MZBU/2clYXYrSdzhBBz8brmm08rR0gmt+OQf/5OzZfp3LCo=
X-Gm-Gg: ASbGnctHZGQeKa/r8vMWZGrFPq2r1tLnFQaHO8sYP7S+g3L7zTkuxvFFwDpFP3aW7+L
	DkxoCijQ0BuUhPAplxerqLY51Rg23OTClCnGIQmcyBuT3f+5FbASks1lAQW0EnwKWYbooro5Iut
	4FlddscwCmfQLfaX+AEWsWYuowSzh5xyM0DUhz9e3XXpLReBV6yuhGHrh10RWW2PdVi3TMUOBQ4
	y4m8mZSh0+qwZ+3k6/rlzrUaiMTLrce1AoL5ymYejONqb3cgHrmsw0SEVaHJYQEEnFZ1E+ugMqP
	/D4sFMPJ/TRe5fw5zVBgjA6ae990vhEyv5lnBE4PQgmOpWFJm0hr
X-Google-Smtp-Source: AGHT+IGBaYB+zcFYNZod6Dyq/XeUaZqkUk/RN2FexFvjQuv/xDbjUf/BD8XILM+dfMbhssRMX5dz+g==
X-Received: by 2002:a05:6a00:b4e:b0:736:5504:e8b4 with SMTP id d2e1a72fcca58-73dc156b0c4mr22113079b3a.19.1745339030561;
        Tue, 22 Apr 2025 09:23:50 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e13e1sm8850825b3a.46.2025.04.22.09.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 09:23:49 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 0/5] riscv: misaligned: fix interruptible context and add tests
Date: Tue, 22 Apr 2025 18:23:07 +0200
Message-ID: <20250422162324.956065-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_092351_854873_A070B076 
X-CRM114-Status: GOOD (  12.73  )
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

VGhpcyBzZXJpZXMgZml4ZXMgbWlzYWxpZ25lZCBhY2Nlc3MgaGFuZGxpbmcgd2hlbiBpbiBub24g
aW50ZXJydXB0aWJsZQpjb250ZXh0IGJ5IHJlZW5hYmxpbmcgaW50ZXJydXB0cyB3aGVuIHBvc3Np
YmxlLiBBIHByZXZpb3VzIGNvbW1pdApjaGFuZ2VkIHJhd19jb3B5X2Zyb21fdXNlcigpIHdpdGgg
Y29weV9mcm9tX3VzZXIoKSB3aGljaCBlbmFibGVzIHBhZ2UKZmF1bHRpbmcgYW5kIHRodXMgY2Fu
IHNsZWVwLiBXaGlsZSBjb3JyZWN0LCBhIHdhcm5pbmcgaXMgbm93IHRyaWdnZXJlZApkdWUgdG8g
YmVpbmcgY2FsbGVkIGluIGFuIGludmFsaWQgY29udGV4dCAoc2xlZXBpbmcgaW4Kbm9uLWludGVy
cnVwdGlibGUpLiBUaGlzIHNlcmllcyBmaXhlcyB0aGF0IHByb2JsZW0gYnkgZmFjdG9yaXppbmcK
bWlzYWxpZ25lZCBsb2FkL3N0b3JlIGVudHJ5IGluIGEgc2luZ2xlIGZ1bmN0aW9uIHRoYW4gcmVl
bmFibGVzCmludGVycnVwdCBpZiB0aGUgaW50ZXJydXB0ZWQgY29udGV4dCBoYWQgaW50ZXJydXB0
cyBlbmFibGVkLgpJbiBvcmRlciBmb3IgbWlzYWxpZ25lZCBoYW5kbGluZyBwcm9ibGVtcyB0byBi
ZSBjYXVnaHQgc29vbmVyLCBhZGQgYQprc2VsZnRlc3QgZm9yIGFsbCB0aGUgY3VycmVudGx5IHN1
cHBvcnRlZCBpbnN0cnVjdGlvbnMgLgoKTm90ZTogdGhlc2UgY29tbWl0cyB3ZXJlIGFjdHVhbGx5
IHBhcnQgb2YgYW5vdGhlciBsYXJnZXIgc2VyaWVzIGZvcgptaXNhbGlnbmVkIHJlcXVlc3QgZGVs
ZWdhdGlvbiBidXQgd2FzIHNwbGl0IHNpbmNlIGl0IGlzbid0IGRpcmVjdGx5CnJlcXVpcmVkLgoK
VjI6CiAtIFVzZSBhbiBhcnJheSBvZiBzdHJ1Y3QgdG8gc2ltcGxpZnkgbWlzYWxpZ25lZCBsb2Fk
L3N0b3JlIHNlbGVjdGlvbgogLSBSZXZlcnQgdXNlIG9mIGlycWVudHJ5X2VudGVyKCkvZXhpdCgp
IHRvIGlycWVudHJ5X25taV9lbnRlcigpIGZvcgogICBrZXJuZWwgc3BhY2UuCgpDbMOpbWVudCBM
w6lnZXIgKDUpOgogIHJpc2N2OiBtaXNhbGlnbmVkOiBmYWN0b3JpemUgdHJhcCBoYW5kbGluZwog
IHJpc2N2OiBtaXNhbGlnbmVkOiBlbmFibGUgSVJRcyB3aGlsZSBoYW5kbGluZyBtaXNhbGlnbmVk
IGFjY2Vzc2VzCiAgcmlzY3Y6IG1pc2FsaWduZWQ6IHVzZSBnZXRfdXNlcigpIGluc3RlYWQgb2Yg
X19nZXRfdXNlcigpCiAgRG9jdW1lbnRhdGlvbi9zeXNjdGw6IGFkZCByaXNjdiB0byB1bmFsaWdu
ZWQtdHJhcCBzdXBwb3J0ZWQgYXJjaHMKICBzZWxmdGVzdHM6IHJpc2N2OiBhZGQgbWlzYWxpZ25l
ZCBhY2Nlc3MgdGVzdGluZwoKIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvc3lzY3RsL2tlcm5l
bC5yc3QgICB8ICAgNCArLQogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyAgICAgICAgICAgICAg
ICAgICAgIHwgIDY0ICsrKy0tCiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMg
ICAgICAgICAgfCAgIDIgKy0KIC4uLi9zZWxmdGVzdHMvcmlzY3YvbWlzYWxpZ25lZC8uZ2l0aWdu
b3JlICAgICB8ICAgMSArCiAuLi4vc2VsZnRlc3RzL3Jpc2N2L21pc2FsaWduZWQvTWFrZWZpbGUg
ICAgICAgfCAgMTIgKwogLi4uL3NlbGZ0ZXN0cy9yaXNjdi9taXNhbGlnbmVkL2NvbW1vbi5TICAg
ICAgIHwgIDMzICsrKwogLi4uL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L21pc2FsaWduZWQvZnB1
LlMgIHwgMTgwICsrKysrKysrKysrKysKIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L21p
c2FsaWduZWQvZ3AuUyB8IDEwMyArKysrKysrCiAuLi4vc2VsZnRlc3RzL3Jpc2N2L21pc2FsaWdu
ZWQvbWlzYWxpZ25lZC5jICAgfCAyNTQgKysrKysrKysrKysrKysrKysrCiA5IGZpbGVzIGNoYW5n
ZWQsIDYyMyBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0
NCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9taXNhbGlnbmVkLy5naXRpZ25vcmUKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9taXNhbGlnbmVk
L01ha2VmaWxlCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlz
Y3YvbWlzYWxpZ25lZC9jb21tb24uUwogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL3Jpc2N2L21pc2FsaWduZWQvZnB1LlMKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9taXNhbGlnbmVkL2dwLlMKIGNyZWF0ZSBtb2RlIDEw
MDY0NCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9taXNhbGlnbmVkL21pc2FsaWduZWQu
YwoKLS0gCjIuNDkuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
