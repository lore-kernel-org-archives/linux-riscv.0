Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C91FF60CE
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 06:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y7WRQYLpnNGWms3O7vKrKfslfJhfW17KTaDzVCcGqaU=; b=hVyH6myjF4OlIc
	U3fRyCGKjhAc+4+/kV4bHC/slI8RyK+p5pv6PY8fdGzIJtubRQDw9EuAmrayIBSVYZNAK2/SS1xux
	YVtqkWVlfSllotl0aZRE+4YytY0N7LwKjTsIa0NhWpFpkmDUPPj9xHsF5/Jyd3UgSdCGExkkSp63i
	+IFfW0YzasL/PLvGwuzBvdEUHim0qNCoQEjh457yV+SIQ4TcKEZE5r8TdOQY7EDvoOG64SoAX2p4C
	jqBfuk84EzmQ1vgIIDy7WB5+5bZHbnKxyMel9uNsBhG7PjsY9VwIH+0QQz/M8ffMqGid4h4BxKnC1
	KJXbWJ2uEmip0GXEdXpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7SYU-0000000CMmU-3LKQ;
	Tue, 31 Mar 2026 06:26:26 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7SYM-0000000CMFL-0O24
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 06:26:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774938297;
	bh=evd1KGOp3v60RJusgfOWkdX/AzKDwinO9+CXd1sT7bs=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=uk5JBrs/ab2qJy9M+OCpT9UPxXlstJ5DYpLYY2W28tQpi6lbtOQhzkx61FNiBgtwi
	 5UuXeF5LWgcG8/HsCobM9W+/sADFFUzwh9GE1qBXkksRPqGm/OxNMIeG1NBEo/hDD4
	 2eCZEndC/bMk2/nuvuKAtMM2ydoc9gV+TCWI3ye8=
X-QQ-mid: esmtpsz11t1774938294tb566c15d
X-QQ-Originating-IP: 0i6M9Z/bUDYoUa/H8znOzdZxa3wvQzHyTrhng4juzec=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 31 Mar 2026 14:24:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13136377230614588610
EX-QQ-RecipientCnt: 19
Mime-Version: 1.0
Date: Tue, 31 Mar 2026 14:24:52 +0800
Message-Id: <DHGR42QJK86L.10IAY9CB3RZH5@linux.spacemit.com>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Emil Renner Berthing"
 <kernel@esmil.dk>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Michael Opdenacker"
 <michael.opdenacker@rootcommit.com>, "Guodong Xu" <guodong@riscstar.com>,
 "Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, "Yangyu Chen"
 <cyy@cyyself.name>, <spacemit@lists.linux.dev>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: riscv: spacemit: add
 deepcomputing,fml13v05
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: =?utf-8?q?=E6=9B=B9=E7=8F=8A=E7=8F=8A?= <sandie.cao@deepcomputing.io>,
 "Yixun Lan" <dlan@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
 <20260331034539.67167-1-sandie.cao@deepcomputing.io>
 <20260331060344-GKA976850@kernel.org>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.d811f619.24b1.431f.ad4d.c0bae1097eb9@feishu.cn>
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.d811f619.24b1.431f.ad4d.c0bae1097eb9@feishu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NfykWmRlrd2oK2NtemDo9thoJdzdXmdeBXK5z/W6L5po0CIZ0uCi3C/o
	FYQMu5iMe0qld53lfgYFWamL6zDGjNZYPSWnydEehsqHlnKGnfNW1/bRs1d2Koi7Dex0i7l
	Mn11RdLVuKc7x35NZDkjMeHUbjgys3th881abUbUiPfPKDCTCzGboSz51cniaXWsw2nczSL
	e5/PmdtfmGY5MUc/WmkTRKxqM4ROhSMOn4NNzV4xyEhhELIrLPesXtbxMmy8K9Zl+Y/PRiE
	Yk4RCsfLmc9JlckC6YBAZpA6LOGQ034rtQPBeSx1fxXhjmBRubuRFxbguzGNfvUerSmo9Qq
	r8FdVZe3/I+mtoauHM9UVjizLzN2M6cpDiNTEC+cdJlYP4w+z5JKwKYsrtujdI0QZA7eBF+
	/lrXMs7VvbVOzo/54TUHmtqZ9s/tiKC/K1IjHUBjFnT//82JMwgjIsghpluERJRftph79pm
	/zSbyjDtlaQJb/TFzJoLRCFK2b9R3Xs7cBeZV1pLA7j6CDm2tKgehYu+Ful3m/7AFBvQOx6
	u+j0PwOGGZHBWy8pDm1CA5P0MnBAMo9kf/5EAgWjtxJlxrBK1rzUHQYsC6WEaWoSmXcIV5A
	fgQAia6f4HBPFOykt00sRAQrY69ZLwo16OryaDBNf9ls2Zdmriq2PFh8ewi64Al0mJ80Yzy
	eJphvahz6fXkX3o1JyRp1kwMwjpUrZKBPiVMiPSCTFmZiUU47WNIgtFH2WHZMWgsWr40rm/
	r6Ir5UCVoO3LxaWROMHzD+8IQrj1iLK32qBRo1D9myvHVm6Z4hCjr6wBeeExyKei82PjtkP
	BFZUL39N9ZZ4bYqnj0D3PjW6QWPb8fdm3cQ5wpJd7sYrODAjLY74MfUk2PsJ1LSEdHSJ0HQ
	i73GOIXcRoi40iV6ILz9Yb0688oIpq6kraydZF8Pcdc7u0rfRcwiVnOHIberJMeoPKqtV9b
	wISmDvQ9wGR56uSXgwEc0jS8XhOlJtf21tPBhS7i4G0musT+ufMi0Id8C7dp8RwXSjsrlxU
	ZrNeopkUBdRNyiCiETl8m89WYEdQ7RVRw+ru3ZzPj7+aObUkcVU97OBF63xfI=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_232618_941949_DD8C328F 
X-CRM114-Status: UNSURE (   3.58  )
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

T24gVHVlIE1hciAzMSwgMjAyNiBhdCAyOjE1IFBNIENTVCwg5pu554+K54+KIHdyb3RlOgo+Cj4+
IEZyb206ICJZaXh1biBMYW4iPGRsYW5Aa2VybmVsLm9yZz4KPj4gRGF0ZTrCoCBUdWUsIE1hciAz
MSwgMjAyNiwgMTQ6MDMKPj4gU3ViamVjdDrCoCBSZTogW1BBVENIIHYxIDEvMl0gZHQtYmluZGlu
Z3M6IHJpc2N2OiBzcGFjZW1pdDogYWRkIGRlZXBjb21wdXRpbmcsZm1sMTN2MDUKPj4gVG86ICJT
YW5kaWUgQ2FvIjxzYW5kaWUuY2FvQGRlZXBjb21wdXRpbmcuaW8+Cj4+IENjOiAiQ29ub3IgRG9v
bGV5Ijxjb25vcitkdEBrZXJuZWwub3JnPiwgIkVtaWwgUmVubmVyIEJlcnRoaW5nIjxrZXJuZWxA
ZXNtaWwuZGs+LCAiUm9iIEhlcnJpbmciPHJvYmhAa2VybmVsLm9yZz4sICJLcnp5c3p0b2YgS296
bG93c2tpIjxrcnprK2R0QGtlcm5lbC5vcmc+LCAiUGF1bCBXYWxtc2xleSI8cGF1bC53YWxtc2xl
eUBzaWZpdmUuY29tPiwgIlBhbG1lciBEYWJiZWx0IjxwYWxtZXJAZGFiYmVsdC5jb20+LCAiQWxi
ZXJ0IE91Ijxhb3VAZWVjcy5iZXJrZWxleS5lZHU+LCAiSGVpbnJpY2ggU2NodWNoYXJkdCI8aGVp
bnJpY2guc2NodWNoYXJkdEBjYW5vbmljYWwuY29tPiwgIlRyb3kgTWl0Y2hlbGwiPHRyb3kubWl0
Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPiwgIk1pY2hhZWwgT3BkZW5hY2tlciI8bWljaGFlbC5v
cGRlbmFja2VyQHJvb3Rjb21taXQuY29tPiwgIkd1b2RvbmcgWHUiPGd1b2RvbmdAcmlzY3N0YXIu
Y29tPiwgIkhlbmRyaWsgSGFtZXJsaW5jayI8aGVuZHJpay5oYW1lcmxpbmNrQGhhbW1lcm5ldC5i
ZT4sICJZYW5neXUgQ2hlbiI8Y3l5QGN5eXNlbGYubmFtZT4sIDxzcGFjZW1pdEBsaXN0cy5saW51
eC5kZXY+LCA8bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZz4sIDxkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZz4sIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPgpJJ20ganVzdCBj
b25mdXNlZCBhcyB0byB3aHkgdGhpcyBhcHBlYXJlZCBpbiB0aGUgYm9keS4KCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgLSBUcm95CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
