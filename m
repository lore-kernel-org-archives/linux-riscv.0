Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD2AE7E649
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 15:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W6lN1RFFFGlRSPbxTMoIHe6DN8upixj/kmXPvBYxV+k=; b=KjgsDQI2tirDcQ
	akfFN55nCAMSYR55O43HwnVEr/IipLJuo7S2VVjINdTguMCPcECGfvIXLRJaRaaMhAiTeO/z9cNAs
	rRWWC+Tmwn2tAOEaWTjxTYWT00Nvi7qbOXDZQ6UsH+cfX12hq3K7SLwZeLzENN6Z3nbKW6IbkEUf6
	QSDa6CZLqXlPCvGMnYgSWpHImfh1gtJC1Zx9sG75pG7yq/nCP27+Gizdj+ub45369Z+u+RCzxbSWB
	Xba0x6ugbustm8nOW7tSGm6isXDzT6mBzL3fTvVYBHac+U/osg1+MmMafqA8VKKXzgz6vgUu5S8nz
	SC2mfBbISjENbttqHFKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql9bT-00GbLg-1F;
	Tue, 26 Sep 2023 15:03:59 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql9bQ-00GbJ9-0h
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 15:03:58 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40471c054f9so26828585e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Sep 2023 08:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695740632; x=1696345432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RIpK3OqmG3E1OUm0KgMySKOtKP9RNzbuGFCeuFimfhg=;
        b=aWhZJ7n/QugXxarqK96UuFcs9yYTiHHzzRkC1aNq599GdltVOTf7GeA2ndJy2WVi9k
         +dzjJocEOy5bDn/F1srAfjKueoJDr8s30hgtJlh/pxzNNrQzxBkhkNOibaNWckpfzNLK
         WSA2HX7F/jTPkkBTudbLyj1Aw74m8je5C0AS0Enxb9LgQ0zOwCIz02tstJ0ntAPmzGfu
         TwJZ12QuQP+g1CV+wGqD50Sqcnvr7L1SQ+Gdml8OgRsn6Rsq/PmJmgw/F7QscMSEGnzg
         8BU0S8H0q7qcVRJ/Kui6+SKWHiBDbwvL6CqZKsozxNFeuzwFuzcp5rgDm7ePsdfhud5N
         /OsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695740632; x=1696345432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIpK3OqmG3E1OUm0KgMySKOtKP9RNzbuGFCeuFimfhg=;
        b=eMc06j4Mc+if3fTMveb+a/EiQo8kIfAcZkryH0g31+KdVpA+kKk7ObBj57AL8rpHrf
         y28lhlorC59W4ke2TCEwslNzBD29oerwbGSZ65D8ZnQjO7GscazNtYAjzaomvvAPDXFN
         XqEENTA5HmEM+nUMBmYFU2IKJ5ZSwkfXTfxi+JmjZ3Y+CtuJy3RboE3DRTCjIKMSiDkI
         oxvEbsoxtP/5vsW9mzDaSMfv5Ev/Jfu9Pxou1z2QET3ytgSvKAe6VzE3l83puOGeZVlX
         R8pSGphsPX1J2ITji9J+n+8edf2/g/55/qxWtR4M2+zH2hXJ7d7suVtDmdhXIcho96f3
         chpw==
X-Gm-Message-State: AOJu0Yy8+CbOZ/3NQKzMMUg/ENSevJ8kWoNA0KRoZhVBtx37i/Rn0Cii
	SetHPSSY2rDSXGYot7ZAQpxhjA==
X-Google-Smtp-Source: AGHT+IFNTxn3ZjlQ5+Jtwf6UwRV/FhwgHLgxdXUERSMM8USfscRNhwx3BHgmb3Lm8sPO6lia6aTOAA==
X-Received: by 2002:a05:600c:1d82:b0:401:c07f:72bd with SMTP id p2-20020a05600c1d8200b00401c07f72bdmr8988881wms.4.1695740631744;
        Tue, 26 Sep 2023 08:03:51 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:2b3d:6c70:9dbf:5ede])
        by smtp.gmail.com with ESMTPSA id x11-20020a5d650b000000b00318147fd2d3sm14926060wru.41.2023.09.26.08.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 08:03:51 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Topel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ron Minnich <rminnich@gmail.com>,
	Daniel Maslowski <cyrevolt@googlemail.com>
Subject: [PATCH 0/7] Add support to handle misaligned accesses in S-mode
Date: Tue, 26 Sep 2023 17:03:09 +0200
Message-Id: <20230926150316.1129648-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_080356_491464_65A52415 
X-CRM114-Status: GOOD (  13.27  )
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

U2luY2UgY29tbWl0IDYxY2FkYjkgKCJQcm92aWRlIG5ldyBkZXNjcmlwdGlvbiBvZiBtaXNhbGln
bmVkIGxvYWQvc3RvcmUKYmVoYXZpb3IgY29tcGF0aWJsZSB3aXRoIHByaXZpbGVnZWQgYXJjaGl0
ZWN0dXJlLiIpIGluIHRoZSBSSVNDLVYgSVNBCm1hbnVhbCwgaXQgaXMgc3RhdGVkIHRoYXQgbWlz
YWxpZ25lZCBsb2FkL3N0b3JlIG1pZ2h0IG5vdCBiZSBzdXBwb3J0ZWQuCkhvd2V2ZXIsIHRoZSBS
SVNDLVYga2VybmVsIHVBQkkgZGVzY3JpYmVzIHRoYXQgbWlzYWxpZ25lZCBhY2Nlc3NlcyBhcmUK
c3VwcG9ydGVkLiBJbiBvcmRlciB0byBzdXBwb3J0IHRoYXQsIHRoaXMgc2VyaWVzIGFkZHMgc3Vw
cG9ydCBmb3IgUy1tb2RlCmhhbmRsaW5nIG9mIG1pc2FsaWduZWQgYWNjZXNzZXMgYXMgd2VsbCBz
dXBwb3J0IGZvciBwcmN0bChQUl9VTkFMSUdOKS4KCkhhbmRsaW5nIG1pc2FsaWduZWQgYWNjZXNz
IGluIGtlcm5lbCBhbGxvd3MgZm9yIGEgZmluZXIgZ3JhaW4gY29udHJvbApvZiB0aGUgbWlzYWxp
Z25lZCBhY2Nlc3NlcyBiZWhhdmlvciwgYW5kIHRoYW5rcyB0byB0aGUgcHJjdGwgY2FsbCwgY2Fu
CmFsbG93IGRpc2FibGluZyBtaXNhbGlnbmVkIGFjY2VzcyBlbXVsYXRpb24gdG8gZ2VuZXJhdGUg
U0lHQlVTLiBVc2VyCnNwYWNlIGNhbiB0aGVuIG9wdGltaXplIGl0cyBzb2Z0d2FyZSBieSByZW1v
dmluZyBzdWNoIGFjY2VzcyBiYXNlZCBvbgpTSUdCVVMgZ2VuZXJhdGlvbi4KCkN1cnJlbnRseSwg
dGhpcyBzZXJpZXMgaXMgdXNlZnVsIGZvciBwZW9wbGUgdGhhdCB1c2VzIGEgU0JJIHRoYXQgZG9l
cwpub3QgaGFuZGxlZCBtaXNhbGlnbmVkIHRyYXBzLiBJbiBhIG5lYXIgZnV0dXJlLCB0aGlzIHNl
cmllcyB3aWxsIG1ha2UKdXNlIGEgU0JJIGV4dGVuc2lvbiBbMV0gYWxsb3dpbmcgdG8gcmVxdWVz
dCBkZWxlZ2F0aW9uIG9mIHRoZQptaXNhbGlnbmVkIGxvYWQvc3RvcmUgdHJhcHMgdG8gdGhlIFMt
bW9kZSBzb2Z0d2FyZS4gVGhpcyBleHRlbnNpb24gaGFzCmJlZW4gc3VibWl0dGVkIGZvciByZXZp
ZXcgdG8gdGhlIHJpc2N2IHRlY2gtcHJzIGdyb3VwLiBBbiBPcGVuU0JJCmltcGxlbWVudGF0aW9u
IGZvciB0aGlzIHNwZWMgaXMgYXZhaWxhYmxlIGF0IFsyXS4KClRoaXMgc2VyaWVzIGNhbiBiZSB0
ZXN0ZWQgdXNpbmcgdGhlIHNwaWtlIHNpbXVsYXRvciBbM10gYW5kIGFuIG9wZW5TQkkKdmVyc2lv
biBbNF0gd2hpY2ggYWxsb3dzIHRvIGFsd2F5cyBkZWxlZ2F0ZSBtaXNhbGlnbmVkIGxvYWQvc3Rv
cmUgdG8KUy1tb2RlLgoKWzFdIGh0dHBzOi8vbGlzdHMucmlzY3Yub3JnL2cvdGVjaC1wcnMvbWVz
c2FnZS81NDAKWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXZvc2luYy9vcGVuc2JpL3RyZWUvZGV2
L2NsZWdlci9md19mZWF0dXJlX3Vwc3RyZWFtClszXSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Yt
c29mdHdhcmUtc3JjL3Jpc2N2LWlzYS1zaW0KWzRdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXZvc2lu
Yy9vcGVuc2JpL3RyZWUvZGV2L2NsZWdlci9ub19taXNhbGlnbmVkCgpDbMOpbWVudCBMw6lnZXIg
KDcpOgogIHJpc2N2OiByZW1vdmUgdW51c2VkIGZ1bmN0aW9ucyBpbiB0cmFwc19taXNhbGlnbmVk
LmMKICByaXNjdjogYWRkIHN1cHBvcnQgZm9yIG1pc2FsaWduZWQgaGFuZGxpbmcgaW4gUy1tb2Rl
CiAgcmlzY3Y6IHJlcG9ydCBwZXJmIGV2ZW50IGZvciBtaXNhbGlnbmVkIGZhdWx0CiAgcmlzY3Y6
IGFkZCBmbG9hdGluZyBwb2ludCBpbnNuIHN1cHBvcnQgdG8gbWlzYWxpZ25lZCBhY2Nlc3MgZW11
bGF0aW9uCiAgcmlzY3Y6IGFkZCBzdXBwb3J0IGZvciBzeXNjdGwgdW5hbGlnbmVkX2VuYWJsZWQg
Y29udHJvbAogIHJpc2N2OiByZXBvcnQgbWlzYWxpZ25lZCBhY2Nlc3NlcyBlbXVsYXRpb24gdG8g
aHdwcm9iZQogIHJpc2N2OiBhZGQgc3VwcG9ydCBmb3IgUFJfU0VUX1VOQUxJR04gYW5kIFBSX0dF
VF9VTkFMSUdOCgogYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICAgICB8ICAgMSAr
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCAgIHwgICA2ICsKIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vZW50cnktY29tbW9uLmggfCAgIDMgKwogYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9wcm9jZXNzb3IuaCAgICB8ICAgOSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSAg
ICAgICAgICAgIHwgICAyICstCiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgICAgICAg
IHwgICA2ICstCiBhcmNoL3Jpc2N2L2tlcm5lbC9mcHUuUyAgICAgICAgICAgICAgIHwgMTE3ICsr
KysrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgICAgICAgICAgIHwgIDE4ICsrCiBh
cmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jICAgICAgICAgICAgIHwgICAxICsKIGFyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzLmMgICAgICAgICAgICAgfCAgIDkgLQogYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHNfbWlzYWxpZ25lZC5jICB8IDM3NCArKysrKysrKysrKysrKysrKysrKysrLS0tLQogMTEgZmls
ZXMgY2hhbmdlZCwgNDg4IGluc2VydGlvbnMoKyksIDU4IGRlbGV0aW9ucygtKQoKLS0gCjIuNDAu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
