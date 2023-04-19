Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62132C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 11:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g2dl8YKwARtou7+f8LA35eC7B46U+bBXFS1u01D/PsU=; b=b+hnjqGfbTOUXQ
	StZfCu+1rXPMoKfnvPuRgLibF99QU2zZSgkUYTWWQFBrYUBBS/KQjRrH1eithUx5/8IRvgXn9mj1i
	W4zGTttGpzUO7kZquH9W3/Q8eqmCXyDOwTDngl3DDM+l87YYqn5KfoFkt6NpgSiN9yRshe+VDGJkk
	23AqTLkQzLxxeGyPdArpQ6/39IcCRXicB1tu/LqPoMSp0b5p5aDfaI0AuD3YZ5gH9QARolNlZtv6B
	9DcEEjykxcs3cc+SCL14LXssIKmf1btKvWqsYSs0StFv3KSObBVhRbOUriCB1wQ3idk8+4CK5JrUU
	AOoB/ohmRS5XpHl9nZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5hY-00585c-09;
	Wed, 19 Apr 2023 11:10:16 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5hT-005847-2S
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 11:10:14 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-247048f86c7so1754625a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 04:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681902609; x=1684494609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOmhE21FgoLvBz4/9K8B1nYj/1N6YhDVDpnvXhhmMHI=;
        b=MCc3RKujUUOi8hHvnbPZFeUjt8Qd74fXOJWfbDL8OnevMgMRtLCwWwwiC8fo+YtseC
         Z5CdLbzGTCTc4FrEZwKeoFosFYCULmjriRg7z6nNiNBZZHcqQYlcVxtc/8J/iXL6FnGM
         Ak1bog8/XCv67o576rPkqx6VVqQB2wiWJUaX4SuFrHLX9Y0r9Nriqgke9p5gwyKw4+mb
         6ggfeHji4wYa2rfl88PSkZkxOMDnEFJ8zEx21rVh0Pi1oTVIcQlQYajwFvO958MKvKTP
         oex460ebviHF9yAeC9yopjk8xV4Lw4HLQclBLRYFseX4PFAQ3a+cloav1If/fEXDS+8S
         AqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681902609; x=1684494609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qOmhE21FgoLvBz4/9K8B1nYj/1N6YhDVDpnvXhhmMHI=;
        b=J+vKvMKmD+/GC79U/EOpxMq2sb/haODyBIPU6xpkucVyPjtPVrk/7g3YTbOyF58gR3
         we5SwY3y70r2jUutccArdjXvsrpFkaJ6gXBESwLf8hLKg7DSSc60Ri+7Es+xKT5PJD6V
         8nM2yYipGIvrOGYxVCkJxxlmIIBsN6tUgD4gC1b3J+BDoNkqYuWFDn00k8dX69GSGl/3
         nKw+Tg0Y97GMDVQbEiWI5c1WtSvXPENiiizwMQ/I9uDlAwvtOGNLPHf26kgvgHkGle+Q
         1ZJ84bp893lRdGVnrEadmEa5JaqiDCso3y0LhdMw3Weo2zc1VZjxgPv4J/xYH/Vol9Gm
         yTNw==
X-Gm-Message-State: AAQBX9dBcn+q3Hq3cIOYQN7+sP6FU56RTtRsfmRJ+Yh3euarHxB6PJ0t
	UiNCpVR3RVIENmAezKR3hTB4ZrMA5dz/FolvqqA=
X-Google-Smtp-Source: AKy350aog1v27ScFai211i+05TpdB/RC9uovpGnFFaweBZPoBKDGxR8qKvX3uA8bKz6iyCPjFywS4Q==
X-Received: by 2002:a17:90b:3901:b0:247:193b:ce84 with SMTP id ob1-20020a17090b390100b00247193bce84mr2501295pjb.15.1681902609085;
        Wed, 19 Apr 2023 04:10:09 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1800:f680:eaf2:1d7a:7338:16cb])
        by smtp.gmail.com with ESMTPSA id g12-20020a1709026b4c00b001a24cded097sm11180774plt.236.2023.04.19.04.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 04:10:08 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	=?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Peter Newman <peternewman@google.com>,
	x86@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	James Morse <james.morse@arm.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH 01/21] RISC-V: Detect the Ssqosid extension
Date: Wed, 19 Apr 2023 04:10:51 -0700
Message-Id: <20230419111111.477118-2-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419111111.477118-1-dfustini@baylibre.com>
References: <20230419111111.477118-1-dfustini@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_041011_801357_3FEA760D 
X-CRM114-Status: GOOD (  13.95  )
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

U3Nxb3NpZCBpcyB0aGUgU3VwZXJ2aXNvciBRb1MgSUQgZXh0ZW5zaW9uIGRlZmluZWQgaW4gdGhl
IFJJU0MtViBDQlFSSQooQ2FwYWNpdHkgYW5kIEJhbmR3aWR0aCBRb1MgUmVnaXN0ZXIgSW50ZXJm
YWNlKSBzcGVjaWZpY2F0aW9uLgoKTGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1p
c2EvcmlzY3YtY2JxcmkvYmxvYi9tYWluL3Jpc2N2LWNicXJpLnBkZgpTaWduZWQtb2ZmLWJ5OiBL
b3JuZWwgRHVsxJliYSA8bWluZGFsQHNlbWloYWxmLmNvbT4KW2RmdXN0aW5pOiByZWJhc2UgZnJv
bSB2Ni4wIHRvIHY2LjNdClNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZGZ1c3RpbmlAYmF5
bGlicmUuY29tPgotLS0KTm90ZToKLSBBIHZlcnNpb24gb2YgdGhpcyBwYXRjaCByZWJhc2VkIG9u
IHJpc2N2L2Zvci1uZXh0IHdhcyBhbHJlYWR5CiAgc3VibWl0dGVkIGFzIGFuIFJGQyB0byBsaW51
eC1yaXNjdiBbMV0gd2l0aCBNZXNzYWdlLUlEOgogICAgMjAyMzA0MTAwNDM2NDYuMzEzODQ0Ni0x
LWRmdXN0aW5pQGJheWxpYnJlLmNvbQotIFRoaXMgcGF0Y2ggaXMgaW5jbHVkZWQgaW4gdGhpcyBS
RkMgc2VyaWVzIHNvIGFzIHRvIHByb3ZpZGUgYSBjb2hlc2l2ZQogIGRlbW9uc3RyYXRpb24gaW4g
b25lIHNlcmllcy4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjMwNDEwMDQz
NjQ2LjMxMzg0NDYtMS1kZnVzdGluaUBiYXlsaWJyZS5jb20vCgogYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9od2NhcC5oIHwgMiArKwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMgICAgICAgIHwgMSAr
CiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAxICsKIDMgZmlsZXMgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2Nh
cC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCmluZGV4IGUzMDIxYjI1OTBkZS4u
MjU1YzVjNGQwYTI0IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgK
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCkBAIC00Miw2ICs0Miw4IEBACiAj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkJCCQkzMAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pJQ0JP
TQkJMzEKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRQkzMgorI2RlZmluZSBSSVND
Vl9JU0FfRVhUX1NTUU9TSUQJCTM1CisKIAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX01BWAkJNjQK
ICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9OQU1FX0xFTl9NQVgJMzIKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL2NwdS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKaW5kZXggODQwMGYw
Y2M5NzA0Li5kMTQ0MTg3MmYxNzMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdS5j
CisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdS5jCkBAIC0xODksNiArMTg5LDcgQEAgc3RhdGlj
IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgaXNhX2V4dF9hcnJbXSA9IHsKIAlfX1JJU0NWX0lT
QV9FWFRfREFUQSh6aWhpbnRwYXVzZSwgUklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRSksCiAJX19S
SVNDVl9JU0FfRVhUX0RBVEEoemJiLCBSSVNDVl9JU0FfRVhUX1pCQiksCiAJX19SSVNDVl9JU0Ff
RVhUX0RBVEEoc3Njb2ZwbWYsIFJJU0NWX0lTQV9FWFRfU1NDT0ZQTUYpLAorCV9fUklTQ1ZfSVNB
X0VYVF9EQVRBKHNzcW9zaWQsIFJJU0NWX0lTQV9FWFRfU1NRT1NJRCksCiAJX19SSVNDVl9JU0Ff
RVhUX0RBVEEoc3N0YywgUklTQ1ZfSVNBX0VYVF9TU1RDKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFU
QShzdmludmFsLCBSSVNDVl9JU0FfRVhUX1NWSU5WQUwpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRB
KHN2cGJtdCwgUklTQ1ZfSVNBX0VYVF9TVlBCTVQpLApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCmluZGV4
IDU5ZDU4ZWUwZjY4ZC4uODAzMTdkMmQzOTc1IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHVmZWF0dXJlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCkBAIC0y
MjIsNiArMjIyLDcgQEAgdm9pZCBfX2luaXQgcmlzY3ZfZmlsbF9od2NhcCh2b2lkKQogCQkJfSBl
bHNlIHsKIAkJCQkvKiBzb3J0ZWQgYWxwaGFiZXRpY2FsbHkgKi8KIAkJCQlTRVRfSVNBX0VYVF9N
QVAoInNzY29mcG1mIiwgUklTQ1ZfSVNBX0VYVF9TU0NPRlBNRik7CisJCQkJU0VUX0lTQV9FWFRf
TUFQKCJzc3Fvc2lkIiwgUklTQ1ZfSVNBX0VYVF9TU1FPU0lEKTsKIAkJCQlTRVRfSVNBX0VYVF9N
QVAoInNzdGMiLCBSSVNDVl9JU0FfRVhUX1NTVEMpOwogCQkJCVNFVF9JU0FfRVhUX01BUCgic3Zp
bnZhbCIsIFJJU0NWX0lTQV9FWFRfU1ZJTlZBTCk7CiAJCQkJU0VUX0lTQV9FWFRfTUFQKCJzdnBi
bXQiLCBSSVNDVl9JU0FfRVhUX1NWUEJNVCk7Ci0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
