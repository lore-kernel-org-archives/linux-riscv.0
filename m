Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122BEC46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 15:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NE1+WzsS1S30f205vmgax4nIUABj+hiQO8yCneWEllo=; b=bJEp2ifRxW3vcp
	UWjCXFyXCjSpfvkEgH+pAEstRIsGGLjg1ltIkSX4FfJZywVqg6MKbn7TyQvuSVgztwX9XukIjEm63
	LdntI0s0Ob81/oaNs/axBWcn3Uca0zqtmCA2N3WNU6g/a2YpMF9j4st2Gro1AG7Rq14S/MaqWATDd
	cRoSt37VbXHyCLb1CPHBkLr9HXrtnGJH+JLa7iOcBVkjGWPtLbPDHZdRsSYlQySwVnSPTNwISVmOj
	/eHp6TKpz04WncrBpln3G1CUDYH1SVeGfkpSvPDgOm9/MG+R4EmIsIDGAgA/Hkf/8Cesg3JcRArZ+
	NEgjJX9oWOPiABxjaJGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyxB-000KLj-2u;
	Wed, 20 Dec 2023 15:57:49 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyx8-000KIt-0j
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 15:57:47 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40c317ba572so13868495e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 07:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703087862; x=1703692662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxiI83AWHviDA1K2goPpANE3T3h3Nt6zkBhZOZxUOr0=;
        b=cm1DvnYAaTkwxAvfHRkJh1ODBZZxXQM0qqJiGNBEo/bZmD/lt/u+h7494VDIaBgMxM
         oXqDSL6GJQg6wf/STiRlMZcNroMHis38zciUiwuv8xfGapQNahcJSjoerBG6Q3te0CJq
         j5gwq0PKkWzl4NhOPntVvKihh1+mpvXF6OR3e28T+ti9ozxkuX2A7MAY7pI7hW4o7UZE
         oyDyVqQAY6XYeyd7UtuEXqVs+kZ3vxFHfSQVUSQa7UJ7Tpo0/U4O+I7ATY0Vb6GzPEWl
         3NbFIrNJMRq9CRfd/I/LynECtkYxFLZT2TGlydqQyyVZv3W19uZ9QAFLrTf8/lztcWzk
         sRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703087862; x=1703692662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxiI83AWHviDA1K2goPpANE3T3h3Nt6zkBhZOZxUOr0=;
        b=DTMnMlqDIVogpLHSKG+eRBOdaYCm/BObikzW63UPvUo1BSMZFSSHJxtZNyJv+/6m0r
         0HBlPaXeeUF46fS87JOsD8Hot0JPzADBzyjU386lGrS8u934/gR7QKgc5FLysE8CJ5ZW
         THAu+0jjoXcny5jOdjKhPPKU1AmCVSXluG/5OpllBsFXwo3Eh4tK2oaRmXM6qi55dUwS
         OFDGSZEUCbOEp82kIiLic+JSsI+92CKpJBYSBFGJpgCGSx1bbwdy7cjdM3zQ8+SCsYqf
         DDBA2zY85UkQC/op//oMshliDZrf2oIvTQXfcw8zUK37ZQVktT7UWzVkvWiclEys4bXu
         AHSw==
X-Gm-Message-State: AOJu0YwJM7RmeAqMcPBBj7YvRqK00qr1MfnCtorluHZE/1/UNampRMc4
	qrzeN0ADFCiaxEd9qd8dAT+6PA==
X-Google-Smtp-Source: AGHT+IFJbjR0PbYZ8f2Ct75zHWOpr+wt21lqG0IGhwGx4TEjDmQ++1Z336t5tRomVVKE9Pyr/5CpGA==
X-Received: by 2002:a05:600c:214c:b0:40d:35c9:7b86 with SMTP id v12-20020a05600c214c00b0040d35c97b86mr1498909wml.4.1703087861906;
        Wed, 20 Dec 2023 07:57:41 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:3eae:b70:f27f:7aa1])
        by smtp.gmail.com with ESMTPSA id h18-20020adffd52000000b003366af9d611sm7279693wrs.22.2023.12.20.07.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 07:57:41 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robbin Ehn <rehn@rivosinc.com>,
	Gianluca Guida <gianluca@rivosinc.com>
Subject: [PATCH v2 2/6] riscv: hwprobe: export Ztso ISA extension
Date: Wed, 20 Dec 2023 16:57:18 +0100
Message-ID: <20231220155723.684081-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220155723.684081-1-cleger@rivosinc.com>
References: <20231220155723.684081-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_075746_267830_0494D50A 
X-CRM114-Status: GOOD (  10.88  )
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

RXhwb3J0IHRoZSBadHNvIGV4dGVuc2lvbiB0byB1c2Vyc3BhY2UuCgpTaWduZWQtb2ZmLWJ5OiBD
bMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9h
cmNoL3Jpc2N2L2h3cHJvYmUucnN0ICB8IDQgKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2h3cHJvYmUuaCB8IDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMgICAgICAg
ICB8IDEgKwogMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2FyY2gv
cmlzY3YvaHdwcm9iZS5yc3QKaW5kZXggNDE0NjNiOTMyMjY4Li4xMGJkN2IxNzAxMTggMTAwNjQ0
Ci0tLSBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAorKysgYi9Eb2N1bWVu
dGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKQEAgLTE2MSw2ICsxNjEsMTAgQEAgVGhlIGZv
bGxvd2luZyBrZXlzIGFyZSBkZWZpbmVkOgogICAgICAgIGRlZmluZWQgaW4gdGhlIFJJU0MtViBJ
U0EgbWFudWFsIHN0YXJ0aW5nIGZyb20gY29tbWl0IDA1NmI2ZmY0NjdjNwogICAgICAgICgiWmZh
IGlzIHJhdGlmaWVkIikuCiAKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWlRTT2A6
IFRoZSBadHNvIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQgYXMKKyAgICAgICBkZWZpbmVkIGluIHRo
ZSBSSVNDLVYgSVNBIG1hbnVhbCBzdGFydGluZyBmcm9tIGNvbW1pdCA1NjE4ZmI1YTIxNmIKKyAg
ICAgICAoIlp0c28gaXMgbm93IHJhdGlmaWVkLiIpCisKICogOmM6bWFjcm86YFJJU0NWX0hXUFJP
QkVfS0VZX0NQVVBFUkZfMGA6IEEgYml0bWFzayB0aGF0IGNvbnRhaW5zIHBlcmZvcm1hbmNlCiAg
IGluZm9ybWF0aW9uIGFib3V0IHRoZSBzZWxlY3RlZCBzZXQgb2YgcHJvY2Vzc29ycy4KIApkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKaW5kZXggOTFmYmUxYTdmMmUyLi4wMWFjM2Rj
MTk2ZTUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgK
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaApAQCAtNTYsNiArNTYs
NyBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9a
VkZICQkoMSA8PCAzMCkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pWRkhNSU4JKDEgPDwg
MzEpCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aRkEJCSgxVUxMIDw8IDMyKQorI2RlZmlu
ZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlRTTwkJKDFVTEwgPDwgMzMpCiAjZGVmaW5lIFJJU0NWX0hX
UFJPQkVfS0VZX0NQVVBFUkZfMAk1CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURf
VU5LTk9XTgkoMCA8PCAwKQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxB
VEVECSgxIDw8IDApCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCmluZGV4IGYwYmQ3YjQ4MGI3Zi4uNjU2NGZh
OWU3YTdmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYworKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwpAQCAtMTc0LDYgKzE3NCw3IEBAIHN0YXRpYyB2
b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCUVYVF9L
RVkoWktTSCk7CiAJCUVYVF9LRVkoWktUKTsKIAkJRVhUX0tFWShaSUhJTlROVEwpOworCQlFWFRf
S0VZKFpUU08pOwogCiAJCWlmIChoYXNfdmVjdG9yKCkpIHsKIAkJCUVYVF9LRVkoWlZCQik7Ci0t
IAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
