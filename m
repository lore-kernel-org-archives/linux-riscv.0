Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8DDC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 18:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qoSdd89KnREzYuyPJDqq2vHGDYJKy7kEAG6jC64ZvU0=; b=SAYfoLVS7un5hf
	p8eUFbfskgjZ6MF7f8ENhOpafJzoTN//PrQ5E9KBXEONclE6rfpWDY7zFuLkWPNTbjTxplQdlAa/L
	/i2pSjk0viCylqMiNCaK2HDFXzXVh6iOrI58sAivJ6xNqEIPWarc7Bui545u+UTu71ZK2V693N2Ue
	dB2RkENffVpoBzmPGXGLLPe0hEiZ8lFNVLRkO5Eo7lOcTX38Qh2numpBm+DDFnTpRWLdzSZ8qQ+Qs
	fT/X4zbMZHy8ImFSi0vF34BejweX4TkUNCsgrFhrUcQmsrk5iEz+csxRVoZZRuOomWHn6cpddqBio
	0c0taMXXrrhaUar263Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1uUt-003sz8-ON; Thu, 16 Jun 2022 18:45:39 +0000
Received: from smtp04.smtpout.orange.fr ([80.12.242.126] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1uUq-003sxi-BH
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 18:45:38 +0000
Received: from [192.168.1.18] ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id 1uUgoKVZMQKua1uUgoCzF2; Thu, 16 Jun 2022 20:45:31 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 16 Jun 2022 20:45:31 +0200
X-ME-IP: 90.11.190.129
Message-ID: <1285751d-c4af-23ec-148c-88b0e3867e6a@wanadoo.fr>
Date: Thu, 16 Jun 2022 20:45:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drivers: soc: sifive: Add missing of_node_put() in
 sifive_l2_cache.c
Content-Language: en-US
To: Liang He <windhl@126.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220615122315.3965435-1-windhl@126.com>
 <a5f6f76d-efc1-b421-7623-ad46996f5b94@wanadoo.fr>
 <7321db1e.3902.1816b00e5e6.Coremail.windhl@126.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <7321db1e.3902.1816b00e5e6.Coremail.windhl@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_114536_540315_EC3E5A2D 
X-CRM114-Status: UNSURE (   5.39  )
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

TGUgMTYvMDYvMjAyMiDDoCAwNzozMywgTGlhbmcgSGUgYSDDqWNyaXTCoDoKCj4gCj4gU29ycnkg
Zm9yIG15IHRyb3VibGVzLiBJIHdpbGwgY2hlY2sgbXkgcGF0Y2ggbW9yZSBjYXJlZnVsbHkuCgpO
byBwcm9ibGVtLCB5b3Ugc2VlbSB0byBiZSBrbmV3IG9uIHRoZSBsaXN0cyBzbyB5b3UgaGF2ZSB0
byBsZWFybiB0aGUgCnRyaWNrcywgY29kaW5nLXN0eWxlLCB0b29scy4uLgoKSGFwcHkgcGF0Y2hp
bmcgOikKCkNKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
