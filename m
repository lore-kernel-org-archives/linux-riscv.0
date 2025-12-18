Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8235FD68BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 08:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wQQ/wt8FbObH1XzEFLG2wo7y99Ihhmsvfbl8FE3f1v8=; b=Db7/9hiZHU5bSv
	TnHziiS7dNW+jKb/LcSv2nS2C8xmVsdAVjU3hazaofrPsb0p+hY5aRe536LlPlmbo5+tzwC5bazS8
	EEa4B0ZtWjXUn7ZzKsvwJZ83iZT4cKO6OBTQ8ElybUTk1bPmbaz37Z4sPgYXBT9YiSocKNBg8trqh
	5vA51B/UcYZW8xdpPl+ROel1mbdtk6n88GojjO5oO945q6zbnwjIJ5UuLePopNLQW4xq/5p4IuDje
	f+IUy3t5Esmh/x75m5+KtGNtEWlSEVFVE2a7PVIv7TSljK9QB4yoO/rBo0LYpET5qEOn9MAOjf1u2
	1akXlWyqXjDf+FK2uP9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9ij-0000000861l-22sf;
	Thu, 18 Dec 2025 08:50:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9ih-0000000861b-3kPX
	for linux-riscv@bombadil.infradead.org;
	Thu, 18 Dec 2025 08:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=g+bJVIpt0gfvrKpvvpbdhzaZrLDQ51BQvCd8rNT5zDA=; b=O0UN448Q9PlpJpBVCIH6TdWDWH
	63xvS6MzcgkUxOaB0EPQRG/zESidHF1IR/7uSSpaNxwZ8+3AgWQ61GMsMrm1uSN3FHNXhvKpxzj0r
	OTUR3I/gR9XEJovEt9Vj93JMDuqcHSdwVJIgiT6lK+SJiXvG3dRe2Xc6dN+xSNrfnZvtDARiC2WCi
	UtOUAl5DTWKg9tXpXySqEetVtn8YvuFxgasigF6i1pkcmOal8K+CRhW+hcoxFQ/8THd/4ycqGdiCm
	f2hqzIarx+vZn/C7sKng8M4ACcWs6/j6P4ZwouOdqoDUc34Od3kiumVS4ZmoESEA0akSn19xrEeeg
	QJ3UCXNQ==;
Received: from mail.torqly.pl ([51.38.112.117])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8rB-00000008OWh-3eDL
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 07:55:31 +0000
Received: by mail.torqly.pl (Postfix, from userid 1002)
	id 936BCAC931; Thu, 18 Dec 2025 09:46:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=torqly.pl; s=mail;
	t=1766047638; bh=g+bJVIpt0gfvrKpvvpbdhzaZrLDQ51BQvCd8rNT5zDA=;
	h=Date:From:To:Subject:From;
	b=OG3P6lxdzcJXAVxxuyukVFiKvGo/r15BWK41GAaDWSkin20RyJ+V4REHkApfEJQ8E
	 cVTC0Q7qTPz6sVYj1xfYk46NBWm4j6Skp973bXS5SHlIJ3e/0HB3RcDOltJurV9Z8z
	 hmvM5UHaM0RU1/iVANGyp0yKidUK7G4L5u4ieL8JFr03A0mR8R+rSVjvqTOLdBPCXE
	 uoSbAk/NfV2+LrsaV3YER5sbwCuclVLraMvj3xaqOCWk5aoH9nlfq2jigIgn8uqIWs
	 VVn7iC0WTLYd4n+1bpWR2+pDy7aZG4EJxoTpOcbfdz6XpmzdO+sz1fCnj37m7Bwve5
	 Hnn6vHUe9P4yA==
Received: by mail.torqly.pl for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 08:46:01 GMT
Message-ID: <20251218084500-0.1.tu.d9jlw.0.fu4bkdb2gt@torqly.pl>
Date: Thu, 18 Dec 2025 08:46:01 GMT
From: "Tomasz Jaworski" <tomasz.jaworski@torqly.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Ulga_na_sk=C5=82adki_ZUS?=
X-Mailer: mail.torqly.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_075530_363397_64B10B57 
X-CRM114-Status: UNSURE (   0.73  )
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

RHppZcWEIGRvYnJ5LCAKCmNoY2lhxYJieW0gd3NrYXphxIcgUGHFhHN0d3UgbW/FvGxpd2/Fm8SH
IHphcnrEhWR6YW5pYSBiZW5lZml0YW1pIHcgxYJhdHd5IHNwb3PDs2IsIHBvcHJ6ZXogbmFzemUg
aW50dWljeWpuZSBuYXJ6xJlkemllLCBqYWtpbSBqZXN0IGthcnRhIGx1bmNob3dhLiAKCk5hc3pl
IGthcnR5IG9mZXJ1asSFIHd5Z29kxJksIG9zemN6xJlkbm/Fm2NpIGkgemRyb3dlIHd5Ym9yeSDF
vHl3aWVuaW93ZS4gRG9maW5hbnNvd2FuaWUgcG9zacWCa8OzdyBqZXN0IGtvcnp5c3RuZSBkbGEg
b2J1IHN0cm9uLiBLYXJ0eSBsdW5jaCB0byBkbGEgcHJhY29kYXdjeSByZWFsbmUgb3N6Y3rEmWRu
b8WbY2kgdyBwb3N0YWNpIHp3b2xuaWVuaWEgeiBaVVMgZG8gNDUwIHrFgiBtaWVzacSZY3puaWUg
bmEgcHJhY293bmlrYS4gCgpLYXJ0xJkgbW/FvG5hIGRvxYJhZG93YcSHIGRvd29sbsSFIGt3b3TE
hSwgYSBuaWV3eWtvcnp5c3RhbmUgxZtyb2RraSBuaWUgcHJ6ZXBhZGFqxIUsIGxlY3ogcHJ6ZWNo
b2R6xIUgbmEga29sZWpueSBtaWVzacSFYy4gCgpNb2fEmSBwcnplZHN0YXdpxIcgb2ZlcnTEmSwg
a3TDs3JhIHBvendvbGkgem9wdHltYWxpem93YcSHIGtvc3p0eSBpIHphcGV3bmnEhyBwcmFjb3du
aWtvbSBwb8W8xIVkYW55IGJlbmVmaXQ/CgoKUG96ZHJhd2lhbQpUb21hc3ogSmF3b3Jza2kKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
