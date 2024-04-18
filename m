Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B98C41513
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 17:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8EpGK1UlfcgUu0/gJnXsZ4O/F+6b/PZar16NhFH2hR8=; b=JcsKYLJsQn+Vcm
	9Ts8vM5w0qoYvE+qsU+IilI3HJCyaR9U99+Eom+2tLwsRPB7/bCR565oCdJt1i76cOWPSx3ocb8R3
	ZIx/uEvNCcCw9r+ZY87DPKj+FwYebjwn/71OW5fc94a7mJZqph1JiNxFn4k+be5VvZ3BF6pX/yqXw
	Q3tCDiqt81h3ETnZKT948I6Knje1oYohxSDTrPXcMvmHuAPSjSQWLz1KWRauPXEwBGH03xwooRNfO
	/RjIkz4B3aTzqCAQd1MRwiESrPT5q5AYh27S2zJceuy05/dC1Y4/bmzGYUWtIKFQohkM/9BlUUpwR
	A+msxXHPz2/YTZ+ETk1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxVq3-00000003EwT-2Zg5;
	Thu, 18 Apr 2024 17:46:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxUgo-000000031Xa-03D2
	for linux-riscv@bombadil.infradead.org;
	Thu, 18 Apr 2024 16:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FHKal/vvH8z/ottSej913pkTRK3eYWZvnHgxtvD4TF0=; b=QMiuorILjjnBPF/wEIkhecHEWg
	iXCV8hTeGZjW15n0BJ1f27wNTM3Xie0TRt4TPf/Ga0shXnLmb8Vn0Kg7Aq8057Wfdh95syb0LeS+6
	c6FtteeBXZL8g2vZCux8ktiqI983YPWwmTMPN9pT2n8QwGAZlxvcPy8cTafg0jytCvfJpHxqTACrv
	+Bpp4M3Fc9xmBTv79OElC3cedR4tJ1JW2z6rFTGzY4Rg2QF7ZRXEVOCv377JXeWppADcPiTlztHor
	CEUDT1apLygVG6ePlC6VlHM5dvzjkrT1G0gfN2alfhZWDr+yiZ5eHupZWn52/tjfIn9WjWLV6z+qh
	XQKcEOLQ==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxUgi-0000000C4rp-0RPy
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 16:32:42 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6ee12766586so899267b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 09:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713457958; x=1714062758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHKal/vvH8z/ottSej913pkTRK3eYWZvnHgxtvD4TF0=;
        b=uUDs0qkJvN1z/Xy6ow2lwhSi59swHFCNi2WljjZVY8hFq/YigSn3xOaGJL+ulISabg
         KyE4aCb9yBwWSW5d+Cj89q2CKyPmdF4pqPr8LjqlwdjvJy6o6A9YbR9sRhe6zDVYNmAF
         XX248MGtJRN4gFIRg7PvVeN2/y8G4ePW3g9hi7qF8VBDdnW2nhaQ/MW+fz37pbIcPxxr
         uXrSkYBAe2tfm1ZpxG3cyftLvTZLwuSHMBqFQ/HKH/boOwqUqGv0TqGDkv8hJWgjxs24
         oJrPuzE9ddlzjD6X4BtoKstPyEeT0pIMJJopexRpTJNWD+Yn4R9IlCo4adfQ/6wWPlwQ
         XSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713457958; x=1714062758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FHKal/vvH8z/ottSej913pkTRK3eYWZvnHgxtvD4TF0=;
        b=IjZGYW9X1ZuOFf6qTLE7vu8T176zavU9iBWXO5ScBNrPoXPlFn5xONP71H6D3CzjN1
         oYUBEi0/WeHMgxfe3DlEldaAePoi0Kuw2J/KdZZVZyq9eRSXH6dA0Kiqs9sPXItYjMLV
         nsnBxo0Ygl2yXkkDuCucdH/Vc+i1x4bACwlCNPjIxko4R2Mb2dkuwWTISapteQ7cfYnH
         OwWopcfAOM30Dn4PzQVidRqAJPx2x3bl7ifn+PExe423dWwDlygyQC8gnh3PArJPpNdE
         RsQiDuWIHRU0eI1zY97pF7vbI0ikRU/ws/OVvJnQSsMWKvG0Qh+NCX51H1+BgKO0cCEU
         riJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTDN8hHJHkda9+9zSziY2XvkPnMUDYjMaQIHXoYgwL9V77jUxSZ7rP/Vy4bXAvkR0KSPNI96q2FFHFlro4XP+h0EPmff15qFCBcjpzPuaw
X-Gm-Message-State: AOJu0YyIs7NBMmMNEOZdzJo4ZMjNFPPQ/KbvoveGiey6lYPUKHwnOIcT
	FNsjFyk8v9AlJN/rDXhdGpD0Mi4QsCEBr/UBfwSD2Eth4bA79vCFVo/7KWgvqCk=
X-Google-Smtp-Source: AGHT+IGBYbl1wbHIwQ3lWmMx5ZaQ5vB8SSg4htQp5CGoXofTgAD73EDRAgHIKteI0VW5uOioE9zfaQ==
X-Received: by 2002:a05:6a00:21d0:b0:6ea:c7bd:90e3 with SMTP id t16-20020a056a0021d000b006eac7bd90e3mr4466325pfj.14.1713457957754;
        Thu, 18 Apr 2024 09:32:37 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b19-20020a056a000a9300b006eae3aac040sm1674755pfl.31.2024.04.18.09.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 09:32:37 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v2 3/7] iommu/riscv: Add RISC-V IOMMU PCIe device driver
Date: Thu, 18 Apr 2024 09:32:21 -0700
Message-Id: <4a068da7a7a984a43d419c52310f8ab7d91da46e.1713456598.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713456597.git.tjeznach@rivosinc.com>
References: <cover.1713456597.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_173240_837463_278C220C 
X-CRM114-Status: GOOD (  24.15  )
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
TGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1kZXZlbC8yMDI0MDMwNzE2MDMxOS42
NzUwNDQtMS1kYmFyYm96YUB2ZW50YW5hbWljcm8uY29tLwpDby1kZXZlbG9wZWQtYnk6IE5pY2sg
S29zc2lmaWRpcyA8bWlja0BpY3MuZm9ydGguZ3I+ClNpZ25lZC1vZmYtYnk6IE5pY2sgS29zc2lm
aWRpcyA8bWlja0BpY3MuZm9ydGguZ3I+ClNpZ25lZC1vZmYtYnk6IFRvbWFzeiBKZXpuYWNoIDx0
amV6bmFjaEByaXZvc2luYy5jb20+Ci0tLQogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAg
ICB8ICAgMSArCiBkcml2ZXJzL2lvbW11L3Jpc2N2L0tjb25maWcgICAgIHwgICA2ICsrCiBkcml2
ZXJzL2lvbW11L3Jpc2N2L01ha2VmaWxlICAgIHwgICAxICsKIGRyaXZlcnMvaW9tbXUvcmlzY3Yv
aW9tbXUtcGNpLmMgfCAxNTQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDQgZmls
ZXMgY2hhbmdlZCwgMTYyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2lvbW11L3Jpc2N2L2lvbW11LXBjaS5jCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlO
VEFJTkVSUwppbmRleCAwNTE1OTljNzY1ODUuLjRkYTI5MGQ1ZTlkYiAxMDA2NDQKLS0tIGEvTUFJ
TlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTE4OTc1LDYgKzE4OTc1LDcgQEAgRjoJRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L3Jpc2N2LGlvbW11LnlhbWwKIEY6
CWRyaXZlcnMvaW9tbXUvcmlzY3YvS2NvbmZpZwogRjoJZHJpdmVycy9pb21tdS9yaXNjdi9NYWtl
ZmlsZQogRjoJZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1iaXRzLmgKK0Y6CWRyaXZlcnMvaW9t
bXUvcmlzY3YvaW9tbXUtcGNpLmMKIEY6CWRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtcGxhdGZv
cm0uYwogRjoJZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jCiBGOglkcml2ZXJzL2lvbW11L3Jp
c2N2L2lvbW11LmgKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvS2NvbmZpZyBiL2Ry
aXZlcnMvaW9tbXUvcmlzY3YvS2NvbmZpZwppbmRleCBkMDIzMjZiZGRiNGMuLjcxMTMyNjk5MjU4
NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9pb21tdS9yaXNjdi9LY29uZmlnCisrKyBiL2RyaXZlcnMv
aW9tbXUvcmlzY3YvS2NvbmZpZwpAQCAtMTQsMyArMTQsOSBAQCBjb25maWcgUklTQ1ZfSU9NTVUK
IAogCSAgU2F5IFkgaGVyZSBpZiB5b3VyIFNvQyBpbmNsdWRlcyBhbiBJT01NVSBkZXZpY2UgaW1w
bGVtZW50aW5nCiAJICB0aGUgUklTQy1WIElPTU1VIGFyY2hpdGVjdHVyZS4KKworY29uZmlnIFJJ
U0NWX0lPTU1VX1BDSQorCWRlZl9ib29sIHkgaWYgUklTQ1ZfSU9NTVUgJiYgUENJX01TSQorCWRl
cGVuZHMgb24gUklTQ1ZfSU9NTVUgJiYgUENJX01TSQorCWhlbHAKKwkgIFN1cHBvcnQgZm9yIHRo
ZSBQQ0kgaW1wbGVtZW50YXRpb24gb2YgUklTQy1WIElPTU1VIGFyY2hpdGVjdHVyZS4KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvTWFrZWZpbGUgYi9kcml2ZXJzL2lvbW11L3Jpc2N2
L01ha2VmaWxlCmluZGV4IGU0YzE4OWRlNThkMy4uZjU0YzllZDE3ZDQxIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2lvbW11L3Jpc2N2L01ha2VmaWxlCisrKyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvTWFr
ZWZpbGUKQEAgLTEsMiArMSwzIEBACiAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
LW9ubHkKIG9iai0kKENPTkZJR19SSVNDVl9JT01NVSkgKz0gaW9tbXUubyBpb21tdS1wbGF0Zm9y
bS5vCitvYmotJChDT05GSUdfUklTQ1ZfSU9NTVVfUENJKSArPSBpb21tdS1wY2kubwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1wY2kuYyBiL2RyaXZlcnMvaW9tbXUvcmlz
Y3YvaW9tbXUtcGNpLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi45
MjYzYzZlNDc1YmUKLS0tIC9kZXYvbnVsbAorKysgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11
LXBjaS5jCkBAIC0wLDAgKzEsMTU0IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5CisKKy8qCisgKiBDb3B5cmlnaHQgwqkgMjAyMi0yMDI0IFJpdm9zIEluYy4KKyAq
IENvcHlyaWdodCDCqSAyMDIzIEZPUlRILUlDUy9DQVJWCisgKgorICogUklTQ1YgSU9NTVUgYXMg
YSBQQ0llIGRldmljZQorICoKKyAqIEF1dGhvcnMKKyAqCVRvbWFzeiBKZXpuYWNoIDx0amV6bmFj
aEByaXZvc2luYy5jb20+CisgKglOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPgor
ICovCisKKyNpbmNsdWRlIDxsaW51eC9jb21waWxlci5oPgorI2luY2x1ZGUgPGxpbnV4L2luaXQu
aD4KKyNpbmNsdWRlIDxsaW51eC9pb21tdS5oPgorI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgor
I2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgorI2luY2x1ZGUgPGxpbnV4L3BjaS5oPgorCisjaW5j
bHVkZSAiaW9tbXUtYml0cy5oIgorI2luY2x1ZGUgImlvbW11LmgiCisKKy8qIFJpdm9zIEluYy4g
YXNzaWduZWQgUENJIFZlbmRvciBhbmQgRGV2aWNlIElEcyAqLworI2lmbmRlZiBQQ0lfVkVORE9S
X0lEX1JJVk9TCisjZGVmaW5lIFBDSV9WRU5ET1JfSURfUklWT1MgICAgICAgICAgICAgMHgxZWZk
CisjZW5kaWYKKworI2lmbmRlZiBQQ0lfREVWSUNFX0lEX1JJVk9TX0lPTU1VCisjZGVmaW5lIFBD
SV9ERVZJQ0VfSURfUklWT1NfSU9NTVUgICAgICAgMHhlZGYxCisjZW5kaWYKKworc3RhdGljIGlu
dCByaXNjdl9pb21tdV9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGNvbnN0IHN0cnVj
dCBwY2lfZGV2aWNlX2lkICplbnQpCit7CisJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRl
djsKKwlzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdTsKKwlpbnQgcmMsIHZlYzsKKwor
CXJjID0gcGNpX2VuYWJsZV9kZXZpY2VfbWVtKHBkZXYpOworCWlmIChyYykKKwkJcmV0dXJuIHJj
OworCisJcmMgPSBwY2lfcmVxdWVzdF9tZW1fcmVnaW9ucyhwZGV2LCBLQlVJTERfTU9ETkFNRSk7
CisJaWYgKHJjKQorCQlnb3RvIGZhaWw7CisKKwlwY2lfc2V0X21hc3RlcihwZGV2KTsKKworCWlm
ICghKHBjaV9yZXNvdXJjZV9mbGFncyhwZGV2LCAwKSAmIElPUkVTT1VSQ0VfTUVNKSkKKwkJZ290
byBmYWlsOworCisJaWYgKHBjaV9yZXNvdXJjZV9sZW4ocGRldiwgMCkgPCBSSVNDVl9JT01NVV9S
RUdfU0laRSkKKwkJZ290byBmYWlsOworCisJaW9tbXUgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXpl
b2YoKmlvbW11KSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFpb21tdSkKKwkJZ290byBmYWlsOworCisJ
aW9tbXUtPmRldiA9IGRldjsKKwlpb21tdS0+cmVnID0gcGNpX2lvbWFwKHBkZXYsIDAsIFJJU0NW
X0lPTU1VX1JFR19TSVpFKTsKKworCWlmICghaW9tbXUtPnJlZykKKwkJZ290byBmYWlsOworCisJ
ZGV2X3NldF9kcnZkYXRhKGRldiwgaW9tbXUpOworCisJLyogQ2hlY2sgZGV2aWNlIHJlcG9ydGVk
IGNhcGFiaWxpdGllcyAvIGZlYXR1cmVzLiAqLworCWlvbW11LT5jYXBzID0gcmlzY3ZfaW9tbXVf
cmVhZHEoaW9tbXUsIFJJU0NWX0lPTU1VX1JFR19DQVApOworCWlvbW11LT5mY3RsID0gcmlzY3Zf
aW9tbXVfcmVhZGwoaW9tbXUsIFJJU0NWX0lPTU1VX1JFR19GQ1RMKTsKKworCS8qIFRoZSBQQ0kg
ZHJpdmVyIG9ubHkgdXNlcyBNU0lzLCBtYWtlIHN1cmUgdGhlIElPTU1VIHN1cHBvcnRzIHRoaXMg
Ki8KKwlzd2l0Y2ggKEZJRUxEX0dFVChSSVNDVl9JT01NVV9DQVBfSUdTLCBpb21tdS0+Y2Fwcykp
IHsKKwljYXNlIFJJU0NWX0lPTU1VX0NBUF9JR1NfTVNJOgorCWNhc2UgUklTQ1ZfSU9NTVVfQ0FQ
X0lHU19CT1RIOgorCQlicmVhazsKKwlkZWZhdWx0OgorCQlkZXZfZXJyKGRldiwgInVuYWJsZSB0
byB1c2UgbWVzc2FnZS1zaWduYWxlZCBpbnRlcnJ1cHRzXG4iKTsKKwkJcmMgPSAtRU5PREVWOwor
CQlnb3RvIGZhaWxfdW5tYXA7CisJfQorCisJLyogQWxsb2NhdGUgYW5kIGFzc2lnbiBJUlEgdmVj
dG9ycyBmb3IgdGhlIHZhcmlvdXMgZXZlbnRzICovCisJcmMgPSBwY2lfYWxsb2NfaXJxX3ZlY3Rv
cnMocGRldiwgMSwgUklTQ1ZfSU9NTVVfSU5UUl9DT1VOVCwKKwkJCQkgICBQQ0lfSVJRX01TSVgg
fCBQQ0lfSVJRX01TSSk7CisJaWYgKHJjIDw9IDApIHsKKwkJZGV2X2VycihkZXYsICJ1bmFibGUg
dG8gYWxsb2NhdGUgaXJxIHZlY3RvcnNcbiIpOworCQlnb3RvIGZhaWxfdW5tYXA7CisJfQorCWZv
ciAodmVjID0gMDsgdmVjIDwgcmM7IHZlYysrKSB7CisJCWlvbW11LT5pcnFzW3ZlY10gPSBtc2lf
Z2V0X3ZpcnEoZGV2LCB2ZWMpOworCQlpZiAoIWlvbW11LT5pcnFzW3ZlY10pCisJCQlicmVhazsK
Kwl9CisJaW9tbXUtPmlycXNfY291bnQgPSB2ZWM7CisKKwkvKiBFbmFibGUgbWVzc2FnZS1zaWdu
YWxlZCBpbnRlcnJ1cHRzLCBmY3RsLldTSSAqLworCWlmIChpb21tdS0+ZmN0bCAmIFJJU0NWX0lP
TU1VX0ZDVExfV1NJKSB7CisJCWlvbW11LT5mY3RsIF49IFJJU0NWX0lPTU1VX0ZDVExfV1NJOwor
CQlyaXNjdl9pb21tdV93cml0ZWwoaW9tbXUsIFJJU0NWX0lPTU1VX1JFR19GQ1RMLCBpb21tdS0+
ZmN0bCk7CisJfQorCisJcmMgPSByaXNjdl9pb21tdV9pbml0KGlvbW11KTsKKwlpZiAoIXJjKQor
CQlyZXR1cm4gMDsKKworZmFpbF91bm1hcDoKKwlpb3VubWFwKGlvbW11LT5yZWcpOworCXBjaV9m
cmVlX2lycV92ZWN0b3JzKHBkZXYpOworZmFpbDoKKwlwY2lfcmVsZWFzZV9yZWdpb25zKHBkZXYp
OworCXBjaV9jbGVhcl9tYXN0ZXIocGRldik7CisJcGNpX2Rpc2FibGVfZGV2aWNlKHBkZXYpOwor
CXJldHVybiByYzsKK30KKworc3RhdGljIHZvaWQgcmlzY3ZfaW9tbXVfcGNpX3JlbW92ZShzdHJ1
Y3QgcGNpX2RldiAqcGRldikKK3sKKwlzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSA9
IGRldl9nZXRfZHJ2ZGF0YSgmcGRldi0+ZGV2KTsKKworCXJpc2N2X2lvbW11X3JlbW92ZShpb21t
dSk7CisJaW91bm1hcChpb21tdS0+cmVnKTsKKwlwY2lfZnJlZV9pcnFfdmVjdG9ycyhwZGV2KTsK
KwlwY2lfcmVsZWFzZV9yZWdpb25zKHBkZXYpOworCXBjaV9jbGVhcl9tYXN0ZXIocGRldik7CisJ
cGNpX2Rpc2FibGVfZGV2aWNlKHBkZXYpOworfQorCitzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9k
ZXZpY2VfaWQgcmlzY3ZfaW9tbXVfcGNpX3RibFtdID0geworCXtQQ0lfVkVORE9SX0lEX1JJVk9T
LCBQQ0lfREVWSUNFX0lEX1JJVk9TX0lPTU1VLAorCSBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAw
LCAwLCAwfSwKKwl7MCx9Cit9OworCitNT0RVTEVfREVWSUNFX1RBQkxFKHBjaSwgcmlzY3ZfaW9t
bXVfcGNpX3RibCk7CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHJpc2N2X2lv
bW11X29mX21hdGNoW10gPSB7CisJey5jb21wYXRpYmxlID0gInJpc2N2LHBjaS1pb21tdSIsfSwK
Kwl7fSwKK307CisKK01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHJpc2N2X2lvbW11X29mX21hdGNo
KTsKKworc3RhdGljIHN0cnVjdCBwY2lfZHJpdmVyIHJpc2N2X2lvbW11X3BjaV9kcml2ZXIgPSB7
CisJLm5hbWUgPSBLQlVJTERfTU9ETkFNRSwKKwkuaWRfdGFibGUgPSByaXNjdl9pb21tdV9wY2lf
dGJsLAorCS5wcm9iZSA9IHJpc2N2X2lvbW11X3BjaV9wcm9iZSwKKwkucmVtb3ZlID0gcmlzY3Zf
aW9tbXVfcGNpX3JlbW92ZSwKKwkuZHJpdmVyID0geworCQkub2ZfbWF0Y2hfdGFibGUgPSByaXNj
dl9pb21tdV9vZl9tYXRjaCwKKwkJLnN1cHByZXNzX2JpbmRfYXR0cnMgPSB0cnVlLAorCX0sCit9
OworCittb2R1bGVfcGNpX2RyaXZlcihyaXNjdl9pb21tdV9wY2lfZHJpdmVyKTsKLS0gCjIuMzQu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
