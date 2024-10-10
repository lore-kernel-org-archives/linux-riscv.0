Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562DED24454
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 20:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z2N6NmnduQ6YqWu7GEcvBM0Z4Jan3jciCZeNvUlehxo=; b=SkeE96YYHgjFQW
	yHqnrCq4wLakh/Kjf4P7kqPqAVXFmi7KVn2EBgOwFyVmeFkxbOAmNs527RyXrmEg0IdgmYfAuGxg+
	4yft+96dnhIrEhFcHXfsiwEQzMTzuwHmpbk8Htr9xFNr9rUaU2kczOItD18UvNcz+pLUEk2JwdVYi
	0zpGDLZNfh8uUj34j/y6RuSpyQB4EHWWtCKh2/31iGOQ9zsKhVB1Dma43i24PvpdAm92nx3b8xyQ6
	4IqNHUQ1ntV2JWU65Oepk42RHkwihBJILGDNuH2VUmacJxRNynsR8z83UDf6KV/ViXtaIIGMQlYWU
	p//PqOW2UPS0MlWGQ+Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syzxf-0000000EINO-1h16;
	Thu, 10 Oct 2024 20:40:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syz9O-0000000EBjB-1HCe
	for linux-riscv@bombadil.infradead.org;
	Thu, 10 Oct 2024 19:48:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vNvjcSMD1XB1l6NOS6ExlEo9cUT+I176k7DgI2zQ1iA=; b=ItXYq51/Gc5Wit3zpqKrz2ra98
	NWiMDhGcgv0wdoRqrmkFDkPSwwglkon8KgMDOPdTinze+/FIoQE38nDRtgBYPpW6yomWxVf0e2Ltq
	wcCQarSGY+R38gu3/A5U1Kzr70AGOgHFUoyRaUSD9UOeyM84i/bn4e0uRQMtU1Pj33PJXPv9G4w/n
	BBMgUl8h8i/CzI8Jl1oFn5ISZCK8yTU+W8rvtuEEWxsZGxmCoIsQ4tbJm4Orh97I0l02lnl895Boq
	vFmJXKII0qYszM+izsVVahDe/2/Z54I79h10Xm8J2DTkO0EZpPQs6U/hmW9Nd4siQl5DAZcMRR4JQ
	tnhQh6LA==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syz9J-00000005atM-1A4Z
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 19:48:40 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-6bce380eb96so774060a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 12:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728589713; x=1729194513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNvjcSMD1XB1l6NOS6ExlEo9cUT+I176k7DgI2zQ1iA=;
        b=tlW5vSHtiYFhdpJvO5E0jEuU07tvV5ZYQzP71OyuWarbZgXrS2O1dwDGKXVFJkOFYm
         RFRLPZm0CnJ+9IKVByED3qBfl/9ANVDfzsozbwq+X7Q+fcHX1B2hTFrr01yjFN+FmPaG
         cswDk0DazH36nC4Pap4btrMOmjoAlVd6912RvpIg7vEFQMfFn+LWLQU+Jn2aaxDOAS6K
         CEG7iJsuhSC+aC0FdsOUrKRVj8tvjubKKXdnFtCcO+dzPgrJ62OgfB1ajunfR9mS2HYG
         emJuQJMeAqhnLGpMZHVow4a1UcxXdcEVxt/Tgxs5V9uyeHbSAwQFZ0Yi0cm/zm7QcaNw
         couQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728589713; x=1729194513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNvjcSMD1XB1l6NOS6ExlEo9cUT+I176k7DgI2zQ1iA=;
        b=S4HQ03/DKWwkYwUeq2uN+RxvRNGe1NpipXhzZsM8cCtRabDb+uQ9gFLp1v0z1MH68r
         2jIicAjdjtF6Nj3+4c8YDLASzU3tgcCR9d8Q0hkfmbecbLyeOZlwoyEi17SQmZrmCbdo
         RhD42H7gmar7fy2bP+sYNz7XRUq7PUBN/P6mde1CA3wZDzBKkESlHzRVu39o+55d0hAF
         GTrUVjD0PZTuVKzVeunpQDLlZxZ02AhBXS+0RTRk+seDCu3e3Uc+yWdktB9vwT2m5qqI
         LVK5JGgFimHs+kQV5KAbDMGkNXQb6othSAdaPfXPfiJos6vIlbfzk9zIKDZqNvg/z2JC
         nGEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhRk9O8solUSdd4WuULoR+ZPet96i9NlgcuRnd11fhGz/uRl+q9syiODtmvqsvSlcVmPDjL0dCnUEtZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqEqJU3Lj3D10kP4cAt2NjZjsKYoqGS3afqRXvihOIMyVG3uYx
	yRgXYwYkm8VXK/+mCk8uglRYrjs8ARu65sWSf/QTRSqH73EAwqcd3ocT+hl9GUE=
X-Google-Smtp-Source: AGHT+IElWj3MBVHOh3B+iyij2musyj+SidDkbhoc+Fw3p7WR30V31+IbJsERJ4NjnBhf6uNry2i6AQ==
X-Received: by 2002:a17:90a:a00b:b0:2e2:ba35:356c with SMTP id 98e67ed59e1d1-2e2f0dc659emr339295a91.39.1728589713463;
        Thu, 10 Oct 2024 12:48:33 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2e6ef1ad0sm749135a91.49.2024.10.10.12.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 12:48:32 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v9 3/7] iommu/riscv: Add RISC-V IOMMU PCIe device driver
Date: Thu, 10 Oct 2024 12:48:06 -0700
Message-Id: <606ff9e3151cc264bc2377d66508b95619d529b1.1728579958.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728579958.git.tjeznach@rivosinc.com>
References: <cover.1728579958.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_204837_822740_54A2579C 
X-CRM114-Status: GOOD (  22.13  )
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
IGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtcGNpLmMgfCAxMjAgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMTI2IGluc2VydGlvbnMoKykKIGNyZWF0
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
Y3YvaW9tbXUtcGNpLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5j
N2E4OTE0MzAxNGMKLS0tIC9kZXYvbnVsbAorKysgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11
LXBjaS5jCkBAIC0wLDAgKzEsMTIwIEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5CisKKy8qCisgKiBDb3B5cmlnaHQgwqkgMjAyMi0yMDI0IFJpdm9zIEluYy4KKyAq
IENvcHlyaWdodCDCqSAyMDIzIEZPUlRILUlDUy9DQVJWCisgKgorICogUklTQ1YgSU9NTVUgYXMg
YSBQQ0llIGRldmljZQorICoKKyAqIEF1dGhvcnMKKyAqCVRvbWFzeiBKZXpuYWNoIDx0amV6bmFj
aEByaXZvc2luYy5jb20+CisgKglOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPgor
ICovCisKKyNpbmNsdWRlIDxsaW51eC9jb21waWxlci5oPgorI2luY2x1ZGUgPGxpbnV4L2luaXQu
aD4KKyNpbmNsdWRlIDxsaW51eC9pb21tdS5oPgorI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgor
I2luY2x1ZGUgPGxpbnV4L3BjaS5oPgorCisjaW5jbHVkZSAiaW9tbXUtYml0cy5oIgorI2luY2x1
ZGUgImlvbW11LmgiCisKKy8qIFFFTVUgUklTQy1WIElPTU1VIGltcGxlbWVudGF0aW9uICovCisj
ZGVmaW5lIFBDSV9ERVZJQ0VfSURfUkVESEFUX1JJU0NWX0lPTU1VICAgICAweDAwMTQKKworLyog
Uml2b3MgSW5jLiBhc3NpZ25lZCBQQ0kgVmVuZG9yIGFuZCBEZXZpY2UgSURzICovCisjaWZuZGVm
IFBDSV9WRU5ET1JfSURfUklWT1MKKyNkZWZpbmUgUENJX1ZFTkRPUl9JRF9SSVZPUyAgICAgICAg
ICAgICAgICAgIDB4MWVmZAorI2VuZGlmCisKKyNkZWZpbmUgUENJX0RFVklDRV9JRF9SSVZPU19S
SVNDVl9JT01NVV9HQSAgIDB4MDAwOAorCitzdGF0aWMgaW50IHJpc2N2X2lvbW11X3BjaV9wcm9i
ZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCkK
K3sKKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2OworCXN0cnVjdCByaXNjdl9pb21t
dV9kZXZpY2UgKmlvbW11OworCWludCByYywgdmVjOworCisJcmMgPSBwY2ltX2VuYWJsZV9kZXZp
Y2UocGRldik7CisJaWYgKHJjKQorCQlyZXR1cm4gcmM7CisKKwlpZiAoIShwY2lfcmVzb3VyY2Vf
ZmxhZ3MocGRldiwgMCkgJiBJT1JFU09VUkNFX01FTSkpCisJCXJldHVybiAtRU5PREVWOworCisJ
aWYgKHBjaV9yZXNvdXJjZV9sZW4ocGRldiwgMCkgPCBSSVNDVl9JT01NVV9SRUdfU0laRSkKKwkJ
cmV0dXJuIC1FTk9ERVY7CisKKwlyYyA9IHBjaW1faW9tYXBfcmVnaW9ucyhwZGV2LCBCSVQoMCks
IHBjaV9uYW1lKHBkZXYpKTsKKwlpZiAocmMpCisJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwg
cmMsICJwY2ltX2lvbWFwX3JlZ2lvbnMgZmFpbGVkXG4iKTsKKworCWlvbW11ID0gZGV2bV9remFs
bG9jKGRldiwgc2l6ZW9mKCppb21tdSksIEdGUF9LRVJORUwpOworCWlmICghaW9tbXUpCisJCXJl
dHVybiAtRU5PTUVNOworCisJaW9tbXUtPmRldiA9IGRldjsKKwlpb21tdS0+cmVnID0gcGNpbV9p
b21hcF90YWJsZShwZGV2KVswXTsKKworCXBjaV9zZXRfbWFzdGVyKHBkZXYpOworCWRldl9zZXRf
ZHJ2ZGF0YShkZXYsIGlvbW11KTsKKworCS8qIENoZWNrIGRldmljZSByZXBvcnRlZCBjYXBhYmls
aXRpZXMgLyBmZWF0dXJlcy4gKi8KKwlpb21tdS0+Y2FwcyA9IHJpc2N2X2lvbW11X3JlYWRxKGlv
bW11LCBSSVNDVl9JT01NVV9SRUdfQ0FQQUJJTElUSUVTKTsKKwlpb21tdS0+ZmN0bCA9IHJpc2N2
X2lvbW11X3JlYWRsKGlvbW11LCBSSVNDVl9JT01NVV9SRUdfRkNUTCk7CisKKwkvKiBUaGUgUENJ
IGRyaXZlciBvbmx5IHVzZXMgTVNJcywgbWFrZSBzdXJlIHRoZSBJT01NVSBzdXBwb3J0cyB0aGlz
ICovCisJc3dpdGNoIChGSUVMRF9HRVQoUklTQ1ZfSU9NTVVfQ0FQQUJJTElUSUVTX0lHUywgaW9t
bXUtPmNhcHMpKSB7CisJY2FzZSBSSVNDVl9JT01NVV9DQVBBQklMSVRJRVNfSUdTX01TSToKKwlj
YXNlIFJJU0NWX0lPTU1VX0NBUEFCSUxJVElFU19JR1NfQk9USDoKKwkJYnJlYWs7CisJZGVmYXVs
dDoKKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRU5PREVWLAorCQkJCSAgICAgInVuYWJs
ZSB0byB1c2UgbWVzc2FnZS1zaWduYWxlZCBpbnRlcnJ1cHRzXG4iKTsKKwl9CisKKwkvKiBBbGxv
Y2F0ZSBhbmQgYXNzaWduIElSUSB2ZWN0b3JzIGZvciB0aGUgdmFyaW91cyBldmVudHMgKi8KKwly
YyA9IHBjaV9hbGxvY19pcnFfdmVjdG9ycyhwZGV2LCAxLCBSSVNDVl9JT01NVV9JTlRSX0NPVU5U
LAorCQkJCSAgIFBDSV9JUlFfTVNJWCB8IFBDSV9JUlFfTVNJKTsKKwlpZiAocmMgPD0gMCkKKwkJ
cmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRU5PREVWLAorCQkJCSAgICAgInVuYWJsZSB0byBh
bGxvY2F0ZSBpcnEgdmVjdG9yc1xuIik7CisKKwlpb21tdS0+aXJxc19jb3VudCA9IHJjOworCWZv
ciAodmVjID0gMDsgdmVjIDwgaW9tbXUtPmlycXNfY291bnQ7IHZlYysrKQorCQlpb21tdS0+aXJx
c1t2ZWNdID0gbXNpX2dldF92aXJxKGRldiwgdmVjKTsKKworCS8qIEVuYWJsZSBtZXNzYWdlLXNp
Z25hbGVkIGludGVycnVwdHMsIGZjdGwuV1NJICovCisJaWYgKGlvbW11LT5mY3RsICYgUklTQ1Zf
SU9NTVVfRkNUTF9XU0kpIHsKKwkJaW9tbXUtPmZjdGwgXj0gUklTQ1ZfSU9NTVVfRkNUTF9XU0k7
CisJCXJpc2N2X2lvbW11X3dyaXRlbChpb21tdSwgUklTQ1ZfSU9NTVVfUkVHX0ZDVEwsIGlvbW11
LT5mY3RsKTsKKwl9CisKKwlyZXR1cm4gcmlzY3ZfaW9tbXVfaW5pdChpb21tdSk7Cit9CisKK3N0
YXRpYyB2b2lkIHJpc2N2X2lvbW11X3BjaV9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCit7
CisJc3RydWN0IHJpc2N2X2lvbW11X2RldmljZSAqaW9tbXUgPSBkZXZfZ2V0X2RydmRhdGEoJnBk
ZXYtPmRldik7CisKKwlyaXNjdl9pb21tdV9yZW1vdmUoaW9tbXUpOworfQorCitzdGF0aWMgY29u
c3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgcmlzY3ZfaW9tbXVfcGNpX3RibFtdID0geworCXtQQ0lf
VkRFVklDRShSRURIQVQsIFBDSV9ERVZJQ0VfSURfUkVESEFUX1JJU0NWX0lPTU1VKSwgMH0sCisJ
e1BDSV9WREVWSUNFKFJJVk9TLCBQQ0lfREVWSUNFX0lEX1JJVk9TX1JJU0NWX0lPTU1VX0dBKSwg
MH0sCisJezAsfQorfTsKKworc3RhdGljIHN0cnVjdCBwY2lfZHJpdmVyIHJpc2N2X2lvbW11X3Bj
aV9kcml2ZXIgPSB7CisJLm5hbWUgPSBLQlVJTERfTU9ETkFNRSwKKwkuaWRfdGFibGUgPSByaXNj
dl9pb21tdV9wY2lfdGJsLAorCS5wcm9iZSA9IHJpc2N2X2lvbW11X3BjaV9wcm9iZSwKKwkucmVt
b3ZlID0gcmlzY3ZfaW9tbXVfcGNpX3JlbW92ZSwKKwkuZHJpdmVyID0geworCQkuc3VwcHJlc3Nf
YmluZF9hdHRycyA9IHRydWUsCisJfSwKK307CisKK2J1aWx0aW5fcGNpX2RyaXZlcihyaXNjdl9p
b21tdV9wY2lfZHJpdmVyKTsKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
