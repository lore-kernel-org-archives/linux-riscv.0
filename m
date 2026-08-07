Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDEDC5AC7A
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 07:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQp+Z42gnPEtnUDvJWI6I2yHxBK16ziHevX6yB6tDs8=; b=pmEqhNw8T3Mqro
	Zsi7/XaDCHjknNvG86eq/Ff7CY3/ZqcZXWb25RnOzLEpkep5zvCV53slxaR0HqTnc93dE+7JpGXmS
	A66yFnEAE4ZAAMtB7BZM1rvhCdFMEFBpUTYEC3tJMX6W0Ea1a/14kT89Ua0Nh0v0kTSCZ4qAZ36bO
	HZx+4cF2uhPCEJX0pU0z3nzORpv+No8ghXaXkAnVpKi1yxWlbjivArprizy3jLHsuytjGT+cOHQ/T
	FUV5ugyqV1dWenvjiCYXqGpveyJSW0qscXdq5T60lglGGv/TWBY2AKdYo/6hG3ZNhlG2m7amJFvl0
	iXaLUetCrt87nj8fRqqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFCY-00000007G6r-2TDB;
	Fri, 07 Aug 2026 07:41:10 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFCW-00000007G3L-2ssF
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 07:41:09 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47de008b020so1077677f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 00:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088467; x=1786693267; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F8aHbeVjWIKrFsYTmN2+DAuK82NyrvO/pruFApuuKdA=;
        b=H7GROwV0A1V71D3py6rvPabYfOhzoSEoXOrCfPzVFlJ6HWgQXNSbPfV6pmS1t6a4Nk
         NIm60D9CDqR+A03VtlEVtIsPd3mIcJD5V72FeDJdqrUBFhsqtI1oF9pFFCauIieAjgsV
         OND4CVZaofQJZiwtcXMxC+Jzbkw7SntA4iV4DXA+vH/EeUULqYcCa9F0xHV3zoVQLFtz
         Tx4vkFmJk+e/sch8SzVGu/Yl6SANRq9dUuUey4/6p22PAlk2WqYKW1txrVT0GGz84+Ua
         C1MsEsvFOkeNucxDs2/7XXRzKyRQwGgjeGa7Uuxb5TtgYm1ZddAVY2qtrpwZXt0DXkl3
         peNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088467; x=1786693267;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8aHbeVjWIKrFsYTmN2+DAuK82NyrvO/pruFApuuKdA=;
        b=B5IbgZz1NOyGK8nPxcWX3RUWBE8DjNFR/BgpQ66l+ArOTLLUcvn1A5FtQgrh/KvV2x
         VXmniQEffJmXuRL3JTtGwY98fiRLc3Me73Y0oknBgQxcHkHHU+Jj2bIb3Qzm6zl+Ttkd
         ngmdn9wi4t75A3yUPu+gJgSCO+sLZEw5VMuFI/PpusU//QLCnK9GJmaVxSpkoQpoox0e
         mm9MnVCOeseeiRhsNmrGbXkIzfbexofrDuvIiDt5wvOlrQo69Y0pFhRAVrzFJ6fciieY
         +Pj7xyoZdEIIFZTHKSvMVr08BXwE58B1RJGImbp0l8GLB4tgHjq2tNgSWw6u+tWg1Ao2
         gxow==
X-Forwarded-Encrypted: i=1; AHgh+Rr0e1knJG5IRMmS4Zw9llCkqHwbp0o9vw8mvtj6N0hGssNLf37TDKikUf2ISZQA7Trz4p69vCF15d8iRA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKKOTx+ZnN/qdjOjYhNeEnEoZUdM2uk4dCh1aPoGcM8csC3HZy
	7lms96MsL07+33/1IPFszT6Z90TQfPZx/1hnefD96CPg45TmGlg+YWQwFe3zguMMours
X-Gm-Gg: AR+sD12oFYUXy4P643Y9xE3Xr3K+46gSecEYH16W0Or9NR7LIqYiX8CPCXPqqQSO4cZ
	PDA5HyBnEqtqpdxlAGUeJJujoulTZZ7S4ODhrLP0DKTqaTsGYwo/FA3pw3eAKGDkiAcJMZB+89b
	R4YeBInMi0wbPlf0jzhhpMxar7GCLjk6gRwut951TG7yXYKaYBSjsI8Tv8tO+AORCiasC8dD3bX
	TbIJ+bBLQpuc9DTvapspK9xYVyi47qVuUqXCcschqMoIGeETO+cpUwlH9k6irRYGB/mEc7mAGRD
	mbNoWRNMyi8NS+euzygbx7TxqMHP6+QrAfwHVC4ApO/yEaE+aHJl1IGHe/rKizr/wqqB/cDQPWZ
	YavOaj6SCD14ab3QUHHuWX6hIP8kevz987J1F81EU7SG0xCdoFdAZXh7BPAxgRxTypMZPtEBGZU
	f+fS6mVfElxwN3p1jXTir4lG7Q2ufaossfDxjarc++bKZr5WZzCLFWqgpd6nvlR0I=
X-Received: by 2002:a05:6000:2913:b0:47f:ecbb:55fa with SMTP id ffacd0b85a97d-47ff4bc1a11mr16115409f8f.5.1786088467028;
        Fri, 07 Aug 2026 00:41:07 -0700 (PDT)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f90f8sm2819904f8f.26.2026.08.07.00.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:41:06 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux@armlinux.org.uk,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 5/6] virt: bao: consolidate the IPC hypercall ID in include/linux/bao.h
Date: Fri,  7 Aug 2026 08:39:32 +0100
Message-ID: <db869ed90e16691ea1f0aee051e54daf89f42de8.1786010512.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786010512.git.jpeixoto@osyx.tech>
References: <cover.1786010512.git.jpeixoto@osyx.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_004108_751892_50AB85D4 
X-CRM114-Status: GOOD (  13.28  )
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

VGhlIElQQyBzaGFyZWQtbWVtb3J5IGh5cGVyY2FsbCBJRCB3YXMgcGFzc2VkIGFzIGEgcGFyYW1l
dGVyIHRocm91Z2ggZWFjaAphcmNoaXRlY3R1cmUncyBiYW9faXBjc2htZW1faHlwZXJjYWxsKCkg
YW5kIGRlZmluZWQgbG9jYWxseSBpbiBpcGNzaG1lbS5jLgpEZWZpbmUgaXQgb25jZSBpbiBpbmNs
dWRlL2xpbnV4L2Jhby5oLCBuZXh0IHRvIHRoZSBSZW1vdGUgSS9PIGh5cGVyY2FsbApJRCwgYW5k
IHJlZmVyZW5jZSBpdCBkaXJlY3RseSBmcm9tIHRoZSBhcmNoIGhlbHBlcnMuIEFzIHRoZXJlIGlz
IG9ubHkgb25lCklQQyBoeXBlcmNhbGwsIHRoaXMgYWxzbyBsZXRzIGJhb19pcGNzaG1lbV9oeXBl
cmNhbGwoKSBkcm9wIGl0cwpoeXBlcmNhbGxfaWQgcGFyYW1ldGVyLgoKU2lnbmVkLW9mZi1ieTog
Sm/Do28gUGVpeG90byA8anBlaXhvdG9Ab3N5eC50ZWNoPgotLS0KdjM6Ci0gUmV3cml0ZSB0aGUg
Y29tbWl0IG1lc3NhZ2UgdG8gZXhwbGFpbiB3aHkgdGhlIElEIGlzIGNvbnNvbGlkYXRlZCBhbmQg
dG8KICBkZXNjcmliZSB0aGUgYmFvX2lwY3NobWVtX2h5cGVyY2FsbCgpIHBhcmFtZXRlciByZW1v
dmFsIGl0IHBlcmZvcm1zCiAgKEdyZWcgS0gpLgotIFRoZSBoZWxwZXIgbm93IHRha2VzIGEgc2lu
Z2xlIGFyZ3VtZW50IGFuZCBmaXRzIG9uIG9uZSBsaW5lOyB1bndyYXAgdGhlCiAgcmVtYWluaW5n
IGZldy1jaGFyIGxpbmUgd3JhcHMgKEFuZHJldyBKb25lcykuCgogYXJjaC9hcm0vaW5jbHVkZS9h
c20vYmFvLmggICAgICAgICAgIHwgNSArKy0tLQogYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9iYW8u
aCAgICAgICAgIHwgNSArKy0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9iYW8uaCAgICAgICAg
IHwgNiArKy0tLS0KIGRyaXZlcnMvdmlydC9iYW8vaXBjc2htZW0vaXBjc2htZW0uYyB8IDUgKy0t
LS0KIGluY2x1ZGUvbGludXgvYmFvLmggICAgICAgICAgICAgICAgICB8IDMgKysrCiA1IGZpbGVz
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Jhby5oIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20vYmFvLmgK
aW5kZXggZWNhMjU4Y2M5NGUzLi5hN2Q2MDg0OTM3MjMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2lu
Y2x1ZGUvYXNtL2Jhby5oCisrKyBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Jhby5oCkBAIC0xNiwx
NCArMTYsMTMgQEAKICNpbmNsdWRlIDxsaW51eC9hcm0tc21jY2MuaD4KICNpbmNsdWRlIDxsaW51
eC9iYW8uaD4KIAotc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGJhb19pcGNzaG1lbV9oeXBl
cmNhbGwodW5zaWduZWQgbG9uZyBoeXBlcmNhbGxfaWQsCi0JCQkJCQkgICB1bnNpZ25lZCBsb25n
IGlwY3NobWVtX2lkKQorc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGJhb19pcGNzaG1lbV9o
eXBlcmNhbGwodW5zaWduZWQgbG9uZyBpcGNzaG1lbV9pZCkKIHsKIAlzdHJ1Y3QgYXJtX3NtY2Nj
X3JlcyByZXM7CiAKIAlhcm1fc21jY2NfaHZjKEFSTV9TTUNDQ19DQUxMX1ZBTChBUk1fU01DQ0Nf
RkFTVF9DQUxMLCBBUk1fU01DQ0NfU01DXzMyLAogCQkJCQkgQVJNX1NNQ0NDX09XTkVSX1ZFTkRP
Ul9IWVAsCi0JCQkJCSBoeXBlcmNhbGxfaWQpLAorCQkJCQkgQkFPX0lQQ1NITUVNX0hZUEVSQ0FM
TF9JRCksCiAJCSAgICAgIGlwY3NobWVtX2lkLCAwLCAwLCAwLCAwLCAwLCAwLCAmcmVzKTsKIAog
CXJldHVybiByZXMuYTA7CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2Jhby5o
IGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9iYW8uaAppbmRleCAxZGMwOWEyYzI2MWIuLjViZDJh
OGM5OTA1ZCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9iYW8uaAorKysgYi9h
cmNoL2FybTY0L2luY2x1ZGUvYXNtL2Jhby5oCkBAIC0xNiwxNCArMTYsMTMgQEAKICNpbmNsdWRl
IDxsaW51eC9hcm0tc21jY2MuaD4KICNpbmNsdWRlIDxsaW51eC9iYW8uaD4KIAotc3RhdGljIGlu
bGluZSB1bnNpZ25lZCBsb25nIGJhb19pcGNzaG1lbV9oeXBlcmNhbGwodW5zaWduZWQgbG9uZyBo
eXBlcmNhbGxfaWQsCi0JCQkJCQkgICB1bnNpZ25lZCBsb25nIGlwY3NobWVtX2lkKQorc3RhdGlj
IGlubGluZSB1bnNpZ25lZCBsb25nIGJhb19pcGNzaG1lbV9oeXBlcmNhbGwodW5zaWduZWQgbG9u
ZyBpcGNzaG1lbV9pZCkKIHsKIAlzdHJ1Y3QgYXJtX3NtY2NjX3JlcyByZXM7CiAKIAlhcm1fc21j
Y2NfaHZjKEFSTV9TTUNDQ19DQUxMX1ZBTChBUk1fU01DQ0NfRkFTVF9DQUxMLCBBUk1fU01DQ0Nf
U01DXzY0LAogCQkJCQkgQVJNX1NNQ0NDX09XTkVSX1ZFTkRPUl9IWVAsCi0JCQkJCSBoeXBlcmNh
bGxfaWQpLAorCQkJCQkgQkFPX0lQQ1NITUVNX0hZUEVSQ0FMTF9JRCksCiAJCSAgICAgIGlwY3No
bWVtX2lkLCAwLCAwLCAwLCAwLCAwLCAwLCAmcmVzKTsKIAogCXJldHVybiByZXMuYTA7CmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Jhby5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9iYW8uaAppbmRleCA2ZGMwY2IxM2M5NGMuLmE1ODdhNmFiZDU0ZSAxMDA2NDQKLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9iYW8uaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2Jhby5oCkBAIC0yNiwxMyArMjYsMTEgQEAKICAqLwogI2RlZmluZSBCQU9fU0JJX0VYVF9JRCAw
eDA4MDAwYmEwCiAKLXN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBiYW9faXBjc2htZW1faHlw
ZXJjYWxsKHVuc2lnbmVkIGxvbmcgaHlwZXJjYWxsX2lkLAotCQkJCQkJICAgdW5zaWduZWQgbG9u
ZyBpcGNzaG1lbV9pZCkKK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBiYW9faXBjc2htZW1f
aHlwZXJjYWxsKHVuc2lnbmVkIGxvbmcgaXBjc2htZW1faWQpCiB7CiAJc3RydWN0IHNiaXJldCBy
ZXQ7CiAKLQlyZXQgPSBzYmlfZWNhbGwoQkFPX1NCSV9FWFRfSUQsIGh5cGVyY2FsbF9pZCwgaXBj
c2htZW1faWQsIDAsIDAsIDAsIDAsCi0JCQkwKTsKKwlyZXQgPSBzYmlfZWNhbGwoQkFPX1NCSV9F
WFRfSUQsIEJBT19JUENTSE1FTV9IWVBFUkNBTExfSUQsIGlwY3NobWVtX2lkLCAwLCAwLCAwLCAw
LCAwKTsKIAogCXJldHVybiByZXQuZXJyb3I7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnQv
YmFvL2lwY3NobWVtL2lwY3NobWVtLmMgYi9kcml2ZXJzL3ZpcnQvYmFvL2lwY3NobWVtL2lwY3No
bWVtLmMKaW5kZXggMGQ0NmQ4OWVlNzg4Li41YmYzN2MxYzc5MzMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvdmlydC9iYW8vaXBjc2htZW0vaXBjc2htZW0uYworKysgYi9kcml2ZXJzL3ZpcnQvYmFvL2lw
Y3NobWVtL2lwY3NobWVtLmMKQEAgLTE0LDkgKzE0LDYgQEAKIAogI2RlZmluZSBCQU9fSVBDU0hN
RU1fTkFNRV9MRU4gMTYKIAotLyogSVBDIHRocm91Z2ggc2hhcmVkLW1lbW9yeSBoeXBlcmNhbGwg
SUQgKi8KLSNkZWZpbmUgQkFPX0lQQ1NITUVNX0hZUEVSQ0FMTF9JRCAweDEKLQogc3RydWN0IGJh
b19pcGNzaG1lbSB7CiAJc3RydWN0IG1pc2NkZXZpY2UgbWlzY2RldjsKIAl1MzIgaWQ7CkBAIC0x
MDQsNyArMTAxLDcgQEAgc3RhdGljIHNzaXplX3QgYmFvX2lwY3NobWVtX3dyaXRlKHN0cnVjdCBm
aWxlICpmaWxwLCBjb25zdCBjaGFyIF9fdXNlciAqYnVmLAogCSpwcG9zICs9IGNvdW50OwogCiAJ
LyogTm90aWZ5IEJhbyBoeXBlcnZpc29yICovCi0JYmFvX2lwY3NobWVtX2h5cGVyY2FsbChCQU9f
SVBDU0hNRU1fSFlQRVJDQUxMX0lELCBiYW8tPmlkKTsKKwliYW9faXBjc2htZW1faHlwZXJjYWxs
KGJhby0+aWQpOwogCiAJcmV0dXJuIGNvdW50OwogfQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9iYW8uaCBiL2luY2x1ZGUvbGludXgvYmFvLmgKaW5kZXggMDc2ZjA3MTA4NmI2Li4xN2Q2ZWE0
NzI1MjEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvYmFvLmgKKysrIGIvaW5jbHVkZS9saW51
eC9iYW8uaApAQCAtMTUsNiArMTUsOSBAQAogCiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KIAor
LyogSVBDIHRocm91Z2ggc2hhcmVkLW1lbW9yeSBoeXBlcmNhbGwgSUQgKi8KKyNkZWZpbmUgQkFP
X0lQQ1NITUVNX0hZUEVSQ0FMTF9JRCAweDEKKwogLyogUmVtb3RlIEkvTyBIeXBlcmNhbGwgSUQg
Ki8KICNkZWZpbmUgQkFPX1JFTUlPX0hZUEVSQ0FMTF9JRCAweDIKIAotLSAKMi40My4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
