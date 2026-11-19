Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B139B606A325
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 12:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cA+w0U/w;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=bWO4sPgx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HTu1I4R8CKUdO4IHVj51rVNCtJpqC7sc1RbR14YBUNA=; b=cA+w0U/wOaM8cKVgIRrXuywVfi
	ufr08GTDgqZm1w0fvzOc5CFkHyOvkxkKtKwBEvCJNysZ/+ynZgJfsvfCwVoPNLFZ+tPusYCKBz3Kc
	JKd0f43NP7/pLV+GiyItDcHGtyBXrTQasuoPDiH9LHn8B9DmvbvAHGVm455XW/2mWQl43Awais8Wi
	s3JXj+RqEzj5JfyizgujRPwHbddRpaL5XXcfYjKKYkhD9Y8my8yHKksbA49M86ZwtoP6jAifP+8O+
	yuy0BVu0vrgeII932t/MFGZfyFELfHxpry6+F/+8QMBgwuw++/xf0CMHMK3XII/pxMmMvxpd+tiCA
	USw8XSZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0yD-0000000Bne6-3sJH;
	Thu, 19 Nov 2026 12:10:30 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0yB-0000000Bnbk-1chy
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 12:10:29 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-372bdb942dbso2918955eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 19 Nov 2026 04:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795090226; x=1795695026; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AYLDQ+yf8AHdWNChzIaxivscwK5yCyOEEBVUQLHdUIE=;
        b=bWO4sPgxOy78biBpODrMRNVyuHE9D+kcLoL00EMrNzbstdDDwo+swVaZ3rEWIMFbUX
         WA5gKzGqakAeKvl7/bgZzeHHZGV/z2FdA2GtM4jaJVmoB2PRDyul40UfdEQP20lwobSd
         bnBeHfMyNP8CcLr0p0ZVFvJlG97zPeTaTbstEXcLwUZbOpIEz2wO40jN2TxhqnblNx5K
         0Wpuzt+vU5IGB/1rOTPr3xyGSYvsLWKHRqUVUUEdVhibIc6SjvcaRHU/t5rZuFBzPvKk
         p2lbYZPcyCXgpq5bKYdSacpGg6zcvNldhXL4i18IJOXQmauBDxQVweHmdgz/3e1VFlKI
         gRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090226; x=1795695026;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYLDQ+yf8AHdWNChzIaxivscwK5yCyOEEBVUQLHdUIE=;
        b=Eioc+pKRymf4Ph2wra6H1GToh3C5Pte5ftfLZ3BlZINSe2eFROBpRXdS5mIj1r5HFx
         YjUPOPEVM7YdwvjhKjKqePJ2M5P75lrklSZsXM9qDkF+OZp2byLjOJI4PVn7MW79i0Uc
         MIszM04cPKCITsuffbitxzMO8Pz86BQhfq4to8Iw/yZ3JWzdTe6aEVohC5qrHICrNQVY
         5A8NbXfcmwimlIvLGKd+PVtYqZF4tiocDoEcsbB71J0d8WVN0DOkE19+E/Z3/gN+eNxV
         1U/xpDMPr3LBhYWVrvDla2M7fqeP917vZNGeW3KbgxswcvHbemkIb3oNxVVAR0xHyY/u
         cgbg==
X-Forwarded-Encrypted: i=1; AL+hErGq1rvHRVruX+EDyES86BWFyVyHnQGrvaA26CTQ6jUXSCPNbRj9zpYsa6QNFMdoHr0weBuXOne4g6cwaw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/meNSYynhRiBJp2KTv3fu/EPPwATUASPLQMCE2KK3MGJSLM6JY
	EnEaR9cBQtJYdqvm5tpvarL1c3xHpOafEE9LrvdraOTc28CXPMO4fjp2dFJiJ92MLxc=
X-Gm-Gg: AZFdTZd1/y4T8ysY+UbyYUAVskDX9mPkBu30cLKDa5uXR4in/wvQ7dD1rBLIl4eoQy3
	oe9unwBU0U8fGvSr7ClaPUb0vT7oenc6TvBE2+U/eFSU8Em7W/ksXAQo9+poQuv0dO3n2mWFkTP
	55axvbi/0BS0Vdg7mKXgShvcizBlRpGrXWHqJ0jzN9kZOlTLBUBm1xDrxHlEDnPbt0fVHOixoCA
	FM6IdKAdYLtnFtAK3pDomKl+YTcjCChQvMf4DxqA6ZmwhKBmwTkp0bCQknFw5hkcmnmqX4LYmwA
	lzVf5hk2fhl0CPZWTXbPltcXePLeotu9eRD6Sq9qbcjGou7Suq9xqy1IXm6drz+IqAgmkKxWX4E
	B3dfhjxiHreQLMHcLdXNVCJitNfR3PdVhnhnBLJJJwUvMB+h12+0zt/Ahs2wbIa2E7imLQdEPXr
	zVULN7MhiZ173SqqUEXvr++qY8N/s0o/Q2DhWoFc5AJDTDuBZJkzQfMobxBycxEI5UwPuJNm4Qj
	EVKQB91TBgqyacq4VbtaHfXYLrePJ20OcNKri5+FTORT97rlNBsXscKfuCXk7sBtVVsZ2dxdcmd
	vg4s+27BAYPy1ArmKkIrgpRr8cUlWCywgpYYphNwqkrcCL2T1K5avtTpGydoRae+O6Fz6RAn9n7
	Y4WInv71wwluTk2RDgG4Ooe38wU4U
X-Received: by 2002:a05:7300:3e86:b0:36e:3ebb:7ef3 with SMTP id 5a478bee46e88-38282bb5c41mr4863247eec.39.1795090226193;
        Thu, 19 Nov 2026 04:10:26 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm17604650eec.26.2026.11.19.04.10.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 04:10:25 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	himanshu.chauhan@oss.qualcomm.com,
	conor@kernel.org,
	anup.patel@oss.qualcomm.com
Cc: clement.leger@linux.dev,
	cuiyunhui@bytedance.com,
	atish.patra@linux.dev,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	will@kernel.org,
	tglx@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	shuah@kernel.org,
	yuanzhu@bytedance.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangzhanpeng.jasper@bytedance.com
Subject: [PATCH v13 09/11] MAINTAINERS: add RISC-V SSE maintainers and file coverage
Date: Thu, 19 Nov 2026 20:08:33 +0800
Message-ID: <20261119120824.13969-22-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
References: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_041027_459747_E4879478 
X-CRM114-Status: UNSURE (   6.94  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TGlzdCBaaGFucGVuZyBaaGFuZywgSGltYW5zaHUgQ2hhdWhhbiBhbmQgQ2zDqW1lbnQgTMOpZ2Vy
IGFzIGNvLW1haW50YWluZXJzCmZvciBSSVNDLVYgU3VwZXJ2aXNvciBTb2Z0d2FyZSBFdmVudHMs
IHdpdGggWXVuaHVpIEN1aSBhcyByZXZpZXdlci4KQ292ZXIgdGhlIGFyY2hpdGVjdHVyZSBlbnRy
eSwgZmlybXdhcmUgZHJpdmVyLCBQTVUgZG9jdW1lbnRhdGlvbiBhbmQKc2VsZnRlc3RzIGluIGEg
c2VwYXJhdGUgcGF0Y2gsIGFzIHJlcXVlc3RlZCBieSBIaW1hbnNodS4gQWxzbyBhZGQKY292ZXJh
Z2UgZm9yIFJJU0MtViBmaXJtd2FyZSBkcml2ZXJzIGFuZCB0aGUgYXJjaGl0ZWN0dXJlIHNlbGZ0
ZXN0cy4KCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvYXM3OU1IdE5ZZC1WYlV1Z0Bo
dS1oaW1jaGF1LWJsci5xdWFsY29tbS5jb20vClNpZ25lZC1vZmYtYnk6IFpoYW5wZW5nIFpoYW5n
IDx6aGFuZ3poYW5wZW5nLmphc3BlckBieXRlZGFuY2UuY29tPgotLS0KIE1BSU5UQUlORVJTIHwg
MjMgKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCA5M2FiYmIz
MTUwNjUuLmMyZDI4Mzg5NWVmNCAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRB
SU5FUlMKQEAgLTI0MDYwLDYgKzI0MDYwLDcgQEAgQzoJaXJjOi8vaXJjLmxpYmVyYS5jaGF0L3Jp
c2N2CiBQOglEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvcGF0Y2gtYWNjZXB0YW5jZS5yc3QKIFQ6
CWdpdCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3Yv
bGludXguZ2l0CiBGOglhcmNoL3Jpc2N2LworRjoJdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlz
Y3YvCiBOOglyaXNjdgogSzoJcmlzY3YKIApAQCAtMjQwNzIsNiArMjQwNzMsMTMgQEAgVDoJZ2l0
IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9pb21tdS9saW51
eC5naXQKIEY6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pb21tdS9yaXNjdixp
b21tdS55YW1sCiBGOglkcml2ZXJzL2lvbW11L3Jpc2N2LwogCitSSVNDLVYgRklSTVdBUkUgRFJJ
VkVSUworTToJQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPgorTDoJbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZworUzoJTWFpbnRhaW5lZAorVDoJZ2l0IGdpdDovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jb25vci9saW51eC5naXQKK0Y6CWRyaXZl
cnMvZmlybXdhcmUvcmlzY3YvCisKIFJJU0MtViBNSUNST0NISVAgU1VQUE9SVAogTToJQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KIFI6CVZhbGVudGluYSBGZXJuYW5k
ZXogPHZhbGVudGluYS5mZXJuYW5kZXphbGFuaXNAbWljcm9jaGlwLmNvbT4KQEAgLTI0MTI4LDYg
KzI0MTM2LDcgQEAgTToJQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQGxpbnV4LmRldj4KIFI6CUFu
dXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CiBMOglsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCiBTOglTdXBwb3J0ZWQKK0Y6CURvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9wbXUt
c3NlLnJzdAogRjoJZHJpdmVycy9wZXJmL3Jpc2N2X3BtdS5jCiBGOglkcml2ZXJzL3BlcmYvcmlz
Y3ZfcG11X2xlZ2FjeS5jCiBGOglkcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCkBAIC0yNDE3
Niw2ICsyNDE4NSwyMCBAQCBGOglhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0LwogTjoJc3Bh
Y2VtaXQKIEs6CXNwYWNlbWl0CiAKK1JJU0MtViBTVVBFUlZJU09SIFNPRlRXQVJFIEVWRU5UUwor
TToJWmhhbnBlbmcgWmhhbmcgPHpoYW5nemhhbnBlbmcuamFzcGVyQGJ5dGVkYW5jZS5jb20+CitN
OglIaW1hbnNodSBDaGF1aGFuIDxoaW1hbnNodS5jaGF1aGFuQG9zcy5xdWFsY29tbS5jb20+CitN
OglDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAbGludXguZGV2PgorUjoJWXVuaHVpIEN1
aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+CitMOglsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCitTOglNYWludGFpbmVkCitGOglhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NzZS5oCitG
OglhcmNoL3Jpc2N2L2tlcm5lbC9zYmlfc3NlLmMKK0Y6CWFyY2gvcmlzY3Yva2VybmVsL3NiaV9z
c2VfZW50cnkuUworRjoJZHJpdmVycy9maXJtd2FyZS9yaXNjdi9yaXNjdl9zYmlfc3NlLmMKK0Y6
CWluY2x1ZGUvbGludXgvcmlzY3Zfc2JpX3NzZS5oCitGOgl0b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9yaXNjdi9zc2UvCisKIFJJU0MtViBURU5TVE9SUkVOVCBTb0MgU1VQUE9SVAogTToJRHJldyBG
dXN0aW5pIDxmdXN0aW5pQGtlcm5lbC5vcmc+CiBNOglKb2VsIFN0YW5sZXkgPGptc0Bvc3MudGVu
c3RvcnJlbnQuY29tPgotLSAKMi41MC4xIChBcHBsZSBHaXQtMTU1KQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
