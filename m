Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E9AD6ACDD
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 14:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cDtIhM3fa4dq8Wr3efNQJsRJXk+GIbqSlCZA2d1UsqU=; b=ZdYXEU7azt74Q4
	MqPO9PJaAA/bcJ+N9IdfvcM4GPlRMdjuwtZRcrJNDF+P6XOcn/4mfn18ZEYK/AAeixmuLNz+FyG21
	pj/V/buU+OX/wd7N/6JNfM83PlZJWzwUxZmUMfNRVYQ+KiU+NN7UBlZYF/p8YP8kU1HQDYQsUpYlO
	YAY7/RiYaCfQ1j3Qkdp9xGxOHGd2qEOXx9S7aBpSBZ9Wi5f2eZoDQaTVeLZ56ToCB15imTuadAo/c
	NW2SIJxWI1PnkXBLUZkwBCESj6Dvp0o+kcny6i66RBNeOmFcnwNMnAKRALeIBICFEj4fcMxKT/qtN
	ygCuQPult10RLZ4ybaoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIz1-0000000DMg7-21h2;
	Wed, 27 Nov 2024 14:25:35 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIyz-0000000DMfh-0Oll
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 14:25:34 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-53de5ec22adso4046490e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 06:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732717531; x=1733322331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M9vG//8ehMp4lOpZgUGc6H5kOfF24HtjuZe7yPe7sl4=;
        b=uuiJXkRQRPbL6kS04DNgpgVJT8D6BUbyz09/ZWIUaFCaQmum4yZDOa8sTckvVbqMHd
         PdCtcETqBJl9FclDaiiwoZvp1MecTyyMWdLxvDjMMa1C1ss8JV/IJCTxJajV0RVCkY6M
         lwUXxVctE+p+gPwHvIuaYPAm0RMxtIUxnn4hmeh6ceLjgEOst1BP6sIgu8dTzAXzjH5K
         T0SJ8RimZa0nUIGejuFGc/PNJS9Tbr70jfZxpLGdm9+V8DYa0+7XsnfJCIKEpz3Iiibg
         KvnBrw435rdi/m1CyWFTPT880+NZ3H/+M18aZrUVACbik1kNLQ3GZug2ANG5cLvGlhP0
         KGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732717531; x=1733322331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9vG//8ehMp4lOpZgUGc6H5kOfF24HtjuZe7yPe7sl4=;
        b=UkkfeLyBkIauYVQ26ArwFufrvLmwYOQlg3JtpVoTenH7ie1qBbLd3DXmc5HdDEn4SK
         7ClePfKzaZTa405vUeg3y2+QsjHVhh6Ehvy6zO+Qc/gJHlE5KMDis3NeIgkGxP6qtMbs
         dfABJopA8dOd08BVOedzBHnhiABYVPKO3VB/pdqTlph8zwvtoZOSZHFKUJtspVCIBYgO
         FqBAJiH96iTM3gQ1XhRYd52GOml6A6A5FwcYwsIjaeui5YMFP9Ev9IA7Yb1KCJNIGLaU
         lN1vRoVQ5TvAcv+TpJfk0qXAsJuS0Miee/vh9880xKAMaf8I8VQP7lc7o3CPVqExXbtQ
         p+hg==
X-Forwarded-Encrypted: i=1; AJvYcCVtYMjCPTVRDeeeVHutVT1nQ51VsD/G1TpCFbJ/Wb68xpDbZDtnr+Wc1DPxZINNRbYk63ahrAYrGVmnyw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3DJSGzj2t9zL9W1ic1S0JCGEM23ETj4DpBL/+u6yeAz1KToQo
	0TZb5jgbc6EFuEE3/VeqNv5v4CULpMAsZGMaicDbmMXDEP6lt2NYO4zVhjTlkSc=
X-Gm-Gg: ASbGncuep91eJC/MAx33j1j9S+mRp5vfmtupRfjpcFGxZLyB3u1wfYCZsVy9nkq7CEM
	6MtmlMobjJWALxDhPXD3hheCkz52l3m1Yru07ZQ5gCFZAPCW7FnrJWvWGI+m71tnc51SGbKA6GF
	0RAia9u+lzSwVLPY5rQmjaPyPh7xTg4IGqAcvoSPVfKfKHhwDzH65NqF/EDkxC7t4KeLJut2oIV
	cYaPhs2h9kC0CyfJRbO+9jVMc5Abg7FABU9XWGZ1urws2utP60=
X-Google-Smtp-Source: AGHT+IEq0o9PJ9NLeVH70cbpvzcAJwyOpE7QpuGsdHSdB/UiJnox4e1NTf1b0VEcLfTBl4+Lz2uo5w==
X-Received: by 2002:a05:6512:2244:b0:53d:ed66:e070 with SMTP id 2adb3069b0e04-53df010ea48mr1692848e87.47.1732717530883;
        Wed, 27 Nov 2024 06:25:30 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fb53858sm16389913f8f.62.2024.11.27.06.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 06:25:30 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kai Zhang <zhangkai@iscas.ac.cn>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2] riscv: module: use a plain variable for list_head instead of a pointer
Date: Wed, 27 Nov 2024 15:25:17 +0100
Message-ID: <20241127142519.3038691-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_062533_140682_1B26A20B 
X-CRM114-Status: GOOD (  13.07  )
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

cmVsX2hlYWQncyBsaXN0X2hlYWQgbWVtYmVyLCByZWxfZW50cnksIGRvZXNuJ3QgbmVlZCB0byBi
ZSBhbGxvY2F0ZWQsCml0cyBzdG9yYWdlIGNhbiBqdXN0IGJlIHBhcnQgb2YgdGhlIGFsbG9jYXRl
ZCByZWxfaGVhZC4gUmVtb3ZlIHRoZQpwb2ludGVyIHdoaWNoIGFsbG93cyB0byBnZXQgcmlkIG9m
IHRoZSBhbGxvY2F0aW9uIGFzIHdlbGwgYXMgYW4gZXhpc3RpbmcKbWVtb3J5IGxlYWsgZm91bmQg
YnkgS2FpIFphbmcgdXNpbmcga21lbWxlYWsuCgpSZXBvcnRlZC1ieTogS2FpIFpoYW5nIDx6aGFu
Z2thaUBpc2Nhcy5hYy5jbj4KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJA
cml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1p
Y3JvLmNvbT4KLS0tCgpWMjoKIC0gQWRkIEthaSBSZXBvcnRlZC1ieQogLSBSZXdvcmQgdGhlIGNv
bW1pdCBkZXNjcmlwdGlvbiAoQW5kcmV3KQoKLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUu
YyB8IDE4ICsrKystLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvbW9kdWxl
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUuYwppbmRleCAxY2Q0NjFmM2Q4NzIuLjQ3ZDBl
YmVlYzkzYyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvbW9kdWxlLmMKKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvbW9kdWxlLmMKQEAgLTIzLDcgKzIzLDcgQEAgc3RydWN0IHVzZWRfYnVj
a2V0IHsKIAogc3RydWN0IHJlbG9jYXRpb25faGVhZCB7CiAJc3RydWN0IGhsaXN0X25vZGUgbm9k
ZTsKLQlzdHJ1Y3QgbGlzdF9oZWFkICpyZWxfZW50cnk7CisJc3RydWN0IGxpc3RfaGVhZCByZWxf
ZW50cnk7CiAJdm9pZCAqbG9jYXRpb247CiB9OwogCkBAIC02MzQsNyArNjM0LDcgQEAgcHJvY2Vz
c19hY2N1bXVsYXRlZF9yZWxvY2F0aW9ucyhzdHJ1Y3QgbW9kdWxlICptZSwKIAkJCWxvY2F0aW9u
ID0gcmVsX2hlYWRfaXRlci0+bG9jYXRpb247CiAJCQlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUo
cmVsX2VudHJ5X2l0ZXIsCiAJCQkJCQkgcmVsX2VudHJ5X2l0ZXJfdG1wLAotCQkJCQkJIHJlbF9o
ZWFkX2l0ZXItPnJlbF9lbnRyeSwKKwkJCQkJCSAmcmVsX2hlYWRfaXRlci0+cmVsX2VudHJ5LAog
CQkJCQkJIGhlYWQpIHsKIAkJCQljdXJyX3R5cGUgPSByZWxfZW50cnlfaXRlci0+dHlwZTsKIAkJ
CQlyZWxvY19oYW5kbGVyc1tjdXJyX3R5cGVdLnJlbG9jX2hhbmRsZXIoCkBAIC03MDQsMTYgKzcw
NCw3IEBAIHN0YXRpYyBpbnQgYWRkX3JlbG9jYXRpb25fdG9fYWNjdW11bGF0ZShzdHJ1Y3QgbW9k
dWxlICptZSwgaW50IHR5cGUsCiAJCQlyZXR1cm4gLUVOT01FTTsKIAkJfQogCi0JCXJlbF9oZWFk
LT5yZWxfZW50cnkgPQotCQkJa21hbGxvYyhzaXplb2Yoc3RydWN0IGxpc3RfaGVhZCksIEdGUF9L
RVJORUwpOwotCi0JCWlmICghcmVsX2hlYWQtPnJlbF9lbnRyeSkgewotCQkJa2ZyZWUoZW50cnkp
OwotCQkJa2ZyZWUocmVsX2hlYWQpOwotCQkJcmV0dXJuIC1FTk9NRU07Ci0JCX0KLQotCQlJTklU
X0xJU1RfSEVBRChyZWxfaGVhZC0+cmVsX2VudHJ5KTsKKwkJSU5JVF9MSVNUX0hFQUQoJnJlbF9o
ZWFkLT5yZWxfZW50cnkpOwogCQlyZWxfaGVhZC0+bG9jYXRpb24gPSBsb2NhdGlvbjsKIAkJSU5J
VF9ITElTVF9OT0RFKCZyZWxfaGVhZC0+bm9kZSk7CiAJCWlmICghY3VycmVudF9oZWFkLT5maXJz
dCkgewpAQCAtNzIyLDcgKzcxMyw2IEBAIHN0YXRpYyBpbnQgYWRkX3JlbG9jYXRpb25fdG9fYWNj
dW11bGF0ZShzdHJ1Y3QgbW9kdWxlICptZSwgaW50IHR5cGUsCiAKIAkJCWlmICghYnVja2V0KSB7
CiAJCQkJa2ZyZWUoZW50cnkpOwotCQkJCWtmcmVlKHJlbF9oZWFkLT5yZWxfZW50cnkpOwogCQkJ
CWtmcmVlKHJlbF9oZWFkKTsKIAkJCQlyZXR1cm4gLUVOT01FTTsKIAkJCX0KQEAgLTczNSw3ICs3
MjUsNyBAQCBzdGF0aWMgaW50IGFkZF9yZWxvY2F0aW9uX3RvX2FjY3VtdWxhdGUoc3RydWN0IG1v
ZHVsZSAqbWUsIGludCB0eXBlLAogCX0KIAogCS8qIEFkZCByZWxvY2F0aW9uIHRvIGhlYWQgb2Yg
ZGlzY292ZXJlZCByZWxfaGVhZCAqLwotCWxpc3RfYWRkX3RhaWwoJmVudHJ5LT5oZWFkLCByZWxf
aGVhZC0+cmVsX2VudHJ5KTsKKwlsaXN0X2FkZF90YWlsKCZlbnRyeS0+aGVhZCwgJnJlbF9oZWFk
LT5yZWxfZW50cnkpOwogCiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
