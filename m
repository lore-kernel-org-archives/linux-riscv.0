Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62FEE7718D
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 12:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekCNGYMBbl7zQXdboXJF63yY1Tb5Jp9Auuds43+EmiE=; b=ZSR82h1vsTClIc
	YQb5bAT6jr1X66LdTK0M5HjmJORJL/1Fz97mOdpyCcV+CZDAg1eIDxTM/SQlbDl+8ajokBH9Km2FJ
	ndjUby9PWLQG3RJFJamPQYq4f9jIiYD0U44Pb0UzNMIJ9rqW4EPvaw31GHIBwZPed2CZQQPJpitfX
	RG9+rrJ5xARjkVq12Hxp8H/pIRfHbmFZyn0a+lbNfF1Dzi3SHnTHgIdnw0ff3z8geV80d7mN4ZEe/
	4HXTysMykpM0aBlj0NnykFbtf4biTsD/6wv8LiF9HJG9HBLOh7w/PniwFjlUqJsAkuGviqhh73Tdy
	BhEFyuvBptf5UJ5e11vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPhzC-0000000A1S1-1DU6;
	Mon, 23 Dec 2024 12:56:38 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPhyg-0000000A1HD-35nk
	for linux-riscv@lists.infradead.org;
	Mon, 23 Dec 2024 12:56:11 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20241223125603euoutp016f1b54b132ccaac36c6d36791b25056e~Tz57y-3BU3236432364euoutp01n
	for <linux-riscv@lists.infradead.org>; Mon, 23 Dec 2024 12:56:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20241223125603euoutp016f1b54b132ccaac36c6d36791b25056e~Tz57y-3BU3236432364euoutp01n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1734958563;
	bh=6zd+7DIT+1kozgBZgwLKFgnlnTyFTa1FI7kVqIolk1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MMHd1oJ+so/Vm6vVqIg80vuYZFS07zEklmj5tXCF/tKERm1uEh/yScmJdH6QyG9Lg
	 dG1GLzpse3lKcEOP1NiQhorN1/I22USvgItjrTPy8tbW8PpejtfZ1KVthGgbbwF/Zc
	 GPqpadhDAoeiyCeY4lBCA/++Zwi7sp9NpspIcdgo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20241223125602eucas1p1a33613c4b8e49ec3692fc683273a9c04~Tz57QbuAd1525415254eucas1p1s;
	Mon, 23 Dec 2024 12:56:02 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 56.0C.20409.2ED59676; Mon, 23
	Dec 2024 12:56:02 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20241223125601eucas1p1d274193122638075dc65310a22616bae~Tz56wdMWw2402924029eucas1p1Q;
	Mon, 23 Dec 2024 12:56:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241223125601eusmtrp1555a07a0ba7cda11d6586c5aac1bfe96~Tz56vpqK32051220512eusmtrp1G;
	Mon, 23 Dec 2024 12:56:01 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-b6-67695de2fb55
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 31.73.19654.1ED59676; Mon, 23
	Dec 2024 12:56:01 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241223125600eusmtip2c15e8572f2e770fc420851707013d25c~Tz55Y_9mD3173831738eusmtip2L;
	Mon, 23 Dec 2024 12:56:00 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
	m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, Michal Wilczynski
	<m.wilczynski@samsung.com>
Subject: [RFC PATCH v2 01/19] dt-bindings: clock: Add VO subsystem clocks
 and update address requirements
Date: Mon, 23 Dec 2024 13:55:35 +0100
Message-Id: <20241223125553.3527812-2-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223125553.3527812-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se1BUdRTH+917994LtnRdSX4joAJphYaPsek3wpA9YC440+TUaGVJW9wW
	Rti1XRBsmgkFNsElQyx0MViRx0a8lnZXIAjdJdYVZDYUFh12A0akNeTNWhoUy5Xyv+8553PO
	95yZQ+MiI7mGTpSmcHKpOCmY9CaMHX91vzD8QaJka7bGD12xl2LI8FBNoerWbgyVtHcLkLNH
	j6EbcxMkqh2xUej31qME6tN+R6HMjjoSudROEk2pnAJ0vfkciWby2gEyzmSRqKbdQaG6uRIM
	nZ8yEKissRkgZU6FAP16NQo5nFcI5LquwpFS/RT6p6WRQgt9OgIVjbdRSD+WL0CWmn0oq+00
	sWstO9GfTbFjLhfBmo/PUmyrW0OwTWoHxaqaugDbUJVDsgN9LSRbbN3D/nbCgrE/ln3BZtV0
	YOzJ+a3sxM+9JPuVvgqwPZl26k3Re94R8VxS4mFOviXyQ+8Es3KBOGTxT5+scuEZwLw6F3jR
	kNkB7Vo3mQu8aRGjBdBdm4/xwSyA96eHCA8lYmYALLZ8tNxxbGgZqgTwRP81wAdjAObccWEe
	imS2w8HKEoGn4MtkEzD7l6NLFM6MAmi8fW7RkaZXMQeh4YdPPA0EswHe+rZuyU7IvAxb7IUC
	3m4dbLt8DfdoL2YXrM7tBzyzElrP3l7i8UUm01CEe+ZD5rI3VDoyAd/8OvzJdhHn9Sp416Kn
	eB0AOwtUBK9lcNAw/Yj5HDapLI90OBzofrC0J848D+uat/DpV6CqwDOeXtQ+sP/eSn4FH3jK
	WIjzaSE8rhTx9Eb4jSrvP9NurRHjNQsn5/WCr0GQ+rFj1I8do/7fVwPwKuDHpSqSJZxiu5RL
	C1OIkxWpUknYx7LkBrD42p0LltlGUHl3KswEMBqYAKTxYF+hSZQoEQnjxUc+4+SyOHlqEqcw
	AX+aCPYTbohfx4kYiTiFO8hxhzj5chWjvdZkYFnSkfVhXfeJoK6Hb9he+z7QoW1MsITjE0Ex
	NwTatPH38cjSHbPcnO9zb8VFaDetX22Z33TmQIy13ad+c3r1kxV/J99KuHD21YC8PQUZEbHH
	ZlzRhnd2d5qsO/N79k0Vdb1tagzUvRtrLRIOl10KaQpY8em23opL7H54s+tAtGa0cqTE+XQB
	Pl45ZN0Yp9NjGSF9D06N6qK8HIN/CAPF+WP1Vf3s6SdOlhdm3vxyc2tNDEo73zCis/mFpBfX
	a8r3rkgJGJh+JvTignnt+J/Pyl7c63a39c7H7rxgu3p4/700mb9bMhkZUS6JfsleGj8UdaR2
	eDAi+U621Oy009xc6HS4fCyYUCSIt4XicoX4XzIdPwxJBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDKsWRmVeSWpSXmKPExsVy+t/xe7oPYzPTDaYuM7Q4cX0Rk8XW37PY
	LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWXzsucdq
	cXnXHDaLz71HGC22fW5hs1h75C67xfqv85ksFn7cymKxZMcuRou2zmWsFhdPuVrcvXeCxeLl
	5R5mi7ZZ/Bb/9+xgt/h3bSOLxex3+9kttryZyGpxfG24Rcv+KSwOch7vb7Sye7x5+ZLF43DH
	F3aPvd8WsHjsnHWX3aNn5xlGj02rOtk87lzbw+Yx72Sgx/3u40wem5fUe7SsPcbk0f/XwOP9
	vqtsHn1bVjF6XGq+zh4gFKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9n
	k5Kak1mWWqRvl6CXcbjtH0vBcemKD6teMjcwHhbrYuTkkBAwkWh6OJGpi5GLQ0hgKaPEodvP
	mSASMhLXul+yQNjCEn+udbFBFL1ilOic95EZJMEmYCTxYPl8VhBbRGAxi8TefZUgRcwCbxkl
	rs/cCNYtLJApMe/lMUYQm0VAVeLWtPVgcV4Be4k916ezQmyQl9h/8CzYUE4BB4k1XTfA6oWA
	av6d+sAGUS8ocXLmE6BeDqAF6hLr5wmBhJmBWpu3zmaewCg4C0nVLISqWUiqFjAyr2IUSS0t
	zk3PLTbSK07MLS7NS9dLzs/dxAhMRtuO/dyyg3Hlq496hxiZOBgPMUpwMCuJ8B4SykwX4k1J
	rKxKLcqPLyrNSS0+xGgK9M1EZinR5HxgOswriTc0MzA1NDGzNDC1NDNWEudlu3I+TUggPbEk
	NTs1tSC1CKaPiYNTqoFp/+x/zBVi09TmG9hOuZRjFxm25NnxDKtDNsIhMR3sbx/oiyRY3LaI
	VbbYl/TCUWXeea4LZ2W3Sr+4FbXqbozy2vAPL2MmLqgQ23R2tvgdKz6P3FtXGEzN+Hh4fvNZ
	lNhmKrgVW36VLHwzcUGB0MXfKw49Emo7f+tKfcodLuuw6vZPLacuR1pILJ27X8FukvbXmY9v
	P5vZoc2xvubcRSXFRU/Cluu6b7P8FPEzoD3dZ+cXSb7SwLfT1/Q2vWjTkORa+/bbH5OvPFrX
	r/o/mC62mGNeZUrOy1Nc51cllEr8+/pt77yJjy0W3jWx9L6/uXvWa+38KzKnjQV7/z3k+qBS
	Etj6adqsRMZUmz8ftEWDlViKMxINtZiLihMBqefk2c8DAAA=
X-CMS-MailID: 20241223125601eucas1p1d274193122638075dc65310a22616bae
X-Msg-Generator: CA
X-RootMTR: 20241223125601eucas1p1d274193122638075dc65310a22616bae
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241223125601eucas1p1d274193122638075dc65310a22616bae
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
	<CGME20241223125601eucas1p1d274193122638075dc65310a22616bae@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_045607_384350_3E73A2B0 
X-CRM114-Status: GOOD (  13.36  )
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

VGhlIFQtSGVhZCBUSDE1MjAgU29D4oCZcyBBUCBjbG9jayBjb250cm9sbGVyIG5vdyBuZWVkcyB0
d28gYWRkcmVzcyByYW5nZXMKdG8gbWFuYWdlIGJvdGggdGhlIEFwcGxpY2F0aW9uIFByb2Nlc3Nv
ciAoQVApIGFuZCBWaWRlbyBPdXRwdXQgKFZPKQpzdWJzeXN0ZW0gY2xvY2tzLiBVcGRhdGUgdGhl
IGRldmljZSB0cmVlIGJpbmRpbmdzIHRvIHJlcXVpcmUgdHdvIGByZWdgCmVudHJpZXMsIG9uZSBm
b3IgdGhlIEFQIGNsb2NrcyBhbmQgb25lIGZvciB0aGUgVk8gY2xvY2tzLgoKQWRkaXRpb25hbGx5
LCBpbnRyb2R1Y2UgbmV3IFZPIHN1YnN5c3RlbSBjbG9jayBjb25zdGFudHMgaW4gdGhlIGhlYWRl
cgpmaWxlLiBUaGVzZSBjb25zdGFudHMgd2lsbCBiZSB1c2VkIGJ5IHRoZSBkcml2ZXIgdG8gY29u
dHJvbCBWTy1yZWxhdGVkCmNvbXBvbmVudHMgc3VjaCBhcyBkaXNwbGF5IGFuZCBncmFwaGljcyB1
bml0cy4KClNpZ25lZC1vZmYtYnk6IE1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ft
c3VuZy5jb20+Ci0tLQogLi4uL2JpbmRpbmdzL2Nsb2NrL3RoZWFkLHRoMTUyMC1jbGstYXAueWFt
bCAgIHwgMTUgKysrKysrKy0tCiAuLi4vZHQtYmluZGluZ3MvY2xvY2svdGhlYWQsdGgxNTIwLWNs
ay1hcC5oICAgfCAzMyArKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDQ1IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3RoZWFkLHRoMTUyMC1jbGstYXAueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay90aGVhZCx0aDE1MjAtY2xrLWFwLnlh
bWwKaW5kZXggMDEyOWJkMGJhNGIzLi5mMGRmOTdhNDUwZWYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay90aGVhZCx0aDE1MjAtY2xrLWFwLnlhbWwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3RoZWFkLHRoMTUy
MC1jbGstYXAueWFtbApAQCAtOCw3ICs4LDggQEAgdGl0bGU6IFQtSEVBRCBUSDE1MjAgQVAgc3Vi
LXN5c3RlbSBjbG9jayBjb250cm9sbGVyCiAKIGRlc2NyaXB0aW9uOiB8CiAgIFRoZSBULUhFQUQg
VEgxNTIwIEFQIHN1Yi1zeXN0ZW0gY2xvY2sgY29udHJvbGxlciBjb25maWd1cmVzIHRoZQotICBD
UFUsIERQVSwgR01BQyBhbmQgVEVFIFBMTHMuCisgIENQVSwgRFBVLCBHTUFDIGFuZCBURUUgUExM
cy4gQWRkaXRpb25hbGx5IHRoZSBWTyBzdWJzeXN0ZW0gY29uZmlndXJlcworICB0aGUgY2xvY2sg
Z2F0ZXMgZm9yIHRoZSBIRE1JLCBNSVBJIGFuZCB0aGUgR1BVLgogCiAgIFNvQyByZWZlcmVuY2Ug
bWFudWFsCiAgIGh0dHBzOi8vb3BlbmJlYWdsZS5vcmcvYmVhZ2xldi1haGVhZC9iZWFnbGV2LWFo
ZWFkLy0vYmxvYi9tYWluL2RvY3MvVEgxNTIwJTIwU3lzdGVtJTIwVXNlciUyME1hbnVhbC5wZGYK
QEAgLTIzLDcgKzI0LDEzIEBAIHByb3BlcnRpZXM6CiAgICAgY29uc3Q6IHRoZWFkLHRoMTUyMC1j
bGstYXAKIAogICByZWc6Ci0gICAgbWF4SXRlbXM6IDEKKyAgICBtaW5JdGVtczogMgorICAgIG1h
eEl0ZW1zOiAyCisKKyAgcmVnLW5hbWVzOgorICAgIGl0ZW1zOgorICAgICAgLSBjb25zdDogYXAt
Y2xrcworICAgICAgLSBjb25zdDogdm8tY2xrcwogCiAgIGNsb2NrczoKICAgICBpdGVtczoKQEAg
LTQ3LDcgKzU0LDkgQEAgZXhhbXBsZXM6CiAgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2Nr
L3RoZWFkLHRoMTUyMC1jbGstYXAuaD4KICAgICBjbG9jay1jb250cm9sbGVyQGVmMDEwMDAwIHsK
ICAgICAgICAgY29tcGF0aWJsZSA9ICJ0aGVhZCx0aDE1MjAtY2xrLWFwIjsKLSAgICAgICAgcmVn
ID0gPDB4ZWYwMTAwMDAgMHgxMDAwPjsKKyAgICAgICAgcmVnID0gPDB4ZWYwMTAwMDAgMHgxMDAw
PiwKKyAgICAgICAgICAgICAgPDB4ZmYwMTAwMDAgMHgxMDAwPjsKKyAgICAgICAgcmVnLW5hbWVz
ID0gImFwLWNsa3MiLCAidm8tY2xrcyI7CiAgICAgICAgIGNsb2NrcyA9IDwmb3NjPjsKICAgICAg
ICAgI2Nsb2NrLWNlbGxzID0gPDE+OwogICAgIH07CmRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJp
bmRpbmdzL2Nsb2NrL3RoZWFkLHRoMTUyMC1jbGstYXAuaCBiL2luY2x1ZGUvZHQtYmluZGluZ3Mv
Y2xvY2svdGhlYWQsdGgxNTIwLWNsay1hcC5oCmluZGV4IGExOTk3ODRiMzUxMi4uOGI5YTk4Zjg3
OGE2IDEwMDY0NAotLS0gYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3RoZWFkLHRoMTUyMC1j
bGstYXAuaAorKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3RoZWFkLHRoMTUyMC1jbGst
YXAuaApAQCAtOTMsNCArOTMsMzcgQEAKICNkZWZpbmUgQ0xLX1NSQU0zCQk4MwogI2RlZmluZSBD
TEtfUExMX0dNQUNfMTAwTQk4NAogI2RlZmluZSBDTEtfVUFSVF9TQ0xLCQk4NQorCisvKiBWTyBj
bG9ja3MgKi8KKyNkZWZpbmUgQ0xLX0FYSTRfVk9fQUNMSwkJODYKKyNkZWZpbmUgQ0xLX0dQVV9D
T1JFCQkJODcKKyNkZWZpbmUgQ0xLX0dQVV9DRkdfQUNMSwkJODgKKyNkZWZpbmUgQ0xLX0RQVV9Q
SVhFTENMSzAJCTg5CisjZGVmaW5lIENMS19EUFVfUElYRUxDTEsxCQk5MAorI2RlZmluZSBDTEtf
RFBVX0hDTEsJCQk5MQorI2RlZmluZSBDTEtfRFBVX0FDTEsJCQk5MgorI2RlZmluZSBDTEtfRFBV
X0NDTEsJCQk5MworI2RlZmluZSBDTEtfSERNSV9TRlIJCQk5NAorI2RlZmluZSBDTEtfSERNSV9Q
Q0xLCQkJOTUKKyNkZWZpbmUgQ0xLX0hETUlfQ0VDCQkJOTYKKyNkZWZpbmUgQ0xLX01JUElfRFNJ
MF9QQ0xLCQk5NworI2RlZmluZSBDTEtfTUlQSV9EU0kxX1BDTEsJCTk4CisjZGVmaW5lIENMS19N
SVBJX0RTSTBfQ0ZHCQk5OQorI2RlZmluZSBDTEtfTUlQSV9EU0kxX0NGRwkJMTAwCisjZGVmaW5l
IENMS19NSVBJX0RTSTBfUkVGQ0xLCQkxMDEKKyNkZWZpbmUgQ0xLX01JUElfRFNJMV9SRUZDTEsJ
CTEwMgorI2RlZmluZSBDTEtfSERNSV9JMlMJCQkxMDMKKyNkZWZpbmUgQ0xLX1gySF9EUFUxX0FD
TEsJCTEwNAorI2RlZmluZSBDTEtfWDJIX0RQVV9BQ0xLCQkxMDUKKyNkZWZpbmUgQ0xLX0FYSTRf
Vk9fUENMSwkJMTA2CisjZGVmaW5lIENMS19JT1BNUF9WT1NZU19EUFVfUENMSwkxMDcKKyNkZWZp
bmUgQ0xLX0lPUE1QX1ZPU1lTX0RQVTFfUENMSwkxMDgKKyNkZWZpbmUgQ0xLX0lPUE1QX1ZPU1lT
X0dQVV9QQ0xLCTEwOQorI2RlZmluZSBDTEtfSU9QTVBfRFBVMV9BQ0xLCQkxMTAKKyNkZWZpbmUg
Q0xLX0lPUE1QX0RQVV9BQ0xLCQkxMTEKKyNkZWZpbmUgQ0xLX0lPUE1QX0dQVV9BQ0xLCQkxMTIK
KyNkZWZpbmUgQ0xLX01JUElEU0kwX1BJWENMSwkJMTEzCisjZGVmaW5lIENMS19NSVBJRFNJMV9Q
SVhDTEsJCTExNAorI2RlZmluZSBDTEtfSERNSV9QSVhDTEsJCQkxMTUKKwogI2VuZGlmCi0tIAoy
LjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
