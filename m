Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C422C7115D
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 19:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1bLTzO6NbqWtz+mzbNHuCfzyWyeC2MSe+gTnJhDKWhk=; b=hodI3ZECHUdz1u
	w9cu7K0EFGrgS7f7CdeBNV4tz2qIGXJ82vhJHlKevAfoLdwqbCBkt0ERCcDY/XBQOd9l9TAAW/fGi
	3/aJ66Ta5gK1+hNVKd3faZQ6+/ddXE+fgWTrpxAY02OPGnA+ymiOBdXIu0HmsKTLI7+5GCRkSSEP7
	1YImTrnrB0RAGVPNRq4wAOJoMP2sB28WjDLAWU5KnsWHtfk0f9nGYhLUDXFoZsbY2utASAe3O8ANX
	sBA2iquiJID11zhSGvF0FSm5T7mff4To14jye+bVUvDjhALg/YkzabGlqFDwbrv+siKHthsd0Ra91
	Vi+Qe0azVVjaGvXHPKxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKah-0000000E3T9-3sQM;
	Thu, 19 Jun 2025 19:06:27 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKae-0000000E3S6-46BW
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 19:06:26 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-450ddb35583so1502815e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jun 2025 12:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750359982; x=1750964782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=87K2qhoakfF53JeK4rlXR6vDcY1jIkmy+PBKp/HhPUo=;
        b=Y/IINxFY1nfTzzRxjdJ8E5gw9rpRDXvt0NW/+/dw5gzI6PMmuqDwbGcQfg2sZzBbun
         i+W867KrqpuaUDbemxNLd/XxgLUTXqfIMIt1ZP3164YCNHJH1Zhhil/PRCjlrkdyhC8V
         N/ST0q+6ckh2weTVixMB5KwJ4I3aoS3fpU9s0hpN1O5AMx3ZO0MOt8NjWDCeuaLyhaax
         Y6XXwX15E8cu9cT9x5lu33N9CvZJqRzzKhw6atKhgkJQhiJe80CeIj0pXAYtIML8fseN
         K57eDYlgHlGu99eWWdKjL9mXgzc6KnUnqHp6DfkQP8j9XjU6qXnxpkZppxf4S3wCJodR
         9OYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750359982; x=1750964782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=87K2qhoakfF53JeK4rlXR6vDcY1jIkmy+PBKp/HhPUo=;
        b=AZT12DQ3pUR8qudtLZ+u9OHYnjf+rLb21dZW0+p2BaEVH9m5qVxWehs64zCiafaPKZ
         E++E/wh17X2yEjRqk2h6ruPsvU4z9guDHuzEYrZo0G1ZH085rNs5tYMkAGGw5k0rjSr1
         QKHWNCm9QuISBVXOI9kuDMDZabGC1VIysoGSmJwgjE65rifz7pduJgeZrmr7Dz8x8n+Z
         hvMX72JR7uQ22gBwgF/awMA7TOMU0iSWira1EKdSD1ogWgQTX4CPfV1V+tCnrYjupYZr
         tLcx378exTUTMSqboyRzw6p59l+woDRon3bIamlmpiG7WoUeIOdMgXJCQFWad7tqLJCd
         aVAw==
X-Gm-Message-State: AOJu0YwtBCMl/KkihOsfrqR0WN6qwXlQCWESfaeBAT/v4mezrd8w9IyW
	SsYgkqn5+obvlSnsKqEQHT3ezOvL6EHaUcPthwfNVtPE1tw5nVvZQL5WAwwlUYhkgQcNTcai9+Z
	K7CSTEUE=
X-Gm-Gg: ASbGncuTJbMcfehKwXd+Nkz6hCKTppwF37rqErUbyYTS4ogKYvBLf/SUzsJeK6HYDxG
	OwizxzX6pvk6nOo0IjaH4IOwTIQVV7X/LPlP8y5sP2iGd/BqMklcQU8eHt12lSQ8o73dKSt9wtr
	k7YNodeHDgj3SJg9YHeGd3RyuQXvQmqzui/8NNjOUvLOFzQ8Q2qYh/R6kC1N0vtK7vxuL1VIouz
	h8d+eQ2S8eDuc66nd3/X/rw1EWb+dAa2jWWZKC+30URgTEtzPYCDs/nRrsuP9WfYVS/QQZsB24j
	PVAAiqLpeLWrpa9HKMNxR91iIMRNSI3UWGw2aan0SFvwUOKcwXnCJeEud9afIJoxgNucdA==
X-Google-Smtp-Source: AGHT+IGHS2FEM+/ajUBwZoc7AH6X2nroaxH8eTP36eWWpAAT8UgQk81cLIq1MDgLjM01+RNehsYM2A==
X-Received: by 2002:a05:600c:474f:b0:439:8294:2115 with SMTP id 5b1f17b1804b1-4535efb8ddcmr17391955e9.8.1750359982305;
        Thu, 19 Jun 2025 12:06:22 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:5b14:46b0:5c7a:61f6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb672sm2967765e9.6.2025.06.19.12.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 12:06:21 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v2 0/2] RISC-V: turn sbi_ecall into a variadic macro
Date: Thu, 19 Jun 2025 21:03:12 +0200
Message-ID: <20250619190315.2603194-1-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_120625_028314_09FF5952 
X-CRM114-Status: GOOD (  12.48  )
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

djIgaGFzIGEgY29tcGxldGVseSByZXdyaXR0ZW4gWzEvMl0sIGFuZCBmaXhlcyBzb21lIG1pc3Nl
ZCB0cmFpbGluZwp6ZXJvZXMgaW4gWzIvMl0uICBUaGUgZml4ZXMgaW4gWzIvMl0gYXJlIGltcG9y
dGFudCBmb3IgdjIsIGJlY2F1c2UKc2JpX2VjYWxsIGRvZXNuJ3QgZmlsbCB0aGUgcmVnaXN0ZXJz
IHdpdGggemVyb2VzIGFueW1vcmUuCgpJbiB0aGUgZnV0dXJlLCBJIHRoaW5rIGl0IHdvdWxkIGJl
IG5pY2UgdG8gaGF2ZSBhIHdyYXBwZXIgZnVuY3Rpb24gZm9yCmVhY2ggc2JpX2VjYWxsLCB0byBt
YWtlIHRoZSBjb2RlIGxlc3MgZXJyb3ItcHJvbmUuCgpHQ0MgaXNuJ3QgZG9pbmcgYSBnb29kIGpv
YiB3aXRoIHNiaV9lY2FsbC4gIHYyIGlzIGEgYml0IGJldHRlciB0aGFuIHYxLApiZWNhdXNlIHNv
bWUgZWNhbGwgcmVnaXN0ZXJzIGFyZSBub3QgdXNlZCBpbiB0aGUgYXNzZW1ibHksIGJ1dCBub3do
ZXJlCm5lYXIgZ29vZCBlbm91Z2guLi4KVGhlIGNvbXBpbGVyIGRvZXNuJ3QgY29uc2lkZXIgc3Rh
dGljIGtleSdkIHRyYWNlcG9pbnQgYnJhbmNoZXMgdG8gYmUKc3BlY2lhbCwgYW5kIHByZXBhcmVz
IGZvciB0cmFjZSBmdW5jdGlvbiBjYWxscyBvdXRzaWRlIG9mIHRoZSB1bmxpa2VseQpwYXRoLiAg
SW5zdGVhZCBvZiBhIHNpbmdsZSAibm9wIiBmb3IgYSB0cmFjZXBvaW50LCB0aGUgbm9uLXRyYWNl
IHBhdGgKYWxzbyBkb2VzIGEgbG90IG9mIHBvaW50bGVzcyByZWdpc3RlciBzYXZlL3Jlc3RvcmUu
CkknbSBsb29raW5nIGZvciBoZWxwIHdpdGggdGhpcyBpc3N1ZSBpbiBbMy8yXS4KCnYyOgogKiB1
c2UgbGludXgvYXJncy5oIFtUaG9tYXNdIFsxLzJdCiAqIGNvbXBsZXRlbHkgcmV3cml0ZSBbMS8y
XQogKiByZW1vdmUgX19zYmlfZWNhbGwgWzEvMl0KICogYWRkIHNvbWUgbWlzc2VkIHRyYWlsaW5n
IDAgaW4gcG11IFtEYXZpZF0gWzIvMl0KICogYWRhcHQgdG8gdGhlIG5ldyBzYmlfZWNhbGwgdGhh
dCBkb2Vzbid0IGFsbG93IGEgc2luZ2xlIGFyZ3VtZW50IFsyLzJdCgp2MTogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNTA2MTIxNDU3NTQuMjEyNjE0Ny0yLXJrcmNtYXJA
dmVudGFuYW1pY3JvLmNvbS9ULyNtMWQ0NDFhYjNkZTNlNmQ2YjNiOGQxMjBiOTIzZjJlMjA4MTkx
OGE5OAoKUmFkaW0gS3LEjW3DocWZICgzKToKICBSSVNDLVY6IHNiaTogdHVybiBzYmlfZWNhbGwg
aW50byB2YXJpYWRpYyBtYWNybwogIFJJU0MtVjogbWFrZSB1c2Ugb2YgdmFyaWFkaWMgc2JpX2Vj
YWxsCiAgUklTQy1WOiBzYmk6IHJlbW92ZSBzYmlfZWNhbGwgdHJhY2Vwb2ludHMKCiBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2t2bV9uYWNsLmggfCAgNCArLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc2JpLmggICAgICB8IDU1ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tCiBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3RyYWNlLmggICAgfCAzNiAtLS0tLS0tLS0tLS0tLS0tLS0tCiBhcmNo
L3Jpc2N2L2tlcm5lbC9jcHVfb3BzX3NiaS5jICAgfCAgNiArKy0tCiBhcmNoL3Jpc2N2L2tlcm5l
bC9wYXJhdmlydC5jICAgICAgfCAgMiArLQogYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgICAgICAg
ICAgIHwgNTcgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQogYXJjaC9yaXNjdi9rZXJu
ZWwvc2JpX2VjYWxsLmMgICAgIHwgMzQgKy0tLS0tLS0tLS0tLS0tLS0tCiBhcmNoL3Jpc2N2L2tl
cm5lbC9zdXNwZW5kLmMgICAgICAgfCAgNCArLS0KIGFyY2gvcmlzY3Yva3ZtL25hY2wuYyAgICAg
ICAgICAgICB8ICA3ICsrLS0KIGRyaXZlcnMvYWNwaS9yaXNjdi9jcHBjLmMgICAgICAgICB8ICA0
ICstLQogZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyAgICAgIHwgNDkgKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0KIDExIGZpbGVzIGNoYW5nZWQsIDExNSBpbnNlcnRpb25zKCspLCAxNDMg
ZGVsZXRpb25zKC0pCgotLSAKMi40OS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
