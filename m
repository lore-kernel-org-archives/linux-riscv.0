Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC04FC25B7D
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 19:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IOlEHSsDjnJ+2ifr8pOMSNbsKujaZDURkSzY+FWJgGc=; b=z70p9EjQRjhu7N
	ZtshLaLaDxkwbkuI+PCVCRUvo4OqcWUFCxkm4InN+hNSU8lu+Xa4pXxtbzGRMOu2+wG5Id9OawU6s
	jXJLiHr0NChcaWzJHiG9U2yxnIb6R3KyloEUARf7yDhUXzudpju0YHywCPVdU9YYeghDkEuiVpq3O
	BuYpTR+hWSnrx5GG4RFu1Acv2XWSoQQJ0Nm7sgIw/5Seya400X2l+OgeZLLjx5qgRRwlQSiJF+DAa
	LftFzuwXUzZcm2W2TY7J+mvbvzBGozrCEHTxXBsT1JrQ80+lYdFjLxA9ph5tTxd8gfXCBC68aNPH2
	JgxupXMvM9jyGRTqSojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAah8-00000009i6p-0NT4;
	Fri, 24 May 2024 19:35:14 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAah1-00000009i2d-2Zcr
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 19:35:10 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6f8eba8f25eso1072927b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 May 2024 12:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716579306; x=1717184106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgmIcC/shr4A/zWz9MZMwn+W/sUs7tQkcY5o3763qNA=;
        b=Nt8h6aJjxu/l7d4BGqnE0jop8L5I/6cGqhhjLsPwfLaJpayFajHR3IzXEep8BLU15x
         n5U45cNY5X30Za6KQzAJ3gQarSjSJhR2g4ezHvCDJL3wD3hP0YHCy8nktJCNrDuKCcZs
         jf32E9O24TOjtT2wUSIsIyl2N6E+OJP0DYqfFApniV6J1sjBDx3+YT3p9R7kbD06SAFC
         xeUl36/W0pkndYat7XdlmB5C4eI3OiEQCPjXTpjnwjX8FB0Z/cg4CqdPaHjwHLByr4Cg
         sh77J3YATJ/ppKGzcCTu5+PlUMa+KpvC8sR1R+cyMZp66JFteFdZu7l+DHQ0h+BFRJ9W
         cOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716579306; x=1717184106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgmIcC/shr4A/zWz9MZMwn+W/sUs7tQkcY5o3763qNA=;
        b=nDqaBleF4VGbZHNun/9LBJUE5r44zPj4cUSg8KX/AzRqdzbFaKwsAxB+cUs+4hD5qG
         l+gC53c+JtVio5xS8tj245f4fjoS1845q3cT04qOP0kBScdEtYM/8+IKGDaAyJQMFnsG
         CxND3RKOeuy9aU2D9uGVYyWDVA6/pKhY+Z8zvO8VaAYYXiXOqt/9u29jUEDDk2/+O35N
         digdGF9PuaZ8jE84M+cRmavjnPp9AF32jZEHzhoV3t5+RqohFgrxdvKzKfzgIGjppQYU
         +jwr/C8qQRKxkUhrg83mKI6nbOzk9ItvdFdmu/I/MPXtsJpBVW4RA5m/9G+jR+Of/66R
         yZ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUS5d7D13IxJ8vmoA17pwB+bMBDJUtesGQg6chp/GUGR7nwFl9sPBJps6oCsClsJgvw3La1T5dMhlW6KEKavgiB3PLcwFJK+1GRYQf7uMXD
X-Gm-Message-State: AOJu0YyXvhsQi6OAdZ7A6s6MMTBWQAgq4vGQuZg6RUyICjI1+p9T8tv9
	S7JPN0Hwzy5RE0+drjocdtnPGXZp4i3YClemjiEbHboGKZ6jVpgl9Pcu5c5KNyM=
X-Google-Smtp-Source: AGHT+IF21GsaMadtiEFUuQBXbyJAG1NclEtoVzAvGBtLn2Y9KjfH71Ne7ddfD4GRr/vhr8u7ZjvdZQ==
X-Received: by 2002:a05:6a21:191:b0:1af:ac8a:19b1 with SMTP id adf61e73a8af0-1b212f0e98dmr3620037637.50.1716579305770;
        Fri, 24 May 2024 12:35:05 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fd4d878esm1441684b3a.190.2024.05.24.12.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 12:35:04 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v6 3/7] iommu/riscv: Add RISC-V IOMMU PCIe device driver
Date: Fri, 24 May 2024 12:34:43 -0700
Message-Id: <73c0fd157ac0d2d7dedf9c7fbe1a042b2490b6ba.1716578450.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716578450.git.tjeznach@rivosinc.com>
References: <cover.1716578450.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_123507_684131_F1095343 
X-CRM114-Status: GOOD (  21.55  )
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
