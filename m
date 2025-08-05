Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2476C87FDA
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ID31k2mz7BnNmHP1kLp3WiNIPiVsjB6LVfgSOHPfqOs=; b=fJbADXNx+f11Zi
	R1ExXgXDunhY3mabdx2kQF+2v4NaXCuQN7mcb/JWl/4wa6QQFkTKY80AapIIPBNjgRHLX0rDwnd3d
	c2P3bVe1C2d0fzmtExdbZD3ScUEuVGc0Nb2j79MPlJNydPnO0ke3Z1XbLLFXJbYRHUNY3y2j4R7SM
	VQS0+p19JakRbkaNSsXhnEJ9nopsk5i5OajNbYZH5yOJrHUykx8gU6Tvc0Ij3tnxsYQ+kXbOwC3D5
	J50D7y/PMPVJZ25PL41jel7lpTCfKeyGMDsSXODY+INB0xeTHnwzu/zxuTVhTI2sXYvYBDCwGOCKJ
	kajOkA6b4z5bTDiIdCpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujFSR-0000000CYgv-1VGq;
	Tue, 05 Aug 2025 11:03:51 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujFJ1-0000000CXZi-17qV
	for linux-riscv@lists.infradead.org;
	Tue, 05 Aug 2025 10:54:08 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3b788581079so285829f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Aug 2025 03:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1754391245; x=1754996045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WUiodtQBvKBTA/iKS7oNMgVKazgBWdic3Ly/8SfR7xc=;
        b=S0MmyEPojkzZyjyAUdMMF2qapmnb8pPMA8PJT7fZ2UPcpy6zBqZuIac9X4CMZ1VQPQ
         9AgwUTJdyNtOUX6IcHZsd+9CVOTYt89+xMR362bwEZJAnMtTlKYgOAR7GEBCJxjabdAn
         Q+FOVxo0q5sy4wg8tZIWQHbLBwv/olDA2QGJsDCH/6V8IAmyQUbAdS7QNtEzItHgHvom
         kFv4/LuUgwOFrqQmsNNrZ9S46I1uG7LTqGyNPGuQzw2n3FmMCA4MqrwjSda980czu86f
         Vl8LZJKQgxP2Oea8cZLRJdONdpDk5kl4dlNZ+s5GVsKDt7v9YqZQ1te59kkEYTYPdUKs
         Pr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754391245; x=1754996045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUiodtQBvKBTA/iKS7oNMgVKazgBWdic3Ly/8SfR7xc=;
        b=wHfL8oidoJE5JB0vwnrRM0A5hvJIWhiFLeH9m+qVFrF2j2oVC5JVb2nnxwISvs+/R9
         hMxnd16xFa4HqOQQpo4pygOqVxCAPdqsOzfWljxQY9UPnp2figaY7mNinNsxKQ2WgHRi
         A3cMjQYgnQnp2WdnTCxv9nAquTxWD06Nm3VEP9sIeH0Ueny49anIua8uaQA4Sy5xBfvQ
         YLS9i0Od6MHNJ5yni2QohvPLIp2AEoAcLTrMjkGotRfwq56tfm00uk2AltkBM+LmbDka
         gCZZy8Mh1U++43L/r6LZpVe4Og4CFPlEgurnY0Vh2mH8FtHOc8+4b+dtKD4Frw7aI/Cp
         YBhA==
X-Forwarded-Encrypted: i=1; AJvYcCWlKGlG50kA6J5Lp2KRw1v4hiwIHqHuSkNul+Byhxp0QFSzB3YdHfCbTOf4DrpZAMz/r3NjiwzMQEQnxA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3X4HdIBIef6PvuAl4lUsa0dPbFbN9vlIZwYip7kzLB0NRQ22+
	AK6LcSKkuQ5+VKy/18jLYjbw/UpEQWFyEGxSYjJrE7fMwvzPrb8/4hYI2JYgE80XPUE=
X-Gm-Gg: ASbGncu2S/kKyQWRtTSSuNFwTLhqI6g5VRnA+T4GT033S8jLTiNz/wIFf9rUx+Dzwh9
	hTOvjF9H8Tvi+q53z02Bbm3ZBk35lT6wfVPRT2rVN+92VPJoQGMhvXEdZcVLfMgmtLj/mIPuLhU
	HeG+kn1KoD3IcksicCxMPIwPiC+SR7Fqc+v8J7O5QdDkjpYXL5mqMS//DItj8PxGgyPclD4uV5W
	n2W25aOGBv4DTEJ5VPTDfH5HleKkJ/KO/9bf+5QSmOo3umOqYCuE8129WhHr1ZA9x6Ec5S/H0g1
	XBd5NLClf5GzK8ftB7/AUxl0Zmz/juUQgHCrFWFNbPphicOmnRjgJDP8YNIUeMFZQ198B/r5IBK
	uiXSc4Ld2jtLHjj/tIZST39904ZzSF8d/TOuyl5M=
X-Google-Smtp-Source: AGHT+IEpOsq0FAVja98/mlRReMdSEb+xPNZ7ZEoi0EN4dXoUtDCJVpNHURSd1y/tvYFRXGJZtratYw==
X-Received: by 2002:a05:6000:1a86:b0:3b7:99a8:bf6d with SMTP id ffacd0b85a97d-3b8d94b6fa0mr3885890f8f.11.1754391245272;
        Tue, 05 Aug 2025 03:54:05 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:d884:b809:d57:1ad7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3abf0csm18344450f8f.14.2025.08.05.03.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 03:54:04 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: kvm-riscv@lists.infradead.org
Cc: kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	stable@vger.kernel.org
Subject: [PATCH] RISC-V: KVM: fix stack overrun when loading vlenb
Date: Tue,  5 Aug 2025 12:44:21 +0200
Message-ID: <20250805104418.196023-4-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_035407_315286_D9018C3D 
X-CRM114-Status: UNSURE (   8.99  )
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

VGhlIHVzZXJzcGFjZSBsb2FkIGNhbiBwdXQgdXAgdG8gMjA0OCBiaXRzIGludG8gYW4geGxlbiBi
aXQgc3RhY2sKYnVmZmVyLiAgV2Ugd2FudCBvbmx5IHhsZW4gYml0cywgc28gY2hlY2sgdGhlIHNp
emUgYmVmb3JlaGFuZC4KCkZpeGVzOiAyZmEyOTAzNzJkZmUgKCJSSVNDLVY6IEtWTTogYWRkICd2
bGVuYicgVmVjdG9yIENTUiIpCkNjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KU2lnbmVkLW9m
Zi1ieTogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+Ci0tLQogYXJj
aC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYwppbmRleCBhNWY4OGNiNzE3ZjMuLjA1ZjNjYzJkOGUz
MSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYworKysgYi9hcmNoL3Jp
c2N2L2t2bS92Y3B1X3ZlY3Rvci5jCkBAIC0xODIsNiArMTgyLDggQEAgaW50IGt2bV9yaXNjdl92
Y3B1X3NldF9yZWdfdmVjdG9yKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAkJc3RydWN0IGt2bV9j
cHVfY29udGV4dCAqY250eCA9ICZ2Y3B1LT5hcmNoLmd1ZXN0X2NvbnRleHQ7CiAJCXVuc2lnbmVk
IGxvbmcgcmVnX3ZhbDsKIAorCQlpZiAocmVnX3NpemUgIT0gc2l6ZW9mKHJlZ192YWwpKQorCQkJ
cmV0dXJuIC1FSU5WQUw7CiAJCWlmIChjb3B5X2Zyb21fdXNlcigmcmVnX3ZhbCwgdWFkZHIsIHJl
Z19zaXplKSkKIAkJCXJldHVybiAtRUZBVUxUOwogCQlpZiAocmVnX3ZhbCAhPSBjbnR4LT52ZWN0
b3IudmxlbmIpCi0tIAoyLjUwLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
