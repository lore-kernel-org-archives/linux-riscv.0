Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481A1D358C1
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 06:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Subject:Message-Id:Date:Cc:
	In-Reply-To:Mime-Version:From:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vt7uTILeUE5sOHs3lZWnJl4DnsxfM3l+WvWWny+6Rp4=; b=43nuciI1/ZMPHI
	0lPCkKL9T9khG5ERUNXfs2Uzz+NQrh1sy0mhwjVQsBGX73Z2dwjZlsfCLTRUvZLfuegq4rTb8uOVL
	csgJXrNp8Op3ec+G8DFAymIupZ9QB6P8WXVUBlyeN7/saf0l9z9oeBxFVEylzCTTKaVQivQh58eIz
	6nbZs0uC48Ibh+BSRtTW72EAYjEFr1OH0MPMA95pp3LwWDOF0yaXlzRjELfAAACoLl4r/RnnrMhJ1
	hKtJqX5+6g+hqoiaaTpforq72wt83jHsuIOMVe/odi/OH3wCkRwJX4VmefdJz6mbNphZqESckjmmQ
	X2e59s1uEmKRhEfbGTrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlLDL-0000000HIvD-38SR;
	Thu, 29 Jan 2026 06:09:11 +0000
Received: from sg-1-11.ptr.blmpb.com ([118.26.132.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlLDD-0000000HItR-3PAc
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 06:09:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303021642; d=spacemit.com; t=1769666936; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=XKUcVjUQOQj6bDJdeOyr1SbwF7z1fYRZISkh0wI0lj0=;
 b=fGnu3Yw5i1UCIPWinY2YYj85lo3hYPFTbfE/xY0ss1RuMVVs1h0RPe0ZQ3rz+5yfxOfsMw
 wNyiodqVwhlnD22b1q0VdpVyjZ4QzZyofzzBDmldNvMlQKXuV140loRVbA+kZSMbtJGN/H
 YphWfumevBM6F2Ow2AdNdjCxl/C0VlCKztMbXYrDmwLocvzxQDpv6hEHCzFMcci2bZoG1V
 egO5lzyNEDC6NgzQSgs8blsJh2h3Z2eO5yYFC41RwB9fmJcjfQtLy3oDzJ3Zq8UP/vJBU3
 CK2kL7O7kphJQ6EEZhUyAeBxjaoFYgFZOsdMdYgNkEFoMXe4shqkQHMOD19dpg==
To: "Tomasz Jeznach" <tjeznach@rivosinc.com>, 
	"Joerg Roedel" <joro@8bytes.org>, "Will Deacon" <will@kernel.org>, 
	"Robin Murphy" <robin.murphy@arm.com>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
From: "Lv Zheng" <lv.zheng@spacemit.com>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+2697af976+a0335f+lists.infradead.org+lv.zheng@spacemit.com>
In-Reply-To: <cover.1769666438.git.lv.zheng@spacemit.com>
Received: from SurfaceBook2-B.localdomain ([122.224.183.70]) by smtp.feishu.cn with ESMTPS; Thu, 29 Jan 2026 14:08:53 +0800
X-Mailer: git-send-email 2.43.0
Cc: "Jingyu Li" <joey.li@spacemit.com>, "Lv Zheng" <lv.zheng@spacemit.com>, 
	"Zhijian Chen" <zhijian@spacemit.com>, <iommu@lists.linux.dev>, 
	<linux-perf-users@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <devicetree@vger.kernel.org>
Date: Thu, 29 Jan 2026 14:08:50 +0800
Message-Id: <a618207b8347945218c33a7f0300a28949c28693.1769666438.git.lv.zheng@spacemit.com>
Subject: [PATCH v1.1 2/7] iommu/riscv: Fix WSI mode IRQ number handling
References: <cover.1769562575.git.lv.zheng@spacemit.com> <cover.1769666438.git.lv.zheng@spacemit.com>
X-Original-From: Lv Zheng <lv.zheng@spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_220904_221647_FB88073C 
X-CRM114-Status: GOOD (  11.45  )
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

RnJvbTogSmluZ3l1IExpIDxqb2V5LmxpQHNwYWNlbWl0LmNvbT4KCkluIFdTSSBtb2RlLCBJQ1ZF
QyBkb2Vzbid0IGV4aXN0LCB0aHVzIHJlYWRpbmcgaXQgcmV0dXJucyAwLCB3aGljaApjYXVzZXMg
SU9NTVUgZHJpdmVyIHRvIGZhaWwgdG8gZmluZCBJUlEgbnVtYmVycyBmcm9tIGRldmljZSB0cmVl
CklSUSBhcnJhcnkuIFRoZSBpc3N1ZSBpcyBmaXhlZCBieSBhcHBseWluZyBpY3ZlYyBpbmRleGVz
IG9mIFdTSSBJUlFzLgoKU2lnbmVkLW9mZi1ieTogSmluZ3l1IExpIDxqb2V5LmxpQHNwYWNlbWl0
LmNvbT4KU2lnbmVkLW9mZi1ieTogTHYgWmhlbmcgPGx2LnpoZW5nQHNwYWNlbWl0LmNvbT4KLS0t
CiBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMgfCAyNSArKysrKysrKysrKysrKysrKysrKy0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMgYi9kcml2ZXJzL2lvbW11L3Jp
c2N2L2lvbW11LmMKaW5kZXggZDk0MjkwOTdhMmI1Li4yNjYzMDk3OTQ3M2IgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYworKysgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lv
bW11LmMKQEAgLTE1OTMsMTEgKzE1OTMsMjYgQEAgc3RhdGljIGludCByaXNjdl9pb21tdV9pbml0
X2NoZWNrKHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11KQogCQkgICAgICAgRklFTERf
UFJFUChSSVNDVl9JT01NVV9JQ1ZFQ19QTUlWLCAzICUgaW9tbXUtPmlycXNfY291bnQpOwogCXJp
c2N2X2lvbW11X3dyaXRlcShpb21tdSwgUklTQ1ZfSU9NTVVfUkVHX0lDVkVDLCBpb21tdS0+aWN2
ZWMpOwogCWlvbW11LT5pY3ZlYyA9IHJpc2N2X2lvbW11X3JlYWRxKGlvbW11LCBSSVNDVl9JT01N
VV9SRUdfSUNWRUMpOwotCWlmIChtYXgobWF4KEZJRUxEX0dFVChSSVNDVl9JT01NVV9JQ1ZFQ19D
SVYsIGlvbW11LT5pY3ZlYyksCi0JCSAgICBGSUVMRF9HRVQoUklTQ1ZfSU9NTVVfSUNWRUNfRklW
LCBpb21tdS0+aWN2ZWMpKSwKLQkJbWF4KEZJRUxEX0dFVChSSVNDVl9JT01NVV9JQ1ZFQ19QSVYs
IGlvbW11LT5pY3ZlYyksCi0JCSAgICBGSUVMRF9HRVQoUklTQ1ZfSU9NTVVfSUNWRUNfUE1JViwg
aW9tbXUtPmljdmVjKSkpID49IGlvbW11LT5pcnFzX2NvdW50KQotCQlyZXR1cm4gLUVJTlZBTDsK
KwkvKgorCSAqIEluIFdTSSBtb2RlLCBJQ1ZFQyBtYXkgcmVhZCBhcyB6ZXJvLiBPbmx5IHZhbGlk
YXRlIGlmIHVzaW5nIE1TSS4KKwkgKiBDaGVjayBpZiBGQ1RMLldTSSBpcyBzZXQgdG8gZGV0ZXJt
aW5lIGludGVycnVwdCBtb2RlLgorCSAqLworCWlmICghKGlvbW11LT5mY3RsICYgUklTQ1ZfSU9N
TVVfRkNUTF9XU0kpKSB7CisJCWlmIChtYXgobWF4KEZJRUxEX0dFVChSSVNDVl9JT01NVV9JQ1ZF
Q19DSVYsIGlvbW11LT5pY3ZlYyksCisJCQkgICAgRklFTERfR0VUKFJJU0NWX0lPTU1VX0lDVkVD
X0ZJViwgaW9tbXUtPmljdmVjKSksCisJCQltYXgoRklFTERfR0VUKFJJU0NWX0lPTU1VX0lDVkVD
X1BJViwgaW9tbXUtPmljdmVjKSwKKwkJCSAgICBGSUVMRF9HRVQoUklTQ1ZfSU9NTVVfSUNWRUNf
UE1JViwgaW9tbXUtPmljdmVjKSkpID49IGlvbW11LT5pcnFzX2NvdW50KQorCQkJcmV0dXJuIC1F
SU5WQUw7CisJfSBlbHNlIHsKKwkJLyoKKwkJICogV1NJIG1vZGU6IElDVkVDIGlzIG5vdCB1c2Vk
LiBTZXQgdG8gaWRlbnRpdHkgbWFwcGluZyBmb3IKKwkJICogcmlzY3ZfaW9tbXVfcXVldWVfdmVj
KCkgdG8gd29yayBjb3JyZWN0bHkuCisJCSAqLworCQlpb21tdS0+aWN2ZWMgPSBGSUVMRF9QUkVQ
KFJJU0NWX0lPTU1VX0lDVkVDX0NJViwgMCkgfAorCQkJICAgICAgIEZJRUxEX1BSRVAoUklTQ1Zf
SU9NTVVfSUNWRUNfRklWLCAxKSB8CisJCQkgICAgICAgRklFTERfUFJFUChSSVNDVl9JT01NVV9J
Q1ZFQ19QSVYsIDIpIHwKKwkJCSAgICAgICBGSUVMRF9QUkVQKFJJU0NWX0lPTU1VX0lDVkVDX1BN
SVYsIDMpOworCX0KIAogCXJldHVybiAwOwogfQotLSAKMi40My4wCgpUaGlzIG1lc3NhZ2UgYW5k
IGFueSBhdHRhY2htZW50IGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBiZSBwcml2aWxlZ2VkIG9y
IG90aGVyd2lzZSBwcm90ZWN0ZWQgZnJvbSBkaXNjbG9zdXJlLiBJZiB5b3UgYXJlIG5vdCBhbiBp
bnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBtZXNzYWdlLCBwbGVhc2UgZGVsZXRlIGl0IGFuZCBh
bnkgYXR0YWNobWVudCBmcm9tIHlvdXIgc3lzdGVtIGFuZCBub3RpZnkgdGhlIHNlbmRlciBpbW1l
ZGlhdGVseSBieSByZXBseSBlLW1haWwuIFVuaW50ZW5kZWQgcmVjaXBpZW50cyBzaG91bGQgbm90
IHVzZSwgY29weSwgZGlzY2xvc2Ugb3IgdGFrZSBhbnkgYWN0aW9uIGJhc2VkIG9uIHRoaXMgbWVz
c2FnZSBvciBhbnkgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgbWVzc2FnZS4gRW1haWxz
IGNhbm5vdCBiZSBndWFyYW50ZWVkIHRvIGJlIHNlY3VyZSBvciBlcnJvciBmcmVlIGFzIHRoZXkg
Y2FuIGJlIGludGVyY2VwdGVkLCBhbWVuZGVkLCBsb3N0IG9yIGRlc3Ryb3llZCwgYW5kIHlvdSBz
aG91bGQgdGFrZSBmdWxsIHJlc3BvbnNpYmlsaXR5IGZvciBzZWN1cml0eSBjaGVja2luZy4gCiAK
5pys6YKu5Lu25Y+K5YW25Lu75L2V6ZmE5Lu25YW35pyJ5L+d5a+G5oCn6LSo77yM5bm25Y+v6IO9
5Y+X5YW25LuW5L+d5oqk5oiW5LiN5YWB6K646KKr5oqr6Zyy57uZ56ys5LiJ5pa544CC5aaC6ZiB
5LiL6K+v5pS25Yiw5pys6YKu5Lu277yM5pWs6K+356uL5Y2z5Lul5Zue5aSN55S15a2Q6YKu5Lu2
55qE5pa55byP6YCa55+l5Y+R5Lu25Lq677yM5bm25bCG5pys6YKu5Lu25Y+K5YW25Lu75L2V6ZmE
5Lu25LuO6ZiB5LiL57O757uf5Lit5LqI5Lul5Yig6Zmk44CC5aaC6ZiB5LiL5bm26Z2e5pys6YKu
5Lu25YaZ5piO5LmL5pS25Lu25Lq677yM5pWs6K+35YiH5Yu/5L2/55So44CB5aSN5Yi244CB5oqr
6Zyy5pys6YKu5Lu25oiW5YW25Lu75L2V5YaF5a6577yM5Lqm6K+35YiH5Yu/5L6d5pys6YKu5Lu2
5oiW5YW25Lu75L2V5YaF5a656ICM6YeH5Y+W5Lu75L2V6KGM5Yqo44CC55S15a2Q6YKu5Lu25peg
5rOV5L+d6K+B5piv5LiA56eN5a6J5YWo5ZKM5LiN5Lya5Ye6546w5Lu75L2V5beu6ZSZ55qE6YCa
5L+h5pa55byP77yM5Y+v6IO95Lya6KKr5oum5oiq44CB5L+u5pS544CB5Lii5aSx5oiW5o2f5Z2P
77yM5pS25Lu25Lq66ZyA6Ieq6KGM6LSf6LSj5YGa5aW95a6J5YWo5qOA5p+l44CCCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
