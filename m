Return-Path: <SRS0=oqq8=TB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB78C43219
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  1 May 2019 20:33:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FB5C20656
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  1 May 2019 20:33:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ONJHMhQ/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FB5C20656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BwPSsW0JJuyB2ZimV7n24ZpmKhf+Ch51vc7vTtZb5Nk=; b=ONJHMhQ/88W2vY
	wVPZWHuGJtV6MbaRKYHchX7ja3qOV0fnP/LFAHhG5GQGf4okEDJ1uaBrfyXAPNqSXO/TfkNXB0Hvs
	e0mAPi4mahh2esMbWabFgwbrF8M8QvAGn9qi0h3VVMsid/Y2gIdopzEhMZQZOalNg9+mCXPIOUUin
	3HPw7UvPabMUek6XsrFEUiHpVPOh9E+XQun9nCyC3HqCp41+rEwgooB1QN7XmmIaX0ShTSawtcOXU
	m8oypE7i66xsCXOHlyItER745l/erX6eYro7tpVuSDblgRRM7VKROwmm5rfeIFL30y5/LmePBvVuM
	1xhL4eUUTen8ppioWm7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLvui-00063c-21; Wed, 01 May 2019 20:33:12 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLvue-000634-O5
 for linux-riscv@lists.infradead.org; Wed, 01 May 2019 20:33:10 +0000
Received: from excalibur.cnev.de ([213.196.200.188]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MXYAj-1hGI2t16Yp-00Yxxl; Wed, 01 May 2019 22:32:52 +0200
Received: from karsten by excalibur.cnev.de with local (Exim 4.89)
 (envelope-from <merker@debian.org>)
 id 1hLvuK-0000JY-Jd; Wed, 01 May 2019 22:32:48 +0200
Date: Wed, 1 May 2019 22:32:48 +0200
From: Karsten Merker <merker@debian.org>
To: Anup Patel <anup@brainfault.org>, Mark Rutland <mark.rutland@arm.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "zong@andestech.com" <zong@andestech.com>,
 Atish Patra <atish.patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] RISC-V: Add an Image header that boot loader can parse.
Message-ID: <20190501203248.oadcldefusc2ighv@excalibur.cnev.de>
References: <mhng-cab2c6b9-f623-4286-99a4-61e4b3a58761@palmer-si-x1e>
 <e801ca8b-c8e2-d8b1-d55a-744414db77e3@wdc.com>
 <20190501170053.GG11740@lakrids.cambridge.arm.com>
 <CAAhSdy2OuCb6wBrs-O=fTWo0D_CgwTztfV-kMDi=tPmSJhM7og@mail.gmail.com>
 <20190501195443.trgjv6tujctsw5sw@excalibur.cnev.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190501195443.trgjv6tujctsw5sw@excalibur.cnev.de>
X-No-Archive: yes
User-Agent: NeoMutt/20170113 (1.7.2)
X-Provags-ID: V03:K1:uAFOUbMAST/fg63gGkCxdt/hO21IE0Vf8MY/Ms1ItZjbUKKeRaM
 X3ziOi00VTr0wfRTUPku62LmNHlcdHKpp8aqgEypwoZwWgBcyZgLKum6sg6yZZpAK2dOxAc
 nF/rWnvuGYeP4ket1h/vVRh8ElovIybmZuVDHzPAPHGE+Zn9C3lM76BMHWkWc2BABa8CABQ
 ELwBTDw9ewm1qd8ZngyVg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xhj0qQJdr/8=:2CTkHkDNXsJsE4iCWO5dGZ
 BsdK0s641viw46BVtn9Dn7tnCjRB48pPsqevSrPPzLTeLheVoKH6VVF8X3wbe/e1A5ADPY9uO
 F6kxiXkfJX1u7wUzI597bik0oD1Q4T/a6Qo4LbYvhjVsANX4Aay1V6hcz1/N/Yejed1ZvFMH8
 gpDywyK0iMhAksuE+lUEgPLjFcG8fqzbQmIE3qOPiuS0Srla/w7dPJ0TXMjph93xBTEN0ZijW
 2lRM7b+BsgW9WVdFUC0ioivjHcBGIrC8vNySgjo6rHLxhYncQTfmvBja0pUH8J9tAvDA8OY19
 7KJsHZz5s3UTmOMFOW9jpRiE+OIsA3IMXsFfq1nFTrnRZEV3b99AKPwLWCHH1JUulK7p21ZzV
 TEz4H5nyNf0jUXz6gjTNWKsqJsU8G8IeS6EySdb54WqQDYq8/MKDlpt5lAp7Qfj6JXqH9w7yj
 qLshvo0KwBP71aG520MA0qEEzpapm4NbVWiN7WctYsFYQ6JsItWMePn4ID+RLYlCIR2+strG2
 dDs6pJ0q93Q0Ia/2YjdVXQEj9cwC6RFNIdHpzGi0jZAHglLq/EwPElhMGz08TRhC/Fzf7jT6X
 klVMmo5fb8OClfps8V362x74R1UfFYz+fIrz3D9jNf5WfsXwJuHPJwyH8n2krzTYv48l7HUIH
 tIUCrLxPPYdvbFaHQPFOK9sPl3QZalaSyUKXBIAZlYfWagXnKHtzhua6/sP0gz5oT129h8mdp
 8AcIxS/Q3pD5ibzIBUCx4wuddq+8jLpnvlSC9A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190501_133309_091353_273102F0 
X-CRM114-Status: GOOD (  12.45  )
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
Cc: Karsten Merker <merker@debian.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXkgMDEsIDIwMTkgYXQgMDk6NTQ6NDNQTSArMDIwMCwgS2Fyc3RlbiBNZXJrZXIg
d3JvdGU6Cj4gT24gV2VkLCBNYXkgMDEsIDIwMTkgYXQgMTA6NDE6NTJQTSArMDUzMCwgQW51cCBQ
YXRlbCB3cm90ZToKPiA+IE9uIFdlZCwgTWF5IDEsIDIwMTkgYXQgMTA6MzAgUE0gTWFyayBSdXRs
YW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4gd3JvdGU6Cj4gPiA+IE9uIE1vbiwgQXByIDI5LCAy
MDE5IGF0IDEwOjQyOjQwUE0gLTA3MDAsIEF0aXNoIFBhdHJhIHdyb3RlOgo+ID4gPiA+IE9uIDQv
MjkvMTkgNDo0MCBQTSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gPiA+ID4gPiBPbiBUdWUsIDIz
IEFwciAyMDE5IDE2OjI1OjA2IFBEVCAoLTA3MDApLCBhdGlzaC5wYXRyYUB3ZGMuY29tIHdyb3Rl
OgoKPiBQcm9iYWJseSBJJ20gbWlzc2luZyBzb21ldGhpbmcgb2J2aW91cywgYnV0IEkgY2Fubm90
IGNvbXBsZXRlbHkKPiBmb2xsb3cgeW91IGhlcmUuIE15IHVuZGVyc3RhbmRpbmcgaXMgYXMgZm9s
bG93czoKWy4uLl0KPiBJZiB0aGUgZmlyc3QgYnl0ZSBpbiBhIFBFL0NPRkYgaGVhZGVyIGhhcyB0
byBiZSBhbiBBU0NJSSAiTSIsCj4gdGhhdCBpcyAwMTAwMTEwMSBpbiBiaW5hcnkuICBSSVNDLVYg
aXMgbGl0dGxlLWVuZGlhbiBhbmQgdGhlIGxhc3QKPiB0d28gYml0cyBvZiB0aGUgbG93ZXN0LXZh
bHVlIGJ5dGUgZGVmaW5lIHRoZSB0eXBlIG9mIGluc3RydWN0aW9uLiAKPiBBY2NvcmRpbmcgdG8g
dGhlIGNoYXB0ZXIgIkJhc2UgSW5zdHJ1Y3Rpb24tTGVuZ3RoIEVuY29kaW5nIiBpbgo+IHRoZSBS
SVNDLVYgSVNBIHNwZWMgZXZlcnl0aGluZyBleGNlcHQgMTEgYXMgdGhlIGxvd2VzdCBiaXRzCj4g
ZGVub3RlcyBhIGNvbXByZXNzZWQgaW5zdHJ1Y3Rpb24gYW5kIGlmIEkgaGF2ZSBwdXp6ZWxlZCB0
b2dldGhlcgo+IHRoZSB0aGUgdmFyaW91cyBpbnN0cnVjdGlvbiBiaXRzIGNvcnJlY3RseSwgQVND
SUkgIk1aIiB3b3VsZCBiZQo+IGV4Y3V0ZWQgYXMgYSBjb21wcmVzc2VkIGxvYWQgaW1tZWRpYXRl
IHRvIHg5L3MxLCB3b3VsZG4ndCBpdD8KClNvcnJ5LCBJIGhhdmUgbWlzaW50ZXJwcmV0ZWQgYSBi
aXRmaWVsZCBpbiB0aGUgc3BlYywgaXQncyBpbmRlZWQKYSBjb21wcmVzc2VkIGxvYWQgaW1tZWRp
YXRlIHRvIHgyMC9zNC4KClJlZ2FyZHMsCkthcnN0ZW4KLS0gCkljaCB3aWRlcnNwcmVjaGUgaGll
cm1pdCBhdXNkcsO8Y2tsaWNoIGRlciBOdXR6dW5nIHNvd2llIGRlcgpXZWl0ZXJnYWJlIG1laW5l
ciBwZXJzb25lbmJlem9nZW5lbiBEYXRlbiBmw7xyIFp3ZWNrZSBkZXIgV2VyYnVuZwpzb3dpZSBk
ZXIgTWFya3QtIG9kZXIgTWVpbnVuZ3Nmb3JzY2h1bmcuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
