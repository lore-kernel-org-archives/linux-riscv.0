Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD3BCD128A
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 14:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tmhc1bF9DPoX/qz02p+egEwOmtQq3SLBxIqTAKVpGKY=; b=UxUGcsV2acrS5g
	emvLE+KPkIwoe2FajBC/qsO4Vnagg4YjiotveIddB8gSPBt2rs6MQFw9/23ilXLJzh/CEbEiijB1L
	gy6QmNe+knV9YBkjYZAVjMMQTwA5ALfHVTw2lpe05E8XT9jL9zWQITda1I8N0bKyIApHerzxdVh6h
	w2mfKBtz/RStiEoAv9jpU8ZiMmPqXhm6W1DBXWXgakXRE932guEImGHlk92Oym8wjKwP33MdhYFjB
	qdRu/MEpBItNE6Kx66OIXrHYePgRlkQVasW3cyo4fOon+L3WdkOkAJwBTcdjmH87nKnCDmfOo9+VC
	KXblwz673FKIdc2QjtnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZDR-00000007YdM-1NiM;
	Wed, 10 Apr 2024 14:46:21 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZDM-00000007Yan-1XVx
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 14:46:18 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-346407b8c9aso660087f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 07:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712760373; x=1713365173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ckqATcdgxJCfEplA12RhN0CYzD0p8U1UjWm+/+bzbPs=;
        b=BcARyjtsi4253Ay0KsAmfnmQ0wTQhCqjHRTHwJdCZIxFnk4gaX/2UftC7d7/UIYpSd
         swSu+yCuznPffZIAvtS1vgJqxA2K0GstEOXWIGqKLpHYi9dA19X9uHQdDT/5r2B7yPMx
         6OaMutktZgG7YWAYyOUHOZvlmbQlQi8n4n38MQgqf4V+183O0LQv40SVaa1CZv1ScdQO
         cPfqmebFH9i+TwnUgoM6edJ2fcXSnpBTU614gQtMm2Xk+ofolmvdl3kG0SZyr+jqxpZo
         2Zx46jwCCfEXKpWebVe93nEwmN2hQJI9J0Wtf/nil3PvVgcjBGYiRKHN2LX9rCNIEWXR
         J+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712760373; x=1713365173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ckqATcdgxJCfEplA12RhN0CYzD0p8U1UjWm+/+bzbPs=;
        b=jOwfjwhwlsbOCb/H86pmVEn5djvz57u6qA69fqo6+5GfzO2dimwYXl99MqbzSa9AsQ
         xwEoaEhg2JuO+Je4BQVN9wFXRkCj1Da2tigUFI22NdU91EctQDN1D0B09zrrKoHW7ScL
         JhYSd3LTxI5AxeQEd7hQ+CQThxBLfKeBWjf6DwH/uA93/IYXOZRUrC24Zmph49gLbd/R
         cLZrqfjs4YBwwV1cF0em0RQTDUSf+vY3wjVE0Sg2ZieQtr9CargeJOVJIw+a1fG/Z4R5
         dHyMA7olbE4f+R6HmSbS6+wXshIfbk80IGgFCaWXiIzTQP8Rtz5W4GgC1SByHy+fk7GO
         Ljig==
X-Forwarded-Encrypted: i=1; AJvYcCVZkiXhMpVSojrCxSkWOw3QMlX9FP6Lo/9QAPiJAUsooH1yeVAWgIS/07CwiQZ1NSIaHNnfi3rJSIUg1KL1a4eGe2MYeTb/vrMCxbJgHWRL
X-Gm-Message-State: AOJu0Yw+rXtdSJXZJn9NsPnuZzQuCOQIwty5o4eByeCGpWyrhejNSYQp
	dGnQffbIykeKU+ca/l1IVYbWcfIgLzAlpVekjV/kAM+8B8jT0X86KL9VkBQFlWs=
X-Google-Smtp-Source: AGHT+IHspjbKantHWWwZNJBqzLRXvPR+2MRMZ20TrdwY8/JbHDnXeP8XcmVLQ1yJ2+OlsOqgDRCxeA==
X-Received: by 2002:a5d:64e3:0:b0:343:ba58:1297 with SMTP id g3-20020a5d64e3000000b00343ba581297mr2344809wri.3.1712760373469;
        Wed, 10 Apr 2024 07:46:13 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:d4a6:5856:3e6c:3dff])
        by smtp.gmail.com with ESMTPSA id c9-20020adffb09000000b00345c2f84d5asm7068715wrr.10.2024.04.10.07.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 07:46:13 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Robin Ehn <rehn@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	"Stefan O'Rear" <sorear@fastmail.com>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: [PATCH v5] riscv: hwprobe: export highest virtual userspace address
Date: Wed, 10 Apr 2024 16:45:57 +0200
Message-ID: <20240410144558.1104006-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_074617_026705_ACDFE94E 
X-CRM114-Status: GOOD (  20.56  )
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

U29tZSB1c2Vyc3BhY2UgYXBwbGljYXRpb25zIChPcGVuSkRLIGZvciBpbnN0YW5jZSkgdXNlcyB0
aGUgZnJlZSBNU0JzCmluIHBvaW50ZXJzIHRvIGluc2VydCBhZGRpdGlvbmFsIGluZm9ybWF0aW9u
IGZvciB0aGVpciBvd24gbG9naWMgYW5kCm5lZWQgdG8gZ2V0IHRoaXMgaW5mb3JtYXRpb24gZnJv
bSBzb21ld2hlcmUuIEN1cnJlbnRseSB0aGV5IHJlbHkgb24KcGFyc2luZyAvcHJvYy9jcHVpbmZv
ICJtbXU9c3Z4eCIgc3RyaW5nIHRvIG9idGFpbiB0aGUgY3VycmVudCB2YWx1ZSBvZgp2aXJ0dWFs
IGFkZHJlc3MgdXNhYmxlIGJpdHMgWzFdLiBTaW5jZSB0aGlzIHJlZmxlY3QgdGhlIHJhdyBzdXBw
b3J0ZWQKTU1VIG1vZGUsIGl0IG1pZ2h0IGRpZmZlciBmcm9tIHRoZSBsb2dpY2FsIG9uZSB1c2Vk
IGludGVybmFsbHkgd2hpY2ggaXMKd2h5IGFyY2hfZ2V0X21tYXBfZW5kKCkgaXMgdXNlZC4gRXhw
b3J0aW5nIHRoZSBoaWdoZXN0IG1tYXBhYmxlIGFkZHJlc3MKdGhyb3VnaCBod3Byb2JlIHdpbGwg
YWxsb3cgYSBtb3JlIHN0YWJsZSBpbnRlcmZhY2UgdG8gYmUgdXNlZC4gRm9yIHRoYXQKcHVycG9z
ZSwgYWRkIGEgbmV3IGh3cHJvYmUga2V5IG5hbWVkClJJU0NWX0hXUFJPQkVfS0VZX0hJR0hFU1Rf
VklSVF9BRERSRVNTIHdoaWNoIHdpbGwgZXhwb3J0IHRoZSBoaWdoZXN0CnVzZXJzcGFjZSB2aXJ0
dWFsIGFkZHJlc3MuCgpMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vb3Blbmpkay9qZGsvYmxvYi9t
YXN0ZXIvc3JjL2hvdHNwb3Qvb3NfY3B1L2xpbnV4X3Jpc2N2L3ZtX3ZlcnNpb25fbGludXhfcmlz
Y3YuY3BwI0wxNzEgWzFdClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2lu
Yy5jb20+CgotLS0KVGVzdGluZzoKClRoaXMgbmV3IGh3cHJvYmUga2V5IGNhbiBiZSB0ZXN0ZWQg
dXNpbmcgcWVtdSBhbmQgYSBzaW1wbGUgaHdwcm9iZSBkdW1wIHRvb2w6Cmh0dHBzOi8vZ2l0aHVi
LmNvbS9jbGVtZW50bGVnZXIvaHdwcm9iZV9kdW1wL3RyZWUvZGV2L2NsZWdlci9oaWdoZXN0X3Zp
cnQKCnY1OgogLSBSZWJhc2VkIG9uIG1hc3RlciB0byBmaXggbWVyZ2UgY29uZmxpY3RzCiAtIExp
bmsgdG8gdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNDAzMTMwODQ1NTQuMzE5
MjUtMS1jbGVnZXJAcml2b3NpbmMuY29tLwoKdjQ6CiAtIEFkZGVkIENoYXJsaWUgUmV2aWV3ZWQt
YnkKIC0gUmVwbGFjZSBhIHRhYiBpbnN0ZWFkIG9mIGEgc3BhY2UKIC0gUmVzZW5kIHdpdGggYWN0
dWFsIFY0IHRhZyBpbiBmcm9udCBvZiBtZXNzYWdlIHdoaWNoIHdhcyBtaXNzaW5nCiAtIExpbmsg
dG8gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNDAzMDExNjQ0MDcuNDc1OTU3
LTEtY2xlZ2VyQHJpdm9zaW5jLmNvbS8KCnYzOgogLSBOb3RlOiBJIGRpZCBub3QgYWRkZWQgU3Rl
ZmFuIFJldmlld2VkLWJ5IHNpbmNlIEkgZGlkIG1vcmUKICAgbW9kaWZpY2F0aW9ucyB0aGFuIGp1
c3QgYSBzaW1wbGUgcmVzcGluLgogLSBIYW5kbGUgQ09ORklHX01NVT1uIGFzIHdlbGwgYW5kIHJl
bmFtZSB0aGUga2V5IHRvCiAgIFJJU0NWX0hXUFJPQkVfS0VZX0hJR0hFU1RfVklSVF9BRERSRVNT
CiAtIEFkZCBhIHVzZXJfbWF4X3ZpcnRfYWRkcigpIG1hY3JvIHRvIGhhbmRsZSAhTU1VIGNvbmZp
ZwogLSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjQwMjIwMTEw
OTUwLjg3MTMwNy0xLWNsZWdlckByaXZvc2luYy5jb20vCgp2MjoKIC0gTm90ZTogdHJpZWQgc3lz
Y29uZiB0byBleHBvcnQgaXQgYnV0IHRoaXMgaXMgbm90IGJhY2tlZCBieSBzeXNjYWxsCiAgIGFu
ZCB0aHVzIGRvZXMgbm90IGFsbG93IGV4cG9ydGluZyBzdWNoIGluZm9ybWF0aW9uIGVhc2lseS4K
IC0gVXNlIGFyY2hfZ2V0X21tYXBfZW5kKCkgaW5zdGVhZCBvZiBWQV9CSVRTIHNpbmNlIGl0IHJl
ZmxlY3RzIHRoZQogICBtYXhpbXVtIGxvZ2ljYWwgYWRkcmVzcyB1c2VkIGJ5IHRoZSByaXNjdiBw
b3J0CiAtIENoYW5nZSBod3Byb2JlIGtleSBuYW1lIGZyb20gUklTQ1ZfSFdQUk9CRV9LRVlfVkFf
QklUUyB0bwogICBSSVNDVl9IV1BST0JFX0tFWV9NQVhfQUREUkVTUwogLSBMaW5rIHRvIHYxOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjQwMjAxMTQwMzE5LjM2MDA4OC0xLWNsZWdl
ckByaXZvc2luYy5jb20vCi0tLQogRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0
ICB8IDMgKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaCAgICAgIHwgMiArLQog
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCAgICB8IDYgKysrKysrCiBhcmNoL3Jp
c2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9z
eXNfaHdwcm9iZS5jICAgICAgIHwgNCArKysrCiA1IGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlz
Y3YvaHdwcm9iZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKaW5k
ZXggYjJiY2M5ZWVkOWFhLi44NzVkMzEyMmJkNjYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24v
YXJjaC9yaXNjdi9od3Byb2JlLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdw
cm9iZS5yc3QKQEAgLTIxMCwzICsyMTAsNiBAQCBUaGUgZm9sbG93aW5nIGtleXMgYXJlIGRlZmlu
ZWQ6CiAKICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX1pJQ0JPWl9CTE9DS19TSVpFYDog
QW4gdW5zaWduZWQgaW50IHdoaWNoCiAgIHJlcHJlc2VudHMgdGhlIHNpemUgb2YgdGhlIFppY2Jv
eiBibG9jayBpbiBieXRlcy4KKworKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfSElHSEVT
VF9WSVJUX0FERFJFU1NgOiBBbiB1bnNpZ25lZCBsb25nIHdoaWNoCisgIHJlcHJlc2VudCB0aGUg
aGlnaGVzdCB1c2Vyc3BhY2UgdmlydHVhbCBhZGRyZXNzIHVzYWJsZS4KZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9o
d3Byb2JlLmgKaW5kZXggNjMwNTA3ZGZmNWVhLi4xNTBhOTg3N2IwYWYgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vaHdwcm9iZS5oCkBAIC04LDcgKzgsNyBAQAogCiAjaW5jbHVkZSA8dWFwaS9hc20vaHdwcm9i
ZS5oPgogCi0jZGVmaW5lIFJJU0NWX0hXUFJPQkVfTUFYX0tFWSA2CisjZGVmaW5lIFJJU0NWX0hX
UFJPQkVfTUFYX0tFWSA3CiAKIHN0YXRpYyBpbmxpbmUgYm9vbCByaXNjdl9od3Byb2JlX2tleV9p
c192YWxpZChfX3M2NCBrZXkpCiB7CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3Byb2Nlc3Nvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAppbmRleCAw
ZmFmNWYxNjFmMWUuLjM0NWQ5YTNlNGIyNSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9wcm9jZXNzb3IuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5o
CkBAIC01Nyw2ICs1NywxMiBAQAogCiAjZGVmaW5lIFNUQUNLX1RPUAkJREVGQVVMVF9NQVBfV0lO
RE9XCiAKKyNpZmRlZiBDT05GSUdfTU1VCisjZGVmaW5lIHVzZXJfbWF4X3ZpcnRfYWRkcigpIGFy
Y2hfZ2V0X21tYXBfZW5kKFVMT05HX01BWCwgMCwgMCkKKyNlbHNlCisjZGVmaW5lIHVzZXJfbWF4
X3ZpcnRfYWRkcigpIDAKKyNlbmRpZiAvKiBDT05GSUdfTU1VICovCisKIC8qCiAgKiBUaGlzIGRl
Y2lkZXMgd2hlcmUgdGhlIGtlcm5lbCB3aWxsIHNlYXJjaCBmb3IgYSBmcmVlIGNodW5rIG9mIHZt
CiAgKiBzcGFjZSBkdXJpbmcgbW1hcCdzLgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2Jl
LmgKaW5kZXggOWYyYThlM2ZmMjA0Li4zNjMwZTNmMzAzNTQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2h3cHJvYmUuaApAQCAtNjcsNiArNjcsNyBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7
CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5TVVBQT1JURUQJKDQgPDwgMCkK
ICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9NQVNLCQkoNyA8PCAwKQogI2RlZmlu
ZSBSSVNDVl9IV1BST0JFX0tFWV9aSUNCT1pfQkxPQ0tfU0laRQk2CisjZGVmaW5lIFJJU0NWX0hX
UFJPQkVfS0VZX0hJR0hFU1RfVklSVF9BRERSRVNTCTcKIC8qIEluY3JlYXNlIFJJU0NWX0hXUFJP
QkVfTUFYX0tFWSB3aGVuIGFkZGluZyBpdGVtcy4gKi8KIAogLyogRmxhZ3MgKi8KZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9z
eXNfaHdwcm9iZS5jCmluZGV4IDhjYWU0MWE1MDJkZC4uZWRkYzBmZmM0N2I0IDEwMDY0NAotLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L3N5c19od3Byb2JlLmMKQEAgLTgsNiArOCw3IEBACiAjaW5jbHVkZSA8YXNtL2NhY2hlZmx1c2gu
aD4KICNpbmNsdWRlIDxhc20vY3B1ZmVhdHVyZS5oPgogI2luY2x1ZGUgPGFzbS9od3Byb2JlLmg+
CisjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgogI2luY2x1ZGUgPGFzbS9zYmkuaD4KICNpbmNs
dWRlIDxhc20vc3dpdGNoX3RvLmg+CiAjaW5jbHVkZSA8YXNtL3VhY2Nlc3MuaD4KQEAgLTIxNSw2
ICsyMTYsOSBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX29uZV9wYWlyKHN0cnVjdCByaXNjdl9od3By
b2JlICpwYWlyLAogCQlpZiAoaHdwcm9iZV9leHQwX2hhcyhjcHVzLCBSSVNDVl9IV1BST0JFX0VY
VF9aSUNCT1opKQogCQkJcGFpci0+dmFsdWUgPSByaXNjdl9jYm96X2Jsb2NrX3NpemU7CiAJCWJy
ZWFrOworCWNhc2UgUklTQ1ZfSFdQUk9CRV9LRVlfSElHSEVTVF9WSVJUX0FERFJFU1M6CisJCXBh
aXItPnZhbHVlID0gdXNlcl9tYXhfdmlydF9hZGRyKCk7CisJCWJyZWFrOwogCiAJLyoKIAkgKiBG
b3IgZm9yd2FyZCBjb21wYXRpYmlsaXR5LCB1bmtub3duIGtleXMgZG9uJ3QgZmFpbCB0aGUgd2hv
bGUKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
