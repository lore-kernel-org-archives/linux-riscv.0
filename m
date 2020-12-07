Return-Path: <SRS0=7obj=FL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2A3C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 09:34:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B38722ADF
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 09:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B38722ADF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0BIyYCqArYrYgPsSMYlWcJiuPySL+EEuDKoenhha1Hg=; b=L3bvZ/d2FPIoJ0Ns+VvLTCd/H
	6i8ZZbnuanqyh81GRa6MgKVtmpWO9xYCKDjbDX0f3iaGhmtZkWfgmgrzBMlcbpg+/85akHAki+McU
	vRAnNwNz03jlFFiYg4HzyZvNO1XMbRbVjPUQqOyQKa9/1CMyh5Jd2hufMAPjVCz3wCg4pLozUhT3N
	cVuEktbLr+7hTUiSGlaq7LoS6IJsG4sHMaGatDRoqR9iSCcjb1B1IQ9eRmkb/AnxDqIViqf6j0NxU
	9TX1uYBi0W3NLrVNqZMouWXcCDwS5qhDBQBtM+0G5xOoo+hUDX9rn/SbuDiOkLMy0rj6DISsIhMJE
	Qo7oCroVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmCuM-00058X-4Z; Mon, 07 Dec 2020 09:34:14 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmCuI-00056p-V5
 for linux-riscv@lists.infradead.org; Mon, 07 Dec 2020 09:34:12 +0000
Received: from [192.168.1.155] ([95.114.88.149]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MnFps-1kKX8C3xeW-00jMNg; Mon, 07 Dec 2020 10:33:57 +0100
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To: Jason Wang <jasowang@redhat.com>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <43f1ee89-89f3-95a3-58f1-7a0a12c2b92f@metux.net>
 <37a9fbc6-d75f-f6cd-f052-0dd416594a84@redhat.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <635faeb7-950e-e594-3217-69032ed9cbd1@metux.net>
Date: Mon, 7 Dec 2020 10:33:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <37a9fbc6-d75f-f6cd-f052-0dd416594a84@redhat.com>
Content-Language: tl
X-Provags-ID: V03:K1:uyhQiyLYIW2+ht8ujHR3ocz5i10aYyRMp5NddJBt91W9n5CxJwR
 er36oazoeWX6Z4GoxbZ4xMlWA2hLnzmUFiqcqQ27WHsxdfoIKkY80aa0wg3rp35pxb4fsHa
 qq31FRXicF33+I6GzajXHH8RM8IxzkBTzHN10gwSpdWEp8HTG7lSlVp8TeRIQ6zeqbeuI4H
 nanv24HHaY/Fs3hmOKHhQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VPbMj2CC5EU=:LIkWLnAHT3uJ58igbF8Wwa
 mOWcFo1umrUdXT3rFzQZssgyXE7NjwxsmPUDVQfcMDQXkMc0RnUbhBaup+JcQ4asNXwq6Iu7M
 /KCeGfavK6h7OmGFrz7pTaa2kbrJiBrV9RVgRjzqfKC8CB0/usK43jBYxF3HiduIcT88wRn+M
 bxVgXNZ+ezdB9t9YeHY0L77yLRS8u3BP48hzVmEGTvON1SuPutR7yHGKpOLQNQyqCx/2wvQ7O
 dVle384Glr4IDdg/+TCbJ0aJLYxL6J6aBJo8x1XfGBXeTqYLEnbdBLCOk4oruOKoP0mVQQdC1
 DDOQx4myVQBUBng2gLmV2XE2TCQMMf/bUEQrRXVYfSUJ6wfbL5vBq69poFRc8vNxgv6eI4Y4L
 a0k0aLt0+PCj0RmiqZ53Gtnunn+BCBsPI/D7XwSFDzl0mkE2QIXweKnQ/Z65N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_043411_263944_F948F907 
X-CRM114-Status: GOOD (  29.61  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: corbet@lwn.net, mst@redhat.com, linus.walleij@linaro.org,
 linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDcuMTIuMjAgMDQ6NDgsIEphc29uIFdhbmcgd3JvdGU6CgpIaSwKCj4+PiBOb3QgYSBuYXRp
dmUgc3BlYWtlciBidXQgZXZlbnQgc291bmRzIGxpa2Ugc29tZXRoaW5nIGRyaXZlciByZWFkIGZy
b20KPj4+IGRldmljZS4gTG9va2luZyBhdCB0aGUgYmVsb3cgbGlzdHMsIG1vc3Qgb2YgdGhlbSBl
eGNlcHQgZm9yCj4+PiBWSVJUSU9fR1BJT19FVl9IT1NUX0xFVkVMIGxvb2tzIG1vcmUgbGlrZSBh
IGNvbW1hbmQuCj4+IG9rYXksIHNoYWxsIEkgbmFtZSBpdCAibWVzc2FnZSIgPwo+IAo+IAo+IEl0
IG1pZ2h0IGJlIGJldHRlci4KCk9rYXksIHJlbmFtZWQgdG8gbWVzc2FnZXMgaW4gdjMuCgo+Pj4g
I2RlZmluZSBWSVJUSU9fTkVUX09LwqDCoMKgwqAgMAo+Pj4gI2RlZmluZSBWSVJUSU9fTkVUX0VS
UsKgwqDCoCAxCj4+IGhtbSwgc28gSSdkIG5lZWQgdG8gZGVmaW5lIGFsbCB0aGUgZXJyb3IgY29k
ZXMgdGhhdCBwb3NzaWJseSBjb3VsZAo+PiBoYXBwZW4gPwo+IAo+IAo+IFllcywgSSB0aGluayB5
b3UgbmVlZC4KCk9rYXksIGdvaW5nIHRvIGRvIGl0IGluIHRoZSBuZXh0IHZlcnNpb24uCgo+Pj4g
SWYgSSByZWFkIHRoZSBjb2RlIGNvcnJlY3RseSwgdGhpcyBleHBlY3RzIHRoZXJlIHdpbGwgYmUg
YXQgbW9zdCBhCj4+PiBzaW5nbGUgdHlwZSBvZiBldmVudCB0aGF0IGNhbiBiZSBwcm9jZXNzZWQg
YXQgdGhlIHNhbWUgdGltZS4gRS5nIGNhbgo+Pj4gdXBwZXIgbGF5ZXIgd2FudCB0byByZWFkIGZy
b20gZGlmZmVyZW50IGxpbmVzIGluIHBhcmFsbGVsPyBJZiB5ZXMsIHdlCj4+PiBuZWVkIHRvIGRl
YWwgd2l0aCB0aGF0Lgo+PiBATGludXMgQEJhcnRvc3o6IGNhbiB0aGF0IGhhcHBlbiBvciBkb2Vz
IGdwaW8gc3Vic3lzIGFscmVhZHkgc2VyaWFsaXplCj4+IHJlcXVlc3RzID8KPj4KPj4gSW5pdGlh
bGx5LCBJIHRyaWVkIHRvIHByb3RlY3QgaXQgYnkgc3BpbmxvY2sgKHNvLCBvbmx5IG9uZSByZXF1
ZXN0IG1heQo+PiBydW4gYXQgYSB0aW1lLCBvdGhlciBjYWxscyBqdXN0IHdhaXQgdW50aWwgdGhl
IGZpcnN0IGlzIGZpbmlzaGVkKSwgYnV0Cj4+IGl0IGNyYXNoZWQgd2hlbiBncGlvIGNkZXYgcmVn
aXN0cmF0aW9uIGNhbGxzIGludG8gdGhlIGRyaXZlciAoZmV0Y2hlcwo+PiB0aGUgc3RhdHVzKSB3
aGlsZSBzdGlsbCBpbiBib290dXAuCj4+Cj4+IERvbid0IHJlY2FsbCB0aGUgZXhhY3QgZXJyb3Ig
YW55bW9yZSwgYnV0IHNvbWV0aGluZyBsaWtlIGFuCj4+IGluY29uc2lzdGVuY3kgaW4gdGhlIHNw
aW5sb2NrIGNhbGxzLgo+Pgo+PiBEaWQgSSBqdXN0IHVzZSB0aGUgd3JvbmcgdHlwZSBvZiBsb2Nr
ID8KPiAKPiBJJ20gbm90IHN1cmUgc2luY2UgSSBhbSBub3QgZmFtaWxpYXIgd2l0aCBHUElPLiBC
dXQgYSBxdWVzdGlvbiBpcywgaWYgYXQKPiBtb3N0IG9uZSByZXF1ZXN0IGlzIGFsbG93ZWQsIEkn
bSBub3Qgc3VyZSB2aXJ0aW8gaXMgdGhlIGJlc3QgY2hvaWNlIGhlcmUKPiBzaW5jZSB3ZSBkb24n
dCBldmVuIG5lZWQgYSBxdWV1ZSh2aXJ0cXVldWUpIGhlcmUuCgpJIGd1ZXNzLCBJIHNob3VsZCBh
ZGQgbG9ja3MgdG8gdGhlIGdwaW8gY2FsbGJhY2sgZnVuY3Rpb25zICh3aGVyZSBncGlvCnN1YnN5
cyBjYWxscyBpbikuIFRoYXQgd2F5LCByZXF1ZXN0cyBhcmUgcmVxdWVzdHMgYXJlIHN0cmljdGx5
IG9yZGVyZWQuClRoZSBsb2NrcyBkaWRuJ3Qgd29yayBpbiBteSBwcmV2aW91cyBhdHRlbXB0cywg
YnV0IHByb2JhYmx5IGJlY2F1c2UgSSd2ZQptaXNzZWQgdG8gc2V0IHRoZSBjYW5fc2xlZXAgZmxh
ZyAobm93IGZpeGVkIGluIHYzKS4KClRoZSBncGlvIG9wcyBhcmUgYWxyZWFkeSB3YWl0aW5nIGZv
ciByZXBseSBvZiB0aGUgY29ycmVzcG9uZGluZyB0eXBlLCBzbwp0aGUgb25seSBiYWQgdGhpbmcg
dGhhdCBjb3VsZCBoYXBwZW4gaXMgdGhlIHNhbWUgb3BlcmF0aW9uIGJlaW5nIGNhbGxlZAp0d2lj
ZSAod2hlbiBjb21pbmcgZnJvbSBkaWZmZXJlbnQgdGhyZWFkcykgYW5kIHJlcGxpZXMgbWl4ZWQg
dXAgYmV0d2VlbgpmaXJzdCBhbmQgc2Vjb25kIG9uZS4gT1RPSCBJIGRvbid0IHNlZSBtdWNoIHBy
b2JsZW0gdy8gdGhhdC4gVGhpcyBjYW4gYmUKZml4ZWQgYnkgYWRkaW5nIGEgZ2xvYmFsIGxvY2su
Cgo+IEkgdGhpbmsgaXQncyBzdGlsbCBhYm91dCB3aGV0aGVyIG9yIG5vdCB3ZSBuZWVkIGFsbG93
IGEgYmF0Y2ggb2YKPiByZXF1ZXN0cyB2aWEgYSBxdWV1ZS4gQ29uc2lkZXIgeW91J3ZlIHN1Ym1p
dHRlZCB0d28gcmVxdWVzdCBBIGFuZCBCLCBhbmQKPiBpZiBCIGlzIGRvbmUgZmlyc3QsIGN1cnJl
bnQgY29kZSB3b24ndCB3b3JrLiBUaGlzIGlzIGJlY2F1c2UsIHRoZSByZXBseQo+IGlzIHRyYW5z
cG9ydGVkIHZpYSByeHEgYnVmZmVycyBub3QganVzdCByZXVzZSB0aGUgdHhxIGJ1ZmZlciBpZiBJ
IHJlYWQKPiB0aGUgY29kZSBjb3JyZWN0bHkuCgpNZWFud2hpbGUgSSd2ZSBjaGFuZ2VkIGl0IHRv
IGFsbG9jYXRlIGEgbmV3IHJ4IGJ1ZmZlciBmb3IgdGhlIHJlcGx5Cihkb25lIHJpZ2h0IGJlZm9y
ZSB0aGUgcmVxdWVzdCBpcyBzZW50KSwgc28gZXZlcnl0aGluZyBzaG91bGQgYmUKcHJvY2Vzc2Vk
IGluIHRoZSBvcmRlciBpdCBoYWQgYmVlbiBzZW50LiBBc3N1bWluZyB2aXJ0aW8ga2VlcHMgdGhl
Cm9yZGVyIG9mIHRoZSBidWZmZXJzIGluIHRoZSBxdWV1ZXMuCgo+PiBDb3VsZCB5b3UgcGxlYXNl
IGdpdmUgYW4gZXhhbXBsZSBob3cgYmktZGlyZWN0aW9uYWwgdHJhbnNtaXNzaW9uIHdpdGhpbgo+
PiB0aGUgc2FtZSBxdWV1ZSBjb3VsZCBsb29rIGxpa2UgPwo+IAo+IFlvdSBjYW4gY2hlY2sgaG93
IHZpcnRpby1ibGsgZGlkIHRoaXMgaW46Cj4gCj4gaHR0cHM6Ly9kb2NzLm9hc2lzLW9wZW4ub3Jn
L3ZpcnRpby92aXJ0aW8vdjEuMS9jc3ByZDAxL3ZpcnRpby12MS4xLWNzcHJkMDEuaHRtbCN4MS0y
NTAwMDA2CgpobW0sIHN0aWxsIGRvbid0IHNlZSBob3cgdGhlIGNvZGUgd291bGQgYWN0dWFsbHkg
bG9vayBsaWtlLiAoaW4gcWVtdSBhcwp3ZWxsIGFzIGtlcm5lbCkuIEp1c3QgYWRkIHRoZSBmZXRj
aGVkIGluYnVmIGFzIGFuIG91dGJ1ZiAod2l0aGluIHRoZQpzYW1lIHF1ZXVlKSA/Cgo+PiBNYXli
ZSBhZGQgb25lIG5ldyBidWZmZXIgcGVyIHJlcXVlc3QgYW5kIG9uZSBuZXcgcGVyIHJlY2VpdmVk
IGFzeW5jCj4+IHNpZ25hbCA/Cj4gCj4gSXQgd291bGQgYmUgc2FmZSB0byBmaWxsIHRoZSB3aG9s
ZSByeHEgYW5kIGRvIHRoZSByZWZpbGwgZS5nIHdoZW4gaGFsZgo+IG9mIHRoZSBxdWV1ZSBpcyB1
c2VkLgoKT2theSwgZG9pbmcgdGhhdCBub3cgaW4gdjM6IHRoZXJlJ3MgYWx3YXlzIGF0IGxlYXN0
IG9uZSByeCBidWZmZXIsCmFuZCByZXF1ZXN0cyBhcyB3ZWxsIGFzIHRoZSBpbnRyIHJlY2VpdmVy
IGFsd2F5cyBhZGQgYSBuZXcgb25lLgoodGhleSBnZXQgcmVtb3ZlZCBvbiBmZXRjaGluZywgSU1I
TykuCgoKLS1tdHgKCi0tIAotLS0KSGlud2VpczogdW52ZXJzY2hsw7xzc2VsdGUgRS1NYWlscyBr
w7ZubmVuIGxlaWNodCBhYmdlaMO2cnQgdW5kIG1hbmlwdWxpZXJ0CndlcmRlbiAhIEbDvHIgZWlu
ZSB2ZXJ0cmF1bGljaGUgS29tbXVuaWthdGlvbiBzZW5kZW4gU2llIGJpdHRlIGlocmVuCkdQRy9Q
R1AtU2NobMO8c3NlbCB6dS4KLS0tCkVucmljbyBXZWlnZWx0LCBtZXR1eCBJVCBjb25zdWx0CkZy
ZWUgc29mdHdhcmUgYW5kIExpbnV4IGVtYmVkZGVkIGVuZ2luZWVyaW5nCmluZm9AbWV0dXgubmV0
IC0tICs0OS0xNTEtMjc1NjUyODcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
