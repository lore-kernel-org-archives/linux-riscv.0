Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A486C4828D
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Feb 2024 20:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hJxOgtBUtZv54f8oOoFNliBeK82ONWxk5R6DY0qoFMs=; b=cDzypWPiaOPdGf
	RqKuSQbfVcoFhkDWXtpFS6SHhPXVq99TV7kanUgXWCth+yAIRqKB1RV85siBRWF9ISIyBEBGpeaFi
	/cZfluwf34PwZiq0XAOvO4H/wIEp4zgkSc2MAUG4VHR3rNKqSRLr+v4eK+gNMfDLOdmrWtN7NwLoZ
	r0Dpk3/Lzhxl7R2gNHUbniaplc1Gyvtnhvu0RX1XC11gacTfAXPLtRRBaCZk5vkOJjq6Ee8y+EIse
	RRDLu/CXNvtQ7+fy9uIjB77KGlhTRjo4213v9yfxET5fRHF5KOC8kOnZnJXT+3+X4v+YbDcrSVW2k
	FTUw1cEGR1q7/t8F164Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXSKc-00000008vnO-2IpU;
	Tue, 06 Feb 2024 20:46:14 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXSKa-00000008vmD-0H2g
	for linux-riscv@lists.infradead.org;
	Tue, 06 Feb 2024 20:46:13 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-33b4b121e28so347372f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 06 Feb 2024 12:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707252369; x=1707857169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=faLdI7A4r1MDpBrjBMxPLIztplo9D7QJ5kY725lxPV0=;
        b=ZhiXYxupZ5bHBInyaa77QRWpCn6dj2StJAKAVNQHKPCfNxxtWc4E6ckpMKvReLSBrA
         U12/tFa+kbgtoF2cVGpZsfNXA9RysBW1LSFuDOxOnkb28QqBVlxMOXmUgqv94ChNcb64
         YnX3va84rJhrplCNBAvHQ9tZ+24iZftfU/KkBDXi804l74tyI+m4vHNZo42xk9Mz4azB
         j4yfKrc3NI3IaX3I7CEHqDXHJhUzldxffw7eA3U3cLhAoBJblSfDt5vhieCZG82VQe5t
         TtSxVjgdzhP7djSSX5+oFX/+QTiKBhT+4zdkY4TopGaJCskG+BGghNl1RFeOI6Voj3Fk
         pdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707252369; x=1707857169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=faLdI7A4r1MDpBrjBMxPLIztplo9D7QJ5kY725lxPV0=;
        b=XnHeP7Zqv01YmVsVYnoAo3r3e2SceYIyGR8Dj8E0H8YLpl01FZmvHYTtmWLkgD+r70
         UOGj+YCuGWbm9IyFXcIwl9/f9Ll5sMCz3p77KOq4CxcDsD2OlcK6UxFIVdLeHRPP7STD
         FfPqFklD1YEqnNi/90J4U1NzfhwyqfFvQq8OljLntkktIKQCkHGd2ZG4v7PgwLGtTd7k
         Vvn5grIKtv2VqZfmj1v3lzHPFDGf2xQTFpDe9EsIZGteh2F+0hdEiFe4Q0h7k6eMQ5tS
         cumiQohTBqVK9j/aq4XETJZ05zd5Z25zfGvZshKTMLpvvGtn8qF3NDeEij2nWyjarq7N
         kyGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBmnxAq0nTpjxxbx5RHnLc81h3QSWTk7CZgjgrjPTvNvrhnokh5+A4kCGxa9KLLHusETG29HX7VVzvwpodsmfs2VFl9hH8qMjjF2IywKHz
X-Gm-Message-State: AOJu0YyVUYOqpjd0XN+1zCaDdDB0pmYxlKe3T0m9sZZNg1z6DFDo/4yE
	Cd6fMdn1i/fdKKiZ2cyazz3DeMAX4aFx0ZNABeF6X3Oofkv38j4WXw9gcHjanOQ=
X-Google-Smtp-Source: AGHT+IEUtpL/V/H84vcSbqDS07tiuujHFSTGM+gwxTOny5I+aPToo6WgrtaTz+5XzqRCMAXtUfnEdw==
X-Received: by 2002:adf:ed0e:0:b0:33a:ed2c:fea0 with SMTP id a14-20020adfed0e000000b0033aed2cfea0mr1730381wro.1.1707252369535;
        Tue, 06 Feb 2024 12:46:09 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVs9epp2rKTOZ8O1zlNog/fyR+3mQaCqPMlHSXF7JTIzPZX/1yRh8TSFwpxnlO9lctKVmUqTGRVgOPMLFH+6G6DBquk/RRImJP0cRNRhH82uFzI1tLbHCWZ3HwqQUYxDCha/mIXc4Cstm0th3V8rst8evMx2LQZyYzWMas3RalQdY1CWy2MycJzsGijgQpZkA09Codu0yESXB0n2qQNyg1cMDYzhcNQ2wAVh1cYWqK9whDhOa+cwtQBZaRKrSSyrftwGbyM2ycPGd0C3uWonieJ/HrgNshSMPzageTxbLgyuKaAjkTO6DyT6hyc5nF2/slPvAczakuicpDsvo63Yh4SJsIaC5Wbs8j/msxoTSgjL5lMfohxVa1bnGxhaKwkUGWtllj3kA==
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id l12-20020a5d4bcc000000b0033905a60689sm2899741wrt.45.2024.02.06.12.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 12:46:09 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH] riscv: Fix text patching when icache flushes use IPIs
Date: Tue,  6 Feb 2024 21:46:07 +0100
Message-Id: <20240206204607.527195-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_124612_345696_6EA13A95 
X-CRM114-Status: GOOD (  16.11  )
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

Rm9yIG5vdywgd2UgdXNlIHN0b3BfbWFjaGluZSgpIHRvIHBhdGNoIHRoZSB0ZXh0IGFuZCB3aGVu
IHdlIHVzZSBJUElzIGZvcgpyZW1vdGUgaWNhY2hlIGZsdXNoZXMsIHRoZSBzeXN0ZW0gaGFuZ3Mg
c2luY2UgdGhlIGlycXMgYXJlIGRpc2FibGVkIG9uIGFsbApjcHVzLgoKU28gaW5zdGVhZCwgbWFr
ZSBzdXJlIGV2ZXJ5IGNwdSBleGVjdXRlcyB0aGUgc3RvcF9tYWNoaW5lKCkgcGF0Y2hpbmcKZnVu
Y3Rpb24gd2hpY2ggZW1pdHMgYSBsb2NhbCBpY2FjaGUgZmx1c2ggYW5kIHRoZW4gYXZvaWRzIHRo
ZSB1c2Ugb2YKSVBJcy4KCkNvLWRldmVsb3BlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2
b3NpbmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5j
b20+ClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNv
bT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhdGNoLmggfCAgMSArCiBhcmNoL3Jpc2N2
L2tlcm5lbC9mdHJhY2UuYyAgICAgfCAzOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jICAgICAgfCAxMSArKysrKy0tLS0tCiAzIGZp
bGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGF0Y2guaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGF0Y2guaAppbmRleCBlODhiNTJkMzllYWMuLjlmNWQ2ZTE0YzQwNSAxMDA2NDQKLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYXRjaC5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGF0Y2guaApAQCAtNiw2ICs2LDcgQEAKICNpZm5kZWYgX0FTTV9SSVNDVl9QQVRDSF9ICiAj
ZGVmaW5lIF9BU01fUklTQ1ZfUEFUQ0hfSAogCitpbnQgcGF0Y2hfaW5zbl93cml0ZSh2b2lkICph
ZGRyLCBjb25zdCB2b2lkICppbnNuLCBzaXplX3QgbGVuKTsKIGludCBwYXRjaF90ZXh0X25vc3lu
Yyh2b2lkICphZGRyLCBjb25zdCB2b2lkICppbnNucywgc2l6ZV90IGxlbik7CiBpbnQgcGF0Y2hf
dGV4dF9zZXRfbm9zeW5jKHZvaWQgKmFkZHIsIHU4IGMsIHNpemVfdCBsZW4pOwogaW50IHBhdGNo
X3RleHQodm9pZCAqYWRkciwgdTMyICppbnNucywgaW50IG5pbnNucyk7CmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9mdHJhY2UuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2Z0cmFjZS5jCmlu
ZGV4IGY1YWEyNGQ5ZTFjMS4uMTY5NGExODYxZDFlIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tl
cm5lbC9mdHJhY2UuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9mdHJhY2UuYwpAQCAtOCw2ICs4
LDcgQEAKICNpbmNsdWRlIDxsaW51eC9mdHJhY2UuaD4KICNpbmNsdWRlIDxsaW51eC91YWNjZXNz
Lmg+CiAjaW5jbHVkZSA8bGludXgvbWVtb3J5Lmg+CisjaW5jbHVkZSA8bGludXgvc3RvcF9tYWNo
aW5lLmg+CiAjaW5jbHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KICNpbmNsdWRlIDxhc20vcGF0Y2gu
aD4KIApAQCAtNzUsOCArNzYsNyBAQCBzdGF0aWMgaW50IF9fZnRyYWNlX21vZGlmeV9jYWxsKHVu
c2lnbmVkIGxvbmcgaG9va19wb3MsIHVuc2lnbmVkIGxvbmcgdGFyZ2V0LAogCQltYWtlX2NhbGxf
dDAoaG9va19wb3MsIHRhcmdldCwgY2FsbCk7CiAKIAkvKiBSZXBsYWNlIHRoZSBhdWlwYy1qYWxy
IHBhaXIgYXQgb25jZS4gUmV0dXJuIC1FUEVSTSBvbiB3cml0ZSBlcnJvci4gKi8KLQlpZiAocGF0
Y2hfdGV4dF9ub3N5bmMKLQkgICAgKCh2b2lkICopaG9va19wb3MsIGVuYWJsZSA/IGNhbGwgOiBu
b3BzLCBNQ09VTlRfSU5TTl9TSVpFKSkKKwlpZiAocGF0Y2hfaW5zbl93cml0ZSgodm9pZCAqKWhv
b2tfcG9zLCBlbmFibGUgPyBjYWxsIDogbm9wcywgTUNPVU5UX0lOU05fU0laRSkpCiAJCXJldHVy
biAtRVBFUk07CiAKIAlyZXR1cm4gMDsKQEAgLTg4LDcgKzg4LDcgQEAgaW50IGZ0cmFjZV9tYWtl
X2NhbGwoc3RydWN0IGR5bl9mdHJhY2UgKnJlYywgdW5zaWduZWQgbG9uZyBhZGRyKQogCiAJbWFr
ZV9jYWxsX3QwKHJlYy0+aXAsIGFkZHIsIGNhbGwpOwogCi0JaWYgKHBhdGNoX3RleHRfbm9zeW5j
KCh2b2lkICopcmVjLT5pcCwgY2FsbCwgTUNPVU5UX0lOU05fU0laRSkpCisJaWYgKHBhdGNoX2lu
c25fd3JpdGUoKHZvaWQgKilyZWMtPmlwLCBjYWxsLCBNQ09VTlRfSU5TTl9TSVpFKSkKIAkJcmV0
dXJuIC1FUEVSTTsKIAogCXJldHVybiAwOwpAQCAtOTksNyArOTksNyBAQCBpbnQgZnRyYWNlX21h
a2Vfbm9wKHN0cnVjdCBtb2R1bGUgKm1vZCwgc3RydWN0IGR5bl9mdHJhY2UgKnJlYywKIHsKIAl1
bnNpZ25lZCBpbnQgbm9wc1syXSA9IHtOT1A0LCBOT1A0fTsKIAotCWlmIChwYXRjaF90ZXh0X25v
c3luYygodm9pZCAqKXJlYy0+aXAsIG5vcHMsIE1DT1VOVF9JTlNOX1NJWkUpKQorCWlmIChwYXRj
aF9pbnNuX3dyaXRlKCh2b2lkICopcmVjLT5pcCwgbm9wcywgTUNPVU5UX0lOU05fU0laRSkpCiAJ
CXJldHVybiAtRVBFUk07CiAKIAlyZXR1cm4gMDsKQEAgLTEzNCw2ICsxMzQsMzYgQEAgaW50IGZ0
cmFjZV91cGRhdGVfZnRyYWNlX2Z1bmMoZnRyYWNlX2Z1bmNfdCBmdW5jKQogCiAJcmV0dXJuIHJl
dDsKIH0KKworc3RydWN0IGZ0cmFjZV9tb2RpZnlfcGFyYW0geworCWludCBjb21tYW5kOworCWF0
b21pY190IGNwdV9jb3VudDsKK307CisKK3N0YXRpYyBpbnQgX19mdHJhY2VfbW9kaWZ5X2NvZGUo
dm9pZCAqZGF0YSkKK3sKKwlzdHJ1Y3QgZnRyYWNlX21vZGlmeV9wYXJhbSAqcGFyYW0gPSBkYXRh
OworCisJaWYgKGF0b21pY19pbmNfcmV0dXJuKCZwYXJhbS0+Y3B1X2NvdW50KSA9PSBudW1fb25s
aW5lX2NwdXMoKSkgeworCQlmdHJhY2VfbW9kaWZ5X2FsbF9jb2RlKHBhcmFtLT5jb21tYW5kKTsK
KwkJYXRvbWljX2luYygmcGFyYW0tPmNwdV9jb3VudCk7CisJfSBlbHNlIHsKKwkJd2hpbGUgKGF0
b21pY19yZWFkKCZwYXJhbS0+Y3B1X2NvdW50KSA8PSBudW1fb25saW5lX2NwdXMoKSkKKwkJCWNw
dV9yZWxheCgpOworCQlzbXBfbWIoKTsKKwl9CisKKwlsb2NhbF9mbHVzaF9pY2FjaGVfYWxsKCk7
CisKKwlyZXR1cm4gMDsKK30KKwordm9pZCBhcmNoX2Z0cmFjZV91cGRhdGVfY29kZShpbnQgY29t
bWFuZCkKK3sKKwlzdHJ1Y3QgZnRyYWNlX21vZGlmeV9wYXJhbSBwYXJhbSA9IHsgY29tbWFuZCwg
QVRPTUlDX0lOSVQoMCkgfTsKKworCXN0b3BfbWFjaGluZShfX2Z0cmFjZV9tb2RpZnlfY29kZSwg
JnBhcmFtLCBjcHVfb25saW5lX21hc2spOworfQogI2VuZGlmCiAKICNpZmRlZiBDT05GSUdfRFlO
QU1JQ19GVFJBQ0VfV0lUSF9SRUdTCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRj
aC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwppbmRleCAzN2U4N2ZkY2Y2YTAuLmVjNzc2
MGE0ZDZjZCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYworKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9wYXRjaC5jCkBAIC0xODgsNyArMTg4LDcgQEAgaW50IHBhdGNoX3RleHRf
c2V0X25vc3luYyh2b2lkICphZGRyLCB1OCBjLCBzaXplX3QgbGVuKQogfQogTk9LUFJPQkVfU1lN
Qk9MKHBhdGNoX3RleHRfc2V0X25vc3luYyk7CiAKLXN0YXRpYyBpbnQgcGF0Y2hfaW5zbl93cml0
ZSh2b2lkICphZGRyLCBjb25zdCB2b2lkICppbnNuLCBzaXplX3QgbGVuKQoraW50IHBhdGNoX2lu
c25fd3JpdGUodm9pZCAqYWRkciwgY29uc3Qgdm9pZCAqaW5zbiwgc2l6ZV90IGxlbikKIHsKIAlz
aXplX3QgcGF0Y2hlZCA9IDA7CiAJc2l6ZV90IHNpemU7CkBAIC0yMTEsMTEgKzIxMSw5IEBAIE5P
S1BST0JFX1NZTUJPTChwYXRjaF9pbnNuX3dyaXRlKTsKIAogaW50IHBhdGNoX3RleHRfbm9zeW5j
KHZvaWQgKmFkZHIsIGNvbnN0IHZvaWQgKmluc25zLCBzaXplX3QgbGVuKQogewotCXUzMiAqdHAg
PSBhZGRyOwogCWludCByZXQ7CiAKLQlyZXQgPSBwYXRjaF9pbnNuX3dyaXRlKHRwLCBpbnNucywg
bGVuKTsKLQorCXJldCA9IHBhdGNoX2luc25fd3JpdGUoYWRkciwgaW5zbnMsIGxlbik7CiAJaWYg
KCFyZXQpCiAJCWZsdXNoX2ljYWNoZV9yYW5nZSgodWludHB0cl90KSB0cCwgKHVpbnRwdHJfdCkg
dHAgKyBsZW4pOwogCkBAIC0yMzIsOCArMjMwLDcgQEAgc3RhdGljIGludCBwYXRjaF90ZXh0X2Ni
KHZvaWQgKmRhdGEpCiAJaWYgKGF0b21pY19pbmNfcmV0dXJuKCZwYXRjaC0+Y3B1X2NvdW50KSA9
PSBudW1fb25saW5lX2NwdXMoKSkgewogCQlmb3IgKGkgPSAwOyByZXQgPT0gMCAmJiBpIDwgcGF0
Y2gtPm5pbnNuczsgaSsrKSB7CiAJCQlsZW4gPSBHRVRfSU5TTl9MRU5HVEgocGF0Y2gtPmluc25z
W2ldKTsKLQkJCXJldCA9IHBhdGNoX3RleHRfbm9zeW5jKHBhdGNoLT5hZGRyICsgaSAqIGxlbiwK
LQkJCQkJCSZwYXRjaC0+aW5zbnNbaV0sIGxlbik7CisJCQlyZXQgPSBwYXRjaF9pbnNuX3dyaXRl
KHBhdGNoLT5hZGRyICsgaSAqIGxlbiwgJnBhdGNoLT5pbnNuc1tpXSwgbGVuKTsKIAkJfQogCQlh
dG9taWNfaW5jKCZwYXRjaC0+Y3B1X2NvdW50KTsKIAl9IGVsc2UgewpAQCAtMjQyLDYgKzIzOSw4
IEBAIHN0YXRpYyBpbnQgcGF0Y2hfdGV4dF9jYih2b2lkICpkYXRhKQogCQlzbXBfbWIoKTsKIAl9
CiAKKwlsb2NhbF9mbHVzaF9pY2FjaGVfYWxsKCk7CisKIAlyZXR1cm4gcmV0OwogfQogTk9LUFJP
QkVfU1lNQk9MKHBhdGNoX3RleHRfY2IpOwotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
