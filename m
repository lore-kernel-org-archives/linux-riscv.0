Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5088EC54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 14:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QinZ1jisIq7cKa9zQH90+cGdoqSGKTxl+Fru2phlHzo=; b=VA/VpyB/eVvU88
	FaqpC4Hr3FrNDAc8L04/ZHWtdP5ts86h7Mg8fjs5YaJZ9XZt75sCXNWFLhHSflU9KKRiz/kGLmDWF
	wHkI4Bc0/tF75SrKk1yw9mpiWBs9fTu+xkd2cMuAm2vKdi8iw+qhgVolSYat00gb6NENsdhlBriv1
	SMvXN7+fFtg5U9CQ5Z2f9Zn5eeHQOf7vvfnXxGLmpjdh0prpj470f+jnlSmntc9MQgcxC8Ko4wz9X
	1iTRIVxcm38ejcY5YHE/WEGAvi2mqioXbnF5JvdwOjZaqsL5C2HD5twyzo153837jwopc240VJJJG
	6WqX1JeRZNyeLSQa/mYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkm2Z-0000000Ed9M-2wq4;
	Thu, 14 Mar 2024 14:26:39 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkm2W-0000000Ed5h-1MDg
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 14:26:38 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6e6ac741ff7so1132716b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 07:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710426394; x=1711031194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1t6ULOFAaWOfVhtAE5dYdqGmEHfwVNxBeqPWXOtKDqU=;
        b=XKbgN1xR6SuLAfgtEUivGzjI/93z+HdcRNBNaTng8MG297Jv7XQSizoMP8WAmgt6TJ
         4TU+4hOvQHN0qJ+eAkBLIVyFsahbquFiN1jFvFaT5uIC2/QVZkfcR9VIdD+KwfkZoYTr
         ZC8nZarFvO1hYgjFCI9RIeE7Nd4I/dOy/EeWMn3asxPSGwJBZhoiprVr72vf/2psgFKK
         UIKHlFrFSGmL2u1Z/w0ufX3yOWHoTfWypFO37w7wV0COsjwTSDf5YXh9i2D8mQvdcTVD
         tASOWzhmGbark9uwktL6XOaE0JIob73oYslfQSadotCxE/FIdBhP9ss/7mgFXtqVTJOH
         ae4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710426394; x=1711031194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1t6ULOFAaWOfVhtAE5dYdqGmEHfwVNxBeqPWXOtKDqU=;
        b=Xsne2egfTQX59AIr7ULQt+dRZELZV55UGy1cB9VTl///ud8OiPtHLrDZf/JQTCgrGL
         SE0mikTXOPZM7hVLtgiMTh4ZQx9vgAnNQh8iX8UNXaC0eGxKC3jhPP7RJ2/3x2XUtv/E
         PRAEnOvEQNdRQdr3NaSvPv5qLwEJb7Bmk3q3DTvOCre64DBH/HicO4MIM9ZSGxGF1ToP
         MmRYbu0Zww134CZNHNkxnHYV1qQyeklHtEjzPEHIEWj/nrPUR5YJlBZ+yEWxmbP1b83k
         dkHRGoXBj9u1GvFmcYjTbX/kOSF58ad08OCpCMRZzzzMUpBMKpT1BkFN/VE5Yb72WSmc
         VryA==
X-Gm-Message-State: AOJu0YxamD0QFpojQAQ65SS3eEbMjpQMMQ2VbiP1/nYbm9/r96hUNRRt
	DCNrNkwinQfNC5hew6eK44oBgqUbJbtRPlvfKalPpWIJkomOBsCpeq1WHM07c7qOP+L0FivPwdu
	LH/HKgzYD2d+CwDOzR3m6bv/4JdCnChx66CGXSUEXJTDgfUlTcIhSp+sI+chsJe40yQiu1gfD0i
	3XI/HtM1U/5G/lAl6Srfv1gmBHKXArnzCMbwTa0v5ErhtvH83kN3dI
X-Google-Smtp-Source: AGHT+IG80ljIyKK1zGSybNl1gNOV0i6UWFuSbMUxXNM7m/B0dqRlnvIqlBubLWrZYGebXhTWOcEqxA==
X-Received: by 2002:a05:6a00:189d:b0:6e3:caa7:3038 with SMTP id x29-20020a056a00189d00b006e3caa73038mr2430783pfh.0.1710426393619;
        Thu, 14 Mar 2024 07:26:33 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y9-20020a62f249000000b006e6854d45afsm1556435pfl.97.2024.03.14.07.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 07:26:33 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Evan Green <evan@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Costa Shulyupin <costa.shul@redhat.com>
Subject: [v2, 6/7] riscv: hwprobe: add zve Vector subextensions into hwprobe interface
Date: Thu, 14 Mar 2024 22:25:41 +0800
Message-Id: <20240314142542.19957-7-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240314142542.19957-1-andy.chiu@sifive.com>
References: <20240314142542.19957-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_072636_404487_2DDC2EF5 
X-CRM114-Status: GOOD (  10.66  )
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

VGhlIGZvbGxvd2luZyBWZWN0b3Igc3ViZXh0ZW5zaW9ucyBmb3IgImVtYmVkZGVkIiBwbGF0Zm9y
bXMgYXJlIGFkZGVkCmludG8gUklTQ1ZfSFdQUk9CRV9LRVlfSU1BX0VYVF8wOgogLSBaVkUzMlgK
IC0gWlZFMzJGCiAtIFpWRTY0WAogLSBaVkU2NEYKIC0gWlZFNjRECgpFeHRlbnNpb25zIGVuZCB3
aXRoIFggbWVhbiB0aGUgcGxhdGZvcm0gZG9uJ3QgaGF2ZSBhIFZlY3RvciBGUFUuCkV4dGVuc2lv
bnMgZW5kIHdpdGggRi9EIG1lYW4gd2hldGhlciBzaW5nbGUgKEYpIG9yIGRvdWJsZSAoRCkgcHJl
Y2lzaW9uClZlY3RvciBvcGVyYXRpb24gaXMgc3VwcG9ydGVkLgoKVGhlIG51bWJlciAzMiBvciA2
NCBmb2xsb3dzIGZyb20gWlZFIHRlbGxzIHRoZSBtYXhpbXVtIGVsZW1lbnQgbGVuZ3RoLgoKU2ln
bmVkLW9mZi1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KLS0tCkNoYW5nZWxv
ZyB2MjoKIC0genZlKiBleHRlbnNpb25zIGluIGh3cHJvYmUgZGVwZW5kcyBvbiB3aGV0aGVyIGtl
cm5lbCBzdXBwb3J0cyB2LCBzbwogICBpbmNsdWRlIHRoZW0gYWZ0ZXIgaGFzX3ZlY3RvcigpLiBG
aXggYSB0eXBvLiAoQ2zDqW1lbnQpCi0tLQogRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJv
YmUucnN0ICB8IDE1ICsrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2h3cHJvYmUuaCB8ICA1ICsrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAg
ICAgIHwgIDUgKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBiL0RvY3VtZW50YXRp
b24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAppbmRleCBiMmJjYzllZWQ5YWEuLmQwYjAyZTAxMmU1
ZCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CisrKyBi
L0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdApAQCAtMTg4LDYgKzE4OCwyMSBA
QCBUaGUgZm9sbG93aW5nIGtleXMgYXJlIGRlZmluZWQ6CiAgICAgICAgbWFudWFsIHN0YXJ0aW5n
IGZyb20gY29tbWl0IDk1Y2YxZjkgKCJBZGQgY2hhbmdlcyByZXF1ZXN0ZWQgYnkgVmVkCiAgICAg
ICAgZHVyaW5nIHNpZ25vZmYiKQogCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pW
RTMyWGA6IFRoZSBWZWN0b3Igc3ViLWV4dGVuc2lvbiBadmUzMnggaXMKKyAgICBzdXBwb3J0ZWQs
IGFzIGRlZmluZWQgYnkgdmVyc2lvbiAxLjAgb2YgdGhlIFJJU0MtViBWZWN0b3IgZXh0ZW5zaW9u
IG1hbnVhbC4KKworICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aVkUzMkZgOiBUaGUg
VmVjdG9yIHN1Yi1leHRlbnNpb24gWnZlMzJmIGlzCisgICAgc3VwcG9ydGVkLCBhcyBkZWZpbmVk
IGJ5IHZlcnNpb24gMS4wIG9mIHRoZSBSSVNDLVYgVmVjdG9yIGV4dGVuc2lvbiBtYW51YWwuCisK
KyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWlZFNjRYYDogVGhlIFZlY3RvciBzdWIt
ZXh0ZW5zaW9uIFp2ZTY0eCBpcworICAgIHN1cHBvcnRlZCwgYXMgZGVmaW5lZCBieSB2ZXJzaW9u
IDEuMCBvZiB0aGUgUklTQy1WIFZlY3RvciBleHRlbnNpb24gbWFudWFsLgorCisgICogOmM6bWFj
cm86YFJJU0NWX0hXUFJPQkVfRVhUX1pWRTY0RmA6IFRoZSBWZWN0b3Igc3ViLWV4dGVuc2lvbiBa
dmU2NGYgaXMKKyAgICBzdXBwb3J0ZWQsIGFzIGRlZmluZWQgYnkgdmVyc2lvbiAxLjAgb2YgdGhl
IFJJU0MtViBWZWN0b3IgZXh0ZW5zaW9uIG1hbnVhbC4KKworICAqIDpjOm1hY3JvOmBSSVNDVl9I
V1BST0JFX0VYVF9aVkU2NERgOiBUaGUgVmVjdG9yIHN1Yi1leHRlbnNpb24gWnZlNjRkIGlzCisg
ICAgc3VwcG9ydGVkLCBhcyBkZWZpbmVkIGJ5IHZlcnNpb24gMS4wIG9mIHRoZSBSSVNDLVYgVmVj
dG9yIGV4dGVuc2lvbiBtYW51YWwuCisKICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQ
VVBFUkZfMGA6IEEgYml0bWFzayB0aGF0IGNvbnRhaW5zIHBlcmZvcm1hbmNlCiAgIGluZm9ybWF0
aW9uIGFib3V0IHRoZSBzZWxlY3RlZCBzZXQgb2YgcHJvY2Vzc29ycy4KIApkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS91YXBpL2FzbS9od3Byb2JlLmgKaW5kZXggOWYyYThlM2ZmMjA0Li5iOWEwODc2ZTk2OWYgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaApAQCAtNTksNiArNTksMTEgQEAgc3Ry
dWN0IHJpc2N2X2h3cHJvYmUgewogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlRTTwkJKDFV
TEwgPDwgMzMpCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQUNBUwkJKDFVTEwgPDwgMzQp
CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aSUNPTkQJKDFVTEwgPDwgMzUpCisjZGVmaW5l
CQlSSVNDVl9IV1BST0JFX0VYVF9aVkUzMlgJKDFVTEwgPDwgMzYpCisjZGVmaW5lCQlSSVNDVl9I
V1BST0JFX0VYVF9aVkUzMkYJKDFVTEwgPDwgMzcpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VY
VF9aVkU2NFgJKDFVTEwgPDwgMzgpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aVkU2NEYJ
KDFVTEwgPDwgMzkpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aVkU2NEQJKDFVTEwgPDwg
NDApCiAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMAk1CiAjZGVmaW5lCQlSSVND
Vl9IV1BST0JFX01JU0FMSUdORURfVU5LTk9XTgkoMCA8PCAwKQogI2RlZmluZQkJUklTQ1ZfSFdQ
Uk9CRV9NSVNBTElHTkVEX0VNVUxBVEVECSgxIDw8IDApCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC9zeXNfaHdwcm9iZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwpp
bmRleCBhN2M1NmI0MWVmZDIuLmRiNzQ5NTAwMWYyNyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvc3lzX2h3cHJvYmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5j
CkBAIC0xMTMsNiArMTEzLDExIEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0
IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCUVYVF9LRVkoWklDT05EKTsKIAogCQlpZiAoaGFzX3Zl
Y3RvcigpKSB7CisJCQlFWFRfS0VZKFpWRTMyWCk7CisJCQlFWFRfS0VZKFpWRTMyRik7CisJCQlF
WFRfS0VZKFpWRTY0WCk7CisJCQlFWFRfS0VZKFpWRTY0Rik7CisJCQlFWFRfS0VZKFpWRTY0RCk7
CiAJCQlFWFRfS0VZKFpWQkIpOwogCQkJRVhUX0tFWShaVkJDKTsKIAkJCUVYVF9LRVkoWlZLQik7
Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
