Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8AAC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 06:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FSV0o7xSyz/79i/04b3s86ws180NYkYxjy/ccq0g9AM=; b=1Y6oVNJQmmyMnn
	ksysVt+LK2NvtLTAFMjGscS3JOzKnSgOk4YGr73zkMlkhCM0v7odt/ZbOMv1N8XQ3WLtfQF29C6Gl
	djWjiotD8LS0oGM+76/a415kek4FDxtJ8XGhkvbdHQS2wIf44cHuoQgNWgRW8zWQ/AXXyUlF1/8ly
	XLJsMy5WyoJFyV/TevW6kvCwzaCnUa3qZfmNy2/sF/O+DuFfVxyyJF3THi1wN/rewLtkbxHSWDGdu
	Vf4DGUTf9i+p0zTDYsmwAlBwS0fxXiA94fuyvaGaOjmNoX687Fc9/HWt4WfMRlMmcfBbOlcNUpgz8
	8lQMX4kbWwSPFEEiw8vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okfkK-003DCL-Bk; Tue, 18 Oct 2022 06:06:36 +0000
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okfkG-003DB5-82; Tue, 18 Oct 2022 06:06:34 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0VSTCoBD_1666073183;
Received: from 30.221.96.155(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VSTCoBD_1666073183)
          by smtp.aliyun-inc.com;
          Tue, 18 Oct 2022 14:06:24 +0800
Message-ID: <188e331c-d399-e86d-e894-a2a116deb753@linux.alibaba.com>
Date: Tue, 18 Oct 2022 14:06:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH V2 2/2] Documentation: kdump: describe VMCOREINFO export
 for RISCV64
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 anup@brainfault.org, heiko@sntech.de, guoren@kernel.org, mick@ics.forth.gr,
 alexandre.ghiti@canonical.com, bhe@redhat.com, vgoyal@redhat.com,
 dyoung@redhat.com, corbet@lwn.net, Conor.Dooley@microchip.com,
 kexec@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 crash-utility@redhat.com, heinrich.schuchardt@canonical.com,
 k-hagio-ab@nec.com, hschauhan@nulltrace.org, yixun.lan@gmail.com
References: <20221014134139.5151-1-xianting.tian@linux.alibaba.com>
 <20221014134139.5151-3-xianting.tian@linux.alibaba.com>
 <Y04bOv49sRsauLb6@debian.me>
From: Xianting Tian <xianting.tian@linux.alibaba.com>
In-Reply-To: <Y04bOv49sRsauLb6@debian.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_230632_479913_1BD0BEDC 
X-CRM114-Status: GOOD (  10.88  )
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

CuWcqCAyMDIyLzEwLzE4IOS4iuWNiDExOjE5LCBCYWdhcyBTYW5qYXlhIOWGmemBkzoKPiBPbiBG
cmksIE9jdCAxNCwgMjAyMiBhdCAwOTo0MTozOVBNICswODAwLCBYaWFudGluZyBUaWFuIHdyb3Rl
Ogo+PiBUaGUgZm9sbG93aW5nIGludGVycmVsYXRlZCBkZWZpbml0aW9ucyBhbmQgcmFuZ2VzIGFy
ZSBuZWVkZWQgYnkgdGhlIGtkdW1wCj4+IGNyYXNoIHRvb2wsIHRoZXkgYXJlIGV4cG9ydGVkIGJ5
ICJhcmNoL3Jpc2N2L2tlcm5lbC9jcmFzaF9jb3JlLmMiOgo+IEJldHRlciBzYXkgIi4uLiwgd2hp
Y2ggYXJlIGV4cG9ydGVkIGJ5IC4uLiIKPgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9h
ZG1pbi1ndWlkZS9rZHVtcC92bWNvcmVpbmZvLnJzdCBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3Vp
ZGUva2R1bXAvdm1jb3JlaW5mby5yc3QKPj4gaW5kZXggNjcyNmY0Mzk5NThjLi44ZTJlMTY0Y2Yz
ZGIgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2R1bXAvdm1jb3Jl
aW5mby5yc3QKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZHVtcC92bWNvcmVp
bmZvLnJzdAo+PiBAQCAtNTk1LDMgKzU5NSwzMyBAQCBYMlRMQgo+PiAgIC0tLS0tCj4+ICAgCj4+
ICAgSW5kaWNhdGVzIHdoZXRoZXIgdGhlIGNyYXNoZWQga2VybmVsIGVuYWJsZWQgU0ggZXh0ZW5k
ZWQgbW9kZS4KPj4gKwo+PiArUklTQ1Y2NAo+PiArPT09PT09PQo+PiArCj4+ICtWQV9CSVRTCj4+
ICstLS0tLS0tCj4+ICsKPj4gK1RoZSBtYXhpbXVtIG51bWJlciBvZiBiaXRzIGZvciB2aXJ0dWFs
IGFkZHJlc3Nlcy4gVXNlZCB0byBjb21wdXRlIHRoZQo+PiArdmlydHVhbCBtZW1vcnkgcmFuZ2Vz
Lgo+PiArCj4+ICtQQUdFX09GRlNFVAo+PiArLS0tLS0tLS0tLS0KPj4gKwo+PiArSW5kaWNhdGVz
IHRoZSB2aXJ0dWFsIGtlcm5lbCBzdGFydCBhZGRyZXNzIG9mIGRpcmVjdC1tYXBwZWQgUkFNIHJl
Z2lvbi4KPj4gKwo+PiArcGh5c19yYW1fYmFzZQo+PiArLS0tLS0tLS0tLS0tLQo+PiArCj4+ICtJ
bmRpY2F0ZXMgdGhlIHN0YXJ0IHBoeXNpY2FsIFJBTSBhZGRyZXNzLgo+PiArCj4+ICtNT0RVTEVT
X1ZBRERSfE1PRFVMRVNfRU5EfFZNQUxMT0NfU1RBUlR8Vk1BTExPQ19FTkR8Vk1FTU1BUF9TVEFS
VHxWTUVNTUFQX0VORHxLQVNBTl9TSEFET1dfU1RBUlR8S0FTQU5fU0hBRE9XX0VORHxLRVJORUxf
TElOS19BRERSfEFERFJFU1NfU1BBQ0VfRU5ECj4+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4+ICsKPj4gK1VzZWQgdG8gZ2V0IHRoZSBjb3JyZWN0IHJhbmdlczoKPj4gKwo+
PiArICAqIE1PRFVMRVNfVkFERFIgfiBNT0RVTEVTX0VORCA6IEtlcm5lbCBtb2R1bGUgc3BhY2Uu
Cj4+ICsgICogVk1BTExPQ19TVEFSVCB+IFZNQUxMT0NfRU5EIDogdm1hbGxvYygpIC8gaW9yZW1h
cCgpIHNwYWNlLgo+PiArICAqIFZNRU1NQVBfU1RBUlQgfiBWTUVNTUFQX0VORCA6IHZtZW1tYXAg
cmVnaW9uLCB1c2VkIGZvciBzdHJ1Y3QgcGFnZSBhcnJheS4KPj4gKyAgKiBLQVNBTl9TSEFET1df
U1RBUlQgfiBLQVNBTl9TSEFET1dfRU5EIDoga2FzYW4gc2hhZG93IHNwYWNlLgo+PiArICAqIEtF
Uk5FTF9MSU5LX0FERFIgfiBBRERSRVNTX1NQQUNFX0VORCA6IEtlcm5lbCBsaW5rIGFuZCBCUEYg
c3BhY2UuCj4gVGhlIGRvY3VtZW50YXRpb24gTEdUTSwgdGhhbmtzLgo+Cj4gV2hlbiB0aGUgcGF0
Y2ggc3ViamVjdCBpcyBmaXhlZCwKQ291bGQgeW91IHRlbGwgbWUgd2hhdCBwYXRjaCBzdWJqZWN0
IHNob3VsZCBiZSBjaGFuZ2VkIHRvID8gdGhhbmtzCj4KPiBSZXZpZXdlZC1ieTogQmFnYXMgU2Fu
amF5YSA8YmFnYXNkb3RtZUBnbWFpbC5jb20+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
