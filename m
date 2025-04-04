Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AEFC36010
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 08:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q9SIgd1V+kJiIxc54HdzzF34fEZsqY8woVtiwbjMNSo=; b=XmrkXYlcQBv5xa
	Cv8+bpXVNgpZ9IihpM/Ojc4PG3VutjbiBx41i1IlTroSIWBxVTL/unkTHzm2v9ptA5l5ynQWfNjmO
	UyybBYb43sYb5ZUJx9VWjksrQ81+cTc34Nqj4M7JoozNckCkH8HnssoSIlcvR34i0QvOps352asb0
	NPdAXUJ3gdqcVDov2ybhz3nOeZ3upvjBdtv3nULtvhGB3CZv85E/jXMzE0iHeqT+BvrzM3wHLMYLx
	5fKEiF+VuEoxxfeoO9WioJOUifLcv42vKgT+rpNAG1VVFuwT26oTx2FogZujwcg2js6oDS3nAkidT
	tWKCalzOGKoYgSWLI9ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0bzP-0000000B5Vi-0Y1D;
	Fri, 04 Apr 2025 08:01:23 +0000
Received: from mail.ventrixor.pl ([91.134.88.136])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0bzN-0000000B5UW-0do7
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 08:01:22 +0000
Received: by mail.ventrixor.pl (Postfix, from userid 1002)
	id B569325C61; Fri,  4 Apr 2025 08:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ventrixor.pl; s=mail;
	t=1743753679; bh=Pi9+p40l7//vLKO8DuYTv+ORJz3B9aWETGdVOxLyydc=;
	h=Date:From:To:Subject:From;
	b=yfE94t7Moewn8vu3EN1S52kQ5m2we56oAGKmR7GVV4uKXDjNJD0giZzwYA6ehLFe9
	 BTQ2QBg/ETI0G6ayD1yg+W+3nAVkOBqPpGO80u+tZhKPSx5vDcUcBVIgsgcHPFXIde
	 5ndjhm6iDTUXUelH7WKIS6sQt3R1TyZrIrLkDiFezVBXkm9WE16iy/SjqdA3+ur3ex
	 aMzBt4Tfq3ZHR3lyVqv1q0R+157FklH4VtjU58CG5hoUi9BTlHiCEMZSiOdsPCZMmL
	 y0ZHcqt6zMnYNDC9CkgVNdgsEys/SyJ3YzVh0vhicfur9GnG1uKyx4pW1iHMYDuC30
	 j5mWQHicotPNw==
Received: by mail.ventrixor.pl for <linux-riscv@lists.infradead.org>; Fri,  4 Apr 2025 08:00:53 GMT
Message-ID: <20250404064500-0.1.6b.1c8xh.0.h11513rnjm@ventrixor.pl>
Date: Fri,  4 Apr 2025 08:00:53 GMT
From: "Jan Adamczyk" <jan.adamczyk@ventrixor.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.ventrixor.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_010121_329621_83416146 
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
