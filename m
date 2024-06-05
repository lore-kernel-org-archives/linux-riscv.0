Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D29FC27C55
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 19:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=foBcWztE3BJ7fuWkjD3ea4HL9f9o/n76lnamRK5ayKE=; b=a5Y9b3lzX76MwQ
	eu4sgtxVkwmuyj2DSzyLqAGHOOuq2rCFu58mGWMlmcX/Xk6rNFPLVAx1IkzOvNsSN4QY6KwHfV1if
	Ka34obOJO91RK995sB59k5SzwsMpT5D8IT8KnYQA1HiZxFMuVpH1HB00zyti3jUOk/qRdoCkX0yIw
	KknpWAeqzTcCTmWl6w4A/2nUYCP05/3o+GemuGHdsi833XH4XV2BFZNuh/nEJe9YrjdzeAGkDkCs1
	Su/KLNvF0qNAPavrP6v0czvSpVGLNO3MwXaHfgaDMkq2AZaRY50BWKu7EYjmo+VVsSY2CAB5FNXkk
	PsUpAu4QtuQiQPpDJhAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEwlt-00000007NGJ-0ZbO;
	Wed, 05 Jun 2024 19:58:09 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEwln-00000007NCO-3KqJ
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 19:58:05 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-70109d34a16so164645b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jun 2024 12:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717617482; x=1718222282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZ/AEFSFwdT9H/GgMZYFdqgb9wNJbl1T6o8nBqHR0q8=;
        b=XxXQ40FeF+DnPk/mhPqBofn0dM5ISXc2wetxLPzKi2bg2zw/mFjVa0YtDKAzom28Pz
         +3zn9Eh2/3ekLvPbaQ8eB2zvJYsNpOa49YrK56jfwv0Balk+lUtsL2oI5xz+y+eIc+av
         +tIZ9IgtTj2cG24QR9xb+3m9gwxoNRPX7Zb8b/dzd/FUk2Wf+olxhrVX+Fkp68ef7doH
         KGFFdJvudHVJYBWoaARxy0acooEdfSFmrohBj3LuL63fTYWsIbNpsGzF2GciZGafUge1
         QJU6mD+m1uCu/RviLRTJOETpue2pBUIggr+p9+81wkGDSBYZYW9tnR+tONW0ebq9P1m0
         Snzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717617482; x=1718222282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZ/AEFSFwdT9H/GgMZYFdqgb9wNJbl1T6o8nBqHR0q8=;
        b=v5D+NQZ4PAuR6nnW6QqqxNRTJH+WvPi4TJHJPGSQ8LbOhYNvWlMqHu2WLM4spgkpZ8
         DgUGGU5j+RaWOZ+KTXEIfWIc6usOGFSAWLu3ftHXRYb68+EIn9r1uFEVbs2k8TuT3Pq4
         evj6MvnhRZGr7w3g/jmw+6mI5DzMp09THJhdzwT6So4Z8tBRu8pmj1gdNGEQ9U0fT5F3
         yLZ8oChxTSU1H7dNJNAn5ywkgjxH4zovXd0jEwGz3Iwq8s8ngIIdPxksk8m0b6h/Nc6H
         yCySqLHfmmRTuIfELM6Crt+tDYQ0qB8IEd2Pk2oMjqJ6yEFvOOVe9RN8zslKDnf5A/Uk
         KuxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsC5PKrqmiCg9Np02oYhN0+asrEkcIxM+HpdlXw+Kpy+0C70hpV/NmLDb859g2PQyb7sorA/QFCF1gU8MO6RzSbiNPm+0AtOwggZO6sLJf
X-Gm-Message-State: AOJu0Yx6/YF23ZD6yTsbLnAPooY5nWUeVW+2Hc2xbvTobZRVGnmJigIC
	7O9oDsVxAacEf+JM0mPkdnn1tGNowdHaIDpDTxg3dM2anE3kl6jv6pNxqwB/cUM=
X-Google-Smtp-Source: AGHT+IG2XaMenN1fYXFjRI1gxwTgHA+I4FeBN59oi5QakFI48hoDIBXjqBc+VBxHZoXQhWiVWMhonQ==
X-Received: by 2002:a05:6a00:3d01:b0:702:5d6c:3c25 with SMTP id d2e1a72fcca58-703e59b05f2mr3831135b3a.18.1717617481647;
        Wed, 05 Jun 2024 12:58:01 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70244900ee9sm8664209b3a.124.2024.06.05.12.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 12:58:01 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v7 3/7] iommu/riscv: Add RISC-V IOMMU PCIe device driver
Date: Wed,  5 Jun 2024 12:57:45 -0700
Message-Id: <d966bf7174647a949cb0556168aba475a4afe5b8.1717612299.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717612298.git.tjeznach@rivosinc.com>
References: <cover.1717612298.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_125803_910504_43FAF3FC 
X-CRM114-Status: GOOD (  21.70  )
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
Y3YvaW9tbXUtcGNpLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5l
Njc1YWNjZWIyOTAKLS0tIC9kZXYvbnVsbAorKysgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11
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
UklTQ1ZfSU9NTVVfUkVHX0NBUEFCSUxJVElFUyk7CisJaW9tbXUtPmZjdGwgPSByaXNjdl9pb21t
dV9yZWFkbChpb21tdSwgUklTQ1ZfSU9NTVVfUkVHX0ZDVEwpOworCisJLyogVGhlIFBDSSBkcml2
ZXIgb25seSB1c2VzIE1TSXMsIG1ha2Ugc3VyZSB0aGUgSU9NTVUgc3VwcG9ydHMgdGhpcyAqLwor
CXN3aXRjaCAoRklFTERfR0VUKFJJU0NWX0lPTU1VX0NBUEFCSUxJVElFU19JR1MsIGlvbW11LT5j
YXBzKSkgeworCWNhc2UgUklTQ1ZfSU9NTVVfQ0FQQUJJTElUSUVTX0lHU19NU0k6CisJY2FzZSBS
SVNDVl9JT01NVV9DQVBBQklMSVRJRVNfSUdTX0JPVEg6CisJCWJyZWFrOworCWRlZmF1bHQ6CisJ
CXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgLUVOT0RFViwKKwkJCQkgICAgICJ1bmFibGUgdG8g
dXNlIG1lc3NhZ2Utc2lnbmFsZWQgaW50ZXJydXB0c1xuIik7CisJfQorCisJLyogQWxsb2NhdGUg
YW5kIGFzc2lnbiBJUlEgdmVjdG9ycyBmb3IgdGhlIHZhcmlvdXMgZXZlbnRzICovCisJcmMgPSBw
Y2lfYWxsb2NfaXJxX3ZlY3RvcnMocGRldiwgMSwgUklTQ1ZfSU9NTVVfSU5UUl9DT1VOVCwKKwkJ
CQkgICBQQ0lfSVJRX01TSVggfCBQQ0lfSVJRX01TSSk7CisJaWYgKHJjIDw9IDApCisJCXJldHVy
biBkZXZfZXJyX3Byb2JlKGRldiwgLUVOT0RFViwKKwkJCQkgICAgICJ1bmFibGUgdG8gYWxsb2Nh
dGUgaXJxIHZlY3RvcnNcbiIpOworCisJaW9tbXUtPmlycXNfY291bnQgPSByYzsKKwlmb3IgKHZl
YyA9IDA7IHZlYyA8IGlvbW11LT5pcnFzX2NvdW50OyB2ZWMrKykKKwkJaW9tbXUtPmlycXNbdmVj
XSA9IG1zaV9nZXRfdmlycShkZXYsIHZlYyk7CisKKwkvKiBFbmFibGUgbWVzc2FnZS1zaWduYWxl
ZCBpbnRlcnJ1cHRzLCBmY3RsLldTSSAqLworCWlmIChpb21tdS0+ZmN0bCAmIFJJU0NWX0lPTU1V
X0ZDVExfV1NJKSB7CisJCWlvbW11LT5mY3RsIF49IFJJU0NWX0lPTU1VX0ZDVExfV1NJOworCQly
aXNjdl9pb21tdV93cml0ZWwoaW9tbXUsIFJJU0NWX0lPTU1VX1JFR19GQ1RMLCBpb21tdS0+ZmN0
bCk7CisJfQorCisJcmV0dXJuIHJpc2N2X2lvbW11X2luaXQoaW9tbXUpOworfQorCitzdGF0aWMg
dm9pZCByaXNjdl9pb21tdV9wY2lfcmVtb3ZlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQoreworCXN0
cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11ID0gZGV2X2dldF9kcnZkYXRhKCZwZGV2LT5k
ZXYpOworCisJcmlzY3ZfaW9tbXVfcmVtb3ZlKGlvbW11KTsKK30KKworc3RhdGljIGNvbnN0IHN0
cnVjdCBwY2lfZGV2aWNlX2lkIHJpc2N2X2lvbW11X3BjaV90YmxbXSA9IHsKKwl7UENJX1ZFTkRP
Ul9JRF9SSVZPUywgUENJX0RFVklDRV9JRF9SSVZPU19JT01NVSwKKwkgUENJX0FOWV9JRCwgUENJ
X0FOWV9JRCwgMCwgMCwgMH0sCisJezAsfQorfTsKKworc3RhdGljIHN0cnVjdCBwY2lfZHJpdmVy
IHJpc2N2X2lvbW11X3BjaV9kcml2ZXIgPSB7CisJLm5hbWUgPSBLQlVJTERfTU9ETkFNRSwKKwku
aWRfdGFibGUgPSByaXNjdl9pb21tdV9wY2lfdGJsLAorCS5wcm9iZSA9IHJpc2N2X2lvbW11X3Bj
aV9wcm9iZSwKKwkucmVtb3ZlID0gcmlzY3ZfaW9tbXVfcGNpX3JlbW92ZSwKKwkuZHJpdmVyID0g
eworCQkuc3VwcHJlc3NfYmluZF9hdHRycyA9IHRydWUsCisJfSwKK307CisKK2J1aWx0aW5fcGNp
X2RyaXZlcihyaXNjdl9pb21tdV9wY2lfZHJpdmVyKTsKLS0gCjIuMzQuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
