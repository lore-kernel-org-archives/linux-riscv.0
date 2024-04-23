Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE0EC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 12:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPAL+0OFbs79yf5DsHPOUTB5a8K/LWqHqGVnrF+1YJQ=; b=Whf77boMjRGmOr
	rgXzvrKeB+eX8E3XM8f/d89//TlXCkGxTpIBaS9LVJBPqyrYCE65fPrHdFI3WNs7egHtD7+KN6GAM
	9muUAB7gPr6lzIfiO9B2pTNfqEeElSrFc9sncx9DA0ajJNt/EStzLbnpx/Wl+AkdTK4Hq3DU7rc+6
	4/ygq7FCnEvmNUc8ftlbAuk8F6irVzbdYzBDN5gUG2eAqfZ3cSEUTabhiPXzzb4hglIxJBbfCkgqA
	vvh7hRbKrKwqhYpbtDKlelXWqcNQLVhfJl0ni0n9b+IgNxexu3BKSNr7nw+nvdHrNRYzu++SsWPeG
	s+cxBZni+89uxD3KEacw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFVE-0000000HSeG-3M9B;
	Tue, 23 Apr 2024 12:44:04 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFUw-0000000HSNC-0O49
	for linux-riscv@lists.infradead.org;
	Tue, 23 Apr 2024 12:43:47 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-346407b8c9aso1491759f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Apr 2024 05:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713876224; x=1714481024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUZbX4he9n4q1vZFYMxp+s3nYLKyrFtBWJZsTu2EIzo=;
        b=afb5ExGPPUtd4RN/WylDYYDURSakeApxl/VMmx7OEqN9FckEeFrUoAgJtDPfql1LP9
         JhT2IrdMdjpq6Ts1Z8RS0FeGLGHuKaW9N+oVuSXWF5AxBdBUzBRtVI45Thou8H//pPkK
         YGiXC2W9LbObnAwB0pK/zisgk95/7WxA/0SuSxymbk8fyQu47KVZa/eBTwuFnAmk7RGJ
         4oaMqBJYhJVkConZyZkwpeXWvRmqn2CkJocnH9ZtdMZyb8hadFmZhlOXj6Z9u1dE+fhh
         dsCMDnYMUWjxgzMHZ2ecGsAHu2ffAEsOX9Z0IgCSV88P1tp4vtwkWXRG0KrqWaA4KrEl
         VEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876224; x=1714481024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUZbX4he9n4q1vZFYMxp+s3nYLKyrFtBWJZsTu2EIzo=;
        b=ejiQbkf1VO3VT3VWEqDxzghJlJItVyHX9uN6aymL7tyj0HgtB/9MaqH1b/WgrKHSry
         ql+4oZYwdfyS9eJanzfdzMX/V5tAlIAaIbG/qsDKcdVaiOFfExH3cKCTvD+dpQpGguAk
         LwZsWI50Ukp9IStsTropSoWWSMYBv0+uKWEMY12xrUhlsG2fN4mNxjXLX86K9jRH+O8n
         Xc3nYeFIl8ozOunzUVk78KGFjZ7I0tJl8qGvKtRDBZVQSu2XCnvbeyaaiW+QWyf6I5kE
         r/91bEGiP8hAtNAhaCI2vtB7V+XJqOpXCgys4yazcvguUGNCC1QQ3joYptxyZuLzOXxG
         vYXA==
X-Forwarded-Encrypted: i=1; AJvYcCWj68R6Ab+8kwVHwivjUWJVXLAxgb9McKZUzZpkGtKK9KCp2FZva5uKQ+x0JNMJgyJ5vdcNVBKJR/mFvmf0Pz1kgj1j5hy2TlFeUtlBOqrR
X-Gm-Message-State: AOJu0Yxn6Q2NNg9pTnBLvaWh2hgacScmaXByrV4zmI62E5j9MLw5hyyC
	KOlQ1da//Ae5WBCD2w2ERbf+NwzGKqdDIVYeFhXdOMvl2mGbUV9gLzfKkFWtu80=
X-Google-Smtp-Source: AGHT+IGbIVzcAn3QLqtxJnElWT6wqDhKCqDt4jI+gjpB2p8+cPOxRO/7EwBoQJ6Mrahyga7IgRhsSA==
X-Received: by 2002:a05:600c:3b8a:b0:419:f241:6336 with SMTP id n10-20020a05600c3b8a00b00419f2416336mr6604286wms.1.1713876224214;
        Tue, 23 Apr 2024 05:43:44 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:71cb:1f75:7053:849c])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b00418a386c059sm19975709wmo.42.2024.04.23.05.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:43:43 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v3 03/11] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
Date: Tue, 23 Apr 2024 14:43:17 +0200
Message-ID: <20240423124326.2532796-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423124326.2532796-1-cleger@rivosinc.com>
References: <20240423124326.2532796-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_054346_258234_2F3C1BA6 
X-CRM114-Status: GOOD (  14.50  )
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

VGhlIFpjKiBzdGFuZGFyZCBleHRlbnNpb24gZm9yIGNvZGUgcmVkdWN0aW9uIGludHJvZHVjZXMg
bmV3IGV4dGVuc2lvbnMuClRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IGZvciBaY2EsIFpjZiwgWmNk
IGFuZCBaY2IuIFpjZSwgWmNtdCBhbmQgWmNtcAphcmUgbGVmdCBvdXQgb2YgdGhpcyBwYXRjaCBz
aW5jZSB0aGV5IGFyZSB0YXJnZXRpbmcgbWljcm9jb250cm9sbGVycy8KZW1iZWRkZWQgQ1BVcyBp
bnN0ZWFkIG9mIGFwcGxpY2F0aW9uIHByb2Nlc3NvcnMuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVu
dCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od2NhcC5oIHwgIDQgKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCA0NyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDUwIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKaW5kZXggNTQz
ZTNlYTJkYTBlLi5iNzU1MWJhZDM0MWIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vaHdjYXAuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKQEAgLTgyLDYg
KzgyLDEwIEBACiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkFDQVMJCTczCiAjZGVmaW5lIFJJU0NW
X0lTQV9FWFRfWEFOREVTUE1VCQk3NAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pJTU9QCQk3NQor
I2RlZmluZSBSSVNDVl9JU0FfRVhUX1pDQQkJNzYKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0IJ
CTc3CisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkNECQk3OAorI2RlZmluZSBSSVNDVl9JU0FfRVhU
X1pDRgkJNzkKIAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1hMSU5VWEVOVkNGRwkxMjcKIApkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvY3B1ZmVhdHVyZS5jCmluZGV4IDZkMjM4YzhkYmNjZi4uMjRiZjNmYmMwNTc4IDEwMDY0NAot
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvY3B1ZmVhdHVyZS5jCkBAIC0xMDcsNiArMTA3LDI5IEBAIHN0YXRpYyBib29sIHJpc2N2X2V4
dF96aWNib3pfdmFsaWRhdGUoY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSAqZGF0YSwK
IAlyZXR1cm4gdHJ1ZTsKIH0KIAorc3RhdGljIGJvb2wgcmlzY3ZfZXh0X3pjYV9kZXBlbmRzKGNv
bnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgKmRhdGEsCisJCQkJICAgY29uc3QgdW5zaWdu
ZWQgbG9uZyAqaXNhX2JpdG1hcCkKK3sKKwlyZXR1cm4gX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2
YWlsYWJsZShpc2FfYml0bWFwLCBSSVNDVl9JU0FfRVhUX1pDQSk7Cit9CitzdGF0aWMgYm9vbCBy
aXNjdl9leHRfemNkX3ZhbGlkYXRlKGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgKmRh
dGEsCisJCQkJICAgY29uc3QgdW5zaWduZWQgbG9uZyAqaXNhX2JpdG1hcCkKK3sKKwlyZXR1cm4g
X19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2FfYml0bWFwLCBSSVNDVl9JU0FfRVhU
X1pDQSkgJiYKKwkgICAgICAgX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2FfYml0
bWFwLCBSSVNDVl9JU0FfRVhUX2QpOworfQorCitzdGF0aWMgYm9vbCByaXNjdl9leHRfemNmX3Zh
bGlkYXRlKGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgKmRhdGEsCisJCQkJICAgY29u
c3QgdW5zaWduZWQgbG9uZyAqaXNhX2JpdG1hcCkKK3sKKyNpZmRlZiBDT05GSUdfNjRCSVQKKwly
ZXR1cm4gZmFsc2U7CisjZWxzZQorCXJldHVybiBfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxh
YmxlKGlzYV9iaXRtYXAsIFJJU0NWX0lTQV9FWFRfWkNBKSAmJgorCSAgICAgICBfX3Jpc2N2X2lz
YV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYV9iaXRtYXAsIFJJU0NWX0lTQV9FWFRfZik7CisjZW5k
aWYKK30KKwogI2RlZmluZSBfUklTQ1ZfSVNBX0VYVF9EQVRBKF9uYW1lLCBfaWQsIF9zdWJzZXRf
ZXh0cywgX3N1YnNldF9leHRzX3NpemUsIF92YWxpZGF0ZSkgewlcCiAJLm5hbWUgPSAjX25hbWUs
CQkJCQkJCQkJXAogCS5wcm9wZXJ0eSA9ICNfbmFtZSwJCQkJCQkJCVwKQEAgLTExOCw2ICsxNDEs
OSBAQCBzdGF0aWMgYm9vbCByaXNjdl9leHRfemljYm96X3ZhbGlkYXRlKGNvbnN0IHN0cnVjdCBy
aXNjdl9pc2FfZXh0X2RhdGEgKmRhdGEsCiAKICNkZWZpbmUgX19SSVNDVl9JU0FfRVhUX0RBVEEo
X25hbWUsIF9pZCkgX1JJU0NWX0lTQV9FWFRfREFUQShfbmFtZSwgX2lkLCBOVUxMLCAwLCBOVUxM
KQogCisjZGVmaW5lIF9fUklTQ1ZfSVNBX0VYVF9EQVRBX1ZBTElEQVRFKF9uYW1lLCBfaWQsIF92
YWxpZGF0ZSkgXAorCQkJX1JJU0NWX0lTQV9FWFRfREFUQShfbmFtZSwgX2lkLCBOVUxMLCAwLCBf
dmFsaWRhdGUpCisKIC8qIFVzZWQgdG8gZGVjbGFyZSBwdXJlICJsYXNzbyIgZXh0ZW5zaW9uICha
ayBmb3IgaW5zdGFuY2UpICovCiAjZGVmaW5lIF9fUklTQ1ZfSVNBX0VYVF9CVU5ETEUoX25hbWUs
IF9idW5kbGVkX2V4dHMpIFwKIAlfUklTQ1ZfSVNBX0VYVF9EQVRBKF9uYW1lLCBSSVNDVl9JU0Ff
RVhUX0lOVkFMSUQsIF9idW5kbGVkX2V4dHMsIFwKQEAgLTIwOSw2ICsyMzUsMjEgQEAgc3RhdGlj
IGNvbnN0IHVuc2lnbmVkIGludCByaXNjdl94bGludXhlbnZjZmdfZXh0c1tdID0gewogCVJJU0NW
X0lTQV9FWFRfWExJTlVYRU5WQ0ZHCiB9OwogCisvKgorICogWmMqIHNwZWMgc3RhdGVzIHRoYXQ6
CisgKiAtIEMgYWx3YXlzIGltcGxpZXMgWmNhCisgKiAtIEMrRiBpbXBsaWVzIFpjZiAoUlYzMiBv
bmx5KQorICogLSBDK0QgaW1wbGllcyBaY2QKKyAqCisgKiBUaGVzZSBleHRlbnNpb25zIHdpbGwg
YmUgZW5hYmxlZCBhbmQgdGhlbiB2YWxpZGF0ZWQgZGVwZW5kaW5nIG9uIHRoZQorICogYXZhaWxh
YmlsaXR5IG9mIEYvRCBSVjMyLgorICovCitzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2
X2NfZXh0c1tdID0geworCVJJU0NWX0lTQV9FWFRfWkNBLAorCVJJU0NWX0lTQV9FWFRfWkNGLAor
CVJJU0NWX0lTQV9FWFRfWkNELAorfTsKKwogLyoKICAqIFRoZSBjYW5vbmljYWwgb3JkZXIgb2Yg
SVNBIGV4dGVuc2lvbiBuYW1lcyBpbiB0aGUgSVNBIHN0cmluZyBpcyBkZWZpbmVkIGluCiAgKiBj
aGFwdGVyIDI3IG9mIHRoZSB1bnByaXZpbGVnZWQgc3BlY2lmaWNhdGlvbi4KQEAgLTI1NSw3ICsy
OTYsNyBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9
IHsKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShmLCBSSVNDVl9JU0FfRVhUX2YpLAogCV9fUklTQ1Zf
SVNBX0VYVF9EQVRBKGQsIFJJU0NWX0lTQV9FWFRfZCksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEo
cSwgUklTQ1ZfSVNBX0VYVF9xKSwKLQlfX1JJU0NWX0lTQV9FWFRfREFUQShjLCBSSVNDVl9JU0Ff
RVhUX2MpLAorCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVChjLCBSSVNDVl9JU0FfRVhUX2MsIHJp
c2N2X2NfZXh0cyksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEodiwgUklTQ1ZfSVNBX0VYVF92KSwK
IAlfX1JJU0NWX0lTQV9FWFRfREFUQShoLCBSSVNDVl9JU0FfRVhUX2gpLAogCV9fUklTQ1ZfSVNB
X0VYVF9TVVBFUlNFVF9WQUxJREFURSh6aWNib20sIFJJU0NWX0lTQV9FWFRfWklDQk9NLCByaXNj
dl94bGludXhlbnZjZmdfZXh0cywKQEAgLTI3NCw2ICszMTUsMTAgQEAgY29uc3Qgc3RydWN0IHJp
c2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7CiAJX19SSVNDVl9JU0FfRVhUX0RB
VEEoemZhLCBSSVNDVl9JU0FfRVhUX1pGQSksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemZoLCBS
SVNDVl9JU0FfRVhUX1pGSCksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemZobWluLCBSSVNDVl9J
U0FfRVhUX1pGSE1JTiksCisJX19SSVNDVl9JU0FfRVhUX0RBVEEoemNhLCBSSVNDVl9JU0FfRVhU
X1pDQSksCisJX19SSVNDVl9JU0FfRVhUX0RBVEFfVkFMSURBVEUoemNiLCBSSVNDVl9JU0FfRVhU
X1pDQiwgcmlzY3ZfZXh0X3pjYV9kZXBlbmRzKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQV9WQUxJ
REFURSh6Y2QsIFJJU0NWX0lTQV9FWFRfWkNELCByaXNjdl9leHRfemNkX3ZhbGlkYXRlKSwKKwlf
X1JJU0NWX0lTQV9FWFRfREFUQV9WQUxJREFURSh6Y2YsIFJJU0NWX0lTQV9FWFRfWkNGLCByaXNj
dl9leHRfemNmX3ZhbGlkYXRlKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6YmEsIFJJU0NWX0lT
QV9FWFRfWkJBKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6YmIsIFJJU0NWX0lTQV9FWFRfWkJC
KSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6YmMsIFJJU0NWX0lTQV9FWFRfWkJDKSwKLS0gCjIu
NDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
