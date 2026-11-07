Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4B7606A331
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 22:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=avlX5LrI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WnnaW6MP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xjlyVcZD8JCBstwgWHnlCub+ATsbAp5FOdNGcutw9/w=; b=avlX5LrIcbfTJ0xxHbQYdKYUU+
	aPKPOQyqsK3sbyLmvTuhfuXZDiWkNd8KdN0MkLuCbd850/HhBGIJmFyiGhnZ3YQQgOnFkPf1bIj3h
	hxBLogiD1LszMJDwS/OhZLcKkTJDh7CjGogi5kkjfAdToh4Q9bBE1iig7mJZqNGpdSoa3CX8pIrWc
	UpDBXCeZtQ9EzLcIqqhO53rIFxpz7vyW+OiY+heoFugm97lL0CWnAIby6MXAs9ZqJsG6avd/9jDYN
	ECJPc0bO1H6iuk/IRtHANrpoYnoXZ/sFNsbIF5HdMFm1e0okztrcBpp5GuLFKHzuezh94jp7Cx63V
	UBFJf5Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPp9y-0000000FTtj-1Is0;
	Sat, 07 Nov 2026 22:45:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPp9x-0000000FTtR-1KFd;
	Sat, 07 Nov 2026 22:45:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B13D44466C;
	Sat,  7 Nov 2026 22:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4951F0089F;
	Sat,  7 Nov 2026 22:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794091516;
	bh=5Sg/QYc64KGsYlE8LxgBfqmE1GMl4mLlfKRfIL2XKbk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WnnaW6MPIQMe5PP2NqlUxaetG2uBm1miygWQ2RwaFHPcW743Qpf4SaYmS2T1W61ye
	 WtdLYYA4E71F2MSu+qlnK1gs3ILHqyGdT0fIPskWakrOfWSf75OrgTnIPXrPPbnDod
	 RcpTsR04TFbydLjDDwd7MPCIYTKMNw0PRvfh2SaPORn7p1LhhCmIWA1+NUUJlmZax0
	 E8mF6dwI4qrxmJn4dvjOc2AJqdOH8WXq9NMbU1SD6QAYbX5EaDHjYAttWMTX9DFOwC
	 dipLk31/oxxl8oL8kBrRhFzBxfDn15PRVa46dzLqpqkiTQAsjbCkyMrtEWMXA1h5cP
	 2SIHlV9PuGYRA==
From: Manivannan Sadhasivam <mani@kernel.org>
To: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
 jingoohan1@gmail.com, Hans Zhang <18255117159@163.com>
Cc: imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261028030652.2917756-1-18255117159@163.com>
References: <20261028030652.2917756-1-18255117159@163.com>
Subject: Re: [PATCH v5 00/16] PCI: dwc: Cache PCIe capability offset
Message-Id: <179409150473.143243.11323239293809371653.b4-ty@b4>
Date: Sun, 08 Nov 2026 04:15:04 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.16.0
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Ck9uIFdlZCwgMjggT2N0IDIwMjYgMTE6MDY6MzYgKzA4MDAsIEhhbnMgWmhhbmcgd3JvdGU6Cj4g
VGhlIERXQyBQQ0llIGNvcmUgYW5kIGl0cyBwbGF0Zm9ybSBkcml2ZXJzIHJlcGVhdGVkbHkgY2Fs
bAo+IGR3X3BjaWVfZmluZF9jYXBhYmlsaXR5KHBjaSwgUENJX0NBUF9JRF9FWFApIHRvIG9idGFp
biB0aGUgb2Zmc2V0IG9mIHRoZQo+IFBDSSBFeHByZXNzIENhcGFiaWxpdHkgc3RydWN0dXJlLCBp
bmNsdWRpbmcgaW4gcGF0aHMgdGhhdCBydW4gbW9yZSB0aGFuCj4gb25jZSBzdWNoIGFzIGxpbmsg
cG9sbGluZywgc3VzcGVuZC9yZXN1bWUgYW5kIGludGVycnVwdCBoYW5kbGVycy4KPiAKPiBBZGQg
YSBjYWNoZWQgcGNpZV9jYXAgZmllbGQgdG8gc3RydWN0IGR3X3BjaWUgYW5kIGEKPiBkd19wY2ll
X2dldF9wY2llX2NhcCgpIGhlbHBlciB0aGF0IHBlcmZvcm1zIHRoZSBsb29rdXAgb24gZmlyc3Qg
dXNlIGFuZAo+IGNhY2hlcyB0aGUgcmVzdWx0LCB0aGVuIGNvbnZlcnQgdGhlIGNvcmUgYW5kIHRo
ZSAxNCBwbGF0Zm9ybSBkcml2ZXJzCj4gdGhhdCB1c2UgUENJX0NBUF9JRF9FWFAuCj4gCj4gWy4u
Ll0KCkFwcGxpZWQsIHRoYW5rcyEKClswMS8xNl0gUENJOiBkd2M6IEFkZCBwY2llX2NhcCBmaWVs
ZCBhbmQgY2FjaGluZyBoZWxwZXIKICAgICAgICBjb21taXQ6IGQwMThmZjRiZTg5NjE5ODE4Mjhl
NzVhZmQzNmVlZjkwY2M1MjRjZDgKWzAyLzE2XSBQQ0k6IGR3YzogVXNlIGNhY2hlZCBQQ0llIGNh
cGFiaWxpdHkgb2Zmc2V0IGluIGNvcmUKICAgICAgICBjb21taXQ6IGY4M2E3YjU1NTE3MDEyNDk2
YmQ5NTM5ZmJiZGVlZWNmMGQxZTlmZjkKWzAzLzE2XSBQQ0k6IGR3YzogaW14NjogVXNlIGNhY2hl
ZCBQQ0llIGNhcGFiaWxpdHkgb2Zmc2V0CiAgICAgICAgY29tbWl0OiA4NDcyMzc0NTc2ZDMwMGQz
NmRlMjBhZDU5MmZkMWYzOTE4MWI4NWE4ClswNC8xNl0gUENJOiBkd2M6IGxheWVyc2NhcGUtZXA6
IFVzZSBjYWNoZWQgUENJZSBjYXBhYmlsaXR5IG9mZnNldAogICAgICAgIGNvbW1pdDogODc0Mjdj
YzlkNzExNTA4OGU5MmU4YzkyYzI4MmUyODQ4MWM5YjI2YgpbMDUvMTZdIFBDSTogZHdjOiBtZXNv
bjogVXNlIGNhY2hlZCBQQ0llIGNhcGFiaWxpdHkgb2Zmc2V0CiAgICAgICAgY29tbWl0OiA1M2Y5
ZWQzZDY4MDdjNmFhNzk5NDRlZDQyYjMzNjJhYTg5MTkyOTU2ClswNi8xNl0gUENJOiBkd2M6IHJv
Y2tjaGlwOiBVc2UgY2FjaGVkIFBDSWUgY2FwYWJpbGl0eSBvZmZzZXQKICAgICAgICBjb21taXQ6
IGJmNWMzZjQ5NzUwMTA3NTBjNTM1YjEyN2NiM2FiODE5NTFjN2ZmZDAKWzA3LzE2XSBQQ0k6IGR3
YzogZXN3aW46IFVzZSBjYWNoZWQgUENJZSBjYXBhYmlsaXR5IG9mZnNldAogICAgICAgIGNvbW1p
dDogMzg2YjlmYTQ5ZTI2YWZiZDc2ZDkzNGYxMzZmNjhiYzM1NTc5MWNlOApbMDgvMTZdIFBDSTog
ZHdjOiBmdTc0MDogVXNlIGNhY2hlZCBQQ0llIGNhcGFiaWxpdHkgb2Zmc2V0CiAgICAgICAgY29t
bWl0OiA2ZmJhNTU3YjgyZjQ5OTY3ODZkMTI2NzZmNTU0YWQxMmU2N2U0NmQ5ClswOS8xNl0gUENJ
OiBkd2M6IGludGVsLWd3OiBVc2UgY2FjaGVkIFBDSWUgY2FwYWJpbGl0eSBvZmZzZXQKICAgICAg
ICBjb21taXQ6IDAyMzA1YWQzYWQyZjkxOGFjMDA5ZThhZTRjMmRmOGMyYjExZGMwYmMKWzEwLzE2
XSBQQ0k6IGR3YzogcWNvbS1lcDogVXNlIGNhY2hlZCBQQ0llIGNhcGFiaWxpdHkgb2Zmc2V0CiAg
ICAgICAgY29tbWl0OiBjNDg5ZTEwMDhkZjhhNzQ1NjY4NmFiNjM3NTkzNTgyYmU2M2YxNGM5Clsx
MS8xNl0gUENJOiBkd2M6IHFjb206IFVzZSBjYWNoZWQgUENJZSBjYXBhYmlsaXR5IG9mZnNldAog
ICAgICAgIGNvbW1pdDogMzhhZjllZGE0OTE5OGIwYjJlM2Q5MDMyNGFmNmM1YjAwMTIzZDRlYwpb
MTIvMTZdIFBDSTogZHdjOiBzb3BoZ286IFVzZSBjYWNoZWQgUENJZSBjYXBhYmlsaXR5IG9mZnNl
dAogICAgICAgIGNvbW1pdDogMzI4YzZkNTA3Njk2ZWIzYjA3NWVmYTYyMzZjZGMxYzEyYTJhODAw
YwpbMTMvMTZdIFBDSTogZHdjOiBzcGFjZW1pdC1rMTogVXNlIGNhY2hlZCBQQ0llIGNhcGFiaWxp
dHkgb2Zmc2V0CiAgICAgICAgY29tbWl0OiBlZjJiYzU2ZjA5N2FhZmRlZWU3ZmNlYjY4ZDJjYTll
NGM2OTU2ZGJmClsxNC8xNl0gUENJOiBkd2M6IHNwZWFyMTN4eDogVXNlIGNhY2hlZCBQQ0llIGNh
cGFiaWxpdHkgb2Zmc2V0CiAgICAgICAgY29tbWl0OiBlYmQ5NjhmMjBjNjFiM2Q4NjE2NWQ5ZTFi
YzM4NzA0NGRjZjczNzA3ClsxNS8xNl0gUENJOiBkd2M6IHRlZ3JhMTk0OiBVc2UgY2FjaGVkIFBD
SWUgY2FwYWJpbGl0eSBvZmZzZXQKICAgICAgICBjb21taXQ6IDgwNzg5MjdiZjI3ODY2ZWNjNTI1
MTkxOWVjNmI0MTQ3OGFlNjIwYWMKWzE2LzE2XSBQQ0k6IGR3YzogdWx0cmFyaXNjOiBVc2UgY2Fj
aGVkIFBDSWUgY2FwYWJpbGl0eSBvZmZzZXQKICAgICAgICBjb21taXQ6IDY0ZTJlNTQyMzhkYzFh
NjNkNGM4YmQ4MjdkMTQwYmRmZmVmMDU0MDMKCkJlc3QgcmVnYXJkcywKLS0gCuCuruCuo+Cuv+Cu
teCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
