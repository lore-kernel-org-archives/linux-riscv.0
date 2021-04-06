Return-Path: <SRS0=fjc5=JD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F08C433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 07:28:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53C8E613BD
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 07:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53C8E613BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7HgaK37JrVgSRGyhi+SyO1kuV5FV39Z4fXNcoFSheMo=; b=Rcx3aTJjRUUEW5HHdhcNb11RD
	8j5oZ2E2+DqRdUgzvp22l5bkcci/t02wNk+CWnOIyfOiTLOlTe/f4LDy+Q2qAQ56jzq57Wj2wQru+
	QP5dobifgG/x6gMLkMAiqivtsWJqrUr/lHQJcJJDwykMOumYLwWTjEuuJfalurxmYUiYEHVGzviun
	1QTaYpnHW7PQTM3qJ1W2PP+cwck+5YkuIsDi/CV9QQ+v85xQN/ZF9Edr4PaWTZcVgP9YkFv+TsMT2
	CeIzqwObO0FDHBDqpUyROrNHvGQ+JlM16q/7ht7wW1EpJf7sxv6DNL6B75AnaTA28wD1Pz2dLWFhN
	edtwpCIPg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTg87-001nPQ-Ih; Tue, 06 Apr 2021 07:28:08 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTg81-001nOK-PY
 for linux-riscv@lists.infradead.org; Tue, 06 Apr 2021 07:28:03 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FDzZx15dzz19Kn3;
 Tue,  6 Apr 2021 15:25:45 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Tue, 6 Apr 2021 15:27:51 +0800
Subject: Re: [PATCH] riscv: keep interrupts disabled for BREAKPOINT exception
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
CC: Masami Hiramatsu <mhiramat@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Guo Ren <guoren@linux.alibaba.com>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20210330021624.2b776386@xhacker>
 <20210330183316.942215efe8e6e8455ad14113@kernel.org>
 <20210331222244.45a5807c@xhacker>
 <096752a7-21f9-8339-2e76-8c65859fa1d7@huawei.com>
 <20210402213206.7db93785@xhacker>
From: "liaochang (A)" <liaochang1@huawei.com>
Message-ID: <a00d3c12-bbb9-1849-47ce-75c320ed5900@huawei.com>
Date: Tue, 6 Apr 2021 15:27:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20210402213206.7db93785@xhacker>
X-Originating-IP: [10.67.110.108]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_082802_129828_8D3CAB2D 
X-CRM114-Status: UNSURE (   9.54  )
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

SGkgSmlzaGVuZywKCuWcqCAyMDIxLzQvMiAyMTozMiwgSmlzaGVuZyBaaGFuZyDlhpnpgZM6Cj4g
T24gVGh1LCAxIEFwciAyMDIxIDE2OjQ5OjQ3ICswODAwCj4gImxpYW9jaGFuZyAoQSkiIDxsaWFv
Y2hhbmcxQGh1YXdlaS5jb20+IHdyb3RlOgo+IAo+PiBIaSBKaXNoZW5nLAo+IAo+IEhpLAo+IAo+
Pgo+PiDlnKggMjAyMS8zLzMxIDIyOjIyLCBKaXNoZW5nIFpoYW5nIOWGmemBkzoKPj4+IE9uIFR1
ZSwgMzAgTWFyIDIwMjEgMTg6MzM6MTYgKzA5MDAKPj4+IE1hc2FtaSBIaXJhbWF0c3UgPG1oaXJh
bWF0QGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4gICAKPj4+PiBIaSBKaXNoZW5nLCAgCj4+Pgo+Pj4g
SGkgTWFzYW1pLAo+Pj4gICAKPj4+Pgo+Pj4+IE9uIFR1ZSwgMzAgTWFyIDIwMjEgMDI6MTY6MjQg
KzA4MDAKPj4+PiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nM0BtYWlsLnVzdGMuZWR1LmNuPiB3cm90
ZToKPj4+PiAgCj4+Pj4+IEZyb206IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4K
Pj4+Pj4KPj4+Pj4gQ3VycmVudCByaXNjdidzIGtwcm9iZSBoYW5kbGVycyBhcmUgcnVuIHdpdGgg
Ym90aCBwcmVlbXB0aW9uIGFuZAo+Pj4+PiBpbnRlcnJ1cHQgZW5hYmxlZCwgdGhpcyB2aW9sYXRl
cyBrcHJvYmUgcmVxdWlyZW1lbnRzLiBGaXggdGhpcyBpc3N1ZQo+Pj4+PiBieSBrZWVwaW5nIGlu
dGVycnVwdHMgZGlzYWJsZWQgZm9yIEJSRUFLUE9JTlQgZXhjZXB0aW9uLiAgICAKPj4+Pgo+Pj4+
IE5vdCBvbmx5IHdoaWxlIHRoZSBicmVha3BvaW50IGV4Y2VwdGlvbiBidXQgYWxzbyB1bnRpbCB0
aGUgZW5kIG9mCj4+Pj4gdGhlIHNpbmdsZSBzdGVwIChtYXliZSB5b3UgYXJlIHVzaW5nIF9fQlVH
X0lOU05fMzIgPz8pIG5lZWQgdG8gYmUKPj4+PiBkaXNhYmxlIGludGVycnVwdHMuIENhbiB0aGlz
IGRvIHRoYXQ/Cj4+Pj4gIAo+Pj4KPj4+IGludGVycnVwdCBpcyBkaXNhYmxlZCBkdXJpbmcgInNp
bmdsZSBzdGVwIiBieSBrcHJvYmVzX3NhdmVfbG9jYWxfaXJxZmxhZygpCj4+PiBhbmQga3Byb2Jl
c19yZXN0b3JlX2xvY2FsX2lycWZsYWcoKS4gVGhlIGNvZGUgZmxvdyBsb29rcyBsaWtlOiAKPj4+
Cj4+PiBkb190cmFwX2JyZWFrKCkgICAvLyBmb3IgYnAKPj4+ICAga3Byb2JlX2JyZWFrcG9pbnRf
aGFuZGxlcigpCj4+PiAgICAgc2V0dXBfc2luZ2xlc3RlcCgpCj4+PiAgICAgICBrcHJvYmVzX3Jl
c3RvcmVfbG9jYWxfaXJxZmxhZygpCj4+Pgo+Pj4gZG9fdHJhcF9icmVhaygpICAvLyBmb3Igc3MK
Pj4+ICAga3Byb2JlX3NpbmdsZV9zdGVwX2hhbmRsZXIoKQo+Pj4gICAgIGtwcm9iZXNfcmVzdG9y
ZV9sb2NhbF9pcnFmbGFnKCkgIAo+Pgo+PiBSZWNlbnRseSwga2VybmVsIGhpdCBCVUdfT04oKSBv
biBRRU1VIGFmdGVyIEkgaW5zdGFsbCBhIHByb2JlIGF0ICJzeXNfcmVhZCIgdmlhIGtwcm9iZSwK
PiAKPiBUSVBTOiBFYWNoIGxpbmUgc2hvdWxkIG5vdCBleGNlZWQgODAgY2hhcnMKPiAKPj4gYWNj
b3JpZGluZyB0byBteSBkZWJ1Z2dpbmcgYW5kIGFuYWx5c2lzIGl0IGxvb2tzIGxpa2UgY2F1c2Vk
IGJ5IHRoZSAiaXJxIGRpc2FibGUiIG9wZXJhdGlvbiBmb3Igc2luZ2xlLXN0ZXBwaW5nLgo+Pgo+
PiBJIHByZXNlbnQgYSBkZXRhaWxlZCBkZXNjcmlwdGlvbiBhYm91dCB0aGlzIHByb2JsZW0gaW4g
dGhlIG1haWwgd2l0aCB0aXRsZSAiW1BBVENIXSByaXNjdi9rcHJvYmU6IGZpeCBrZXJuZWwgcGFu
aWMgd2hlbiBpbnZva2luZyBzeXNfcmVhZCB0cmFjZWQgYnkga3Byb2JlIi4KPj4gTG9va2luZyBm
b3J3YXJkIHRvIHNvbWUgZmVlZGJhY2ssVGhhbmtzLgo+Pgo+IAo+IEkgd2lsbCBjb21tZW50IHRo
YXQgcGF0Y2guCgpUaGFua3MgZm9yIHlvdXIgcmVtaW5kZXIuCgo+IAo+IHRoYW5rcwo+IAo+IC4K
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
