Return-Path: <SRS0=J1nd=QV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 957F7C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 05:00:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B64F7222C9
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 05:00:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jxdtB5GJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cZy9SDpJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B64F7222C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Date:Message-ID:
	In-Reply-To:To:From:Subject:Mime-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EXXZ+2NV/5e864XARS++5VXn+ChwN/v7bOf7YXUB1RM=; b=jxdtB5GJtb/BCF
	O/8csQj3LVzOkaBpqJLsFzxsWNq2zMZ93Zdn1PJ+/bohT0a93QEIoKsWbOAaeRHSHcb2LEyU0Q9VI
	CPtHosGDAI7j+UvDfsyPthwaM2RL6GPcV9wkVX7t7IWAZV/16ZEJ68/POA8Ds92+zC2XBUk/+LVTe
	tQTAS4IP2aXTjmfQMZUkmKzjU/y+a91bNhvBxE/vjH77xtE4SLQ1VsPPW9idfYkaXDacYAjc4aCPh
	B7aRAGErag2Q8oZG3WdQq0GzPvdvx/ckookwdjx8n/54E9YjXOArQIk8OmUUkjmlQhoUcuD8UitVv
	tNiUMjipC22KXWVUUdUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gu98A-0000og-RO; Thu, 14 Feb 2019 05:00:14 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gu986-0000hk-Vz
 for linux-riscv@lists.infradead.org; Thu, 14 Feb 2019 05:00:13 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20190214050007epoutp039ab6668a88468a9e15f9d96ec72529d3~DIkwmCMdK2897728977epoutp03C
 for <linux-riscv@lists.infradead.org>; Thu, 14 Feb 2019 05:00:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20190214050007epoutp039ab6668a88468a9e15f9d96ec72529d3~DIkwmCMdK2897728977epoutp03C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1550120407;
 bh=F8YM528KelIj1eFihOY1iV7CQ1dPgc9DCXWq79BTBvw=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=cZy9SDpJEAollU4RALDtcRbKUoXU5GTFVjJd+1h0uxO7VuFpJtz6spiIsXMxMOtNZ
 xmbdGREz+vCRbisnp0YrPVFvB2pcnJI/PBVNzH4v5MsXs2CjfrxQW0olUaQDkrl5Eo
 6MWEmfRc2fQ0dBykpZOjaFAMTRY/8ERPxQwkx4f0=
Received: from epsmges5p2new.samsung.com (unknown [182.195.40.195]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20190214050004epcas5p3398b5697205c90ce8654d2012a41ef49~DIkuPGqvl2349323493epcas5p39;
 Thu, 14 Feb 2019 05:00:04 +0000 (GMT)
X-AuditID: b6c32a4a-aefff70000001029-59-5c64f5d4754f
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 3D.1A.04137.4D5F46C5; Thu, 14 Feb 2019 14:00:04 +0900 (KST)
Mime-Version: 1.0
Subject: RE: Re: [PATCH v4 6/6] RISC-V: Free-up initrd in free_initrd_mem()
From: CHANDAN VN <chandan.vn@samsung.com>
To: Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20190213180557.GA15270@rapoport-lnx>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20190214050004epcms5p4d2157380c40e9b218fb0eeb376b3cb7c@epcms5p4>
Date: Thu, 14 Feb 2019 10:30:04 +0530
X-CMS-MailID: 20190214050004epcms5p4d2157380c40e9b218fb0eeb376b3cb7c
CMS-TYPE: 105P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCJsWRmVeSWpSXmKPExsWy7bCmlu6VrykxBpv2KVo8+TCRzWLr71ns
 FotWfGexOD1hEZPFyj0/mCwu75rDZrHtcwubxeYJC1gt2mbxW9yY0sBm8fLjCRYHbo8189Yw
 ehzu+MLusXmFlseERQcYPTYvqfd4v+8qm8el5uvsHp83yXm0H+hmCuCMyrHJSE1MSS1SSM1L
 zk/JzEu3VfIOjneONzUzMNQ1tLQwV1LIS8xNtVVy8QnQdcvMAbpVSaEsMacUKBSQWFyspG9n
 U5RfWpKqkJFfXGKrlFqQklNgaFSgV5yYW1yal66XnJ9rZWhgYGQKVJmQk7Hsz1v2gt2iFftn
 rWZpYHwn0sXIySEhYCJx/8dDpi5GLg4hgd2MEqunz2LtYuTg4BUQlPi7QxikRljAW2JFz0F2
 EFtIQEHiyJu1LBBxbYmuw2/AbDYBTYkT86aB1YgI+EusvfqXHWQms0A3s8SOfzeZIZbxSsxo
 f8oCYUtLbF++lRHE5hQwktix+DwTRFxU4ubqt+ww9vtj8xkhbBGJ1ntnoeYISjz4uZsRZs6K
 tVtYQJZJCLQzSqy4s5AJwpnAKNG3aAtUh7nE45ubwTbwCvhKzL77lQ3EZhFQlZgxcwPURS4S
 Z/5/AoszA722bOFrZlBIMAO9tn6XPkSYT6L39xMmmGd2zIOxVST+vV4KZUtJXLzyDcr2kJh5
 aBULJHTPMklc2beJZQKj/CxEAM9Csm0WwrYFjMyrGCVTC4pz01OLTQuM8lLLkaN1EyM4xWp5
 7WBcds7nEKMAB6MSD2+FUEqMEGtiWXFl7iFGCQ5mJRFexY9AId6UxMqq1KL8+KLSnNTiQ4ym
 QH9PZJYSTc4Hpv+8knhDUyMzMwNLA1NjCzNDJXHeubJzo4UE0hNLUrNTUwtSi2D6mDg4pRoY
 E5InTVVrmyR6VY01oW/ifufAh5XXZq10cxNkvLNOSyf1VVtD4aIn3rw+mywMpefPipPZdaii
 KZM17XG4QIyV/sWgtpPBOzIypi18lP8o5v2C4/sOVU/dcSwv4c+mCZevGH/dtFyp84l9jaNm
 UPBk9ai3hxWcYjYH3jP79335qrXdUedq4vR8lFiKMxINtZiLihMB0At0H8cDAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190213180621epcas4p44685b5689a3fcfbe63453e808f502548
References: <20190213180557.GA15270@rapoport-lnx>
 <20190213063127.28703-1-anup.patel@wdc.com>
 <20190213063127.28703-7-anup.patel@wdc.com>
 <20190213064419.GA27012@infradead.org> <20190213073835.GA18267@rapoport-lnx>
 <20190213175415.GA11635@infradead.org>
 <CGME20190213180621epcas4p44685b5689a3fcfbe63453e808f502548@epcms5p4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_210011_378470_9072EF63 
X-CRM114-Status: GOOD (  11.48  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: chandan.vn@samsung.com
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 Will Deacon <will.deacon@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Laura Abbott <labbott@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

SGksCgo+IE9uwqBXZWQswqBGZWLCoDEzLMKgMjAxOcKgYXTCoDA5OjU0OjE1QU3CoC0wODAwLMKg
Q2hyaXN0b3BowqBIZWxsd2lnwqB3cm90ZToNCj4gPsKgT27CoFdlZCzCoEZlYsKgMTMswqAyMDE5
wqBhdMKgMDk6Mzg6MzZBTcKgKzAyMDAswqBNaWtlwqBSYXBvcG9ydMKgd3JvdGU6DQo+ID7CoD7C
oG1lbWJsb2NrX2ZyZWUoKcKgaXPCoGhhc8Kgbm/CoHJlYWzCoGVmZmVjdMKgYXTCoHRoaXPCoHBv
aW50LMKgbm/CoGlkZWHCoHdoecKgYXJtNjQNCj4gPsKgPsKgY2FsbHPCoGl0Lg0KPiA+wqANCj4g
PsKgTG9va3PCoGxpa2XCoHRoZcKgY2FsbMKgd2FzwqBhZGRlZMKgZmFpcmx5wqByZWNlbnRsecKg
Ynk6DQo+ID7CoA0KPiA+wqBjb21taXTCoDA1YzU4NzUyZjlkY2UxMWUzOTY2NzZlYjczMWE2MjA1
NDE1OTBlZDANCj4gPsKgQXV0aG9yOsKgQ0hBTkRBTsKgVk7CoDxjaGFuZGFuLnZuQHNhbXN1bmcu
Y29tPg0KPiA+wqBEYXRlOsKgwqDCoE1vbsKgQXBywqAzMMKgMDk6NTA6MTjCoDIwMTjCoCswNTMw
DQo+ID7CoA0KPiA+wqDCoMKgwqDCoGFybTY0OsKgVG/CoHJlbW92ZcKgaW5pdHJkwqByZXNlcnZl
ZMKgYXJlYcKgZW50cnnCoGZyb23CoG1lbWJsb2NrDQo+ID7CoA0KPiA+wqB3aGljaMKgY2xhaW1z
wqBpdMKgaXPCoHRvwqB3b3JrwqBhcm91bmTCoHRoZcKgaW5pdHJkwqBiZWluZ8KgZGlzcGxheWVk
wqBpbg0KPiA+wqAvc3lzL2tlcm5lbC9kZWJ1Zy9tZW1ibG9jay9yZXNlcnZlZC4NCj4gPsKgDQo+
ID7CoEnCoHJlYWxsecKgdGhpbmvCoHdlwqBuZWVkwqB0b8KgaGF2ZcKgY29tbW9uwqBiZWhhdmlv
csKgdGhlcmXCoC3CoGVpdGhlcsKgZG/CoHRoaXMNCj4gPsKgZm9ywqBhbGzCoGFyY2hpdGVjdHVy
ZXPCoG9ywqBub25lLsKgwqBJJ3ZlwqBqdXN0wqBzZW50wqBhwqBzZXJpZXPCoHRoYXQNCj4gPsKg
Y29uc29saWRhdGVzwqBhbGzCoGJ1dMKgYcKgaGFuZGZ1bMKgb2bCoHRoZcKgZnJlZV9pbml0cmRf
bWVtLMKgc2/CoGltcGxlbWVudGluZw0KPiA+wqBhbnnCoGNvbW1vbsKgYmVoYXZpb3LCoG9uwqB0
b3DCoG9mwqB0aGF0wqB3b3VsZMKgYmXCoGdvb2QuDQo+wqANCj4gSSd2ZcKganVzdMKgc3RhcnRl
ZMKgdG/CoGxvb2vCoGludG/CoGl0wqB0b2RhecKgOikNCj4gSSdsbMKgcmVwbHnCoG9uwqB0aGF0
wqB0aHJlYWQuDQoNCklOSVRSRCByZXNlcnZlZCBhcmVhIGVudHJ5IGlzIG5vdCByZW1vdmVkIGZy
b20gbWVtYmxvY2sNCmV2ZW4gdGhvdWdoIGluaXRyZCByZXNlcnZlZCBhcmVhIGlzIGZyZWVkLiBU
aGUgc2FtZSBjYW4gYmUNCmNoZWNrZWQgZnJvbSAvc3lzL2tlcm5lbC9kZWJ1Zy9tZW1ibG9jay9y
ZXNlcnZlZC4NCldlIGRpZCBub3QgZmFjZSB0aGlzIGlzc3VlIG9uIGFybTMyIGFyY2hpdGVjdHVy
ZS4NClRob3VnaCB0aGUgY2hhbmdlcyB3aGljaCBpIGhhZCBzdWJtaXR0ZWQgZG9lcyBub3QgZml4
IGFueSBtZW1vcnkgbGVhaywNCml0IGRvZXMgbWFrZSBzdXJlIHRoYXQgdGhlIGVudHJpZXMgZnJl
ZWQgZnJvbSBtZW1ibG9jayBhcmUgYWN0dWFsbHkgcmVtb3ZlZA0KZnJvbSB0aGUgc3lzIGVudHJ5
IGFzIHdlbGwuIA0KQWxzbyB0aGUgaW1wbGVtZW50YXRpb24gb2YgYXJtNjQgaXMgcXVpdGUgZGlm
ZmVyZW50IGZyb20gYXJtMzIuIEkgZmVlbCBhIGdlbmVyaWMgDQppbXBsZW1lbnRhdGlvbiBjYW4g
YmUgdGFrZW4gdXAgb25seSBpZiBpdHMgYSByZWFsIG5lY2Vzc2l0eS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
