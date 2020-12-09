Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE95FC4361B
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 09:32:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8223C23B7D
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 09:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8223C23B7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iBJo/+IFpnOfV++p6gTPfIkml7IrZ00f+u0s6M/rsos=; b=NyPlCrb2i5kqg/4OGmOX4opap
	5OK0LgwIS24Gray4A5vXcFhoFsA6XZrAiZl4385ZH2F3Q6bTTXh2jWzIMf+J9VLPqlWjsOV11D2h3
	uJebF0MPbBeDsiaoSwlTYf1EZXB747PBl3oVE9PvJv6txL2JWASNz3Fq3y5M+L0qZb4j2qQ8tHdzX
	jg/En1fxYSdMavWMIU2+ZP6NtHreCg9YU0kVc6DtvzLIuDespSztjppUG2G8Z0LghmRdPp1GTxQXC
	ItO3M6zZZSuYIheImWmUBqi0w88uUzgkycdx/eMXCAwyj5HeA8XfMTn9U2Z45I2J1kiyAOn2qfC0+
	f8TaQiSyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmvpN-00032f-BZ; Wed, 09 Dec 2020 09:32:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmvpL-00032C-8h
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 09:32:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607506322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W6cW4CaC6vRkex8b1uivDQizxuPVFLQvTcxdJxTGoT8=;
 b=deHDM0ijhpV3OkJR/4d/wPKnEiV5EtZooLGT5bWxKyjKG6D/hFo9Fd1woCmumn+WPvLuyA
 a8kgE2jFlZKzixHbC1YaNhjrVR2yKFusXNEN/CrvaEcUddh5wN6gRn7t+A+77hLlXXAj3B
 0qA5A/ToYjknbMvHDTvhmxAXm3f3tj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-mt-nlmTxMZmaliXtXLKgmg-1; Wed, 09 Dec 2020 04:31:58 -0500
X-MC-Unique: mt-nlmTxMZmaliXtXLKgmg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A079802B40;
 Wed,  9 Dec 2020 09:31:56 +0000 (UTC)
Received: from [10.72.12.31] (ovpn-12-31.pek2.redhat.com [10.72.12.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89EBE5275D;
 Wed,  9 Dec 2020 09:31:42 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
 <20201205142218-mutt-send-email-mst@kernel.org>
 <842519cc-94ca-3c11-ddd6-543e5a89c998@redhat.com>
 <20201207085247-mutt-send-email-mst@kernel.org>
 <0a9c19bd-0d25-1035-57e3-b1f5f204c309@redhat.com>
 <500d0c68-0c6d-f5fb-665b-74aec6d59f99@metux.net>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9e11f1ab-6b7c-d50e-d7db-633ebc3d358c@redhat.com>
Date: Wed, 9 Dec 2020 17:31:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <500d0c68-0c6d-f5fb-665b-74aec6d59f99@metux.net>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_043203_365085_E3C91DC4 
X-CRM114-Status: GOOD (  14.66  )
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
Cc: stefanha@redhat.com, linux-doc@vger.kernel.org, linus.walleij@linaro.org,
 corbet@lwn.net, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, bgolaszewski@baylibre.com,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, msuchanek@suse.de,
 "Enrico Weigelt, metux IT consult" <info@metux.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjAvMTIvOCDkuIvljYgzOjAyLCBFbnJpY28gV2VpZ2VsdCwgbWV0dXggSVQgY29uc3Vs
dCB3cm90ZToKPiBPbiAwOC4xMi4yMCAwMzozNiwgSmFzb24gV2FuZyB3cm90ZToKPgo+IEhpLAo+
Cj4+IFNvIHdlIGVuZHVwIHdpdGggdHdvIHNvbHV0aW9ucyAod2l0aG91dCBhIHByb21wdCk6Cj4+
Cj4+IDEpIHVzaW5nIHNlbGVjdCwgdXNlciBtYXkgZW5kIHVwIHdpdGggZHJpdmVyIHdpdGhvdXQg
dHJhbnNwb3J0Cj4gSU1ITyBub3QgYW4gZW50aXJlbHkgdW51c3VhbCBzaXR1YXRpb24gaW4gb3Ro
ZXIgcGxhY2VzIG9mIHRoZSBrZXJuZWwsCj4gZWcuIG9uZSBjYW4gZW5hYmxlIFVTQiBkZXZpY2Vz
LCB3L28gaGF2aW5nIGFuIHVzYiBob3N0IGFkYXB0ZXIgZW5hYmxlZC4KPgo+IEFuZCBldmVuIGlm
IHNvbWUgVVNCLUhBIGRyaXZlciBpcyBlbmFibGVkLCB0aGUgYWN0dWFseSBtYWNoaW5lIGRvZXNu
J3QKPiBuZWNlc3NhcmlseSBoYXZlIHRoZSBjb3JyZXNwb25kaW5nIGRldmljZS4KCgpPaywgdGhl
biBzZWxlY3Qgd29ya3MgZm9yIG1lLgoKCj4KPj4gMikgdXNpbmcgZGVwZW5kcywgdXNlciBuZWVk
IHRvIGVuYWJsZSBhdCBsZWFzdCBvbmUgdHJhbnNwb3J0Cj4+Cj4+IDIpIGxvb2tzIGEgbGl0dGxl
IGJpdCBiZXR0ZXIgSSBhZG1pdC4KPiBTbywgYWxsIHZpcnRpbyBkZXZpY2VzIHNob3VsZCBkZXBl
bmQgb24gVFJBTlNQT1JUX0EgfHwgVFJBTlNQT1JUX0IgfHwKPiBUUkFOU1BPUlRfQyB8fCAuLi4g
PyAoYW5kIGFsc28gY2hhbmdlIGFsbCB0aGVzZSBwbGFjZXMgaWYgYW5vdGhlcgo+IHRyYW5zcG9y
dCBpcyBhZGRlZCkgPwoKCkkgdGhpbmsgbm90LiBUaGUgaWRlYSBpcywgaWYgbm9uZSBvZiB0aGUg
dHJhbnNwb3J0IChzZWxlY3QgVklSVElPKSBpcyAKZW5hYmxlZCwgdXNlciBjYW4gbm90IGVuYWJs
ZSBhbnkgdmlydGlvIGRyaXZlcnMgKGRlcGVuZHMgb24gVklSVElPKS4KClRoYW5rcwoKCj4KPiAt
LW10eAo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
