Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1C260A260F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 15:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uTNDJgSB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=Wqk5FPwN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sspTBSdS05QRlqG0n8rRrzKud1VEo7zcVT22AXO8t7s=; b=uTNDJgSBN5qiGnGOTJAUPa/a3k
	TcuV/B73YygdUo2w9kigNBfWg+WU/C2aVwvSbaMWX83FUQW11T8HGUFG3/04e1tOvvDtw7CaUbZOk
	eRHQmeStolsRq0ZjJa4NjUkw2DCeQm3ncu6a34AwxFzcjcaam1IRo2hmMqImp8KE3AFX7wh2g/wXh
	g3q0dbwI0z1eyDMpJS5cPto7QwmVDlH+waBjlBQlkFxg+xUcQf/0oOGVFS7xK7dR3Dby6HQHSkZ8E
	WtKlsGTmz0CAuHY2T1XtmoEEKwyEZOzzbsAylNbdgDJY16mKshvR5WVFT1Ws5LKiueCF7O7eGHWRf
	SSr+RMJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3sy-0000000COq8-2WCC;
	Thu, 19 Nov 2026 15:17:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3sw-0000000COor-06Ux
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 15:17:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so14358135e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 19 Nov 2026 07:17:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795101431; cv=none;
        d=google.com; s=arc-20260327;
        b=jVUfYQSK7r3WgJ53YKH9Da6Vul6QPMO0RKh0PuPvf9jIVHA3CsfYvEaD5ILGWDdhC6
         NwTwkjaLql8O7iF92ClC8jfEhlSTCOVc2BawuPIpvCB8wrgJE0+9jRHLUkNqw5oXW8jN
         t/0u+Mkm0P26nXyDRuxw1b7VPkyvXuow9zaytp+zqDq/k+9B703DSCDCg3wKWbvMRGjm
         TuE38Ostf4Wc0+VNGRXWWPHc969gICfVObEkQn1lVC/4+MjrhIrUhF3g7i7B6+imAeKm
         WkMNqPMRvhT8sLQeznHqXxUbCvHzeaJcVow1i+sSDnFELJKUCqVFK4GcmsZ2iWqh84oW
         XR4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s1nV4pJB/Pg9LULexQxieGs66dNhcFkD3Zb94PHOxG0=;
        fh=2/7zs5bb7LZEiUJYJEliLIx6zwYgTvCQFDu9n2waOCw=;
        b=L06nA+8hBGAdfAc95MNRNVkRiJi6q6LH+X3cTV6Fo0PSTMEP5wt5gLHq4ycWKCM1O5
         XFuS2vOm4DRqofKzVL8FyTXfSwXZBrzDhPUI8Jb1EUiD1gBBmz3/yvBNmHvznZTxBQsi
         hocJ0kOlW7ASL9k2OEMueevno2fkwlo0rnLyeL2RMDrYu2zyt1e1WE8yIncfsp9+zmuD
         v/O2x5zdNttPfOZ9ZZ8VqDLJkD049P2BgMylaB+Ar0h42c/pYJD/14aDoh5qYx24p7Bh
         hmWda1vr6WnwM0H1/FhpvMjbrbyQ07o3zVkVIMRMyHdQdGBnzTqHYird3Zw2rmu2Uqh4
         98Fw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795101431; x=1795706231; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s1nV4pJB/Pg9LULexQxieGs66dNhcFkD3Zb94PHOxG0=;
        b=Wqk5FPwNC39Td4n7/lbukyI1lEFPOjCRJ5YQTDI3ip3gFRzLPiFNjgpssgECH+HldQ
         ROUmu/TzU9p5XRJ2dnMIwwIwGSOrkzyYNL9fUfIkvOxQMLnI/LK7ilJpBKCnMEz6PGWl
         I5UbeQee/jHDBUBWOzxyS75joF7jI2j5JnxtIli1RgqgsHWqzeSbdqqQgRv/A1GLSbdg
         qmQP9/1yiyeFfeiiPzqWLDw4nGWFhoy8NyThpUYgVlFkAgAVWR7HTiKlOXuRW3OP84uG
         K+Yr7t0tEetRtFjHq9UOdiEg4eb8lQBPkEQ6MLKVdyPIiws+BZpfHFri/btjm+Waequg
         ablQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101431; x=1795706231;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s1nV4pJB/Pg9LULexQxieGs66dNhcFkD3Zb94PHOxG0=;
        b=kVpkNB69L70Nlf+CBrOY/DtGU6WEshD5Fh+R/oRXRPGcmsKIcMAbvNwxIyVt0G965/
         +GjdyLy0NsW46W8A4/KdLp48uMin46RWp84ANkDms0GJx0pgEEb0zKGBs9GV0qxn5Pof
         WrH3eWxUWfqBptkX9A/FXAUt9uzP5KzvhZOVf51kU4D9bxAhViiKrBeuzUiNJ5GhN8Zf
         4Munag3amzzgdiuXyYrcTmqjUduvYx943VmM90JSRdEvDjP+GVxHqglf2OAC9SsTlkSY
         gmVZNkd6g/YSDqpKIaKfaZUNpeSbkq6vj1EbTQNGn7WRs1gJRbK+FTH671epGo2NqXrG
         O8Iw==
X-Forwarded-Encrypted: i=1; AL+hErEBlqkWXVmK46T6lcVYuJlemPlqZiWAxxC34GS7iz1R/MiWjPbdNmH1pZbHv+4UNEILH54HEoK3IZNHRg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9wpW3ERL+Ic+SMP8jZVQGHz4bvZeP07rXAIJ24VVPu9Oyu5GIo
	9Y0nDcOW0xQp4WIjCXtCuWWuY8N7u6BIcfTAJUbTZt1Hczpv7XIMlI3/YrHsNU8V0VTOeBI2v7S
	zWHrO2sITTLSQi8/7ernwrBkOrjeA/v4Eglw99pxk5A==
X-Gm-Gg: AYBFou0V03/0cwAHZBGV1LPAR3qnqt4rQ9pirWrAxZwMaetUWD5A0wmlzFN9+XSLOc7
	kuJUi9ImjZwmUyGkzRXC2mBPZGunck2EgrAcu+vBKSW/QrLYmL1IRAb92S/aObxYkclD8IUuS34
	2Qhi/yDogrPP1Rv6RJpEEbEQ5Z8uK45x3X8MRYb3xYSTADmkHzeGvTfKvPhebLQFIb8tTnhcWIM
	AB2yDXdHVpwPSCXLQXWXBDWsm++LidR8ZsLeTgAhWIxYFlyDX2hjQG1FNikDSbVodYJHlRlzCvg
	+Ur7blpK1bj/on4Hr0Ln313FZ8Ag/z9jNL5pgHbdoVCNVmS0VylTFllRlpOXbJGqOtXy8e2pNVj
	C7kMoxr/kolcNEjjbWTX+UwCT4M9uy/i4BYCC+djMxSMqsfbGjLSgQHavw7cMfLdIf85kgC6LH8
	EKRffHkHog+Gvc/TEYBjgu01OGJ2Hke1dPvDUnRPbO1ikSajVA15IqBro=
X-Received: by 2002:a05:600c:314f:b0:4a1:c6f5:2450 with SMTP id
 5b1f17b1804b1-4bb8612e0ecmr32385565e9.17.1795101431510; Thu, 19 Nov 2026
 07:17:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com> <20261118095053.3871267-3-vikram.singh3@oss.qualcomm.com>
In-Reply-To: <20261118095053.3871267-3-vikram.singh3@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 20:46:59 +0530
X-Gm-Features: Aa3M54rT33sHedk6b52_SmmeeC6_QwQxOJWE_LlMaSuUzG5nqW2zaQJ7Y3n50ik
Message-ID: <CAAhSdy1YOv2hBe9zi+yJ=fmVEfWi9iGSxxKJ7uZbSHowTj7NOg@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] riscv: pmu: Add Control transfer records CSR definations.
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atishp@rivosinc.com, anup.patel@oss.qualcomm.com, 
	will@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	beeman@rivosinc.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	devicetree@vger.kernel.org, Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_071714_305033_75B4C90E 
X-CRM114-Status: GOOD (  12.62  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgMzoyMeKAr1BNIFZpa3JhbSBTaW5naAo8dmlrcmFtLnNp
bmdoM0Bvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IEFkZGluZyBDU1IgZGVmaW5lcyBmb3Ig
UklTQ1YgQ29udHJvbCBUcmFuc2ZlciBSZWNvcmRzIGV4dGVuc2lvbiBbMF0KPiBhbG9uZyB3aXRo
IGJpdC1maWVsZCBtYWNyb3MgZm9yIGVhY2ggQ1NSLgo+Cj4gWzBdOiBodHRwczovL2dpdGh1Yi5j
b20vcmlzY3YvcmlzY3YtY29udHJvbC10cmFuc2Zlci1yZWNvcmRzCj4KPiBDby1kZXZlbG9wZWQt
Ynk6IFJham5lc2ggS2Fud2FsIDxyYWpuZXNoLmthbndhbDQ5QGdtYWlsLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBSYWpuZXNoIEthbndhbCA8cmFqbmVzaC5rYW53YWw0OUBnbWFpbC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogVmlrcmFtIFNpbmdoIDx2aWtyYW0uc2luZ2gzQG9zcy5xdWFsY29tbS5jb20+
Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MTEwNjE3Mzk0Mi4zMTc1MDY5
LTMtdmlrcmFtLnNpbmdoM0Bvc3MucXVhbGNvbW0uY29tCj4gU2lnbmVkLW9mZi1ieTogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFzIG1lbnRpb25lZCBpbiBQQVRDSDEsIGRyb3Ag
dGhlICJMaW5rOiIgYW5kIHRoZSBzdWJzZXF1ZW50CiJTaWduZWQtb2ZmLWJ5OiIgbGluZXMuCgo+
IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oIHwgOTUgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA5NSBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vY3NyLmgKPiBpbmRleCA2MjFmODRkMTg5OGYuLjA2MzM1MWQ5YjQwNiAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCj4gKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+IEBAIC0zNTAsNiArMzUwLDk3IEBACj4KPiAgI2RlZmlu
ZSBDU1JfU0NPVU5UT1ZGICAgICAgICAgIDB4ZGEwCj4KPiArLyogTS1tb2RlIENvbnRyb2wgVHJh
bnNmZXIgUmVjb3JkcyBDU1JzICovCj4gKyNkZWZpbmUgQ1NSX01DVFJDVEwgICAgICAgICAgICAw
eDM0ZQo+ICsKPiArLyogUy1tb2RlIENvbnRyb2wgVHJhbnNmZXIgUmVjb3JkcyBDU1JzICovCj4g
KyNkZWZpbmUgQ1NSX1NDVFJDVEwgICAgICAgICAgICAweDE0ZQo+ICsjZGVmaW5lIENTUl9TQ1RS
U1RBVFVTICAgICAgICAgMHgxNGYKPiArI2RlZmluZSBDU1JfU0NUUkRFUFRIICAgICAgICAgIDB4
MTVmCj4gKwo+ICsvKiBWUy1tb2RlIENvbnRyb2wgVHJhbnNmZXIgUmVjb3JkcyBDU1JzICovCj4g
KyNkZWZpbmUgQ1NSX1ZTQ1RSQ1RMICAgICAgICAgICAweDI0ZQo+ICsKPiArLyogeGN0cnRsIENT
UiBiaXRzLiAqLwo+ICsjZGVmaW5lIENUUkNUTF9VX0VOQUJMRSAgICAgICAgICAgICAgICBfQUMo
MHgxLCBVTCkKPiArI2RlZmluZSBDVFJDVExfU19FTkFCTEUgICAgICAgICAgICAgICAgX0FDKDB4
MiwgVUwpCj4gKyNkZWZpbmUgQ1RSQ1RMX01fRU5BQkxFICAgICAgICAgICAgICAgIF9BQygweDQs
IFVMKQo+ICsjZGVmaW5lIENUUkNUTF9SQVNFTVUgICAgICAgICAgX0FDKDB4ODAsIFVMKQo+ICsj
ZGVmaW5lIENUUkNUTF9TVEUgICAgICAgICAgICAgX0FDKDB4MTAwLCBVTCkKPiArI2RlZmluZSBD
VFJDVExfTVRFICAgICAgICAgICAgIF9BQygweDIwMCwgVUwpCj4gKyNkZWZpbmUgQ1RSQ1RMX0JQ
RlJaICAgICAgICAgICBfQUMoMHg4MDAsIFVMKQo+ICsjZGVmaW5lIENUUkNUTF9MQ09GSUZSWiAg
ICAgICAgICAgICAgICBfQUMoMHgxMDAwLCBVTCkKPiArI2RlZmluZSBDVFJDVExfRVhDSU5IICAg
ICAgICAgIF9BQygweDIwMDAwMDAwMCwgVUwpCj4gKyNkZWZpbmUgQ1RSQ1RMX0lOVFJJTkggICAg
ICAgICBfQUMoMHg0MDAwMDAwMDAsIFVMKQo+ICsjZGVmaW5lIENUUkNUTF9UUkVUSU5IICAgICAg
ICAgX0FDKDB4ODAwMDAwMDAwLCBVTCkKPiArI2RlZmluZSBDVFJDVExfTlRCUkVOICAgICAgICAg
IF9BQygweDEwMDAwMDAwMDAsIFVMKQo+ICsjZGVmaW5lIENUUkNUTF9US0JSSU5IICAgICAgICAg
X0FDKDB4MjAwMDAwMDAwMCwgVUwpCj4gKyNkZWZpbmUgQ1RSQ1RMX0lORENBTExfSU5IICAgICBf
QUMoMHgxMDAwMDAwMDAwMCwgVUwpCj4gKyNkZWZpbmUgQ1RSQ1RMX0RJUkNBTExfSU5IICAgICBf
QUMoMHgyMDAwMDAwMDAwMCwgVUwpCj4gKyNkZWZpbmUgQ1RSQ1RMX0lOREpVTVBfSU5IICAgICBf
QUMoMHg0MDAwMDAwMDAwMCwgVUwpCj4gKyNkZWZpbmUgQ1RSQ1RMX0RJUkpVTVBfSU5IICAgICBf
QUMoMHg4MDAwMDAwMDAwMCwgVUwpCj4gKyNkZWZpbmUgQ1RSQ1RMX0NPUlNXQVBfSU5IICAgICBf
QUMoMHgxMDAwMDAwMDAwMDAsIFVMKQo+ICsjZGVmaW5lIENUUkNUTF9SRVRfSU5IICAgICAgICAg
X0FDKDB4MjAwMDAwMDAwMDAwLCBVTCkKPiArI2RlZmluZSBDVFJDVExfSU5ET0pVTVBfSU5IICAg
IF9BQygweDQwMDAwMDAwMDAwMCwgVUwpCj4gKyNkZWZpbmUgQ1RSQ1RMX0RJUk9KVU1QX0lOSCAg
ICBfQUMoMHg4MDAwMDAwMDAwMDAsIFVMKQo+ICsKPiArLyogc2N0cnN0YXR1cyBDU1IgYml0cy4g
Ki8KPiArI2RlZmluZSBTQ1RSU1RBVFVTX1dSUFRSX01BU0sgIDB4RkYKPiArI2RlZmluZSBTQ1RS
U1RBVFVTX0ZST1pFTiAgICAgIF9BQygweDgwMDAwMDAwLCBVTCkKPiArCj4gKyNpZmRlZiBDT05G
SUdfUklTQ1ZfTV9NT0RFCj4gKyNkZWZpbmUgQ1RSQ1RMX0tFUk5FTF9FTkFCTEUgICBDVFJDVExf
TV9FTkFCTEUKPiArI2Vsc2UKPiArI2RlZmluZSBDVFJDVExfS0VSTkVMX0VOQUJMRSAgIENUUkNU
TF9TX0VOQUJMRQo+ICsjZW5kaWYKPiArCj4gKy8qIHNjdHJkZXB0aCBDU1IgYml0cy4gKi8KPiAr
I2RlZmluZSBTQ1RSREVQVEhfTUFTSyAgICAgICAgIDB4Nwo+ICsKPiArI2RlZmluZSBTQ1RSREVQ
VEhfTUlOICAgICAgICAgIDB4MCAvKiAxNiBFbnRyaWVzLiAqLwo+ICsjZGVmaW5lIFNDVFJERVBU
SF9NQVggICAgICAgICAgMHg0IC8qIDI1NiBFbnRyaWVzLiAqLwo+ICsKPiArLyogY3Ryc291cmNl
LCBjdHJ0YXJnZXQgYW5kIGN0cmRhdGEgQ1NSIGJpdHMuICovCj4gKyNkZWZpbmUgQ1RSU09VUkNF
X1ZBTElEICAgICAgICAgICAgICAgIDB4MVVMTAo+ICsjZGVmaW5lIENUUlRBUkdFVF9NSVNQICAg
ICAgICAgMHgxVUxMCj4gKwo+ICsjZGVmaW5lIENUUkRBVEFfVFlQRV9NQVNLICAgICAgMHhGCj4g
KyNkZWZpbmUgQ1RSREFUQV9DQ1YgICAgICAgICAgICAweDgwMDAKPiArI2RlZmluZSBDVFJEQVRB
X0NDTV9NQVNLICAgICAgIDB4RkZGMDAwMAo+ICsjZGVmaW5lIENUUkRBVEFfQ0NFX01BU0sgICAg
ICAgMHhGMDAwMDAwMAo+ICsKPiArI2RlZmluZSBDVFJEQVRBX1RZUEVfTk9ORSAgICAgICAgICAg
ICAgICAgICAgICAwCj4gKyNkZWZpbmUgQ1RSREFUQV9UWVBFX0VYQ0VQVElPTiAgICAgICAgICAg
ICAgICAgMQo+ICsjZGVmaW5lIENUUkRBVEFfVFlQRV9JTlRFUlJVUFQgICAgICAgICAgICAgICAg
IDIKPiArI2RlZmluZSBDVFJEQVRBX1RZUEVfVFJBUF9SRVQgICAgICAgICAgICAgICAgICAzCj4g
KyNkZWZpbmUgQ1RSREFUQV9UWVBFX05PTlRBS0VOX0JSQU5DSCAgICAgICAgICAgNAo+ICsjZGVm
aW5lIENUUkRBVEFfVFlQRV9UQUtFTl9CUkFOQ0ggICAgICAgICAgICAgIDUKPiArI2RlZmluZSBD
VFJEQVRBX1RZUEVfUkVTRVJWRURfNiAgICAgICAgICAgICAgICAgICAgICAgIDYKPiArI2RlZmlu
ZSBDVFJEQVRBX1RZUEVfUkVTRVJWRURfNyAgICAgICAgICAgICAgICAgICAgICAgIDcKPiArI2Rl
ZmluZSBDVFJEQVRBX1RZUEVfSU5ESVJFQ1RfQ0FMTCAgICAgICAgICAgICA4Cj4gKyNkZWZpbmUg
Q1RSREFUQV9UWVBFX0RJUkVDVF9DQUxMICAgICAgICAgICAgICAgOQo+ICsjZGVmaW5lIENUUkRB
VEFfVFlQRV9JTkRJUkVDVF9KVU1QICAgICAgICAgICAgIDEwCj4gKyNkZWZpbmUgQ1RSREFUQV9U
WVBFX0RJUkVDVF9KVU1QICAgICAgICAgICAgICAgMTEKPiArI2RlZmluZSBDVFJEQVRBX1RZUEVf
Q09fUk9VVElORV9TV0FQICAgICAgICAgICAxMgo+ICsjZGVmaW5lIENUUkRBVEFfVFlQRV9SRVRV
Uk4gICAgICAgICAgICAgICAgICAgIDEzCj4gKyNkZWZpbmUgQ1RSREFUQV9UWVBFX09USEVSX0lO
RElSRUNUX0pVTVAgICAgICAgMTQKPiArI2RlZmluZSBDVFJEQVRBX1RZUEVfT1RIRVJfRElSRUNU
X0pVTVAgICAgICAgICAxNQo+ICsKPiArI2RlZmluZSBDVFJfRU5UUklFU19GSVJTVCAgICAgIDB4
MjAwCj4gKyNkZWZpbmUgQ1RSX0VOVFJJRVNfTEFTVCAgICAgICAweDJmZgo+ICsKPiArLyogVGVt
cG9yYXJ5IGFkZHJlc3NlcyBmb3IgU3NwZXNhIChQcmVjaXNlIEV2ZW50IFNhbXBsZSBBdHRyaWJ1
dGlvbikgQ1NScy4gKi8KPiArI2RlZmluZSBDU1JfU0hQTVNQQyAgICAgICAgICAgIDB4NWQwCj4g
KyNkZWZpbmUgQ1NSX1NIUE1TREFUQSAgICAgICAgICAweDVkMQo+ICsKPiArLyogc2hwbXNkYXRh
IGZpZWxkcyAqLwo+ICsjZGVmaW5lIFNIUE1TREFUQV9DTlRSSUQgICAgICAgR0VOTUFTSyg0LCAw
KQo+ICsjZGVmaW5lIFNIUE1TREFUQV9NT0RFICAgICAgICAgR0VOTUFTSyg2LCA1KQo+ICsjZGVm
aW5lIFNIUE1TREFUQV9WICAgICAgICAgICAgQklUKDcpCj4gKyNkZWZpbmUgU0hQTVNEQVRBX01F
VEFEQVRBX1NISUZUICAgICAgIDgKPiArI2RlZmluZSBTSFBNU0RBVEFfTU9ERV9VICAgICAgIDAK
PiArI2RlZmluZSBTSFBNU0RBVEFfTU9ERV9TICAgICAgIDEKPiArCj4gICNkZWZpbmUgQ1NSX1NT
VEFUVVMgICAgICAgICAgICAweDEwMAo+ICAjZGVmaW5lIENTUl9TSUUgICAgICAgICAgICAgICAg
ICAgICAgICAweDEwNAo+ICAjZGVmaW5lIENTUl9TVFZFQyAgICAgICAgICAgICAgMHgxMDUKPiBA
QCAtNTYzLDYgKzY1NCw4IEBACj4gICMgZGVmaW5lIENTUl9UT1BFSSAgICAgQ1NSX01UT1BFSQo+
ICAjIGRlZmluZSBDU1JfVE9QSSAgICAgIENTUl9NVE9QSQo+Cj4gKyMgZGVmaW5lIENTUl9DVFJD
VEwgICAgQ1NSX01DVFJDVEwKPiArCj4gICMgZGVmaW5lIFNSX0lFICAgICAgICAgU1JfTUlFCj4g
ICMgZGVmaW5lIFNSX1BJRSAgICAgICAgICAgICAgICBTUl9NUElFCj4gICMgZGVmaW5lIFNSX1BQ
ICAgICAgICAgU1JfTVBQCj4gQEAgLTU5Myw2ICs2ODYsOCBAQAo+ICAjIGRlZmluZSBDU1JfVE9Q
RUkgICAgIENTUl9TVE9QRUkKPiAgIyBkZWZpbmUgQ1NSX1RPUEkgICAgICBDU1JfU1RPUEkKPgo+
ICsjIGRlZmluZSBDU1JfQ1RSQ1RMICAgIENTUl9TQ1RSQ1RMCj4gKwo+ICAjIGRlZmluZSBTUl9J
RSAgICAgICAgIFNSX1NJRQo+ICAjIGRlZmluZSBTUl9QSUUgICAgICAgICAgICAgICAgU1JfU1BJ
RQo+ICAjIGRlZmluZSBTUl9QUCAgICAgICAgIFNSX1NQUAo+IC0tCj4gMi40My4wCj4KCk90aGVy
d2lzZSwgTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3Jn
PgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
