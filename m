Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312DEC36010
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 08:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q9SIgd1V+kJiIxc54HdzzF34fEZsqY8woVtiwbjMNSo=; b=QyyXtyEVyfd6ND
	rXxUeWbLwomBL4Va9/MilSKlZtDLbxT2qQUGmNj3eBJ0tnCm0EwhQY80BlmmY1CORhIbXOGmUgCql
	Ico9ouipFF27BegwXQB0MeuG//LctAFy1tz7Dxy+2g1ddRCLuwdRr3DQ5+ci5iD3keIXXoyNFQgQr
	h+KdOG1Of3pXNWNcHDX8SCIzyCD69UktC1TM71VyJ/nc94ZWMXsy5el30lrP2FoXw1oktG7gW+26d
	AjKvBGwtqKgGYlCNKBfpQOyrb+8vZO+Ir70slMvhqCZybHcjPs6OmpxpraS4MGgNHb5uDdJYDVRwN
	bVgIURSi26zJBTOkuXsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0cRi-0000000B9Lh-2loU;
	Fri, 04 Apr 2025 08:30:38 +0000
Received: from mail.ventrixor.pl ([91.134.88.136])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0cRf-0000000B9Ji-3urs
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 08:30:37 +0000
Received: by mail.ventrixor.pl (Postfix, from userid 1002)
	id E43E12644B; Fri,  4 Apr 2025 08:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ventrixor.pl; s=mail;
	t=1743755341; bh=Pi9+p40l7//vLKO8DuYTv+ORJz3B9aWETGdVOxLyydc=;
	h=Date:From:To:Subject:From;
	b=s320aL/PdJz6iaCocVsNSDN/nrCdwcfJjU/k80/ot8Rpq3kYBGrmk2mi82vrCskPg
	 +4tQOiQNq/ByVK+3CGFVQCz2AMjiDD/c//yUHFGeA9B0Ulrmi7fzUGatbxyns6WcCR
	 HKlO4R747x78ubb2kPz04Nk5Q3nUrxd+UVk8mE+XV+ejlU9ykEV+fNpIlZen8fin9m
	 uLqx7DFi4KVxe4IAR+UYTCHRjb1XR7oLY3/Tewu2hdP63ENXIiol8nyRtSL6gFddJC
	 H3/rUpFJqw6OIJaZEgSx8vGqjuWlSX9ZCs5rN8TuS9Navs9xqPxKf9BWd9szqOsBiP
	 vSTnGcMv/rnMw==
Received: by mail.ventrixor.pl for <linux-riscv@lists.infradead.org>; Fri,  4 Apr 2025 08:28:10 GMT
Message-ID: <20250404074859-0.1.6c.1c8xh.0.cpq6uz91kd@ventrixor.pl>
Date: Fri,  4 Apr 2025 08:28:10 GMT
From: "Jan Adamczyk" <jan.adamczyk@ventrixor.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.ventrixor.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_013036_110656_3558ADB7 
X-CRM114-Status: UNSURE (   1.28  )
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

V2l0YW0sCgpDenkgbWFqxIUgUGHFhHN0d2EgYWt0dWFsbmllIHBvdHJ6ZWJ5IHogemFrcmVzdSBy
ZWtydXRhY2ppIG9zw7NiIGRvIGR6aWHFgnUgaGFuZGxvd2Vnbz8gCgpQb21hZ2FteSBza3V0ZWN6
bmllIHJla3J1dG93YcSHIG9zb2J5IG5hIHN0YW5vd2lza2EgUHJ6ZWRzdGF3aWNpZWxhIEhhbmRs
b3dlZ28sIFNhbGVzIE1hbmFnZXJhLCBhIHRha8W8ZSBLYWRyeSBNYW5hZ2Vyc2tpZWogdyBvYnN6
YXJ6ZSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHPyAKCgpQb3pkcmF3aWFt
CkphbiBBZGFtY3p5awoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
