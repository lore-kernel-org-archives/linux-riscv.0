Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A4BCD6E60
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FQRRnJ+RoS2wB6nLOxWvP6DYp/tTlnyMDadM+Ea7meM=; b=umHdLfDoeIb+VM
	L92wOGIOSzPC1bt7jozQVdJ6vX27/LoQldTqNQyx++7UJI/lcHlCYE8wGQwcAB2+d6IUNH09cGaql
	egtfnhacFKebD0sfSSFYyv55yIJFORK/ry1NYT/PQhnaKRNsne+oTuoUY1ipSeXeJ1YqY2ZPhM0Lm
	lVHBs/XYD629iMFtFsDPc4kf/a4HzHh05bT4lXEr+rFvjPxRfG8So+l5n3XIlisuotMT16V8LcAik
	mKTaqL8VuPI4BHjdOY+1iUjENm7y/a2wNSHi1oSwZT1LsBhTG0VK1YRMdlRM/IfBLwUCdyShWoqXm
	+Qz0W7V1rwD+ijzZXGAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyCT-0000000ANVu-2pMD;
	Mon, 01 Jun 2026 08:40:45 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyCN-0000000ANRc-32AB
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:40:43 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-304ddfcf72cso3612692eec.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1780303238; x=1780908038; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ll+oI1aiVo6jQ8q3ONEacIDuvDvctWXx2EoHq5khZvA=;
        b=lMR2atU9SMjGaTsn/CQ0UG6j2/eT1+zHVan81o7+xN70tDF/Dr+DwnxFLX8WjfQ4SP
         nzVB5SJHJxcU0gpr/wG0qp8TkHjADS03weX8bRRQ6dNm8ng0wnZNhw576NupmbSjujw3
         lhJ0Q7ovlDe8Hm/TIvQpJWyGXMjXDuIZeJGKAAkiI9V4WlEfZGTeAJ/ZaxvmsQVrFxao
         VXc3UU83si/wlysfdM/06VHCGtBfTFzMsvCDgZLDGC/U0Na+cuC8umIJWn5OwDbPvuuc
         dorLuh4V6rrLFMOCCkzzCNfyAr8DMTmytx5cbnq+xz+CMVaudBYnptDruAkSdGMNMhQ0
         eajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303238; x=1780908038;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ll+oI1aiVo6jQ8q3ONEacIDuvDvctWXx2EoHq5khZvA=;
        b=OTyi2FXvxgE58gubherlyl27UUNsnSU2Oazfx3oA6iD3HvSpj2UDuKKqFEna5imMDp
         2XnmD2XAYj2U/C9vHJWdwQiZMo7aACdunMNmK/KzoCO1AIkB4YVH0h56XuJ2r1AWd0SO
         9ZqCzWajgwfMCZ7pvOjlFbsVgQ90OGXWSvVjaaBw8lsodx11F/22uRXhs21abPyZhvxC
         tGuiCzyLy8YQdEyLp3JpsffZ30NloKfe1kZ3DhZc1P+3CbV4hGLLBAfXe6l0H03p9lCU
         /9J0rfjZd3n6r7Di0F2F88vacIfVeXLmM4JKOxunjqc004Y86Fjwq8oplbFFOJeQxPg3
         4qXQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fZ14sQswmYCIh3zIzPgxC6GiW7d4BX9xY4fUvruz4nPOeyV42C/l6AnJHJ+63Nio+qHZgZ2u/ud3NgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnDAenMtkWrrv2pS37AhnTDMWnMFRvBStfx34mtciB4tuwytKZ
	EhUqgTbnwvmU9RenBBLoDNrjfiFJu7OOrMSmbQAtq7QI4rW91JjJDsTVmZ6ZnQgA7PE=
X-Gm-Gg: Acq92OGIJolinKKnp2m4s3n4bwHbNfaoO0USbaVfKuh/tMt8NkMdQ4+ajBIfVf7PE5K
	B4L7zGErm9oOe6zLKJDHy/bMYH/yauaxSbcg8ajjiZbx6WmVzORQJCh3quaQ4tCqcdBmu7zZtr6
	x7aVfdbaAgKbXfAIDWxC9uIwAWZmZ6Vz8gFM4nVji0yHE4J+l24DfGR51xF3y1DUF8F1wzAarOd
	gLKfcMFwWLVFvapYqUHiUFCRXr9CE5kBY2ansASydYKcGGIC/tDXei/r9betaClzLtm9n5rUJES
	tacocdMahPoTscXfjiCr/TdueZjqs6PfAzIy8mc9VSO9l70Nz5yXCXIqhmAkJeAOSHjiErDvS2j
	DhzuZe3uqacsH7loqpGUi9C3DV/Nng0rqBINt0uPSjILhYdQUV72mQcO7/2r6DVDJM5Kmptg0tL
	yjl6HTVKmqt5JC7xW5FfJP4tw75LSyEcQDhE6YeHhzc+5KrjA79ydPvE00AVW/IUo0
X-Received: by 2002:a05:7300:e683:b0:304:6139:5a3e with SMTP id 5a478bee46e88-304fa6c856dmr4249256eec.34.1780303238426;
        Mon, 01 Jun 2026 01:40:38 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5b9be7sm8011818eec.27.2026.06.01.01.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:40:37 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v4 0/3] KVM: riscv: Fix stale FWFT feature exposure and
 enhance selftests
Date: Mon, 01 Jun 2026 01:40:33 -0700
Message-Id: <20260601-kvm-get_reg_list-v2-v4-0-c88abc81ebda@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIFFHWoC/32NQQrCMBREryJZG0nTNG1ceQ+REuNP+9W2ktSgl
 N7dpG4URJjNg5k3E/HgEDzZribiIKDHoY8g1itiWt03QPEUmXDGJSu4pJfQ0QbG2kFTX9GPNHB
 qlc2lkpk20pC4vDmw+Fis+8Ob/f14BjMmVWq0cTm453IbeOr9f4hhtFSCacEyUQi982gxwMYMH
 UkXIf+UVL8leZRkJVNS6apQyn5J5nl+AefyIuEOAQAA
X-Change-ID: 20260526-kvm-get_reg_list-v2-f9f36961ac6c
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780303237; l=2947;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=cv2+u2g16bKW6cttSGvgPuxUbJctbV+2nzyrkjnxCq8=;
 b=QEFM2HnqlqG5bHx3IhEROh5SwyPigoKja7/0XOoScGW5b16NGP83UspWRkyDguvyYkMGfrzB3
 3eOybZtDXYOAptXjGu3eEokQHAx1Pp+Uh/tkZj9jg5Zky2T5bwI43kc
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014039_802850_695C25D4 
X-CRM114-Status: UNSURE (   8.44  )
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

VGhpcyBzZXJpZXMgYWRkcmVzc2VzIGEgYnVnIGluIHRoZSBTQkkgRldGVCAoRmlybXdhcmUgRmVh
dHVyZXMpIGV4dGVuc2lvbgp3aGVyZSBmZWF0dXJlcyBjb3VsZCByZW1haW4gZXhwb3NlZCB0byBn
dWVzdHMgYWZ0ZXIgdGhlaXIgZGVwZW5kZW50IElTQQpleHRlbnNpb25zIGFyZSBkaXNhYmxlZCBh
dCBydW50aW1lLCBhbmQgaW1wcm92ZXMgdGhlIHJlbGF0ZWQgc2VsZnRlc3QKaW5mcmFzdHJ1Y3R1
cmUuCgpUaGUgYnVnIChwYXRjaCAxKSBvY2N1cnJlZCBiZWNhdXNlIEZXRlQgZmVhdHVyZSBzdXBw
b3J0IHdhcyBjYWNoZWQgYXQgdkNQVQppbml0aWFsaXphdGlvbiB0aW1lLiBXaGVuIHVzZXJzcGFj
ZSBzdWJzZXF1ZW50bHkgZGlzYWJsZWQgSVNBIGV4dGVuc2lvbnMKdmlhIEtWTSBPTkVfUkVHLCB0
aGUgY2FjaGVkIHN1cHBvcnQgc3RhdHVzIHdhcyBub3QgdXBkYXRlZCwgbGVhZGluZyB0bwpzdGFs
ZSBmZWF0dXJlIGV4cG9zdXJlLgoKVGhlIHNlbGZ0ZXN0IGltcHJvdmVtZW50cyAocGF0Y2hlcyAy
LTMpIGVuaGFuY2UgdGhlIGdldC1yZWctbGlzdCB0ZXN0IGJ5CnJlZmFjdG9yaW5nIHRoZSBleHRl
bnNpb24gc3VibGlzdCBpbmZyYXN0cnVjdHVyZSBhbmQgc3BsaXR0aW5nIEZXRlQKZmVhdHVyZSB0
ZXN0aW5nIGludG8gc2VwYXJhdGUsIHByb3Blcmx5LWdhdGVkIHN1Ymxpc3RzLgoKLS0tCkNoYW5n
ZXMgaW4gdjQ6Ci0gUmVuYW1lIHRoZSB0aXRsZSBvZiBjb3ZlciBsZXR0ZXIKLSBEaXNhYmxlIHBy
ZWVtcHRpb24gd2hlbiBydW5uaW5nIHRyeV90b19zZXRfcG1tKCkgKHNhc2hpa28tYm90KQotIFJl
bW92ZSBjaGVja19zdXBwb3J0ZWRfcmVnKCkgKHNhc2hpa28tYm90KQotIExpbmsgdG8gdjM6IGh0
dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MDUyOC1rdm0tZ2V0X3JlZ19saXN0LXYyLXYzLTAt
MTcwOTY5YTg1OTlmQHNpZml2ZS5jb20KCkNoYW5nZXMgaW4gdjM6Ci0gUmVzdG9yZSAnc3VwcG9y
dGVkJyBmaWVsZCB3aXRoIGluaXQoKSBjYWxsYmFjayBmb3IgaW5pdGlhbGl6YXRpb24gcHJvYmlu
ZwogIChzYXNoaWtvLWJvdCkKLSBBZGQgTlVMTCBjaGVja3MgYmVmb3JlIGNhbGxpbmcgZmVhdHVy
ZS0+c3VwcG9ydGVkKCkgaW4gYWxsIGZ1bmN0aW9ucwotIEZpeCBpc2FfZXh0X2VuYWJsZWQgdHJh
Y2tpbmcgbG9naWMgYW5kIHJlc3RvcmUgaXNhX2V4dF9jYW50X2Rpc2FibGUgYXJyYXkKLSBBZGQg
c2JpX2V4dF9lbmFibGVkIHRyYWNraW5nIGFuZCBlbmhhbmNlIGRlcGVuZGVuY3kgY2hlY2tpbmcg
KHNhc2hpa28tYm90KQotIFJlZmluZSBjb2RlIG9yZ2FuaXphdGlvbiBhbmQgdmFyaWFibGUgbmFt
aW5nIGNvbnNpc3RlbmN5IChzYXNoaWtvLWJvdCkKLSBMaW5rIHRvIHYyOiBodHRwczovL3BhdGNo
Lm1zZ2lkLmxpbmsvMjAyNjA1MjYta3ZtLWdldF9yZWdfbGlzdC12Mi12Mi0wLTc5NDBhNDAxNDU0
YUBzaWZpdmUuY29tCgpDaGFuZ2VzIGluIHYyOgotIEZpeCBGV0ZUIHN0YWxlIGZlYXR1cmUgZXhw
b3N1cmUgYnkgcmVtb3Zpbmcgc3RhdGljICdzdXBwb3J0ZWQnIGZpZWxkCi0gUmVmYWN0b3IgZ2V0
LXJlZy1saXN0IHRlc3QgdG8gdXNlIHVuaWZpZWQgZXh0ZW5zaW9uIHN1Ymxpc3QgbWFjcm9zCi0g
U3BsaXQgRldGVCB0ZXN0aW5nIGludG8gcGVyLWZlYXR1cmUgc3VibGlzdHMgd2l0aCBydW50aW1l
IGNoZWNrcwogIChBbmRyZXcpCgpUbzogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4K
VG86IEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUBsaW51eC5kZXY+ClRvOiBQYXVsIFdhbG1zbGV5
IDxwandAa2VybmVsLm9yZz4KVG86IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+
ClRvOiBBbGJlcnQgT3UgPGFvdUBlZWNzLmJlcmtlbGV5LmVkdT4KVG86IEFsZXhhbmRyZSBHaGl0
aSA8YWxleEBnaGl0aS5mcj4KVG86IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNv
bT4KVG86IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+ClRvOiBQYW9sbyBC
b256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgpUbzogU2h1YWggS2hhbiA8c2h1YWhAa2VybmVs
Lm9yZz4KQ2M6IGdyZWVudGltZS5odUBzaWZpdmUuY29tCkNjOiB2aW5jZW50LmNoZW5Ac2lmaXZl
LmNvbQpDYzogem9uZy5saUBzaWZpdmUuY29tCkNjOiBrdm1Admdlci5rZXJuZWwub3JnCkNjOiBr
dm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgta3NlbGZ0
ZXN0QHZnZXIua2VybmVsLm9yZwoKLS0tCllvbmctWHVhbiBXYW5nICgzKToKICAgICAgS1ZNOiBS
SVNDLVY6IFNCSSBGV0ZUOiBGaXggc3RhbGUgZmVhdHVyZSBleHBvc3VyZSBhZnRlciBydW50aW1l
IGV4dGVuc2lvbiBjaGFuZ2VzCiAgICAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogUmVmYWN0b3Ig
SVNBIGFuZCBTQkkgZXh0ZW5zaW9uIHN1Ymxpc3QgbWFjcm9zCiAgICAgIEtWTTogcmlzY3Y6IHNl
bGZ0ZXN0czogU3BsaXQgU0JJIEZXRlQgaW50byBzZXBhcmF0ZSBmZWF0dXJlLXNwZWNpZmljIHN1
Ymxpc3RzCgogYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jICAgICAgICAgICAgICAgICAg
IHwgIDM0ICsrKysrLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWct
bGlzdC5jIHwgMTM4ICsrKysrKysrKysrKysrLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDEx
NiBpbnNlcnRpb25zKCspLCA1NiBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiBjNzgzMjUz
NGE4MTYwMjc2Y2NjYjlhOGNjOGNhZmI1NjE0YzU3OWQwCmNoYW5nZS1pZDogMjAyNjA1MjYta3Zt
LWdldF9yZWdfbGlzdC12Mi1mOWYzNjk2MWFjNmMKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
