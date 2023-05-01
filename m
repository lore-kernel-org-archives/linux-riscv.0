Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A57FC77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  1 May 2023 21:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i6mgN4eKKv3XfVvhAU6Cj9+86iagVF41Pvwkm3gj9Ww=; b=lnyevCOSDvp7tT
	iNJq2fve74P/oufuj3mL35Do/LoswCImt6LdSWJ8HTlnACPvYRLTFQI/uZp2VwchD4lai5A6SIUAQ
	KSZiFlA2WhLQD1vsDQfz2m/XOMNA52xVNVVQX4L1uWZoTfl56QHpq17vigd6qCAYDuRqDrdJ7yMgD
	ovSeZno0yACsFbuIUcbPfUq+ta/BCzEPdJaMYGqMt4NB9JnyjZ1WYUYRHrmelSrCgTFR0pLPuId9D
	454pP4YwxcygEhu48GOAp8i32cKsDBftdZbHhPpD/wNIAZ+H2EKzrwnPOp9b023RLERw6Nw4kjAkR
	E9ruPbxYRnSivgIHTNwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptafe-00Gy9I-0u;
	Mon, 01 May 2023 21:02:54 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptafZ-00Gy75-2M
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 21:02:53 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-63b7096e2e4so2338641b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 14:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682974967; x=1685566967;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fctEC41u76rTML4CTTx2jHE+S5zx89fZLmwJsiIL5So=;
        b=gg6yVxNsBS5x4HtlfKW+Oxy+TgP/Op/y9K/EVFxOQfNO52SSvoDUOn8N6xzYKeEfko
         vGLAVc8SOZP5ecmjgvNQ73oT3hEfuH4gdCcoq3iP1jAzcYe3Csi1mVG9F+8uXLKs8RSt
         +6+51X+rhf4ZAeVr5XOxmEtsG+7SZZz9Zgw70ccJubeB1Z62q2Nb+jbrZkOzzik+HSb2
         DmWrnvOhIvsWqFWRWr8e0aXOqF7alJb1XW2wS5CQDUbX4hMcUCkgfmrX5ghL2eP97NK/
         u7h42xhr5BUHkwH68wK9RFNhvluEjf5jdIJb7vFyec5n1J7vn/KVdjIjzNryxfjRXwIx
         X7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682974967; x=1685566967;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fctEC41u76rTML4CTTx2jHE+S5zx89fZLmwJsiIL5So=;
        b=a1J4uqaWMDUoKqLmQ8XDZ6dc05nsQ93sYXL576asSwR2PRvH5d6henneT1JTWdXndW
         XCY4rU0bnjDTXb0PRBadlcTufndtwblZB+WxL8u9Gyi4vzMoPdfDD1tdOwMHKuq5kSPW
         muYIh49zcUtCSmng/Yny1emwb8axZMkAsttbIxECKeeabw8d/B6Dq5GPsSlVuVh2QY5g
         O8LCZeybBii1vTH0y1hlZw67kcV4hq9T+ybFstESmRb8e+yQFQ3ZiKpuCiyLwMSE4tB2
         X7NsC2W/1LKcEV/Knizx8MhdN0lKC9cG7eT4ZV1M76hNO7MTL0qfJonxl1sVlYDIunL/
         TZtg==
X-Gm-Message-State: AC+VfDxH7eAI0EjgpOWXxAYWPz1zrco5vAbTkRb+jhyRwUD6ppBcP3HD
	GoFqiAjyTyplQoDDgFwfJWsm4g==
X-Google-Smtp-Source: ACHHUZ4Ou1HmHNgzOMSKxKB0s/OG17wi9Y6JHqnnmaYaJhcqoFkGF9PKAJGiOBUpRXnSdrb0GO4XXg==
X-Received: by 2002:a05:6a00:1515:b0:63d:2aac:7b88 with SMTP id q21-20020a056a00151500b0063d2aac7b88mr23713638pfu.25.1682974967051;
        Mon, 01 May 2023 14:02:47 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:1f1:1360:eb9b:387])
        by smtp.gmail.com with ESMTPSA id i12-20020a056a00224c00b0063d670ad850sm20899151pfu.92.2023.05.01.14.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 14:02:46 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Mon, 01 May 2023 14:05:21 -0700
Subject: [PATCH RFC v2 1/2] RISC-V: Detect the Ssqosid extension
MIME-Version: 1.0
Message-Id: <20230430-riscv-cbqri-rfc-v2-v2-1-8e3725c4a473@baylibre.com>
References: <20230430-riscv-cbqri-rfc-v2-v2-0-8e3725c4a473@baylibre.com>
In-Reply-To: <20230430-riscv-cbqri-rfc-v2-v2-0-8e3725c4a473@baylibre.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Ved Shanbhogue <ved@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 James Morse <james.morse@arm.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 Drew Fustini <dfustini@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1682975186; l=2210;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=HJmdwjdD3oLAOaRVmOzd9g/qKji+rF7c3nA/VaibzyY=;
 b=ABdeu5blg0kipm7ff+tcUDspwu9/Irg+HwQba+62HXEonmYZL76N4bgM+Fsa4Ab/8OoFAS9k2
 HPZVbMh27zGA7a1Hz2eau+u3sSuY3Bohb2Wx6PMWXeBvQksg/b7W95y
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_140249_772174_C81D11AE 
X-CRM114-Status: UNSURE (   9.42  )
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

RnJvbTogS29ybmVsIER1bMSZYmEgPG1pbmRhbEBzZW1paGFsZi5jb20+CgpEZXRlY3QgdGhlIFNz
cW9zaWQgZXh0ZW5zaW9uIChTdXBlcnZpc29yLW1vZGUgUXVhbGl0eSBvZiBTZXJ2aWNlIElEKSBh
cwpkZWZpbmVkIGluIHRoZSBDQlFSSSAoQ2FwYWNpdHkgYW5kIEJhbmR3aWR0aCBRb1MgUmVnaXN0
ZXIgSW50ZXJmYWNlKQpzcGVjaWZpY2F0aW9uLgoKTGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jp
c2N2LW5vbi1pc2EvcmlzY3YtY2JxcmkvYmxvYi9tYWluL3Jpc2N2LWNicXJpLnBkZgpTaWduZWQt
b2ZmLWJ5OiBLb3JuZWwgRHVsxJliYSA8bWluZGFsQHNlbWloYWxmLmNvbT4KW2RmdXN0aW5pOiBy
ZWJhc2UgZnJvbSB2Ni4wIHRvIHY2LjNdClNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZGZ1
c3RpbmlAYmF5bGlicmUuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8
IDIgKysKIGFyY2gvcmlzY3Yva2VybmVsL2NwdS5jICAgICAgICB8IDEgKwogYXJjaC9yaXNjdi9r
ZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRleCA5YWY3OTM5NzA4NTUuLjZkZDcxNzAzMDcyMyAx
MDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCisrKyBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vaHdjYXAuaApAQCAtNDQsNiArNDQsOCBAQAogI2RlZmluZSBSSVNDVl9J
U0FfRVhUX1pJSElOVFBBVVNFCTMyCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfU1ZOQVBPVAkJMzMK
ICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSUNCT1oJCTM0CisjZGVmaW5lIFJJU0NWX0lTQV9FWFRf
U1NRT1NJRAkJMzUKKwogCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfTUFYCQk2NAogI2RlZmluZSBS
SVNDVl9JU0FfRVhUX05BTUVfTEVOX01BWAkzMgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJu
ZWwvY3B1LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYwppbmRleCAzZGYzODA1MmRjYmQuLjI5
YzRkNDU4Mzc3YSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvY3B1LmMKQEAgLTE4Niw2ICsxODYsNyBAQCBzdGF0aWMgc3RydWN0IHJp
c2N2X2lzYV9leHRfZGF0YSBpc2FfZXh0X2FycltdID0gewogCV9fUklTQ1ZfSVNBX0VYVF9EQVRB
KHppaGludHBhdXNlLCBSSVNDVl9JU0FfRVhUX1pJSElOVFBBVVNFKSwKIAlfX1JJU0NWX0lTQV9F
WFRfREFUQSh6YmIsIFJJU0NWX0lTQV9FWFRfWkJCKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShz
c2NvZnBtZiwgUklTQ1ZfSVNBX0VYVF9TU0NPRlBNRiksCisJX19SSVNDVl9JU0FfRVhUX0RBVEEo
c3Nxb3NpZCwgUklTQ1ZfSVNBX0VYVF9TU1FPU0lEKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShz
c3RjLCBSSVNDVl9JU0FfRVhUX1NTVEMpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHN2aW52YWws
IFJJU0NWX0lTQV9FWFRfU1ZJTlZBTCksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc3ZuYXBvdCwg
UklTQ1ZfSVNBX0VYVF9TVk5BUE9UKSwKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2Nw
dWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwppbmRleCA1MjU4NWUw
ODg4NzMuLmM4MjQ2OThiMjAzMSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwpAQCAtMjI5LDYgKzIy
OSw3IEBAIHZvaWQgX19pbml0IHJpc2N2X2ZpbGxfaHdjYXAodm9pZCkKIAkJCX0gZWxzZSB7CiAJ
CQkJLyogc29ydGVkIGFscGhhYmV0aWNhbGx5ICovCiAJCQkJU0VUX0lTQV9FWFRfTUFQKCJzc2Nv
ZnBtZiIsIFJJU0NWX0lTQV9FWFRfU1NDT0ZQTUYpOworCQkJCVNFVF9JU0FfRVhUX01BUCgic3Nx
b3NpZCIsIFJJU0NWX0lTQV9FWFRfU1NRT1NJRCk7CiAJCQkJU0VUX0lTQV9FWFRfTUFQKCJzc3Rj
IiwgUklTQ1ZfSVNBX0VYVF9TU1RDKTsKIAkJCQlTRVRfSVNBX0VYVF9NQVAoInN2aW52YWwiLCBS
SVNDVl9JU0FfRVhUX1NWSU5WQUwpOwogCQkJCVNFVF9JU0FfRVhUX01BUCgic3ZuYXBvdCIsIFJJ
U0NWX0lTQV9FWFRfU1ZOQVBPVCk7CgotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
