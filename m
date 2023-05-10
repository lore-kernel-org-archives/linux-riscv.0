Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28F9C77B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 07:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KmuPzxtWQ5l+3CQRq15QL65to6NkqmQvcV2E9D8C1h8=; b=SZPq/4jrAdjT2q
	YdK72im/PrqrgIdui8iJrUq8GbjbwjBBrgmd47zVTKd7k3RycOI4D4nY9p7XwLExJPcI1q8AI2i9l
	tCDOvXUmkfbi0E6TvZERFxE8HefnmlgRE11a/Eh2MskySm7CZIUhC5VVqpM1mEzqWn1mh9XRoD9xs
	4eaDXAct9T64jf1net5rwnLpbf+nsx/lSUmBW1mkCA2mmTILhsiLKf0fFyMk/H75HTf7eUtU5LTJC
	ldJMWoo8sZzdo/YgiinSbN5R2siAtpHqD8m9LjLNCOEUaHfdX28ZaEYU9vtWbuFR2qPCoLsYnPRal
	h4IzSYHQ7s/Ldz2P9Dmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwdws-005Lp8-0a;
	Wed, 10 May 2023 07:09:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwdwp-005LoI-1U
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 07:09:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 61ADD62D2B;
	Wed, 10 May 2023 07:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D514C433D2;
	Wed, 10 May 2023 07:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683702553;
	bh=+clB4KgowCdBV0mrjLZYn4tmrVpCL43g49dGwUiETu4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NHPuozW3dvsESE/msZt0irjjsu/dRADQ1xYQSJhylIncQnOybYMKXulAUagHRx9Ji
	 ET5SSGdHhQYzxHr8YrjVSMzEoqIcOhLalVoNaz2SOf8FJ0IntrSZTwdQ7s/rJwMlw1
	 jngEZWbe9zJAbezg/bFvX6IJAmIUC+J4iJI6CRHWBRI4Oci7P6Mo9MFniuIMsxcERZ
	 tC9Kd4HZwZ/Yi3+VfdCKq6qJjelMpjrIc4uENdoX7XJHeuRgHU7y+InHSkuJnTnyOQ
	 4JUyZvgfcq8Rv7BGR1emIpGw1xT0tYi3Q2K+1RF/D88jnO/5cZq2Gh/ePugcJ2n8u8
	 gCc5Er1UP6EMQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Song Shuai <suagrfillet@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mhiramat@kernel.org, mark.rutland@arm.com, guoren@kernel.org,
 e.shatokhin@yadro.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Song Shuai <suagrfillet@gmail.com>
Subject: Re: [PATCH V8 1/4] riscv: select
 FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
In-Reply-To: <20230324033342.3177979-2-suagrfillet@gmail.com>
References: <20230324033342.3177979-1-suagrfillet@gmail.com>
 <20230324033342.3177979-2-suagrfillet@gmail.com>
Date: Wed, 10 May 2023 09:09:10 +0200
Message-ID: <87a5ycfysp.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_000915_564477_9F78731F 
X-CRM114-Status: UNSURE (   8.11  )
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

U29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPiB3cml0ZXM6Cgo+IEluIFJJU0MtViwg
LWZwYXRjaGFibGUtZnVuY3Rpb24tZW50cnkgb3B0aW9uIGlzIHVzZWQgdG8gc3VwcG9ydAo+IGR5
bmFtaWMgZnRyYWNlIGluIHRoaXMgY29tbWl0IGFmYzc2YjhiODAxMSAoInJpc2N2OiBVc2luZwo+
IFBBVENIQUJMRV9GVU5DVElPTl9FTlRSWSBpbnN0ZWFkIG9mIE1DT1VOVCIpLiBTbyByZWNvcmRt
Y291bnQKPiBkb24ndCBoYXZlIHRvIGJlIGNhbGxlZCB0byBjcmVhdGUgdGhlIF9fbWNvdW50X2xv
YyBzZWN0aW9uIGJlZm9yZQo+IHRoZSB2bWxpbnV4IGxpbmtpbmcuCj4KPiBIZXJlIHNlbGVjdHMg
RlRSQUNFX01DT1VOVF9VU0VfUEFUQ0hBQkxFX0ZVTkNUSU9OX0VOVFJZIHRvIHRlbGwKPiBNYWtl
ZmlsZSBub3QgdG8gcnVuIHJlY29yZG1jb3VudC4KPgo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LXJpc2N2L0NBQVlzMj1qM0Vhazl2VTZ4YkF3MHpQdW9oMDByaDh2NUMyVTNm
ZVBrb2taRmliV3MyZ0BtYWlsLmdtYWlsLmNvbS9ULyN0Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtcmlzY3YvWTRqdGZySnQrJTJGUTVuTU96QHNwdWQvCj4gU2lnbmVkLW9m
Zi1ieTogU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPgo+IFRlc3RlZC1ieTogR3Vv
IFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVu
QGtlcm5lbC5vcmc+CgpBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
