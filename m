Return-Path: <SRS0=w96C=J6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6440C433B4
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 06:17:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3715E61249
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 06:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3715E61249
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rowo/BQmFP1Ze/Lh7ilYnpf6dqAepi5SP3x12mbC74s=; b=TSgyk1mYwtz2eph8dZdtgDCwR
	3+uT84RLBj6y8KT/lDv4TSxpnKu+FdMnxYXQU3h8Ctqa+1AA+TN48iYl2bq03KEkrN4k99nk6Qtfb
	vkVdMk63S4IZEeL0Ipcz17g2JBfMdDgZwphJCwBIvmt7edwg8/9m2PnksFm9CyIwx1UOpOmw4cbSv
	AL8hLw6wIKVx+sH1AA77zW8ATPQH17kcTxTIC+yCoMRnWY4/6LdvK3H6SXhhPkFnMVPT2jebqj8wa
	l4SewsFN7mGjOuUNUqMk3oOUrCN2HHYROvt4vmhxOMCnQDZRSm2CGnejiWbosF1CmM3DS/YGlqol/
	xUO+HsPZg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldRtc-00DGfl-Nk; Mon, 03 May 2021 06:17:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldRtO-00DGf7-7Y; Mon, 03 May 2021 06:17:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=jATAUJQ3VkYmFNurPdD8+iCSWrbg2CFByUFGa3HFUao=; b=Ip9D4uw3Sg/Nw/6DMjPo4DWJvj
 oJ6rigrrdzZMk67XZAUFU4J52YPnVZbeZXOTacerKeCkh9g5D/gESQuzPgswrcaA4ykNK4hgtATVm
 M4QKD4kFlWRZFx++XCiICaWSdU7qi7IM5bMhtvUo8rbieUwhGgy7j/+l58WgK0nxMtHNYqjcEneU+
 4OY6AAW1038eNwm/1+nx4+mB4AhNAZSb/G0ya/dDILnu3dcTW50aYFLlVfyE6Pt1zzltLWx1z+AVL
 kxNwtxQbE1JAOPuWYD6WZZeLpOzzH4nI15hyvWcAwUlEbVIbWHzFRrFb5CuXZ48Uzfx1utn8hQL7S
 lNFTvZMA==;
Received: from pegase2.c-s.fr ([93.17.235.10])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldRtK-002rT1-QX; Mon, 03 May 2021 06:17:16 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FYXn84YcGz9sTN;
 Mon,  3 May 2021 08:17:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MGmplfnQL6Sb; Mon,  3 May 2021 08:17:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FYXn83Sl9z9sTM;
 Mon,  3 May 2021 08:17:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5696A8B776;
 Mon,  3 May 2021 08:17:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CP2hKwLive3m; Mon,  3 May 2021 08:17:00 +0200 (CEST)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 140408B775;
 Mon,  3 May 2021 08:17:00 +0200 (CEST)
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20210501151538.145449-1-masahiroy@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <8b5f1d57-1357-affd-565f-f4826f3ecbdf@csgroup.eu>
Date: Mon, 3 May 2021 08:16:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210501151538.145449-1-masahiroy@kernel.org>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210502_231715_069800_7778E6D2 
X-CRM114-Status: GOOD (  10.82  )
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

CgpMZSAwMS8wNS8yMDIxIMOgIDE3OjE1LCBNYXNhaGlybyBZYW1hZGEgYSDDqWNyaXTCoDoKPiBU
aGUgY3VycmVudCBtaW5pbXVtIEdDQyB2ZXJzaW9uIGlzIDQuOSBleGNlcHQgQVJDSD1hcm02NCBy
ZXF1aXJpbmcKPiBHQ0MgNS4xLgo+IAo+IFdoZW4gd2UgZGlzY3Vzc2VkIGxhc3QgdGltZSwgd2Ug
YWdyZWVkIHRvIHJhaXNlIHRoZSBtaW5pbXVtIEdDQyB2ZXJzaW9uCj4gdG8gNS4xIGdsb2JhbGx5
LiBbMV0KPiAKPiBJJ2QgbGlrZSB0byBwcm9wb3NlIEdDQyA1LjIgdG8gY2xlYW4gdXAgYXJjaC9w
b3dlcnBjL0tjb25maWcgYXMgd2VsbC4KCk9uZSBwb2ludCBJIG1pc3NlZCB3aGVuIEkgc2F3IHlv
dXIgcGF0Y2ggZmlyc3QgdGltZSwgYnV0IEkgcmVhbGlzZWQgZHVyaW5nIHRoZSBkaXNjdXNzaW9u
OgoKVXAgdG8gNC45LCBHQ0Mgd2FzIG51bWJlcmVkIHdpdGggMyBkaWdpdHMsIHdlIGhhZCA0Ljgu
MCwgNC44LjEsIC4uLiA0LjguNSwgNC45LjAsIDQuOS4xLCAuLi4uIDQuOS40CgpUaGVuIHN0YXJ0
aW5nIGF0IDUsIEdDQyBzd2l0Y2hlZCB0byBhIDIgZGlnaXRzIHNjaGVtZSwgd2l0aCA1LjAsIDUu
MSwgNS4yLCAuLi4gNS41CgpTbywgdGhhdCBpcyBub3QgR0NDIDUuMSBvciA1LjIgdGhhdCB5b3Ug
c2hvdWxkIHRhcmdldCwgYnV0IG9ubHkgR0NDIDUuClRoZW4gaXQgaXMgdXAgdG8gdGhlIHVzZXIg
dG8gdXNlIHRoZSBsYXRlc3QgYXZhaWxhYmxlIHZlcnNpb24gb2YgR0NDIDUsIHdoaWNoIGlzIDUu
NSBhdCB0aGUgdGltZSAKYmVnaW4sIGp1c3QgbGlrZSB0aGUgdXNlciB3b3VsZCBoYXZlIHNlbGVj
dGVkIDQuOS40IHdoZW4gNC45IHdhcyB0aGUgbWluaW11bSBHQ0MgdmVyc2lvbi4KCkNocmlzdG9w
aGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
