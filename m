Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5226C48BF6
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 14:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kh34stxnCJ8WDZiDLJcJ3M+V4ohxnKX4bN3LR/5GcDM=; b=Ag42rqe90tskPs
	CH3gZvJRT5AMc5kBOx9l9aRYOUuiSaDkRk9hzBtRD9wE3jOsOA66Thu+ssCuQErWlB6bGx0rwgSTY
	A4XEIUzYlNOqoMHPHdEE9vW5MPuPEyhVsaLVaW+Ln6SF5SfmwHZWw7unVoAsN75jN5KQ+paECxjGT
	c3S5LWssiePcRdYS8zpd3US783itofk79rSBuJiPAwP1HYL0Xp0rjLrJOChm2Kvrm1kJefqxpiShX
	E4/ybFHEO+SYtbd/JkGZgaEtEZgnnZNxlE9soXjuKeoMe7Hj4dmCINEAVPNNlPkQjwwS+QGr9MxCy
	8mHPoZKMjSN441sk0+Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebeW-000000011cZ-3pr2;
	Mon, 26 Feb 2024 14:08:21 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebe8-000000011Sr-2Ou2
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 14:08:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-412a4e3d079so274705e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Feb 2024 06:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708956473; x=1709561273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z3cft7Ypg0legv2IgemzKJux6J8rPPIzvMpQQPbvnK0=;
        b=VxHJSFBbXMaker6JQNkLv1s28F4ziyK89Ft5N8P2DTcDCkzO/dXx+jIq51oyTB2/Lp
         aMRADUo28+L7gvpWIZR16spoRNzbp0Red52kq4QbnDqKlRpkLYO+jysLhuxfnxrmRDNR
         6gYB5iVu5R7odoeMRmOE2IEcQ89d39yb2sDzNASYxmSB4Gq225WWPzw3EyDIjboJPHg+
         uZcEPCrOn/RnwwXjY5c7ty9DoPmuYeJ+lQGpR5WmFDZ0aaCConSqT7Gfe800QWFVdZI9
         yYagEs4dYuTDqvqPICE49e3nzOP9B9aYOk7QddUIzdyPHTLYeLXo0mejyHvIu/aMzUDe
         ySkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708956473; x=1709561273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3cft7Ypg0legv2IgemzKJux6J8rPPIzvMpQQPbvnK0=;
        b=mGkP314ReUQ1xQvoWVOpxbz31CI7JLS9tDFFWnIWaMRqtKzS/N5rf+uf7ke3FLNnRp
         8afkC+tlaaNDS063U632fJEnTVG6qCSp98bR1YSTd/kRJDQC/DAyWa1ulaVvmiLSBvyK
         C4eEKeBQQItdHBpl8rH8iK7+Q7HV5EHSNGdUorbjP9FkQb6VodwVgx2Nz2tFfyeq8Lvs
         AKSdFCLCT5NHkWiqTlgtIsnPt4NUAcTh1lCHHZwxr0GBUB8tebuFZ3ePeNGTg+K6Nm3f
         LDp/dWLS5HIuV0/RooQvS4vnTc8XNS1XYKTpys+kqRBM9zXi8onUXpD57ntCF/LTClb4
         XcpA==
X-Forwarded-Encrypted: i=1; AJvYcCUjAL82Q58Jsn4mlFHgdhpsZ/22xdaOAW8iedLWpxd3eafda4A9leaughuC8O8D8/0udEndRRGwqEeYqMreCqh0Jl1jTnwn2FLdZlIsttZj
X-Gm-Message-State: AOJu0YxNOlptwW4h4yeQZWv4yQagFEdvEm0C6dm7A1b9BYzRBYvAHTog
	fQFOLbtNgeCMZIhx5SvMI9DdejG8KpstoAb1FFK5fJMCOoeJsDLlS5JFx6/hNL0=
X-Google-Smtp-Source: AGHT+IFWeLyABthKnQh82+1HfoBCkHmIx/VTkUVLqqzwuzyCNDGWVehu8nc5ISMY2K+88EhoRCllng==
X-Received: by 2002:a05:600c:3ba6:b0:412:2b7a:6816 with SMTP id n38-20020a05600c3ba600b004122b7a6816mr5168803wms.0.1708956472906;
        Mon, 26 Feb 2024 06:07:52 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:83a3:2c00:c690:18b0])
        by smtp.gmail.com with ESMTPSA id h19-20020a05600c261300b00412a30cd127sm4802196wma.7.2024.02.26.06.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:07:52 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH] riscv: deprecate CONFIG_MMU=n
Date: Mon, 26 Feb 2024 15:06:46 +0100
Message-ID: <20240226140649.293254-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_060758_142132_54D7032B 
X-CRM114-Status: GOOD (  11.46  )
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

RGVwcmVjYXRpb24gb2YgTk9NTVUgc3VwcG9ydCBmb3IgcmlzY3Ygd2FzIGRpc2N1c3NlZCBkdXJp
bmcgTFBDIDIwMjMKWzFdLiBSZWFzb25zIGZvciB0aGlzIGludm9sdmVzIGxhY2sgb2YgdXNlcnMg
YXMgd2VsbCBhcyBtYWludGVuYW5jZQplZmZvcnRzIHRvIHN1cHBvcnQgdGhpcyBtb2RlLiBwc0FC
SSBGRFBJQyBzcGVjaWZpY2F0aW9uIGFsc28gbmV2ZXIKbWFkZSBpdCB1cHN0cmVhbSBhbmQgbGFz
dCBwdWJsaWMgbWVzc2FnZXMgb2YgdGhpcyBkZXZlbG9wbWVudCBzZWVtcyB0bwpkYXRlIGJhY2sg
ZnJvbSAyMDIwIFsyXS4gUGxhbiB0aGUgZGVwcmVjYXRpb24gdG8gYmUgZG9uZSBpbiAyIHllYXJz
IGZyb20Kbm93LiBNYXJrIHRoZSBLY29uZmlnIG9wdGlvbiBhcyBkZXByZWNhdGVkIGJ5IGFkZGlu
ZyBhIG5ldyBkdW1teSBvcHRpb24Kd2hpY2ggZXhwbGljaXRseSBkaXNwbGF5cyB0aGUgZGVwcmVj
YXRpb24gaW4gY2FzZSBvZiBDT05GSUdfTU1VPW4uIFRoaXMgb3B0aW9uCmlzIHNlbGVjdGVkIGlu
ZGlyZWN0bHkgYnkgQ09ORklHX1JJU0NWX01fTU9ERSBzaW5jZSBhbiBvcHRpb24gY2FuIG5vdApz
ZWxlY3QgYW5vdGhlciBvbmUgZGlyZWN0bHkgd2l0aCBhICJzZWxlY3QiIGluIGNhc2Ugb2Ygc3Vj
aCBDT05GSUc9bi4KQWRkaXRpb25hbGx5LCBkaXNwbGF5IGEgcHJfZXJyKCkgbWVzc2FnZSBhdCBi
b290IHRpbWUgaW4gY2FzZSBvZiBOT01NVQpidWlsZCB0byB3YXJuIGFib3V0IHVwY29taW5nIGRl
cHJlY2F0aW9uLgoKTGluazogaHR0cHM6Ly9scGMuZXZlbnRzL2V2ZW50LzE3L2NvbnRyaWJ1dGlv
bnMvMTQ3OC8gWzFdCkxpbms6IGh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vYS9ncm91cHMucmlz
Y3Yub3JnL2cvc3ctZGV2L2MvWmpZVUpzd2tuUTQvbS9XWVJSeWxUd0FBQUogWzJdClNpZ25lZC1v
ZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KCi0tLQogYXJjaC9y
aXNjdi9LY29uZmlnICAgICAgICB8IDggKysrKysrKysKIGFyY2gvcmlzY3Yva2VybmVsL3NldHVw
LmMgfCA0ICsrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwppbmRleCBiZmZiZDg2
OWEwNjguLjhkYTU4YzEwMmQzZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCisrKyBi
L2FyY2gvcmlzY3YvS2NvbmZpZwpAQCAtMjIxLDYgKzIyMSw3IEBAIGNvbmZpZyBBUkNIX01NQVBf
Uk5EX0NPTVBBVF9CSVRTX01BWAogIyBzZXQgaWYgd2UgcnVuIGluIG1hY2hpbmUgbW9kZSwgY2xl
YXJlZCBpZiB3ZSBydW4gaW4gc3VwZXJ2aXNvciBtb2RlCiBjb25maWcgUklTQ1ZfTV9NT0RFCiAJ
Ym9vbAorCXNlbGVjdCBOT01NVQogCWRlZmF1bHQgIU1NVQogCiAjIHNldCBpZiB3ZSBhcmUgcnVu
bmluZyBpbiBTLW1vZGUgYW5kIGNhbiB1c2UgU0JJIGNhbGxzCkBAIC0yMzYsNiArMjM3LDEzIEBA
IGNvbmZpZyBNTVUKIAkgIFNlbGVjdCBpZiB5b3Ugd2FudCBNTVUtYmFzZWQgdmlydHVhbGlzZWQg
YWRkcmVzc2luZyBzcGFjZQogCSAgc3VwcG9ydCBieSBwYWdlZCBtZW1vcnkgbWFuYWdlbWVudC4g
SWYgdW5zdXJlLCBzYXkgJ1knLgogCitjb25maWcgTk9NTVUKKwlkZXBlbmRzIG9uICFNTVUKKwli
b29sICJOT01NVSBrZXJuZWwgKERFUFJFQ0FURUQpIgorCWhlbHAKKwkgIE5PTU1VIGtlcm5lbCBp
cyBkZXByZWNhdGVkIGFuZCBpcyBzY2hlZHVsZWQgZm9yIHJlbW92YWwgYnkKKwkgIHRoZSBiZWdp
bm5pbmcgb2YgMjAyNy4KKwogY29uZmlnIFBBR0VfT0ZGU0VUCiAJaGV4CiAJZGVmYXVsdCAweEMw
MDAwMDAwIGlmIDMyQklUICYmIE1NVQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2V0
dXAuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKaW5kZXggNGY3M2MwYWU0NGIyLi44Nzk5
ODE2ZWYwYTYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvc2V0dXAuYwpAQCAtMjk1LDYgKzI5NSwxMCBAQCB2b2lkIF9faW5pdCBz
ZXR1cF9hcmNoKGNoYXIgKipjbWRsaW5lX3ApCiAJcmlzY3Zfc2V0X2RtYV9jYWNoZV9hbGlnbm1l
bnQoKTsKIAogCXJpc2N2X3VzZXJfaXNhX2VuYWJsZSgpOworCisjaWYgIWRlZmluZWQoQ09ORklH
X01NVSkKKwlwcl9lcnIoIlJJU0MtViBOT01NVSBzdXBwb3J0IGlzIGRlcHJlY2F0ZWQgYW5kIHNj
aGVkdWxlZCBmb3IgcmVtb3ZhbCBieSB0aGUgYmVnaW5uaW5nIG9mIDIwMjdcbiIpOworI2VuZGlm
CiB9CiAKIGJvb2wgYXJjaF9jcHVfaXNfaG90cGx1Z2dhYmxlKGludCBjcHUpCi0tIAoyLjQzLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
