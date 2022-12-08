Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4601FC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 10:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YLFdsNppnx7i+3tZ/X6TB16+QOTaWQ/WetSbE3kcYoA=; b=OZA/fs98ZSqT2F
	VDbRD0TAdThhhNZn2eQYViu1xzC3AAm01nm1ns8HCSoVtDOJJxT+RwHdvnNLe+ndjeYBsaX0O4/34
	RNhu9oXLK4MWGdBtnTVOwF3dqR2mLO5PAiik7BROtBiZJ1/XV5gFNudrBkBoFmn6WQFyc6NKH9yv1
	MXXpeYgNUKkOL3RPESEhBHguDUXb9akxrm8pyrXrjfCjD/+rmRdgLYnEqeCqG3Wpk/kIMd0OR8KWZ
	A1UCD1psSt39Iy7ByHkgam4BsyKwiZFm8o++SrH8NiSIMRp0z3pGqtrJR+XuoZnZP2/8H9fv2TBof
	ld3PGPZrlzYA3lIuHQaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DtW-00BvmA-V0; Thu, 08 Dec 2022 10:12:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DtU-00Bve8-7j
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 10:12:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BEB4FB82322;
	Thu,  8 Dec 2022 10:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A527C433D6;
	Thu,  8 Dec 2022 10:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670494360;
	bh=+BDuaUMsMhaz0oaPEpxgB70uzBkS/ncSmhvf9tLxCTo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BnJ+HS0FkG1a966j7Zf5Q5oxTwnQe7sYJgm3VmPScoexQgnid0pk0craNWT7D3vbG
	 cJ4kXR/2dAxTtJmxItm2OIlazI5ghZrrdbLTwPTHh6GwE1sE/vCssCZHNiu7xu/4jm
	 BfkQOeRaOXH5K3FbBVqWwu14X97RKSDmH1oBEvl0I8fsL9eRUj4ChpIgvaHZPtFyca
	 jk86uHY5w+y5toa5eeUHXVjeZt3Zk5tu8TIc06jGUSoCk6C414axKnlzkXfoHbsZug
	 YEZRREFSrtN/McpAHsIDb3zAk/AX9SynJ0XVZtfJ5FJEZjpHVCprsDtDPaVH5konQe
	 cxo2H0ERZCd8Q==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: guoren@kernel.org, arnd@arndb.de, guoren@kernel.org,
 palmer@rivosinc.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, conor.dooley@microchip.com, heiko@sntech.de,
 jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org,
 chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com,
 zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com,
 chenzhongjin@huawei.com, greentime.hu@sifive.com, andy.chiu@sifive.com,
 ben@decadent.org.uk
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH -next V10 10/10] riscv: stack: Add config of thread
 stack size
In-Reply-To: <20221208025816.138712-11-guoren@kernel.org>
References: <20221208025816.138712-1-guoren@kernel.org>
 <20221208025816.138712-11-guoren@kernel.org>
Date: Thu, 08 Dec 2022 11:12:38 +0100
Message-ID: <87mt7yw6eh.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_021244_471796_90979D3A 
X-CRM114-Status: UNSURE (   5.49  )
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

Z3VvcmVuQGtlcm5lbC5vcmcgd3JpdGVzOgoKPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXgu
YWxpYmFiYS5jb20+Cj4KPiAwY2FjMjFiMDJiYTUgKCJyaXNjIHY6IHVzZSAxNktCIGtlcm5lbCBz
dGFjayBvbiA2NC1iaXQiKSBpbmNyZWFzZSB0aGUKCmNoZWNrcGF0Y2ggY29tcGxhaW5zIGhlcmU6
IFVzZSAiY29tbWl0IFNIQS4uLiIuCgo+IHRocmVhZCBzaXplIG1hbmRhdG9yeSwgYnV0IHNvbWUg
c2NlbmFyaW9zLCBzdWNoIGFzIEQxIHdpdGggYSBzbWFsbAo+IG1lbW9yeSBmb290cHJpbnQsIHdv
dWxkIHN1ZmZlciBmcm9tIHRoYXQuIEFmdGVyIGluZGVwZW5kZW50IGlycSBzdGFjawo+IHN1cHBv
cnQsIGxldCdzIGdpdmUgdXNlcnMgYSBjaG9pY2UgdG8gZGV0ZXJtaW5lIHRoZWlyIGN1c3RvbSBz
dGFjayBzaXplLgoKLi4uYW5kIGFnYWluLCBteSAid2h5IGlzIHRoaXMgaW4gdGhlIGdlbmVyaWMg
ZW50cnkiIHNlcmllcyByYW50LiA6LSkKCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
