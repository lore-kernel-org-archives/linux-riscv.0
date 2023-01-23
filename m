Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12111C05027
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 10:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cD89lagJlErSe0uovkDwd18AEaI2S2rMShBn+IbdYzM=; b=XenyHYmtcf4PnG
	VPEy6a5jDAC7yop6KnWEmWIB6sDWpLgUgWzrnLKJjjw7jN5ftle3iFMIbbsCpJrEt25NPKF0Pnzj1
	4hDFVqfI6OF44MM6v/cAea7SBOUx8oghLRtlatLWKxFe5LlYIrJoRzLXibL4VTsXwFNrHx/tHf9+H
	bed1rhvd2bauuZE+vZXWPAbkwiZ6UMatqT+MBucns3bSlyFtcMdPgYhmBuUqwGm9IKmKCzINz5NXy
	ntwQJAhmgZM9jUBiivKPGmaKArqHdfeMHgj2FKy0WKy53UTdZa64G7iI/MPHFGucfxY04Yqd5mWQU
	sOfh+GmamXKr0nW391OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJuNg-00GtGy-Mt; Mon, 23 Jan 2023 10:48:52 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJuNd-00GtFn-9x
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 10:48:51 +0000
Received: by mail-wr1-x42c.google.com with SMTP id h12so6365110wrv.10
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 02:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B8g2lbRRVQxElqC+vhwxvlAd9Yl9IHH5TPADK+PZ98Q=;
        b=2UwllXEV1F4+37rtQa+xgzMqL7ieZGIS5R90acCmnh/NFf54gvz12Z2D7DZRryf2Kw
         5JKxKy+0HL4QeXeBhvERCl4u7ebN29K1u0svY3d4dZO4jmXjDp1HqI9CnJ2qhDE5yCHY
         tL9uxcgeN6euhtF5uxKAzYylIY++cbUzwdhkjLjxQatr+RISnAsFA0CC4HRpJ1ZjoiZE
         R/CK5wbz/6o0W9L3dj7e90x7LSqWtsTh6qDw1Pdut+yByYKO6T4z94ls5LZoCYBr+AFX
         S1ZkPwWZeMLv+dJ4WfkbYXKdbvOsZpYYOa2ioaiChOOymuKDMNc4azdVyMiqDG/GWwxg
         FmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8g2lbRRVQxElqC+vhwxvlAd9Yl9IHH5TPADK+PZ98Q=;
        b=zRi654apRx2I3nXRNM5ZXtwkh6HgO9TPf6cHGiSR68pBialIySF/41bWrvisQQMAR0
         LPqK9ZO6tjlg9uzQ7Rzkh4x+LTCJASoIC0zV/awy+MSEIk2ZyultGUuPb7RDQrkVLffc
         n24/4vCjyQQ1XJ1uzvMjFAlk7SzbU0vFvBaqsPRaZL0tGtz2nerrcDsNdnktwxsLHk+V
         WN4JKduN7TU65A80pujDbMAbHJSn6/RkgA5jPG4jgQ2cbpvJX7L78sZauPBg+B/dc5CP
         fSa1qP7MZcNNECm/LmpweXzG6m0n06EHWiuwqe1+iIGORgqPH2FlOq2r5PC3yQc7qIeP
         jEqg==
X-Gm-Message-State: AFqh2ko8zYHksKNCPxiTKjiuBcgi2X3PVvTCf9ZdnSmNlsTgeVG+Aitm
	sgn6N0XgM3eAem8dU2zkN7CPbQ==
X-Google-Smtp-Source: AMrXdXtsA5psCjwW6D5BLbiw+fn+Rog8dlvoO4malOUPAWvs7qusWFUIgGi3ZiO22gkyt4LV76DJrg==
X-Received: by 2002:adf:ec8d:0:b0:2bd:d7fd:6c93 with SMTP id z13-20020adfec8d000000b002bdd7fd6c93mr20023096wrn.48.1674470927875;
        Mon, 23 Jan 2023 02:48:47 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id c8-20020a5d4148000000b002bdd21f25ebsm27562327wrq.71.2023.01.23.02.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 02:48:47 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
Subject: [PATCH v3] riscv: Allow to downgrade paging mode from the command
Date: Mon, 23 Jan 2023 11:48:41 +0100
Message-Id: <20230123104841.813999-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_024849_370469_2758EFE5 
X-CRM114-Status: GOOD (  20.73  )
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

QWRkIDIgZWFybHkgY29tbWFuZCBsaW5lIHBhcmFtZXRlcnMgdGhhdCBhbGxvdyB0byBkb3duZ3Jh
ZGUgc2F0cCBtb2RlCih1c2luZyB0aGUgc2FtZSBuYW1pbmcgYXMgeDg2KToKLSAibm81bHZsIjog
dXNlIGEgNC1sZXZlbCBwYWdlIHRhYmxlIChkb3duIGZyb20gc3Y1NyB0byBzdjQ4KQotICJubzRs
dmwiOiB1c2UgYSAzLWxldmVsIHBhZ2UgdGFibGUgKGRvd24gZnJvbSBzdjU3L3N2NDggdG8gc3Yz
OSkKCk5vdGUgdGhhdCBnb2luZyB0aHJvdWdoIHRoZSBkZXZpY2UgdHJlZSB0byBnZXQgdGhlIGtl
cm5lbCBjb21tYW5kIGxpbmUKd29ya3Mgd2l0aCBBQ1BJIHRvbyBzaW5jZSB0aGUgZWZpIHN0dWIg
Y3JlYXRlcyBhIGRldmljZSB0cmVlIGFueXdheSB3aXRoCnRoZSBjb21tYW5kIGxpbmUuCgpBbHNv
LCBhcyB0aG9zZSBwYXJhbXMgYXJlIHRyZWF0ZWQgdmVyeSBlYXJseSBpbiB0aGUgYm9vdCBwcm9j
ZXNzIGFuZCB3ZQp1c2Ugc3RhbmRhcmQgZGV2aWNlIHRyZWUgZnVuY3Rpb25zIHRoYXQgbWF5IGJl
IGthc2FuIGluc3RydW1lbnRlZCwgd2UKb25seSBlbmFibGUgdGhlbSBmb3IgIUtBU0FOIGNvbmZp
Z3VyYXRpb25zLgoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+
ClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4K
LS0tCiAuLi4vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0ICAgICAgICAgfCAgOSAr
Ky0KIGFyY2gvcmlzY3YvbW0vaW5pdC5jICAgICAgICAgICAgICAgICAgICAgICAgICB8IDcyICsr
KysrKysrKysrKysrKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNzQgaW5zZXJ0aW9ucygrKSwgNyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5l
bC1wYXJhbWV0ZXJzLnR4dCBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFt
ZXRlcnMudHh0CmluZGV4IDZjZmE2ZTM5OTZjZi4uZmQ2NDc0MTJlYzkxIDEwMDY0NAotLS0gYS9E
b2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAorKysgYi9Eb2N1
bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dApAQCAtMzU3OCw4ICsz
NTc4LDE1IEBACiAJCQllbXVsYXRpb24gbGlicmFyeSBldmVuIGlmIGEgMzg3IG1hdGhzIGNvcHJv
Y2Vzc29yCiAJCQlpcyBwcmVzZW50LgogCi0Jbm81bHZsCQlbWDg2LTY0XSBEaXNhYmxlIDUtbGV2
ZWwgcGFnaW5nIG1vZGUuIEZvcmNlcworCW5vNGx2bAkJW1JJU0NWXSBEaXNhYmxlIDQtbGV2ZWwg
YW5kIDUtbGV2ZWwgcGFnaW5nIG1vZGVzLiBGb3JjZXMKKwkJCWtlcm5lbCB0byB1c2UgMy1sZXZl
bCBwYWdpbmcgaW5zdGVhZC4KKwkJCU5vdGU6IE9uIFJJU0MtViwgdGhpcyBjYW4ndCBiZSB1c2Vk
IHdoZW4gS0FTQU4gaXMKKwkJCWVuYWJsZWQuCisKKwlubzVsdmwJCVtYODYtNjQsUklTQ1ZdIERp
c2FibGUgNS1sZXZlbCBwYWdpbmcgbW9kZS4gRm9yY2VzCiAJCQlrZXJuZWwgdG8gdXNlIDQtbGV2
ZWwgcGFnaW5nIGluc3RlYWQuCisJCQlOb3RlOiBPbiBSSVNDLVYsIHRoaXMgY2FuJ3QgYmUgdXNl
ZCB3aGVuIEtBU0FOIGlzCisJCQllbmFibGVkLgogCiAJbm9mc2dzYmFzZQlbWDg2XSBEaXNhYmxl
cyBGU0dTQkFTRSBpbnN0cnVjdGlvbnMuCiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5p
dC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKaW5kZXggNDc4ZDY3NjNhMDFhLi4xMGY5OWZhNzQz
NjggMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCisrKyBiL2FyY2gvcmlzY3YvbW0v
aW5pdC5jCkBAIC03NDYsMTcgKzc0Niw3NyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZGlzYWJsZV9w
Z3RhYmxlX2w0KHZvaWQpCiAJc2F0cF9tb2RlID0gU0FUUF9NT0RFXzM5OwogfQogCisjaWZuZGVm
IENPTkZJR19LQVNBTgorc3RhdGljIF9faW5pdCBib29sIG1hdGNoX25vWGx2bChjb25zdCBjaGFy
ICpjbWRsaW5lKQoreworCWlmIChzdHJzdHIoY21kbGluZSwgIm5vNWx2bCIpKSB7CisJCWRpc2Fi
bGVfcGd0YWJsZV9sNSgpOworCX0gZWxzZSBpZiAoc3Ryc3RyKGNtZGxpbmUsICJubzRsdmwiKSkg
eworCQlkaXNhYmxlX3BndGFibGVfbDUoKTsKKwkJZGlzYWJsZV9wZ3RhYmxlX2w0KCk7CisJCXJl
dHVybiB0cnVlOworCX0KKworCXJldHVybiBmYWxzZTsKK30KKworc3RhdGljIGludCBfX2luaXQg
cHJpbnRfbm80bHZsKGNoYXIgKnApCit7CisJcHJfaW5mbygiRGlzYWJsZWQgNC1sZXZlbCBhbmQg
NS1sZXZlbCBwYWdpbmciKTsKKwlyZXR1cm4gMDsKK30KK2Vhcmx5X3BhcmFtKCJubzRsdmwiLCBw
cmludF9ubzRsdmwpOworCitzdGF0aWMgaW50IF9faW5pdCBwcmludF9ubzVsdmwoY2hhciAqcCkK
K3sKKwlwcl9pbmZvKCJEaXNhYmxlZCA1LWxldmVsIHBhZ2luZyIpOworCXJldHVybiAwOworfQor
ZWFybHlfcGFyYW0oIm5vNWx2bCIsIHByaW50X25vNWx2bCk7CisjZW5kaWYKKwogLyoKICAqIFRo
ZXJlIGlzIGEgc2ltcGxlIHdheSB0byBkZXRlcm1pbmUgaWYgNC1sZXZlbCBpcyBzdXBwb3J0ZWQg
YnkgdGhlCiAgKiB1bmRlcmx5aW5nIGhhcmR3YXJlOiBlc3RhYmxpc2ggMToxIG1hcHBpbmcgaW4g
NC1sZXZlbCBwYWdlIHRhYmxlIG1vZGUKICAqIHRoZW4gcmVhZCBTQVRQIHRvIHNlZSBpZiB0aGUg
Y29uZmlndXJhdGlvbiB3YXMgdGFrZW4gaW50byBhY2NvdW50CiAgKiBtZWFuaW5nIHN2NDggaXMg
c3VwcG9ydGVkLgogICovCi1zdGF0aWMgX19pbml0IHZvaWQgc2V0X3NhdHBfbW9kZSh2b2lkKQor
c3RhdGljIF9faW5pdCB2b2lkIHNldF9zYXRwX21vZGUodWludHB0cl90IGR0Yl9wYSkKIHsKIAl1
NjQgaWRlbnRpdHlfc2F0cCwgaHdfc2F0cDsKIAl1aW50cHRyX3Qgc2V0X3NhdHBfbW9kZV9wbWQg
PSAoKHVuc2lnbmVkIGxvbmcpc2V0X3NhdHBfbW9kZSkgJiBQTURfTUFTSzsKLQlib29sIGNoZWNr
X2w0ID0gZmFsc2U7CisKKyNpZm5kZWYgQ09ORklHX0tBU0FOCisJLyoKKwkgKiBUaGUgYmVsb3cg
ZmR0IGZ1bmN0aW9ucyBhcmUga2FzYW4gaW5zdHJ1bWVudGVkLCBzaW5jZSBhdCB0aGlzIHBvaW50
CisJICogdGhlcmUgaXMgbm8gbWFwcGluZyBmb3IgdGhlIGthc2FuIHNoYWRvdyBtZW1vcnksIHRo
aXMgY2FuJ3QgYmUgdXNlZAorCSAqIHdoZW4ga2FzYW4gaXMgZW5hYmxlZC4KKwkgKi8KKwlpbnQg
Y2hvc2VuX25vZGU7CisJdW5zaWduZWQgaW50IGZkdF9jbWRsaW5lX3NpemUgPSAwOworCisJaWYg
KCFJU19FTkFCTEVEKENPTkZJR19DTURMSU5FX0ZPUkNFKSkgeworCQljaG9zZW5fbm9kZSA9IGZk
dF9wYXRoX29mZnNldCgodm9pZCAqKWR0Yl9wYSwgIi9jaG9zZW4iKTsKKwkJaWYgKGNob3Nlbl9u
b2RlID49IDApIHsKKwkJCWNvbnN0IGNoYXIgKmZkdF9jbWRsaW5lOworCisJCQlmZHRfY21kbGlu
ZSA9IGZkdF9nZXRwcm9wKCh2b2lkICopZHRiX3BhLCBjaG9zZW5fbm9kZSwKKwkJCQkJCSAgImJv
b3RhcmdzIiwgTlVMTCk7CisJCQlpZiAoZmR0X2NtZGxpbmUpIHsKKwkJCQlpZiAobWF0Y2hfbm9Y
bHZsKGZkdF9jbWRsaW5lKSkKKwkJCQkJcmV0dXJuOworCQkJCWZkdF9jbWRsaW5lX3NpemUgPSBz
dHJsZW4oZmR0X2NtZGxpbmUpOworCQkJfQorCQl9CisJfQorCisJaWYgKElTX0VOQUJMRUQoQ09O
RklHX0NNRExJTkVfRVhURU5EKSB8fAorCSAgICBJU19FTkFCTEVEKENPTkZJR19DTURMSU5FX0ZP
UkNFKSB8fAorCSAgICBmZHRfY21kbGluZV9zaXplID09IDAgLyogQ09ORklHX0NNRExJTkVfRkFM
TEJBQ0sgKi8pIHsKKwkJaWYgKG1hdGNoX25vWGx2bChDT05GSUdfQ01ETElORSkpCisJCQlyZXR1
cm47CisJfQorI2VuZGlmCiAKIAljcmVhdGVfcDRkX21hcHBpbmcoZWFybHlfcDRkLAogCQkJc2V0
X3NhdHBfbW9kZV9wbWQsICh1aW50cHRyX3QpZWFybHlfcHVkLApAQCAtNzc1LDcgKzgzNSw4IEBA
IHN0YXRpYyBfX2luaXQgdm9pZCBzZXRfc2F0cF9tb2RlKHZvaWQpCiByZXRyeToKIAljcmVhdGVf
cGdkX21hcHBpbmcoZWFybHlfcGdfZGlyLAogCQkJICAgc2V0X3NhdHBfbW9kZV9wbWQsCi0JCQkg
ICBjaGVja19sNCA/ICh1aW50cHRyX3QpZWFybHlfcHVkIDogKHVpbnRwdHJfdCllYXJseV9wNGQs
CisJCQkgICBwZ3RhYmxlX2w1X2VuYWJsZWQgPworCQkJCSh1aW50cHRyX3QpZWFybHlfcDRkIDog
KHVpbnRwdHJfdCllYXJseV9wdWQsCiAJCQkgICBQR0RJUl9TSVpFLCBQQUdFX1RBQkxFKTsKIAog
CWlkZW50aXR5X3NhdHAgPSBQRk5fRE9XTigodWludHB0cl90KSZlYXJseV9wZ19kaXIpIHwgc2F0
cF9tb2RlOwpAQCAtNzg2LDkgKzg0Nyw4IEBAIHN0YXRpYyBfX2luaXQgdm9pZCBzZXRfc2F0cF9t
b2RlKHZvaWQpCiAJbG9jYWxfZmx1c2hfdGxiX2FsbCgpOwogCiAJaWYgKGh3X3NhdHAgIT0gaWRl
bnRpdHlfc2F0cCkgewotCQlpZiAoIWNoZWNrX2w0KSB7CisJCWlmIChwZ3RhYmxlX2w1X2VuYWJs
ZWQpIHsKIAkJCWRpc2FibGVfcGd0YWJsZV9sNSgpOwotCQkJY2hlY2tfbDQgPSB0cnVlOwogCQkJ
bWVtc2V0KGVhcmx5X3BnX2RpciwgMCwgUEFHRV9TSVpFKTsKIAkJCWdvdG8gcmV0cnk7CiAJCX0K
QEAgLTk3OSw3ICsxMDM5LDcgQEAgYXNtbGlua2FnZSB2b2lkIF9faW5pdCBzZXR1cF92bSh1aW50
cHRyX3QgZHRiX3BhKQogI2VuZGlmCiAKICNpZiBkZWZpbmVkKENPTkZJR182NEJJVCkgJiYgIWRl
ZmluZWQoQ09ORklHX1hJUF9LRVJORUwpCi0Jc2V0X3NhdHBfbW9kZSgpOworCXNldF9zYXRwX21v
ZGUoZHRiX3BhKTsKICNlbmRpZgogCiAJa2VybmVsX21hcC52YV9wYV9vZmZzZXQgPSBQQUdFX09G
RlNFVCAtIGtlcm5lbF9tYXAucGh5c19hZGRyOwotLSAKMi4zNy4yCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
