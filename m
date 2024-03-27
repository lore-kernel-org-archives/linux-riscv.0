Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC93CD1283
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 10:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jNvMdiH68j7U9CU8S2h45knqGrJCYb8G2LcFTCNWLsg=; b=TvLIc9pB/eYoLd
	T4S9u3FCi30d2UqPd05lLp2nvYe62j4OEFT8PNzRyhrNbU/CcBbq2nfEnYkLi+iB9uXVF89YKJt9L
	E1Oe908Txh1lElXHKG5FviGd/JxZZ9txlu7PbE+tv3Ats5kbW5jy/o10+Bat67VsUO5NYidNOsxg+
	DVt0MIpNwbpxvhaNXbo2DtOTr08NTLV4iVxCDEK4zEFpQQ4U9aEx+BeGiBH2ouGkU/yDJ8oplrJl9
	OJLWgQFgUvCPShxYKK9NpCdRgU514RcyTSxk+0pHnLTIKeIMzqhB39GW8wx7bye7pcAtScz0mNU3y
	S7jsB3BpMXCFebOl5HYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQZT-00000008QJY-400H;
	Wed, 27 Mar 2024 10:31:51 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQZO-00000008QEr-0PB1
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 10:31:48 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-56bc8cfc19fso7271239a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 03:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1711535495; x=1712140295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFFjWbcETbPCVovmbM8tpReuGu8aZixvMHFh/xJCQ5U=;
        b=B+pr8bpDCXazM94BpbGBQz47XcHc3drW9E7Sh1GylG0hsCR6V8WuhvVJRAh20xw4D2
         2DlqZ61iiaFhz/ixULpz9UQD4JmjtKRDvKx62b8/Y9hQSuP3vACP0cE4VeN5cX6TAHrk
         nQxPVyo1xPuBMfzO6xaS+GPSEQYxoO3PqS68o94zJcECGsI4nluJRC4/bgGxKgd/0Zep
         IRI8RrldCxDk8BHs+UGB4q0rg08UYgrGM10ykPfo2Gnjs7//4fMdv044rerNSqHBcae7
         ZlZdjTW31z0t+7U+LHWYSyvgMMmjLypkhg6GF8FhQyI/nc6NatgH+ShCPy3cFSiAU/kb
         fLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711535495; x=1712140295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFFjWbcETbPCVovmbM8tpReuGu8aZixvMHFh/xJCQ5U=;
        b=eOovJUXFUUeQS4PZX2dTK07ThvYi1/5RJ5btoQL68NJR95YQd46O8WlMIzjm3IvtGt
         n2DX0I7xvChZJmyLTC+v+oZmDKnUxiS1UYJ1F23cwJ6spJnygCbEXmVpvEfSGYLjXyAk
         nU6tM4ZpuymuXLFo4RWizQ/dKPtPqCEu7oomUoMhyyKAR/RC0IcQ0N0YrsCGQ9K2xpTq
         zMLdh7HJqxwCsZHfZcZtGydPSuAfA6lwJsAAZp9V304a/fDcCc6OzWBAmRZhGSX0+kUV
         zg4nulK6esFEtNW6NiIGAmWrSoX5quECQPkF/93XPDXBBv8aBoNz5mlO3taRSNcs60c/
         bBfw==
X-Gm-Message-State: AOJu0Yz3+2qdspP0HDFpBEH6dzeTJvjbOWE/w24TKgwo+xnd3vUixZhR
	6W0B9Xp0Ehdgxpfu70soROFi51xz+TjFDVrlctK4GhoFxBSaE1yCNXOqg5Op7XC0++6sM3q6vPO
	RP3w=
X-Google-Smtp-Source: AGHT+IFpb/VYghvSGRAZv/KSjYVbhAxxbRz3wD8nc7CPHRDPIyI0sKYTxchYPDN6RU4YBfPXV3vdmA==
X-Received: by 2002:a17:906:d7ae:b0:a44:4c9e:8809 with SMTP id pk14-20020a170906d7ae00b00a444c9e8809mr2772060ejb.32.1711535494767;
        Wed, 27 Mar 2024 03:31:34 -0700 (PDT)
Received: from antares.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id z15-20020a170906270f00b00a46b8cd9b51sm5294078ejc.185.2024.03.27.03.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 03:31:34 -0700 (PDT)
From: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Cooper Qu <cooper.qu@linux.alibaba.com>,
	Zhiwei Liu <zhiwei_liu@linux.alibaba.com>,
	Huang Tao <eric.huang@linux.alibaba.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH 1/2] riscv: thead: Rename T-Head PBMT to MAEE
Date: Wed, 27 Mar 2024 11:31:29 +0100
Message-ID: <20240327103130.3651950-2-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327103130.3651950-1-christoph.muellner@vrull.eu>
References: <20240327103130.3651950-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_033146_169693_BDADA89D 
X-CRM114-Status: GOOD (  15.39  )
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

VC1IZWFkJ3MgdmVuZG9yIGV4dGVuc2lvbiB0byBzZXQgcGFnZSBhdHRyaWJ1dGVzIGhhcyB0aGUg
bmFtZQpNQUVFIChNTVUgYWRkcmVzcyBhdHRyaWJ1dGUgZXh0ZW5zaW9uKS4KTGV0J3MgcmVuYW1l
IGl0LCBzbyBpdCBpcyBjbGVhciB3aGF0IHRoaXMgcmVmZXJlcyB0by4KClNlZSBhbHNvOgogIGh0
dHBzOi8vZ2l0aHViLmNvbS9ULWhlYWQtU2VtaS90aGVhZC1leHRlbnNpb24tc3BlYy9ibG9iL21h
c3Rlci94dGhlYWRtYWVlLmFkb2MKClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBNw7xsbG5lciA8
Y2hyaXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1PgotLS0KIGFyY2gvcmlzY3YvS2NvbmZpZy5lcnJh
dGEgICAgICAgICAgICB8ICA4ICsrKystLS0tCiBhcmNoL3Jpc2N2L2VycmF0YS90aGVhZC9lcnJh
dGEuYyAgICAgfCAgOCArKysrLS0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFfbGlz
dC5oIHwgMjAgKysrKysrKysrKy0tLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0
aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmln
LmVycmF0YSBiL2FyY2gvcmlzY3YvS2NvbmZpZy5lcnJhdGEKaW5kZXggOTEwYmE4ODM3YWRkLi4y
YzI0YmVmN2UxMTIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZy5lcnJhdGEKKysrIGIv
YXJjaC9yaXNjdi9LY29uZmlnLmVycmF0YQpAQCAtODIsMTQgKzgyLDE0IEBAIGNvbmZpZyBFUlJB
VEFfVEhFQUQKIAogCSAgT3RoZXJ3aXNlLCBwbGVhc2Ugc2F5ICJOIiBoZXJlIHRvIGF2b2lkIHVu
bmVjZXNzYXJ5IG92ZXJoZWFkLgogCi1jb25maWcgRVJSQVRBX1RIRUFEX1BCTVQKLQlib29sICJB
cHBseSBULUhlYWQgbWVtb3J5IHR5cGUgZXJyYXRhIgorY29uZmlnIEVSUkFUQV9USEVBRF9NQUVF
CisJYm9vbCAiQXBwbHkgVC1IZWFkJ3MgTU1VIGFkZHJlc3MgYXR0cmlidXRlIChNQUVFKSIKIAlk
ZXBlbmRzIG9uIEVSUkFUQV9USEVBRCAmJiA2NEJJVCAmJiBNTVUKIAlzZWxlY3QgUklTQ1ZfQUxU
RVJOQVRJVkVfRUFSTFkKIAlkZWZhdWx0IHkKIAloZWxwCi0JICBUaGlzIHdpbGwgYXBwbHkgdGhl
IG1lbW9yeSB0eXBlIGVycmF0YSB0byBoYW5kbGUgdGhlIG5vbi1zdGFuZGFyZAotCSAgbWVtb3J5
IHR5cGUgYml0cyBpbiBwYWdlLXRhYmxlLWVudHJpZXMgb24gVC1IZWFkIFNvQ3MuCisJICBUaGlz
IHdpbGwgYXBwbHkgdGhlIG1lbW9yeSB0eXBlIGVycmF0YSB0byBoYW5kbGUgVC1IZWFkJ3MgTU1V
IGFkZHJlc3MKKwkgIGF0dHJpYnV0ZSBleHRlbnNpb24gKE1BRUUpLgogCiAJICBJZiB5b3UgZG9u
J3Qga25vdyB3aGF0IHRvIGRvIGhlcmUsIHNheSAiWSIuCiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jIGIvYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRh
LmMKaW5kZXggYjFjNDEwYmJjMWFlLi44YzhhOGE0YjA0MjEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jCisrKyBiL2FyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2Vy
cmF0YS5jCkBAIC0xOSwxMCArMTksMTAgQEAKICNpbmNsdWRlIDxhc20vcGF0Y2guaD4KICNpbmNs
dWRlIDxhc20vdmVuZG9yaWRfbGlzdC5oPgogCi1zdGF0aWMgYm9vbCBlcnJhdGFfcHJvYmVfcGJt
dCh1bnNpZ25lZCBpbnQgc3RhZ2UsCitzdGF0aWMgYm9vbCBlcnJhdGFfcHJvYmVfbWFlZSh1bnNp
Z25lZCBpbnQgc3RhZ2UsCiAJCQkgICAgICB1bnNpZ25lZCBsb25nIGFyY2hfaWQsIHVuc2lnbmVk
IGxvbmcgaW1waWQpCiB7Ci0JaWYgKCFJU19FTkFCTEVEKENPTkZJR19FUlJBVEFfVEhFQURfUEJN
VCkpCisJaWYgKCFJU19FTkFCTEVEKENPTkZJR19FUlJBVEFfVEhFQURfTUFFRSkpCiAJCXJldHVy
biBmYWxzZTsKIAogCWlmIChhcmNoX2lkICE9IDAgfHwgaW1waWQgIT0gMCkKQEAgLTE0MCw4ICsx
NDAsOCBAQCBzdGF0aWMgdTMyIHRoZWFkX2VycmF0YV9wcm9iZSh1bnNpZ25lZCBpbnQgc3RhZ2Us
CiB7CiAJdTMyIGNwdV9yZXFfZXJyYXRhID0gMDsKIAotCWlmIChlcnJhdGFfcHJvYmVfcGJtdChz
dGFnZSwgYXJjaGlkLCBpbXBpZCkpCi0JCWNwdV9yZXFfZXJyYXRhIHw9IEJJVChFUlJBVEFfVEhF
QURfUEJNVCk7CisJaWYgKGVycmF0YV9wcm9iZV9tYWVlKHN0YWdlLCBhcmNoaWQsIGltcGlkKSkK
KwkJY3B1X3JlcV9lcnJhdGEgfD0gQklUKEVSUkFUQV9USEVBRF9NQUVFKTsKIAogCWVycmF0YV9w
cm9iZV9jbW8oc3RhZ2UsIGFyY2hpZCwgaW1waWQpOwogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2VycmF0YV9saXN0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VycmF0
YV9saXN0LmgKaW5kZXggZWEzMzI4OGY4YTI1Li43YzM3N2UxMzdiNDEgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2VycmF0YV9saXN0LmgKQEAgLTIzLDcgKzIzLDcgQEAKICNlbmRpZgogCiAjaWZkZWYg
Q09ORklHX0VSUkFUQV9USEVBRAotI2RlZmluZQlFUlJBVEFfVEhFQURfUEJNVCAwCisjZGVmaW5l
CUVSUkFUQV9USEVBRF9NQUVFIDAKICNkZWZpbmUJRVJSQVRBX1RIRUFEX1BNVSAxCiAjZGVmaW5l
CUVSUkFUQV9USEVBRF9OVU1CRVIgMgogI2VuZGlmCkBAIC01MywyMCArNTMsMjAgQEAgYXNtKEFM
VEVSTkFUSVZFKCJzZmVuY2Uudm1hICUwIiwgInNmZW5jZS52bWEiLCBTSUZJVkVfVkVORE9SX0lE
LAlcCiAgKiBpbiB0aGUgZGVmYXVsdCBjYXNlLgogICovCiAjZGVmaW5lIEFMVF9TVlBCTVRfU0hJ
RlQgNjEKLSNkZWZpbmUgQUxUX1RIRUFEX1BCTVRfU0hJRlQgNTkKKyNkZWZpbmUgQUxUX1RIRUFE
X01BRUVfU0hJRlQgNTkKICNkZWZpbmUgQUxUX1NWUEJNVChfdmFsLCBwcm90KQkJCQkJCVwKIGFz
bShBTFRFUk5BVElWRV8yKCJsaSAlMCwgMFx0XG5ub3AiLAkJCQkJXAogCQkgICJsaSAlMCwgJTFc
dFxuc2xsaSAlMCwlMCwlMyIsIDAsCQkJXAogCQkJUklTQ1ZfSVNBX0VYVF9TVlBCTVQsIENPTkZJ
R19SSVNDVl9JU0FfU1ZQQk1ULAlcCiAJCSAgImxpICUwLCAlMlx0XG5zbGxpICUwLCUwLCU0Iiwg
VEhFQURfVkVORE9SX0lELAlcCi0JCQlFUlJBVEFfVEhFQURfUEJNVCwgQ09ORklHX0VSUkFUQV9U
SEVBRF9QQk1UKQlcCisJCQlFUlJBVEFfVEhFQURfTUFFRSwgQ09ORklHX0VSUkFUQV9USEVBRF9N
QUVFKQlcCiAJCTogIj1yIihfdmFsKQkJCQkJCVwKIAkJOiAiSSIocHJvdCMjX1NWUEJNVCA+PiBB
TFRfU1ZQQk1UX1NISUZUKSwJCVwKLQkJICAiSSIocHJvdCMjX1RIRUFEID4+IEFMVF9USEVBRF9Q
Qk1UX1NISUZUKSwJCVwKKwkJICAiSSIocHJvdCMjX1RIRUFEID4+IEFMVF9USEVBRF9NQUVFX1NI
SUZUKSwJCVwKIAkJICAiSSIoQUxUX1NWUEJNVF9TSElGVCksCQkJCVwKLQkJICAiSSIoQUxUX1RI
RUFEX1BCTVRfU0hJRlQpKQorCQkgICJJIihBTFRfVEhFQURfTUFFRV9TSElGVCkpCiAKLSNpZmRl
ZiBDT05GSUdfRVJSQVRBX1RIRUFEX1BCTVQKKyNpZmRlZiBDT05GSUdfRVJSQVRBX1RIRUFEX01B
RUUKIC8qCiAgKiBJTy9OT0NBQ0hFIG1lbW9yeSB0eXBlcyBhcmUgaGFuZGxlZCB0b2dldGhlciB3
aXRoIHN2cGJtdCwKICAqIHNvIG9uIFQtSGVhZCBjaGlwcywgY2hlY2sgaWYgbm8gb3RoZXIgbWVt
b3J5IHR5cGUgaXMgc2V0LApAQCAtODMsMTEgKzgzLDExIEBAIGFzbSB2b2xhdGlsZShBTFRFUk5B
VElWRSgJCQkJCQlcCiAJInNsbGkgICAgdDMsIHQzLCAlM1xuXHQiCQkJCQlcCiAJIm9yICAgICAg
JTAsICUwLCB0M1xuXHQiCQkJCQlcCiAJIjI6IiwgIFRIRUFEX1ZFTkRPUl9JRCwJCQkJCQlcCi0J
CUVSUkFUQV9USEVBRF9QQk1ULCBDT05GSUdfRVJSQVRBX1RIRUFEX1BCTVQpCQlcCisJCUVSUkFU
QV9USEVBRF9NQUVFLCBDT05GSUdfRVJSQVRBX1RIRUFEX01BRUUpCQlcCiAJOiAiK3IiKF92YWwp
CQkJCQkJCVwKLQk6ICJJIihfUEFHRV9NVE1BU0tfVEhFQUQgPj4gQUxUX1RIRUFEX1BCTVRfU0hJ
RlQpLAkJXAotCSAgIkkiKF9QQUdFX1BNQV9USEVBRCA+PiBBTFRfVEhFQURfUEJNVF9TSElGVCks
CQkJXAotCSAgIkkiKEFMVF9USEVBRF9QQk1UX1NISUZUKQkJCQkJXAorCTogIkkiKF9QQUdFX01U
TUFTS19USEVBRCA+PiBBTFRfVEhFQURfTUFFRV9TSElGVCksCQlcCisJICAiSSIoX1BBR0VfUE1B
X1RIRUFEID4+IEFMVF9USEVBRF9NQUVFX1NISUZUKSwJCQlcCisJICAiSSIoQUxUX1RIRUFEX01B
RUVfU0hJRlQpCQkJCQlcCiAJOiAidDMiKQogI2Vsc2UKICNkZWZpbmUgQUxUX1RIRUFEX1BNQShf
dmFsKQotLSAKMi40NC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
