Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E720D3C92A
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 07:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EuNeKhaLESAAjHnrZfADLzpnMCFb7W31Z2lNmJFbPg0=; b=qvnR4WR/OyHHYY
	eFP8igHkZBLyHI/T4I3oIISmClgMQxUncYB8HCb9NgiqA07UEFcEKVYbjlA7CNw5CWaTvj97OIHlx
	EtXXMjEgbf69RtDMJRKdPTncxyZwtAMj+DZcG09new2euuaU8trXe7jTrUT5o4iqATCut2JdGdrNI
	rA5GpCkt0D8hZnYZo3rhZPUKdcy5o4b4mrExID88oy2aLwqRYb9GjS8YVyUayWGGHGYLdqDGbI5LZ
	TxvXmMspx4Jpe8bAYznnU9IB+ZgcO4t4XN7ooJWgX0ZIYJQvaAAekB22J0lN5Rbp2/u4vy57ZJ2sl
	bNnNq2WeE5K7eh5aCEnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2QPv-00000004YwS-1NGr;
	Sun, 20 Oct 2024 07:31:59 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2QPr-00000004Yvp-0AEy
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 07:31:58 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20241020073149euoutp015587e2ad05ac459ec6f322a269c84ceb~AGMlYlaM60050500505euoutp014
	for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 07:31:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20241020073149euoutp015587e2ad05ac459ec6f322a269c84ceb~AGMlYlaM60050500505euoutp014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1729409510;
	bh=e5elJH5IxGZkyMMY5cfuk2jRIIiMmB1HblIjxtL2Frg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=kM67r00bGviGMufjiLPEidEXiWUNAqeWhLbLv1zFIO4Q0rHkQ/0z+57fv0skaOmWk
	 ca1cfAukL2ltwHeSjUJ4SIMYuhw2bFGgSnpRLh/PMHCZfcjJiCS+Bddc3nJp0X4Cbn
	 FuVyjZFava55ElUUH+pblqYHmpzmR4j76DQ2RFnY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20241020073149eucas1p2f0b8fa13c4dc4155d90dbd8484bf71bb~AGMlBpaJS2431224312eucas1p2t;
	Sun, 20 Oct 2024 07:31:49 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id B8.DD.20397.5E1B4176; Sun, 20
	Oct 2024 08:31:49 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20241020073148eucas1p1bf6fef28932441e8a1bcfbe68b027e55~AGMkc94J82949829498eucas1p1a;
	Sun, 20 Oct 2024 07:31:48 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241020073148eusmtrp2649b6ceada66985c0ec9bba0e291c678~AGMkcUaHA1126911269eusmtrp2M;
	Sun, 20 Oct 2024 07:31:48 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-23-6714b1e5c322
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id F4.13.19920.4E1B4176; Sun, 20
	Oct 2024 08:31:48 +0100 (BST)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241020073148eusmtip14289d6ab273e0e1766691c11a5519299~AGMjlU89j2150321503eusmtip1b;
	Sun, 20 Oct 2024 07:31:47 +0000 (GMT)
Message-ID: <c586a0e9-2bd1-4580-8bf4-bc59f1af0c51@samsung.com>
Date: Sun, 20 Oct 2024 09:31:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: mailbox: Add thead,th1520-mailbox
 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>, Samuel Holland
	<samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, drew@pdp7.com, guoren@kernel.org,
	wefu@redhat.com, jassisinghbrar@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, m.szyprowski@samsung.com
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <54fd467b-8077-454f-ae6c-14bb782cbe3a@kernel.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFKsWRmVeSWpSXmKPExsWy7djPc7pPN4qkG7y+LWmx9fcsdos1e88x
	Wcw/co7V4t6lLUwWL/Y2slhcWzGX3eLlrHtsFufPb2C32Pt6K7vF5V1z2Cy2fW5hs1h75C5Q
	9nIPs0XbLH6L/3t2sFusPneFxaJl/xQWB0GPNy9fsngc7vjC7rFz1l12j02rOtk87lzbw+ax
	eUm9R8vaY0we7/ddZfPo27KK0eNS83V2j8+b5AK4o7hsUlJzMstSi/TtErgy2t7GFfwXqHjZ
	/JSxgXEhTxcjJ4eEgInEi3sb2LoYuTiEBFYwSnxc0QjlfGGUWPBpNyOE85lRYvPXBiaYll8v
	uphBbCGB5YwSOw+YQxS9ZZRYO2E1WIJXwE6i48ZqRhCbRUBVYv/u01BxQYmTM5+wgNiiAvIS
	92/NYAexhQVCJQ6ceAJmiwiES8y98IgFZCizQDOzxMk7X9hAEswC4hK3nswHu4JNwEjiwfL5
	rCA2J9Cy+b8WQtXISzRvnc0M0iwhcI5T4u3LXjaIs10kms9MZIGwhSVeHd/CDmHLSPzfOR/q
	tXyJB1s/MUPYNRI7e45D2dYSd879AprDAbRAU2L9Ln2IsKPEnuaLjCBhCQE+iRtvBSFO4JOY
	tG06M0SYV6KjTQiiWk1iak8v3NJzK7YxTWBUmoUUKrOQPDkLyTOzEPYuYGRZxSieWlqcm55a
	bJyXWq5XnJhbXJqXrpecn7uJEZgcT/87/nUH44pXH/UOMTJxMB5ilOBgVhLhTaoXTBfiTUms
	rEotyo8vKs1JLT7EKM3BoiTOq5oinyokkJ5YkpqdmlqQWgSTZeLglGpg0v7E+q3pMMedFYZs
	Qv2dC7cyJmX+nM5gE7y5/OP3EwU/9tm6bdw6+dn+0mVh+c9Fl6/+KVeYO90sPq8pcZ/S3bQD
	7Ds+mdjtf9Ll47rn93OjB0smsqzp7o34EJPGwc/4+NOlWccP3JplePHp3IYeAd/o3aG2n7Y0
	P/59rmbT1vUmaRdtKtlfWlYsvxT0iXmZZZms8q2nfXc2qXw877Vi4gMmt7SUCo4j9y0k/1xc
	I7Js30WFy5ZnW2Ju3r6onljOMJstb25cM6vEc4s90ZtT2BnV68s3Tvyc2rdm4/P8yrauVWvk
	eJoM9CZvDfSqmb5/WqWLg1O+38TuZveu/yFzOed7iYRZnLzeyNEzk69qjxJLcUaioRZzUXEi
	AA+FiJL9AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDIsWRmVeSWpSXmKPExsVy+t/xu7pPNoqkG3y4ZGix9fcsdos1e88x
	Wcw/co7V4t6lLUwWL/Y2slhcWzGX3eLlrHtsFufPb2C32Pt6K7vF5V1z2Cy2fW5hs1h75C5Q
	9nIPs0XbLH6L/3t2sFusPneFxaJl/xQWB0GPNy9fsngc7vjC7rFz1l12j02rOtk87lzbw+ax
	eUm9R8vaY0we7/ddZfPo27KK0eNS83V2j8+b5AK4o/RsivJLS1IVMvKLS2yVog0tjPQMLS30
	jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQy2t7GFfwXqHjZ/JSxgXEhTxcjJ4eEgInErxdd
	zF2MXBxCAksZJVqefmWBSMhIXOt+CWULS/y51sUGUfSaUaJ54lJGkASvgJ1Ex43VYDaLgKrE
	/t2nmSHighInZz4BaxYVkJe4f2sGO4gtLBAqceDEEzBbRCBc4tKijWC9zAKtzBL3J8tDLNjI
	JDFn0jNmiIS4xK0n85lAbDYBI4kHy+ezgticQIvn/1oIdBEHUI26xPp5QhDl8hLNW2czT2AU
	moXkjFlIJs1C6JiFpGMBI8sqRpHU0uLc9NxiQ73ixNzi0rx0veT83E2MwGSw7djPzTsY5736
	qHeIkYmD8RCjBAezkghvUr1guhBvSmJlVWpRfnxRaU5q8SFGU2BQTGSWEk3OB6ajvJJ4QzMD
	U0MTM0sDU0szYyVxXrfL59OEBNITS1KzU1MLUotg+pg4OKUamEQOpyh1fzzZP/1FlkSS5tXH
	aZ8uXL27IX7VugMyMzabrxRYGLbAcMab6G+9SaxGsx9eeHClte9E1Ao/v/x7GcbXN051MfVi
	yTsjeyVxybwZMwIcXNacnNr7l7GpSKdg4ueDApvzmKy+B3Xv3fn7m0N06pb7UR7/vc9m1utx
	ic76N2/CLWFfg9cm37cUXTvmZf862O35EdWrkysnXr+zuX1i7H5Rfm+nb8YpxUcMd6T8mRG7
	mKO1s3Yb948NSjU8oq0z3u0tK+pkud+Ut8C45PoBiSkm/Zd73itlrj99+EGI09Ife5Y/mBL3
	Z72Fsuqq6Gf/eXh+7S5xmx0eE7hjTYGFj2dx9cX7PMm2S5RnmiopsRRnJBpqMRcVJwIAZw4t
	X48DAAA=
X-CMS-MailID: 20241020073148eucas1p1bf6fef28932441e8a1bcfbe68b027e55
X-Msg-Generator: CA
X-RootMTR: 20241014123411eucas1p1f93d64ac9db9a6f77982500d4a0157f7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241014123411eucas1p1f93d64ac9db9a6f77982500d4a0157f7
References: <20241014123314.1231517-1-m.wilczynski@samsung.com>
	<CGME20241014123411eucas1p1f93d64ac9db9a6f77982500d4a0157f7@eucas1p1.samsung.com>
	<20241014123314.1231517-3-m.wilczynski@samsung.com>
	<f1c1af8c-18e0-433d-a61c-90080919378f@sifive.com>
	<54fd467b-8077-454f-ae6c-14bb782cbe3a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_003155_673888_10C69A07 
X-CRM114-Status: GOOD (  17.94  )
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

CgpPbiAxMC8xNi8yNCAwODozMSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAxNi8x
MC8yMDI0IDAxOjE0LCBTYW11ZWwgSG9sbGFuZCB3cm90ZToKPj4+ICsgIHJlZy1uYW1lczoKPj4+
ICsgICAgaXRlbXM6Cj4+PiArICAgICAgLSBjb25zdDogbG9jYWwKPj4+ICsgICAgICAtIGNvbnN0
OiByZW1vdGUtaWN1MAo+Pj4gKyAgICAgIC0gY29uc3Q6IHJlbW90ZS1pY3UxCj4+PiArICAgICAg
LSBjb25zdDogcmVtb3RlLWljdTIKPj4+ICsKPj4+ICsgIGludGVycnVwdHM6Cj4+PiArICAgIG1h
eEl0ZW1zOiAxCj4+PiArCj4+PiArICAnI21ib3gtY2VsbHMnOgo+Pj4gKyAgICBjb25zdDogMgo+
Pj4gKyAgICBkZXNjcmlwdGlvbjogfAo+Pj4gKyAgICAgIFNwZWNpZmllcyB0aGUgbnVtYmVyIG9m
IGNlbGxzIG5lZWRlZCB0byBlbmNvZGUgdGhlIG1haWxib3ggc3BlY2lmaWVyLgo+Pj4gKyAgICAg
IFRoZSBtYWlsYm94IHNwZWNpZmllciBjb25zaXN0cyBvZiB0d28gY2VsbHM6Cj4+PiArICAgICAg
ICAtIERlc3RpbmF0aW9uIENQVSBJRC4KPj4+ICsgICAgICAgIC0gVHlwZSwgd2hpY2ggY2FuIGJl
IG9uZSBvZiB0aGUgZm9sbG93aW5nOgo+Pj4gKyAgICAgICAgICAgIC0gMDoKPj4+ICsgICAgICAg
ICAgICAgICAgLSBUWCAmIFJYIGNoYW5uZWxzIHNoYXJlIHRoZSBzYW1lIGNoYW5uZWwuCj4+PiAr
ICAgICAgICAgICAgICAgIC0gRXF1aXBwZWQgd2l0aCA3IGluZm8gcmVnaXN0ZXJzIHRvIGZhY2ls
aXRhdGUgZGF0YSBzaGFyaW5nLgo+Pj4gKyAgICAgICAgICAgICAgICAtIFN1cHBvcnRzIElSUSBm
b3Igc2lnbmFsaW5nLgo+Pj4gKyAgICAgICAgICAgIC0gMToKPj4+ICsgICAgICAgICAgICAgICAg
LSBUWCAmIFJYIG9wZXJhdGUgYXMgZG9vcmJlbGwgY2hhbm5lbHMuCj4+PiArICAgICAgICAgICAg
ICAgIC0gRG9lcyBub3QgaGF2ZSBkZWRpY2F0ZWQgaW5mbyByZWdpc3RlcnMuCj4+PiArICAgICAg
ICAgICAgICAgIC0gTGFja3MgQUNLIHN1cHBvcnQuCj4+Cj4+IEl0IGFwcGVhcnMgdGhhdCB0aGVz
ZSB0eXBlcyBhcmUgbm90IGRlc2NyaWJpbmcgaGFyZHdhcmUsIGJ1dCB0aGUgcHJvdG9jb2wgdXNl
ZAo+PiBieSB0aGUgTGludXggZHJpdmVyIHRvIGdsdWUgdHdvIHVuaWRpcmVjdGlvbmFsIGhhcmR3
YXJlIGNoYW5uZWxzIHRvZ2V0aGVyIHRvCj4+IG1ha2UgYSB2aXJ0dWFsIGJpZGlyZWN0aW9uYWwg
Y2hhbm5lbC4gVGhpcyBpcyByZWFsbHkgdGhlIHJlc3BvbnNpYmlsaXR5IG9mIHRoZQo+PiBtYWls
Ym94IGNsaWVudCB0byBrbm93IHdoYXQgcHJvdG9jb2wgaXQgbmVlZHMsIG5vdCB0aGUgZGV2aWNl
dHJlZS4KPj4KPiAKPiBIbSwgd2hlcmUgaXMgdGhlIERUUyB3aXRoIGNvbnN1bWVycyBvZiB0aGlz
IG1haWxib3ggcHJvdmlkZXI/CgpUaGUgRFRTIHdpdGggY29uc3VtZXJzIG9mIHRoaXMgbWFpbGJv
eCBwcm92aWRlciBpcyBub3QgaW5jbHVkZWQgaW4gdGhpcwpzZXJpZXMuIFNpbmNlIHRoZSBtYWls
Ym94IHVzZXJzIGRlcGVuZCBvbiB0aGlzIGRyaXZlciBiZWluZyB1cHN0cmVhbWVkLApJIGRlY2lk
ZWQgdG8gc3VibWl0IHRoaXMgZHJpdmVyIGZpcnN0IHRvIGdhdGhlciBmZWVkYmFjayBvbiB3aGV0
aGVyIGl0CmNhbiBiZSBhY2NlcHRlZCB1cHN0cmVhbS4gSWYgc3VjY2Vzc2Z1bCwgSSB3aWxsIGZv
bGxvdyB1cCB3aXRoIGFub3RoZXIKc2VyaWVzIGZvciB0aGUgYW9uIGRyaXZlciwgd2hpY2ggd2ls
bCB1c2UgdGhpcyBtYWlsYm94IHRvIHNlbmQgY29tbWFuZHMKdG8gdGhlIEU5MDIgY29yZSwgc3Vj
aCBhcyBwb3dlcmluZyB0aGUgR1BVIG9uIG9yIG9mZi4KClRoZSBjb25zdW1lciBEVFMgd291bGQg
bG9vayBzb21ldGhpbmcgbGlrZSB0aGlzOgoKYW9uOiBhb24gewoJY29tcGF0aWJsZSA9ICJ0aGVh
ZCx0aDE1MjAtYW9uIjsKCW1ib3gtbmFtZXMgPSAiYW9uIjsKCW1ib3hlcyA9IDwmbWJveF85MTB0
IDEgMD47CglzdGF0dXMgPSAib2theSI7CgoJcGQ6IGxpZ2h0LWFvbi1wZCB7CgkJY29tcGF0aWJs
ZSA9ICJ0aGVhZCxsaWdodC1hb24tcGQiOwoJCSNwb3dlci1kb21haW4tY2VsbHMgPSA8MT47Cgl9
Owp9OwoKVGhhbmtzLApNaWNoYcWCCgo+IAo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKPiAK
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
