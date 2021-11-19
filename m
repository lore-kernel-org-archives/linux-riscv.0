Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3561C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 22:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rds+tZRyB09P4idaUM8VwVTRLBtDE+V7ASdxtIvVV0g=; b=iHOgpQtr2CYBF0
	T3Yb8ud8Y0Mo6Gdjh1S3KS/wg7IpaN9GDsDVruKsi8NHW4pn7mPruqyrEARhJQFBFdTS3euk9gAZt
	2Ym8dYFuy4WMRaZiMjC0D1KLI8hp8S7fsPX5fN8TbCXzMEi4SRYRF1VLnjrle1XmahbljifuWnHoo
	3f9Wid4+bh7Ana8PQEq9YKyvc9r3zDn2tN4g/z/Cbb+dIqTKPnitQWGa7nZcvIV66u71/sg600HTP
	jmTnmnckUuVWnzba0BONO/gR0v8cLWPrSp83nVgBFu4wv12ybWoA4aT8Jt43LWGFp60riJUguJ6jP
	jQxT+N15ljJeqbFe3jeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moCnb-00BkJv-Gl; Fri, 19 Nov 2021 22:56:03 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moCnW-00BkGE-Ou
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 22:56:00 +0000
Received: by mail-pj1-x102b.google.com with SMTP id v23so8977533pjr.5
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 14:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TkFeT+O19YuAYlRK1DqrnGfsfAPgPV+33DhTteERFEk=;
 b=WU+a+R1sdUftGW3C0KIpSbX+5CC1CLh1q1bk0t2wOMXqvl80qxz3NjTh77F92U/7qp
 nNJA7m6rkVgkhI+HrJ1FwGYUBuYt6TVk0w6S/E6y0qMxsMXjAChgjDz7e2McUQzaokbt
 HfLC8GLVMj5vtrUUwgfZrzI0DL1rRMK2Fk3vFsEjPp3dJyRbZt4aWZ+22yYYe8VQhcLF
 2lWfv7rWzC+SFua/2UxDgNSiL8Adr3RYFKUWAeG/AV83xnh1S3LYTdKJP5JxcRa8FiXE
 zOg4hPJ6OmOvX0lKK9xYBX5CtwPT0Ted3q7wuXWTaZJnLeXCtp8E03UMuSJrIkEQ/6oS
 p+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TkFeT+O19YuAYlRK1DqrnGfsfAPgPV+33DhTteERFEk=;
 b=kA5LCkH18lUh41PQa4lhn9xtpSa6o5GyWV3jR0uIsJZ7NvLhLBnH5wdZsIfodUqs13
 /tNkn4Owz5mP7ApJExw5/0T7p3FEMKZP6U2HLfdptNlLmV/3KxY8vXI5eLVMwy9LhPvC
 p/6d8HmqGuaMFof7BNbdC0IJUWyoK+wbFZFHJo2ksu33zgVzsyyCfb6OX4PLcghavm6q
 30kDn8qTrRp92M0/eLxPGBwAXkX5Kp9iJ51A95u8zRgQxr/e4bnhuuEkCoQleJ+XwcJo
 UtRk9+dsWZcw1D8tCXH4/t+ztfsUTfTFEEk09QKBc2BFxehSZBZkiCG5R6amVwMbjfdA
 uOGw==
X-Gm-Message-State: AOAM532T5G/A7tRy7mlfsp/XmaRpioULVRafrP3LHsLmFSI4Yk26cSCW
 vU+lMLs9rSdP42qsTgWlewY=
X-Google-Smtp-Source: ABdhPJzURh5oEO0gZPxIAmtArMB21liFitqJULRyvCxT+uRMVG0Fbk/v7IAO3jHI/LzAwlJBiRkOBg==
X-Received: by 2002:a17:903:22c6:b0:141:fac1:b722 with SMTP id
 y6-20020a17090322c600b00141fac1b722mr83226064plg.23.1637362557268; 
 Fri, 19 Nov 2021 14:55:57 -0800 (PST)
Received: from localhost.lan ([2400:4070:175b:7500::7a7])
 by smtp.gmail.com with ESMTPSA id s14sm629192pfk.73.2021.11.19.14.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 14:55:56 -0800 (PST)
Received: from x2.lan (localhost [127.0.0.1])
 by localhost.lan (Postfix) with ESMTPSA id 3B8CB900958;
 Fri, 19 Nov 2021 22:55:55 +0000 (GMT)
From: Vincent Pelletier <plr.vincent@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
Subject: [PATCH v3 4/6] riscv: dts: sifive unmatched: Expose the FU740 core
 supply regulator
Date: Fri, 19 Nov 2021 22:55:40 +0000
Message-Id: <5ab111e71e88d545d7f03233f10b6d84ef3d6c21.1637362542.git.plr.vincent@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <378c64fb868b595430b0068a9af10fdbeceb8e12.1637362542.git.plr.vincent@gmail.com>
References: <378c64fb868b595430b0068a9af10fdbeceb8e12.1637362542.git.plr.vincent@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_145558_848408_937409F6 
X-CRM114-Status: GOOD (  11.03  )
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

UHJvdmlkZXMgbW9uaXRvcmluZyBvZiBjb3JlIHZvbHRhZ2UgYW5kIGN1cnJlbnQ6CnRwczU0NGIy
MC1pMmMtMC0xZQpBZGFwdGVyOiBpMmMtb2NvcmVzCnZvdXQxOiAgICAgICA5MDYuMDAgbVYKdGVt
cDE6ICAgICAgICAtNDAuMMKwQyAgKGhpZ2ggPSArMTI1LjDCsEMsIGNyaXQgPSArMTUwLjDCsEMp
CmlvdXQxOiAgICAgICAgIDUuMDYgQSAgKG1heCA9ICsyMC4wMCBBLCBjcml0IG1heCA9ICsyNi4w
MCBBKQoKU2lnbmVkLW9mZi1ieTogVmluY2VudCBQZWxsZXRpZXIgPHBsci52aW5jZW50QGdtYWls
LmNvbT4KCi0tLQpOb3RlOiBjaGVja3BhdGNoLnBsIGNvbXBsYWlucyBhYm91dCB1bmRvY3VtZW50
ZWQgZGV2aWNldHJlZSBiaW5kaW5nLAp3aGljaCBpcyBmaXhlZCBieToKICBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1kZXZpY2V0cmVlLzIwMjExMTE2MTEwMjA3LjY4NDk0LTEta3J6eXN6
dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tL1QvI3UKCkNoYW5nZXMgc2luY2UgdjI6Ci0gRml4
IGVuZC1vZi1jb21taXQtbWVzc2FnZSBzZXBhcmF0b3Igc28gY2hhbmdlIGxpc3RzIGRvIG5vdCBl
bmQgdXAgaW4gdGhlbS4KQ2hhbmdlcyBzaW5jZSB2MToKLSBBZGRlZCBtaXNzaW5nICJ0aSwiIHBy
ZWZpeCBpbiBjb21wYXRpYmxlIHN0cmluZy4KLSBSZW1vdmUgdHJhaWxpbmcgIi4iIG9uIHN1Ympl
Y3QgbGluZS4KLSBSZW5hbWUgdHJlZSBub2RlLgotLS0KIGFyY2gvcmlzY3YvYm9vdC9kdHMvc2lm
aXZlL2hpZml2ZS11bm1hdGNoZWQtYTAwLmR0cyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9o
aWZpdmUtdW5tYXRjaGVkLWEwMC5kdHMgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZp
dmUtdW5tYXRjaGVkLWEwMC5kdHMKaW5kZXggMjcwMzYwYjI1OGI3Li42ZTc3NzVmZGFlMzIgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hpZml2ZS11bm1hdGNoZWQtYTAw
LmR0cworKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVkLWEw
MC5kdHMKQEAgLTUxLDYgKzUxLDExIEBAICZ1YXJ0MSB7CiAmaTJjMCB7CiAJc3RhdHVzID0gIm9r
YXkiOwogCisJcmVndWxhdG9yQDFlIHsKKwkJY29tcGF0aWJsZSA9ICJ0aSx0cHM1NDRiMjAiOwor
CQlyZWcgPSA8MHgxZT47CisJfTsKKwogCXRlbXBlcmF0dXJlLXNlbnNvckA0YyB7CiAJCWNvbXBh
dGlibGUgPSAidGksdG1wNDUxIjsKIAkJcmVnID0gPDB4NGM+OwotLSAKMi4zMy4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
