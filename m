Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7B3C3ABC0
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 15:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KsrMJzOgzMznFaCIJqkZ5pfWfqK7kKgfncuOpvXtNIE=; b=yRc9OZAnOfFdm/
	3evuDcEYKaFJbIFmBxEIQnkRIfaV+Wi2JAaPyjwX9+jqE5qiUAYONQegKsPiDVyqa+s/2knGM84WS
	gojFV4ZOs6aSfUpsHAwPnf4rWI2HxNEHjVoQWSQlizd6CRGF1Ed8dR1M51H5JI1ogCONWZtXU5W0S
	bS4bUn9CfN5+W/LEJ+K2/1AVh6h2iRx+sSxQOaOtrYzcp6bWSGUiMg7V1TO11+ILozObqLDwHqBrb
	vsHFvVZiweBBysW81g2EHJK6Zk0mEIBdu4py9mHbsoimctBstAqzRUl44cTRVfe8fWnHD70NSOn+V
	R+FLKj14AGt85AbtHj3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2r8-000000013hW-2P7L;
	Thu, 08 May 2025 15:08:14 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2Hu-00000000vvi-2Ixg
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 14:31:52 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a0b28d9251so161081f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 07:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746714709; x=1747319509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Npf5Cp02vjjlOhdcHZRyKHohJloygz1xYGChAUxnU34=;
        b=jbIwE+j6sZ0fJa7m0w/uguASlsDQX2q6W2t7mNgpZ+wQfdDFGKqV3FDS/HjjieVQ82
         t6+I2Evg2O9VCPaMQzR3sjict2PL9zGkimDmfhZHXlAOUfB6NOPUvfIu+Sl5C6Od2gOq
         K/OuXXAWhC5498ferczWZmYfSiOOHzYGVQtaWe1tPeTUWO5gJzHBgaBXYyH96xMVSU7U
         nuYNkfQkfXGKmrg3daiYfns5OGHTx2qIMHHigBONv5xFtY6A/XAJlrD0P+o0xFq8djW9
         Pj0rmYRG3JkmSR5SaBPZ7vFVh6SY9SmZ+HYkwyRiCZ0F+3s0i/dQGTtLM4CWYP9vh9jf
         Tb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714709; x=1747319509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Npf5Cp02vjjlOhdcHZRyKHohJloygz1xYGChAUxnU34=;
        b=uxl7Xx/f060aq+mL4X0Vw0/EZgR2YEatDfIGSAwiUCteEyRTY/uXc5WwIKqXBbsq87
         FBAbBHJ6qPD0bz8lRYlXR8Lw9kcr5hjviyWPYFgGq7FkAq7F8b+cGhyoH2QuZgMPpVn2
         QOQPIcJNgYY6DmS5xI3scgpLVuwaSWBjPOOYUX+5swGKIFD3sQcyEjq6EAqhSa6IaXvw
         6JAS+ljH/nWG1IQK4yViR2z9EPnw2pa9eMsoYIwxivHlqEjHwUNnhh8gg3avFabpt3+w
         SK5DeWt62gdieISUcJaPkmtjlh0aWfw6/rSR9ecuGE/8/pRW4uHdUcW/aup9oKlHW05T
         CF4g==
X-Forwarded-Encrypted: i=1; AJvYcCWw08m4YT+TSi84LXXdgtdO5twayWteuXX3R8uYRqYGlsKtSsRtXd7ew9Ok3OGmvdKmu7TbtMEKP5L5lA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsnPffTsHRvlh/zEzRiuhnpMuMdrGMyA9wMYlhh9jIeFT+/eua
	SvKUbFI72fG7fnzDgM5sQ/WJvptOc8p1XFUJJ/V6PYqR8maj+XSGTMv8An2EyPE=
X-Gm-Gg: ASbGncvxYp2XEoO5Irorl/VjevFB5SO94ysoWfiDODucQKMJI17ukuPp8v6fQixngd5
	e+Y1hmx1V8afDMinpfhp3CncYTgWY1FMKh8oKMSYUXAir86CD/ywFIqNA0ts+PJ+VpysURC5Cp4
	A7yOl5YyrCAkK7zF75zoBsrmRKCtRXSIvhHRX3X7EIbPkrJmANPsMcIuLU9yvZGJbXlEcfXRjCw
	W3+N3fbTVRkxdbMbxQsgsYJ5eiZOLORZY2TRHpuUKalINQ3/4+DUOg9fVGWOr2X1gIb4VxH1IAy
	aFzNJf8TEdjJ84kqc3NBRAaU54IIeMwBsapYhwrC/eFyjb6M
X-Google-Smtp-Source: AGHT+IFDKtOArIEDhyzzyyo9ibITZPppPGTsVRUFviwEpobpTYwXsYjaHuTW7dWWMam5suhtm71qqw==
X-Received: by 2002:a05:6000:2dc6:b0:3a0:b3ad:6636 with SMTP id ffacd0b85a97d-3a0b4a0356fmr2554909f8f.4.1746714708992;
        Thu, 08 May 2025 07:31:48 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:a451:a252:64ea:9a0e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecccbsm147512f8f.32.2025.05.08.07.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:31:48 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 1/2] KVM: RISC-V: reset smstateen in a better place
Date: Thu,  8 May 2025 16:28:42 +0200
Message-ID: <20250508142842.1496099-3-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508142842.1496099-2-rkrcmar@ventanamicro.com>
References: <20250508142842.1496099-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_073150_584952_49D802C4 
X-CRM114-Status: GOOD (  10.85  )
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

VGhpcyBnb3QgbWlzc2VkIHdoZW4gdGhlIHNlcmllcyB3YXMgYXBwbGllZCBvdXQgb2Ygb3JkZXIu
CgpTaWduZWQtb2ZmLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNv
bT4KLS0tCkZlZWwgZnJlZSB0byBzcXVhc2ggdGhpcyBwYXRjaCB3aXRoIDM3NmUzYzBmOGFhNSAo
IktWTTogUklTQy1WOiByZW1vdmUKdW5uZWNlc3NhcnkgU0JJIHJlc2V0IHN0YXRlIikuCi0tLQog
YXJjaC9yaXNjdi9rdm0vdmNwdS5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMg
Yi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKaW5kZXggN2NjMDc5Njk5OWViLi5hNzhmOWVjMmZhMGUg
MTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYworKysgYi9hcmNoL3Jpc2N2L2t2bS92
Y3B1LmMKQEAgLTYwLDYgKzYwLDcgQEAgc3RhdGljIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfY29udGV4
dF9yZXNldChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAKIAltZW1zZXQoY250eCwgMCwgc2l6ZW9m
KCpjbnR4KSk7CiAJbWVtc2V0KGNzciwgMCwgc2l6ZW9mKCpjc3IpKTsKKwltZW1zZXQoJnZjcHUt
PmFyY2guc21zdGF0ZWVuX2NzciwgMCwgc2l6ZW9mKHZjcHUtPmFyY2guc21zdGF0ZWVuX2Nzcikp
OwogCiAJLyogUmVzdG9yZSBkYXRhcCBhcyBpdCdzIG5vdCBhIHBhcnQgb2YgdGhlIGd1ZXN0IGNv
bnRleHQuICovCiAJY250eC0+dmVjdG9yLmRhdGFwID0gdmVjdG9yX2RhdGFwOwpAQCAtMTAxLDgg
KzEwMiw2IEBAIHN0YXRpYyB2b2lkIGt2bV9yaXNjdl9yZXNldF92Y3B1KHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSkKIAogCWt2bV9yaXNjdl92Y3B1X2NvbnRleHRfcmVzZXQodmNwdSk7CiAKLQltZW1z
ZXQoJnZjcHUtPmFyY2guc21zdGF0ZWVuX2NzciwgMCwgc2l6ZW9mKHZjcHUtPmFyY2guc21zdGF0
ZWVuX2NzcikpOwotCiAJa3ZtX3Jpc2N2X3ZjcHVfZnBfcmVzZXQodmNwdSk7CiAKIAlrdm1fcmlz
Y3ZfdmNwdV92ZWN0b3JfcmVzZXQodmNwdSk7Ci0tIAoyLjQ5LjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
