Return-Path: <SRS0=1eEn=J4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06822C433B4
	for <linux-riscv@archiver.kernel.org>; Sat,  1 May 2021 17:39:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F786613C5
	for <linux-riscv@archiver.kernel.org>; Sat,  1 May 2021 17:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F786613C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tpeK7s1vdFjZtiOxEPXbMGLAkvG8+JIIFs7U04DPNyM=; b=DvOkOd6irfqLLRRGw34VyHm0t
	DYBzLGEsSQ6HSjqvamq22HGccKKfM5Q1QDi/w/1zaB+50Ghx+ZcMF8+2bXwiIhTsZEyoDo2Q4vbfW
	A4WxGps7ac948QYmFgU66IQow41nwCc3BGiCaUC1o9FewjJIqpvzjpVfpx4h92aXQ4P0Hz1B9wV2j
	ZzblD70TQrmHKR12xcthK/pDd+Ou4eK1g7nhS/ThmerEyan61cIwlswllpYZ5/1D+8D03FPZJscIR
	u8i4Gb9+PJUtsDppjRawupBjulh9rWu+dNS3NNf5e6msEbQZ+oRnUfdQjRhEXnaWTy7cpEg+m46Qm
	JYd/gf8UA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lctZm-00AP4f-JX; Sat, 01 May 2021 17:38:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lctZa-00AP3o-52; Sat, 01 May 2021 17:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=y9pB/aYYeFR14yJydkM15FitIPX/WIGX4x7rCPz9EXY=; b=w0m6LJEoDt4zO1pP4L92yqT+Rv
 LsIoFgmizqn+shp57kq8qzIRUwVSf8O6bbOP8XXDWN7RlXWRE5M2HHzc5/D43BrrF5++CXV2K8Q0i
 v6HtvQE2oxZSH2Qq/Qono/I+2PhZg0CmQcVQuX0DfX+R/sAjlOQ1hn9zvc8EVh1/V3HlSOxdf5okD
 ILYXH2y9NzFHTHvP40pvf0wOxweei2Gox+7ginigdGCRiTqv9XKQKGI4caMvaPp1OSZ6H27gi56Wg
 x2ADaDlR0NHVD1ejRWHunUq4h0Fg/g4kOtCABpNBsepTUFQh6oMmdBsqFJhkvKAKrlciH8VAjjPv7
 189+oQlA==;
Received: from pegase2.c-s.fr ([93.17.235.10])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lctZW-0025Ky-Cu; Sat, 01 May 2021 17:38:32 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FXc090hfmz9sS5;
 Sat,  1 May 2021 19:38:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1YuCsbxWugQ6; Sat,  1 May 2021 19:38:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FXc086Xtbz9sS4;
 Sat,  1 May 2021 19:38:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C4A668B770;
 Sat,  1 May 2021 19:38:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1mDE3OxKH6Jr; Sat,  1 May 2021 19:38:16 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BD8A88B763;
 Sat,  1 May 2021 19:38:15 +0200 (CEST)
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <2ecdbfed-82c4-b0cb-85dc-857b3b06b353@csgroup.eu>
Date: Sat, 1 May 2021 19:38:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210501_103830_646672_922FE686 
X-CRM114-Status: UNSURE (   9.32  )
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

CgpMZSAwMS8wNS8yMDIxIMOgIDE3OjUyLCBNaWd1ZWwgT2plZGEgYSDDqWNyaXTCoDoKPiBPbiBT
YXQsIE1heSAxLCAyMDIxIGF0IDU6MTcgUE0gTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IE1vcmUgY2xlYW51cHMgd2lsbCBiZSBwb3NzaWJsZSBhcyBm
b2xsb3ctdXAgcGF0Y2hlcywgYnV0IHRoaXMgb25lIG11c3QKPj4gYmUgYWdyZWVkIGFuZCBhcHBs
aWVkIHRvIHRoZSBtYWlubGluZSBmaXJzdC4KPiAKPiArMSBUaGlzIHdpbGwgYWxsb3cgbWUgdG8g
cmVtb3ZlIHRoZSBfX2hhc19hdHRyaWJ1dGUgaGFjayBpbgo+IGluY2x1ZGUvbGludXgvY29tcGls
ZXJfYXR0cmlidXRlcy5oLgo+IAo+IFJldmlld2VkLWJ5OiBNaWd1ZWwgT2plZGEgPG9qZWRhQGtl
cm5lbC5vcmc+Cj4gCgpPbiBwb3dlcnBjIHRoaXMgd2lsbCBhbGxvdyB1cyB0byByZW1vdmUgY29t
bWl0IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eHBwYy9saW51eC9jb21taXQvNTkyYmJlOWM1MDVk
CgpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3Vw
LmV1PgoKQ2hyaXN0b3BoZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
