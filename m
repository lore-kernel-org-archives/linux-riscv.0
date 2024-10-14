Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A90D16261
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 13:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=L0ovpJduLi7oYDF/QQWfkSyVIQkxB027P2+uQamb6e8=; b=tw/CkujDxnkRiB
	cm+9RfuDx+XSAyN6ZmHxWwh5aGrvIeFtp5H7GVaPBX6jQpeylDD37NKcrSF8QvBCWyA2pjbDwY1Z2
	fdeToHrfv8E9nkGNJO31/ofH+pzNeIwCsGzTtarumqRx/ZXld53WTRZ4QB8s0upo7zc2vcW7NQOfO
	7zVWxLA9Tm1i2y2m3S6tOtcQwp2Zo6ut3F6syShV2DTGj3UqJfPBaBtc7JvNlaoUVlQUZy2iTCKn4
	oX92XiTAww91GO0+iT2P/dCMmBuku7wCQCD0nHoJd3m8tIxEh280CQNO28g08kREvb0cgKXhi4Klt
	W0QoNxl5TstuIDYFNmeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0LHp-00000005Jyt-0MNr;
	Mon, 14 Oct 2024 13:39:01 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0KHC-000000055vy-31pK
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 12:34:22 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20241014123410euoutp025cce87d96766c2b03cc408f0750f1623~_Uc23zF6z1583215832euoutp02z
	for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 12:34:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20241014123410euoutp025cce87d96766c2b03cc408f0750f1623~_Uc23zF6z1583215832euoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728909250;
	bh=RxjT3EdAm9IfbZlO07dZ0QJ2+iDgnYJWJxUqUfU4SVU=;
	h=From:To:Cc:Subject:Date:References:From;
	b=akTXcsLGvlkkSMERyla3/kpB9BV9AEKHMBnUVqXK2a4CsKd7UJigLCYlDrfLOdis2
	 LyW+upmkX6GKpjAOt6QpQFxhqDGV0NWBU7vbgideljUlESrz6qKnhnfhMUb6dxi/pF
	 zRN8w3mht2i/EqdT4AtrcuS6q3lpH7JlfBlIP76I=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20241014123410eucas1p2de2e962ef1a6bacd3bed1bd0b5a8db31~_Uc2eRl5d1540015400eucas1p2Q;
	Mon, 14 Oct 2024 12:34:10 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id DC.01.09875.2CF0D076; Mon, 14
	Oct 2024 13:34:10 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20241014123409eucas1p2a3a3f085c0630073326ca299a870f3ee~_Uc1utgiM0434804348eucas1p2F;
	Mon, 14 Oct 2024 12:34:09 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241014123409eusmtrp2f130e8599db8cffdbbe1d08ac3473b85~_Uc1t8iOV2056020560eusmtrp2w;
	Mon, 14 Oct 2024 12:34:09 +0000 (GMT)
X-AuditID: cbfec7f4-131ff70000002693-76-670d0fc264f1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id CE.21.14621.1CF0D076; Mon, 14
	Oct 2024 13:34:09 +0100 (BST)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241014123408eusmtip13736174d0628a4ab24e6670b41ca98af~_Uc07rt2M1142111421eusmtip1c;
	Mon, 14 Oct 2024 12:34:08 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, m.szyprowski@samsung.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v4 0/3] Introduce support for T-head TH1520 Mailbox
Date: Mon, 14 Oct 2024 14:33:11 +0200
Message-Id: <20241014123314.1231517-1-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIKsWRmVeSWpSXmKPExsWy7djPc7qH+HnTDfatEbfY+nsWu8WaveeY
	LOYfOcdqce/SFiaLF3sbWSyurZjLbvFy1j02i8u75rBZbPvcwmax9shddov1X+czWby83MNs
	0TaL3+L/nh3sFi37p7A48Hu8efmSxeNwxxd2j52z7rJ7bFrVyeaxeUm9R8vaY0we7/ddZfPo
	27KK0eNS83V2j8+b5AK4orhsUlJzMstSi/TtErgyjl/8z1ZwWbxiyem/rA2ML4S6GDk4JARM
	JPbu9Oti5OIQEljBKNH3fDojhPOFUeLD7qfsEM5nRokFS+6xdTFygnXMunEGKrGcUeLY/SVs
	EM4bRokTbR9ZQKrYBIwkHiyfzwqSEBF4xygx6dptJhCHWaCXUWLq3plMIFXCAs4Snyc/YQax
	WQRUJX5//A3WzStgL7Gn5yA7xD55if0HzzJDxAUlTs58AlbDDBRv3jqbGWSohMB0Tonlt9aw
	QjS4SPw42At1rLDEq+NboAbJSPzfOZ8Jws6XeLD1EzOEXSOxs+c4lG0tcefcLzZQ0DALaEqs
	36UPEXaUWDJjNhMkxPgkbrwVhDiBT2LStunMEGFeiY42IYhqNYmpPb1wS8+t2Aa11EPi5dmf
	YIcJCcRKvP8ylXECo8IsJI/NQvLYLIQbFjAyr2IUTy0tzk1PLTbKSy3XK07MLS7NS9dLzs/d
	xAhMdaf/Hf+yg3H5q496hxiZOBgPMUpwMCuJ8L6fypkuxJuSWFmVWpQfX1Sak1p8iFGag0VJ
	nFc1RT5VSCA9sSQ1OzW1ILUIJsvEwSnVwDT797QbD61Uvge3rS/Zfyx1b/XsVaKXrCYbKi7h
	jRaYMTtn2V7H1btk/igkhvJqBJ9dq3BywayWCwprrJMKvVmyyiJu8vqwGunKf9NKWxv3qnGy
	5VT/pq/eFlP/rLl7kXXJh/Cm6su75L5nyM/h67d3D10qK+sTEfr16HY3loULlv6/1/L51ty/
	sTsSfRcV6uj+vTplSVfbnJXtezWvp8hzxhR/vfC2R/rj5hnTuW0LL+ZFLnp2quvJHA22fI5I
	LbOmrEm5cg+WSl9xTXze8EtH8dOS96r+V2+m/jpi4nz1GMOZbSs+telLOOWaFU6yYXimxmxu
	b3xiesBv0a//X/btfN+mvejn2rVHdgVv//1FiaU4I9FQi7moOBEAFrupUOQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRmVeSWpSXmKPExsVy+t/xu7oH+XnTDT4uVrXY+nsWu8WaveeY
	LOYfOcdqce/SFiaLF3sbWSyurZjLbvFy1j02i8u75rBZbPvcwmax9shddov1X+czWby83MNs
	0TaL3+L/nh3sFi37p7A48Hu8efmSxeNwxxd2j52z7rJ7bFrVyeaxeUm9R8vaY0we7/ddZfPo
	27KK0eNS83V2j8+b5AK4ovRsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1s
	UlJzMstSi/TtEvQyjl/8z1ZwWbxiyem/rA2ML4S6GDk5JARMJGbdOMPexcjFISSwlFHiW+8f
	VoiEjMS17pcsELawxJ9rXWwQRa8YJSbOn8EEkmATMJJ4sHw+K0hCROAPo8T1Z28YQRxmgYmM
	Ejfn3mcEqRIWcJb4PPkJM4jNIqAq8fvjb7CxvAL2Ent6DrJDrJCX2H/wLDNEXFDi5MwnQDUc
	QIPUJdbPAzuVGaikeets5gmM/LOQVM1CqJqFpGoBI/MqRpHU0uLc9NxiQ73ixNzi0rx0veT8
	3E2MwJjcduzn5h2M81591DvEyMTBeIhRgoNZSYT3/VTOdCHelMTKqtSi/Pii0pzU4kOMpkBX
	T2SWEk3OByaFvJJ4QzMDU0MTM0sDU0szYyVxXrfL59OEBNITS1KzU1MLUotg+pg4OKUamISf
	c0oY+pVp92XPcze8un/CM+32zO7rP/WX/t1n/mj153gLOy3upT/K55wWe3Xyy7dD7yMnJH3a
	ftfx2BWhzmP7Fjjv8VPwPO38dyqXmDavId/PG8mcO59eqHr7f1XzohNvVM0f/MpniDLh38dS
	dvH/R8Xvr93lVj9qattgFyWlZjl7jVKOkM9U99kVyjdvHS6w//90YpLu7srn616dvhLSOW/i
	G3vO+2GVNaLp+TWsE2d4SFpr3ihQYHj6uThFQf7PbxPRHy+MnGMPXUluzmgqmXXz6mFWq8I5
	JW17Jiz/Kt1608SxfJ64yJ0Nm71t5OcemWM0WTY9qkWPJUXXXb7o4os5LM3vFwok6Au3TVVi
	Kc5INNRiLipOBACmqlypUgMAAA==
X-CMS-MailID: 20241014123409eucas1p2a3a3f085c0630073326ca299a870f3ee
X-Msg-Generator: CA
X-RootMTR: 20241014123409eucas1p2a3a3f085c0630073326ca299a870f3ee
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241014123409eucas1p2a3a3f085c0630073326ca299a870f3ee
References: <CGME20241014123409eucas1p2a3a3f085c0630073326ca299a870f3ee@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_053420_865041_47083591 
X-CRM114-Status: GOOD (  17.95  )
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

VGhlIFQtaGVhZCBUSDE1MjAgU29DIHN1cHBvcnRzIGEgaGFyZHdhcmUgbWFpbGJveCB0aGF0IGVu
YWJsZXMgdHdvIGNvcmVzCndpdGhpbiB0aGUgU29DIHRvIGNvbW11bmljYXRlIGFuZCBjb29yZGlu
YXRlIFsxXS4gT25lIGV4YW1wbGUgb2Ygc3VjaApjb29yZGluYXRpb24gd291bGQgYmUgY29vcGVy
YXRpb24gd2l0aCB0aGUgVC1IZWFkIEU5MDIgY29yZSwgd2hpY2ggaXMKcmVzcG9uc2libGUgZm9y
IHBvd2VyLCBjbG9jaywgYW5kIHJlc291cmNlIG1hbmFnZW1lbnQuIEZvciBleGFtcGxlLCBpbgp0
aGUgc3BlY2lmaWMgY2FzZSBvZiB0aGUgQlhNLTQtNjQgR1BVLCBpdCBuZWVkcyB0byBiZSBwb3dl
cmVkIG9uIGJ5IHRoZQpFOTAyIGNvcmUsIGFuZCB0aGUga2VybmVsIHJ1bm5pbmcgb24gdGhlIEU5
MTAgbmVlZHMgdG8gJ2FzaycgdGhlCmZpcm13YXJlIHJ1bm5pbmcgb24gdGhlIEU5MDIgY29yZSB0
byBlbmFibGUgcG93ZXIgdG8gdGhlIEdQVSBpc2xhbmQuCkdpdmVuIHJlY2VudCBhZHZhbmNlbWVu
dHMgaW4gd29yayBvbiB0aGUgdXBzdHJlYW0gR1BVIGRyaXZlciBbMl0sIHRoZXJlCmlzIGFuIGVt
ZXJnaW5nIG5lZWQgdG8gZ2V0IHRoaXMgY29kZSBpbiB0aGUgbWFpbmxpbmUga2VybmVsLgoKTGlu
azogaHR0cHM6Ly9vcGVuYmVhZ2xlLm9yZy9iZWFnbGV2LWFoZWFkL2JlYWdsZXYtYWhlYWQvLS9i
bG9iL21haW4vZG9jcy9USDE1MjAlMjBTeXN0ZW0lMjBVc2VyJTIwTWFudWFsLnBkZiBbMV0KTGlu
azogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2ltYWdpbmF0aW9uL2xpbnV4LWZpcm13
YXJlLy0vaXNzdWVzLzEgWzJdCgpUaGFua3MsIEtyenlzenRvZiBhbmQgUm9iLCBmb3IgeW91ciBy
ZXZpZXchIFNpbmNlIHRoaXMgc2VyaWVzIGlzIGdhaW5pbmcKc29tZSBpbnRlcmVzdCwgSSd2ZSBk
cm9wcGVkIHRoZSBSRkMgcHJlZml4IHdpdGggdGhlIHYzIHVwZGF0ZS4KCnY0OgotIGZpeGVkIHdh
cm5pbmcgb2YgdW51c2VkIHZhcmlhYmxlCi0gYWRkZWQgUmV2aWV3ZWQtYnkgZnJvbSBLcnp5c3p0
b2YKLSBmaXhlZCBtaW5vciBjb3NtZXRpYyBpc3N1ZXMgaW4gZHQtYmluZGluZwoKdjM6Ci0gYWRk
ZWQgYSBjb21tZW50IGFib3V0IG1peGluZyBkZXZtXyBhbmQgbm9uLWRldm0gcmVzb3VyY2VzIGlu
IHRoZSBjb250ZXh0CiAgb2Ygc2hhcmVkIGludGVycnVwdHMgYW5kIGV4cGxhaW5lZCB3aHkgaXQn
cyBzYWZlIHRvIGRvIHNvIGluIHRoaXMKICBwYXJ0aWN1bGFyIGNhc2UKLSBjaGFuZ2VkIHRoZSBv
cmRlciBvZiByZXNvdXJjZSBmcmVlaW5nIGluIHRoZSAuc2h1dGRvd24gY2FsbGJhY2sKLSB1c2Vk
IGEgd3JhcHBlciBmdW5jdGlvbiBmb3IgcmVnaXN0ZXIgbWFwcGluZwotIHNpbmNlIHRoZSBvbmx5
IGNvbmNlaXZhYmxlIHVzZSBjYXNlIGZvciB0aGlzIG1haWxib3ggZHJpdmVyIGlzCiAgY29tbXVu
aWNhdGlvbiB3aXRoIGNvcmVzIG5vdCBtYW5hZ2VkIGJ5IHRoZSBrZXJuZWwsIEnigJl2ZSBoYXJk
LWNvZGVkCiAgdGhpcyBieSByZW1vdmluZyB0aGUgdGhlYWQsaWN1LWNwdS1pZCBwcm9wZXJ0eSBh
bmQgYWRqdXN0ZWQgdGhlIG1haWxib3gKICBkcml2ZXIgY29kZSBhY2NvcmRpbmdseS4KLSBhZGRl
ZCBhIG1vcmUgZGV0YWlsZWQgZGVzY3JpcHRpb24gZm9yIG1ib3gtY2VsbHMuCi0gbWFkZSBzb21l
IGNvc21ldGljIGNoYW5nZXMuCi0gcmV0ZXN0ZWQgYnkgYXBwbHlpbmcgdGhlIHBhdGNoIHdpdGgg
bm9uLXlldC11cHN0cmVhbWVkIHBhdGNoZXMsCiAgY29uZmlybWluZyB0aGF0IHRoZSBkcm0vaW1h
Z2luYXRpb24gZHJpdmVyIGNhbiByZWFkIHRoZSByZWdpc3RlcnMKICBjb3JyZWN0bHkuCgp2MjoK
IC0gZml4ZWQgdGhlYWQsdGgxNTIwLW1ib3gueWFtbCBiaW5kaW5nIGZpbGUgYnkgZHJvcHBpbmcg
cmVkdW5kYW50CiAgIGRlc2NyaXB0aW9ucywgcmVuYW1pbmcgcmVnLW5hbWVzLCByZW1vdmluZyB1
bm5lY2Vzc2FyeSBjbG9ja3MsCiAgIHByb3ZpZGluZyBjb25zdHJhaW50cyBhbmQgZGVmaW5pbmcg
SUNVJ3MKIC0gZml4ZWQgdGhlIG1haWxib3ggZHJpdmVyIGNvZGUgdG8gd29yayB3ZWxsIHdpdGgg
dXBkYXRlZCBiaW5kaW5nLWZpbGUsCiAgIHJlbW92ZWQgY2xvY2tzIHN1cHBvcnQsIGFzIGl0J3Mg
bm90IG5lY2Vzc2FyeSBmb3IgbWFpbGJveCB0byB3b3JrCiAtIGFkanVzdGVkIHRoZSBkZXZpY2Ug
dHJlZSBub2RlIGluc3RhbmNlIG9mIG1ib3hfOTEwdCBzbyBpdCB3aWxsIHdvcmsKICAgd2l0aCB1
cGRhdGVkIGJpbmRpbmdzIGZpbGUKCk1pY2hhbCBXaWxjenluc2tpICgzKToKICBtYWlsYm94OiBJ
bnRyb2R1Y2Ugc3VwcG9ydCBmb3IgVC1oZWFkIFRIMTUyMCBNYWlsYm94IGRyaXZlcgogIGR0LWJp
bmRpbmdzOiBtYWlsYm94OiBBZGQgdGhlYWQsdGgxNTIwLW1haWxib3ggYmluZGluZ3MKICByaXNj
djogZHRzOiB0aGVhZDogQWRkIG1haWxib3ggbm9kZQoKIC4uLi9iaW5kaW5ncy9tYWlsYm94L3Ro
ZWFkLHRoMTUyMC1tYm94LnlhbWwgICB8ICA4MCArKysKIE1BSU5UQUlORVJTICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArCiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFk
L3RoMTUyMC5kdHNpICAgICAgICAgfCAgMTIgKwogZHJpdmVycy9tYWlsYm94L0tjb25maWcgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDEwICsKIGRyaXZlcnMvbWFpbGJveC9NYWtlZmlsZSAgICAg
ICAgICAgICAgICAgICAgICB8ICAgMiArCiBkcml2ZXJzL21haWxib3gvbWFpbGJveC10aDE1MjAu
YyAgICAgICAgICAgICAgfCA1NzIgKysrKysrKysrKysrKysrKysrCiA2IGZpbGVzIGNoYW5nZWQs
IDY3OCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21haWxib3gvdGhlYWQsdGgxNTIwLW1ib3gueWFtbAogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvbWFpbGJveC9tYWlsYm94LXRoMTUyMC5jCgotLSAKMi4zNC4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
