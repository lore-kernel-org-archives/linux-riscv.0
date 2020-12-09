Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F28AC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 10:34:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2563D23B6C
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 10:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2563D23B6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x77zgsZu3wr9bDtRJRSsLxNpuY5oLWhx6K4/zDH9gus=; b=lkseT0bacm+BzuMPl5ig+PIjT
	mtl8UV41/JegCPg3g4MHLI1dot9Bo2FvFdRLB1W9aGeMPrHw+LqfIn/2DgGeNXiYM3HHVmUfWtb1j
	HUS19U1VilfVh8a+XwnwUUhY9qoNN21MKfEnDE6G71MAQ8ys8uznNYD14pSbIXBSg0AmqCneOuDVA
	82/ZwDvRjOPoESZLxA7MVB8dKLBAk2BFWxtRG11/Ax3giM5XNbD6gWwhu+Dkt3WQ5+x33tCtBIyHE
	QPNvOtouKmmVHkcfZIy+62jqYV8pJYxs3c3ucTAjCyBOjWn24Eu+tU3ltEfX65nxteP3EJMPFu5DY
	vfoTwpokw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmwnN-0008SS-7H; Wed, 09 Dec 2020 10:34:05 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmwnK-0008S3-MO
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 10:34:03 +0000
Received: from [192.168.1.155] ([77.2.91.93]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MpDeD-1kM7Qx2oGd-00qfIe; Wed, 09 Dec 2020 11:33:48 +0100
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
 <20201205142218-mutt-send-email-mst@kernel.org>
 <842519cc-94ca-3c11-ddd6-543e5a89c998@redhat.com>
 <20201207085247-mutt-send-email-mst@kernel.org>
 <0a9c19bd-0d25-1035-57e3-b1f5f204c309@redhat.com>
 <500d0c68-0c6d-f5fb-665b-74aec6d59f99@metux.net>
 <9e11f1ab-6b7c-d50e-d7db-633ebc3d358c@redhat.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <02dd5afb-5e62-0c38-88c2-a37531180e06@metux.net>
Date: Wed, 9 Dec 2020 11:33:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <9e11f1ab-6b7c-d50e-d7db-633ebc3d358c@redhat.com>
Content-Language: tl
X-Provags-ID: V03:K1:6IBOdJ3Pw3iu1MA21dwXanEXus7g8p1ep+GkGt9zVIbhxhZx7Kf
 jiiT9jUHC2ZzHCmY2HNp5e7SosSLryMqody8olJ3KO/KGIWk81GbzazHXz4geIZ1BDAIhaz
 O8m+3MwjyC39TfP3KI6umd7EFHWVbx0KiKNiUK1cxON6xTUIZESLpMjOonPjPOKV9Yj7Oae
 unBSQwjogiQhVFADVN+ZA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NIdITOosddQ=:P8JLLlTSzK2CBNVBgIMqUV
 UpiIQoKs9//rlDBkl+fCiRfYISscyoor6jO2Rq0dZxW1574ox9nuQeFZh0lQ3t4Fg4KZJ73nl
 41qNdWYboci98BEv99ALc1TYA0fKsHeWhU5snts4GVf/6JzUk3Ai/7nvlwxO8EUlrS98ve4AU
 rI6fhXFXfj1fboAkITyOq3VnBUDeBi+RaGhxi6RpZGLJtb0Z0h0qBu55Em4JCCTGiPADYnwP6
 lzAPldZb40Qo9c9jGzFfRHv0rpkY6Iz8ykrHP2X+9/ovFK8cd3W3afEGqL5u7WD21fL4xKx4F
 xULPKia5OMoBCbT/QAtq6rJSobc7bghBqWPj+dWQw5gpqdSg3gF3XUyJrKOiyhHv7nNuFKb2P
 UiQJ0QH/1E6BdqPqNGy0nE++XxDrfkdrCx+6S7OgeJW70XM8Yn4EpqSHtnt+FNE7rtD/jazD6
 FWcB0/8kvkVwAOZ9iUV1+Nk3uXO893cxNPA2qUkzF2FGXpgA9bpG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_053402_966629_874489F7 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDkuMTIuMjAgMTA6MzEsIEphc29uIFdhbmcgd3JvdGU6CgpIaSwKCj4+IEFuZCBldmVuIGlm
IHNvbWUgVVNCLUhBIGRyaXZlciBpcyBlbmFibGVkLCB0aGUgYWN0dWFseSBtYWNoaW5lIGRvZXNu
J3QKPj4gbmVjZXNzYXJpbHkgaGF2ZSB0aGUgY29ycmVzcG9uZGluZyBkZXZpY2UuCj4gCj4gT2ss
IHRoZW4gc2VsZWN0IHdvcmtzIGZvciBtZS4KCkdyZWF0LCBzbyBkb2VzIGV2ZXJ5Ym9keSBhZ2dy
ZWUgb24gbXkgcGF0Y2ggPwpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjAxMjA0MTMx
MjIxLjI4MjctMS1pbmZvQG1ldHV4Lm5ldC8KCi0tbXR4CgotLSAKLS0tCkhpbndlaXM6IHVudmVy
c2NobMO8c3NlbHRlIEUtTWFpbHMga8O2bm5lbiBsZWljaHQgYWJnZWjDtnJ0IHVuZCBtYW5pcHVs
aWVydAp3ZXJkZW4gISBGw7xyIGVpbmUgdmVydHJhdWxpY2hlIEtvbW11bmlrYXRpb24gc2VuZGVu
IFNpZSBiaXR0ZSBpaHJlbgpHUEcvUEdQLVNjaGzDvHNzZWwgenUuCi0tLQpFbnJpY28gV2VpZ2Vs
dCwgbWV0dXggSVQgY29uc3VsdApGcmVlIHNvZnR3YXJlIGFuZCBMaW51eCBlbWJlZGRlZCBlbmdp
bmVlcmluZwppbmZvQG1ldHV4Lm5ldCAtLSArNDktMTUxLTI3NTY1Mjg3CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
