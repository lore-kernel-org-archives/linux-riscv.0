Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F51C4828F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 23:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K4gm77tHae5I6IqNkOJhWu7US0vya5IRkwm204XYVAo=; b=mIL/vTjM5PQ+xo
	oiVLxPwJalcLCoH5d0pFUHJSzw8hhQzATX0vvUQSE13N00LqK+9veAWQJ6dQi0uTSOOSEWCfJkLRt
	eO5UuWjGhncbfdcpul53BbR1BybKtTBbAoBnoePECaFHuAeUw1Tfw8k5syNfgKJL6neeDB6upgqYZ
	sbvTOYNY0h5BJVVJEbJWNL/pFu2JYDQDdBVBTby77pCI0PTpSJkST+J7lsBWvs9iqr584f7fMI1Xo
	aLMYBEnHFn82s83Aj72ku2ahb2XCTMgmuQdUVjjvNztPo3q0UvR3MqPbWywSZHfIFkyg0XUaoC7/+
	Ah3NURGm/aXKIIbYbp0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3N6-0000000Dqj3-0J8a;
	Fri, 02 Feb 2024 23:55:00 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3N3-0000000Dqhw-2NnX
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 23:54:58 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5ceb3fe708eso2094935a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 15:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706918094; x=1707522894; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cB2tFVOKVxTeJSZexMtqa/UnSmD6oQiVHBBq312ozek=;
        b=EtjcO8czu1d+5vKu8Kmg5TDD3Z2/mOVSmlvqCQlyT7DeBa0wRJaFof1j/a8WsPtf1N
         2Nl0Zee6OB3oCvG56nOBhOzi+7PwzTCGRWqwt06UuDEG7V3WcqYf/wXASoJjYLvlD+Lt
         2UZ013FVZo1wzF+lju7hSRDq+vpDGZfoKLzqsp64p5kQx38k18m89bN2bOvgfNV5fmzc
         hJK9i1+XKsXH6vSkrtkQpqNqERQVJnmP1zGfY/UQBvsp88KWGwc2iJMWkbNCUqrFY2gy
         AX2eZX8udb9LBdvQ7nGoPd4t3RY5TlQKT7p6f2GUYB55msU0oNlF6t4JXwoH8EbieK1I
         pu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706918094; x=1707522894;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cB2tFVOKVxTeJSZexMtqa/UnSmD6oQiVHBBq312ozek=;
        b=eaar0T32p5LXov/8hjetO9NEM6KiBr7lxR0iuFcgNHHXNl/vGfiPx0ADekB0BnrEnf
         UeSEryk4cL5EQYRCQYtNc4ovm5yE7sJiMzBp0JcgAlnmrsp5HiCm3OeXeBrwldr9z1wd
         bOUYFZOKQgE9TWiP6jUnPtigYDrj6k2Wqcx9oWNjPv7rhxLb4Zao1hnXk5yQkSgjXqNl
         muu22iZFw07MZbSCLbkdakCd/H5KhlZegEq7LPzYbqOpkDL7VBQXcQfMtTN9vPeU7fta
         9EUX63yBf7dV7WYUFy7y+2Jd/EtDX1j51nx84LiyqPD3/AyLkC9GMimsZ2Ls0A83DxHc
         yRpg==
X-Gm-Message-State: AOJu0YyDx8HNnL0LyEomzvVoFgckblln4KswGKfX0K0+5a4GCPuL2HzY
	Ywe9bgRBdjUOkSOfEfK/EVtd+Eri9aDNTdyfsRrwEdJV9XhLQXfJUuaExI6OgkE=
X-Google-Smtp-Source: AGHT+IGLgtA3E1LDzO/LZZVS/RWVQ5xYoH2SpNXNrhjNq/+CgtvwgDQ697+VSVKAlRlVIbFY+Vk/yQ==
X-Received: by 2002:a17:902:c94b:b0:1d9:8e37:56d6 with SMTP id i11-20020a170902c94b00b001d98e3756d6mr24686pla.40.1706918094688;
        Fri, 02 Feb 2024 15:54:54 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU3+EXKr5vkEi7B65f4rJCfn25LtJsju5OTbujLL6Rhwkf+mo7rwdkg1Ls1605PbAxDFmTUgI7ejfFUQmsTgmuMmEFv8nHSXPkKNm3RhsonISnHEDY44ly/WL1z1cU4GNhcVUumBjw60ORNwpyI3uCmmN595/Xsz1x2aUbxM5LGWrI5qJUwDF1hDQkLL+DSZmiWhY+/AkyYsdHtcpdTlkZRmG70LEF4DyHAsbmFl4GR4ITnC6hTkA9niYdVFXdo1kPTekPLKyRpyqu7l8ZjTQ2CJmp9GpMljk457CbyKLoa/3EbUpsP/LC+5TSSXj5PycstgBk67FOFUg==
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id u1-20020a17090282c100b001d8f81ece98sm2133607plz.104.2024.02.02.15.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 15:54:54 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v3 0/2] riscv: Use CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
 to set misaligned access speed
Date: Fri, 02 Feb 2024 15:54:51 -0800
Message-Id: <20240202-disable_misaligned_probe_config-v3-0-c44f91f03bb6@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMuAvWUC/43NywqDMBCF4VeRrJuSi1btqu9RiuQy6oBNJCmhR
 Xz3RjeFrlwN/yy+s5AIASGSa7GQAAkjepdDngpiRuUGoGhzE8FEybjk1GJUeoLume+EgwPbzcF
 r6Ix3PQ6UlVKBknXVt5JkZQ7Q43tfuD9yjxhfPnz2wcS373E7ccpo21heVdAaq5pbwOQjOnM2/
 kk2PokfKdgBUmSyro28NBpsrcUfua7rF4l32skkAQAA
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Eric Biggers <ebiggers@kernel.org>, 
 Elliot Berman <quic_eberman@quicinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706918093; l=1713;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=0xbrQ7dU8s/DO/vYKW8uWrhcAt8ul7TZYujjtbD0uls=;
 b=v0l5aXNQvH2VsUmoq5qlzgcz8zo1xqLL0XudiHNz3LWPiY/mYq5kNEs5OS90//u5rt+ErwxlJ
 uVUSfjHU6nlBta8MlZuIaHGIbcEIYEDq50ZRWcPdyboL3LNnhgiEQBr
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_155457_640035_3CF0ED9E 
X-CRM114-Status: UNSURE (   7.68  )
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

SWYgQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MgaXMgZW5hYmxlZCwgbm8g
dGltZSBuZWVkcyB0bwpiZSBzcGVudCBpbiB0aGUgbWlzYWxpZ25lZCBhY2Nlc3Mgc3BlZWQgcHJv
YmUuIERpc2FibGUgdGhlIHByb2JlIGluIHRoaXMKY2FzZSBhbmQgc2V0IHJlc3BlY3RpdmUgdXNl
cyB0byAiZmFzdCIgbWlzYWxpZ25lZCBhY2Nlc3Nlcy4gT24gcmlzY3YsCnRoaXMgY29uZmlnIGlz
IHNlbGVjdGVkIGlmIFJJU0NWX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTIGlzIHNlbGVjdGVk
LAp3aGljaCBpcyBkZXBlbmRlbnQgb24gTk9OUE9SVEFCTEUuCgpTaWduZWQtb2ZmLWJ5OiBDaGFy
bGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgotLS0KQ2hhbmdlcyBpbiB2MzoKLSBS
ZXZlcnQgY2hhbmdlIHRvIGNzdW0gKEVyaWMpCi0gQ2hhbmdlIGlmbmRlZnMgZm9yIGlmZGVmcyAo
RXJpYykKLSBDaGFuZ2UgY29uZmlnIGluIE1ha2VmaWxlIChFbGxpb3QvRXJpYykKLSBMaW5rIHRv
IHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwMjAxLWRpc2FibGVfbWlzYWxpZ25l
ZF9wcm9iZV9jb25maWctdjItMC03N2MzNjhiZWQ3YjJAcml2b3NpbmMuY29tCgpDaGFuZ2VzIGlu
IHYyOgotIE1vdmUgYXJvdW5kIGRlZmluaXRpb25zIHRvIHJlZHVjZSBpZmRlZnMgKENsw6ltZW50
KQotIE1ha2UgUklTQ1ZfTUlTQUxJR05FRCBkZXBlbmQgb24gIUhBVkVfRUZGSUNJRU5UX1VOQUxJ
R05FRF9BQ0NFU1MKICAoQ2zDqW1lbnQpCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvci8yMDI0MDEzMS1kaXNhYmxlX21pc2FsaWduZWRfcHJvYmVfY29uZmlnLXYxLTAtOThk
MTU1ZTljZGE4QHJpdm9zaW5jLmNvbQoKLS0tCkNoYXJsaWUgSmVua2lucyAoMik6CiAgICAgIHJp
c2N2OiBsaWI6IEludHJvZHVjZSBoYXNfZmFzdF9taXNhbGlnbmVkX2FjY2VzcyBmdW5jdGlvbgog
ICAgICByaXNjdjogRGlzYWJsZSBtaXNhbGlnbmVkIGFjY2VzcyBwcm9iZSB3aGVuIENPTkZJR19I
QVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTCgogYXJjaC9yaXNjdi9LY29uZmlnICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZl
YXR1cmUuaCAgICAgICAgIHwgIDIyICsrLQogYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgICAg
ICAgICAgICAgICAgICB8ICAgMyArCiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgICAg
ICAgICAgICAgIHwgMjU1IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBhcmNoL3Jpc2N2L2tl
cm5lbC9taXNhbGlnbmVkX2FjY2Vzc19zcGVlZC5jIHwgMjY1ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysKIGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgICAgICAgICAgICAgfCAg
IDQgKwogYXJjaC9yaXNjdi9saWIvY3N1bS5jICAgICAgICAgICAgICAgICAgICAgICB8ICAgNyAr
LQogNyBmaWxlcyBjaGFuZ2VkLCAyOTIgaW5zZXJ0aW9ucygrKSwgMjY1IGRlbGV0aW9ucygtKQot
LS0KYmFzZS1jb21taXQ6IDY2MTM0NzZlMjI1ZTA5MGNjOWFhZDQ5YmU3ZmE1MDRlMjkwZGQzM2QK
Y2hhbmdlLWlkOiAyMDI0MDEzMS1kaXNhYmxlX21pc2FsaWduZWRfcHJvYmVfY29uZmlnLTA0M2Fl
YTM3NWY5MwotLSAKLSBDaGFybGllCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
