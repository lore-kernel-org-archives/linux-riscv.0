Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213ECECAAD3
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 01:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9lVoxwFcUy+Da36TDRnKMwE17iD5AbpfczUgQF1KuU=; b=lIAicvOjCcl5jj
	qWMo1uyxoVufqe0eM2zwjS9Kjb0gpzWTeMAWA7gT+5VwUjD9eOLgfaQk0BB6JLIzCe9aPanRFVPj9
	Som3LG6Kgi0nCz7am8zlLh5M+UTL4/OsZylbYaVjvWeSfUGSlS5+g47LNEjEPKmLcleqTCaNV1QW7
	XWIbWOyPKiESZ9BU2ex6VaEgb0MtLlHaUsqNQzLeNwePtS7ZalbvAeiyY8R38YkVV/4dX+5m1QhSy
	DPOUDkerL4aKgR2bL1yfl6gcGlPS7ITEjmABkyhgpYcANUwgH9Mb+xqSKxyOw1tX38cWFOujrOhz8
	qyTa+TxQ8wQZne1ANx5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYdmP-00ER7M-K5; Thu, 15 Sep 2022 01:35:01 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYdmM-00ER0Y-A0
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 01:34:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D5790B81D58
	for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 01:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18569C43141
	for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 01:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663205695;
	bh=wW6jti3XQAqDXZbc0+6OJH8++y8WvuiqGF4lrMjaXtg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=C/FLNGHJSg9Bqj5kquxUP8KqgMvZT7KvBBRxN08mt54hYDfhVrLzqLUqlpGLCKSEl
	 BqOCxDUI6uGmmEo9mEmljQTJXpqIh4K/rAf1nVH5UTurUknNUQGEjX6lSrt1T/7/Z8
	 Fecz0905Hy/vtBysA1x7jJBoIOPSU78fm3V2/qWP/gJbA2fSa0Qkj4GVB6+cv2S2C9
	 XJEPBWeN7zuScWTFKNiDf0mIDtsj5VvgmWZKhy/ujXMDVCdQunIlS8Jyis9nm2LzBO
	 +Gy/CHjV2gKnedBw09Bc+7TuU1zaLX3lCWeQiXBjypPfXdupUV6T927Fk9Cs3swfNF
	 cfh5jjtqbO9kA==
Received: by mail-oo1-f54.google.com with SMTP id k10-20020a4ad10a000000b004756ab911f8so1842926oor.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 Sep 2022 18:34:55 -0700 (PDT)
X-Gm-Message-State: ACgBeo1Gs2Bq2Mu2XBAnxP0ld4xOL3Q38grI7ejDxaVRkM45nRnhgKKT
	x/wEEquaWpFhfJK7I75lFICE8p2LIIdqz/DK73o=
X-Google-Smtp-Source: AA6agR4MHTNkdGyUhWZKs4+IVuy4MyjTnx/1M9WNKFwMJUgIFWsrxi7KYnXeNQzW30ALbtbtzAIlEfzKWIbTftbcHpk=
X-Received: by 2002:a4a:434d:0:b0:441:9b4:ffad with SMTP id
 l13-20020a4a434d000000b0044109b4ffadmr13698624ooj.31.1663205694115; Wed, 14
 Sep 2022 18:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220901104515.135162-1-zouyipeng@huawei.com> <20220901104515.135162-3-zouyipeng@huawei.com>
 <9d070742-8a82-3cb0-cea0-8ecce01c06b6@huawei.com> <ddcdc551-08f0-6b85-7985-5bca47b1989f@huawei.com>
In-Reply-To: <ddcdc551-08f0-6b85-7985-5bca47b1989f@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 15 Sep 2022 09:34:41 +0800
X-Gmail-Original-Message-ID: <CAJF2gTShdfHcjYsoGpZugSUaNepUJegNrTUE9um+eM3GY3gEjA@mail.gmail.com>
Message-ID: <CAJF2gTShdfHcjYsoGpZugSUaNepUJegNrTUE9um+eM3GY3gEjA@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: tracing: Improve hardirq tracing message
To: Yipeng Zou <zouyipeng@huawei.com>
Cc: linux-riscv@lists.infradead.org, rostedt@goodmis.org, mingo@redhat.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	liaochang1@huawei.com, chris.zjh@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_183458_656454_1E0F727F 
X-CRM114-Status: GOOD (  19.00  )
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

QWRkIEZpeGVzIHRhZywgYW5kIHRoZSB1cHN0cmVhbSBzaG91bGQgZ28gdG8gZ2VuZXJpYyBlbnRy
eS4KCkp1c3QgZm9yIHN0YWJsZSBicmFuY2hlcyBmaXh1cDoKQWNrZWQtYnk6IEd1byBSZW4gPGd1
b3JlbkBrZXJuZWwub3JnPgoKT24gV2VkLCBTZXAgMTQsIDIwMjIgYXQgMzoyOSBQTSBZaXBlbmcg
Wm91IDx6b3V5aXBlbmdAaHVhd2VpLmNvbT4gd3JvdGU6Cj4KPiBMb29wIGluIGd1b3JlbkBrZXJu
ZWwub3JnLAo+Cj4gUGxlYXNlIGhlbHAgcmV2aWV3IG9uIHRoaXMgcGF0Y2gsIHRoYW5rcyB2ZXJ5
IG11Y2guCj4KPiDlnKggMjAyMi85LzkgMTc6NDAsIFlpcGVuZyBab3Ug5YaZ6YGTOgo+ID4gUGlu
Zy4KPiA+Cj4gPiDlnKggMjAyMi85LzEgMTg6NDUsIFlpcGVuZyBab3Ug5YaZ6YGTOgo+ID4+IFVz
ZSB0cmFjZV9oYXJkaXJxc19vbl9jYWxsZXIgdG8gaW1wcm92ZSBpcnFfdHJhY2luZyBtZXNzYWdl
Lgo+ID4+Cj4gPj4gbG9ja2RlcCBsb2cgaW4gcmlzY3Ygc2hvd2luZyB0aGUgbGFzdCB7ZW5hYmxl
ZCxkaXNhYmxlZH0gYXQKPiA+PiBfX3RyYWNlX2hhcmRpcnFzX3tvbixvZmZ9IGFsbCB0aGUgdGlt
ZShpZiBjYWxsZWQgYnkpLgo+ID4+IEJ1dCB0aGF0J3Mgbm90IHdoYXQgd2Ugd2FudCB0byBzZWUs
IHRoZSBjYWxsZXIgaXMgd2hhdCB3ZSB3YW50Lgo+ID4+Cj4gPj4gQmVmb3JlIHRoaXMgY29tbWl0
Ogo+ID4+IFsgICA1Ny44NTMxNzVdIGhhcmRpcnFzIGxhc3QgIGVuYWJsZWQgYXQgKDI1MTkpOgo+
ID4+IF9fdHJhY2VfaGFyZGlycXNfb24rMHhjLzB4MTQKPiA+PiBbICAgNTcuODUzODQ4XSBoYXJk
aXJxcyBsYXN0IGRpc2FibGVkIGF0ICgyNTIwKToKPiA+PiBfX3RyYWNlX2hhcmRpcnFzX29mZisw
eGMvMHgxNAo+ID4+Cj4gPj4gQWZ0ZXIgdGhpcyBjb21taXQKPiA+PiBbICAgNTMuNzgxNDI4XSBo
YXJkaXJxcyBsYXN0ICBlbmFibGVkIGF0ICgyNTk1KTogcmVzdG9yZV9hbGwrMHhlLzB4NjYKPiA+
PiBbICAgNTMuNzgyMTg1XSBoYXJkaXJxcyBsYXN0IGRpc2FibGVkIGF0ICgyNTk2KToKPiA+PiBy
ZXRfZnJvbV9leGNlcHRpb24rMHhhLzB4MTAKPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFlpcGVu
ZyBab3UgPHpvdXlpcGVuZ0BodWF3ZWkuY29tPgo+ID4+IC0tLQo+ID4+ICAgYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhY2VfaXJxLmMgfCA0ICsrLS0KPiA+PiAgIGluY2x1ZGUvbGludXgvaXJxZmxhZ3Mu
aCAgICAgIHwgMiArKwo+ID4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJh
Y2VfaXJxLmMKPiA+PiBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYWNlX2lycS5jCj4gPj4gaW5kZXgg
MDk1YWM5NzZkN2RhLi43Y2EyNGIyNmUxOWYgMTAwNjQ0Cj4gPj4gLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhY2VfaXJxLmMKPiA+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFjZV9pcnEu
Ywo+ID4+IEBAIC0xNiwxMiArMTYsMTIgQEAKPiA+PiAgICAgdm9pZCBfX3RyYWNlX2hhcmRpcnFz
X29uKHZvaWQpCj4gPj4gICB7Cj4gPj4gLSAgICB0cmFjZV9oYXJkaXJxc19vbigpOwo+ID4+ICsg
ICAgdHJhY2VfaGFyZGlycXNfb25fY2FsbGVyKENBTExFUl9BRERSMCk7Cj4gPj4gICB9Cj4gPj4g
ICBOT0tQUk9CRV9TWU1CT0woX190cmFjZV9oYXJkaXJxc19vbik7Cj4gPj4gICAgIHZvaWQgX190
cmFjZV9oYXJkaXJxc19vZmYodm9pZCkKPiA+PiAgIHsKPiA+PiAtICAgIHRyYWNlX2hhcmRpcnFz
X29mZigpOwo+ID4+ICsgICAgdHJhY2VfaGFyZGlycXNfb2ZmX2NhbGxlcihDQUxMRVJfQUREUjAp
Owo+ID4+ICAgfQo+ID4+ICAgTk9LUFJPQkVfU1lNQk9MKF9fdHJhY2VfaGFyZGlycXNfb2ZmKTsK
PiA+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pcnFmbGFncy5oIGIvaW5jbHVkZS9saW51
eC9pcnFmbGFncy5oCj4gPj4gaW5kZXggNWVjMGZhNzEzOTllLi40Njc3NGZhODVjZGUgMTAwNjQ0
Cj4gPj4gLS0tIGEvaW5jbHVkZS9saW51eC9pcnFmbGFncy5oCj4gPj4gKysrIGIvaW5jbHVkZS9s
aW51eC9pcnFmbGFncy5oCj4gPj4gQEAgLTUzLDYgKzUzLDggQEAgZXh0ZXJuIHZvaWQgdHJhY2Vf
aGFyZGlycXNfb25fcHJlcGFyZSh2b2lkKTsKPiA+PiAgIGV4dGVybiB2b2lkIHRyYWNlX2hhcmRp
cnFzX29mZl9maW5pc2godm9pZCk7Cj4gPj4gICBleHRlcm4gdm9pZCB0cmFjZV9oYXJkaXJxc19v
bih2b2lkKTsKPiA+PiAgIGV4dGVybiB2b2lkIHRyYWNlX2hhcmRpcnFzX29mZih2b2lkKTsKPiA+
PiArZXh0ZXJuIHZvaWQgdHJhY2VfaGFyZGlycXNfb25fY2FsbGVyKHVuc2lnbmVkIGxvbmcgY2Fs
bGVyX2FkZHIpOwo+ID4+ICtleHRlcm4gdm9pZCB0cmFjZV9oYXJkaXJxc19vZmZfY2FsbGVyKHVu
c2lnbmVkIGxvbmcgY2FsbGVyX2FkZHIpOwo+ID4+ICAgICAjIGRlZmluZSBsb2NrZGVwX2hhcmRp
cnFfY29udGV4dCgpIChyYXdfY3B1X3JlYWQoaGFyZGlycV9jb250ZXh0KSkKPiA+PiAgICMgZGVm
aW5lIGxvY2tkZXBfc29mdGlycV9jb250ZXh0KHApICgocCktPnNvZnRpcnFfY29udGV4dCkKPiA+
Cj4gLS0KPiBSZWdhcmRzLAo+IFlpcGVuZyBab3UKPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBS
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
