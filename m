Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595B8C71136
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=txutDn4/d37CqNyAsPUKyrS2ThiCKdeZ+zsqBg6Mz60=; b=0n27zBIrzG/pAB
	MWk7bt/UkuMQ6GrmscVj4b8CrsdFbXdfaS/aZMrsOlvngD+ZglzfPIqXfdq3BQmfP5H8mMQ1BfaxW
	XvuljYfndokXk0ZiqbllHxc+NzOmWop/cQuyUtgqM3K46nQoZRjZsnjN8qp3I/fvla3sQsgpmtF5A
	nOeNw/w6bUK/moBVj77xceu0RssioYVcZzcYH9iBzpftKw8DRMLF5tZXKt6fxHk9iKZVcdA//hmHc
	otSkxCDLaRyhfCuviC3uffTPuFB3Y9UdvF6ql9weMLf29LMNI32UF64WN27UBKRcTgtFNW75H4p1m
	xIqoeIxp43NZg8569Mag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnq1-0000000EIER-0Pjy;
	Thu, 12 Jun 2025 19:43:49 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjPY-0000000DiOw-3qM4
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 15:00:14 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-450828af36aso457555e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 08:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749740410; x=1750345210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ibZsfu61G+oZ3OcZnknsMkAY7GOU8y9qTpgpoBVVb8g=;
        b=FuLveR9zMWZLdwJraYiFrwiskO6JnwxI89hbRmT3o6OlZnUPredow4aCJumPIkZ2rC
         D2xS4F0AOZKo4m8/gJzJ6oiaNVZECQh/LGBEyaXtPy4TzWSQWxeOi6wYyJ8VtrUIVNXT
         ZdcbqJJCuQ3f0gRn8WeK2AvQMG6gt6pgxyLajQIR7GR0a1H+ZIojaEPjaBWTSHAn5MN4
         +WQcqLTHxd3jicqsIniLSq3238KWZsm4SDgp7XhSK3aPZVE9N6+9kPYLI/ua+P0sGBdu
         xlOFbOWicJ2jnsEDMR097UChELpjY762sBMNX/L/USBQaDIngRqMkO5/v19wybZhMLTJ
         yuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749740410; x=1750345210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibZsfu61G+oZ3OcZnknsMkAY7GOU8y9qTpgpoBVVb8g=;
        b=fc25Q9fCClqe8Z5072iWTgLhVXNZckocnGpZ5zrFLyb6xpPpUeiRvZH6J1JNm5LqGm
         TBQqNJTRwHtPnNtDwmbXwnZOqKpYWCQf/TfjpJPvxl6ETAFiTVeVoHPkOG1cT01aVRAl
         XpX1DNikYTafOkDKK+z8UNlgzRul4/6/8INk46Ud0+JHW/Yi1mrHPQui8lVbEUZQlqHM
         RuiyS+KvYPARLB1MvQc5em7UhVo95pVMummYScm/BRH3S5k57sTo2q4we8SbfoSbATw7
         gJp/KFd8A1IgZBBv2FzGOzvzaGUIjjKiInb6bgzFmskTOJJyxMz0a+nACJJM8/29VDWx
         T+Vw==
X-Gm-Message-State: AOJu0YzrlItbNpzFzdcCX0jIgNaAcf2T0Uay0nno12sVJY3tHw/s7MQc
	taqWuHOo1abPn7QKAQagxeNquiEFJN7RUkMSoUd+XxMeBxVqEqA5PKJ7OSu5vdn5sFAWyHzlOaI
	dHCM+
X-Gm-Gg: ASbGncs6lZxRL9eHX9eyb4Jol+7Tu4ldB1sbp6xq7o2shORznx2JwqJaFGRAoVfMawM
	Z/2n7nbcJs4bEHM+kO1CBMNutXOd3gCahVRC9NnNE/jlWr5zufjvw/Q4r0BGUnBN1g/IbiFwDMV
	zjK7oPQNC0/Y62uW9mDaEw0BN27xvkoAeCQd2xdURAzE5r03iEkR/EJX3BOqlt2TsB2vqJbZSvC
	9IiqGkrk2LGvSDSmLG9XHeTMhzfyDc6imwZC4GQIXTYf9JFKNVAwf8J9NfJK4zxywDU9chlbps8
	gLq3AZRVdDmOiWArvfdFGRpLiBqmL8C3Mb7RsaAie97uUmbK+5T0mwGnWZhtFRM9M2nXn+cTVJS
	5SsM+
X-Google-Smtp-Source: AGHT+IHYojXyzsnTuhUqtfCyOthtbjJaQgHpUcmPKRrwJXGKkrjC5qwisSFgGuYVFXTmo+5uBFTdgA==
X-Received: by 2002:a05:6000:2c10:b0:3a4:def8:1465 with SMTP id ffacd0b85a97d-3a5588078e8mr2489717f8f.9.1749740409326;
        Thu, 12 Jun 2025 08:00:09 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:e05f:7af3:1bf9:f101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a56199b337sm2228683f8f.37.2025.06.12.08.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:00:09 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/2] RISC-V: turn sbi_ecall into a variadic macro
Date: Thu, 12 Jun 2025 16:57:53 +0200
Message-ID: <20250612145754.2126147-2-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_080012_958662_5FF0E17E 
X-CRM114-Status: UNSURE (   8.70  )
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

UGFkZGluZyB0aGUgZWNhbGxzIHdpdGggemVyb3MgaXMgbm90IGdyZWF0IGZvciByZWFzb25zIGlu
IFsxLzJdLgpJIGNvdWxkIGFsc28gcmVkbyB0aGUgY29kZSB0byB1c2Ugc2JpX2VjYWxsMX5zYmlf
ZWNhbGw4LCBhbmQgZHJvcApzYmlfZWNhbGwgaWYgeW91IHRoaW5rIHRoYXQgdmFyaWFkaWMgbWFj
cm9zIGFyZSB0b28gZXZpbC4KWzIvMl0gcHV0cyB0aGUgbmV3IG1hY3JvIHRoYXQgaW50byB1c2Us
IGFuZCBJIGhvcGVmdWxseSBoYXZlbid0IGRlbGV0ZWQKYW55IGludGVudGlvbmFsIHRyYWlsaW5n
IDAuCgpGb3IgYSByZWxhdGVkIGlzc3VlLCBJIGhvcGVkIHRoYXQgdGhlIHRyYWNlcG9pbnRzIGlu
IF9fc2JpX2VjYWxsIHdvdWxkCm9ubHkgYWRkIGEgbm9wIG9yIHR3bywgYmVjYXVzZSBfX3NiaV9l
Y2FsbCB3aXRob3V0IHRyYWNlcG9pbnRzIGxvb2tzCmxpa2UgdGhpczoKICAgMHhmZmZmZmZmZjgw
MDIzYWQwIDwrMD46CWFkZGkJc3Asc3AsLTMyCiAgIDB4ZmZmZmZmZmY4MDAyM2FkMiA8KzI+Oglz
ZAlzMCwxNihzcCkKICAgMHhmZmZmZmZmZjgwMDIzYWQ0IDwrND46CXNkCXJhLDI0KHNwKQogICAw
eGZmZmZmZmZmODAwMjNhZDYgPCs2PjoJYWRkaQlzMCxzcCwzMgogICAweGZmZmZmZmZmODAwMjNh
ZDggPCs4PjoJZWNhbGwKICAgMHhmZmZmZmZmZjgwMDIzYWRjIDwrMTI+OglsZAlyYSwyNChzcCkK
ICAgMHhmZmZmZmZmZjgwMDIzYWRlIDwrMTQ+OglsZAlzMCwxNihzcCkKICAgMHhmZmZmZmZmZjgw
MDIzYWUwIDwrMTY+OglhZGRpCXNwLHNwLDMyCiAgIDB4ZmZmZmZmZmY4MDAyM2FlMiA8KzE4PjoJ
cmV0CgpNYXliZSBJIGFtIG1pc3Npbmcgc29tZSBrZXJuZWwgY29uZmlnLCBiZWNhdXNlIF9fc2Jp
X2VjYWxsIGN1cnJlbnRseQpsb29rcyBsaWtlIHRoaXM6CiAgIDB4ZmZmZmZmZmY4MDAyM2U1OCA8
KzA+OglhZGRpCXNwLHNwLC0xMTIKICAgMHhmZmZmZmZmZjgwMDIzZTVhIDwrMj46CXNkCXMwLDk2
KHNwKQogICAweGZmZmZmZmZmODAwMjNlNWMgPCs0PjoJc2QJczEsODgoc3ApCiAgIDB4ZmZmZmZm
ZmY4MDAyM2U1ZSA8KzY+OglzZAlzMyw3MihzcCkKICAgMHhmZmZmZmZmZjgwMDIzZTYwIDwrOD46
CXNkCXM0LDY0KHNwKQogICAweGZmZmZmZmZmODAwMjNlNjIgPCsxMD46CXNkCXM1LDU2KHNwKQog
ICAweGZmZmZmZmZmODAwMjNlNjQgPCsxMj46CXNkCXM2LDQ4KHNwKQogICAweGZmZmZmZmZmODAw
MjNlNjYgPCsxND46CXNkCXM3LDQwKHNwKQogICAweGZmZmZmZmZmODAwMjNlNjggPCsxNj46CXNk
CXM4LDMyKHNwKQogICAweGZmZmZmZmZmODAwMjNlNmEgPCsxOD46CXNkCXM5LDI0KHNwKQogICAw
eGZmZmZmZmZmODAwMjNlNmMgPCsyMD46CXNkCXJhLDEwNChzcCkKICAgMHhmZmZmZmZmZjgwMDIz
ZTZlIDwrMjI+OglzZAlzMiw4MChzcCkKICAgMHhmZmZmZmZmZjgwMDIzZTcwIDwrMjQ+OglhZGRp
CXMwLHNwLDExMgogICAweGZmZmZmZmZmODAwMjNlNzIgPCsyNj46CW12CXM5LGEwCiAgIDB4ZmZm
ZmZmZmY4MDAyM2U3NCA8KzI4PjoJbXYJczgsYTEKICAgMHhmZmZmZmZmZjgwMDIzZTc2IDwrMzA+
OgltdglzNyxhMgogICAweGZmZmZmZmZmODAwMjNlNzggPCszMj46CW12CXM2LGEzCiAgIDB4ZmZm
ZmZmZmY4MDAyM2U3YSA8KzM0PjoJbXYJczUsYTQKICAgMHhmZmZmZmZmZjgwMDIzZTdjIDwrMzY+
OgltdglzNCxhNQogICAweGZmZmZmZmZmODAwMjNlN2UgPCszOD46CW12CXMzLGE2CiAgIDB4ZmZm
ZmZmZmY4MDAyM2U4MCA8KzQwPjoJbXYJczEsYTcKICAgMHhmZmZmZmZmZjgwMDIzZTgyIDwrNDI+
Oglub3AKICAgMHhmZmZmZmZmZjgwMDIzZTg0IDwrNDQ+Oglub3AKICAgMHhmZmZmZmZmZjgwMDIz
ZTg4IDwrNDg+OgltdglhMCxzOQogICAweGZmZmZmZmZmODAwMjNlOGEgPCs1MD46CW12CWExLHM4
CiAgIDB4ZmZmZmZmZmY4MDAyM2U4YyA8KzUyPjoJbXYJYTIsczcKICAgMHhmZmZmZmZmZjgwMDIz
ZThlIDwrNTQ+OgltdglhMyxzNgogICAweGZmZmZmZmZmODAwMjNlOTAgPCs1Nj46CW12CWE0LHM1
CiAgIDB4ZmZmZmZmZmY4MDAyM2U5MiA8KzU4PjoJbXYJYTUsczQKICAgMHhmZmZmZmZmZjgwMDIz
ZTk0IDwrNjA+OgltdglhNixzMwogICAweGZmZmZmZmZmODAwMjNlOTYgPCs2Mj46CW12CWE3LHMx
CiAgIDB4ZmZmZmZmZmY4MDAyM2U5OCA8KzY0PjoJZWNhbGwKICAgMHhmZmZmZmZmZjgwMDIzZTlj
IDwrNjg+OgltdglzMyxhMAogICAweGZmZmZmZmZmODAwMjNlOWUgPCs3MD46CW12CXMyLGExCiAg
IDB4ZmZmZmZmZmY4MDAyM2VhMCA8KzcyPjoJbm9wCiAgIDB4ZmZmZmZmZmY4MDAyM2VhNCA8Kzc2
PjoJbGQJcmEsMTA0KHNwKQogICAweGZmZmZmZmZmODAwMjNlYTYgPCs3OD46CWxkCXMwLDk2KHNw
KQogICAweGZmZmZmZmZmODAwMjNlYTggPCs4MD46CWxkCXMxLDg4KHNwKQogICAweGZmZmZmZmZm
ODAwMjNlYWEgPCs4Mj46CWxkCXM0LDY0KHNwKQogICAweGZmZmZmZmZmODAwMjNlYWMgPCs4ND46
CWxkCXM1LDU2KHNwKQogICAweGZmZmZmZmZmODAwMjNlYWUgPCs4Nj46CWxkCXM2LDQ4KHNwKQog
ICAweGZmZmZmZmZmODAwMjNlYjAgPCs4OD46CWxkCXM3LDQwKHNwKQogICAweGZmZmZmZmZmODAw
MjNlYjIgPCs5MD46CWxkCXM4LDMyKHNwKQogICAweGZmZmZmZmZmODAwMjNlYjQgPCs5Mj46CWxk
CXM5LDI0KHNwKQogICAweGZmZmZmZmZmODAwMjNlYjYgPCs5ND46CW12CWEwLHMzCiAgIDB4ZmZm
ZmZmZmY4MDAyM2ViOCA8Kzk2PjoJbXYJYTEsczIKICAgMHhmZmZmZmZmZjgwMDIzZWJhIDwrOTg+
OglsZAlzMyw3MihzcCkKICAgMHhmZmZmZmZmZjgwMDIzZWJjIDwrMTAwPjoJbGQJczIsODAoc3Ap
CiAgIDB4ZmZmZmZmZmY4MDAyM2ViZSA8KzEwMj46CWFkZGkJc3Asc3AsMTEyCiAgIDB4ZmZmZmZm
ZmY4MDAyM2VjMCA8KzEwND46CXJldAogICAuLi4KICAgW1RoZSBhY3R1YWwgdHJhY2Vwb2ludCBo
YW5kbGluZyBnb2VzIHVwIHRvICszMjguXQoKUmFkaW0gS3LEjW3DocWZICgyKToKICBSSVNDLVY6
IHNiaTogdHVybiBzYmlfZWNhbGwgaW50byB2YXJpYWRpYyBtYWNybwogIFJJU0MtVjogbWFrZSB1
c2Ugb2YgdmFyaWFkaWMgc2JpX2VjYWxsCgogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fbmFj
bC5oIHwgIDQgKy0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oICAgICAgfCAzNCArKysr
KysrKysrKysrKysrKy0KIGFyY2gvcmlzY3Yva2VybmVsL2NwdV9vcHNfc2JpLmMgICB8ICA2ICsr
LS0KIGFyY2gvcmlzY3Yva2VybmVsL3BhcmF2aXJ0LmMgICAgICB8ICAyICstCiBhcmNoL3Jpc2N2
L2tlcm5lbC9zYmkuYyAgICAgICAgICAgfCA1NyArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9zYmlfZWNhbGwuYyAgICAgfCAgMiArLQogYXJjaC9yaXNj
di9rZXJuZWwvc3VzcGVuZC5jICAgICAgIHwgIDQgKy0tCiBhcmNoL3Jpc2N2L2t2bS9uYWNsLmMg
ICAgICAgICAgICAgfCAgNyArKy0tCiBkcml2ZXJzL2FjcGkvcmlzY3YvY3BwYy5jICAgICAgICAg
fCAgNCArLS0KIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgICAgICB8IDQ4ICsrKysrKysr
KysrKystLS0tLS0tLS0tLS0tCiAxMCBmaWxlcyBjaGFuZ2VkLCA5OCBpbnNlcnRpb25zKCspLCA3
MCBkZWxldGlvbnMoLSkKCi0tIAoyLjQ5LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
