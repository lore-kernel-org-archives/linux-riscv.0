Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A93BC433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 18:04:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 710D761920
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 18:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 710D761920
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pHreu60AMiYN8Vl4WBNfcvf+1y9RP5GEQUfp0p+H3hk=; b=dNhrY5yLpbaGSG4XiHODXv2vd
	pgZ7ivxg+VXfNYtp2x4NrDht7QRilayvq2JJkbm7K3oRNdQn4PhOi1VmzjF9bswVMPiRaR6kmsSKw
	2rOYyGGOjSkp7VFPCR+y9mBfJfay43HXbZTBgPcuLU2CWAFIylVNB2/zZ056f9rdqFq7a6kP01FHN
	wtZ7J6oQE+BaSjht9xOOS0ejukG4B9g2/Yl4WneZQrN1z5s4g/+QmEAaOKMPL2tPxuX/jqZ/wfclt
	A7frQICqfyXRIHivkpGLFXRCS5WRfrmW3R7dRApm192cAWE4/m9Y3+ib6icqBvmKzR63V64T3COoW
	pdDqPM2eg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQwFV-000yXM-63; Mon, 29 Mar 2021 18:04:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQp3n-000ZyG-J3
 for linux-riscv@desiato.infradead.org; Mon, 29 Mar 2021 10:23:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=dd9anM8U+w29WqztNH/+Mlfk4HoJ1Xtc92mO/PzPCps=; b=ooOz/rBbWi1R/nQ9sIxUgssYsg
 FDYE377823fY+gqLBfQmZrha5FwnglHLO+PeNNv2WMMljpHPXQDptf3KAFI2YVVwcz5JfijOuYOmz
 3hB6K3XGnUrFIWc8wANqQuzWd54gHaWrpjx5ro4cj3hp6wxxQ2MRItfZ5kzY4wsfkTZeVoP4NenwX
 90KkPYKUBytyn77NTwVjnTavonIBRnedMCdw9hcwGZggzKNBVCXKCkkdUCqrSIpUSbbAILKdh4mUB
 lUKp8+7HC7fSZ6VOUr5HNDLwkxxfFH+uOVcEXLFch1QLZbtHznSX7f1AyF61PU7BSgXhC0qGMlOU5
 fFdGaJ7w==;
Received: from pegase1.c-s.fr ([93.17.236.30])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQTNU-0000Ge-N0
 for linux-riscv@lists.infradead.org; Sun, 28 Mar 2021 11:15:07 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F7Y521DWmz9tyJZ;
 Sun, 28 Mar 2021 13:14:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Vbw5Z44eDhdj; Sun, 28 Mar 2021 13:14:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F7Y516Sdvz9v03k;
 Sun, 28 Mar 2021 13:14:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8C8A48B782;
 Sun, 28 Mar 2021 13:14:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id N7crepemd7QU; Sun, 28 Mar 2021 13:14:30 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EA0E48B75F;
 Sun, 28 Mar 2021 13:14:29 +0200 (CEST)
Subject: Re: [PATCH v5 4/7] powerpc/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: guoren@kernel.org
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
References: <1616913028-83376-1-git-send-email-guoren@kernel.org>
 <1616913028-83376-5-git-send-email-guoren@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <e27af5e0-a462-cb75-6311-1b5a6b4ee4f1@csgroup.eu>
Date: Sun, 28 Mar 2021 13:14:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1616913028-83376-5-git-send-email-guoren@kernel.org>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_121455_711589_616395D1 
X-CRM114-Status: GOOD (  14.45  )
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

CgpMZSAyOC8wMy8yMDIxIMOgIDA4OjMwLCBndW9yZW5Aa2VybmVsLm9yZyBhIMOpY3JpdMKgOgo+
IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiAKPiBXZSBkb24ndCBo
YXZlIG5hdGl2ZSBodyB4Y2hnMTYgaW5zdHJ1Y3Rpb24sIHNvIGxldCBxc3BpbmxvY2sKPiBnZW5l
cmljIGNvZGUgdG8gZGVhbCB3aXRoIGl0LgoKV2UgaGF2ZSBsaGFyeC9zdGhjeCBwYWlyIG9uIHNv
bWUgdmVyc2lvbnMgb2YgcG93ZXJwYy4KClNlZSBodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvbGludXhwcGMtZGV2L3BhdGNoLzIwMjAxMTA3MDMyMzI4LjI0NTQ1ODItMS1ucGln
Z2luQGdtYWlsLmNvbS8KCkNocmlzdG9waGUKCj4gCj4gVXNpbmcgdGhlIGZ1bGwtd29yZCBhdG9t
aWMgeGNoZyBpbnN0cnVjdGlvbnMgaW1wbGVtZW50IHhjaGcxNiBoYXMKPiB0aGUgc2VtYW50aWMg
cmlzayBmb3IgYXRvbWljIG9wZXJhdGlvbnMuCj4gCj4gVGhpcyBwYXRjaCBjYW5jZWxzIHRoZSBk
ZXBlbmRlbmN5IG9mIG9uIHFzcGlubG9jayBnZW5lcmljIGNvZGUgb24KPiBhcmNoaXRlY3R1cmUn
cyB4Y2hnMTYuCj4gCj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJh
YmEuY29tPgo+IENjOiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+Cj4gQ2M6
IEJlbmphbWluIEhlcnJlbnNjaG1pZHQgPGJlbmhAa2VybmVsLmNyYXNoaW5nLm9yZz4KPiBDYzog
UGF1bCBNYWNrZXJyYXMgPHBhdWx1c0BzYW1iYS5vcmc+Cj4gLS0tCj4gICBhcmNoL3Bvd2VycGMv
S2NvbmZpZyB8IDEgKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9LY29uZmlnIGIvYXJjaC9wb3dlcnBjL0tjb25maWcKPiBp
bmRleCAzODZhZTEyZDg1MjMuLjY5ZWM0YWRlNjUyMSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Bvd2Vy
cGMvS2NvbmZpZwo+ICsrKyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnCj4gQEAgLTE1MSw2ICsxNTEs
NyBAQCBjb25maWcgUFBDCj4gICAJc2VsZWN0IEFSQ0hfVVNFX0NNUFhDSEdfTE9DS1JFRgkJaWYg
UFBDNjQKPiAgIAlzZWxlY3QgQVJDSF9VU0VfUVVFVUVEX1JXTE9DS1MJCWlmIFBQQ19RVUVVRURf
U1BJTkxPQ0tTCj4gICAJc2VsZWN0IEFSQ0hfVVNFX1FVRVVFRF9TUElOTE9DS1MJaWYgUFBDX1FV
RVVFRF9TUElOTE9DS1MKPiArCXNlbGVjdCBBUkNIX1VTRV9RVUVVRURfU1BJTkxPQ0tTX1hDSEcz
MglpZiBQUENfUVVFVUVEX1NQSU5MT0NLUwo+ICAgCXNlbGVjdCBBUkNIX1dBTlRfSVBDX1BBUlNF
X1ZFUlNJT04KPiAgIAlzZWxlY3QgQVJDSF9XQU5UX0lSUVNfT0ZGX0FDVElWQVRFX01NCj4gICAJ
c2VsZWN0IEFSQ0hfV0FOVF9MRF9PUlBIQU5fV0FSTgo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
