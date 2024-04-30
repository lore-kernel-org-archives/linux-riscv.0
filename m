Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74572C19F4F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 20:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xhWIqG5x0mrsG7yFCmUyZvcQC1LkjUAShDc+ArwC5uM=; b=wdNBYwP1pq1nEF
	wtQy8rtiucZ3GSqkRDpreoJ509NAAGNY3KVWwaVD3FlsFXHSCyDg8/yyQdOF0PfWdS+BWYURRdSD3
	WShBwI9sqA4oCAWEEVl91f7uzJNIWDcMEY8b7n+mbBjQy/5zEiD0DdxNmUJoW7FEMeM52pK3z9XG+
	2IQe7GFztGI1y/5jzxbJguZ0tByHQlN42fJqS4ijXp5VX+0769VqlUWrXUG54KSyFTSnbbFkJhYOq
	hf/PTW4NGjgd+CqsjmrRC1aJ67ZxedF7vHhTQgSnFeOau2YeV1PSme4nXnCBAAuubWkOH0IF+fZ6a
	CfGQIrbjsrG02X87qj4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tgn-00000007n76-2Nvt;
	Tue, 30 Apr 2024 20:02:57 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tgc-00000007n1y-0kSm
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 20:02:47 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1eb66b6953cso30137495ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Apr 2024 13:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714507364; x=1715112164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HG+I/Huo0JwwBHVVG3HrcQh/fpO8X/Q3uFltOztKy0=;
        b=z0Xiekfslsw2OgorDytG/8p3E7LfKuKmcfNQv0u62S0jpeCnHGEsd/rP4ZSSAkSfUc
         MKICUgRmUk7aspq8iXybzhbQTX9/ZJ1flrQQPfYils33pnkqCeoxDrAh7AGl9ne1244D
         6xxVdKr+xRYnBZ0efvn6BUS3sGFSNCTh0025pasdxjU+8UrHfi05otTBfm/bVDUt5eE7
         159uplqgIIe6FsirOSF9lL1i0X4iC9Gdrmeu2vbo3ar2+eJTo5MQ+2127YmpVeKVNPEE
         fVcv37zW5VVgLfHOrCburoLpB1Zyp2PODSp0wVdhiPvS5oYhtYUWc1qkJ8szIAFVG2Pv
         ljng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714507364; x=1715112164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HG+I/Huo0JwwBHVVG3HrcQh/fpO8X/Q3uFltOztKy0=;
        b=EsAPakLdCYEXPf8TpTLJI0OxT81txDPQsbSPJApikGERedcdAUgPFUcipLFXMuBrUw
         OZUrqrB/gvMV+46y7SzKsLIcVLgbkleKXuyBzj8/oMEqxER7xGRuq/2r85wmJO2HHxd5
         8F362WU8v8NWAzxLa7bBF+866QbyZxOd/aOUn9FfmKis0Gy8GDhURUu2f/dUK+WkNn9/
         Sdhfb9IXlX49+F5vFv6sDvoHt+JYh1pRg7S/E+i8S700Ewb1zL+8c3GKQ+q9KGNhS8UZ
         cY/N7H3YlrtEwXhd0HYx8kLV9qAo+5BOcON5ZJfJMAKDDyApBxqvEmUO/JDUCL7NV8Hk
         5Zaw==
X-Forwarded-Encrypted: i=1; AJvYcCWunyZ4PkYBon0FmlvKQz5nO4HMuxmDKTdfQK7sRh19BpW+6G1Wc9JoF+74kM200mI8gJuCcBlLxMHjdLOrHmu/DrPVvuvWH2cLcJnW3CT1
X-Gm-Message-State: AOJu0Yz+Q4WO6i2yMIa5ulv8PFJEX11IIBzuLWzdsnPix2dJE+yympe2
	GbqwoDmyuoHpHn/aNIWo7afW7pdg1YITpQlblrEGuzgx86GqeSqOGh2K90OGfcU=
X-Google-Smtp-Source: AGHT+IGZvOZaoIEZWdAoqnUd0KYz+yJ1d5nQaoUMC6WZfy0y4elBEkIzcPAAhWzl2IzLLVy5nogbWA==
X-Received: by 2002:a17:902:6e02:b0:1e4:2d13:cf68 with SMTP id u2-20020a1709026e0200b001e42d13cf68mr447303plk.17.1714507364266;
        Tue, 30 Apr 2024 13:02:44 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w19-20020a1709027b9300b001e435fa2521sm22809820pll.249.2024.04.30.13.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 13:02:43 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v3 3/7] iommu/riscv: Add RISC-V IOMMU PCIe device driver
Date: Tue, 30 Apr 2024 13:01:53 -0700
Message-Id: <3a04bd180fd510cb90e8d8dba5fb60f207e5e83f.1714494653.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714494653.git.tjeznach@rivosinc.com>
References: <cover.1714494653.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_130246_248225_B11A46B5 
X-CRM114-Status: GOOD (  22.54  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org
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
OiBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPgpTaWduZWQtb2ZmLWJ5OiBUb21h
c3ogSmV6bmFjaCA8dGplem5hY2hAcml2b3NpbmMuY29tPgotLS0KIGRyaXZlcnMvaW9tbXUvcmlz
Y3YvS2NvbmZpZyAgICAgfCAgIDUgKysKIGRyaXZlcnMvaW9tbXUvcmlzY3YvTWFrZWZpbGUgICAg
fCAgIDEgKwogZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1wY2kuYyB8IDExOSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAxMjUgaW5zZXJ0aW9ucygr
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtcGNpLmMKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L3Jpc2N2L0tjb25maWcgYi9kcml2ZXJzL2lvbW11L3Jp
c2N2L0tjb25maWcKaW5kZXggNWRjYzVjNDVhYTUwLi5jMDcxODE2ZjU5YTYgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvaW9tbXUvcmlzY3YvS2NvbmZpZworKysgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L0tj
b25maWcKQEAgLTEzLDMgKzEzLDggQEAgY29uZmlnIFJJU0NWX0lPTU1VCiAKIAkgIFNheSBZIGhl
cmUgaWYgeW91ciBTb0MgaW5jbHVkZXMgYW4gSU9NTVUgZGV2aWNlIGltcGxlbWVudGluZwogCSAg
dGhlIFJJU0MtViBJT01NVSBhcmNoaXRlY3R1cmUuCisKK2NvbmZpZyBSSVNDVl9JT01NVV9QQ0kK
KwlkZWZfYm9vbCB5IGlmIFJJU0NWX0lPTU1VICYmIFBDSV9NU0kKKwloZWxwCisJICBTdXBwb3J0
IGZvciB0aGUgUENJZSBpbXBsZW1lbnRhdGlvbiBvZiBSSVNDLVYgSU9NTVUgYXJjaGl0ZWN0dXJl
LgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9yaXNjdi9NYWtlZmlsZSBiL2RyaXZlcnMvaW9t
bXUvcmlzY3YvTWFrZWZpbGUKaW5kZXggZTRjMTg5ZGU1OGQzLi5mNTRjOWVkMTdkNDEgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvTWFrZWZpbGUKKysrIGIvZHJpdmVycy9pb21tdS9y
aXNjdi9NYWtlZmlsZQpAQCAtMSwyICsxLDMgQEAKICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seQogb2JqLSQoQ09ORklHX1JJU0NWX0lPTU1VKSArPSBpb21tdS5vIGlvbW11
LXBsYXRmb3JtLm8KK29iai0kKENPTkZJR19SSVNDVl9JT01NVV9QQ0kpICs9IGlvbW11LXBjaS5v
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBjaS5jIGIvZHJpdmVycy9p
b21tdS9yaXNjdi9pb21tdS1wY2kuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwMDAuLjBhNjBlMDY4ZmRjOQotLS0gL2Rldi9udWxsCisrKyBiL2RyaXZlcnMvaW9tbXUvcmlz
Y3YvaW9tbXUtcGNpLmMKQEAgLTAsMCArMSwxMTkgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9ubHkKKworLyoKKyAqIENvcHlyaWdodCDCqSAyMDIyLTIwMjQgUml2b3Mg
SW5jLgorICogQ29weXJpZ2h0IMKpIDIwMjMgRk9SVEgtSUNTL0NBUlYKKyAqCisgKiBSSVNDViBJ
T01NVSBhcyBhIFBDSWUgZGV2aWNlCisgKgorICogQXV0aG9ycworICoJVG9tYXN6IEplem5hY2gg
PHRqZXpuYWNoQHJpdm9zaW5jLmNvbT4KKyAqCU5pY2sgS29zc2lmaWRpcyA8bWlja0BpY3MuZm9y
dGguZ3I+CisgKi8KKworI2luY2x1ZGUgPGxpbnV4L2NvbXBpbGVyLmg+CisjaW5jbHVkZSA8bGlu
dXgvaW5pdC5oPgorI2luY2x1ZGUgPGxpbnV4L2lvbW11Lmg+CisjaW5jbHVkZSA8bGludXgva2Vy
bmVsLmg+CisjaW5jbHVkZSA8bGludXgvcGNpLmg+CisKKyNpbmNsdWRlICJpb21tdS1iaXRzLmgi
CisjaW5jbHVkZSAiaW9tbXUuaCIKKworLyogUml2b3MgSW5jLiBhc3NpZ25lZCBQQ0kgVmVuZG9y
IGFuZCBEZXZpY2UgSURzICovCisjaWZuZGVmIFBDSV9WRU5ET1JfSURfUklWT1MKKyNkZWZpbmUg
UENJX1ZFTkRPUl9JRF9SSVZPUyAgICAgICAgICAgICAweDFlZmQKKyNlbmRpZgorCisjaWZuZGVm
IFBDSV9ERVZJQ0VfSURfUklWT1NfSU9NTVUKKyNkZWZpbmUgUENJX0RFVklDRV9JRF9SSVZPU19J
T01NVSAgICAgICAweGVkZjEKKyNlbmRpZgorCitzdGF0aWMgaW50IHJpc2N2X2lvbW11X3BjaV9w
cm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVu
dCkKK3sKKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2OworCXN0cnVjdCByaXNjdl9p
b21tdV9kZXZpY2UgKmlvbW11OworCWludCByYywgdmVjOworCisJcmMgPSBwY2ltX2VuYWJsZV9k
ZXZpY2UocGRldik7CisJaWYgKHJjKQorCQlyZXR1cm4gcmM7CisKKwlpZiAoIShwY2lfcmVzb3Vy
Y2VfZmxhZ3MocGRldiwgMCkgJiBJT1JFU09VUkNFX01FTSkpCisJCXJldHVybiAtRU5PREVWOwor
CisJaWYgKHBjaV9yZXNvdXJjZV9sZW4ocGRldiwgMCkgPCBSSVNDVl9JT01NVV9SRUdfU0laRSkK
KwkJcmV0dXJuIC1FTk9ERVY7CisKKwlyYyA9IHBjaW1faW9tYXBfcmVnaW9ucyhwZGV2LCBCSVQo
MCksIHBjaV9uYW1lKHBkZXYpKTsKKwlpZiAocmMpCisJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRl
diwgcmMsICJwY2ltX2lvbWFwX3JlZ2lvbnMgZmFpbGVkXG4iKTsKKworCWlvbW11ID0gZGV2bV9r
emFsbG9jKGRldiwgc2l6ZW9mKCppb21tdSksIEdGUF9LRVJORUwpOworCWlmICghaW9tbXUpCisJ
CXJldHVybiAtRU5PTUVNOworCisJaW9tbXUtPmRldiA9IGRldjsKKwlpb21tdS0+cmVnID0gcGNp
bV9pb21hcF90YWJsZShwZGV2KVswXTsKKworCXBjaV9zZXRfbWFzdGVyKHBkZXYpOworCWRldl9z
ZXRfZHJ2ZGF0YShkZXYsIGlvbW11KTsKKworCS8qIENoZWNrIGRldmljZSByZXBvcnRlZCBjYXBh
YmlsaXRpZXMgLyBmZWF0dXJlcy4gKi8KKwlpb21tdS0+Y2FwcyA9IHJpc2N2X2lvbW11X3JlYWRx
KGlvbW11LCBSSVNDVl9JT01NVV9SRUdfQ0FQKTsKKwlpb21tdS0+ZmN0bCA9IHJpc2N2X2lvbW11
X3JlYWRsKGlvbW11LCBSSVNDVl9JT01NVV9SRUdfRkNUTCk7CisKKwkvKiBUaGUgUENJIGRyaXZl
ciBvbmx5IHVzZXMgTVNJcywgbWFrZSBzdXJlIHRoZSBJT01NVSBzdXBwb3J0cyB0aGlzICovCisJ
c3dpdGNoIChGSUVMRF9HRVQoUklTQ1ZfSU9NTVVfQ0FQX0lHUywgaW9tbXUtPmNhcHMpKSB7CisJ
Y2FzZSBSSVNDVl9JT01NVV9DQVBfSUdTX01TSToKKwljYXNlIFJJU0NWX0lPTU1VX0NBUF9JR1Nf
Qk9USDoKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAt
RU5PREVWLAorCQkJCSAgICAgInVuYWJsZSB0byB1c2UgbWVzc2FnZS1zaWduYWxlZCBpbnRlcnJ1
cHRzXG4iKTsKKwl9CisKKwkvKiBBbGxvY2F0ZSBhbmQgYXNzaWduIElSUSB2ZWN0b3JzIGZvciB0
aGUgdmFyaW91cyBldmVudHMgKi8KKwlyYyA9IHBjaV9hbGxvY19pcnFfdmVjdG9ycyhwZGV2LCAx
LCBSSVNDVl9JT01NVV9JTlRSX0NPVU5ULAorCQkJCSAgIFBDSV9JUlFfTVNJWCB8IFBDSV9JUlFf
TVNJKTsKKwlpZiAocmMgPD0gMCkKKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRU5PREVW
LAorCQkJCSAgICAgInVuYWJsZSB0byBhbGxvY2F0ZSBpcnEgdmVjdG9yc1xuIik7CisKKwlpb21t
dS0+aXJxc19jb3VudCA9IHJjOworCWZvciAodmVjID0gMDsgdmVjIDwgaW9tbXUtPmlycXNfY291
bnQ7IHZlYysrKQorCQlpb21tdS0+aXJxc1t2ZWNdID0gbXNpX2dldF92aXJxKGRldiwgdmVjKTsK
KworCS8qIEVuYWJsZSBtZXNzYWdlLXNpZ25hbGVkIGludGVycnVwdHMsIGZjdGwuV1NJICovCisJ
aWYgKGlvbW11LT5mY3RsICYgUklTQ1ZfSU9NTVVfRkNUTF9XU0kpIHsKKwkJaW9tbXUtPmZjdGwg
Xj0gUklTQ1ZfSU9NTVVfRkNUTF9XU0k7CisJCXJpc2N2X2lvbW11X3dyaXRlbChpb21tdSwgUklT
Q1ZfSU9NTVVfUkVHX0ZDVEwsIGlvbW11LT5mY3RsKTsKKwl9CisKKwlyZXR1cm4gcmlzY3ZfaW9t
bXVfaW5pdChpb21tdSk7Cit9CisKK3N0YXRpYyB2b2lkIHJpc2N2X2lvbW11X3BjaV9yZW1vdmUo
c3RydWN0IHBjaV9kZXYgKnBkZXYpCit7CisJc3RydWN0IHJpc2N2X2lvbW11X2RldmljZSAqaW9t
bXUgPSBkZXZfZ2V0X2RydmRhdGEoJnBkZXYtPmRldik7CisKKwlyaXNjdl9pb21tdV9yZW1vdmUo
aW9tbXUpOworfQorCitzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgcmlzY3ZfaW9t
bXVfcGNpX3RibFtdID0geworCXtQQ0lfVkVORE9SX0lEX1JJVk9TLCBQQ0lfREVWSUNFX0lEX1JJ
Vk9TX0lPTU1VLAorCSBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCAwfSwKKwl7MCx9Cit9
OworCitzdGF0aWMgc3RydWN0IHBjaV9kcml2ZXIgcmlzY3ZfaW9tbXVfcGNpX2RyaXZlciA9IHsK
KwkubmFtZSA9IEtCVUlMRF9NT0ROQU1FLAorCS5pZF90YWJsZSA9IHJpc2N2X2lvbW11X3BjaV90
YmwsCisJLnByb2JlID0gcmlzY3ZfaW9tbXVfcGNpX3Byb2JlLAorCS5yZW1vdmUgPSByaXNjdl9p
b21tdV9wY2lfcmVtb3ZlLAorCS5kcml2ZXIgPSB7CisJCS5zdXBwcmVzc19iaW5kX2F0dHJzID0g
dHJ1ZSwKKwl9LAorfTsKKworYnVpbHRpbl9wY2lfZHJpdmVyKHJpc2N2X2lvbW11X3BjaV9kcml2
ZXIpOwotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
