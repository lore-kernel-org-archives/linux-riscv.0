Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FE8C25B75
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 18:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IOlEHSsDjnJ+2ifr8pOMSNbsKujaZDURkSzY+FWJgGc=; b=5AsXaCqH1vg1hn
	H5o0Zpcx0GrvCLPkCrKCrC8GjYtU62qBufFbLRAnLBlLmIewmrUQ2wb/auXvT4jbS/7tOqOHVbPlG
	uS0cfU0WKv2L237A8da2dzdgB/E/GRojF/X/HJo77U1B1Y+iWlU6yrHmovEVs1K8eHvwuTm/dOeuf
	FtyD7FWN609sCujj6SbTXliIoS71WnhK2gpE6SwU26KL4hdRquQb5s14ikd00gpHN7l13/8Zpqesr
	athjQVA4gl7q7BoDKNrXGgngX/hDPR/BpV1GiJA/OCgItvMkKKt6SAp72iLI2BtMMiRSoXgrDcGxR
	mehsded1vH2nY5E0O3pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6wi7-0000000Gneo-42lC;
	Tue, 14 May 2024 18:17:11 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6whz-0000000Gnam-2aPv
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 18:17:07 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1ecd3867556so45501955ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 11:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715710622; x=1716315422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgmIcC/shr4A/zWz9MZMwn+W/sUs7tQkcY5o3763qNA=;
        b=KrGolOU0Xx3ZI7BUkbod1ZpwQSjCqZD8vP6ROIZANWo8wf4DkJ/X0t67qPxMmcRmIt
         npbdATDzJE0CgKM1CHwpDf5BU3xDk/p7BfnzcGz0vz4l/Ye76s8xRDAHGNbxxNuipqmV
         ddYDnCcAr+a4gC46RcBNKv8MN3nBrfFt+O9I8uBkVF1owQ2diccA5IBn0d7GyxOdPVog
         1fCuoPMo737/CY2HgE0hgHhtiy0Ozqe52gTUrANDGTWA1eNqOdgscxQANd+IMKzHfRKE
         yBUt3rqG2kCICVLWTTDzr3IIgl5+qlvAo9wXQwhkB281+2Ina5xkWz19gBvcAaRf7m02
         W8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715710622; x=1716315422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgmIcC/shr4A/zWz9MZMwn+W/sUs7tQkcY5o3763qNA=;
        b=DCwMvV7X5zwWAjl/qlcJgnv3sFPUbrClPrcK4zaRd3mdMpCiCgCJNk4tZdqsck3AXz
         upbSy1jHMsHJskfh0x80FbGNwdhCeDRcFAsMYMwFdCo+8cMRk9vcr6eyb4PgAS5hdaMD
         JtDhHRbdx9Fc/H5trMI1WLUxd8N8A4zUymNtP5G7DU1uOy3AdYrfZvNjAZ2OZ8XKRTeL
         r9hAIVbXyXjMU2oDQBRa6fu1G0FKOOvI67mQ85eOHuoDbQob88cB5cP4unBNIQZdQBfO
         Rz9Gf/LQUfPFFukrnv1s1fkmBdL8LNC5cIk5jVkJRdeuYZ8w7eq0AyfKP3xWy9bHyWpx
         6nug==
X-Forwarded-Encrypted: i=1; AJvYcCUVziquQPWreF5QmrEXlGVGxzLJhORPGXHQPH/0FY11wUXaSrVxxCdN0sQsffHdGhM4o+M1iBnIaxty0gOlrezkVK0wGHeqECO1NKnhZNPA
X-Gm-Message-State: AOJu0Ywf/8mNds6B0IS1QM5SW+l93/UPt34D/BDiQ6Z4Q9t53YLF1/lH
	63RO5HVeK2BtAB42/ViooYgMA6LMCNo6p9s1uHFp28IvCw7OZUPz5/GL2Vuw/iM=
X-Google-Smtp-Source: AGHT+IFhpX4t56j2JQla2JooYLaxoSHy2mymfYJNtUfgW6LVrY1mnVzmPiLf9SE1+Xpp4mkUinMPlg==
X-Received: by 2002:a17:902:fc4f:b0:1e8:c962:4f6e with SMTP id d9443c01a7336-1ef43d27f6fmr150703805ad.20.1715710622250;
        Tue, 14 May 2024 11:17:02 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bad6386sm100993625ad.80.2024.05.14.11.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 11:17:01 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v5 3/7] iommu/riscv: Add RISC-V IOMMU PCIe device driver
Date: Tue, 14 May 2024 11:16:15 -0700
Message-Id: <7f6b1a277f9dd793704ddf1fa337ca3e78711942.1715708679.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715708679.git.tjeznach@rivosinc.com>
References: <cover.1715708679.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_111703_680328_22FC96E8 
X-CRM114-Status: GOOD (  22.14  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SW50cm9kdWNlIGRldmljZSBkcml2ZXIgZm9yIFBDSWUgaW1wbGVtZW50YXRpb24Kb2YgUklTQy1W
IElPTU1VIGFyY2hpdGVjdGVkIGhhcmR3YXJlLgoKSU9NTVUgaGFyZHdhcmUgYW5kIHN5c3RlbSBz
dXBwb3J0IGZvciBNU0kgb3IgTVNJLVggaXMKcmVxdWlyZWQgYnkgdGhpcyBpbXBsZW1lbnRhdGlv
bi4KClZlbmRvciBhbmQgZGV2aWNlIGlkZW50aWZpZXJzIHVzZWQgaW4gdGhpcyBwYXRjaAptYXRj
aGVzIFFFTVUgaW1wbGVtZW50YXRpb24gb2YgdGhlIFJJU0MtViBJT01NVSBQQ0llCmRldmljZSwg
ZnJvbSBSaXZvcyBWSUQgKDB4MWVmZCkgcmFuZ2UgYWxsb2NhdGVkIGJ5IHRoZSBQQ0ktU0lHLgoK
TUFJTlRBSU5FUlMgfCBhZGRlZCBpb21tdS1wY2kuYyBhbHJlYWR5IGNvdmVyZWQgYnkgbWF0Y2hp
bmcgcGF0dGVybi4KCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3FlbXUtZGV2ZWwvMjAy
NDAzMDcxNjAzMTkuNjc1MDQ0LTEtZGJhcmJvemFAdmVudGFuYW1pY3JvLmNvbS8KQ28tZGV2ZWxv
cGVkLWJ5OiBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPgpTaWduZWQtb2ZmLWJ5
OiBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPgpSZXZpZXdlZC1ieTogTHUgQmFv
bHUgPGJhb2x1Lmx1QGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogVG9tYXN6IEplem5h
Y2ggPHRqZXpuYWNoQHJpdm9zaW5jLmNvbT4KLS0tCiBkcml2ZXJzL2lvbW11L3Jpc2N2L0tjb25m
aWcgICAgIHwgICA1ICsrCiBkcml2ZXJzL2lvbW11L3Jpc2N2L01ha2VmaWxlICAgIHwgICAxICsK
IGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtcGNpLmMgfCAxMTkgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMTI1IGluc2VydGlvbnMoKykKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBjaS5jCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9pb21tdS9yaXNjdi9LY29uZmlnIGIvZHJpdmVycy9pb21tdS9yaXNjdi9LY29u
ZmlnCmluZGV4IDVkY2M1YzQ1YWE1MC4uYzA3MTgxNmY1OWE2IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2lvbW11L3Jpc2N2L0tjb25maWcKKysrIGIvZHJpdmVycy9pb21tdS9yaXNjdi9LY29uZmlnCkBA
IC0xMywzICsxMyw4IEBAIGNvbmZpZyBSSVNDVl9JT01NVQogCiAJICBTYXkgWSBoZXJlIGlmIHlv
dXIgU29DIGluY2x1ZGVzIGFuIElPTU1VIGRldmljZSBpbXBsZW1lbnRpbmcKIAkgIHRoZSBSSVND
LVYgSU9NTVUgYXJjaGl0ZWN0dXJlLgorCitjb25maWcgUklTQ1ZfSU9NTVVfUENJCisJZGVmX2Jv
b2wgeSBpZiBSSVNDVl9JT01NVSAmJiBQQ0lfTVNJCisJaGVscAorCSAgU3VwcG9ydCBmb3IgdGhl
IFBDSWUgaW1wbGVtZW50YXRpb24gb2YgUklTQy1WIElPTU1VIGFyY2hpdGVjdHVyZS4KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvTWFrZWZpbGUgYi9kcml2ZXJzL2lvbW11L3Jpc2N2
L01ha2VmaWxlCmluZGV4IGU0YzE4OWRlNThkMy4uZjU0YzllZDE3ZDQxIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2lvbW11L3Jpc2N2L01ha2VmaWxlCisrKyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvTWFr
ZWZpbGUKQEAgLTEsMiArMSwzIEBACiAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
LW9ubHkKIG9iai0kKENPTkZJR19SSVNDVl9JT01NVSkgKz0gaW9tbXUubyBpb21tdS1wbGF0Zm9y
bS5vCitvYmotJChDT05GSUdfUklTQ1ZfSU9NTVVfUENJKSArPSBpb21tdS1wY2kubwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1wY2kuYyBiL2RyaXZlcnMvaW9tbXUvcmlz
Y3YvaW9tbXUtcGNpLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4w
YTYwZTA2OGZkYzkKLS0tIC9kZXYvbnVsbAorKysgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11
LXBjaS5jCkBAIC0wLDAgKzEsMTE5IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5CisKKy8qCisgKiBDb3B5cmlnaHQgwqkgMjAyMi0yMDI0IFJpdm9zIEluYy4KKyAq
IENvcHlyaWdodCDCqSAyMDIzIEZPUlRILUlDUy9DQVJWCisgKgorICogUklTQ1YgSU9NTVUgYXMg
YSBQQ0llIGRldmljZQorICoKKyAqIEF1dGhvcnMKKyAqCVRvbWFzeiBKZXpuYWNoIDx0amV6bmFj
aEByaXZvc2luYy5jb20+CisgKglOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPgor
ICovCisKKyNpbmNsdWRlIDxsaW51eC9jb21waWxlci5oPgorI2luY2x1ZGUgPGxpbnV4L2luaXQu
aD4KKyNpbmNsdWRlIDxsaW51eC9pb21tdS5oPgorI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgor
I2luY2x1ZGUgPGxpbnV4L3BjaS5oPgorCisjaW5jbHVkZSAiaW9tbXUtYml0cy5oIgorI2luY2x1
ZGUgImlvbW11LmgiCisKKy8qIFJpdm9zIEluYy4gYXNzaWduZWQgUENJIFZlbmRvciBhbmQgRGV2
aWNlIElEcyAqLworI2lmbmRlZiBQQ0lfVkVORE9SX0lEX1JJVk9TCisjZGVmaW5lIFBDSV9WRU5E
T1JfSURfUklWT1MgICAgICAgICAgICAgMHgxZWZkCisjZW5kaWYKKworI2lmbmRlZiBQQ0lfREVW
SUNFX0lEX1JJVk9TX0lPTU1VCisjZGVmaW5lIFBDSV9ERVZJQ0VfSURfUklWT1NfSU9NTVUgICAg
ICAgMHhlZGYxCisjZW5kaWYKKworc3RhdGljIGludCByaXNjdl9pb21tdV9wY2lfcHJvYmUoc3Ry
dWN0IHBjaV9kZXYgKnBkZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICplbnQpCit7CisJ
c3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKKwlzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2
aWNlICppb21tdTsKKwlpbnQgcmMsIHZlYzsKKworCXJjID0gcGNpbV9lbmFibGVfZGV2aWNlKHBk
ZXYpOworCWlmIChyYykKKwkJcmV0dXJuIHJjOworCisJaWYgKCEocGNpX3Jlc291cmNlX2ZsYWdz
KHBkZXYsIDApICYgSU9SRVNPVVJDRV9NRU0pKQorCQlyZXR1cm4gLUVOT0RFVjsKKworCWlmIChw
Y2lfcmVzb3VyY2VfbGVuKHBkZXYsIDApIDwgUklTQ1ZfSU9NTVVfUkVHX1NJWkUpCisJCXJldHVy
biAtRU5PREVWOworCisJcmMgPSBwY2ltX2lvbWFwX3JlZ2lvbnMocGRldiwgQklUKDApLCBwY2lf
bmFtZShwZGV2KSk7CisJaWYgKHJjKQorCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJjLCAi
cGNpbV9pb21hcF9yZWdpb25zIGZhaWxlZFxuIik7CisKKwlpb21tdSA9IGRldm1fa3phbGxvYyhk
ZXYsIHNpemVvZigqaW9tbXUpLCBHRlBfS0VSTkVMKTsKKwlpZiAoIWlvbW11KQorCQlyZXR1cm4g
LUVOT01FTTsKKworCWlvbW11LT5kZXYgPSBkZXY7CisJaW9tbXUtPnJlZyA9IHBjaW1faW9tYXBf
dGFibGUocGRldilbMF07CisKKwlwY2lfc2V0X21hc3RlcihwZGV2KTsKKwlkZXZfc2V0X2RydmRh
dGEoZGV2LCBpb21tdSk7CisKKwkvKiBDaGVjayBkZXZpY2UgcmVwb3J0ZWQgY2FwYWJpbGl0aWVz
IC8gZmVhdHVyZXMuICovCisJaW9tbXUtPmNhcHMgPSByaXNjdl9pb21tdV9yZWFkcShpb21tdSwg
UklTQ1ZfSU9NTVVfUkVHX0NBUCk7CisJaW9tbXUtPmZjdGwgPSByaXNjdl9pb21tdV9yZWFkbChp
b21tdSwgUklTQ1ZfSU9NTVVfUkVHX0ZDVEwpOworCisJLyogVGhlIFBDSSBkcml2ZXIgb25seSB1
c2VzIE1TSXMsIG1ha2Ugc3VyZSB0aGUgSU9NTVUgc3VwcG9ydHMgdGhpcyAqLworCXN3aXRjaCAo
RklFTERfR0VUKFJJU0NWX0lPTU1VX0NBUF9JR1MsIGlvbW11LT5jYXBzKSkgeworCWNhc2UgUklT
Q1ZfSU9NTVVfQ0FQX0lHU19NU0k6CisJY2FzZSBSSVNDVl9JT01NVV9DQVBfSUdTX0JPVEg6CisJ
CWJyZWFrOworCWRlZmF1bHQ6CisJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgLUVOT0RFViwK
KwkJCQkgICAgICJ1bmFibGUgdG8gdXNlIG1lc3NhZ2Utc2lnbmFsZWQgaW50ZXJydXB0c1xuIik7
CisJfQorCisJLyogQWxsb2NhdGUgYW5kIGFzc2lnbiBJUlEgdmVjdG9ycyBmb3IgdGhlIHZhcmlv
dXMgZXZlbnRzICovCisJcmMgPSBwY2lfYWxsb2NfaXJxX3ZlY3RvcnMocGRldiwgMSwgUklTQ1Zf
SU9NTVVfSU5UUl9DT1VOVCwKKwkJCQkgICBQQ0lfSVJRX01TSVggfCBQQ0lfSVJRX01TSSk7CisJ
aWYgKHJjIDw9IDApCisJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgLUVOT0RFViwKKwkJCQkg
ICAgICJ1bmFibGUgdG8gYWxsb2NhdGUgaXJxIHZlY3RvcnNcbiIpOworCisJaW9tbXUtPmlycXNf
Y291bnQgPSByYzsKKwlmb3IgKHZlYyA9IDA7IHZlYyA8IGlvbW11LT5pcnFzX2NvdW50OyB2ZWMr
KykKKwkJaW9tbXUtPmlycXNbdmVjXSA9IG1zaV9nZXRfdmlycShkZXYsIHZlYyk7CisKKwkvKiBF
bmFibGUgbWVzc2FnZS1zaWduYWxlZCBpbnRlcnJ1cHRzLCBmY3RsLldTSSAqLworCWlmIChpb21t
dS0+ZmN0bCAmIFJJU0NWX0lPTU1VX0ZDVExfV1NJKSB7CisJCWlvbW11LT5mY3RsIF49IFJJU0NW
X0lPTU1VX0ZDVExfV1NJOworCQlyaXNjdl9pb21tdV93cml0ZWwoaW9tbXUsIFJJU0NWX0lPTU1V
X1JFR19GQ1RMLCBpb21tdS0+ZmN0bCk7CisJfQorCisJcmV0dXJuIHJpc2N2X2lvbW11X2luaXQo
aW9tbXUpOworfQorCitzdGF0aWMgdm9pZCByaXNjdl9pb21tdV9wY2lfcmVtb3ZlKHN0cnVjdCBw
Y2lfZGV2ICpwZGV2KQoreworCXN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11ID0gZGV2
X2dldF9kcnZkYXRhKCZwZGV2LT5kZXYpOworCisJcmlzY3ZfaW9tbXVfcmVtb3ZlKGlvbW11KTsK
K30KKworc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIHJpc2N2X2lvbW11X3BjaV90
YmxbXSA9IHsKKwl7UENJX1ZFTkRPUl9JRF9SSVZPUywgUENJX0RFVklDRV9JRF9SSVZPU19JT01N
VSwKKwkgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgMH0sCisJezAsfQorfTsKKworc3Rh
dGljIHN0cnVjdCBwY2lfZHJpdmVyIHJpc2N2X2lvbW11X3BjaV9kcml2ZXIgPSB7CisJLm5hbWUg
PSBLQlVJTERfTU9ETkFNRSwKKwkuaWRfdGFibGUgPSByaXNjdl9pb21tdV9wY2lfdGJsLAorCS5w
cm9iZSA9IHJpc2N2X2lvbW11X3BjaV9wcm9iZSwKKwkucmVtb3ZlID0gcmlzY3ZfaW9tbXVfcGNp
X3JlbW92ZSwKKwkuZHJpdmVyID0geworCQkuc3VwcHJlc3NfYmluZF9hdHRycyA9IHRydWUsCisJ
fSwKK307CisKK2J1aWx0aW5fcGNpX2RyaXZlcihyaXNjdl9pb21tdV9wY2lfZHJpdmVyKTsKLS0g
CjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
