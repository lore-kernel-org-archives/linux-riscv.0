Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A811CE9B258
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 13:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=55jtVFIrzFn2tz7tBxWzRvKfyCSosWbqaGOifcrTWqo=; b=s3cPClOEasS+Tc
	3o/rs7vaKa55dKXctJbk3whzaR89IRfz7MGAJlSHc1pdRiV+1rkyULmzLNGQbAsYl9939ko94+JZu
	gBnEkxzQ26Ii+ixjRaSrN2kLBpQFrIh41Ps4pE6ZkH9IxrTQP79WOmDuUsF0N4NMIxdO92DxCH9E+
	aXrOTwu4XwnyPQPweoxRO9373b95HwiLuq1/rEARZJadRe4NsVOFmfln9Jawd86bBoqGMO+Bf+opM
	MG84OqkTuOa0nlb4q9bsgZRybkFEQH0BEb8fzXqZ+C6SDLAVpjZmVoAtHWQX2ERnurx7+4jSVrujr
	y/V9I/DSzCRrxHRAYweg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vusPd-000000028dO-3v88;
	Tue, 24 Feb 2026 13:25:17 +0000
Received: from omta040.useast.a.cloudfilter.net ([44.202.169.39])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vusPb-000000028d4-0gLo
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 13:25:16 +0000
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id ur59vAOtiCxrGusPZvTSUd; Tue, 24 Feb 2026 13:25:13 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id usPWvbMf3hoT4usPWvs1VD; Tue, 24 Feb 2026 13:25:10 +0000
X-Authority-Analysis: v=2.4 cv=XZyJzJ55 c=1 sm=1 tr=0 ts=699da6b7
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=7vwVE5O1G3EA:10
 a=18PHJyqfMDr_zX8ZnccA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kZm0B0zQQ6hc9a/7TFYjP7sWkRc5ghpuyKwhkfv3bWc=; b=xma9dofd3wNOQg/PFJ6wPvxaoB
	UDQ917OjDgfcK1pmkAuqFEp/YKrA+Ed8cnQIfAtIbd1rNCrBN/TxafOwyQGlvIbCbZnmv5PK5wDJM
	DoOgs3NunHOOALt9JBeOt/QozKfHOnlR00Z0Br58Rvs/+geBrR8sUWWdVRW3D3QdgvfFVWj6EKxew
	2F6/vGmmHxFua9dMM4Rsxmtvfkhdyt7UpDx7vWcyqCpGQRtIfxWO2mdYTSr0ReLykKhp/DzXSAAUO
	claCRrGqYqxhTNe3/ceZLZPbA9z+fHKEEXM+sIsVijdDh1gvnQNHsXDylY9txKRL1uXv1Mz5Y/6sz
	QHXIh6uw==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:41940 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <re@w6rz.net>)
	id 1vusPV-00000001sk3-3mm6;
	Tue, 24 Feb 2026 06:25:09 -0700
Message-ID: <30dd1efc-9bd9-4664-999e-610d181600f9@w6rz.net>
Date: Tue, 24 Feb 2026 05:25:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mm: Regression with v7.0-rc1 on RISC-V
To: Kefeng Wang <wangkefeng.wang@huawei.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: ziy@nvidia.com, jackmanb@google.com, david@redhat.com,
 jane.chu@oracle.com, hannes@cmpxchg.org, willy@infradead.org,
 muchun.song@linux.dev, osalvador@suse.de, sidhartha.kumar@oracle.com,
 vbabka@suse.cz, claudiu.beznea.uj@bp.renesas.com,
 Mark Brown <broonie@kernel.org>, akpm@linux-foundation.org, pjw@kernel.org
References: <1b17c38f-30d3-4bb4-a7e1-e74b19ada885@w6rz.net>
 <64357180-b91a-4319-bd0f-5f09e38cebdb@huawei.com>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <64357180-b91a-4319-bd0f-5f09e38cebdb@huawei.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.162.206.103
X-Source-L: No
X-Exim-ID: 1vusPV-00000001sk3-3mm6
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:41940
X-Source-Auth: re@w6rz.net
X-Email-Count: 15
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPc8WqLI9T8jKEn8R7GE9fkihTj6Ru8DEqKIsjszdyuKn+DeHnQoTjNfWv8MNefMmHvhbQ4xRaRTGy0pgZv1Hz9KgW/tvUc90/qFdlM9oXMQin/57xHt
 e4JD741CnBTVbPHt5KqtXFEPGCqQKAR+cuk/ZOrDwope21KhHq7ryYTwAaiZcRBIGJXYcIiMlywcTLJhZDGGM0MTDV0I/xcWHPQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_052515_339207_3135FD09 
X-CRM114-Status: UNSURE (   5.28  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMi8yNC8yNiAwNDo1OCwgS2VmZW5nIFdhbmcgd3JvdGU6Cj4KPgo+IE9uIDIwMjYvMi8yNCAx
NjozNywgUm9uIEVjb25vbW9zIHdyb3RlOgo+PiBJJ20gZ2V0dGluZyBhIEJVRyBkdW1wIGR1cmlu
ZyBzaHV0ZG93biB3aXRoIExpbnV4IHY3LjAtcmMxIG9uIFJJU0MtVi4KPj4KPj4gW8KgIE9LwqAg
XSBSZWFjaGVkIHRhcmdldCBzaHV0ZG93bi50YXJnZXQgLSBTeXN0ZW0gU2h1dGRvd24uCj4+IFvC
oCBPS8KgIF0gUmVhY2hlZCB0YXJnZXQgZmluYWwudGFyZ2V0IC0gTGF0ZSBTaHV0ZG93biBTZXJ2
aWNlcy4KPj4gW8KgIE9LwqAgXSBGaW5pc2hlZCBzeXN0ZW1kLXJlYm9vdC5zZXJ2aWNlIC0gU3lz
dGVtIFJlYm9vdC4KPj4gW8KgIE9LwqAgXSBSZWFjaGVkIHRhcmdldCByZWJvb3QudGFyZ2V0IC0g
U3lzdGVtIFJlYm9vdC4KPj4gW8KgIDE3My45ODUyNDldIEJVRzogQmFkIHBhZ2Ugc3RhdGUgaW4g
cHJvY2VzcyBzaHV0ZG93biBwZm46Zjg4NTAKPj4gW8KgIDE3My45ODUzMTFdIHBhZ2U6IHJlZmNv
dW50OjEgbWFwY291bnQ6MCBtYXBwaW5nOjAwMDAwMDAwMDAwMDAwMDAgaW5kZXg6MHgwIHBmbjow
eGY4ODUwCj4+IFvCoCAxNzMuOTg1MzM2XSBmbGFnczogMHhmZmZmODAwMDAwMDAwMDAobm9kZT0w
fHpvbmU9MHwgbGFzdGNwdXBpZD0weDFmZmZmKSBDTUEKPj4gW8KgIDE3My45ODUzNjVdIHJhdzog
MGZmZmY4MDAwMDAwMDAwMCBmZmZmZmZjNTAxZTIxNDQ4IGZmZmZmZmM2MDBmMmFlODggMDAwMDAw
MDAwMDAwMDAwMAo+PiBbwqAgMTczLjk4NTM4Nl0gcmF3OiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAw
MDAwMDAwMDAwMDAgMDAwMDAwMDFmZmZmZmZmZiAwMDAwMDAwMDAwMDAwMDAwCj4+IFvCoCAxNzMu
OTg1NDAzXSBwYWdlIGR1bXBlZCBiZWNhdXNlOiBub256ZXJvIF9yZWZjb3VudAo+Cj4gVGhlIHJl
ZmNvdW50IHNldCB0byAxIHdoZW4gY21hX2FsbG9jKCkgYnkgc2V0X3BhZ2VfcmVmY291bnRlZCgp
LCBhbmQgaXQKPiB3aWxsIGJlIGRlYyB0byAwIGluIGNtYV9yZWxlYXNlKCkgYnkgcHV0X3BhZ2Vf
dGVzdHplcm8oKSwgdGhlcmUgbWF5IGJlIGEgcHJvYmxlbSBzb21ld2hlcmUgZWxzZT8KPgo+IENv
dWxkIHlvdSBlbmFibGUgQ09ORklHX0RFQlVHX1ZNIGFuZCBDT05GSUdfREVCVUdfUEFHRV9SRUYs
IGFuZCB0cnkgdG8gdHJhY2sgZG93biBwYWdlIHJlZmVyZW5jZSBtYW5pcHVsYXRpb24gYnkgdHJh
Y2Vwb2ludD8gb3IgCj4gZm9yIENNQS1yZWxhdGVkCj4gcGFnZXMsIGludHJvZHVjZSBleHBsaWNp
dCBwcmludGsgYm90aCBpbmNyZW1lbnRzIGFuZCBkZWNyZW1lbnRzIG9mIHRoZSBwYWdlIHJlZmVy
ZW5jZSBjb3VudCB0byBpZGVudGlmeSB0aGUgcm9vdCBjYXVzZSBvZiB0aGUgaXNzdWUuCj4KU29t
ZXRoaW5nIHN0cmFuZ2UgaXMgZ29pbmcgb24uIEkgZW5hYmxlZMKgQ09ORklHX0RFQlVHX1ZNIGJ5
IGl0c2VsZiBhbmQgdGhlIGlzc3VlIHdlbnQgYXdheS4gTGV0IG1lIHRyecKgQ09ORklHX0RFQlVH
X1BBR0VfUkVGLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
