Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336AEC52D7F
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Aug 2024 07:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4cHPJK68vmuCE+UEZz4ZPU0TuprVjQHmfCNhoHlEIxk=; b=CbG+Mzp2wHkklx
	EL6hBg9yfhNnQwJxO57814PWE8O4iwgLJGwFuQP7eGIBKUDvRWvC8imHW5pEEZFVcYg/j9jE5OKJl
	/if3pnSVVIapKwsQ4/fDgTxZyBaPx9DrVxFt+4mQuL/qRPUc47fFzhbwZ04my//PapasmZx9sfFo/
	pbTLi/v1KmL02fb/air/8dkTdP/fjs4UjLLde+QwRGjZbcBov97oO2htp0WaXx7sIMRbeoX17BC4H
	Gks9av7XvA7wqe2GT21NNg0N9LM97MVNrCbcLbl8fJs86bd+Lx3IOYKHd6eudjpe1L3LR2s6E6orT
	jef0ycv6q0jIiGaiVqjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfEJH-0000000Esgz-31Gi;
	Sat, 17 Aug 2024 07:57:15 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfEJF-0000000Esg8-2bdm
	for linux-riscv@lists.infradead.org;
	Sat, 17 Aug 2024 07:57:15 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a83869373b6so250798666b.2
        for <linux-riscv@lists.infradead.org>; Sat, 17 Aug 2024 00:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723881431; x=1724486231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n5jB9WqD9hn9VQJpZtHAV2ARCrG+g8V2GVK+szYij7E=;
        b=jPfGcN2qy7ilwRYDO1uQ7eZW5YdPcCoS8GmVvyIPJA9EgIeJgLxmAeX65fHHFC8Apa
         M1QMD7PYNdDp6egn7xQdQFNWtzPQNFrG5KvP2VRSJs2KQs/ux2E2kW1wCH2vKahGGvuU
         RzNiUQOeax8pZCk3kbBrfWuqbqblbTTV908yvrKN4b5nzrLPicDamqh5tA8g64HbRF/G
         N5I2LVEWqkYK7HzhKTtHboIFfwC9ehGNaaP6jtEJmtwBc9hf1ZTec2XzOgVo8BjXOoDx
         TvC8ZIJQsMCOo8ObsMTPDiTtSlgRUEr4vKwG+eAKHWEZc7uiwwkeyJHxIPCF2DPOVwU6
         AGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723881431; x=1724486231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5jB9WqD9hn9VQJpZtHAV2ARCrG+g8V2GVK+szYij7E=;
        b=VXkb3J5a6qZPDzcuLCbHUQv1fCtuWlcyUc9tvfpvBYD2qVtkdY3aQRTWalUz5vWqjZ
         uLYLbtwJFKU/4GqESlSiqHKJlPJ+iCwqIE2DWO4WaWgWCSKtBB5lkBHqosGkN63goCpq
         6UnE4wJ317+wL7IUER5h3VKm7yeZ7wI+GroCmOuIPkyEhaoEpb6V8LG93jTutwbQolay
         cdGVNlKQKVPuZXp0RTJ/d2/kQv3YZzKyF5EnWrGcGGiJRhoLEbHptupBDlAZgUXBKmdo
         SXtof/IW1qFV+FdRn5V+3sBfw/aDFF2oRbu8pPkYt5vg+944LjZDPzaEOddZPLvR88Cv
         8nMA==
X-Forwarded-Encrypted: i=1; AJvYcCUX4P2NOfrFBIaKODq2t4l0SE/sKoUEVYwXgTsqTDGld7QTufag5id+6gZx/3WX5SpdZ7YEdlOnHeA8Bg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbnZZBriQORR6c4zeQOkp7X8Z623gRytR+rdz8Ze6l/3C3tr/4
	4djhh2Z31kNt8DXIPJOo1C6VKFlMQNVzAhSeXFv1uEd5V09w744OMhpjY25E
X-Google-Smtp-Source: AGHT+IGxg9zUYsOiUSm9ol0uO2f1rXCDCYJQtLTwAm0CSAhLAQ7RavbVKMfZvk659KR/93hyGd3LQQ==
X-Received: by 2002:a17:907:e223:b0:a7d:a080:bb1 with SMTP id a640c23a62f3a-a83929f1240mr344339366b.43.1723881430522;
        Sat, 17 Aug 2024 00:57:10 -0700 (PDT)
Received: from localhost.localdomain ([37.72.3.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383946967sm369430866b.172.2024.08.17.00.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 00:57:09 -0700 (PDT)
From: =?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mikisabate@gmail.com>
To: paul.walmsley@sifive.com
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mikisabate@gmail.com>
Subject: [PATCH] riscv: hwprobe: export Zicntr and Zihpm extensions
Date: Sat, 17 Aug 2024 09:56:29 +0200
Message-ID: <20240817075629.262318-1-mikisabate@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240817_005713_686676_7CE77FC6 
X-CRM114-Status: UNSURE (   9.60  )
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
aW5kZXggM2RiNjBhMDkxMWRmLi41YmI2OWM5ODVjY2UgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRp
b24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3Yv
aHdwcm9iZS5yc3QKQEAgLTE4OCwxMCArMTg4LDE2IEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUg
ZGVmaW5lZDoKICAgICAgICBtYW51YWwgc3RhcnRpbmcgZnJvbSBjb21taXQgOTVjZjFmOSAoIkFk
ZCBjaGFuZ2VzIHJlcXVlc3RlZCBieSBWZWQKICAgICAgICBkdXJpbmcgc2lnbm9mZiIpCiAKKyAg
KiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWklDTlRSYDogVGhlIFppY250ciBleHRlbnNp
b24gdmVyc2lvbiAyLjAKKyAgICAgICBpcyBzdXBwb3J0ZWQgYXMgZGVmaW5lZCBpbiB0aGUgUklT
Qy1WIElTQSBtYW51YWwuCisKICAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWklISU5U
UEFVU0VgOiBUaGUgWmloaW50cGF1c2UgZXh0ZW5zaW9uIGlzCiAgICAgICAgc3VwcG9ydGVkIGFz
IGRlZmluZWQgaW4gdGhlIFJJU0MtViBJU0EgbWFudWFsIHN0YXJ0aW5nIGZyb20gY29tbWl0CiAg
ICAgICAgZDhhYjVjNzhjMjA3ICgiWmloaW50cGF1c2UgaXMgcmF0aWZpZWQiKS4KIAorICAqIDpj
Om1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aSUhQTWA6IFRoZSBaaWhwbSBleHRlbnNpb24gdmVy
c2lvbiAyLjAKKyAgICAgICBpcyBzdXBwb3J0ZWQgYXMgZGVmaW5lZCBpbiB0aGUgUklTQy1WIElT
QSBtYW51YWwuCisKICAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWlZFMzJYYDogVGhl
IFZlY3RvciBzdWItZXh0ZW5zaW9uIFp2ZTMyeCBpcwogICAgIHN1cHBvcnRlZCwgYXMgZGVmaW5l
ZCBieSB2ZXJzaW9uIDEuMCBvZiB0aGUgUklTQy1WIFZlY3RvciBleHRlbnNpb24gbWFudWFsLgog
CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAppbmRleCBiNzA2YzhlNDdiMDIuLjA5
OGE4MTViM2ZkNCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJv
YmUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCkBAIC03Miw2
ICs3Miw4IEBAIHN0cnVjdCByaXNjdl9od3Byb2JlIHsKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVf
RVhUX1pDRgkJKDFVTEwgPDwgNDYpCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQ01PUAkJ
KDFVTEwgPDwgNDcpCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQVdSUwkJKDFVTEwgPDwg
NDgpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aSUNOVFIJKDFVTEwgPDwgNDkpCisjZGVm
aW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aSUhQTQkJKDFVTEwgPDwgNTApCiAjZGVmaW5lIFJJU0NW
X0hXUFJPQkVfS0VZX0NQVVBFUkZfMAk1CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdO
RURfVU5LTk9XTgkoMCA8PCAwKQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VN
VUxBVEVECSgxIDw8IDApCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9i
ZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwppbmRleCA4ZDFiNWMzNWQyYTcu
LjMwYWVkZTFjOTBmZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUu
YworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCkBAIC0xMTgsNiArMTE4LDgg
QEAgc3RhdGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFp
ciwKIAkJRVhUX0tFWShaS1NIKTsKIAkJRVhUX0tFWShaS1QpOwogCQlFWFRfS0VZKFpUU08pOwor
CQlFWFRfS0VZKFpJQ05UUik7CisJCUVYVF9LRVkoWklIUE0pOwogCiAJCS8qCiAJCSAqIEFsbCB0
aGUgZm9sbG93aW5nIGV4dGVuc2lvbnMgbXVzdCBkZXBlbmQgb24gdGhlIGtlcm5lbAotLSAKMi40
Ni4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
