Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FB9D1266D
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 08:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bgAMtJC3znqMNEy5egIn0ZeM+19KYdOW1CF2PuIbCsk=; b=vPgkbrKNsnYA/L
	bb1jIbH2sOfGny4w2kZMqPgb0O1UTwCBTCS/MG1km+EkHTD0K7wdYJvPqH+TXsVKU7L7gwpZLzr5Q
	a0dohH8mu/RNN+muOJujvj5mNbW51kDAaWMNPgjKj4A4iaYRwoCKxlnDGGbmAN2eqFH9+Hko+I0dw
	Mn1RlAG/lUHTtjwWxN2cUUEziZiVPN/PPj1P/HEwtN3KJ2+aQnbICDKDWyeyhC6dCqdUt5lRpaoaz
	JIgHfEx1wXO5nb5rd82uOZZmBL4TYLwc2Xy20fBASEJJMiU8TxjKlR41SWuHmcribS94kvxfnI2JZ
	3bMRZv1wG9kQc3OjufeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQihP-00000006L2O-1VPe;
	Wed, 03 Dec 2025 08:58:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQihO-00000006L2B-1Muw
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Dec 2025 08:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=LHmroAf0IX0JOjVUiIwqM4s8ghVxxktECxT6AQD+q2c=; b=I4Oyf2skp6Gt+4hoZ3SQ9lVeFP
	cdYt0qdMQOs/GdLi9ZZKhgsUmlHhxAxfwCA9KqGcD4NKV8gd0qMwsFo8cO4Zj8eoXysG/gTZyL4VR
	BNySJ6YAtgriP49AwkLoNQPirevn0/uvT6FlDVuDDD5lkPohFHBXAo+HV6gxmUUnFa9JzACK/BFvp
	xFzBwaXy6daLwlD5rPJGxO5ymjIO08EM0htyUchNcMBB5BteigEMV1b70d1Eb0XXnriosrd5s4kXo
	4b/78hNV/F+Cqtc+wzT3yGbR/jDRWSMOMGpK6/9fzVUmooIvnkHTDpZRQVYhgAh6MKL8ax+8SR+93
	9cKiwn1A==;
Received: from mail.growzi.pl ([51.75.73.133])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQhpm-00000001udK-3qPa
	for linux-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 08:03:37 +0000
Received: by mail.growzi.pl (Postfix, from userid 1002)
	id 1344E2632E; Wed,  3 Dec 2025 09:55:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=growzi.pl; s=mail;
	t=1764752189; bh=LHmroAf0IX0JOjVUiIwqM4s8ghVxxktECxT6AQD+q2c=;
	h=Date:From:To:Subject:From;
	b=K7/srWJgvw6EkTxkQZRXbRM4n0mokBDYEWSNGP2rTvVigYGFbNgneNC7FAF9wD2D4
	 rvq1TshYBgeD9VW8S3FpeZzdWDu3EVsVP+OFBGDZmxAGwkMHovXg8Rsw2aID8pr1zu
	 AgzYfYzxNlulAZM1VBmbcG7eeF/FbEPqLaIWicNnnn31NJ1SWT+JRLwPvwFSEKLJU8
	 Q4w1uHMjI2QmT9ioM05KC191nok8+qcMd5WtgTTil/1opF+fF+fI9EoX+6Mt60Nz0u
	 TcQQbjhT4DkstWI9mNnUjqWbrk/Htfwpcl8p6OZFOmJ701xH4o6vaLNffaeiH8eczj
	 f5U+Kx8SCh0Jg==
Received: by mail.growzi.pl for <linux-riscv@lists.infradead.org>; Wed,  3 Dec 2025 08:55:15 GMT
Message-ID: <20251203084501-0.1.es.156bj.0.1n4ri8jojo@growzi.pl>
Date: Wed,  3 Dec 2025 08:55:15 GMT
From: "Eryk Wawrzyn" <eryk.wawrzyn@growzi.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Zwrot
X-Mailer: mail.growzi.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_080335_475988_EEC3FB5B 
X-CRM114-Status: UNSURE (   1.43  )
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

RHppZcWEIGRvYnJ5LAoKa29udGFrdHVqxJkgc2nEmSB3IGltaWVuaXUga2FuY2VsYXJpaSBzcGVj
amFsaXp1asSFY2VqIHNpxJkgdyB6YXJ6xIVkemFuaXUgd2llcnp5dGVsbm/Fm2NpYW1pLgoKT2Qg
bGF0IHdzcGllcmFteSBmaXJteSB3IG9kenlza2l3YW5pdSBuYWxlxbxub8WbY2kuIFByb3dhZHpp
bXkga29tcGxla3Nvd8SFIG9ic8WCdWfEmSBuYSBldGFwYWNoOiBwcnplZHPEhWRvd3ltLCBzxIVk
b3d5bSBpIGVnemVrdWN5am55bSwgZG9zdG9zb3d1asSFYyBkemlhxYJhbmlhIGRvIGJyYW7FvHkg
S2xpZW50YS4KCktpZWR5IG1vxbxlbXkgcG9yb3ptYXdpYcSHPwoKClBvemRyYXdpYW0KRXJ5ayBX
YXdyenluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
