Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92483C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 12:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mpp8vDXHvWCNWcnO8chuwNr0iqFKl6zBeS5SpExdTM4=; b=XqI4dLpcQduBes
	VfSOjQBmGg4rw2HB0zZZglZdbvRh01VHCsTByihPx+bSdVKot1kZN+k3d/wcGck9gzxTHGWk5/U5z
	Vx86PZKb49am6lfZ5n7iTWjykd2/UiPEuMju3s7zyWGkJa9iUF34SVoav3tSU59h38/n7N8RQM6Wx
	DRCavLR5FG95QnWGS47AoaF4abH50tY71VNMwiEd7ePqrZqdpX1iGkj0dQ45HGAEEUJHAmrToSX7Y
	oFAPDNr2C10bPgul0SYQbRua7HppmKd16qd1N3DDOb1+oPqjj1ORl5dbaRej5VH5KXJ9eyFoCLK4u
	2jzlgI6SD7wJ7qFluyBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFVN-0000000HSkE-1Q0j;
	Tue, 23 Apr 2024 12:44:13 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFUx-0000000HSNs-2wtE
	for linux-riscv@lists.infradead.org;
	Tue, 23 Apr 2024 12:43:49 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-349fd1d3723so1073692f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Apr 2024 05:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713876225; x=1714481025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t82SHWSKnQwBrCB557sYOimgSCzDvuCob+i4t0Pqx/Q=;
        b=ngW2B4v3rkmZ1lrA/OB7O4U46IzaIa81vbfiSnf2yGvuN3jB8pKHEGoA8ZGyK4QoFC
         t7tZGt3/H76pCTHuuvmBkrgvVsccc718W0xUsLHLLMFbyhrMk369WpD/yvjXblSBigy1
         S/EGIQgCDLnz9iDnATFZhm9cQcyPfR0UDchyZuNOTnU0wUfarWR7/oZuDnq7ev7PrpB1
         WitVZEKyR8lr/fx2kklACXdecR8ej82BrTDSJWfD+8qZqi3TTtk0Cdsz/oWvMd/EiESJ
         ug/q6HM9+lc2JSZ3obMMwohI1sK7E/S4MYptucMHCDSSLW/Fjae6M9DgxTQjdWRuBIFH
         9eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876225; x=1714481025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t82SHWSKnQwBrCB557sYOimgSCzDvuCob+i4t0Pqx/Q=;
        b=tv1RLGEkAL4PErlbPMR2Owl1MUMnKZ4pPdVmoLuS1UgkGvc+hnR2lGCyjDePKCuQqk
         Ectam3iQQk+J50Bx0HvX+MyaDhYlkKWkvST7RgvhVdGpEs1sVKt3wIbhMOE/IlxW2l+y
         w8qfIyvms05MlEYzH+j5NrzHIura3tLcaUnxvEUMO5Vk+7HQt3Oc0iVUFYtBJ4DTBvAz
         nhQDQPcJUWRm93YdqbyjF3vorflrnoKLXWWpls8FRZhqPdSlQzuBlGgFa2MjU6oTtUsJ
         n0c7ma6eRT6lMrn/sVdAkCTbHzEBtRqcCahB3JjXgNjv1xbnJ1Mu4nmsHCTlvO8ruWVn
         tHeg==
X-Forwarded-Encrypted: i=1; AJvYcCV8W2D9UIe1JR+bL/cD/kDvw7eUJTzJ7PHfdXPOSA6/3jFcstQK89YipFkaJYXMvDWzHWGkjayMKRdnjFcCDAjFBsoER9sr8lwv7APg8SAN
X-Gm-Message-State: AOJu0YwYAYi8lEHJkFX3Fkyr7j6yJKTjKmn16rDM74nSM4KFhhcrYJBk
	GMsr8VC0WzO7gvzUI7lr/IaN9RRaL28qdWdgnlNjQNiymmFf3SwV5yjdPevQy7A=
X-Google-Smtp-Source: AGHT+IE/eueGlNPIrUduJCVDegDdMKs05ZlFrNlzlIPU89DYEz6J20JSDrHNrjRsKkBm1vefWMRNGw==
X-Received: by 2002:adf:ce02:0:b0:34a:f7f8:807 with SMTP id p2-20020adfce02000000b0034af7f80807mr5046634wrn.5.1713876225582;
        Tue, 23 Apr 2024 05:43:45 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:71cb:1f75:7053:849c])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b00418a386c059sm19975709wmo.42.2024.04.23.05.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:43:44 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v3 04/11] riscv: hwprobe: export Zca, Zcf, Zcd and Zcb ISA extensions
Date: Tue, 23 Apr 2024 14:43:18 +0200
Message-ID: <20240423124326.2532796-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423124326.2532796-1-cleger@rivosinc.com>
References: <20240423124326.2532796-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_054347_897145_0964633D 
X-CRM114-Status: GOOD (  10.50  )
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

RXhwb3J0IFpjYSwgWmNmLCBaY2QgYW5kIFpjYiBJU0EgZXh0ZW5zaW9uIHRocm91Z2ggaHdwcm9i
ZS4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4K
LS0tCiBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgIHwgMjAgKysrKysrKysr
KysrKysrKysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggfCAgNCAr
KysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAgIHwgIDQgKysrKwogMyBm
aWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJv
YmUucnN0CmluZGV4IDljYTViMDkzYjZkNS4uYmY5NmI0ZThiYTNiIDEwMDY0NAotLS0gYS9Eb2N1
bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9hcmNo
L3Jpc2N2L2h3cHJvYmUucnN0CkBAIC0xOTIsNiArMTkyLDI2IEBAIFRoZSBmb2xsb3dpbmcga2V5
cyBhcmUgZGVmaW5lZDoKICAgICAgICBzdXBwb3J0ZWQgYXMgZGVmaW5lZCBpbiB0aGUgUklTQy1W
IElTQSBtYW51YWwgc3RhcnRpbmcgZnJvbSBjb21taXQKICAgICAgICA1ODIyMDYxNGE1ZiAoIlpp
bW9wIGlzIHJhdGlmaWVkLzEuMCIpLgogCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhU
X1pDQWA6IFRoZSBaY2EgZXh0ZW5zaW9uIHBhcnQgb2YgWmMqIHN0YW5kYXJkCisgICAgICAgZXh0
ZW5zaW9ucyBmb3IgY29kZSBzaXplIHJlZHVjdGlvbiwgYXMgcmF0aWZpZWQgaW4gY29tbWl0IDhi
ZTM0MTljMWMwCisgICAgICAgKCJaY2YgZG9lc24ndCBleGlzdCBvbiBSVjY0IGFzIGl0IGNvbnRh
aW5zIG5vIGluc3RydWN0aW9ucyIpIG9mCisgICAgICAgcmlzY3YtY29kZS1zaXplLXJlZHVjdGlv
bi4KKworICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aQ0JgOiBUaGUgWmNiIGV4dGVu
c2lvbiBwYXJ0IG9mIFpjKiBzdGFuZGFyZAorICAgICAgIGV4dGVuc2lvbnMgZm9yIGNvZGUgc2l6
ZSByZWR1Y3Rpb24sIGFzIHJhdGlmaWVkIGluIGNvbW1pdCA4YmUzNDE5YzFjMAorICAgICAgICgi
WmNmIGRvZXNuJ3QgZXhpc3Qgb24gUlY2NCBhcyBpdCBjb250YWlucyBubyBpbnN0cnVjdGlvbnMi
KSBvZgorICAgICAgIHJpc2N2LWNvZGUtc2l6ZS1yZWR1Y3Rpb24uCisKKyAgKiA6YzptYWNybzpg
UklTQ1ZfSFdQUk9CRV9FWFRfWkNEYDogVGhlIFpjZCBleHRlbnNpb24gcGFydCBvZiBaYyogc3Rh
bmRhcmQKKyAgICAgICBleHRlbnNpb25zIGZvciBjb2RlIHNpemUgcmVkdWN0aW9uLCBhcyByYXRp
ZmllZCBpbiBjb21taXQgOGJlMzQxOWMxYzAKKyAgICAgICAoIlpjZiBkb2Vzbid0IGV4aXN0IG9u
IFJWNjQgYXMgaXQgY29udGFpbnMgbm8gaW5zdHJ1Y3Rpb25zIikgb2YKKyAgICAgICByaXNjdi1j
b2RlLXNpemUtcmVkdWN0aW9uLgorCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pD
RmA6IFRoZSBaY2YgZXh0ZW5zaW9uIHBhcnQgb2YgWmMqIHN0YW5kYXJkCisgICAgICAgZXh0ZW5z
aW9ucyBmb3IgY29kZSBzaXplIHJlZHVjdGlvbiwgYXMgcmF0aWZpZWQgaW4gY29tbWl0IDhiZTM0
MTljMWMwCisgICAgICAgKCJaY2YgZG9lc24ndCBleGlzdCBvbiBSVjY0IGFzIGl0IGNvbnRhaW5z
IG5vIGluc3RydWN0aW9ucyIpIG9mCisgICAgICAgcmlzY3YtY29kZS1zaXplLXJlZHVjdGlvbi4K
KwogKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wYDogQSBiaXRtYXNrIHRo
YXQgY29udGFpbnMgcGVyZm9ybWFuY2UKICAgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHNlbGVjdGVk
IHNldCBvZiBwcm9jZXNzb3JzLgogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaApp
bmRleCBhYzY4NzRhYjc0M2EuLmRkNGFkNzdmYWY0OSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20vaHdwcm9iZS5oCkBAIC02MCw2ICs2MCwxMCBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAj
ZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQUNBUwkJKDFVTEwgPDwgMzQpCiAjZGVmaW5lCQlS
SVNDVl9IV1BST0JFX0VYVF9aSUNPTkQJKDFVTEwgPDwgMzUpCiAjZGVmaW5lCQlSSVNDVl9IV1BS
T0JFX0VYVF9aSU1PUAkJKDFVTEwgPDwgMzYpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9a
Q0EJCSgxVUxMIDw8IDM3KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkNCCQkoMVVMTCA8
PCAzOCkKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pDRAkJKDFVTEwgPDwgMzkpCisjZGVm
aW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQ0YJCSgxVUxMIDw8IDQwKQogI2RlZmluZSBSSVNDVl9I
V1BST0JFX0tFWV9DUFVQRVJGXzAJNQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVE
X1VOS05PV04JKDAgPDwgMCkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9FTVVM
QVRFRAkoMSA8PCAwKQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUu
YyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKaW5kZXggYzk5YTRjZjIzMWM1Li4y
ZmZhMGZlNTEwMWUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMK
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwpAQCAtMTEyLDYgKzExMiw4IEBA
IHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIs
CiAJCUVYVF9LRVkoWkFDQVMpOwogCQlFWFRfS0VZKFpJQ09ORCk7CiAJCUVYVF9LRVkoWklNT1Ap
OworCQlFWFRfS0VZKFpDQSk7CisJCUVYVF9LRVkoWkNCKTsKIAogCQlpZiAoaGFzX3ZlY3Rvcigp
KSB7CiAJCQlFWFRfS0VZKFpWQkIpOwpAQCAtMTMyLDYgKzEzNCw4IEBAIHN0YXRpYyB2b2lkIGh3
cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCQlFWFRfS0VZKFpG
SCk7CiAJCQlFWFRfS0VZKFpGSE1JTik7CiAJCQlFWFRfS0VZKFpGQSk7CisJCQlFWFRfS0VZKFpD
RCk7CisJCQlFWFRfS0VZKFpDRik7CiAJCX0KICN1bmRlZiBFWFRfS0VZCiAJfQotLSAKMi40My4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
