Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD8FC5B572
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 15:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EKZ8n/imR/py8/tHCvoC235Q2NDualLq7xKHhvPvgAg=; b=A4LPGb/uPA8eeF
	XnciwaHMortkrd9naNKhtTmhLkFhOHXJiQSj7yOCWfLYU3gv0POCvt7kzckHX4F6hpPtBadxm8bXc
	s6zKxNPq+PmC9nPRGyVlWkbm9oNxxLC26Uj+QO0EjVNALoVBBAo2BMUmyaEIVz2+81IaMfc0jXMBK
	s+3iUstPooapmxnpf+R9i8X1KFKgt0en0ALgh2aLUykS9fRpKNGh1UV5PhDvgLOt+YQ+RjyY4iAgG
	wk1NhwDntLvy8CGh4WhC9Fo2GrC+5dubqxjhRJjx3FV58NhqAtQPmMu0FCvjJXtFmBQ/9jKoVIPeA
	epU9jlSBYzH7CsPl59kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvchO-00000004rRd-17cM;
	Sun, 16 Aug 2026 15:22:58 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvchL-00000004rR9-1H9Q
	for linux-riscv@lists.infradead.org;
	Sun, 16 Aug 2026 15:22:57 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id F2731CC584;
	Sun, 16 Aug 2026 18:22:44 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro F2731CC584
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1786893766;
	bh=SA2K+pNLJJgTDGVGtIENx8Hsm7HrJO7svJmOZIHbdTw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=dWemIRkKKSY7l1cYXHVoC3wgPsLg86aFVpEqc1b7VFmEACWlIV65RV7Vb03nqUS9j
	 X5/tnEzKXwVTON19NdQB8fFK0gsyHZpc/Gs/T6xv9NIzHXn1WpDquFLxi5If/6YQWL
	 SR4rXbIQMr6A3R3GeBhd8qqRz6pkziQjvA0ORj5g+MtEEDEa1Aaoa5HeZOJ3G2puiP
	 kyNNOWRygMY65sPmUx4JrheyOG7z7X4JpSBjIUzcdcCZbjQxGUObInIr32iIBFrNtV
	 BeBN8JQ9lb36PEWUGyyTcTsYksTv6XiHlCG9JYb4NeGRp9slwiCv99TY6iWBDBH7f7
	 /Mo7lkg6yuWCg==
Message-ID: <f54332aa3683bfb5e3eb340c9a7d94cc1f5ffe4c.camel@rendec.net>
Subject: Re: [PATCH 4/5] irqchip/aclint-sswi: Use IPI_MAX for IPI muxing
From: Radu Rendec <radu@rendec.net>
To: Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu,
 alex@ghiti.fr, 	tglx@kernel.org, daniel.lezcano@kernel.org,
 anup@brainfault.org, 	hui.wang@canonical.com, samuel.holland@sifive.com
Date: Sun, 16 Aug 2026 11:22:42 -0400
In-Reply-To: <20260816070049.2097442-5-guoren@kernel.org>
References: <20260816070049.2097442-1-guoren@kernel.org>
	 <20260816070049.2097442-5-guoren@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_082255_889595_4C8C1C4B 
X-CRM114-Status: GOOD (  11.72  )
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

T24gU3VuLCAyMDI2LTA4LTE2IGF0IDA3OjAwICswMDAwLCBHdW8gUmVuIHdyb3RlOgo+IEZyb206
ICJHVU8gUmVuIChYdWFuVGllKSIgPGd1b3JlbkBrZXJuZWwub3JnPgo+IAo+IFJlcGxhY2UgdGhl
IGhhcmQtY29kZWQgQklUU19QRVJfQllURSB3aXRoIElQSV9NQVggbm93IHRoYXQgdGhlIGNvbnN0
YW50Cj4gaXMgZXhwb3J0ZWQgZnJvbSByaXNjdiBhc20vc21wLmguCj4gCj4gU2lnbmVkLW9mZi1i
eTogR1VPIFJlbiAoWHVhblRpZSkgPGd1b3JlbkBrZXJuZWwub3JnPgo+IC0tLQo+IMKgZHJpdmVy
cy9pcnFjaGlwL2lycS1hY2xpbnQtc3N3aS5jIHwgNCArKy0tCj4gwqAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2lycWNoaXAvaXJxLWFjbGludC1zc3dpLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLWFjbGludC1z
c3dpLmMKPiBpbmRleCBjYTA2ZWZkODZmYTEuLjVlMDEwZmM0MDFmNyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2lycWNoaXAvaXJxLWFjbGludC1zc3dpLmMKPiArKysgYi9kcml2ZXJzL2lycWNoaXAv
aXJxLWFjbGludC1zc3dpLmMKPiBAQCAtMTM4LDcgKzEzOCw3IEBAIHN0YXRpYyBpbnQgX19pbml0
IGFjbGludF9zc3dpX3Byb2JlKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUpCj4gwqAJfQo+
IMKgCj4gwqAJLyogUmVnaXN0ZXIgU1NXSSBpcnEgYW5kIGhhbmRsZXIgKi8KPiAtCXZpcnEgPSBp
cGlfbXV4X2NyZWF0ZShCSVRTX1BFUl9CWVRFLCBhY2xpbnRfc3N3aV9pcGlfc2VuZCk7Cj4gKwl2
aXJxID0gaXBpX211eF9jcmVhdGUoSVBJX01BWCwgYWNsaW50X3Nzd2lfaXBpX3NlbmQpOwo+IMKg
CWlmICh2aXJxIDw9IDApIHsKPiDCoAkJcHJfZXJyKCJ1bmFibGUgdG8gY3JlYXRlIG11eGVkIElQ
SXNcbiIpOwo+IMKgCQlpcnFfZGlzcG9zZV9tYXBwaW5nKHNzd2lfaXBpX3ZpcnEpOwo+IEBAIC0x
NTIsNyArMTUyLDcgQEAgc3RhdGljIGludCBfX2luaXQgYWNsaW50X3Nzd2lfcHJvYmUoc3RydWN0
IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSkKPiDCoAkJCcKgIGFjbGludF9zc3dpX3N0YXJ0aW5nX2Nw
dSwKPiDCoAkJCcKgIGFjbGludF9zc3dpX2R5aW5nX2NwdSk7Cj4gwqAKPiAtCXJpc2N2X2lwaV9z
ZXRfdmlycV9yYW5nZSh2aXJxLCBCSVRTX1BFUl9CWVRFKTsKPiArCXJpc2N2X2lwaV9zZXRfdmly
cV9yYW5nZSh2aXJxLCBJUElfTUFYKTsKPiDCoAo+IMKgCXJldHVybiAwOwo+IMKgfQoKUmV2aWV3
ZWQtYnk6IFJhZHUgUmVuZGVjIDxyYWR1QHJlbmRlYy5uZXQ+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
