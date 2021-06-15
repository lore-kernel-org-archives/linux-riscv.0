Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC41C48BE5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 23:45:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C77206137D
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 23:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C77206137D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZP4Rh5gqjQw6tFsW2cEtPyDrH8Oxo3+nJnDOTgUC8A=; b=cR1XLjSI0iLoXFc/OW8pNKF3Fi
	5xbvRKGc06On4fGwdcmRHfRPhpnE2Hs2OE+RoEj3pY8+5LgQqWxBp9VwwlUYKmJXEQw89xA6aqeLN
	Y8de0mos/L/Kwps45F6PpGZ3xIU6LrkmpLNP5y6bclZ6xcv2k+EP8kHrk+Yu6GD4e0Tn7CxbuhhSG
	Em7q9bryUZO+XRAIZDaLqh3snV5HxQcs6P5bpSBzbb2EludTphA7rwiISVhyy6a5nu9mbW11bAtmA
	LKdSoFq4lghwiV3NR9YzeWMvcS0VKiOiEoEgRkUimqXKEHYtk81ti+7XW002Zdc45gjQLNNXVEcgS
	pacyXvpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltIje-003wyP-Ld; Tue, 15 Jun 2021 23:44:46 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltITn-003rVV-09
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 23:28:24 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 15FNSL98058429
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 02:28:21 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1623799696; x=1626391696;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p/3MC/QA7PBUvaqQB1NOM6ogYciz+/iFHdbIBY6EVIw=;
 b=oWA5UGGsmxFarttwaCy3W20nohyePUKeHyyYjGAQUingnx9Tbb9YVskp1tveTf5f
 /TrG0uoUEOu1KXmvDoswDIzEpckGnsG4rp+EjzXq+YDlBbgnB8eOnXzFNzxGfyPV
 dyYSKSOzqngxPnnGheGyX8uKYwsFmdeCxjtE4i9ceVFC3wGoNgMg4NIMc3Jpumev
 pq5+xKjDGbpnI5Sovr+bStPrFcb3B5Bb+/XgN1ko2XpYKsFJDsrdoFrP8EavhVrt
 dQSU+rAaJ1j7S1fNLBXCc0jAO57jqZCVESowVsZYkTxdcNi6GsUKaue06RuFNZjI
 XUBYfCyrtK1ijAFy4qZ8sQ==;
X-AuditID: 8b5b014d-962f1700000067b6-4f-60c9378fd979
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 9B.05.26550.F8739C06; Wed, 16 Jun 2021 02:28:16 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Wed, 16 Jun 2021 02:28:15 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh+dt@kernel.org>, Nick Kossifidis <mick@ics.forth.gr>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Frank Rowand
 <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] of: fdt: Add generic support for parsing elf core
 header properties
Organization: FORTH
In-Reply-To: <8661d652968d050489852ccb50df5ad4cc048900.1623780059.git.geert+renesas@glider.be>
References: <cover.1623780059.git.geert+renesas@glider.be>
 <8661d652968d050489852ccb50df5ad4cc048900.1623780059.git.geert+renesas@glider.be>
Message-ID: <96476719da53fe67dbb91268e2ad7492@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42Lpjp6urDvB/GSCQcdLJoutv2exW7xf1sNo
 Mf/IOVaLmW/+s1nMnT2J0WLT42usFpd3zWGz2Pa5hc2i+d05douXl3uYLdpm8Vu07j3CbtFy
 x9SB12PNvDWMHm9evmTxONzxhd1j4lldj52z7rJ7PNx0iclj06pONo/NS+o9LjVfZ/f4vEku
 gCuKyyYlNSezLLVI3y6BK+PJjvdMBRsYK66tvsjcwDiVsYuRk0NCwETi5+ud7F2MXBxCAkcZ
 JU48fwKVMJWYvbcTzOYVEJQ4OfMJC4jNLGAhMfXKfkYIW16ieetsZhCbRUBV4uTO72wgNpuA
 psT8SwfB6kUEDCS2nn/GBrKAWeA3s8S+w+2sIAlhgTiJjlUPmUBsfgFhiU93L4LFOYHi2zvW
 sUFc1McocW3SB2aIK1wkdr+dzAZxnYrEh98PgM7m4BAFsjfPVZrAKDgLya2zkNw6C8mtCxiZ
 VzEKJJYZ62UmF+ul5ReVZOilF21iBMcWo+8Oxtub3+odYmTiYDzEKMHBrCTCq1t8IkGINyWx
 siq1KD++qDQntfgQozQHi5I4L6/ehHghgfTEktTs1NSC1CKYLBMHp1QD086AWBaDEJ/KVTPZ
 3SdvcNj+bf0SWceVlxf+uM3H4VL0x8vutoGU/aZL71oLP1pOYRLUObf5v+GvPZFv21rXfUhs
 OD9Ta2VeVW9+SfEd/+e2nw4fztta82l6w76k2Qs0pSds+/tL59cEn/uVsoXX2n6nL5lnctz4
 Ktd75SdKteLbNqw5vUNUjk94/tLASSccPOb2y4XLqNfoZ9THvJ8s8ufnhXPvnls9bZpR5FK2
 PlpJe9MNY17Tw6uvb0lS67qm7PhLSeoii+v9hQFZ6i4Bp7wf5xt53eeV82PpbtU+19Wk97Oo
 ikUzKZ6hdane3T0yYYJ/EmsfSqc/euXoPpmNh7Mhedcym4/pSqXmpnO3KrEUZyQaajEXFScC
 AD8ZoywcAwAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_162823_516944_81A4A917 
X-CRM114-Status: UNSURE (   6.26  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAyMS0wNi0xNSAyMToxNywgR2VlcnQgVXl0dGVyaG9ldmVuIM6tzrPPgc6xz4jO
tToKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9mZHQuYyBiL2RyaXZlcnMvb2YvZmR0LmMK
CkkgYmVsaWV2ZSBkcml2ZXJzL29mL2tleGVjLmMgaXMgYmV0dGVyIHN1aXRlZCBmb3IgdGhpcy4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
