Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A334CC04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 14:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YyjbLF/YgwCJTe2tIkNdi+Lmg14y5thx7FIPWhsjru4=; b=A58GIclqBJizBV
	f/Puzb7mlpxm/dvbC6hUXhT/XK3+zg1SmRoO0O9gtb9UGD5MohQD9iID55QLa1ysjhxtUDI9DyuOd
	qZv79wNepGaDLXpo0srv3EkzFhJN5N+urD/7qmy9U8bcwwNJmneDCB658xs9+nza8m1L2falDLJwu
	LGXmoJLNqu+y3gFApP8KrjPvh+TSPrj/GweRFSpwTp6qWfn9sISNnTnpRtaAzLA97daAYyi8XBosB
	DKMuakXVnkwxMsJE0qJ6nT6hg6cpmlGeDiDnExaed7/8AV9qbgHAxyp+uOUHbeRfRzavq5oomnncL
	alP8tCxYNmpSZhFoJ70A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yyc-0000000897q-0OFp;
	Fri, 17 May 2024 14:54:30 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yxk-0000000889N-0riK
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 14:53:44 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2e20088184cso3324161fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 07:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715957606; x=1716562406; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAqp201GVFEIbm+MBVsat6TXP4XkPRbsrzp6M2IRGJU=;
        b=BzelVVRSfl+/0u15rtCcalQgEn0mQSRBpCOo2Ic96cDseBTbPsfk2HX/SGYZr71bdc
         pj1inqLV5E9JB/0sd0TsJeRTEBc5veTV9A4FD15CWNSYdreqmtgKYPX0Gy1+UqADPkVk
         7Ysua5nf/oh9Zot1LuwzQRAanV65r+Lz0t16/FRkaaEjYXCGBBRByyBIVpZ2I2Nd1iot
         HkZ56ggJ3/73I3szzMTCsPhI1thNhbTojf0D84IqY5IQREk5veOA63DvXe9IY6woYMxw
         82zYNxGfCDuZp3y0pzlUV5gFP44Y1QZtFIhWQm2QIboVQ/hxMrr/w23eW8tvOvq7MG6h
         n4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715957606; x=1716562406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAqp201GVFEIbm+MBVsat6TXP4XkPRbsrzp6M2IRGJU=;
        b=NaRYkxkccupiiG8pAHNz80FtD4qYeBcF1rL9197/rxpd8tnAe+rJ6uRS49v1Zlm8i+
         ya4gxQ4XDn5fbi9tZt7OmdOBzfH9dChJGYpnjE6fr9pusQwsyrQCGhl0SHzQA9egcDTV
         u7z9xcQ3S+sOcqckmXDMOlz4HycGc9lSHqFo0rwO0HGACXeRGDGqfPBF6ImEIw1AvQHA
         AEIqUN/VYupV9rrafDgg/Nn/YOuhINIcxiN/Tevov6cglvxUAf5uR7cMgiJ+QlyOcGF6
         yh4zoMl9Jw2Q8ZTmna4aoHjWj9nfu/CeXmHgyA8TzA6el3NoHqh1Lp9c5I/lUjKhFqh3
         ruSw==
X-Forwarded-Encrypted: i=1; AJvYcCXCbDDjoFmRoYwWNFYdtbbYbnsGwng9gaB5/cxuhogFdMpfa7vGhTr+eWyX5jWAi8A9bUxiquFqrERpNh5ba1qxc6IjhCjQY2YpEVz1wcfI
X-Gm-Message-State: AOJu0Yz0X8RtZfJHGgHLpfDvKL4LSLFYL97mLj3VFr1ZByLSklqFT73s
	B7pNkjVI/prNK5t8ytsj4+PplwQQ9SN2RMlsQFOeRfkN8l4nOV68m111dol4InU=
X-Google-Smtp-Source: AGHT+IGbsOhS3vioDq76MfxLVdQKIggUZ1R5Mnaj+gjL7Qa12+AkX4dFvnOwn4zP83iDuEwRqKrmKA==
X-Received: by 2002:a2e:a1ca:0:b0:2e5:67a7:dda7 with SMTP id 38308e7fff4ca-2e567a7df67mr139375581fa.3.1715957605840;
        Fri, 17 May 2024 07:53:25 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:46f0:3724:aa77:c1f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm301723695e9.28.2024.05.17.07.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:53:25 -0700 (PDT)
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
Subject: [PATCH v5 08/16] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
Date: Fri, 17 May 2024 16:52:48 +0200
Message-ID: <20240517145302.971019-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517145302.971019-1-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_075336_793385_6A767E16 
X-CRM114-Status: GOOD (  15.02  )
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
bS9jcHVmZWF0dXJlLmggfCAgMyArKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oICAg
ICAgfCAgNCArKysKIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAgIHwgNDQgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0KIDMgZmlsZXMgY2hhbmdlZCwgNTAgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y3B1ZmVhdHVyZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKaW5kZXgg
MWExNDhjZDY3ZTBlLi44NjExZTFjOGVjMmQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vY3B1ZmVhdHVyZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVy
ZS5oCkBAIC00Niw2ICs0Niw5IEBAIHZvaWQgcmlzY3ZfdXNlcl9pc2FfZW5hYmxlKHZvaWQpOwog
CiAjZGVmaW5lIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKF9uYW1lLCBfaWQpIF9SSVNDVl9JU0FfRVhU
X0RBVEEoX25hbWUsIF9pZCwgTlVMTCwgMCwgTlVMTCkKIAorI2RlZmluZSBfX1JJU0NWX0lTQV9F
WFRfREFUQV9WQUxJREFURShfbmFtZSwgX2lkLCBfdmFsaWRhdGUpIFwKKwkJCV9SSVNDVl9JU0Ff
RVhUX0RBVEEoX25hbWUsIF9pZCwgTlVMTCwgMCwgX3ZhbGlkYXRlKQorCiAvKiBVc2VkIHRvIGRl
Y2xhcmUgcHVyZSAibGFzc28iIGV4dGVuc2lvbiAoWmsgZm9yIGluc3RhbmNlKSAqLwogI2RlZmlu
ZSBfX1JJU0NWX0lTQV9FWFRfQlVORExFKF9uYW1lLCBfYnVuZGxlZF9leHRzKSBcCiAJX1JJU0NW
X0lTQV9FWFRfREFUQShfbmFtZSwgUklTQ1ZfSVNBX0VYVF9JTlZBTElELCBfYnVuZGxlZF9leHRz
LCBcCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKaW5kZXggYjE4OTZkYWRlNzRjLi5hNTgzNmZhNmI5OTgg
MTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAorKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKQEAgLTgxLDYgKzgxLDEwIEBACiAjZGVmaW5lIFJJU0NW
X0lTQV9FWFRfWlRTTwkJNzIKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQUNBUwkJNzMKICNkZWZp
bmUgUklTQ1ZfSVNBX0VYVF9aSU1PUAkJNzQKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0EJCTc1
CisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkNCCQk3NgorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pD
RAkJNzcKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0YJCTc4CiAKICNkZWZpbmUgUklTQ1ZfSVNB
X0VYVF9YTElOVVhFTlZDRkcJMTI3CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2Nw
dWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwppbmRleCBmYTRhZDcz
Yjc3MGEuLjNiYjJlZjUyYTM4YiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwpAQCAtMTAzLDYgKzEw
MywyOSBAQCBzdGF0aWMgaW50IHJpc2N2X2V4dF96aWNib3pfdmFsaWRhdGUoY29uc3Qgc3RydWN0
IHJpc2N2X2lzYV9leHRfZGF0YSAqZGF0YSwKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCBy
aXNjdl9leHRfemNhX2RlcGVuZHMoY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSAqZGF0
YSwKKwkJCQkgY29uc3QgdW5zaWduZWQgbG9uZyAqaXNhX2JpdG1hcCkKK3sKKwlyZXR1cm4gX19y
aXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2FfYml0bWFwLCBSSVNDVl9JU0FfRVhUX1pD
QSkgPyAwIDogLUVQUk9CRV9ERUZFUjsKK30KK3N0YXRpYyBpbnQgcmlzY3ZfZXh0X3pjZF92YWxp
ZGF0ZShjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhICpkYXRhLAorCQkJCSAgY29uc3Qg
dW5zaWduZWQgbG9uZyAqaXNhX2JpdG1hcCkKK3sKKwlyZXR1cm4gX19yaXNjdl9pc2FfZXh0ZW5z
aW9uX2F2YWlsYWJsZShpc2FfYml0bWFwLCBSSVNDVl9JU0FfRVhUX1pDQSkgJiYKKwkgICAgICAg
X19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2FfYml0bWFwLCBSSVNDVl9JU0FfRVhU
X2QpID8gMCA6IC1FUFJPQkVfREVGRVI7Cit9CisKK3N0YXRpYyBpbnQgcmlzY3ZfZXh0X3pjZl92
YWxpZGF0ZShjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhICpkYXRhLAorCQkJCSAgY29u
c3QgdW5zaWduZWQgbG9uZyAqaXNhX2JpdG1hcCkKK3sKKyNpZmRlZiBDT05GSUdfNjRCSVQKKwly
ZXR1cm4gLUVJTlZBTDsKKyNlbHNlCisJcmV0dXJuIF9fcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFp
bGFibGUoaXNhX2JpdG1hcCwgUklTQ1ZfSVNBX0VYVF9aQ0EpICYmCisJICAgICAgIF9fcmlzY3Zf
aXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoaXNhX2JpdG1hcCwgUklTQ1ZfSVNBX0VYVF9mKSA/IDAg
OiAtRVBST0JFX0RFRkVSOworI2VuZGlmCit9CisKIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQg
cmlzY3ZfemtfYnVuZGxlZF9leHRzW10gPSB7CiAJUklTQ1ZfSVNBX0VYVF9aQktCLAogCVJJU0NW
X0lTQV9FWFRfWkJLQywKQEAgLTE4Myw2ICsyMDYsMjEgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVk
IGludCByaXNjdl94bGludXhlbnZjZmdfZXh0c1tdID0gewogCVJJU0NWX0lTQV9FWFRfWExJTlVY
RU5WQ0ZHCiB9OwogCisvKgorICogWmMqIHNwZWMgc3RhdGVzIHRoYXQ6CisgKiAtIEMgYWx3YXlz
IGltcGxpZXMgWmNhCisgKiAtIEMrRiBpbXBsaWVzIFpjZiAoUlYzMiBvbmx5KQorICogLSBDK0Qg
aW1wbGllcyBaY2QKKyAqCisgKiBUaGVzZSBleHRlbnNpb25zIHdpbGwgYmUgZW5hYmxlZCBhbmQg
dGhlbiB2YWxpZGF0ZWQgZGVwZW5kaW5nIG9uIHRoZQorICogYXZhaWxhYmlsaXR5IG9mIEYvRCBS
VjMyLgorICovCitzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X2NfZXh0c1tdID0gewor
CVJJU0NWX0lTQV9FWFRfWkNBLAorCVJJU0NWX0lTQV9FWFRfWkNGLAorCVJJU0NWX0lTQV9FWFRf
WkNELAorfTsKKwogLyoKICAqIFRoZSBjYW5vbmljYWwgb3JkZXIgb2YgSVNBIGV4dGVuc2lvbiBu
YW1lcyBpbiB0aGUgSVNBIHN0cmluZyBpcyBkZWZpbmVkIGluCiAgKiBjaGFwdGVyIDI3IG9mIHRo
ZSB1bnByaXZpbGVnZWQgc3BlY2lmaWNhdGlvbi4KQEAgLTIyOSw3ICsyNjcsNyBAQCBjb25zdCBz
dHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJU0NWX0lT
QV9FWFRfREFUQShmLCBSSVNDVl9JU0FfRVhUX2YpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKGQs
IFJJU0NWX0lTQV9FWFRfZCksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEocSwgUklTQ1ZfSVNBX0VY
VF9xKSwKLQlfX1JJU0NWX0lTQV9FWFRfREFUQShjLCBSSVNDVl9JU0FfRVhUX2MpLAorCV9fUklT
Q1ZfSVNBX0VYVF9TVVBFUlNFVChjLCBSSVNDVl9JU0FfRVhUX2MsIHJpc2N2X2NfZXh0cyksCiAJ
X19SSVNDVl9JU0FfRVhUX0RBVEEodiwgUklTQ1ZfSVNBX0VYVF92KSwKIAlfX1JJU0NWX0lTQV9F
WFRfREFUQShoLCBSSVNDVl9JU0FfRVhUX2gpLAogCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVF9W
QUxJREFURSh6aWNib20sIFJJU0NWX0lTQV9FWFRfWklDQk9NLCByaXNjdl94bGludXhlbnZjZmdf
ZXh0cywKQEAgLTI0OCw2ICsyODYsMTAgQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0
YSByaXNjdl9pc2FfZXh0W10gPSB7CiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemZhLCBSSVNDVl9J
U0FfRVhUX1pGQSksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemZoLCBSSVNDVl9JU0FfRVhUX1pG
SCksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemZobWluLCBSSVNDVl9JU0FfRVhUX1pGSE1JTiks
CisJX19SSVNDVl9JU0FfRVhUX0RBVEEoemNhLCBSSVNDVl9JU0FfRVhUX1pDQSksCisJX19SSVND
Vl9JU0FfRVhUX0RBVEFfVkFMSURBVEUoemNiLCBSSVNDVl9JU0FfRVhUX1pDQiwgcmlzY3ZfZXh0
X3pjYV9kZXBlbmRzKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQV9WQUxJREFURSh6Y2QsIFJJU0NW
X0lTQV9FWFRfWkNELCByaXNjdl9leHRfemNkX3ZhbGlkYXRlKSwKKwlfX1JJU0NWX0lTQV9FWFRf
REFUQV9WQUxJREFURSh6Y2YsIFJJU0NWX0lTQV9FWFRfWkNGLCByaXNjdl9leHRfemNmX3ZhbGlk
YXRlKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6YmEsIFJJU0NWX0lTQV9FWFRfWkJBKSwKIAlf
X1JJU0NWX0lTQV9FWFRfREFUQSh6YmIsIFJJU0NWX0lTQV9FWFRfWkJCKSwKIAlfX1JJU0NWX0lT
QV9FWFRfREFUQSh6YmMsIFJJU0NWX0lTQV9FWFRfWkJDKSwKLS0gCjIuNDMuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
