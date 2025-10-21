Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52872CCD1A5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 07:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cSoSYIRsTBviknxB5kg9/dP0Ebi6nrUDD9dei/nvJfI=; b=ukYRpwYOcoqbcX
	7q3PgoH9ywF6drf7eujPqECi8dxq162+kdM3BnLxdm2UgPqsgoS+INKJ47at4GpxLzxkh0ndybra3
	IVTRPD+Wr/w1Zkfn3rRShhYT9zyeQMJZX1ni06mVp+MXsHrQio9eO8HQJM+q0+UeCgC7cTyCrIGm5
	fTk0Y/yEc1QdkrOtn81cOZ8hRNRUb14fsKXjIqS/kQ6LP6oi2MRV2ucpa0c+YgsslH/Mtyss9ixd1
	/ZDAJW6Y3xafP0tMFXT84kLYQ/IkuQ0KiG6tWUSg2aE2KsNL2fwf163Bo8a8RFOlaaafM3eqSuOYu
	cRxQcNX2aTMrPIjzLHwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB76H-0000000G9G4-19kg;
	Tue, 21 Oct 2025 07:48:09 +0000
Received: from mail.zynotix.com ([79.137.80.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB76E-0000000G9ES-0kfi
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 07:48:07 +0000
Received: by mail.zynotix.com (Postfix, from userid 1002)
	id 007A625023; Tue, 21 Oct 2025 09:41:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zynotix.com; s=mail;
	t=1761032553; bh=xZTLqM3E7aVDYIB/jnD5MiDi3FAIGgatFm751EDj2YQ=;
	h=Date:From:To:Subject:From;
	b=NTy5guMB1lI+/vpz8rxZGSoapSe07bMKww00l4lg8nANlJXOS6jw40lh0UV4E4Ozb
	 QQkg3FnEwnjwLW30UUpsiYgk1jKsk9sBB9F/NNOB5AzmOduFozxhb1yN+DGRYdglSe
	 MFQOgcMbnyjm3gz0NJEXlAgMi/zyaa2pZpERS1PerIrS/adfeI4Q4YEqeBjJRbiT9z
	 MxKlzDVOOzIwGwJrgJzYguqRMn+Jbf7d23+zLHKiUSA/0zo0zH1ZHw99/o9InjQUy7
	 kUOelUR5Hjv0ihb2wMTPXUHo5Ax6EXBHEh0eAWb48z890iee0WK3JIDv9PH97G9F9p
	 wp119ONpHv8dA==
Received: by mail.zynotix.com for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 07:40:46 GMT
Message-ID: <20251021084501-0.1.ck.uonh.0.l6l9qy4po5@zynotix.com>
Date: Tue, 21 Oct 2025 07:40:46 GMT
From: =?UTF-8?Q?"Magdalena_Ko=C5=82adczyk"?= <magdalena.koladczyk@zynotix.com>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Informacja_z_ksi=C4=99gowo=C5=9Bci?=
X-Mailer: mail.zynotix.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_004806_377701_1C608051 
X-CRM114-Status: UNSURE (  -0.04  )
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

RHppZcWEIGRvYnJ5LAoKcHJvd2FkesSZIGJpdXJvIGtzacSZZ293ZSwga3TDs3JlIHNwZWNqYWxp
enVqZSBzacSZIHcgb2JzxYJ1ZHplIGJpem5lc3UgUGHFhHN0d2EgZm9ybWF0dS4KCldyYXogeiB6
ZXNwb8WCZW0gemFwZXduaWFteSB3c3BhcmNpZSwga3TDs3JlIHd5a3JhY3phIGRhbGVrbyBwb3ph
IHNhbW8gcHJ6eWdvdG93YW5pZSByb3psaWN6ZcWEIGkgcHJvY2Vzb3dhbmllIGRva3VtZW50YWNq
aS4KClJlZHVrdWplbXkgZG8gbWluaW11bSBjemFzIGkgxZtyb2RraSwgamFraWUgbmFzaSBLbGll
bmNpIHByemV6bmFjemFqxIUgbmEgb2JzxYJ1Z8SZIGZpbmFuc293by1rc2nEmWdvd8SFIGkga2Fk
cm93by1wxYJhY293xIUuIAoKWiByYWNqaSBtb2plZ28gZG/Fm3dpYWRjemVuaWEgcHJ6eSB3c3DD
s8WCcHJhY3kgeiBmaXJtYW1pIG8gdGFraW0gcm9kemFqdSBkemlhxYJhbG5vxZtjaSwgY2hjaWHF
gmFieW0gcHJ6ZWRzdGF3acSHIGtpbGthIHdhcnRvxZtjaW93eWNoIGkgc3ByYXdkem9ueWNoIHJv
endpxIV6YcWELgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHIG8gb2JzxYJ1ZHplIFBhxYRzdHdh
IGZpcm15PwoKUG96ZHJhd2lhbQpNYWdkYWxlbmEgS2/FgmFkY3p5awoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
