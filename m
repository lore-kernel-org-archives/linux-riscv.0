Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BC3C2BA15
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 07:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QgIHNTpfeU39ZCQHsU7m8vxbuJFSh+SxU4FW8m3wO6o=; b=XQGHUUOfodtveA
	cKE6imhqkXy1yVyZPoz7IvAxAtejmw/54AtPxKlvd/UTvY4TvbR8FAhNMM2lvjYfKzKo/BKoIjzba
	FjcxO89rrlHh8yaSq4Rjk4KOUnbTWZUU0IzKT0nywswalcT+aeZij3pRQZQoHnJt2TMcb/AXSSmcu
	ehq6x+PSppLmXIrnEDUpiaFo0PeYFivB2BZ2E49NLHo4aj80F/xEdmoXKpZqPM6Ss44u5hqfA/F8q
	ZRbr6F6AhFqJMvjeER9oMUo99OCPWY93UuFJxVI3iekj4U5Tg9YZ7Zw5axYaeVWrJzor3llUylOO3
	DANspJG8vxp+Qy92+s1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJptD-00000000EJb-3ICw;
	Wed, 19 Jun 2024 07:37:55 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJptA-00000000EJ7-30cG
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 07:37:54 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1718782667; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=F+jzLTyut4HRZWWwAgeDjA64/l80zDaCJxNwJicBERv3K4ZhePzZRL/ecXwTuAMsGU88cITkwR1ZNCGR3BUQbsq6oP9yyMz6ZecxuqIOofMi6dnQ+4rDTJ3sVtHcJbsV20ex5d94ZwenJ9zQCUqN+8po8f+fNZy8KHXU6kQwQMg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1718782667; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dILstQIUai3DtXRp/q1RJsBjK8QEmdTG5Y18JKqP2W8=; 
	b=PWTJXsoFWh6Sn5jhrZaehWp0R9DIPlnMpNK/NK3fCsQ4AOYZq+JjhfklfEYnhdCGbIiRq1lzf9NJpvrtF9lgjkVf8nl2IBr+BkCvw6a+yPdnQg3iUQnC5w27O5jEf6l0J/lOwS04m5PBHCYUPfr2CA/b1XMBBTxO9h010IQ3j6U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1718782667;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=dILstQIUai3DtXRp/q1RJsBjK8QEmdTG5Y18JKqP2W8=;
	b=TjVzyDQHnxTueOSE1UJ6XmDsaK59/K6M9HDxC35xMfbXxaGSbFhEx3/+kkAoRYVw
	bB7G308woo+fsOPN8fhGDDvCtieUWoxTRSupa8XebcOwsTi3ImQx3WWEZyq00MtgCKv
	A0oDYJBD3X+5BZVVWTI0zoB+e4qQtBHVoLmleWoJcbOYc1ARXWFAdH9WOvgR96fFPdK
	XqN5WMcW52xIpq1WyAGulEebLxW2aX+DU/ZkJPvwo/+8sYwFMm5WkdDbnznI+5I7rnA
	p7j7glCkDMDnIRdQsyCrvx0VtrBMRcUWT7IJTzsWexJSK+TdP2O0km8xbt1CMp7cprO
	dduYLcqzTA==
Received: by mx.zohomail.com with SMTPS id 1718782666075684.338458172934;
	Wed, 19 Jun 2024 00:37:46 -0700 (PDT)
Message-ID: <95c4d5e165992e8b775ec41a6948bda400b4c82f.camel@icenowy.me>
Subject: Re: [PATCH v3 1/3] dt-bindings: i2c: dw: Document compatible
 thead,th1520-i2c
From: Icenowy Zheng <uwu@icenowy.me>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>, Thomas Bonnefille
 <thomas.bonnefille@bootlin.com>, Andi Shyti <andi.shyti@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Drew Fustini
 <dfustini@tenstorrent.com>, Emil Renner Berthing
 <emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  =?ISO-8859-1?Q?Miqu=E8l?= Raynal
 <miquel.raynal@bootlin.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
Date: Wed, 19 Jun 2024 15:37:36 +0800
In-Reply-To: <f427b28c-420b-4174-a670-70f626f8061e@linux.intel.com>
References: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
	 <20240618-i2c-th1520-v3-1-3042590a16b1@bootlin.com>
	 <f427b28c-420b-4174-a670-70f626f8061e@linux.intel.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_003752_835224_CA194B33 
X-CRM114-Status: UNSURE (   6.40  )
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

5ZyoIDIwMjQtMDYtMTnmmJ/mnJ/kuInnmoQgMDk6NDAgKzAzMDDvvIxKYXJra28gTmlrdWxh5YaZ
6YGT77yaCj4gCj4gWW91ciBjb21tZW50IGJlbG93IG1ha2VzIG1lIHRoaW5raW5nIGlzIHRoaXMg
Y2hhbmdlIG5lZWRlZD8gU28gaXMgaXQgCj4gZW5vdWdoIHRvIHNwZWNpZnkgInNucHMsZGVzaWdu
d2FyZS1pMmMiIGZvciB0aGUgY29tcGF0aWJsZSBzdHJpbmcgaW4gCj4gcGF0Y2ggMi8zPwoKSSB0
aGluayBpdCdzIGEgY29tbW9uIHByYWN0aWNlIHRvIGhhdmUgYSBTb0Mtc3BlY2lmaWMgY29tcGF0
aWJsZSBhbG9uZwp3aXRoIHRoZSBzcGVjaWZpYyBjb21wYXRpYmxlLCBpbiBjYXNlIGFueSBzaWxp
Y29uIHF1aXJrIGlzIGZvdW5kLgoKPiAKPiAiSXQgYXBwZWFycyB0aGF0IHRoZSBUSDE1MjAgSTJD
IGlzIGFscmVhZHkgc3VwcG9ydGVkIGluIHRoZSB1cHN0cmVhbSAKPiBrZXJuZWwgdGhyb3VnaCB0
aGUgU3lub3BzaXMgRGVzaWdud2FyZSBJMkMgYWRhcHRlciBkcml2ZXIuIgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
