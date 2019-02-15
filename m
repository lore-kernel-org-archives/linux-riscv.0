Return-Path: <SRS0=HaOg=QW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DAFC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Feb 2019 08:18:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3277121B68
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Feb 2019 08:17:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lBjrSW7f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="ppTJDv9l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3277121B68
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j/zr0Krize5VNciWw/vwthsbs6Ora5avg+sTRJMqa6o=; b=lBjrSW7fhzeLhlEe+sia9clkr
	uOSkaVPKNf52u0uJGcYZHswULEMtrE9LxWMR7wZ2SmHeBiDUzvDctIEAH1TqMu7Gp6bmOp0H3M0fP
	hzDh23T14YsK8LLZImPzELfwxg6VRI2gg290cZp8qu1XEdxAIl3+KF0gWo8SaBhHF9lXbBISMbS4F
	Ix504oHmkIYUiqYdl3bIN0vrIi3qZC5PlRcfoTIPunLegh5lEFbDT4R+5qULul0nWk4N3rFJbjytg
	NypXkGm1wlOTy46NTu9QaGwLM2rFA3VFQx54y58y5NjwrYCkpFaqHg3soq+gGCMAHuHB29cz0647W
	CBkPOtTvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guYgw-0000zN-Vt; Fri, 15 Feb 2019 08:17:50 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guYgu-0000yb-AW
 for linux-riscv@lists.infradead.org; Fri, 15 Feb 2019 08:17:49 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4415jN1pZxz9v0N7;
 Fri, 15 Feb 2019 09:17:44 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ppTJDv9l; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id syPr5znEh3vp; Fri, 15 Feb 2019 09:17:44 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4415jN0XnTz9v0N6;
 Fri, 15 Feb 2019 09:17:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1550218664; bh=/IYfdqjsfG04HbnvS71uX5PXXDKwZ2gTBhWl5fa4PCs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ppTJDv9l3E/gU+xZFj9JtfZgwxY/u0O/dXZcvPn0Zv6BClJtdb2rPdXkGZVFGDo1q
 TZAIngmqPdaZLe2tVngoJ8TymMzfFiXjS2bEUFcK3z9CPIhY8x57OXRjNbshcpkND3
 g3ASGsyRIE+r4GwDGjIwtHCXM6jyqxVg6nqcgzJc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0CBCE8B8BB;
 Fri, 15 Feb 2019 09:17:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EPtKIS6xP_FL; Fri, 15 Feb 2019 09:17:44 +0100 (CET)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.2])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 069088B8BA;
 Fri, 15 Feb 2019 09:17:44 +0100 (CET)
Subject: Re: [PATCH 01/11] powerpc: remove dead ifdefs in <asm/checksum.h>
To: Christoph Hellwig <hch@lst.de>
References: <20190213174005.28785-1-hch@lst.de>
 <20190213174005.28785-2-hch@lst.de>
 <e7a2efe3-f56c-7dfd-6613-dc9229556673@c-s.fr> <20190214170510.GC32441@lst.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <d5451fc4-9183-702a-e9ed-4a2be1f82a11@c-s.fr>
Date: Fri, 15 Feb 2019 09:17:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190214170510.GC32441@lst.de>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190215_001748_513220_B37ED0DA 
X-CRM114-Status: GOOD (  12.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-s390@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

CgpMZSAxNC8wMi8yMDE5IMOgIDE4OjA1LCBDaHJpc3RvcGggSGVsbHdpZyBhIMOpY3JpdMKgOgo+
IE9uIFRodSwgRmViIDE0LCAyMDE5IGF0IDA5OjI2OjE5QU0gKzAxMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6Cj4+IENvdWxkIHlvdSBhbHNvIHJlbW92ZSB0aGUgJ2NvbmZpZyBHRU5FUklDX0NT
VU0nIGl0ZW0gaW4KPj4gYXJjaC9wb3dlcnBjL0tjb25maWcgPwo+IAo+IEFsbCB0aGUgc2VwYXJh
dGUgZGVjbGFyYXRpb25zIGdvIGF3YXkgbGF0ZXIgaW4gdGhpcyBzZXJpZXMuCj4gCgpJIHNhdywg
YnV0IHRoZSBwdXJwb3NlIG9mIHRoZSBsYXRlciBwYXRjaCBpcyB0byByZXBsYWNlIGFyY2ggZGVm
aW5lZCAKR0VORVJJQ19DU1VNIGJ5IGEgY29tbW9uIG9uZSB0aGF0IGFyY2hlcyBzZWxlY3QuIEZv
ciB0aGUgcG93ZXJwYyB5b3UgYXJlIApub3QgaW4gdGhhdCBjYXNlIGFzIHRoZSBwb3dlcnBjIGRv
ZXMgbm90IHNlbGVjdCBHRU5FUklDX0NTVU0uCgpTbyBJIHJlYWxseSBiZWxpZXZlIHRoYXQgYWxs
IHN0YWxlIGJpdHMgb2YgcmVtYWluaW5nIEdFTkVSSUNfQ1NVTSBpbiAKcG93ZXJwYyBzaG91bGQg
Z28gYXdheSBhcyBhIHNpbmdsZSBkZWRpY2F0ZWQgcGF0Y2gsIGFzIGEgZml4IG9mIGNvbW1pdCAK
ZDRmZGU1NjhhMzRhICgicG93ZXJwYy82NDogVXNlIG9wdGltaXplZCBjaGVja3N1bSByb3V0aW5l
cyBvbiAKbGl0dGxlLWVuZGlhbiIpCgpSZWdhcmRpbmcgdGhlICNpZmRlZiBfX0tFUk5FTF9fICwg
SSB0aGluayB3ZSBzaG91bGQgZG8gYSB3aWRlIGNsZWFudXAgaW4gCmFyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbSwgbm90IG9ubHkgYXNtL2NoZWNrc3VtLmgKCkNocmlzdG9waGUKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
