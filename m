Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F434D358C0
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 06:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:Mime-Version:Message-Id:To:Cc:
	References:In-Reply-To:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iSLyZZg1Lzr0pe31jKUyFu+KAG9nTrxL2w+IHJH6mic=; b=zbZjvH56UnwEO0
	oIRNRZMiQeRLTIKNm/kP2RvcawMzSM4V6fimhQesOVxUZVcIlIYaNEWLsBhvzRcbZapGTagAtCJQE
	VKs7TYtacEU++1H7FjUeT4cJs7B9yvlTlK46VAu8K6QyMGIuq9+Y+KDLFOOrKpj4BDRL897JMy6Kk
	TwWTQkcgxXGwZcvecbLeizs6kvkE0V6DeP2xf32K4m4icGX+1MDA9GJG8+4cPM2lk39Nk2y83h8dd
	1L60vHO4Nszu0HW80pAFm+OG++3B6eZ3aXmV+qOlZO/T1BnW+T1+pl8pDw4/CVRy5Ey+9PKTpBt+h
	lytz1vGc3WQVODc6CugQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlLDG-0000000HIuf-1rI7;
	Thu, 29 Jan 2026 06:09:06 +0000
Received: from sg-1-17.ptr.blmpb.com ([118.26.132.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlLDD-0000000HItP-0JNa
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 06:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303021642; d=spacemit.com; t=1769666929; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=wGrkibqGgDssdrAPp/kuHEVXUqfVuFoJNWDdvbM/PuE=;
 b=bMhiZAIoP0G1d5uF+0q+5ojjRreB+LAIOfGkaXaEkNVgqvgo7AuJoOEtwevd56guy2sPI3
 9D2AKVHXEP8Kp8Do0ZBQuzn/ORZJbqD2qKeAQvyfr8s2n+0HyzbH0WVQvlXDbOV3hdKG4o
 INb5dwCxA2DX0XSkJ7KojbCSPFxLgeQRnqrbn80aD11FbuOoStIwFz/oNRuEgr2NAEvOzD
 icJu7sQV7gMN3dMclQyj/iOmjFF+NuSlLgkO/uner6O3k8Ez7Ir/2CONIpJoHcmvGG1MSr
 5coHes8TjoGRjZtzQG0f3QC834igGURKm9eYWp0it0OB2GxjSEVWhQzGlf/C1w==
Subject: [PATCH v1.1 1/7] iommu/riscv: Enable IOMMU DMA mapping support
Date: Thu, 29 Jan 2026 14:08:42 +0800
In-Reply-To: <cover.1769666438.git.lv.zheng@spacemit.com>
References: <cover.1769562575.git.lv.zheng@spacemit.com> <cover.1769666438.git.lv.zheng@spacemit.com>
Cc: "Jingyu Li" <joey.li@spacemit.com>, "Lv Zheng" <lv.zheng@spacemit.com>, 
	"Zhijian Chen" <zhijian@spacemit.com>, <iommu@lists.linux.dev>, 
	<linux-perf-users@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <devicetree@vger.kernel.org>
To: "Tomasz Jeznach" <tjeznach@rivosinc.com>, 
	"Joerg Roedel" <joro@8bytes.org>, "Will Deacon" <will@kernel.org>, 
	"Robin Murphy" <robin.murphy@arm.com>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
Message-Id: <e90a063f03c08eed61cd1dbeb90e650799d1880c.1769666438.git.lv.zheng@spacemit.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0
From: "Lv Zheng" <lv.zheng@spacemit.com>
X-Lms-Return-Path: <lba+2697af96e+d2a5f6+lists.infradead.org+lv.zheng@spacemit.com>
X-Original-From: Lv Zheng <lv.zheng@spacemit.com>
Received: from SurfaceBook2-B.localdomain ([122.224.183.70]) by smtp.feishu.cn with ESMTPS; Thu, 29 Jan 2026 14:08:45 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_220903_478419_83A6C72E 
X-CRM114-Status: UNSURE (   9.23  )
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

RnJvbTogSmluZ3l1IExpIDxqb2V5LmxpQHNwYWNlbWl0LmNvbT4NCg0KRW5hYmxlcyBJT01NVSBE
TUEgbWFwcGluZyBzdXBwb3J0IGZvciBSSVNDLVYsIHNvIHRoYXQgRE1BQ3MgY2FuIGJlIHRlc3Rl
ZA0Kd2l0aCB0cmFuc2xhdGlvbiBlbmFibGVkLg0KDQpLbm93biBJc3N1ZToNCjEuIFdoZW4gQ09O
RklHX0lPTU1VX0RNQSBpcyBlbmFibGVkLCBjdXJyZW50IExpbnV4IFJJU0MtViBJT01NVSBpcyBs
YWNrDQogICBvZiBQQ0llIHN1cHBvcnQsIGNhdXNpbmcgcmlzY3ZfaW9tbXVfZmF1bHQ6NTIyIGlu
IGRlYWxpbmcgd2l0aCBOVk1lDQogICBQQ0llIGRldmljZXMuDQoNClNpZ25lZC1vZmYtYnk6IEpp
bmd5dSBMaSA8am9leS5saUBzcGFjZW1pdC5jb20+DQpTaWduZWQtb2ZmLWJ5OiBMdiBaaGVuZyA8
bHYuemhlbmdAc3BhY2VtaXQuY29tPg0KLS0tDQogZHJpdmVycy9pb21tdS9LY29uZmlnIHwgMiAr
LQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9pb21tdS9LY29uZmlnIGIvZHJpdmVycy9pb21tdS9LY29uZmlnDQpp
bmRleCBmODYyNjJiMTE0MTYuLjM0ZDhhNzkyMzM5ZiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvaW9t
bXUvS2NvbmZpZw0KKysrIGIvZHJpdmVycy9pb21tdS9LY29uZmlnDQpAQCAtMTUxLDcgKzE1MSw3
IEBAIGNvbmZpZyBPRl9JT01NVQ0KIA0KICMgSU9NTVUtYWdub3N0aWMgRE1BLW1hcHBpbmcgbGF5
ZXINCiBjb25maWcgSU9NTVVfRE1BDQotCWRlZl9ib29sIEFSTTY0IHx8IFg4NiB8fCBTMzkwDQor
CWRlZl9ib29sIEFSTTY0IHx8IFg4NiB8fCBTMzkwIHx8IFJJU0NWDQogCXNlbGVjdCBETUFfT1BT
X0hFTFBFUlMNCiAJc2VsZWN0IElPTU1VX0FQSQ0KIAlzZWxlY3QgSU9NTVVfSU9WQQ0KLS0gDQoy
LjQzLjANCgpUaGlzIG1lc3NhZ2UgYW5kIGFueSBhdHRhY2htZW50IGFyZSBjb25maWRlbnRpYWwg
YW5kIG1heSBiZSBwcml2aWxlZ2VkIG9yIG90aGVyd2lzZSBwcm90ZWN0ZWQgZnJvbSBkaXNjbG9z
dXJlLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBtZXNzYWdl
LCBwbGVhc2UgZGVsZXRlIGl0IGFuZCBhbnkgYXR0YWNobWVudCBmcm9tIHlvdXIgc3lzdGVtIGFu
ZCBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBieSByZXBseSBlLW1haWwuIFVuaW50ZW5k
ZWQgcmVjaXBpZW50cyBzaG91bGQgbm90IHVzZSwgY29weSwgZGlzY2xvc2Ugb3IgdGFrZSBhbnkg
YWN0aW9uIGJhc2VkIG9uIHRoaXMgbWVzc2FnZSBvciBhbnkgaW5mb3JtYXRpb24gY29udGFpbmVk
IGluIHRoaXMgbWVzc2FnZS4gRW1haWxzIGNhbm5vdCBiZSBndWFyYW50ZWVkIHRvIGJlIHNlY3Vy
ZSBvciBlcnJvciBmcmVlIGFzIHRoZXkgY2FuIGJlIGludGVyY2VwdGVkLCBhbWVuZGVkLCBsb3N0
IG9yIGRlc3Ryb3llZCwgYW5kIHlvdSBzaG91bGQgdGFrZSBmdWxsIHJlc3BvbnNpYmlsaXR5IGZv
ciBzZWN1cml0eSBjaGVja2luZy4gCiAK5pys6YKu5Lu25Y+K5YW25Lu75L2V6ZmE5Lu25YW35pyJ
5L+d5a+G5oCn6LSo77yM5bm25Y+v6IO95Y+X5YW25LuW5L+d5oqk5oiW5LiN5YWB6K646KKr5oqr
6Zyy57uZ56ys5LiJ5pa544CC5aaC6ZiB5LiL6K+v5pS25Yiw5pys6YKu5Lu277yM5pWs6K+356uL
5Y2z5Lul5Zue5aSN55S15a2Q6YKu5Lu255qE5pa55byP6YCa55+l5Y+R5Lu25Lq677yM5bm25bCG
5pys6YKu5Lu25Y+K5YW25Lu75L2V6ZmE5Lu25LuO6ZiB5LiL57O757uf5Lit5LqI5Lul5Yig6Zmk
44CC5aaC6ZiB5LiL5bm26Z2e5pys6YKu5Lu25YaZ5piO5LmL5pS25Lu25Lq677yM5pWs6K+35YiH
5Yu/5L2/55So44CB5aSN5Yi244CB5oqr6Zyy5pys6YKu5Lu25oiW5YW25Lu75L2V5YaF5a6577yM
5Lqm6K+35YiH5Yu/5L6d5pys6YKu5Lu25oiW5YW25Lu75L2V5YaF5a656ICM6YeH5Y+W5Lu75L2V
6KGM5Yqo44CC55S15a2Q6YKu5Lu25peg5rOV5L+d6K+B5piv5LiA56eN5a6J5YWo5ZKM5LiN5Lya
5Ye6546w5Lu75L2V5beu6ZSZ55qE6YCa5L+h5pa55byP77yM5Y+v6IO95Lya6KKr5oum5oiq44CB
5L+u5pS544CB5Lii5aSx5oiW5o2f5Z2P77yM5pS25Lu25Lq66ZyA6Ieq6KGM6LSf6LSj5YGa5aW9
5a6J5YWo5qOA5p+l44CCCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
