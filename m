Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08522C25B50
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 10:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/LLnBWVw16K/H9f98xAnjGk6Jq8/8Pvm9jLKkam7xCI=; b=QB1Ys3rdX7p6St
	KTBAi23HkuYgWQi8e8GLku6hWFGTsnmyhTk9XwtVdqUe0WnQ5O/8sTncO7D1u2udM3RVlAlXncLWn
	xcl/dFET51+cbrYRqTWs41hpsPpd++hAW5s1yFY23AOcXhP7Hr9WvTTm/uuSe/D4zSJ5FM5qmy8qp
	dr3lQD22otZfIV5x7cc0UQ6DpD/Qa0SJDQZXRuOIF2rGwqG472Dn79z6RbefnUF50nWpuOgO01xUH
	B0Lm7rZGn53H3gzA+L+M9s82BKwMONNAQ3y553Fc5LBNTItAipgiKwCQlucWciNWhkM2nshv0jMfL
	y+8fFfJEHprDTdoW2x+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJuQP-00Gtlo-0u; Mon, 23 Jan 2023 10:51:41 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJuQM-00GtlB-MT
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 10:51:40 +0000
Received: by mail-wm1-x336.google.com with SMTP id j17so8676299wms.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 02:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iNaYtofYaUyTu++408RIjM6QxaU0XNloE1hvcqkby0M=;
        b=rDa7owbGuSkE3kuoTleIjKtzirtAYql6CGKhcf0keDRcGl8pQsGjMYN73lFNqOV8hk
         ErtqRBPbWZj36cGdiBrSqyT8VHMI4qXnK1gsOConP8PyaMMIgjDYbB1Lp2zQ3UEgFmRF
         U+ewrNjsq3dFBWjsWv5YJYXI6Dns592TJdXxosTgtZMWJ94djjfLsqZvFqUQT5AH+1N+
         a8wrvnK6MgYThcOuiAUKAmicd+/zgQTc0WlirsKVLjium4bhLYXr+2eqopXoY6u8654e
         amLr/0tIIq7Z5wCxQgwJnHZhGuYdsUftHIfu/DbhohTPIZ/gEFdGuwJ9e9k17Sxo96IP
         zoMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNaYtofYaUyTu++408RIjM6QxaU0XNloE1hvcqkby0M=;
        b=4tz7NWpVJQJY0LIy49qxHZHSy7X0fvS7FsURnL0NUQwvVYq8l4Zb31E2xrQ7rb6UWk
         y5cD8bH2jLFxWSEzeENWY5Ck7nAwAv0/2Me1pXOJTZEX25xjhuxXZskbZxzKIWeNdY1F
         Oj5zcpNJK5E7dbqxg2cTUInFhRs6bl+7urPSeNGHdDZiyr1LeQkR2lJmokmhO4/tXs3F
         GNRDOdkUGvPZdr7lP1dFPkqo0Rq5DefxlQGgUKXC46fjkpV6q8GiNCgnCbhxHmzj0ueK
         SqYG2poOkSsDjHwyncM2piERdN4cEoPcE/M9KrVqNeEbs/DBC7iFIF9potnH1QO+Eqie
         woDg==
X-Gm-Message-State: AFqh2krmnw1932dE7BlzGrcq2uE4nIHjTWBShBIPPGrs2wIpf8BXC4cR
	VwrfTFJ6j6RWzWnKEXIXYJ/hHw==
X-Google-Smtp-Source: AMrXdXsAESMORx1h1OUNLEJAF0WchGSuYmV8oWCgP5HlMv9UyaB2e6hZpTe1dGLOU3jyksQeyDhkVw==
X-Received: by 2002:a05:600c:3b05:b0:3d6:b691:b80d with SMTP id m5-20020a05600c3b0500b003d6b691b80dmr23667309wms.21.1674471096950;
        Mon, 23 Jan 2023 02:51:36 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id o24-20020a05600c511800b003d9de0c39fasm13684770wms.36.2023.01.23.02.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 02:51:36 -0800 (PST)
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
Subject: [PATCH resend v3] riscv: Allow to downgrade paging mode from the command line
Date: Mon, 23 Jan 2023 11:51:35 +0100
Message-Id: <20230123105135.814154-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_025138_775452_B85AA72E 
X-CRM114-Status: GOOD (  22.40  )
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
LS0tCgp2MzoKLSBNYXNzYWdlIGNvbW1pdCBsb2cgdG8gbWFrZSBubzRsdmwgY2xlYXJlciwgYXMg
YXNrZWQgYnkgQ29ub3IKLSBBZGQgYSBub3RlIHRvIGtlcm5lbC1wYXJhbWV0ZXJzLnR4dCByZWdh
cmRpbmcgdGhlIGltcG9zc2liaWxpdHkgdG8gdXNlCiAgdGhvc2UgcGFyYW1ldGVycyB3aGVuIEtB
U0FOIGlzIGVuYWJsZWQsIGFzIHN1Z2dlc3RlZCBieSBDb25vcgotIEFkZCBSQiBmcm9tIEJqw7Zy
bgoKdjI6Ci0gSG9ub3IgQ01ETElORV9FWFRFTkQgYW5kIENNRExJTkVfRk9SQ0UgYXMgbm90aWNl
ZCBieSBCasO2cm4KCiAuLi4vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0ICAgICAg
ICAgfCAgOSArKy0KIGFyY2gvcmlzY3YvbW0vaW5pdC5jICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDcyICsrKysrKysrKysrKysrKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNzQgaW5zZXJ0aW9u
cygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1
aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2Vy
bmVsLXBhcmFtZXRlcnMudHh0CmluZGV4IDZjZmE2ZTM5OTZjZi4uZmQ2NDc0MTJlYzkxIDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAor
KysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dApAQCAt
MzU3OCw4ICszNTc4LDE1IEBACiAJCQllbXVsYXRpb24gbGlicmFyeSBldmVuIGlmIGEgMzg3IG1h
dGhzIGNvcHJvY2Vzc29yCiAJCQlpcyBwcmVzZW50LgogCi0Jbm81bHZsCQlbWDg2LTY0XSBEaXNh
YmxlIDUtbGV2ZWwgcGFnaW5nIG1vZGUuIEZvcmNlcworCW5vNGx2bAkJW1JJU0NWXSBEaXNhYmxl
IDQtbGV2ZWwgYW5kIDUtbGV2ZWwgcGFnaW5nIG1vZGVzLiBGb3JjZXMKKwkJCWtlcm5lbCB0byB1
c2UgMy1sZXZlbCBwYWdpbmcgaW5zdGVhZC4KKwkJCU5vdGU6IE9uIFJJU0MtViwgdGhpcyBjYW4n
dCBiZSB1c2VkIHdoZW4gS0FTQU4gaXMKKwkJCWVuYWJsZWQuCisKKwlubzVsdmwJCVtYODYtNjQs
UklTQ1ZdIERpc2FibGUgNS1sZXZlbCBwYWdpbmcgbW9kZS4gRm9yY2VzCiAJCQlrZXJuZWwgdG8g
dXNlIDQtbGV2ZWwgcGFnaW5nIGluc3RlYWQuCisJCQlOb3RlOiBPbiBSSVNDLVYsIHRoaXMgY2Fu
J3QgYmUgdXNlZCB3aGVuIEtBU0FOIGlzCisJCQllbmFibGVkLgogCiAJbm9mc2dzYmFzZQlbWDg2
XSBEaXNhYmxlcyBGU0dTQkFTRSBpbnN0cnVjdGlvbnMuCiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKaW5kZXggNDc4ZDY3NjNhMDFhLi4x
MGY5OWZhNzQzNjggMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCisrKyBiL2FyY2gv
cmlzY3YvbW0vaW5pdC5jCkBAIC03NDYsMTcgKzc0Niw3NyBAQCBzdGF0aWMgdm9pZCBfX2luaXQg
ZGlzYWJsZV9wZ3RhYmxlX2w0KHZvaWQpCiAJc2F0cF9tb2RlID0gU0FUUF9NT0RFXzM5OwogfQog
CisjaWZuZGVmIENPTkZJR19LQVNBTgorc3RhdGljIF9faW5pdCBib29sIG1hdGNoX25vWGx2bChj
b25zdCBjaGFyICpjbWRsaW5lKQoreworCWlmIChzdHJzdHIoY21kbGluZSwgIm5vNWx2bCIpKSB7
CisJCWRpc2FibGVfcGd0YWJsZV9sNSgpOworCX0gZWxzZSBpZiAoc3Ryc3RyKGNtZGxpbmUsICJu
bzRsdmwiKSkgeworCQlkaXNhYmxlX3BndGFibGVfbDUoKTsKKwkJZGlzYWJsZV9wZ3RhYmxlX2w0
KCk7CisJCXJldHVybiB0cnVlOworCX0KKworCXJldHVybiBmYWxzZTsKK30KKworc3RhdGljIGlu
dCBfX2luaXQgcHJpbnRfbm80bHZsKGNoYXIgKnApCit7CisJcHJfaW5mbygiRGlzYWJsZWQgNC1s
ZXZlbCBhbmQgNS1sZXZlbCBwYWdpbmciKTsKKwlyZXR1cm4gMDsKK30KK2Vhcmx5X3BhcmFtKCJu
bzRsdmwiLCBwcmludF9ubzRsdmwpOworCitzdGF0aWMgaW50IF9faW5pdCBwcmludF9ubzVsdmwo
Y2hhciAqcCkKK3sKKwlwcl9pbmZvKCJEaXNhYmxlZCA1LWxldmVsIHBhZ2luZyIpOworCXJldHVy
biAwOworfQorZWFybHlfcGFyYW0oIm5vNWx2bCIsIHByaW50X25vNWx2bCk7CisjZW5kaWYKKwog
LyoKICAqIFRoZXJlIGlzIGEgc2ltcGxlIHdheSB0byBkZXRlcm1pbmUgaWYgNC1sZXZlbCBpcyBz
dXBwb3J0ZWQgYnkgdGhlCiAgKiB1bmRlcmx5aW5nIGhhcmR3YXJlOiBlc3RhYmxpc2ggMToxIG1h
cHBpbmcgaW4gNC1sZXZlbCBwYWdlIHRhYmxlIG1vZGUKICAqIHRoZW4gcmVhZCBTQVRQIHRvIHNl
ZSBpZiB0aGUgY29uZmlndXJhdGlvbiB3YXMgdGFrZW4gaW50byBhY2NvdW50CiAgKiBtZWFuaW5n
IHN2NDggaXMgc3VwcG9ydGVkLgogICovCi1zdGF0aWMgX19pbml0IHZvaWQgc2V0X3NhdHBfbW9k
ZSh2b2lkKQorc3RhdGljIF9faW5pdCB2b2lkIHNldF9zYXRwX21vZGUodWludHB0cl90IGR0Yl9w
YSkKIHsKIAl1NjQgaWRlbnRpdHlfc2F0cCwgaHdfc2F0cDsKIAl1aW50cHRyX3Qgc2V0X3NhdHBf
bW9kZV9wbWQgPSAoKHVuc2lnbmVkIGxvbmcpc2V0X3NhdHBfbW9kZSkgJiBQTURfTUFTSzsKLQli
b29sIGNoZWNrX2w0ID0gZmFsc2U7CisKKyNpZm5kZWYgQ09ORklHX0tBU0FOCisJLyoKKwkgKiBU
aGUgYmVsb3cgZmR0IGZ1bmN0aW9ucyBhcmUga2FzYW4gaW5zdHJ1bWVudGVkLCBzaW5jZSBhdCB0
aGlzIHBvaW50CisJICogdGhlcmUgaXMgbm8gbWFwcGluZyBmb3IgdGhlIGthc2FuIHNoYWRvdyBt
ZW1vcnksIHRoaXMgY2FuJ3QgYmUgdXNlZAorCSAqIHdoZW4ga2FzYW4gaXMgZW5hYmxlZC4KKwkg
Ki8KKwlpbnQgY2hvc2VuX25vZGU7CisJdW5zaWduZWQgaW50IGZkdF9jbWRsaW5lX3NpemUgPSAw
OworCisJaWYgKCFJU19FTkFCTEVEKENPTkZJR19DTURMSU5FX0ZPUkNFKSkgeworCQljaG9zZW5f
bm9kZSA9IGZkdF9wYXRoX29mZnNldCgodm9pZCAqKWR0Yl9wYSwgIi9jaG9zZW4iKTsKKwkJaWYg
KGNob3Nlbl9ub2RlID49IDApIHsKKwkJCWNvbnN0IGNoYXIgKmZkdF9jbWRsaW5lOworCisJCQlm
ZHRfY21kbGluZSA9IGZkdF9nZXRwcm9wKCh2b2lkICopZHRiX3BhLCBjaG9zZW5fbm9kZSwKKwkJ
CQkJCSAgImJvb3RhcmdzIiwgTlVMTCk7CisJCQlpZiAoZmR0X2NtZGxpbmUpIHsKKwkJCQlpZiAo
bWF0Y2hfbm9YbHZsKGZkdF9jbWRsaW5lKSkKKwkJCQkJcmV0dXJuOworCQkJCWZkdF9jbWRsaW5l
X3NpemUgPSBzdHJsZW4oZmR0X2NtZGxpbmUpOworCQkJfQorCQl9CisJfQorCisJaWYgKElTX0VO
QUJMRUQoQ09ORklHX0NNRExJTkVfRVhURU5EKSB8fAorCSAgICBJU19FTkFCTEVEKENPTkZJR19D
TURMSU5FX0ZPUkNFKSB8fAorCSAgICBmZHRfY21kbGluZV9zaXplID09IDAgLyogQ09ORklHX0NN
RExJTkVfRkFMTEJBQ0sgKi8pIHsKKwkJaWYgKG1hdGNoX25vWGx2bChDT05GSUdfQ01ETElORSkp
CisJCQlyZXR1cm47CisJfQorI2VuZGlmCiAKIAljcmVhdGVfcDRkX21hcHBpbmcoZWFybHlfcDRk
LAogCQkJc2V0X3NhdHBfbW9kZV9wbWQsICh1aW50cHRyX3QpZWFybHlfcHVkLApAQCAtNzc1LDcg
KzgzNSw4IEBAIHN0YXRpYyBfX2luaXQgdm9pZCBzZXRfc2F0cF9tb2RlKHZvaWQpCiByZXRyeToK
IAljcmVhdGVfcGdkX21hcHBpbmcoZWFybHlfcGdfZGlyLAogCQkJICAgc2V0X3NhdHBfbW9kZV9w
bWQsCi0JCQkgICBjaGVja19sNCA/ICh1aW50cHRyX3QpZWFybHlfcHVkIDogKHVpbnRwdHJfdCll
YXJseV9wNGQsCisJCQkgICBwZ3RhYmxlX2w1X2VuYWJsZWQgPworCQkJCSh1aW50cHRyX3QpZWFy
bHlfcDRkIDogKHVpbnRwdHJfdCllYXJseV9wdWQsCiAJCQkgICBQR0RJUl9TSVpFLCBQQUdFX1RB
QkxFKTsKIAogCWlkZW50aXR5X3NhdHAgPSBQRk5fRE9XTigodWludHB0cl90KSZlYXJseV9wZ19k
aXIpIHwgc2F0cF9tb2RlOwpAQCAtNzg2LDkgKzg0Nyw4IEBAIHN0YXRpYyBfX2luaXQgdm9pZCBz
ZXRfc2F0cF9tb2RlKHZvaWQpCiAJbG9jYWxfZmx1c2hfdGxiX2FsbCgpOwogCiAJaWYgKGh3X3Nh
dHAgIT0gaWRlbnRpdHlfc2F0cCkgewotCQlpZiAoIWNoZWNrX2w0KSB7CisJCWlmIChwZ3RhYmxl
X2w1X2VuYWJsZWQpIHsKIAkJCWRpc2FibGVfcGd0YWJsZV9sNSgpOwotCQkJY2hlY2tfbDQgPSB0
cnVlOwogCQkJbWVtc2V0KGVhcmx5X3BnX2RpciwgMCwgUEFHRV9TSVpFKTsKIAkJCWdvdG8gcmV0
cnk7CiAJCX0KQEAgLTk3OSw3ICsxMDM5LDcgQEAgYXNtbGlua2FnZSB2b2lkIF9faW5pdCBzZXR1
cF92bSh1aW50cHRyX3QgZHRiX3BhKQogI2VuZGlmCiAKICNpZiBkZWZpbmVkKENPTkZJR182NEJJ
VCkgJiYgIWRlZmluZWQoQ09ORklHX1hJUF9LRVJORUwpCi0Jc2V0X3NhdHBfbW9kZSgpOworCXNl
dF9zYXRwX21vZGUoZHRiX3BhKTsKICNlbmRpZgogCiAJa2VybmVsX21hcC52YV9wYV9vZmZzZXQg
PSBQQUdFX09GRlNFVCAtIGtlcm5lbF9tYXAucGh5c19hZGRyOwotLSAKMi4zNy4yCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
