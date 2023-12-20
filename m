Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B53BC46CCD
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 08:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T0QZFCa7ip8mxyhTjgY15rI9hX+MOZSh3kOZ2QxB/NQ=; b=AiiCKvz1NGeV6U
	AQoqdWYDPjkaziWQpurSz0SsqLHaQG/fSRcg+AYAVxKBHuHGnvoL0/6bV2DVUzFGg27E4XDK3Gtqk
	Nz8Ynqi+AUlZ07o1uX7GHkEqBoHIgH2t7jMFNPz8xTfeaqkWlG42m2uqxIgD2XC22nY71kQrDnVZa
	BP1g7j08FBh2CPJJOO/6HdKVKmphpImQRUaLzT23aNu02TbzEav2slebQUIfPbAgmohABmaxPlhJ8
	jJhzGVUFYZf+F+zorKYNxKhyx41FNGwgOleDcAPoYzU8IUbmfFUcVjE9sbBQ0a0H1/RBeg/5KoWBV
	m7hf1MzXQriuwYkMJcYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsDC-00GcUO-2J;
	Wed, 20 Dec 2023 08:45:54 +0000
Received: from mail.bizloop.pl ([217.61.97.183])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsDA-00GcT4-0W
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 08:45:53 +0000
Received: by mail.bizloop.pl (Postfix, from userid 1002)
	id 261D982C39; Wed, 20 Dec 2023 09:36:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizloop.pl; s=mail;
	t=1703061414; bh=fAh84/03FbcPDOiro+kD9EaI9x3ZXWqpoFIQ90ndT2M=;
	h=Date:From:To:Subject:From;
	b=GrBNhgzFXwc75WGnwmQ2ztILjDUzsLw2+boFKE3ADNrZJuHC7rzqrnOQYdyKwJdgY
	 wiYdic2o2ryLUtb1nCsQebLpwGsjPUrAyJCzgPOU/VsywH2cweNmTpQYeh9q++GNB3
	 B/8bAk6+DwU56qNsiDUdopSzHwi7aL+n8tzzaXmZAc+rlAVmm4oIuv/Yf/uRqOChtU
	 XUGDMCC6Shb9yhaHc2p/Oy0lSW1uD3Oy+3rGs9GX4HmSJtUKHVnXY43LcLg2B+bijE
	 zcCo8ymQ+KoaEcogFzwVjqjE+eCYx+K8pf6DzcgeSiL6HYfhkTgMARPqOjp8HLzvzF
	 NwHpxPLfpn2sQ==
Received: by mail.bizloop.pl for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 08:36:17 GMT
Message-ID: <20231220084500-0.1.1a.3i2h.0.cbpjem9ri4@bizloop.pl>
Date: Wed, 20 Dec 2023 08:36:17 GMT
From: "Adrian Mackiewicz" <adrian.mackiewicz@bizloop.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Nowe informacje na stronie www
X-Mailer: mail.bizloop.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_004552_358082_7A48D3E3 
X-CRM114-Status: UNSURE (   0.81  )
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

U3phbm93bmkgUGHFhHN0d28sCgp6YXN0YW5hd2lhbGkgc2nEmSBQYcWEc3R3byBuYWQgbm93xIUg
c3Ryb27EhSBpbnRlcm5ldG93xIUgZGxhIHN3b2plaiBmaXJteT8KClRlY2hub2xvZ2lhIGkgdHJl
bmR5IHcgcHJvamVrdG93YW5pdSBzdHJvbiBzdGFsZSBzacSZIHptaWVuaWFqxIUuIEFrdHVhbGl6
YWNqYSB3aXRyeW55IHBvendvbGkgV2FtIHV0cnp5bWHEhyBrcm9rIHogbmFqbm93c3p5bWkgcm96
d2nEhXphbmlhbWksIGNvIHogcGV3bm/Fm2NpxIUgcHJ6eWNpxIVnbmllIHV3YWfEmSBrbGllbnTD
s3cgaSB3eXLDs8W8bmkgV2FzIHfFm3LDs2Qga29ua3VyZW5jamkuCgpEemnEmWtpIG5vd3ltIHRl
Y2hub2xvZ2lvbSBvZmVydWplbXkgbGVwc3plIGRvxZt3aWFkY3plbmllIHXFvHl0a293bmlrYSwg
Y28gcHJ6ZWvFgmFkYSBzacSZIG5hIHp3acSZa3N6b27EhSBzYXR5c2Zha2NqxJkga2xpZW50w7N3
IGkgd2nEmWtzesSFIHNrxYJvbm5vxZvEhyBkbyBpbnRlcmFrY2ppIHogV2FzesSFIG1hcmvEhS4K
CldhcnRvIHJvendhxbx5xIcsIGphayBub3dvY3plc25lIHBvZGVqxZtjaWUgbW/FvGUgcG9kbmll
xZvEhyBQYcWEc3R3YSBvYmVjbm/Fm8SHIG9ubGluZSBuYSB3ecW8c3p5IHBvemlvbS4gTW/FvGVt
eSBwb3Jvem1hd2lhxIcgdyB0ZWogc3ByYXdpZT8KCgpQb3pkcmF3aWFtCkFkcmlhbiBNYWNraWV3
aWN6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
