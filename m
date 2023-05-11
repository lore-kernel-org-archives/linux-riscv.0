Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DCBC77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 07:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIsM3inujlm1z99HrN7t3otsAHHNDvC7FggEs6HgrA8=; b=lo9xIyKCdrDpou
	Oc6zFp9z9h5GMudyVScnsMElH+vQ6d3HAYf1qgjsWGSMWob6YvQcJK+V+QLvsB5dgivY2kz+fCRE3
	psvKlEidREPJNmM/1xpfN5YTFWJNKyxbb5BF7LA8ad/Cysvzav1DROItVJXw3U+LQjVFDgZE/4sqd
	M7NCEFHc3WFDL6HJt3fqI0On/ssszN+DklrFYiEOKtGgaRY74xzsPvQEp7yjzI58viD2h/gOujRn1
	Cop4HOrDepBxTS38mxL48B8Y4VlGJVBTNNPFAb+9nw0xxq98SdewnASc2B4YI/q7Rf14lPQjsKfep
	6aYQiJZgzkdFEY4Zd03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px0bp-00871m-06;
	Thu, 11 May 2023 07:21:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px0bm-008712-0T
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 07:21:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9EA4C6171C;
	Thu, 11 May 2023 07:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B69C433D2;
	Thu, 11 May 2023 07:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683789660;
	bh=TX6KY0uZMK4hvOIfunTzmFoUHAawqMV/Ya0zNO9JdSM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DkSbXjvrTS8n54V1AwT7+zmdRaokj0stn/kCaPEI1tNSaOI5Wv5geVxllqbXMwWiY
	 lUDS9168PqnGOaNmWwov+EM3McMS/TCElNYWKm1UlBXbXALhCpzUJgUCKWaux5iHCu
	 pz3y4RJv8xXHsx1Gvv5MAVC8++cGA+5DcWZdhiZQ8hiX9QVhfSAvLeZC1L2JVeKdQP
	 iU4axmsjf89vEwsJycCt6/h3gbYvz7YUHvRv1aJrZL7HaGlfnoVUoxvECbipD1eS8o
	 rvyVKvMVp8nEuMhMhbDhh7AebMV4TfVDluEzlcZvuRlPvm3VuZC8JKhNiJ/sjoSAsT
	 P9YADGY1N2dSw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Song Shuai <suagrfillet@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mhiramat@kernel.org, mark.rutland@arm.com, guoren@kernel.org,
 suagrfillet@gmail.com, jszhang@kernel.org, e.shatokhin@yadro.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH V9 4/4] samples: ftrace: Add riscv support for
 SAMPLE_FTRACE_DIRECT[_MULTI]
In-Reply-To: <20230510101857.2953955-5-suagrfillet@gmail.com>
References: <20230510101857.2953955-1-suagrfillet@gmail.com>
 <20230510101857.2953955-5-suagrfillet@gmail.com>
Date: Thu, 11 May 2023 09:20:57 +0200
Message-ID: <87o7mrjpuu.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_002102_221425_73AE894D 
X-CRM114-Status: UNSURE (   6.07  )
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

U29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPiB3cml0ZXM6Cgo+IHNlbGVjdCBIQVZF
X1NBTVBMRV9GVFJBQ0VfRElSRUNUIGFuZCBIQVZFX1NBTVBMRV9GVFJBQ0VfRElSRUNUX01VTFRJ
Cj4gZm9yIEFSQ0hfUlY2NEkgaW4gYXJjaC9yaXNjdi9LY29uZmlnLiBBbmQgYWRkIHJpc2N2IGFz
bSBjb2RlIGZvcgo+IHRoZSBmdHJhY2UtZGlyZWN0Ki5jIGZpbGVzIGluIHNhbXBsZXMvZnRyYWNl
Ly4KPgo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L2M2OGJhYzgz
LTVjODgtODBiMS1iYWM5LWUxZmQ0ZWE4ZjA3ZUB5YWRyby5jb20vVC8jbWExMzAxMjU2MDMzMWM2
NmIwNTFiNTgwYjNhYjRhMDRiYTQ0NDU1ZWMKPiBUZXN0ZWQtYnk6IEV2Z2VuaWkgU2hhdG9raGlu
IDxlLnNoYXRva2hpbkB5YWRyby5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU29uZyBTaHVhaSA8c3Vh
Z3JmaWxsZXRAZ21haWwuY29tPgo+IFRlc3RlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5v
cmc+Cj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+CgpNeSB1c3Vh
bCAicGxlYXNlIGFsaWduIG9wL29wZXJhbmRzIiBuaXQuIDstKQoKQWNrZWQtYnk6IEJqw7ZybiBU
w7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
