Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2AAE7E64D
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 15:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FRbS03LBwt24lmXKbhAldxKKoSuDVTJeqQNmBrFSJ8I=; b=q+jcQ+2FcBsGdD
	DwbZ1oWUvhaaAOwZ9XfERW4NEKrmhOjde/dGb8wAhfPDpZvMZnOHJj/Hpew+pWWWPZHfukYC/EDiE
	RlWG+Z8Tgs5/WC3EkwJL6PE3llO4dWn2KPP1H22NEMQnDtGuZxncVYMHGNPdSWoudJk8atTJcjc6l
	o2fdUCpvCpZENFtSYEx7uBiW1n2Aj9qHX30+VczJRX+NkwhArw7n4AS/rrCmQwOVCBNqxp+ZH6KOc
	Zv5PsFP+3Ij+4v4JZhubv5IQb/4IfACCuTRKfMzCq/xXd0gi3jcT/DZq7ZwSVkJeAmHdmQQIQ16fw
	5UsyDQXyVgAaeJXYy3cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql9bf-00GbRx-0s;
	Tue, 26 Sep 2023 15:04:11 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql9bV-00GbL9-0O
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 15:04:04 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3232e96deaaso657640f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Sep 2023 08:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695740637; x=1696345437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTRkIgCqvbOvq5WltvgZniNquXqWMppNcycuOTnJ1ME=;
        b=aOzZJMqEdGq/ktuxJF3+8xyzqzmVc4o4XMvNy5OJwxBBRAXHKqWDxwne1NFiTE/nS7
         uW5Fjayi0xWIS/IYwuENFA/fbAKi3NLLoDr3fSkGZxzPSN9K/jrYEsRtQtEuCQfh//PH
         KTpyBUMegx2kBjOFXlH/Yb4J9x/i1NwuWomcsuiBnE6eeE0f2CmW4Q2o3LFnb+KGPabw
         VsZrPx5duZxGPcTNeArs1Q6UtfXmKNTMvokhfrTIT108P6hdiO+zdA/lHmcLgn8N93l9
         wMiw3TrrWBQwLBDp+hixsVPHXSHLMDSegLeT5CfWPsV01AeJhMDGgN84/aUX4iYVssk6
         9E0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695740637; x=1696345437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTRkIgCqvbOvq5WltvgZniNquXqWMppNcycuOTnJ1ME=;
        b=LlYEPqooxzifmL0PWEdquOdGn7266ewTaJo6Pb4H+MyOU6VpcQzvY8yGHNxQuD+ya8
         C7WHSdLcPA+0I1oMMDxG9TmfqcL+Z7K6MJ9L1XCldBenRMZTA0MoOLfy48L/eW0724Ey
         b0TZUiA+WrsJSQL2ntLP3u4yfoROgJ4df04QFMVlQq/h5z5oSPoQ7lvP1T8+m6W5aVTU
         9L4CffDM3O/RD9HHbTfW4w6iOXu5UcZFV7lPOjufMl2eTEOr3L2ypLlj3oCW9zvzFxxy
         eVY+keif8VHcii+7tJENCAwPqiRdpKZe8yxL1+BYwzRrNkj3LZP9KBYAxBCmgBpnbHd8
         ynHQ==
X-Gm-Message-State: AOJu0YxyESZgP/pDtTWeWcn+oGytNvoykHJaDCPDYAQikc42bj9Sf2t4
	JS4BWfuNhS//0QvM0BLOw2F6gg==
X-Google-Smtp-Source: AGHT+IF3tl133AyKMYwdf3JEZLgsj3bubF0UkQguDXYTyEpNjLdmnD+OMwVORcOYpBaWMoc41tZGgQ==
X-Received: by 2002:adf:e945:0:b0:31a:e29f:5eab with SMTP id m5-20020adfe945000000b0031ae29f5eabmr8963359wrn.7.1695740637664;
        Tue, 26 Sep 2023 08:03:57 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:2b3d:6c70:9dbf:5ede])
        by smtp.gmail.com with ESMTPSA id x11-20020a5d650b000000b00318147fd2d3sm14926060wru.41.2023.09.26.08.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 08:03:57 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Topel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ron Minnich <rminnich@gmail.com>,
	Daniel Maslowski <cyrevolt@googlemail.com>
Subject: [PATCH 6/7] riscv: report misaligned accesses emulation to hwprobe
Date: Tue, 26 Sep 2023 17:03:15 +0200
Message-Id: <20230926150316.1129648-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230926150316.1129648-1-cleger@rivosinc.com>
References: <20230926150316.1129648-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_080401_160629_39FB9A5C 
X-CRM114-Status: GOOD (  18.25  )
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

aHdwcm9iZSBwcm92aWRlcyBhIHdheSB0byByZXBvcnQgaWYgbWlzYWxpZ25lZCBhY2Nlc3MgYXJl
IGVtdWxhdGVkLiBJbgpvcmRlciB0byBjb3JyZWN0bHkgcG9wdWxhdGUgdGhhdCBmZWF0dXJlLCB3
ZSBjYW4gY2hlY2sgaWYgaXQgYWN0dWFsbHkKdHJhcHMgd2hlbiBkb2luZyBhIG1pc2FsaWduZWQg
YWNjZXNzLiBUaGlzIGNhbiBiZSBjaGVja2VkIHVzaW5nIGFuCmV4Y2VwdGlvbiB0YWJsZSBlbnRy
eSB3aGljaCB3aWxsIGFjdHVhbGx5IGJlIHVzZWQgd2hlbiBhIG1pc2FsaWduZWQKYWNjZXNzIGlz
IGRvbmUgZnJvbSBrZXJuZWwgbW9kZS4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8
Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1
cmUuaCAgfCAgNiArKysKIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAgICB8ICA2
ICsrLQogYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyAgICAgICAgICAgIHwgIDEgKwogYXJjaC9y
aXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIHwgNjMgKysrKysrKysrKysrKysrKysrKysr
KysrKysrLQogNCBmaWxlcyBjaGFuZ2VkLCA3NCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKaW5kZXggZDAzNDViZDY1OWM5Li5jMWYw
ZWYwMmNkN2QgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5o
CisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCkBAIC04LDYgKzgsNyBA
QAogCiAjaW5jbHVkZSA8bGludXgvYml0bWFwLmg+CiAjaW5jbHVkZSA8YXNtL2h3Y2FwLmg+Cisj
aW5jbHVkZSA8YXNtL2h3cHJvYmUuaD4KIAogLyoKICAqIFRoZXNlIGFyZSBwcm9iZWQgdmlhIGEg
ZGV2aWNlX2luaXRjYWxsKCksIHZpYSBlaXRoZXIgdGhlIFNCSSBvciBkaXJlY3RseQpAQCAtMzIs
NCArMzMsOSBAQCBleHRlcm4gc3RydWN0IHJpc2N2X2lzYWluZm8gaGFydF9pc2FbTlJfQ1BVU107
CiAKIHZvaWQgY2hlY2tfdW5hbGlnbmVkX2FjY2VzcyhpbnQgY3B1KTsKIAorYm9vbCB1bmFsaWdu
ZWRfY3RsX2F2YWlsYWJsZSh2b2lkKTsKKworYm9vbCBjaGVja191bmFsaWduZWRfYWNjZXNzX2Vt
dWxhdGVkKGludCBjcHUpOwordm9pZCB1bmFsaWduZWRfZW11bGF0aW9uX2ZpbmlzaCh2b2lkKTsK
KwogI2VuZGlmCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKaW5kZXggMWNmYmJhNjVkMTFhLi5mYmJkZTgw
MGJjMjEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYworKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKQEAgLTU2OCw2ICs1NjgsOSBAQCB2b2lkIGNo
ZWNrX3VuYWxpZ25lZF9hY2Nlc3MoaW50IGNwdSkKIAl2b2lkICpzcmM7CiAJbG9uZyBzcGVlZCA9
IFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9TTE9XOwogCisJaWYgKGNoZWNrX3VuYWxpZ25lZF9h
Y2Nlc3NfZW11bGF0ZWQoY3B1KSkKKwkJcmV0dXJuOworCiAJcGFnZSA9IGFsbG9jX3BhZ2VzKEdG
UF9OT1dBSVQsIGdldF9vcmRlcihNSVNBTElHTkVEX0JVRkZFUl9TSVpFKSk7CiAJaWYgKCFwYWdl
KSB7CiAJCXByX3dhcm4oIkNhbid0IGFsbG9jIHBhZ2VzIHRvIG1lYXN1cmUgbWVtY3B5IHBlcmZv
cm1hbmNlIik7CkBAIC02NDUsOSArNjQ4LDEwIEBAIHZvaWQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vz
cyhpbnQgY3B1KQogCV9fZnJlZV9wYWdlcyhwYWdlLCBnZXRfb3JkZXIoTUlTQUxJR05FRF9CVUZG
RVJfU0laRSkpOwogfQogCi1zdGF0aWMgaW50IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfYm9vdF9j
cHUodm9pZCkKK3N0YXRpYyBpbnQgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfYm9vdF9j
cHUodm9pZCkKIHsKIAljaGVja191bmFsaWduZWRfYWNjZXNzKDApOworCXVuYWxpZ25lZF9lbXVs
YXRpb25fZmluaXNoKCk7CiAJcmV0dXJuIDA7CiB9CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL3NldHVwLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCmluZGV4IGU2MDBhYWIx
MTZhNC4uM2FmNmFkNGRmN2NmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5j
CisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKQEAgLTI2LDYgKzI2LDcgQEAKICNpbmNs
dWRlIDxhc20vYWNwaS5oPgogI2luY2x1ZGUgPGFzbS9hbHRlcm5hdGl2ZS5oPgogI2luY2x1ZGUg
PGFzbS9jYWNoZWZsdXNoLmg+CisjaW5jbHVkZSA8YXNtL2NwdWZlYXR1cmUuaD4KICNpbmNsdWRl
IDxhc20vY3B1X29wcy5oPgogI2luY2x1ZGUgPGFzbS9lYXJseV9pb3JlbWFwLmg+CiAjaW5jbHVk
ZSA8YXNtL3BndGFibGUuaD4KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21p
c2FsaWduZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwppbmRleCBi
NWZiMWZmMDc4ZTMuLmZhODFmNjk1MmZhNCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHNfbWlzYWxpZ25lZC5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWdu
ZWQuYwpAQCAtOSwxMSArOSwxNCBAQAogI2luY2x1ZGUgPGxpbnV4L3BlcmZfZXZlbnQuaD4KICNp
bmNsdWRlIDxsaW51eC9pcnEuaD4KICNpbmNsdWRlIDxsaW51eC9zdHJpbmdpZnkuaD4KKyNpbmNs
dWRlIDxsaW51eC9wcmN0bC5oPgogCiAjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgogI2luY2x1
ZGUgPGFzbS9wdHJhY2UuaD4KICNpbmNsdWRlIDxhc20vY3NyLmg+CiAjaW5jbHVkZSA8YXNtL2Vu
dHJ5LWNvbW1vbi5oPgorI2luY2x1ZGUgPGFzbS9od3Byb2JlLmg+CisjaW5jbHVkZSA8YXNtL2Nw
dWZlYXR1cmUuaD4KIAogI2RlZmluZSBJTlNOX01BVENIX0xCCQkJMHgzCiAjZGVmaW5lIElOU05f
TUFTS19MQgkJCTB4NzA3ZgpAQCAtMzk2LDggKzM5OSwxMCBAQCB1bmlvbiByZWdfZGF0YSB7CiAJ
dTY0IGRhdGFfdTY0OwogfTsKIAorc3RhdGljIGJvb2wgdW5hbGlnbmVkX2N0bCBfX3JlYWRfbW9z
dGx5OworCiAvKiBzeXNjdGwgaG9va3MgKi8KLWludCB1bmFsaWduZWRfZW5hYmxlZCBfX3JlYWRf
bW9zdGx5ID0gMTsJLyogRW5hYmxlZCBieSBkZWZhdWx0ICovCitpbnQgdW5hbGlnbmVkX2VuYWJs
ZWQgX19yZWFkX21vc3RseTsKIAogaW50IGhhbmRsZV9taXNhbGlnbmVkX2xvYWQoc3RydWN0IHB0
X3JlZ3MgKnJlZ3MpCiB7CkBAIC00MTIsNiArNDE3LDkgQEAgaW50IGhhbmRsZV9taXNhbGlnbmVk
X2xvYWQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiAJaWYgKCF1bmFsaWduZWRfZW5hYmxlZCkKIAkJ
cmV0dXJuIC0xOwogCisJaWYgKHVzZXJfbW9kZShyZWdzKSAmJiAoY3VycmVudC0+dGhyZWFkLmFs
aWduX2N0bCAmIFBSX1VOQUxJR05fU0lHQlVTKSkKKwkJcmV0dXJuIC0xOworCiAJaWYgKGdldF9p
bnNuKHJlZ3MsIGVwYywgJmluc24pKQogCQlyZXR1cm4gLTE7CiAKQEAgLTUxMSw2ICs1MTksOSBA
QCBpbnQgaGFuZGxlX21pc2FsaWduZWRfc3RvcmUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiAJaWYg
KCF1bmFsaWduZWRfZW5hYmxlZCkKIAkJcmV0dXJuIC0xOwogCisJaWYgKHVzZXJfbW9kZShyZWdz
KSAmJiAoY3VycmVudC0+dGhyZWFkLmFsaWduX2N0bCAmIFBSX1VOQUxJR05fU0lHQlVTKSkKKwkJ
cmV0dXJuIC0xOworCiAJaWYgKGdldF9pbnNuKHJlZ3MsIGVwYywgJmluc24pKQogCQlyZXR1cm4g
LTE7CiAKQEAgLTU4NSwzICs1OTYsNTMgQEAgaW50IGhhbmRsZV9taXNhbGlnbmVkX3N0b3JlKHN0
cnVjdCBwdF9yZWdzICpyZWdzKQogCiAJcmV0dXJuIDA7CiB9CisKK2Jvb2wgY2hlY2tfdW5hbGln
bmVkX2FjY2Vzc19lbXVsYXRlZChpbnQgY3B1KQoreworCXVuc2lnbmVkIGxvbmcgZW11bGF0ZWQg
PSAxLCB0bXBfdmFyOworCisJLyogVXNlIGEgZml4dXAgdG8gZGV0ZWN0IGlmIG1pc2FsaWduZWQg
YWNjZXNzIHRyaWdnZXJlZCBhbiBleGNlcHRpb24gKi8KKwlfX2FzbV9fIF9fdm9sYXRpbGVfXyAo
CisJCSIxOlxuIgorCQkiCSJSRUdfTCIgJVt0bXBdLCAxKCVbcHRyXSlcbiIKKwkJIglsaSAlW2Vt
dWxhdGVkXSwgMFxuIgorCQkiMjpcbiIKKwkJX0FTTV9FWFRBQkxFKDFiLCAyYikKKwk6IFtlbXVs
YXRlZF0gIityIiAoZW11bGF0ZWQpLCBbdG1wXSAiPXIiICh0bXBfdmFyKQorCTogW3B0cl0gInIi
ICgmdG1wX3ZhcikKKwk6ICJtZW1vcnkiKTsKKworCWlmICghZW11bGF0ZWQpCisJCXJldHVybiBm
YWxzZTsKKworCXBlcl9jcHUobWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQsIGNwdSkgPQorCQlSSVND
Vl9IV1BST0JFX01JU0FMSUdORURfRU1VTEFURUQ7CisKKwlyZXR1cm4gdHJ1ZTsKK30KKwordm9p
ZCBfX2luaXQgdW5hbGlnbmVkX2VtdWxhdGlvbl9maW5pc2godm9pZCkKK3sKKwlpbnQgY3B1Owor
CisJLyoKKwkgKiBXZSBjYW4gb25seSBzdXBwb3J0IFBSX1VOQUxJR04gY29udHJvbHMgaWYgYWxs
IENQVXMgaGF2ZSBtaXNhbGlnbmVkCisJICogYWNjZXNzZXMgZW11bGF0ZWQgc2luY2UgdGFza3Mg
cmVxdWVzdGluZyBzdWNoIGNvbnRyb2wgY2FuIHJ1biBvbiBhbnkKKwkgKiBDUFUuCisJICovCisJ
Zm9yX2VhY2hfcG9zc2libGVfY3B1KGNwdSkgeworCQlpZiAocGVyX2NwdShtaXNhbGlnbmVkX2Fj
Y2Vzc19zcGVlZCwgY3B1KSAhPQorCQkgICAgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxB
VEVEKSB7CisJCQlnb3RvIG91dDsKKwkJfQorCX0KKwl1bmFsaWduZWRfY3RsID0gdHJ1ZTsKKwor
b3V0OgorCXVuYWxpZ25lZF9lbmFibGVkID0gMTsKK30KKworYm9vbCB1bmFsaWduZWRfY3RsX2F2
YWlsYWJsZSh2b2lkKQoreworCXJldHVybiB1bmFsaWduZWRfY3RsOworfQotLSAKMi40MC4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
