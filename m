Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2513D1CDC7
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 09:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jX+MqMjiUtGNYl0pZIbg3jGRYJea0wdguqzX1fsuaZo=; b=l6LLvMbWBs4BgK
	vP+pk6LARaR3mdjgNn3qZzWzvHzLGTvTBFMIQrUjD6PJjZPeiz3a+aMRgCBQs2JFmCtePzcIeM7FQ
	HpLxvDQ+YCnCa8jhwGqcwxjxIVDty19h7WIgQBBY8HI4MJP6mGcplZP0VUsMjemkfSGBuehxfuCJr
	hof9PGEq/A3OqEwCKn1uyANGvjOWd0E+CS6iEBQB8ONxFEodZAfbLyS2EDaSEgodBWvaeE97HOdKY
	7B6ia/JUCL2gwj3xeZayWS3K/H2HBP8EiWOnvcfW2OFSClv/n+rKNCXVbUuN3UE4hGAop/8xqEQsg
	I4jvIM6gEP+fw/HAy3+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3B22-0000000AJhv-3whi;
	Tue, 22 Oct 2024 09:18:26 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Aya-0000000AIgh-2GHg
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 09:15:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4315baec69eso49606835e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 22 Oct 2024 02:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729588491; x=1730193291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u+Ce6P5RF48gD0XhfV+y0NeuodQPMoeEQKAr6HVeP34=;
        b=Ove+EBmlBqSya1NhyN7ZwpitStdRblTX+c9aZJbPjq4NH6EdOyJ4Gj7RjUJ1wnXlB9
         RbAls9VxE4hZ0fyGiKlGiONA7zMZa+eI+AfeOBAED3n95z4PNqTHHLq9lyZ3QVTJXZqu
         63+nE7FeLHJHiaq3dxujtAtnKtlmtxBKCPmzVXHRAzknFI/x9i2NXMC0KCYKyCSlX99e
         y3iY8Nz5qucHiRxleKpZPt1xT05G7UD+MXhN+ExGMEmrFqg3SdsEjJRJLRMjLQU0ttWk
         MU6tk4LYkXWILaAn2EDuNTPj3hsg8pY60Sd1ZpAqrBKo+BkrYCfftaELmz6eImg/n3xQ
         MCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729588491; x=1730193291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u+Ce6P5RF48gD0XhfV+y0NeuodQPMoeEQKAr6HVeP34=;
        b=tu1giX8A7sVJ6DEbdWkIcMkttMPSw1WFdxkwg/JjuIjje4mT6tcPfp7KGqvJ7JzWNh
         g57kk/b3DWGz/9F4qrjI+7sUnifdArKwdrj26Ql82+877AZLaAN6u6TbxgodtH5D6ckq
         mkwX2zANhCN8gJtrM5GgzPyLgkQT6WMgHWZlKP6Sd0qXnmUwULZ5SOqr2wp/hSMRQrL2
         RFGi3Yq+kZIQ37AJZrzms/4sWyUSiw6kPzEp1EUhvbwOfiO/e7XmgogU1k3oey1MDQ7H
         czG7+aVEfQ23QSkk7ILbxblbB4gRXxAd/xqS+Lzk1c7YRqW5jVyjRfb+135/LbzxudVW
         3Wrw==
X-Forwarded-Encrypted: i=1; AJvYcCXb/zqpA641jtZyV7oDls9SiikMm/O813mOTbxuZmV2qGFTTeI1XX0+xGPntG4AvE6Kt8GRNTJSR/gTvw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMzzp7NTrDXZf4wK5kOqozDKuUJiEfhLhn/Z3cKuxPCD5VGe0J
	QPz6xABDEES+oIIsLJzsexCP9PzH6F2mMpVGpsHJ6hedcZbKwtKu7ROVMfeetms=
X-Google-Smtp-Source: AGHT+IGSZ7hXuOPiBnKJ80f3kh4bwm35T7Mh6wQsjbYYod2Um2bK+tnJ8Ws++vN/tExtuJyxDde5xA==
X-Received: by 2002:a05:600c:3b9b:b0:426:6edf:6597 with SMTP id 5b1f17b1804b1-4316166935bmr97924455e9.19.1729588490663;
        Tue, 22 Oct 2024 02:14:50 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f57ff39sm83236635e9.19.2024.10.22.02.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 02:14:50 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Guo Ren <guoren@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: dts: Replace deprecated snps,nr-gpios property for snps,dw-apb-gpio-port devices
Date: Tue, 22 Oct 2024 11:14:30 +0200
Message-ID: <20241022091428.477697-8-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=WK/0LdKFbPMfiz0jXghdmvctcvAjN/2uBQOa4CAPCn4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnF2z9UjIq/g+EG2cheX43I7fYIirHGaIyMcSL6 GvcEIby3WCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZxds/QAKCRCPgPtYfRL+ TjYSB/9yX4xh/UisMykfoqvoPvjxs3/A5iGBDtToBjltzaBMnkWnkGw7wU2wMUs8ztcHjVB8xI1 XG2pszGgHqNo+yI+kFhs7kys01sYq/VyDcqi/xWNVGiFvVn3A2iq0Vq2ErMDap7c+QLonquMUmf W23/iH8F9wvGHW3F1i61sawW9cReeFQz+A7v+k0nFBz5N9o63o9phO8hokLniuDeQul/0dsuWL0 gOXyHro/w0hyh/JgQLeXCLenXoZYIepGQcn2jvu9mRUFidKIkkjlsFAyVdIsaH5/w7r9wCBKYGE /CH4AaSfUsrdZaBufXFOX2qdtyeQHXLgP48YwrH3SQ4luOkq
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_021452_608826_DFEEA1DB 
X-CRM114-Status: GOOD (  10.93  )
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

c25wcyxkdy1hcGItZ3Bpby1wb3J0IGlzIGRlcHJlY2F0ZWQgc2luY2UgY29tbWl0IGVmNDJhOGRh
M2NmMwooImR0LWJpbmRpbmdzOiBncGlvOiBkd2FwYjogQWRkIG5ncGlvcyBwcm9wZXJ0eSBzdXBw
b3J0IikuIFRoZQpyZXNwZWN0aXZlIGRyaXZlciBzdXBwb3J0cyB0aGlzIHNpbmNlIGNvbW1pdCA3
NTY5NDg2ZDc5YWUgKCJncGlvOiBkd2FwYjoKQWRkIG5ncGlvcyBEVC1wcm9wZXJ0eSBzdXBwb3J0
Iikgd2hpY2ggaXMgaW5jbHVkZWQgaW4gTGludXggdjUuMTAtcmMxLgoKVGhpcyBjaGFuZ2Ugd2Fz
IGNyZWF0ZWQgdXNpbmcKCglnaXQgZ3JlcCAtbCBzbnBzLG5yLWdwaW9zIGFyY2gvcmlzY3YvYm9v
dC9kdHMgfCB4YXJncyBwZXJsIC1wIC1pIC1lICdzL1xic25wcyxuci1ncGlvc1xiL25ncGlvcy8K
Ci4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAYmF5
bGlicmUuY29tPgotLS0KIGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi5kdHNpIHwg
NiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLmR0c2kgYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDIuZHRzaQppbmRleCA0ZTVmYTY1OTE2MjMu
LmU2MmFjNTFhYzU1YSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cy
MDQyLmR0c2kKKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLmR0c2kKQEAg
LTExMiw3ICsxMTIsNyBAQCBwb3J0MGE6IGdwaW8tY29udHJvbGxlckAwIHsKIAkJCQljb21wYXRp
YmxlID0gInNucHMsZHctYXBiLWdwaW8tcG9ydCI7CiAJCQkJZ3Bpby1jb250cm9sbGVyOwogCQkJ
CSNncGlvLWNlbGxzID0gPDI+OwotCQkJCXNucHMsbnItZ3Bpb3MgPSA8MzI+OworCQkJCW5ncGlv
cyA9IDwzMj47CiAJCQkJcmVnID0gPDA+OwogCQkJCWludGVycnVwdC1jb250cm9sbGVyOwogCQkJ
CSNpbnRlcnJ1cHQtY2VsbHMgPSA8Mj47CkBAIC0xMzQsNyArMTM0LDcgQEAgcG9ydDFhOiBncGlv
LWNvbnRyb2xsZXJAMCB7CiAJCQkJY29tcGF0aWJsZSA9ICJzbnBzLGR3LWFwYi1ncGlvLXBvcnQi
OwogCQkJCWdwaW8tY29udHJvbGxlcjsKIAkJCQkjZ3Bpby1jZWxscyA9IDwyPjsKLQkJCQlzbnBz
LG5yLWdwaW9zID0gPDMyPjsKKwkJCQluZ3Bpb3MgPSA8MzI+OwogCQkJCXJlZyA9IDwwPjsKIAkJ
CQlpbnRlcnJ1cHQtY29udHJvbGxlcjsKIAkJCQkjaW50ZXJydXB0LWNlbGxzID0gPDI+OwpAQCAt
MTU2LDcgKzE1Niw3IEBAIHBvcnQyYTogZ3Bpby1jb250cm9sbGVyQDAgewogCQkJCWNvbXBhdGli
bGUgPSAic25wcyxkdy1hcGItZ3Bpby1wb3J0IjsKIAkJCQlncGlvLWNvbnRyb2xsZXI7CiAJCQkJ
I2dwaW8tY2VsbHMgPSA8Mj47Ci0JCQkJc25wcyxuci1ncGlvcyA9IDwzMj47CisJCQkJbmdwaW9z
ID0gPDMyPjsKIAkJCQlyZWcgPSA8MD47CiAJCQkJaW50ZXJydXB0LWNvbnRyb2xsZXI7CiAJCQkJ
I2ludGVycnVwdC1jZWxscyA9IDwyPjsKCmJhc2UtY29tbWl0OiA3NDM2MzI0ZWJkMTQ3NTk4Zjk0
MGRkZTEzMzViNzk3OWRiY2NjMzM5Ci0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
