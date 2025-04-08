Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8482EC369A1
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 07:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/CoJLNz5qYcdM5/tGDU6QTZfXg9ilHomen0mzGo41qA=; b=03UuuztnjzQ0oS
	zkGiTI2nXWpHQMcXcDT0Zyik+ho0pUAYrvfFEDsT6ERtPKUSNhXAAJqIIZ/wn3SvofNviSAe3r2Hl
	nzmezxc4TVtc68UwQ/bp83h3LeKTC53hyeBDSnqfGcGAJJqm7shYcUq1lgsBnqf58haj8J25ibfsY
	IL/WQeyZ3z5lKBSzM5VSa/qv0p00eT2ekrgRYpOpzCe/yd6cKAufyp8O9y+6aeyNmesGZRlpc9Nty
	gCKiixXqTXO6AJ4Ouf4RPjCObjqh4Ea/Zg2SwR5TGfHyrUAx0tLQ356hNJ3m/8FkxHSj9MvQkITAU
	l81FJNTtqpNboK2rb/tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23Ut-000000035ry-0Fiw;
	Tue, 08 Apr 2025 07:35:51 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23OC-0000000347f-2MT2
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 07:29:03 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so3182697f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Apr 2025 00:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744097335; x=1744702135; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C0cTQmfSj1JKjmotOYm2ZctqRJNrdyoR/IHdMM1ZjqE=;
        b=l3VC/dxfDLqID64tbTo486gHpEB+eoYxVn3Zl1Unu+c2FnmL/U9e9UB9mNWWxf7Q24
         tzH2Yu2+0fObX7Xe+jUz09E6NWsg1WnCkPm1s/qr14c71mldjw/8BiG7YkijstMiz01u
         +y8XBmmOGURbbgdbwzIx0wiDAQQ7c9tervrJX65kAG0z9/KDh0/lHMHhR7cg9DwoBU60
         y4FLbsOqM4IIo8rm4dl8+VdEiF9kIWOHEdDHWdnlK61+FVgsTEejGMKRplZjz5dkFRcJ
         jNYd3A8wvDum+4nBTitPWRCckpPG3Fafjdz5ofu/YElNwO9hoVwCx7bo4MFEuI/AXKDo
         t7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097335; x=1744702135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0cTQmfSj1JKjmotOYm2ZctqRJNrdyoR/IHdMM1ZjqE=;
        b=eei+eEPM1C6lFkCf1zjByXWkgtVw0WE/6RtmZzT20N4q+VWiJpjlCvEkq0TuGAvq37
         3SlhdK2jZyCUsc3pd0bChvUvTCi4sdXL+Qy/5lASZw9ClOHOycqZN/xANZipZuQO1vF8
         2wfFagexXdjdQQ2f47y6eTof1A+TkqVFCmEdI18ZBalgdQlyZkEcGpRkiIO0xpXMEe1G
         mixVRIzEptZrUeaBDO2+T6XNVe4ynRrA6VfLv/1TSAGWjcjafTvaMZ45BFZDMgXUUYsh
         KUG7q0jhXQRiG6jyJOi+LHBGNjp81SejK9Y5S7MpXYgwdGba+yWL9fjJBc62O8MxwZZZ
         seEg==
X-Forwarded-Encrypted: i=1; AJvYcCUPp5Bib5swK247Mdw4VYcrDawwcCWfjXGHvDAsNXG9hDMUzR5i6DSN5DXE07iStiylX9+VP1efqXwa0w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk49utsik2qrsU5zAP2KEnWU32soNHjinDvgE+DRpOyL5eesvJ
	JSL1twKqyIIWot6kseoFObdWCF79KsZ2jh1XVEI0bvtfSscexuVb8amq+1fhjUE=
X-Gm-Gg: ASbGncvFUYxwMhlGhiizGSTySsilFwe5zS743DKapAzqMyyzj9q01A1iwYhnSdWgIUP
	Ljs9zXUytbp1u78ZSST+sUjyGDr+rYB/RfABWBQeE65dKShdlelUWQqrT3FEEAv5Y4LidPGjh3A
	JLLWuMmPFZxVLqeesmeWp+zC/b9NS4zt5smhl5pdAfCdlCBsV1Xwamr6XZJjfT/cImYpQnW3BLW
	inN1w3JSzZ6CV/UyRpM0ZTseKmtXTV8p5jtGX97Hm+iCTcgjNdpQ3EUIrS4OKKBiUi7YIXzcoY3
	VlKp5y66f5DHmszftwNTG4+I+ZdiA3VLHseERBdqJRma/jGdon7m3UA+lXoPcCQ+ht2Cq8w=
X-Google-Smtp-Source: AGHT+IFz/8BWGlvn1oOub9ouIswew5ujgXC35R9BzFfnCHHdvTVfj960TEGZ4R6A4fumlfb695WeYg==
X-Received: by 2002:a05:6000:40da:b0:39c:3122:ad55 with SMTP id ffacd0b85a97d-39cb359703fmr12528490f8f.18.1744097335011;
        Tue, 08 Apr 2025 00:28:55 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:5b46:8918:c917:7872])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226da7sm14444737f8f.98.2025.04.08.00.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:28:54 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ard Biesheuvel <ardb@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3] scripts: Do not strip .rela.dyn section
Date: Tue,  8 Apr 2025 09:28:51 +0200
Message-Id: <20250408072851.90275-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_002856_869032_731060C6 
X-CRM114-Status: GOOD (  12.18  )
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

VGhlIC5yZWxhLmR5biBzZWN0aW9uIGNvbnRhaW5zIHJ1bnRpbWUgcmVsb2NhdGlvbnMgYW5kIGlz
IG9ubHkgZW1pdHRlZApmb3IgYSByZWxvY2F0YWJsZSBrZXJuZWwuCgpyaXNjdiB1c2VzIHRoaXMg
c2VjdGlvbiB0byByZWxvY2F0ZSB0aGUga2VybmVsIGF0IHJ1bnRpbWUgYnV0IHRoYXQgc2VjdGlv
bgppcyBzdHJpcHBlZCBmcm9tIHZtbGludXguIFRoYXQgcHJldmVudHMga2V4ZWMgdG8gc3VjY2Vz
c2Z1bGx5IGxvYWQgdm1saW51eApzaW5jZSBpdCBkb2VzIG5vdCBjb250YWluIHRoZSByZWxvY2F0
aW9ucyBpbmZvIG5lZWRlZC4KCkZpeGVzOiA1NTlkMWU0NWExNmQgKCJyaXNjdjogVXNlIC0tZW1p
dC1yZWxvY3MgaW4gb3JkZXIgdG8gbW92ZSAucmVsYS5keW4gaW4gaW5pdCIpClRlc3RlZC1ieTog
QmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQmrDtnJuIFTD
tnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgpBY2tlZC1ieTogQXJkIEJpZXNoZXV2ZWwgPGFyZGJA
a2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2
b3NpbmMuY29tPgotLS0KCkNoYW5nZXMgaW4gdjM6Ci0gUmViYXNlIG9uIHRvcCBvZiA2LjE1LXJj
MQotIENoYW5nZSB0aGUgZml4ZXMgdGFnCgpDaGFuZ2VzIGluIHYyOgotIENoYW5nZWxvZyBtb2Rp
ZmljYXRpb24gKEFyZCkKLSBSZW1vdmUgQVJDSF9XQU5UU19SRUxBX0RZTiAoQXJkKQoKIHNjcmlw
dHMvTWFrZWZpbGUudm1saW51eCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMvTWFrZWZpbGUudm1saW51eCBi
L3NjcmlwdHMvTWFrZWZpbGUudm1saW51eAppbmRleCBiMGE2Y2Q1YjgxOGMuLjg1ZDYwZDk4NjQw
MSAxMDA2NDQKLS0tIGEvc2NyaXB0cy9NYWtlZmlsZS52bWxpbnV4CisrKyBiL3NjcmlwdHMvTWFr
ZWZpbGUudm1saW51eApAQCAtMTMsNyArMTMsNyBAQCBpZmRlZiBDT05GSUdfQVJDSF9WTUxJTlVY
X05FRURTX1JFTE9DUwogdm1saW51eC1maW5hbCA6PSB2bWxpbnV4LnVuc3RyaXBwZWQKIAogcXVp
ZXRfY21kX3N0cmlwX3JlbG9jcyA9IFJTVFJJUCAgJEAKLSAgICAgIGNtZF9zdHJpcF9yZWxvY3Mg
PSAkKE9CSkNPUFkpIC0tcmVtb3ZlLXNlY3Rpb249Jy5yZWwqJyAkPCAkQAorICAgICAgY21kX3N0
cmlwX3JlbG9jcyA9ICQoT0JKQ09QWSkgLS1yZW1vdmUtc2VjdGlvbj0nLnJlbConIC0tcmVtb3Zl
LXNlY3Rpb249IScucmVsKi5keW4nICQ8ICRACiAKIHZtbGludXg6ICQodm1saW51eC1maW5hbCkg
Rk9SQ0UKIAkkKGNhbGwgaWZfY2hhbmdlZCxzdHJpcF9yZWxvY3MpCi0tIAoyLjM5LjIKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
