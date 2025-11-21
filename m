Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC800CFC29A
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 19:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DUbVqy4/hXFNa8IQ3Lk6BF82BLQD7+I56dLfSuZauBk=; b=Ctsoj+JuVDOOQ5
	CQr5mKDIsBDibupXKS0vCz5M+WpAQhGDcDvt3OxEUxOnPEvEWYyiLyRH1T57VRG+Rl1w6ic0UQwQn
	O6FeB4VQw/zDr3J4UErSyJtUXSaUkZv/3zvlxEd+eZZhp8DPt9REI8SvuCaLLHeTHG+STBC9KDyW3
	pbcUv6qAAj65R36+WJjSx1aQGO255jZ0JkQzBtJlWjckpdHUuaoFtsSy+ORevbYFBJA17AvEPcfIH
	77T5aVnfvUPskNPBn3X3ccTC9DM50AvZfyoTA2iRE+AmVufHXXtj1zCJPNCBr+ObaMI2uPKa2TRjd
	PWHw726iQDo2vmwjaiig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMWut-00000008uR2-1j3L;
	Fri, 21 Nov 2025 19:35:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMWuq-00000008uPS-1P9w
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 19:35:34 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso23147315e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 11:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763753730; x=1764358530; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UpgOvXCNlXgopds0RDI/6vX/kTvFLO9tMaU8rBilFFA=;
        b=kqXs6i/qJKhgmpnYLYsJfGYP+kdSzfV14sHJPzOXZhn+CGSj9eIISDoqy1RY4RZ6tC
         Gpm25ZS3qnMu9Fw6ctjPpczz/LarSa0gGd0dPOukxqXXJP/pFtQioojg9ZAXZVezV95X
         Rt40ZuZ6TsjODsxpuoNKXWSR6ZoAAuC4pliI5jlwQLY80JBXo893Hhgaqj0iFiYsOG/V
         to89AFV3rt8MwSUlFC1KnN5ZFCUK+DeLrRP/kBcm3C9YkJXHlDCarle/71WPr4V67UlY
         Mr8lpujSkCjdsINAAlMXaDMJAX3MZz3XXfgq/veC5G23QCsIoRROAx0ATGBY45/rvcwg
         8qTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763753730; x=1764358530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpgOvXCNlXgopds0RDI/6vX/kTvFLO9tMaU8rBilFFA=;
        b=TBNZLwUyMP9qfhQureBRbV/zMDpNmL4dRQV4almk0flzADvFEbfKy4RosCcpyyWiXb
         JyAM4EwzxQQIO6TppZpNbM3O4o78RnSFDKUSdek+PA/G/Q8kaq16M+bEqinHvqFSLwmv
         W5r72xvNRDo1EXtkZbEZTlO4XdwohAwI54hQoPaDGrBbAzjjPsKBmu0iz6MiA5MeOdIf
         Wq33Mg5bD2B12RysQ9CQEAHvd/VF316AkuQKg2FIb4bG4sZqx8per+bccsVZtXvd7k8e
         aZTaNSV+3HmpsNDUmz2Z4+6XepReAIv70aeP3KaSQcQg6k8W83IDS06jKho1SmVVCuqS
         KExw==
X-Forwarded-Encrypted: i=1; AJvYcCXDkxfdVJheoiOw7DI8ZUQEGNx2H0WrDKKelM2Zct5HpidqYrVAwqZnY/5ePCI/O9APqWWqJ0iWbAXiXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1wFn+OGCtVK3wz0yB9bfwTVAZ+7VIeHNJrzUZjxMMuJPDNp7f
	Zybk2K0gOPHf+5asJXZvzVKUaYCG7wSvCYA1Khj6cf5Sp/MO6Zw+Xol4emu1/IbIIJ0=
X-Gm-Gg: ASbGncvAo9uVi5uWiTh3lzVgcqWrEmUIPys5Bf5f2+CvfLh/27AWgG4m9yCO2xCHRa5
	/ZP0C5YWnAT/JjpU4BYkQdj+Ekbnwrrip/lLX1Ej59CGaooOJTWOOSCsTVBF0kqa8ZIs0Cti+4X
	BUoaPJSHnDB4118BcDzb9ngetA050IcDurP1VRzl3p4SsZMA9chhPNXGPT9QwXUIqh6AgVZS9e4
	ipmoI4BNMj/kHdmpW5v/z9rf9q3MGRDHcb8YKbtTOa9SK0O5hxh1nJoZ2Suf9qDlDsAz9g0L3u5
	IUgaydC+vSpS7K2KycyA5RaiMyi/CFoD4bdh8PCMEo5y2n+sKRz57xMnzqhnk/fVUERxJHD1K2b
	76kf5gA7CL9JvDR6s3m3e3rIsYSZr5xZjjLyIUT0XZvLEw2iwzR1FRba0i7VOtuStVx9SEHWGLd
	fXprmD
X-Google-Smtp-Source: AGHT+IGHmJQ/SUK/Uv0tWBBylSXC+SBhd5okhyM0xJCUkSd/MynCjS9RE29tfg6Rpn0kSFhSmIpQiA==
X-Received: by 2002:a05:600c:4443:b0:475:da1a:5418 with SMTP id 5b1f17b1804b1-477c017484bmr38877365e9.1.1763753729949;
        Fri, 21 Nov 2025 11:35:29 -0800 (PST)
Received: from curiosity ([80.211.22.60])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477bf3af0e1sm55186045e9.10.2025.11.21.11.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 11:35:29 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Charlie Jenkins <charlie@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH] riscv: hwprobe: expose vector register length in bytes
Date: Fri, 21 Nov 2025 22:35:10 +0300
Message-ID: <20251121193524.1813200-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_113532_390087_F1606EBD 
X-CRM114-Status: GOOD (  17.78  )
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

VGhlIHZlY3RvciByZWdpc3RlciBsZW5ndGggY2FuIGJlIG9idGFpbmVkIGZyb20gdGhlIHJlYWQt
b25seSBDU1IgdmxlbmIuCkhvd2V2ZXIgcmVhZGluZyB0aGlzIENTUiBtYXkgYmUgdW5kZXNpcmFi
bGUgaW4gc29tZSBjYXNlcy4gWFRoZWFkVmVjdG9yCmV4dGVuc2lvbiBpcyBvbmUgZXhhbXBsZTog
ZXhpc3RpbmcgaW1wbGVtZW50YXRpb25zIG1heSBub3QgcHJvdmlkZSB0aGlzCnJlZ2lzdGVyLiBP
biBzdWNoIHBsYXRmb3JtcywgdmxlbmIgaXMgc3BlY2lmaWVkIGFzIGRldmljZS10cmVlIHByb3Bl
cnR5LgpSZWFkaW5nIHZsZW5iIGFsc28gaW5pdGlhbGl6ZXMgdGhlIGFwcGxpY2F0aW9u4oCZcyB2
ZWN0b3IgY29udGV4dCwgZXZlbgp0aG91Z2ggdGhlIGFwcGxpY2F0aW9uIG1heSBkZWNpZGUgbm90
IHRvIHVzZSB0aGUgdmVjdG9yIGV4dGVuc2lvbiBiYXNlZApvbiB0aGUgcmVwb3J0ZWQgbGVuZ3Ro
LgoKTWVhbndoaWxlIHRoZSBrZXJuZWwgYWxyZWFkeSBkZXRlcm1pbmVzIHZsZW5iIGF0IGJvb3Qs
IGVpdGhlciBmcm9tIHRoZQpDU1Igb3IgZnJvbSB0aGUgZGV2aWNlIHRyZWUuIFNvIGFkZCBSSVND
Vl9IV1BST0JFX0tFWV9WRUNUT1JfUkVHX0xFTkdUSAp0byBleHBvc2UgdGhlIHZlY3RvciByZWdp
c3RlciBsZW5ndGggYWxyZWFkeSBrbm93biB0byB0aGUga2VybmVsLgoKU2lnbmVkLW9mZi1ieTog
U2VyZ2V5IE1hdHl1a2V2aWNoIDxnZW9tYXRzaUBnbWFpbC5jb20+Ci0tLQogRG9jdW1lbnRhdGlv
bi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0ICB8IDMgKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2h3cHJvYmUuaCAgICAgIHwgMiArLQogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJv
YmUuaCB8IDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAgICB8IDYgKysr
KysrCiA0IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgYi9Eb2N1bWVu
dGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKaW5kZXggMDZjNTI4MGI3MjhhLi4xNDQzN2Zl
NzkyNzYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAor
KysgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKQEAgLTM3OSwzICszNzks
NiBAQCBUaGUgZm9sbG93aW5nIGtleXMgYXJlIGRlZmluZWQ6CiAKICogOmM6bWFjcm86YFJJU0NW
X0hXUFJPQkVfS0VZX1pJQ0JPUF9CTE9DS19TSVpFYDogQW4gdW5zaWduZWQgaW50IHdoaWNoCiAg
IHJlcHJlc2VudHMgdGhlIHNpemUgb2YgdGhlIFppY2JvcCBibG9jayBpbiBieXRlcy4KKworKiA6
YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfVkVDVE9SX1JFR19MRU5HVEhgOiBBbiB1bnNpZ25l
ZCBpbnQgd2hpY2gKKyAgcmVwcmVzZW50cyB0aGUgdmVjdG9yIHJlZ2lzdGVycyBsZW5ndGggaW4g
Ynl0ZXMuCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oCmluZGV4IDhjNTcyYTQ2NDcxOS4uYjEwMzEx
YzlhNDRjIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaAorKysg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaApAQCAtOCw3ICs4LDcgQEAKIAogI2lu
Y2x1ZGUgPHVhcGkvYXNtL2h3cHJvYmUuaD4KIAotI2RlZmluZSBSSVNDVl9IV1BST0JFX01BWF9L
RVkgMTUKKyNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9NQVhfS0VZIDE2CiAKIHN0YXRpYyBpbmxpbmUg
Ym9vbCByaXNjdl9od3Byb2JlX2tleV9pc192YWxpZChfX3M2NCBrZXkpCiB7CmRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2h3cHJvYmUuaAppbmRleCAxZWRlYTIzMzFiOGIuLmJkNmNkOTdjODFmOSAx
MDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAorKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCkBAIC0xMTAsNiArMTEwLDcgQEAg
c3RydWN0IHJpc2N2X2h3cHJvYmUgewogI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9WRU5ET1Jf
RVhUX1NJRklWRV8wCTEzCiAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX1ZFTkRPUl9FWFRfTUlQ
U18wCTE0CiAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX1pJQ0JPUF9CTE9DS19TSVpFCTE1Cisj
ZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX1ZFQ1RPUl9SRUdfTEVOR1RICTE2CiAvKiBJbmNyZWFz
ZSBSSVNDVl9IV1BST0JFX01BWF9LRVkgd2hlbiBhZGRpbmcgaXRlbXMuICovCiAKIC8qIEZsYWdz
ICovCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jIGIvYXJjaC9y
aXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwppbmRleCAwZjcwMWFjZTNiYjkuLjMwMDc0MzJmYmRm
MSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYworKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCkBAIC0zMjgsNiArMzI4LDEyIEBAIHN0YXRpYyB2
b2lkIGh3cHJvYmVfb25lX3BhaXIoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCWh3cHJv
YmVfaXNhX3ZlbmRvcl9leHRfbWlwc18wKHBhaXIsIGNwdXMpOwogCQlicmVhazsKIAorCWNhc2Ug
UklTQ1ZfSFdQUk9CRV9LRVlfVkVDVE9SX1JFR19MRU5HVEg6CisJCXBhaXItPnZhbHVlID0gMDsK
KwkJaWYgKGhhc192ZWN0b3IoKSB8fCBoYXNfeHRoZWFkdmVjdG9yKCkpCisJCQlwYWlyLT52YWx1
ZSA9IHJpc2N2X3ZfdnNpemUgLyAzMjsKKwkJYnJlYWs7CisKIAkvKgogCSAqIEZvciBmb3J3YXJk
IGNvbXBhdGliaWxpdHksIHVua25vd24ga2V5cyBkb24ndCBmYWlsIHRoZSB3aG9sZQogCSAqIGNh
bGwsIGJ1dCBnZXQgdGhlaXIgZWxlbWVudCBrZXkgc2V0IHRvIC0xIGFuZCB2YWx1ZSBzZXQgdG8g
MAotLSAKMi41MS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
