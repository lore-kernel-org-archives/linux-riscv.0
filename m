Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98E2C7EE29
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 08:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1unVHdNA5McafJqM3FjJFlDQtWrBObVirgZCRGRJ3ic=; b=2HnEAeoHIcB++s
	wTUHHxneoW+2GpIK4Zr4UHmjRQjlI8IDLkRBYFWw7e32BeV45NiX8VJrx46CKnSYB7AW1g22H82Z0
	H795cYeioP6kTdAuVUOOBzYlzjbchmNp3pJsuj4AcjmcKysBUndzw9bqR43QdidxeIWR4pzF0THhY
	mbVPj6aM43IldcpYEgyrHtjNHSR88kb3NW4hovAXLklFHFEqzdJBWdN789YMxo+wVAqH/65KBEHls
	U2g85UOPYyJXqj+EVxBTh2BFFa2iMS0b9N6VBhu6uJRdQtsxoOm6p7J5moD8wSTVyCdDa0j7+ocxh
	bqmFuglRz7Y7XuzSOpRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q50Gh-006Aa7-10;
	Fri, 02 Jun 2023 08:36:19 +0000
Received: from mail.webtopbits.pl ([195.231.64.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q50Ge-006AZD-2C
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 08:36:17 +0000
Received: by mail.webtopbits.pl (Postfix, from userid 1001)
	id 34AE7A3900; Fri,  2 Jun 2023 09:36:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=webtopbits.pl;
	s=mail; t=1685694975;
	bh=Eh8ECMiYd4baGAwPAzhz8mhJACXX7NSRkYjh+plaY18=;
	h=Date:From:To:Subject:From;
	b=HdAJwCLs1z6fJ9hWUw/Uk6joLI5sVwUOqb3zlmGn4yYOgyRmtt22lY6cFm/mTd+r1
	 fDV3xhf9/w2hgjiBXWKeIwwQbXTDmJkb4WbnyJxBLZosmGYYuGHS/8koGiwZwrJD9/
	 PNcbk3UGv3ukGfs77ZCZw3dnmVcma7jjIGe8b2oIP8C162l/6+W1voXfObzCxYGhz/
	 EwH4DjAlpWegrIg8loSEsHCvFa8y+2NU3153GoseYfFdIKSfhjSob1sVAZL1NRvadz
	 rS8ll0M3MRyaCDGgOwTDpD/KkrnI9kxWdzYDph4FPNZMtKGDHgYKQD7cjbhmX20Wla
	 YN1whiFpAYq/A==
Received: by mail.webtopbits.pl for <linux-riscv@lists.infradead.org>; Fri,  2 Jun 2023 08:35:59 GMT
Message-ID: <20230602085530-0.1.8w.5k5i.0.mkha8d2h98@webtopbits.pl>
Date: Fri,  2 Jun 2023 08:35:59 GMT
From: "Kamil Durjasz" <kamil.durjasz@webtopbits.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Wy=C5=BCsza_konwersja_w_e-sklepie_?=
X-Mailer: mail.webtopbits.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_013616_864187_C3DCAC04 
X-CRM114-Status: UNSURE (   1.67  )
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

RHppZcWEIGRvYnJ5LAoKdyBqYWtpIHNwb3PDs2IgZG9jaWVyYWrEhSBQYcWEc3R3byBkbyBvZGJp
b3Jjw7N3PwoKVHdvcnp5bXkgcG90xJnFvG5lIG5hcnrEmWR6aWEgc3ByemVkYcW8eSwga3TDs3Jl
IHBvendhbGFqxIUga29tcGxla3Nvd28gcm96d2nEhXphxIcgcHJvYmxlbXkgcG90ZW5jamFsbnlj
aCBrbGllbnTDs3cgaSBza3V0ZWN6bmllIHdwxYJ5bsSFxIcgbmEgaWNoIGRlY3l6amUgemFrdXBv
d2UuIAoKU2t1cGlhbXkgc2nEmSBuYSBQYcWEc3R3YSBwb3RyemViYWNoIHp3acSFemFueWNoIHog
b2JzxYJ1Z8SFIHNrbGVwdSwgb2N6ZWtpd2FuaWFjaCBpIHBsYW5hY2ggc3ByemVkYcW8b3d5Y2gu
IFN6Y3plZ8OzxYJvd28gZG9wYXNvd3VqZW15IGdyYWZpa8SZLCBmdW5rY2pvbmFsbm/Fm2NpLCBz
dHJ1a3R1csSZIGkgbWlrcm9pbnRlcmFrY2plIGRvIFBhxYRzdHdhIGdydXB5IGRvY2Vsb3dlaiwg
Y28gcHJ6ZWvFgmFkYSBzacSZIG5hIG9jemVraXdhbmUgcmV6dWx0YXR5LgoKQ2jEmXRuaWUgcHJ6
ZWRzdGF3acSZIGRvdHljaGN6YXNvd2UgcmVhbGl6YWNqZSwgYWJ5IG1vZ2xpIFBhxYRzdHdvIHBy
emVrb25hxIcgc2nEmSBvIG5hc3p5Y2ggbW/FvGxpd2/Fm2NpYWNoLiBNb2fEmSBzacSZIHNrb250
YWt0b3dhxIc/CgoKUG96ZHJhd2lhbQpLYW1pbCBEdXJqYXN6CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
