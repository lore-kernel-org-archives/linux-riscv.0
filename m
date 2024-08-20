Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E41C531DC
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 04:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Im3G7eynl15DfTvZik/hKd+PiIcI4/x/gZ+PhGfOBhE=; b=l53EcihsOnsbgG
	xbow0XdncHeylcmkXzIKcewQl+gXm+qvz9W3/logYVYWfQGi6IpOnfvsaykLb/ou4JxpCNLpFeI/1
	pMjCk19fzl4sulX+VBT8OjKDTEatmfibzNsKczzSq5Qf/YeFwcEo20xEdHC4D1CnQXewD9g5OACvI
	vZ1GMztDFXgpjUjD90T5J4ZRNCdSXZRmzN7WOt3vDtzCU5d9MgA0pBEzcCYMF+CdAmdpzGXMt+H/p
	v0Uh02QHB1/0P4nUHsO2OPut9be+jWvfUBTEkvbGy3CLEuanzqIO6zpkmI40Gy8vrPsE9P+CPFDpU
	DIvvSsM8aExOox5mENkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgGnS-00000003nui-2OcH;
	Tue, 20 Aug 2024 04:48:42 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgGnP-00000003nu6-3ZGY
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 04:48:41 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4281c164408so39637915e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Aug 2024 21:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724129318; x=1724734118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fye/jS5o+GEq4JZRP+A1JuHLRGwmKc6iHbcdO7MuGDM=;
        b=IhELzjJqtYmkRpi3Kc4i+4EbRqG1egKOeVB8wrh2FwPcYlLaxxvB84MUUTlBcSSqF7
         1nr6UE8w8ZquvsHjEERNiKn0QLrKaBNuOpB7AabOmCQTROEuC/8FsF4NozkmHGQGJ32q
         QjJJNru3bRQwxsq+6TQfzJVQjdScD5rp0i3KwnwN9/Cz3KLuoxtN+4/hWBJCyd60AOqZ
         3kcra9Z8ixkqD+IrSzAcrOTKauaALXuk91dlZgPgKhhJdgkl21AtszkvtPBiw0J/csFu
         7j9gOVyCV6ae/GFxiGda6yxhmKpspQg42y3JA1hRDe+ICACYwm4WujXnsDdtAB5elJGO
         w+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724129318; x=1724734118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fye/jS5o+GEq4JZRP+A1JuHLRGwmKc6iHbcdO7MuGDM=;
        b=SZwT/7+nxtHgNGLlVFKS3g5q5vhIQkwW/Vrmygo4PSEDDupb3c6uzw3Ot9NEJ0q9bH
         V+x2mQyOWiNwz7ubU50ORvw6NhNQAtxuXkU/tF9o3xD36b7ImojQhLUiO/T2RDQLzOnx
         8sW7WSPicRyltcuckhPZxEoky6D9lLgg18Q7pOhGcqDCKICepjWEF1htcG0e/ayMJuvO
         d9pRAMPdW05LagLka6ORtcieM53Vr5AH/FcjDRCtAdaZPpYWK+fJeTd/qfuh0647cJP7
         tUcyiwhgswZ2GynPW/WbbAftcflFfuVexZLUV2q7ts9El2Cv0sBfZfSkPzob0sS7A/71
         qmCw==
X-Forwarded-Encrypted: i=1; AJvYcCXoUWRaoosnRTaF0nzMfPuiKE8ia2aifBoAiQRuOo/2QTPKyvSjvLZouaQwtK8No54turdxj+uzoXnfmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXxYTRGjy/ajsbYDIlyICuvLExALxDj4/fcBk6PDc9rh98FhPr
	c15mTfmahlyUiSywygdudz6BHH5i8lQ7Fr54kIqE1FMdUWZjmm6CDGm4fD8C
X-Google-Smtp-Source: AGHT+IGepWIntETFS0+Xa90Hiu+rMqViuMxhxVMaVXC8MjFst8jt6k0gXZCZcKMX7zUqHRGOXDvJgw==
X-Received: by 2002:a05:600c:458b:b0:428:1663:2c2e with SMTP id 5b1f17b1804b1-429ed7a6b76mr80365795e9.17.1724129317734;
        Mon, 19 Aug 2024 21:48:37 -0700 (PDT)
Received: from localhost.localdomain ([2a01:57a0:1620:4000::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded299a9sm180852875e9.18.2024.08.19.21.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 21:48:37 -0700 (PDT)
From: =?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mikisabate@gmail.com>
To: paul.walmsley@sifive.com
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jesse@rivosinc.com,
	conor@kernel.org,
	=?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mikisabate@gmail.com>
Subject: [PATCH v2] riscv: hwprobe: export Zicntr and Zihpm extensions
Date: Tue, 20 Aug 2024 06:47:49 +0200
Message-ID: <20240820044749.557349-1-mikisabate@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817075629.262318-1-mikisabate@gmail.com>
References: <20240817075629.262318-1-mikisabate@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_214839_910476_D5B45171 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

RXhwb3J0IFppY250ciBhbmQgWmlocG0gSVNBIGV4dGVuc2lvbnMgdGhyb3VnaCB0aGUgaHdwcm9i
ZSBzeXNjYWxsLgoKU2lnbmVkLW9mZi1ieTogTWlxdWVsIFNhYmF0w6kgU29sw6AgPG1pa2lzYWJh
dGVAZ21haWwuY29tPgotLS0KIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAg
fCA2ICsrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCB8IDIgKysK
IGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgICAgICAgfCAyICsrCiAzIGZpbGVzIGNo
YW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FyY2gv
cmlzY3YvaHdwcm9iZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QK
aW5kZXggM2RiNjBhMDkxMWRmLi5jZmQyOTI5ZDA1NjIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRp
b24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3Yv
aHdwcm9iZS5yc3QKQEAgLTE4Myw2ICsxODMsOSBAQCBUaGUgZm9sbG93aW5nIGtleXMgYXJlIGRl
ZmluZWQ6CiAgICAgICAgZGVmaW5lZCBpbiB0aGUgQXRvbWljIENvbXBhcmUtYW5kLVN3YXAgKENB
UykgaW5zdHJ1Y3Rpb25zIG1hbnVhbCBzdGFydGluZwogICAgICAgIGZyb20gY29tbWl0IDUwNTll
MGNhNjQxYyAoInVwZGF0ZSB0byByYXRpZmllZCIpLgogCisgICogOmM6bWFjcm86YFJJU0NWX0hX
UFJPQkVfRVhUX1pJQ05UUmA6IFRoZSBaaWNudHIgZXh0ZW5zaW9uIHZlcnNpb24gMi4wCisgICAg
ICAgaXMgc3VwcG9ydGVkIGFzIGRlZmluZWQgaW4gdGhlIFJJU0MtViBJU0EgbWFudWFsLgorCiAg
ICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pJQ09ORGA6IFRoZSBaaWNvbmQgZXh0ZW5z
aW9uIGlzIHN1cHBvcnRlZCBhcwogICAgICAgIGRlZmluZWQgaW4gdGhlIFJJU0MtViBJbnRlZ2Vy
IENvbmRpdGlvbmFsIChaaWNvbmQpIG9wZXJhdGlvbnMgZXh0ZW5zaW9uCiAgICAgICAgbWFudWFs
IHN0YXJ0aW5nIGZyb20gY29tbWl0IDk1Y2YxZjkgKCJBZGQgY2hhbmdlcyByZXF1ZXN0ZWQgYnkg
VmVkCkBAIC0xOTIsNiArMTk1LDkgQEAgVGhlIGZvbGxvd2luZyBrZXlzIGFyZSBkZWZpbmVkOgog
ICAgICAgIHN1cHBvcnRlZCBhcyBkZWZpbmVkIGluIHRoZSBSSVNDLVYgSVNBIG1hbnVhbCBzdGFy
dGluZyBmcm9tIGNvbW1pdAogICAgICAgIGQ4YWI1Yzc4YzIwNyAoIlppaGludHBhdXNlIGlzIHJh
dGlmaWVkIikuCiAKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWklIUE1gOiBUaGUg
WmlocG0gZXh0ZW5zaW9uIHZlcnNpb24gMi4wCisgICAgICAgaXMgc3VwcG9ydGVkIGFzIGRlZmlu
ZWQgaW4gdGhlIFJJU0MtViBJU0EgbWFudWFsLgorCiAgICogOmM6bWFjcm86YFJJU0NWX0hXUFJP
QkVfRVhUX1pWRTMyWGA6IFRoZSBWZWN0b3Igc3ViLWV4dGVuc2lvbiBadmUzMnggaXMKICAgICBz
dXBwb3J0ZWQsIGFzIGRlZmluZWQgYnkgdmVyc2lvbiAxLjAgb2YgdGhlIFJJU0MtViBWZWN0b3Ig
ZXh0ZW5zaW9uIG1hbnVhbC4KIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKaW5k
ZXggYjcwNmM4ZTQ3YjAyLi4wOThhODE1YjNmZDQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9od3Byb2JlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2h3cHJvYmUuaApAQCAtNzIsNiArNzIsOCBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAjZGVm
aW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQ0YJCSgxVUxMIDw8IDQ2KQogI2RlZmluZQkJUklTQ1Zf
SFdQUk9CRV9FWFRfWkNNT1AJCSgxVUxMIDw8IDQ3KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9F
WFRfWkFXUlMJCSgxVUxMIDw8IDQ4KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWklDTlRS
CSgxVUxMIDw8IDQ5KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWklIUE0JCSgxVUxMIDw8
IDUwKQogI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzAJNQogI2RlZmluZQkJUklT
Q1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOS05PV04JKDAgPDwgMCkKICNkZWZpbmUJCVJJU0NWX0hX
UFJPQkVfTUlTQUxJR05FRF9FTVVMQVRFRAkoMSA8PCAwKQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvc3lzX2h3cHJvYmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMK
aW5kZXggOGQxYjVjMzVkMmE3Li45MTBiNDFiNmE3YWIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL3N5c19od3Byb2JlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUu
YwpAQCAtMTA3LDkgKzEwNywxMSBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0cnVj
dCByaXNjdl9od3Byb2JlICpwYWlyLAogCQlFWFRfS0VZKFpDQik7CiAJCUVYVF9LRVkoWkNNT1Ap
OwogCQlFWFRfS0VZKFpJQ0JPWik7CisJCUVYVF9LRVkoWklDTlRSKTsKIAkJRVhUX0tFWShaSUNP
TkQpOwogCQlFWFRfS0VZKFpJSElOVE5UTCk7CiAJCUVYVF9LRVkoWklISU5UUEFVU0UpOworCQlF
WFRfS0VZKFpJSFBNKTsKIAkJRVhUX0tFWShaSU1PUCk7CiAJCUVYVF9LRVkoWktORCk7CiAJCUVY
VF9LRVkoWktORSk7CgpiYXNlLWNvbW1pdDogZGMxYzgwMzRlMzFiMTRhMmU1ZTIxMjEwNGVjNTA4
YWVjNDRjZTFiOQotLSAKMi40Ni4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
