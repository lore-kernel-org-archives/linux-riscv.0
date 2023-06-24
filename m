Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDC8EB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 12:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MvzxfiG0DW73wynA1pd+A678uZNkixNL7sLDoqG1nSU=; b=tLSVuP8WqHte7S
	On3c2N5cPb0YIFX9vZj1wvGzzjRKDSsGdH5AxozV5NgDOB0aev07CZHoTWy1MrPIn8uLWp666IzNX
	kxC/uBe5UteL9B7egWITj+KB0bbf5PKrkXk1cYRTdgJhdNfdG2rJ7S1coWlzdYsTlXdAeI/AQi/Qy
	83T+Dt6AOdeWe+Qe+SE65GYPHKn9uuIGXslSkRy5JP89CyPSskg6Z3dzrfYf8oe+K5090l3LCFeXX
	NaiMxFTGBLWC0uSduxXQlgbjLYcp7hpZnFeCH/vpN6hX19ozDzdIUFUUii/CNRS6aGLF7EwHcbsBv
	bqWFsg+msEykGJf5nYpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qD2GL-005wsP-2q;
	Sat, 24 Jun 2023 12:21:09 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qD2GF-005wms-0L
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jun 2023 12:21:04 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f80cbc37c5so4395435e9.1
        for <linux-riscv@lists.infradead.org>; Sat, 24 Jun 2023 05:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687609261; x=1690201261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFR35YNaQcGqljtTqigZb96yicyQhSfPK+W1MwtG1Qc=;
        b=fQ0Jj0/g8hraC+//ujaUdGnISdJuhZSqzlYtTNJFkbqaAQn94ZS1MRbEZ/6hlB+iZi
         +LrsgtrLieSflMBQqSa4DikDXR/EFQ3cOO5RmtXSIGDAGfRWturi1KhTux4m0ZmeAVGi
         YiS2wOrizlJJO9TwgSjc884uuBSQ5vSJsopmCYPSllwDhRKrQ+YT/vjRxFLdOXzB1K8R
         P1+1SIalQbR0Js89SZGXDMNcCR/sGBy1Q0DZiQ9FBNJnasfgUAj1UXcjYNE6KpwyUOs7
         y2+eoAsfUuoSbjIx1AsXyRBkwHAf4zuUab8EjVYOtvwFyZTlIgvGT1S+mG1yfWeCy1Gy
         kqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687609261; x=1690201261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFR35YNaQcGqljtTqigZb96yicyQhSfPK+W1MwtG1Qc=;
        b=UzlgSCGbrF4CqopjY3kZknc0mCzI1fthd6PG9+5FvXUdGs2hq19wruoM5O9s30Du0/
         7g9GobyZCnosEMecRsScIPf2QK39P7q1Jfkk5kVY9FGidiry1DMp5CQSMfDAhmLDmX9B
         TVDsOFgUxcDveHlF/2NgK5j9GpsTYkuxOda8QczYWU3ORnbfIcIYxKhXFo3v8j5Qjg0a
         V8pWI9suc/QWMvEypAAtwjskaXzIiKyT8G8A3qFHg9GzLRF/D5v02JR1SM3g1iogO8BG
         Autx+qw6tGMKB8sYtfnXGJuPk7JtrUra+DKec/LlvgPzkS2aRqz4CYW4Geiu/2SmqBC+
         nA2Q==
X-Gm-Message-State: AC+VfDxEATDK5Wk8lLVhhpW90/lwcZ2g26XgmEjNzfLLdUJhXRi9+Kbp
	OUF6WqH2+F9ZKLUGlfC5gOQaVg==
X-Google-Smtp-Source: ACHHUZ7Y/lLiiw2Du4ptFpQIG4DBcgnXX9ZY5s4tkti3QpKLzjg9BTlNfa3GoOtgo9F54jtJgwXTTg==
X-Received: by 2002:a1c:ed05:0:b0:3f5:927:2b35 with SMTP id l5-20020a1ced05000000b003f509272b35mr20797437wmh.1.1687609260981;
        Sat, 24 Jun 2023 05:21:00 -0700 (PDT)
Received: from carbon-x1.home ([2a01:cb15:81c2:f100:94c1:d2b1:7300:5620])
        by smtp.gmail.com with ESMTPSA id y15-20020a7bcd8f000000b003f8f9ab6f30sm2058823wmj.20.2023.06.24.05.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jun 2023 05:21:00 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Stafford Horne <shorne@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Michael Ellerman <mpe@ellerman.id.au>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 4/6] riscv: add support for SBI misalignment trap delegation
Date: Sat, 24 Jun 2023 14:20:47 +0200
Message-Id: <20230624122049.7886-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230624122049.7886-1-cleger@rivosinc.com>
References: <20230624122049.7886-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_052103_147863_7B5FF61D 
X-CRM114-Status: GOOD (  18.45  )
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

QWRkIHN1cHBvcnQgZm9yIG1pc2FsaWdubWVudCB0cmFwIGRlbGVnYXRpb24gYnkgc2V0dGluZyBp
dCB3aXRoClNCSV9FWFRfRldfRkVBVFVSRSBTQkkgZXh0ZW5zaW9uLiBUaGlzIGV4dGVuc2lvbiBh
bGxvd3MgdG8gY29udHJvbCBTQkkKYmVoYXZpb3IgYnkgcmVxdWVzdGluZyB0byBzZXQgdGhlbSB0
byBzcGVjaWZpYyB2YWx1ZS4gSW4gb3JkZXIgdG8KaW1wbGVtZW50IHByY3RsKFBSX1NFVF9VTkFM
SUdOLCBQUl9VTkFMSUdOX1NJR0JVUykgYmVoYXZpb3IgcHJvcGVybHksIHdlCm5lZWQgdG8gbGV0
IHRoZSBrZXJuZWwgaGFuZGxlIHRoZSBtaXNhbGlnbm1lbnQgZXJyb3IgYnkgaXRzZWxmLiBUaGlz
CmNvbW1pdCBhZGRzIHRoZSBzYmlfZGVsZWdhdGVfbWlzYWxpZ25lZCgpIGZ1bmN0aW9uIHRvIGNo
ZWNrIGlmIHRoZSBTQkkKZGVsZWdhdGVkIHVzIHRoZSBtaXNhbGlnbmVtZW50IGhhbmRsaW5nLiBU
aGUgdmFsdWUgcmV0dXJuZWQgYnkgdGhpcwpmdW5jdGlvbiBpcyBpbml0aWFsaXplIGF0IGluaXQg
dGltZSBmcm9tIHNiaV9pbml0KCkuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNs
ZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCB8IDEy
ICsrKysrKysrKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgICAgICB8IDI4ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3NiaS5oCmluZGV4IDViNGExYmY1ZjQzOS4uOTdjMmI1ZDZhYmZmIDEwMDY0NAot
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vc2JpLmgKQEAgLTMwLDYgKzMwLDcgQEAgZW51bSBzYmlfZXh0X2lkIHsKIAlTQklfRVhU
X0hTTSA9IDB4NDg1MzRELAogCVNCSV9FWFRfU1JTVCA9IDB4NTM1MjUzNTQsCiAJU0JJX0VYVF9Q
TVUgPSAweDUwNEQ1NSwKKwlTQklfRVhUX0ZXX0ZFQVRVUkUgPSAweDQ2NTc0NjU0LAogCiAJLyog
RXhwZXJpbWVudGFscyBleHRlbnNpb25zIG11c3QgbGllIHdpdGhpbiB0aGlzIHJhbmdlICovCiAJ
U0JJX0VYVF9FWFBFUklNRU5UQUxfU1RBUlQgPSAweDA4MDAwMDAwLApAQCAtMjM2LDYgKzIzNywx
NiBAQCBlbnVtIHNiaV9wbXVfY3RyX3R5cGUgewogLyogRmxhZ3MgZGVmaW5lZCBmb3IgY291bnRl
ciBzdG9wIGZ1bmN0aW9uICovCiAjZGVmaW5lIFNCSV9QTVVfU1RPUF9GTEFHX1JFU0VUICgxIDw8
IDApCiAKKy8qIFNCSSBmdW5jdGlvbiBJRHMgZm9yIEZXIGZlYXR1cmUgZXh0ZW5zaW9uICovCisj
ZGVmaW5lIFNCSV9FWFRfRldfRkVBVFVSRV9TRVQJCTB4MAorI2RlZmluZSBTQklfRVhUX0ZXX0ZF
QVRVUkVfR0VUCQkweDEKKworZW51bSBzYmlfZndfZmVhdHVyZXNfdCB7CisJU0JJX0ZXX0ZFQVRV
UkVfTUlTQUxJR05FRF9ERUxFRwk9IDAsCisKKwlTQklfRldfRkVBVFVSRV9NQVgsCit9OworCiAj
ZGVmaW5lIFNCSV9TUEVDX1ZFUlNJT05fREVGQVVMVAkweDEKICNkZWZpbmUgU0JJX1NQRUNfVkVS
U0lPTl9NQUpPUl9TSElGVAkyNAogI2RlZmluZSBTQklfU1BFQ19WRVJTSU9OX01BSk9SX01BU0sJ
MHg3ZgpAQCAtMjY5LDYgKzI4MCw3IEBAIGludCBzYmlfY29uc29sZV9nZXRjaGFyKHZvaWQpOwog
bG9uZyBzYmlfZ2V0X212ZW5kb3JpZCh2b2lkKTsKIGxvbmcgc2JpX2dldF9tYXJjaGlkKHZvaWQp
OwogbG9uZyBzYmlfZ2V0X21pbXBpZCh2b2lkKTsKK2Jvb2wgc2JpX2RlbGVnYXRlX21pc2FsaWdu
ZWQodm9pZCk7CiB2b2lkIHNiaV9zZXRfdGltZXIodWludDY0X3Qgc3RpbWVfdmFsdWUpOwogdm9p
ZCBzYmlfc2h1dGRvd24odm9pZCk7CiB2b2lkIHNiaV9zZW5kX2lwaSh1bnNpZ25lZCBpbnQgY3B1
KTsKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvc2JpLmMKaW5kZXggYzY3MmM4YmE5YTJhLi4xOGVmZmQ5ZTZlYTkgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3NiaS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCkBAIC0y
Miw2ICsyMiw4IEBAIHN0YXRpYyBpbnQgKCpfX3NiaV9yZmVuY2UpKGludCBmaWQsIGNvbnN0IHN0
cnVjdCBjcHVtYXNrICpjcHVfbWFzaywKIAkJCSAgIHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2ln
bmVkIGxvbmcgc2l6ZSwKIAkJCSAgIHVuc2lnbmVkIGxvbmcgYXJnNCwgdW5zaWduZWQgbG9uZyBh
cmc1KSBfX3JvX2FmdGVyX2luaXQ7CiAKK3N0YXRpYyBib29sIF9fc2JpX21pc2FsaWduZWRfZGVs
ZWcgX19yb19hZnRlcl9pbml0OworCiBzdHJ1Y3Qgc2JpcmV0IHNiaV9lY2FsbChpbnQgZXh0LCBp
bnQgZmlkLCB1bnNpZ25lZCBsb25nIGFyZzAsCiAJCQl1bnNpZ25lZCBsb25nIGFyZzEsIHVuc2ln
bmVkIGxvbmcgYXJnMiwKIAkJCXVuc2lnbmVkIGxvbmcgYXJnMywgdW5zaWduZWQgbG9uZyBhcmc0
LApAQCAtMzQyLDYgKzM0NCwxMSBAQCBzdGF0aWMgaW50IF9fc2JpX3JmZW5jZV92MDIoaW50IGZp
ZCwgY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNwdV9tYXNrLAogCXJldHVybiAwOwogfQogCitib29s
IHNiaV9kZWxlZ2F0ZV9taXNhbGlnbmVkKHZvaWQpCit7CisJcmV0dXJuIF9fc2JpX21pc2FsaWdu
ZWRfZGVsZWc7Cit9CisKIC8qKgogICogc2JpX3NldF90aW1lcigpIC0gUHJvZ3JhbSB0aGUgdGlt
ZXIgZm9yIG5leHQgdGltZXIgZXZlbnQuCiAgKiBAc3RpbWVfdmFsdWU6IFRoZSB2YWx1ZSBhZnRl
ciB3aGljaCBuZXh0IHRpbWVyIGV2ZW50IHNob3VsZCBmaXJlLgpAQCAtNDk0LDYgKzUwMSwxNiBA
QCBpbnQgc2JpX3JlbW90ZV9oZmVuY2VfdnZtYV9hc2lkKGNvbnN0IHN0cnVjdCBjcHVtYXNrICpj
cHVfbWFzaywKIH0KIEVYUE9SVF9TWU1CT0woc2JpX3JlbW90ZV9oZmVuY2VfdnZtYV9hc2lkKTsK
IAorc3RhdGljIGludCBzYmlfZndfZmVhdHVyZV9zZXQoZW51bSBzYmlfZndfZmVhdHVyZXNfdCBm
ZWF0dXJlLCBib29sIHNldCkKK3sKKwlzdHJ1Y3Qgc2JpcmV0IHJldDsKKworCXJldCA9IHNiaV9l
Y2FsbChTQklfRVhUX0ZXX0ZFQVRVUkUsIFNCSV9FWFRfRldfRkVBVFVSRV9TRVQsIGZlYXR1cmUs
CisJCQlzZXQsIDAsIDAsIDAsIDApOworCisJcmV0dXJuIHNiaV9lcnJfbWFwX2xpbnV4X2Vycm5v
KHJldC5lcnJvcik7Cit9CisKIHN0YXRpYyB2b2lkIHNiaV9zcnN0X3Jlc2V0KHVuc2lnbmVkIGxv
bmcgdHlwZSwgdW5zaWduZWQgbG9uZyByZWFzb24pCiB7CiAJc2JpX2VjYWxsKFNCSV9FWFRfU1JT
VCwgU0JJX0VYVF9TUlNUX1JFU0VULCB0eXBlLCByZWFzb24sCkBAIC02MjQsNiArNjQxLDE3IEBA
IHZvaWQgX19pbml0IHNiaV9pbml0KHZvaWQpCiAJCQlzYmlfc3JzdF9yZWJvb3RfbmIucHJpb3Jp
dHkgPSAxOTI7CiAJCQlyZWdpc3Rlcl9yZXN0YXJ0X2hhbmRsZXIoJnNiaV9zcnN0X3JlYm9vdF9u
Yik7CiAJCX0KKwkJLyoKKwkJICogVE9ETzogdGhpcyB3aWxsIGxpa2VseSBuZWVkIHRvIGJlIHVw
ZGF0ZWQgd2hlbiBTQkkgZXh0ZW5zaW9uCisJCSAqIGlzIHJhdGlmaWVkCisJCSAqLworCQlpZiAo
KHNiaV9zcGVjX3ZlcnNpb24gPj0gc2JpX21rX3ZlcnNpb24oMSwgMCkpICYmCisJCSAgICAoc2Jp
X3Byb2JlX2V4dGVuc2lvbihTQklfRVhUX0ZXX0ZFQVRVUkUpID4gMCkpIHsKKwkJCXByX2luZm8o
IlNCSSBGV19GRUFUVVJFIGV4dGVuc2lvbiBkZXRlY3RlZFxuIik7CisJCQlpZiAoIXNiaV9md19m
ZWF0dXJlX3NldChTQklfRldfRkVBVFVSRV9NSVNBTElHTkVEX0RFTEVHLAorCQkJCQkJdHJ1ZSkp
CisJCQkJX19zYmlfbWlzYWxpZ25lZF9kZWxlZyA9IHRydWU7CisJCX0KIAl9IGVsc2UgewogCQlf
X3NiaV9zZXRfdGltZXIgPSBfX3NiaV9zZXRfdGltZXJfdjAxOwogCQlfX3NiaV9zZW5kX2lwaQk9
IF9fc2JpX3NlbmRfaXBpX3YwMTsKLS0gCjIuNDAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
