Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14FEC433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 13:37:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CA84610D2
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 13:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CA84610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rjxfqgCXiXO9gCB75PlrlEV4c2M5JvuuJMyLPtiqE3U=; b=DwKMXCGbAbJOgt+qGyqeKCMew
	kvuhOnIzNRO6kFVkH7KWN9SMNe7+0JlUpab/2kgym3DE6g3pt2OSZG4RIDNeoEUeIzp641V9mYpz9
	8RZGmZYfjElmDcwwfCu2XBQq9O3/xD/I/7tOtp8B7ht7e58leFsD631w0F530ztTXVNhdq2B1XILG
	uVk8mgYCcRwOQ/eJ95kl6ys+tlxLR/wms6eVLOfc/MkaS/UTyAfD+8JjCcNZBDA4SZ1gsYIbm4v8M
	b+0CIs1kcHjPjD0G2ajs251zLpW/5tg50u1n3m9My4lZTiGWnmRf/BT8rRa79Z6Spmy2xb5XtKU+f
	LkcY7rYqg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSJz9-00D5rU-Bb; Fri, 02 Apr 2021 13:37:15 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lSJz4-00D5qp-64
 for linux-riscv@lists.infradead.org; Fri, 02 Apr 2021 13:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=tZ/LaANIi5M7NtxlP10sRG+XBo+hd4rG5q
 oxm75toyo=; b=PONDGZ1YFHa6lf9fRfKb0aqAiq72Q3hH/M+WnB59LbD4AI3vkb
 TnEPvgc8X7CZbveXLxz5Gj1RvGzpCbKn6/byBaRxFWMb+Hl8PaTJ906+JSb7p7sZ
 olfHi/XLf04+d4GMzyBFTuSyzCndjzLzwyz8Qow2ekl0IYgz5yCTkeME8=
Received: from xhacker (unknown [101.86.19.180])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygAXIqz_HWdgWQSLAA--.8753S2; 
 Fri, 02 Apr 2021 21:37:04 +0800 (CST)
Date: Fri, 2 Apr 2021 21:32:06 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: "liaochang (A)" <liaochang1@huawei.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Guo Ren <guoren@linux.alibaba.com>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: keep interrupts disabled for BREAKPOINT exception
Message-ID: <20210402213206.7db93785@xhacker>
In-Reply-To: <096752a7-21f9-8339-2e76-8c65859fa1d7@huawei.com>
References: <20210330021624.2b776386@xhacker>
 <20210330183316.942215efe8e6e8455ad14113@kernel.org>
 <20210331222244.45a5807c@xhacker>
 <096752a7-21f9-8339-2e76-8c65859fa1d7@huawei.com>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygAXIqz_HWdgWQSLAA--.8753S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF45trWrAr4xCFW7WF1Dtrb_yoW8AryrpF
 WDJa15KF4kJw18Cas2yw1F9ryFyayrGrWfur98Cw1ftrsxt3s5JryIgFW3Wr1rGr12kw1S
 vFWYyry2qa48ArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyFb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E
 4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
 WUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
 Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rV
 W3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
 JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1GQ6JUUUUU==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_143711_067749_C5A84511 
X-CRM114-Status: GOOD (  13.85  )
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

T24gVGh1LCAxIEFwciAyMDIxIDE2OjQ5OjQ3ICswODAwCiJsaWFvY2hhbmcgKEEpIiA8bGlhb2No
YW5nMUBodWF3ZWkuY29tPiB3cm90ZToKCj4gSGkgSmlzaGVuZywKCkhpLAoKPiAKPiDlnKggMjAy
MS8zLzMxIDIyOjIyLCBKaXNoZW5nIFpoYW5nIOWGmemBkzoKPiA+IE9uIFR1ZSwgMzAgTWFyIDIw
MjEgMTg6MzM6MTYgKzA5MDAKPiA+IE1hc2FtaSBIaXJhbWF0c3UgPG1oaXJhbWF0QGtlcm5lbC5v
cmc+IHdyb3RlOgo+ID4gICAKPiA+PiBIaSBKaXNoZW5nLCAgCj4gPiAKPiA+IEhpIE1hc2FtaSwK
PiA+ICAgCj4gPj4KPiA+PiBPbiBUdWUsIDMwIE1hciAyMDIxIDAyOjE2OjI0ICswODAwCj4gPj4g
SmlzaGVuZyBaaGFuZyA8anN6aGFuZzNAbWFpbC51c3RjLmVkdS5jbj4gd3JvdGU6Cj4gPj4gIAo+
ID4+PiBGcm9tOiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gPj4+Cj4gPj4+
IEN1cnJlbnQgcmlzY3YncyBrcHJvYmUgaGFuZGxlcnMgYXJlIHJ1biB3aXRoIGJvdGggcHJlZW1w
dGlvbiBhbmQKPiA+Pj4gaW50ZXJydXB0IGVuYWJsZWQsIHRoaXMgdmlvbGF0ZXMga3Byb2JlIHJl
cXVpcmVtZW50cy4gRml4IHRoaXMgaXNzdWUKPiA+Pj4gYnkga2VlcGluZyBpbnRlcnJ1cHRzIGRp
c2FibGVkIGZvciBCUkVBS1BPSU5UIGV4Y2VwdGlvbi4gICAgCj4gPj4KPiA+PiBOb3Qgb25seSB3
aGlsZSB0aGUgYnJlYWtwb2ludCBleGNlcHRpb24gYnV0IGFsc28gdW50aWwgdGhlIGVuZCBvZgo+
ID4+IHRoZSBzaW5nbGUgc3RlcCAobWF5YmUgeW91IGFyZSB1c2luZyBfX0JVR19JTlNOXzMyID8/
KSBuZWVkIHRvIGJlCj4gPj4gZGlzYWJsZSBpbnRlcnJ1cHRzLiBDYW4gdGhpcyBkbyB0aGF0Pwo+
ID4+ICAKPiA+IAo+ID4gaW50ZXJydXB0IGlzIGRpc2FibGVkIGR1cmluZyAic2luZ2xlIHN0ZXAi
IGJ5IGtwcm9iZXNfc2F2ZV9sb2NhbF9pcnFmbGFnKCkKPiA+IGFuZCBrcHJvYmVzX3Jlc3RvcmVf
bG9jYWxfaXJxZmxhZygpLiBUaGUgY29kZSBmbG93IGxvb2tzIGxpa2U6IAo+ID4gCj4gPiBkb190
cmFwX2JyZWFrKCkgICAvLyBmb3IgYnAKPiA+ICAga3Byb2JlX2JyZWFrcG9pbnRfaGFuZGxlcigp
Cj4gPiAgICAgc2V0dXBfc2luZ2xlc3RlcCgpCj4gPiAgICAgICBrcHJvYmVzX3Jlc3RvcmVfbG9j
YWxfaXJxZmxhZygpCj4gPiAKPiA+IGRvX3RyYXBfYnJlYWsoKSAgLy8gZm9yIHNzCj4gPiAgIGtw
cm9iZV9zaW5nbGVfc3RlcF9oYW5kbGVyKCkKPiA+ICAgICBrcHJvYmVzX3Jlc3RvcmVfbG9jYWxf
aXJxZmxhZygpICAKPiAKPiBSZWNlbnRseSwga2VybmVsIGhpdCBCVUdfT04oKSBvbiBRRU1VIGFm
dGVyIEkgaW5zdGFsbCBhIHByb2JlIGF0ICJzeXNfcmVhZCIgdmlhIGtwcm9iZSwKClRJUFM6IEVh
Y2ggbGluZSBzaG91bGQgbm90IGV4Y2VlZCA4MCBjaGFycwoKPiBhY2NvcmlkaW5nIHRvIG15IGRl
YnVnZ2luZyBhbmQgYW5hbHlzaXMgaXQgbG9va3MgbGlrZSBjYXVzZWQgYnkgdGhlICJpcnEgZGlz
YWJsZSIgb3BlcmF0aW9uIGZvciBzaW5nbGUtc3RlcHBpbmcuCj4gCj4gSSBwcmVzZW50IGEgZGV0
YWlsZWQgZGVzY3JpcHRpb24gYWJvdXQgdGhpcyBwcm9ibGVtIGluIHRoZSBtYWlsIHdpdGggdGl0
bGUgIltQQVRDSF0gcmlzY3Yva3Byb2JlOiBmaXgga2VybmVsIHBhbmljIHdoZW4gaW52b2tpbmcg
c3lzX3JlYWQgdHJhY2VkIGJ5IGtwcm9iZSIuCj4gTG9va2luZyBmb3J3YXJkIHRvIHNvbWUgZmVl
ZGJhY2ssVGhhbmtzLgo+IAoKSSB3aWxsIGNvbW1lbnQgdGhhdCBwYXRjaC4KCnRoYW5rcwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
