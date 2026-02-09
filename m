Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6266AEF06EE
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Feb 2026 01:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ncS71Lyiw+OhV30gdd+Sja8Y4VJmpzQunNtZN1OkU0=; b=lH4JotwK85Oc2mTOYUOJz5WI5p
	Az9ZSjbMhS5xgjHMas1aNCSGlZUwME254TuKYrrAsE7134I34vkb2wi1b8eqrd1Wx0sdK7W2W3DnR
	LjtjyvtePSbjTVGzNS3xZKrj0GdI+t84U71jHIOebybgpkefrbD9okexlNXvYlmRYx2VdP+iM49S0
	Dm9UOqTC7h9OUWGNunvXfPdAWkuXMHY1M6+pfu0OS0XQKP0HUcbi3w7WdQRqzrKxshKrVMCZZXPZo
	VvMcgCeAjEdd0oSlArNPuZ6fjhPTEp1PkRuebq4cssnUwkowOnbI8/90tI3b93Aa4MWjzwMqi99mh
	GgCWDvaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpGH6-0000000Ef0J-03BY;
	Mon, 09 Feb 2026 01:41:16 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpGH0-0000000EeyZ-2Xfn
	for linux-riscv@lists.infradead.org;
	Mon, 09 Feb 2026 01:41:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1770601229;
	bh=gnfNs4/9cLlWmPGt8Fa1E39h7Z4Yp+IEQtuArbh/oqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ZZJp0z2yzDEeEdOXnqdxjTD3iMToP9mi8dRcb7hck3kQ7PzyTqssDx/3+5iGK4PTN
	 7LOSRxdPDeZV+jjUjyCjOeESD5oge0tVOEDXyilSjAjXfcYU51oc45aSn6FrLcprtO
	 K0Tx/9ugHJjcX7nCHBvUDuBvkXCKJKcaeppGWy7I=
X-QQ-mid: zesmtpip2t1770601227t5789b7a5
X-QQ-Originating-IP: Fgum11MpPBfMD+2TeTN+QJgyfNJ/OPyr9gudRkHI6cU=
Received: from [IPV6:2409:8a1e:3015:50f0:24fb: ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Feb 2026 09:40:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10450036312532359646
Message-ID: <D8C71AE40393A6FD+89365591-f896-4609-8b0f-8dffe85b5828@linux.spacemit.com>
Date: Mon, 9 Feb 2026 09:40:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] RISC-V IOMMU HPM support
To: Zong Li <zong.li@sifive.com>, tjeznach@rivosinc.com, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, robh@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 mark.rutland@arm.com, conor+dt@kernel.org, krzk@kernel.org,
 guoyaxing@bosc.ac.cn, luxu.kernel@bytedance.com,
 andrew.jones@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-perf-users@vger.kernel.org
References: <20260208063848.3547817-1-zong.li@sifive.com>
Content-Language: en-US
From: Lv Zheng <lv.zheng@linux.spacemit.com>
In-Reply-To: <20260208063848.3547817-1-zong.li@sifive.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: NhdiEwnVOUqE7/ZiXFyay4uZd7dt6upjd5Apw3lr1qC2Vb9gX2pHLkpw
	xM87noh5AaVuyCoreKbC5uZPjCv5dRV/gVNnE0dOSP0WX2mfLjdkDnMZMa/DRT7n3SBEk6r
	0wz5/uKyVVIsvuX1bfFPd2POVL9CRaxO1qrep2hrrv7go/48boEgODmVs+TbJ/8PqJFpxwx
	bzH3oAtq7T26N/bE5wLRFhGfpW1bgnjxo4pTrku8TKCEQjyT//4t6ftJ4A1YOB4lbbkJW+5
	du6ZghNw7c/DdkR3LmoP+Wjp8bETue5bi+8mdleV1Ui/6f3iamG8nNgJVQSWLaKkPizdc3W
	YxKMoiXeWMTJk9eZHqdiJiFJPvaB7PElR08MVZjIhzmPhXmiH8HYnH6mmHmstLAfcTcjRj6
	NvwxA+zEj5jHxfx0vERa9CqrXjOrpEF7Sdt6+z6nFS+hLaA3QgU2H0L1kXIRlaKhiPEYhAJ
	a52NToUFyQqomifL88sUoZ8SC4QhSIo6wdEOlifpUeGLbs6++zQtqW85sKfcqQlzIvQ1ay2
	ZLUoqh4n/tMmwtvR7GWYz1qRxnY1tQRfkseroiBorgKjWjxgR5vQAfFt8Vp7D3uisHTTpYK
	zOKdwGLIbfpVXtzQALiVrf/3vv0t9OLTcK1e00P3N3ytaWXqXxdVfwd4z6GDgOo3qtgB40O
	XAuwwJyP8g7XjgaBYJEzBMRnc7zNY2bQPo6NIeUyexHREqN6Ow9xdUNPq/FOkpRNkL7lD5u
	k5fltsaZBIexczPepCesBP0BoYHIo3AF3fIi262E9Z4OicWcGGOO6RUERD+nRcD5QAkZN8k
	u8fELiS4SrSap7/7hVOJGIt4LNHWQtn0CaT1wF9LBIOSRy5eWEAAXjXG9XJXShm2Fuc4qS3
	rEA/RzyKgnZKSTZ3NmB18jbJVD9Tojrh9pEZzVZPAHiKSXdk92PunPhdExltAOM6h0aEL2F
	/V7nDYQ/S+o7iZNh7d4u1ZBoQu1lz1M5agXHSDIFxG3X6DJjNr7rYzb5FlkSg7+69Nz9l4L
	aFwDnS52aih+GdnUeK6CFfclHX2xF2ST9UPJYuEw==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_174111_954716_8F8CC2CC 
X-CRM114-Status: GOOD (  21.80  )
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

T24gMi84LzIwMjYgMjozOCBQTSwgWm9uZyBMaSB3cm90ZToKPiBUaGlzIHNlcmllcyBpbXBsZW1l
bnRzIHN1cHBvcnQgZm9yIHRoZSBSSVNDLVYgSU9NTVUgaGFyZHdhcmUgcGVyZm9ybWFuY2UKPiBt
b25pdG9yLgo+IAo+IFRoZSBSSVNDLVYgSU9NTVUgUE1VIGRyaXZlciBpcyBpbXBsZW1lbnRlZCBh
cyBhbiBhdXhpbGlhcnkgZGV2aWNlIGRyaXZlcgo+IGNyZWF0ZWQgYnkgdGhlIHBhcmVudCBSSVND
LVYgSU9NTVUgZHJpdmVyLiBUaGUgY2hpbGQgZHJpdmVyIGNhbiBvYnRhaW4KPiByZXNvdXJjZXMg
YW5kIGluZm9ybWF0aW9uIGZyb20gdGhlIHBhcmVudCBkZXZpY2UsIHN1Y2ggYXMgdGhlIE1NSU8g
YmFzZQo+IGFkZHJlc3MgYW5kIElSUSBudW1iZXIuCj4gCj4gQ3VzdG9tIGV2ZW50IHN1cHBvcnQg
aXMgbm90IGluY2x1ZGVkIGluIHRoaXMgc2VyaWVzIGFuZCB3aWxsIGJlIHN1Ym1pdHRlZAo+IGFz
IGEgc2VwYXJhdGUgc2VyaWVzLiBUaGUgaWRlYSBpcyB0aGF0IGN1c3RvbSBldmVudHMgd2lsbCBi
ZSBkZWZpbmVkCj4gdGhyb3VnaCB0aGUgZHJpdmVyIGRhdGEgb2YgdGhlIGF1eGlsaWFyeSBkcml2
ZXIuIFdoZW4gdGhlIHBhcmVudCBJT01NVQo+IGRyaXZlciBjcmVhdGVzIHRoZSBhdXhpbGlhcnkg
ZGV2aWNlLCBpdCBzaG91bGQgcGFzcyBhIHZlbmRvci1zcGVjaWZpYwo+IG5hbWUgYXMgdGhlIGRl
dmljZSBuYW1lIGluIG9yZGVyIHRvIG1hdGNoIHRoZSBjb3JyZXNwb25kaW5nIGF1eGlsaWFyeQo+
IGRldmljZSBJRC4KPiAKPiBBZnRlciBteSBpbml0aWFsIFJGQyBhbmQgdGhlIHYxIHBhdGNoIHNl
cmllcyB3ZXJlIHBvc3RlZCwgc2ltaWxhciBwYXRjaAo+IHNlcmllcyBhbHNvIGFwcGVhcmVkIG9u
IHRoZSBtYWlsaW5nIGxpc3QuCj4gCj4gT25lIHdhcyBmcm9tIFlheGluZyBHdW86Cj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwOTE1MDIwOTExLjEzMTMtMS1ndW95YXhpbmdAYm9z
Yy5hYy5jbi8KPiAKPiBhbmQgYW5vdGhlciBmcm9tIEx2IFpoZW5nOgo+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8zMEM3QUQzNTFEQjU1Mjc2K2E4YjAzZGFjLWM1YWYtNDAzNC04NjMxLWFj
MWMzNTJhNDY5ZkBsaW51eC5zcGFjZW1pdC5jb20vCgpQbGVhc2UgZG8gbm90IGZvcmdldCB0byBD
YzoKSmluZ3l1IExpIDxqb2V5LmxpQHNwYWNlbWl0LmNvbT4KSSBvbmx5IHByb3ZpZGVkIFQxMDAg
c3BlY2lmaWMgc3VwcG9ydCBpbiB0aGUgcG9zdGVkIHNlcmllcywgYW5kIHRoZQpuZXcgYXBwcm9h
Y2ggb2YgdGhlIEhQTSBkcml2ZXIgaW4gdGhlIHNhbWUgc2VyaWVzIGlzIGNvbXBvc2VkIGJ5IGhl
ci4KCj4gCj4gWWF4aW5nIGhhcyBhZ3JlZWQgdG8gcGF1c2UgaGlzIHNlcmllcywgYXMgZGlzY3Vz
c2VkIGhlcmU6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaW9tbXUvMmNlOWQ4YmUt
MTBiMy00OGRkLWI5OWUtNzM1ODM0N2ZjMTcxQGJvc2MuYWMuY24vCj4gCj4gVGhlIG1vdGl2YXRp
b24gZm9yIHNlbmRpbmcgdGhpcyB2MiB2ZXJzaW9uIGlzIG5vdCBvbmx5IHRvIGFkZHJlc3MgdGhl
Cj4gZmVlZGJhY2sgYW5kIHN1Z2dlc3Rpb25zIGZyb20gdGhlIHByZXZpb3VzIHJvdW5kLCBidXQg
YWxzbyB0byBpbnRyb2R1Y2UKPiBhIG1ham9yIHN0cnVjdHVyYWwgY2hhbmdlOiB0aGUgUE1VIGRy
aXZlciBoYXMgYmVlbiBtb3ZlZCB1bmRlcgo+IGRyaXZlcnMvcGVyZi8sIHdoaWNoIGhhcyBiZWVu
IG1lbnRpb25lZCByZXBlYXRlZGx5IGJ5IHNldmVyYWwgcGVvcGxlLgo+IFRoaXMgcmVzdWx0cyBp
biBhIGRpZmZlcmVudCBkcml2ZXIgc3RydWN0dXJlIGNvbXBhcmVkIHRvIG15IGVhcmxpZXIKPiB2
ZXJzaW9uIGFuZCB0aGUgb3RoZXIgdHdvIHNlcmllcywgYW5kIEknZCBsaWtlIHRvIGdhdGhlciBm
ZWVkYmFjayBhbmQKPiBzdWdnZXN0aW9ucyBmcm9tIHRoZSBjb21tdW5pdHkgb24gdGhpcyBhcHBy
b2FjaC4gSWYgdGhlIGNvbW11bml0eSB3b3VsZAo+IHByZWZlciB0byBnbyB3aXRoIEx2IFpoZW5n
4oCZcyB2ZXJzaW9uIGluc3RlYWQsIEkgYW0gcGVyZmVjdGx5IGZpbmUgd2l0aAo+IHRoYXQgYXMg
d2VsbC4KCldlJ2QgbGlrZSB0byBrbm93IGlmIHRoZXJlJ3MgYW55IGNvbW1lbnRzIHJlbGF0ZWQg
dG8gcHV0dGluZyBJT01NVSBIUE0KZHJpdmVyIGludG8gZHJpdmVycy9wZXJmIGZvbGRlciBhbmQg
d2FudCB0byBrbm93IGlmIHRoaXMgaXMgbmVjZXNzYXJ5LgpXZSBhbHNvIGhlc2l0YXRlZCBpZiBy
aXNjdiBpb21tdSBocG0gc2hvdWxkIGJlIHB1dCBpbnRvIGRyaXZlcnMvcGVyZiwKYW5kIGFjY29y
ZGluZyB0byB0aGUgZm9sbG93aW5ncywgd2UgZmluYWxseSBkZWNpZGVkIHRvIGtlZXAgaXQgaW4K
ZHJpdmVycy9pb21tdToKMS4gZHJpdmVycy9pb21tdSBoYXMgYWxyZWFkeSBhIGZvbGRlciBtYWlu
dGFpbmluZyBhbGwgSU9NTVUgc3R1ZmZzLgoyLiBkcml2ZXJzL2lvbW11IGhhcyBhbHJlYWR5IGRl
ZmluZWQgSFBNIHJlbGF0ZWQgcmVnaXN0ZXJzLgozLiBVbmxpa2UgUE1DRyBvZiBTTU1VIHdoaWNo
IGlzIGxvY2F0ZWQgaW4gYSBzZXBhcmF0ZSBuYW1lc3BhY2UsIFJJU0MtVgogICAgSU9NTVUgb25s
eSBkZWZpbmVzIDUgcmVnaXN0ZXJzIGluIHRoZSBzYW1lIGFkZHJlc3Mgc3BhY2UgYXMgaXRzCiAg
ICB0cmFuc2xhdGlvbiBzY2hlbWVzLgo0LiBGb3IgSFBNIHNjaGVtZXMgdGhhdCBpcyBub3QgYSBz
dGFuZGFsb25lIGRldmljZSwgSW50ZWwgaGFzIHB1dCBpdHMKICAgIHBlcmYgZHJpdmVyIHVuZGVy
IGRyaXZlcnMvaW9tbXUvaW50ZWwvcGVyZm1vbi5jLgoKQ2hlZXJzLApMdgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
