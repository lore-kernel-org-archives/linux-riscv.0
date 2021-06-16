Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F81C48BE5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 14:42:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E6316115C
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 14:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E6316115C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=diQgurVrAKPXs6zBNlA2s9vqqv4DwXIPP6zsBwHaWQQ=; b=QeM5rCGtnCbSZk2fzIGlVq9pbK
	/enquPEYGypM4DtjdcVbIzUcQ4QtvUqJQfjtQ08/iike1tZe1yT8Qv4KYoJCidHeOtpxX6E9uWuGf
	54gwm2vAP2iBqBJtFM3w75zV1V39kHxU6/TBwRjO24Ct6mcXfS2pScYhnZs2dc9tUsYg6jFi4hz6C
	pmxt8Jq3rnznjZjttoR0OfXccL7WRWwUb+vuFeO0A0fpT3hT2HIJW0oSmnxxTNA6cpH4a2O4+CQes
	OG34vphC+qHOVD54ycyxG3KZU6qziaCVUFutnlesw59S5slyvlXIbLY9eUqtf1Hr9tr9B9hSK8NED
	zIXSj42g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltWjm-006knS-DA; Wed, 16 Jun 2021 14:41:50 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltWjj-006kmz-9u
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 14:41:48 +0000
Received: from [192.168.1.155] ([95.115.35.150]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MSLEm-1licf82p6u-00SerU; Wed, 16 Jun 2021 16:41:26 +0200
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
To: Linus Walleij <linus.walleij@linaro.org>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <20210615174911.973-1-info@metux.net>
 <CACRpkdbwLOOT6nuhpkT5x-AZVipsD2qG8Qu4xoiRotHQNknwzw@mail.gmail.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <098f669f-b451-18e1-9aed-a71f400bd581@metux.net>
Date: Wed, 16 Jun 2021 16:41:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbwLOOT6nuhpkT5x-AZVipsD2qG8Qu4xoiRotHQNknwzw@mail.gmail.com>
Content-Language: tl
X-Provags-ID: V03:K1:CR6mpicfGsY9r/evUqTXH8C70befzHJD17gK1boMJb2mNiw2I3w
 u9bascsokR1YLBsRaAjFl9nCA0nXMUduSAIVdTJsuBt//Y1hu5AbrPkpQ5Bewzb1Peh7x0m
 OJsttVts/KwE3xipe3/w+Di4ulseb46HgCXAWsbZwtIW1CWD52UQu24Sh7tjYr+AujL6fle
 DtR3xtegpA75e0CGxI5aw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fMVu1T4nu7g=:4lDZNogMmvE1wFbQcnZQ0B
 hBMiXVmcPPsYTquq0lJBIq7dqufr+FVBlwhCMtjMCtupVmGeVKmzhQLeZtIn0EqCtwP17PQC1
 bI4PhWcGXUahcXYS6EV82U3W2kaSYt7WSXN334mB665gcj2/yg90+n9mZ+hGyJiwnS+1XcWQ/
 U6OflJL9RiKDC/q+61jIjkRcm+8bbuwuCA4idwY9O67k50FabdiGYUKE1RmY05OjaAxgnk0AO
 jZBLFx00sKx0u7GOr3YKFhpHV84KJIdnhRy9FXO4LOE5OIgUnJDHC+FG2it+fuzaV5ud9zpzM
 Iztr85Sus6eg7hgkhxUxp+6GOYiOKJSNC1csHjDXN+RIw93lfgeqglRhXvzIDq7qAlKFORGbc
 SgnoSFASpckcaCipHWdnINRFf+zjpPLo55xzD0+rMIVAbabemAUPj8ZuOEqiYgaqgM/WGa2Hy
 /xsV6746LXXSuzAPiwPRjHVo4p2NJAqyjnjVbgO/gaw7BsyePIXVOSmAkD1jA7tBvxgXAny0C
 6dcDS5dKyeTDANgMo4EGqI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_074147_689397_E27024DA 
X-CRM114-Status: GOOD (  16.22  )
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

T24gMTYuMDYuMjEgMTA6MzEsIExpbnVzIFdhbGxlaWogd3JvdGU6CiA+IEhpIEVucmljbywKCiA+
IFNvIG5vdyB0aGVyZSBhcmUgdHdvIGNvbnRlc3RpbmcgcGF0Y2hlcyBmb3IgdGhpcyBhbmQgdGhh
dCBjcmVhdGVzIGEKID4gc29jaWFsIHByb2JsZW0gZm9yIHVzIGFzIG1haW50YWluZXJzLiBJIGFt
IG5vdCB0b28gaGFwcHkgYWJvdXQgdGhhdC4KCm5vdGUgdGhhdCB0aGlzIGlzIGEgcG9saXNoZWQg
dXAgb2YgYSByZXBvc3Qgb2YgbXkgb3JpZ2luYWwgZHJpdmVyCmZyb20gbGFzdCB5ZWFyLgoKID4g
Q2FuIHdlIGdldCB0aGUgZGlzY3Vzc2lvbiBkb3duIHRvIGFjdHVhbCB0ZWNobmljYWwgcG9pbnRz
PwoKU3VyZS4gUGVyaGFwcyB5b3UgcmVjYWxsIG9yIGRpc2N1c3Npb25zIGZyb20gbGF0ZSAyMDIw
LiBUaGUgbWlzc2luZwpwb2ludCB0aGVyZSB3YXMgKGJlc2lkZXMgYSBmZXcgd29yZGluZyBpc3N1
ZXMpIHRoZSBtaXNzaW5nIGZvcm1hbApzcGVjaWZpY2F0aW9uIHByb2Nlc3Mgdy8gdmlydGlvIFRD
LiAoc3BlYyB3YXMgYWxyZWFkeSBpbmNsdWRlZCBpbiB0aGlzCmRyaXZlciBhcyB3ZWxsIGFzIHRo
ZSBjb3JyZXNwb25kaW5nIHFlbXUgcGF0Y2hlcykuCgpNeSBzcGVjIHdhcyBub3QganVzdCBtZWFu
dCBmb3IgVk0gYXBwbGljYXRpb25zIGJ1dCBhbHNvIGFjdHVhbCBzaWxpY29uCihhcyBhbHJlYWR5
IG1lbnRpb25lZCwgc29tZSBmb2xrcyBvZiBteSBjbGllbnQgYWxzbyBpbXBsZW1lbnRlZCBpdCBp
bgpGUEdBcyAtIGRvbid0IGFzayBtZSBhYm91dCBkZXRhaWxzLCB0aGV5IGp1c3QgbWVudGlvbmVk
IGl0IHdhcyBxdWl0ZQplYXN5IGZvciB0aGVtKS4KClRoaXMgaXMgd2h5IGl0IGlzIHNvIHRyaW1t
ZWQgb24gdGhpbmdzIGxpa2UgZml4ZWQgcGFja2V0IHNpemUsCnVuaWRpcmVjdGlvbmFsIHF1ZXVl
cywgbWlycm9yaW5nIHBhY2tldHMgdy8gdGh1cyBhIGZldyBiaXRzIGNoYW5nZWQsCmV0Yy4gSW4g
Y29uc3RyYXN0LCBhIG1vcmUgbmV0d29yay1saWtlIGFwcHJvYWNoIG1pZ2h0IGhhdmUgYmVlbiBs
b29raW5nCm5pY2VyIHRvIHRyYWRpdGlvbmFsIGNvbXB1dGVyIHByb2dyYW1tZXJzLCBidXQgbXVj
aCBtb3JlIGNvbXBsZXggdG8gZG8KaW4gcHVyZSBsb2dpYyBhbmQgZWF0IHVwICpsb3RzIG9mKiBt
b3JlIGdhdGVzICh0aGluayBvZiBhY3R1YWwgbWVtb3J5Cm1hbmFnZW1lbnQgaW5zdGVhZCBvZiBo
YXJkd2lyZWQgbGF0Y2hlcywgbW9yZSBjb21wbGV4IGRlY29kaW5nLCBldGMpLgoKTWVhbndoaWxl
IGl0IHBsYXllZCBvdXQgd29ya2luZyBuaWNlbHkgaW4gc2V2ZXJhbCBISUwgaW5zdGFsbGF0aW9u
cwoKSWYgSSB3YW50ZWQgdG8gaGF2ZSBhIHNpbXBsZSBhbmQgQ1BVLW9ubHkgYXBwcm9hY2ggKGp1
c3QgZm9yIFZNcyksIEkKd291bGQgaGF2ZSBqdXN0IG1vdW50ZWQgc29tZSBzeXNmcyBwaWVjZXMg
dmlhIDlQIDpwCgpTZXZlcmFsIHdlZWtzIGFnbywgVmlyZXNoIGp1c3Qgd2FudGVkIHRvIGNvbnRp
bnVlIHRoZSBtaXNzaW5nIHBpZWNlcwood2hpY2ggd2FzOiB0ZXgnaWZ5aW5nIHRoZSBzcGVjIGFu
ZCBzdWJtaXR0aW5nIHRvIHZpcnRpbyBUQyksIGJ1dCB0aGVuCnVuZm9ydHVuYXRlbHkgaGUgaW52
ZW50ZWQgc29tZXRoaW5nIGVudGlyZWx5IGRpZmZlcmVudCBhbHNvIHB1dCBteSBuYW1lCm9uIGl0
LgoKRWFzeSB0byBpbWFnaW5lIHRoYXQgSSdtIG5vdCBhbXVzZWQgYXQgYWxsLgoKCi0tbXR4Cgot
LSAKLS0tCkhpbndlaXM6IHVudmVyc2NobMO8c3NlbHRlIEUtTWFpbHMga8O2bm5lbiBsZWljaHQg
YWJnZWjDtnJ0IHVuZCBtYW5pcHVsaWVydAp3ZXJkZW4gISBGw7xyIGVpbmUgdmVydHJhdWxpY2hl
IEtvbW11bmlrYXRpb24gc2VuZGVuIFNpZSBiaXR0ZSBpaHJlbgpHUEcvUEdQLVNjaGzDvHNzZWwg
enUuCi0tLQpFbnJpY28gV2VpZ2VsdCwgbWV0dXggSVQgY29uc3VsdApGcmVlIHNvZnR3YXJlIGFu
ZCBMaW51eCBlbWJlZGRlZCBlbmdpbmVlcmluZwppbmZvQG1ldHV4Lm5ldCAtLSArNDktMTUxLTI3
NTY1Mjg3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
