Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBF1D358C0
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 06:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Message-Id:From:Cc:Mime-Version
	:Subject:In-Reply-To:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jEaLPFtgQo7x3xDGNM74oDikm2h2mtlSeekDClmbdV8=; b=wt3NyLlIryNcyk
	w2x8Y+Y54u/JSFbQerNX3AyNH6i2w/lw6KeC1ZasoIzV8wgksMXQmtl2RWtWUTLTc+McVMVW7hmbu
	XQ3g3eZSr2w0tXyOJsMa/2+BjHSLfHdzsEEZKZLPhnkyTcUEpNYz0Zlzp7p1kIc+RC5yRcR8M/zsw
	h8HT8rqbiKieKBFThTUtvYDU9ZD/WEu6PAlYYjUmN3zabN+UFRZw7zism7mRThiUAD6K2KIg6RyEL
	0kw3KRNa5fqRkQLLPeu7w6DhUnj4HhtqP/0OL6KqCpeeGmH9Sq07XfuCKz0bjV16udoZDrt/0Ekqr
	RzvrPwA+yRve6nfjZCXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlLD9-0000000HItL-0cCU;
	Thu, 29 Jan 2026 06:08:59 +0000
Received: from sg-1-39.ptr.blmpb.com ([118.26.132.39])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlLD3-0000000HIsy-0tnh
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 06:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303021642; d=spacemit.com; t=1769666921; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=rNrYIcOjBoHLzLWKgyHR6MiVadOMXKsbO2l4LxyJKmg=;
 b=tLMlyX6mHPD63lKQSRFoK4VFzi/dGbmb2be7IIzqYQSkGSDYf3s/3CudCJ8OSw6ELHfa5N
 V2jPzIyXAZrucfri4cDVopN3O74GF9IxisSD8N48jcBzoNJJdtQ8AH790aXveCUce5f4Id
 Ln84xsbpI+lgAoZBeisuCeHcWrUewkGqaC8Xu3kGdAWEnhDhZEw+lPJwyHLFjI5P+5c5oP
 z7A3wt//Yjr5sM1PCaGfy2wPBONo70Dwzj4fgqaS8P0YwXnBhn8Qv6mZ3E5Bw6CE0y1NhJ
 57T9kj2oJiaW8n9T/jlpuPwezHUi1JI1sDWxwjOsLxMlQ29wsWNkbGTz0iUcAA==
References: <cover.1769562575.git.lv.zheng@spacemit.com>
Received: from SurfaceBook2-B.localdomain ([122.224.183.70]) by smtp.feishu.cn with ESMTPS; Thu, 29 Jan 2026 14:08:37 +0800
In-Reply-To: <cover.1769562575.git.lv.zheng@spacemit.com>
Subject: [PATCH v1.1 0/7] iommu/riscv: Add HPM support for RISC-V IOMMU
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0
Cc: "Jingyu Li" <joey.li@spacemit.com>, "Lv Zheng" <lv.zheng@spacemit.com>, 
	"Zhijian Chen" <zhijian@spacemit.com>, <iommu@lists.linux.dev>, 
	<linux-perf-users@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <devicetree@vger.kernel.org>
From: "Lv Zheng" <lv.zheng@spacemit.com>
X-Original-From: Lv Zheng <lv.zheng@spacemit.com>
Message-Id: <cover.1769666438.git.lv.zheng@spacemit.com>
To: "Tomasz Jeznach" <tjeznach@rivosinc.com>, 
	"Joerg Roedel" <joro@8bytes.org>, "Will Deacon" <will@kernel.org>, 
	"Robin Murphy" <robin.murphy@arm.com>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
Date: Thu, 29 Jan 2026 14:08:17 +0800
X-Lms-Return-Path: <lba+2697af967+183e5d+lists.infradead.org+lv.zheng@spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_220854_734971_ED4E4BF1 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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

SW5jbHVkZXMgSFBNIHN1cHBvcnQgZm9yIFJJU0MtViBJT01NVS4gVGhlIEhQTSBoYXJkd2FyZSBt
ZWNobmlzbSBjYW4gYmUKZm91bmQgaW4gdGhlIHJlY2VudCBhbm5vdW5jZWQgU3BhY2VtaVQgU29D
cyAoSzMsIFYxMDApLCB3aGVyZSBUMTAwCihTcGFjZW1pVCBkaXN0cmlidXRlZCBJT01NVSkgaXMg
c2hpcHBlZC4gCgpUaGUgdGVzdGVkIHJlc3VsdCBjYW4gYmUgZm91bmQgYXMgZm9sbG93czoKCiBy
b290QHNkZmlybTp+IyBwZXJmIHN0YXQgLS10aW1lb3V0IDUwMDAgLWEgLWUgcmlzY3ZfaW9tbXVf
aHBtXzAvZGV2aWNlX2Rpcl93YWxrcyxjb25maWcxPTB4MjBjMDAxMDAwMDAwMDAwMC8gZG1hdGVz
dDsgc2xlZXAgMQogWyAgMTc2LjExMDIxMV0gZG1hdGVzdDogU3RhcnRlZCAxIHRocmVhZHMgdXNp
bmcgZG1hMGNoYW4wCiBbICAxNzYuMTE0OTMzXSBkbWF0ZXN0OiBkbWEwY2hhbjAtY29weTA6IHN1
bW1hcnkgMSB0ZXN0cywgMCBmYWlsdXJlcyAzOTQuOTQgaW9wcyAzOTQgS0IvcyAoMCkKIAogIFBl
cmZvcm1hbmNlIGNvdW50ZXIgc3RhdHMgZm9yICdzeXN0ZW0gd2lkZSc6CiAKICAgICAgICAgICAg
ICAgICAgMyAgICAgIHJpc2N2X2lvbW11X2hwbV8wL2RldmljZV9kaXJfd2Fsa3MsY29uZmlnMT0w
eDIwYzAwMTAwMDAwMDAwMDAvICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKIAog
ICAgICAgIDAuMDgxMDU2MDAwIHNlY29uZHMgdGltZSBlbGFwc2VkCiAKIHJvb3RAc2RmaXJtOn4j
IHBlcmYgc3RhdCAtLXRpbWVvdXQgNTAwMCAtYSAtZSByaXNjdl9pb21tdV9ocG1fMC9zX3N0YWdl
X3dhbGtzLGNvbmZpZzE9MHgyMGMwMDEwMDAwMDAwMDAwLyBkbWF0ZXN0OyBzbGVlcCAxCiBbICAg
NjguMTUyOTkyXSBkbWF0ZXN0OiBTdGFydGVkIDEgdGhyZWFkcyB1c2luZyBkbWEwY2hhbjAKIFsg
ICA2OC4xNTgwNzFdIGRtYXRlc3Q6IGRtYTBjaGFuMC1jb3B5MDogc3VtbWFyeSAxIHRlc3RzLCAw
IGZhaWx1cmVzIDQwMS45MiBpb3BzIDQwMSBLQi9zICgwKQogCiAgUGVyZm9ybWFuY2UgY291bnRl
ciBzdGF0cyBmb3IgJ3N5c3RlbSB3aWRlJzoKIAogICAgICAgICAgICAgICAgICA2ICAgICAgcmlz
Y3ZfaW9tbXVfaHBtXzAvc19zdGFnZV93YWxrcyxjb25maWcxPTB4MjBjMDAxMDAwMDAwMDAwMC8g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogCiAgICAgICAgMC4wODMxOTIwMDAg
c2Vjb25kcyB0aW1lIGVsYXBzZWQKCkppbmd5dSBMaSAoMyk6CiAgaW9tbXUvcmlzY3Y6IEVuYWJs
ZSBJT01NVSBETUEgbWFwcGluZyBzdXBwb3J0CiAgaW9tbXUvcmlzY3Y6IEZpeCBXU0kgbW9kZSBJ
UlEgbnVtYmVyIGhhbmRsaW5nCiAgaW9tbXUvcmlzY3Y6IEFkZCBIUE0gc3VwcG9ydCBmb3IgcGVy
Zm9ybWFuY2UgbW9uaXRvcmluZwoKTHYgWmhlbmcgKDQpOgogIGR0LWJpbmRpbmdzOiBpb21tdTog
QWRkIHNwYWNlbWl0L3QxMDAgZmVhdHVyZXMKICBzcGFjZW1pdC90MTAwOiBBZGQgdmVuZG9yIGV2
ZW50IHN1cHBvcnQgZm9yIFJJU0MtViBJT01NVSBIUE0KICBzcGFjZW1pdC90MTAwOiBBZGQgZ2xv
YmFsIGZpbHRlciBzdXBwb3J0IGZvciBSSVNDLVYgSU9NTVUgSFBNCiAgc3BhY2VtaXQvdDEwMDog
QWRkIFNwYWNlbWlUIFQxMDAgSU9BVEMgSFBNIHN1cHBvcnQKCiAuLi4vYmluZGluZ3MvaW9tbXUv
cmlzY3YsaW9tbXUueWFtbCAgICAgICAgICAgfCAgIDYwICstCiBkcml2ZXJzL2lvbW11L0tjb25m
aWcgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAyICstCiBkcml2ZXJzL2lvbW11L3Jpc2N2
L0tjb25maWcgICAgICAgICAgICAgICAgICAgfCAgICA5ICsKIGRyaXZlcnMvaW9tbXUvcmlzY3Yv
TWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAgIDEgKwogZHJpdmVycy9pb21tdS9yaXNjdi9p
b21tdS1iaXRzLmggICAgICAgICAgICAgIHwgICAyMCArLQogZHJpdmVycy9pb21tdS9yaXNjdi9p
b21tdS1ocG0uYyAgICAgICAgICAgICAgIHwgMTEzNSArKysrKysrKysrKysrKysrKwogZHJpdmVy
cy9pb21tdS9yaXNjdi9pb21tdS1wY2kuYyAgICAgICAgICAgICAgIHwgICAxMyArLQogZHJpdmVy
cy9pb21tdS9yaXNjdi9pb21tdS1wbGF0Zm9ybS5jICAgICAgICAgIHwgICAxMiArLQogZHJpdmVy
cy9pb21tdS9yaXNjdi9pb21tdS5jICAgICAgICAgICAgICAgICAgIHwgICAyNSArLQogZHJpdmVy
cy9pb21tdS9yaXNjdi9pb21tdS5oICAgICAgICAgICAgICAgICAgIHwgICA0NSArLQogMTAgZmls
ZXMgY2hhbmdlZCwgMTMwOCBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LWhwbS5jCgotLSAKMi40My4wCgpU
aGlzIG1lc3NhZ2UgYW5kIGFueSBhdHRhY2htZW50IGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBi
ZSBwcml2aWxlZ2VkIG9yIG90aGVyd2lzZSBwcm90ZWN0ZWQgZnJvbSBkaXNjbG9zdXJlLiBJZiB5
b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBtZXNzYWdlLCBwbGVhc2Ug
ZGVsZXRlIGl0IGFuZCBhbnkgYXR0YWNobWVudCBmcm9tIHlvdXIgc3lzdGVtIGFuZCBub3RpZnkg
dGhlIHNlbmRlciBpbW1lZGlhdGVseSBieSByZXBseSBlLW1haWwuIFVuaW50ZW5kZWQgcmVjaXBp
ZW50cyBzaG91bGQgbm90IHVzZSwgY29weSwgZGlzY2xvc2Ugb3IgdGFrZSBhbnkgYWN0aW9uIGJh
c2VkIG9uIHRoaXMgbWVzc2FnZSBvciBhbnkgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMg
bWVzc2FnZS4gRW1haWxzIGNhbm5vdCBiZSBndWFyYW50ZWVkIHRvIGJlIHNlY3VyZSBvciBlcnJv
ciBmcmVlIGFzIHRoZXkgY2FuIGJlIGludGVyY2VwdGVkLCBhbWVuZGVkLCBsb3N0IG9yIGRlc3Ry
b3llZCwgYW5kIHlvdSBzaG91bGQgdGFrZSBmdWxsIHJlc3BvbnNpYmlsaXR5IGZvciBzZWN1cml0
eSBjaGVja2luZy4gCiAK5pys6YKu5Lu25Y+K5YW25Lu75L2V6ZmE5Lu25YW35pyJ5L+d5a+G5oCn
6LSo77yM5bm25Y+v6IO95Y+X5YW25LuW5L+d5oqk5oiW5LiN5YWB6K646KKr5oqr6Zyy57uZ56ys
5LiJ5pa544CC5aaC6ZiB5LiL6K+v5pS25Yiw5pys6YKu5Lu277yM5pWs6K+356uL5Y2z5Lul5Zue
5aSN55S15a2Q6YKu5Lu255qE5pa55byP6YCa55+l5Y+R5Lu25Lq677yM5bm25bCG5pys6YKu5Lu2
5Y+K5YW25Lu75L2V6ZmE5Lu25LuO6ZiB5LiL57O757uf5Lit5LqI5Lul5Yig6Zmk44CC5aaC6ZiB
5LiL5bm26Z2e5pys6YKu5Lu25YaZ5piO5LmL5pS25Lu25Lq677yM5pWs6K+35YiH5Yu/5L2/55So
44CB5aSN5Yi244CB5oqr6Zyy5pys6YKu5Lu25oiW5YW25Lu75L2V5YaF5a6577yM5Lqm6K+35YiH
5Yu/5L6d5pys6YKu5Lu25oiW5YW25Lu75L2V5YaF5a656ICM6YeH5Y+W5Lu75L2V6KGM5Yqo44CC
55S15a2Q6YKu5Lu25peg5rOV5L+d6K+B5piv5LiA56eN5a6J5YWo5ZKM5LiN5Lya5Ye6546w5Lu7
5L2V5beu6ZSZ55qE6YCa5L+h5pa55byP77yM5Y+v6IO95Lya6KKr5oum5oiq44CB5L+u5pS544CB
5Lii5aSx5oiW5o2f5Z2P77yM5pS25Lu25Lq66ZyA6Ieq6KGM6LSf6LSj5YGa5aW95a6J5YWo5qOA
5p+l44CCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
