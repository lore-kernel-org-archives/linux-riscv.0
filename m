Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EB8C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 13:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wt3Q5U4fSVEMugAl1ajEJV/G0zOpyFKAhRx5yc/E0OA=; b=kRqZD2aXCbVLO/
	bbD+u+iuUp227CPsK2gggrAAeS1eigBYi/kveTWIpeeaaZxsUt7/Kp7ZVWxal/cd7SEF7wqgPnA+e
	kqVcHif72vfZddcOyUl47TQVaUz7In6qgnjKihxWK8UzdJ/O7M/keetuFaV/Cqg9Qhdn9KRJf/ZVL
	x5xYIKjlnIac/Q2priG4MGF9dv7JE6llt1mYnetUDGhfLUy5nOSWnuxP0qRL6nyolIiVMEVDfI30p
	x1cyCq3mkurc3q02nM98SwjMXSp6MJPtkO59OD2KnXdICifB7ctdRU8t4C6ijYNf7L09QcfhlTFVQ
	kvyKcVLBb2Z0oQzrK1dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns2SH-00CZuo-Iw; Fri, 20 May 2022 13:14:09 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns2S6-00CZro-UL; Fri, 20 May 2022 13:14:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5885B1477;
 Fri, 20 May 2022 06:13:56 -0700 (PDT)
Received: from bogus (unknown [10.57.66.157])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7272A3F73D;
 Fri, 20 May 2022 06:13:53 -0700 (PDT)
Date: Fri, 20 May 2022 14:13:47 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org,
 Atish Patra <atishp@rivosinc.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>,
 Qing Wang <wangqing@vivo.com>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/8] arch_topology: Don't set cluster identifier as
 physical package identifier
Message-ID: <20220520131347.cgaevw77yjk523mw@bogus>
References: <20220518093325.2070336-1-sudeep.holla@arm.com>
 <20220518093325.2070336-2-sudeep.holla@arm.com>
 <d4c7fd09-814a-e57a-fe8f-a3959472991b@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4c7fd09-814a-e57a-fe8f-a3959472991b@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_061359_060064_2B1ABD80 
X-CRM114-Status: GOOD (  10.64  )
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

T24gRnJpLCBNYXkgMjAsIDIwMjIgYXQgMDI6MzE6MjRQTSArMDIwMCwgRGlldG1hciBFZ2dlbWFu
biB3cm90ZToKPiBPbiAxOC8wNS8yMDIyIDExOjMzLCBTdWRlZXAgSG9sbGEgd3JvdGU6Cj4gCj4g
WW91IHNheSBgY2x1c3RlciBpZGVudGlmaWVyYCB3aGljaCB0byBtZSByZWZlcnMgdG8KPiBgY3B1
X3RvcG9sb2d5W2NwdV0uY2x1c3Rlcl9pZGAuIEJ1dCBJIGd1ZXNzIHlvdSBtZWFudCBgY2x1c3Rl
ciBub2RlYAo+IGZyb20gY3B1LW1hcCBEVCBub2RlPwo+CgpDb3JyZWN0LCBJIGFtIHJlZmVycmlu
ZyB0byB0aGUgbGVhZiBjbHVzdGVyIG5vZGUgaWRlbnRpZmllciBpbiB0ZXJtcwpvZiBjcHUtbWFw
IERUIG5vZGUgd2hpY2ggd2Ugbm93IHN0b3JlIGluIGNwdV90b3BvbG9neVtjcHVdLmNsdXN0ZXJf
aWQgYXMKcGFydCBvZiB0aGlzIHNlcmllcyBpbnN0ZWFkIG9mIHByZXZpb3VzIGNwdV90b3BvbG9n
eVtjcHVdLnBhY2thZ2VfaWQuCgo+IE90aGVyd2lzZSB5b3Ugc2F5IHdlIGxpbmsgKDEubGV2ZWwp
IGNwdS1tYXAgY2x1c3RlciBub2RlcyB0bwo+IGBjbHVzdGVyX2lkXF9zaWJsaW5nYD8gQnV0IHRo
ZW4gKDEpIHdlIHdpbGwgbmV2ZXIgc3VwcG9ydCBuZXN0ZWQKPiBjbHVzdGVycyBhbmQgKDIpIHdo
eSB3b3VsZCB3ZSBuZWVkIGxsYyBzdXBwb3J0IHRoZW4/Cj4KCigxKSBEbyB3ZSBoYXZlIGFueSBw
bGF0Zm9ybXMgd2l0aCBuZXN0ZWQgY2x1c3RlcnMgdG9kYXkgPyBObyBwaGFudG9tCiAgICBjbHVz
dGVycyBwbGVhc2UgYXMgdGhpcyBpcyBpbmZvIHRoYXQgZ2V0cyB0byB0aGUgdXNlcnNwYWNlIGFu
ZCBtdXN0CiAgICByZWZsZWN0IHRoZSByZWFsIGhhcmR3YXJlLiBJZiBvbmUgZXhpc3QsIHRoZW4g
d2UgbmVlZCB0byBhZGQgbmVzdGVkCiAgICBjbHVzdGVyIGlmIHdlIG5lZWQgdG8gc3VwcG9ydCB0
aGF0IGhhcmR3YXJlLiBJIGFtIG5vdCBhd2FyZSBvZiBhbnkKICAgIHBsYXRmb3JtIGluIHBhcnRp
Y3VsYXIgRFQgYmFzZWQgb25lLgooMikgTExDIHdhcyBhZGRlZCB0byBzdXBwb3J0IGNoaXBsZXRz
LiBJSVJDLCBjcHVfY29yZWdyb3VwX21hc2sgd2FzIGNoYW5nZWQKICAgIHRvIHNlbGVjdCB0aGUg
c21hbGxlc3Qgb2YgTExDLCBzb2NrZXQgc2libGluZ3MsIGFuZCBOVU1BIG5vZGUgc2libGluZ3MK
ICAgIHRvIGVuc3VyZSB0aGF0IHRoZSBzY2hlZCBkb21haW4gd2UgYnVpbGQgZm9yIHRoZSBNQyBs
YXllciBpc24ndCBsYXJnZXIKICAgIHRoYW4gdGhlIERJRSBhYm92ZSBpdCBvciBpdCdzIHNocnVu
ayB0byB0aGUgc29ja2V0IG9yIE5VTUEgbm9kZSBpZiBMTEMKICAgIGV4aXN0IGFjcm9zcyBOVU1B
IG5vZGUvY2hpcGxldHMuCgogICBCdXQgb3ZlcnRpbWUsIHdlIGhhdmUgcGF0Y2hlZCBjcHVfY29y
ZWdyb3VwX21hc2sgdG8gd29ya2Fyb3VuZCB0aGluZ3MKICAgd2hpY2ggSSB0aGluayBpcyBub3cg
YWJvdXQgdG8gYnJlYWsg8J+ZgS4KCi0tClJlZ2FyZHMsClN1ZGVlcAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
