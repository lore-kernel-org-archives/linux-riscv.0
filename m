Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEE8FF8873
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 13:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/wGwLI5HPyB8ilmyIj3oAlrVXih8iHQde7Lqdlcw5os=; b=XwZPgtDAq+YlKm
	ufyiKmT67+ZKTXkB91VNfbZvkL8JptC+SGuU9CJNQOKZp+GGYjlMz2enOIpp1+bIKX16DX6E8YW/r
	1MYR2X3IWr9Woj03UpY99ZDhmR9rs0XiyVX7IW4j0t5cDH5u3oXkIGkAkEnrVTtI7qDbHkdFcRVaw
	EJBeAAkG7O72ANitnZPk7t/URjzHNxuRJPc6NjZvHoV/ors275ADBWlexgfd3trSrqSxelTCfg3cE
	9kSci3ItpN8jEeGo5lHlwc85APL/YLgM8vMDS/lugsxbAQ9gdbGvtIHlIlMGbCU8vYGHkpQV/98Ay
	l0fr4mIoXXZFTaijbAIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIR3T-00000005VSD-3N94;
	Thu, 30 Apr 2026 13:03:47 +0000
Received: from smtp-42ac.mail.infomaniak.ch ([84.16.66.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIR3O-00000005VRi-1Czt
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 13:03:46 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4g5vVw53NpzRXb;
	Thu, 30 Apr 2026 15:03:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etik.com;
	s=20210927; t=1777554216;
	bh=tZgcE2tqoV2OvxRq+XQ+dG6c91LulmAvwLJMusN6Brg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=4iXyUDZQVdqeS0TBnyq4IDj01xZ4LsCcx5XKFViHI6Uyy6Fs5TzqZSh1Ovv/AC5Ee
	 UrJUMry6nGcKpaKz8cSGrtzow6o8A9XgUX9VAS2hvla148fumCne0t/oJKL7T/I50a
	 vKYrxTd1PKmwQZbfItCNeFKz1GvTZx7L+VFsYA80=
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4g5vVt4Nk7zZG4;
	Thu, 30 Apr 2026 15:03:34 +0200 (CEST)
Message-ID: <ea9622c3-3410-4115-9d54-9f11fc99f996@etik.com>
Date: Thu, 30 Apr 2026 15:03:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] xen/riscv: per-CPU devid setup for Xen event channel IRQ on
 IMSIC
To: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org, tglx@linutronix.de, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, oleksii.kurochko@gmail.com
References: <75820aee-f842-4f40-983b-f360ae6e6d29@etik.com>
 <CAAhSdy2HK2DKF_9Z_Cdx3NzsOs9DxHBPM0-1xVHgMwiYsv9-Og@mail.gmail.com>
Content-Language: en-US
From: Baptiste Le Duc <baptiste.leduc@etik.com>
Autocrypt: addr=baptiste.leduc@etik.com; keydata=
 xsFNBGnvLjgBEADAyweyc6WR9/BO+cWHJAmqh6hZ0cBM4Z6ShEMuZmKcrcVxVyDljqoFH9z2
 TS7+BMEDWvtVgoDND/OgQPJ9mh76puQNiklAommLSbG2Zw03/fXYf2oIt3I+fSAoy7EI+2Fn
 /yLYpfH9Wg1iBLyYbzFbqrlLjwIvki5nyhMtPBxLaIG5EKnlrQAnEE7kdOg1Nkw3ZQdIkkHi
 BBZ7xL9/tjcTFD+eV77CwxezI4bmMgIRwAX5Md8i+DTvn8WSY6r1wtLqTMHsT+aFfABljKWM
 HxcoDlSMH1DdPMx9im255ZoXYJXNJTB6BabButgtYAeHZm5SskRD1+/SQGWBztigweB35SBj
 M5Hp9+U27DFf2JF7zf61ItcfZx09wMNusWEeHKIlFjFzTeB7Q94VFBNjCLVcgsg8beD7sfTN
 YIjVLqGulajntN8Cnvk/zDDDCAB2c1xtD8/Kav09z4yFpOQiuobF0JGMy2hBQDQJbywNd+Nn
 1SJV0yFigDD0O6hj6gMsBqB2flDW7bmdC2MoUOgO6eYYHl5rZG2DopcAgchO1A/QkLGICZcO
 5jDUvECo0B9WMJaMVtW2WM8QmLFxQfO+F6nbl8JI+86YE+jSErdXW0MdunZPGIj0JUOJjMZz
 hjj9tXliWjEOdprB2sSn8bVv/KtLAtBAQZ97VXGSIX4CY1y1+QARAQABzSlCYXB0aXN0ZSBM
 ZSBEdWMgPGJhcHRpc3RlLmxlZHVjQGV0aWsuY29tPsLBjQQTAQgANxYhBJXmIBvNu84z1lDq
 0zv2cHaCozU7BQJp7y45BQkJZgGAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQO/ZwdoKjNTtq
 Tw/7BICAkShQLcaGg0KTsX/DjUGh1TXYwMigp9GoVxBqMkV6sscSBouSuD2dq+lxKs/WXRP6
 lAo8ffQaEuYAROu/oWWtldGxzRYlXx8yT6AEGdyaYr3ZexSGTRbqPdlQeMZyilN6KWmDN9d0
 K8kNQ5Xh5bOI/6Tb9/C7xTgZeGZaX8X/pLf+iwyDVWtSPBBSZIZKdAuxqnYSCW0fJgMl7O28
 lGiFJL3PTKxrmLvvnHjZwge93BuP46/zhDGoqi6mlnAs/Q+M/OC1SwyDgf2/J70Y9fylhPZc
 5z8VUUTUUqb3qNxsEIrNamcQrIFaMKTHAUUvQARv3GPPSTbQXtvLoi5oiS3WGuHqwaMo9PaM
 7wXwAI1N7zir9v1Z9+l6FfhDZpSMyVbKNj9wOzOiZp1W2Rb1m/+Hk0Vre+nq4Ctyi0BH7UCu
 eqlOUYZA22M457PlM76r11uyhl5opCeI76Mq6xOJzwkGo7ljRxgqi38982AFJcoktRDW0XFd
 gvtymSopG56WVP6g14d9v1C8HU5myS5CDuewUcD396dVB324cuZOBf+lbA7KgwjI4IDPwB3j
 0in23fpKaym0w38y3avWApanPpdJd4z7G7/3Ss1HaQTzLX79WNw6yxlBxGN7I9DxCqFL+2QG
 J3S5bzSgYakoAEnzXjQBSk5mbG0u4DbmJ1bU9/bOwU0Eae8uOgEQAOOQmj3kv6YzdsuFCO80
 bjzCk4KsumyXNZ732My+vKRrKRPdozj7qVdNZsphmx83mkq5SYx0/TFMhxcn7km25gVzGI2d
 +qHOFilH6u0ugr9ob/IFWJk07Vw43/iuqvAODGfATppbvm8UqQzIp3riPNMUOVeiT/lAvkl6
 xO3eJwCkwSDBAhgRBQwuLpjAI8MUz2XGL5UcHgPl1wkmHpuvB62hZGoBqDPcj2eSB9RhLBVJ
 PCuopRbmYrYFsyBMOEwUczGezzfFXWXZ5zDShxjCYMmjgd1ukYfGG3LlgK3srKSrb5YTSV4l
 H0lS+pRWLKy2Z1aWl7MKxdOwrDVbmP65USqvYsrLXQ3qabh7DS3N0JV63Duk9YdOUzH5s0b/
 iDEgnAL6TgmlAysRwvuZM2MWX1xGAnM/5qgEfu6bR8aS55DJ6/NTyII5sObEJlEW4880vKPG
 Gw5b5m2Pr/yoQdURRCG2BfoQupmGcN9DdqjDfLRDQqHk5f02u73epHfWsf+bAVLjzDZYCCGP
 r0uxYmz+EulRedtuXabz+zPeXwh2q45PYPb4NbCHICtJkw60Vz8g8Nq9ffTLBMcBHqVRDUD9
 gq5s6zfn/xaD/d5UzNLmgonqMpOWXM61U+FO96A0cTJIaLo0MfkxgjWZoceD1lgvlVIPKbgt
 CwB/u4lQOZeag9HdABEBAAHCwXwEGAEIACYWIQSV5iAbzbvOM9ZQ6tM79nB2gqM1OwUCae8u
 OwUJCWYBgAIbDAAKCRA79nB2gqM1OxybD/4xZ/xdebhhomnXm1Mivtp0EMn0ZwaQuIQ07SlK
 /mQqtgfIwHoHSLnS7tQgyeOZnI1khwnOn3zendeytxfCKyhuQbwBh8ppgwxucc6JC7UD8jEo
 KBGhplrs0bdI8YxqQDH8gdZoiXwfe2REPDdNciYQ+OmidMBGq7EVAucrDpPCQ3UvPODI3zOk
 3MsP1/p9Guzr2VYK2G1NL+ZlzZDnl7wZ3kQzAlg2IukGkdIWEpo27oOdNParpnd9jes/U0AG
 tlYoWOWsxtE8DDKlje+ORCHQuFJynEV06agCpIo3io5NNUt6m+YpOvfOh53y4IlEUfOG5sBz
 CQwsZJ/cmJJLAW6qvWuKUOXP2MjJIg0Afwly2mqgy8D26quzf47O0Kra4yysfVRkK8iElm+B
 BLG/tSoxTarjWW+7RGpFAxXHSIkUWGIhpSx3MsF9ZYJIdtKft2qLCGnDJ6wKEI0yMckRnoON
 Ur8uEJkM8oCU90g4rZTJ5zqtki2nfXGNKE4NblFl5XHq+ehG3O0kPBwejUqagvniJqdXUnNk
 ttZaV8JoZAvGDfgX4kHjdkTUuiBtketoUs3h5HKAYrA9VZyVIDiz1vlsviHpSgXbYB06+LKe
 HvAEHUvnGVuBchVLEX/kmFrxjW+dFu8D7KR145s2jfNAddotpFX4YL+38XYNhwhXQVqVhQ==
In-Reply-To: <CAAhSdy2HK2DKF_9Z_Cdx3NzsOs9DxHBPM0-1xVHgMwiYsv9-Og@mail.gmail.com>
Feedback-ID: :bbb8044e0943cee:ham:8bba193fd89ba14
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_060342_742075_16D8DE74 
X-CRM114-Status: GOOD (  13.49  )
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

Ck9uIDQvMjQvMjYgNjo1NSBQTSwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBGcmksIEFwciAyNCwg
MjAyNiBhdCAxMDowOeKAr1BNIEJhcHRpc3RlIExlIER1Ywo+IDxiYXB0aXN0ZS5sZWR1Y0BldGlr
LmNvbT4gd3JvdGU6Cj4+IEhpLAo+Pgo+PiBXaGlsZSBhZGRpbmcgWGVuL1JJU0MtViBzdXBwb3J0
LCB0aGUgZ3Vlc3QgZXZlbnQgY2hhbm5lbCBpbnRlcnJ1cHQgaXMKPj4gYWxsb2NhdGVkIHZpYSBp
cnFfb2ZfcGFyc2VfYW5kX21hcCgpIGFnYWluc3QgdGhlIElNU0lDIGRvbWFpbiBhbmQsIGlmCj4+
IHdlIHJlZmVyIHRvIHRoZSBBUk0gaW1wbGVtZW50YXRpb24sIGl0IG11c3QKPj4gYmUgZW5hYmxl
ZC9kaXNhYmxlZCBwZXIgdkNQVSB0aHJvdWdoIGVuYWJsZV9wZXJjcHVfaXJxKCkgLwo+PiBkaXNh
YmxlX3BlcmNwdV9pcnEoKSBpbiB0aGUgQ1BVIGhvdHBsdWcgY2FsbGJhY2tzLgo+Pgo+PiBXaXRo
IElNU0lDIHVzaW5nIGhhbmRsZV9lZGdlX2lycSAodGhlIHVwc3RyZWFtIGRlZmF1bHQpLAo+PiBl
bmFibGVfcGVyY3B1X2lycSgpIG5ldmVyIGNsZWFycyBJUlFEX0lSUV9ESVNBQkxFRC4gVGhhdCBm
bGFnIGlzIHNldCBhdAo+PiBpcnFfZGVzYyBhbGxvY2F0aW9uIHRpbWUgKGlycWRlc2MuYykgYW5k
IGlzIG9ubHkgY2xlYXJlZCBieQo+PiBpcnFfc3RhcnR1cCgpLCB3aGljaCBpcyBjYWxsZWQgZnJv
bSBfX3NldHVwX2lycSgpIG9ubHkgd2hlbgo+PiBpcnFfc2V0dGluZ3NfY2FuX2F1dG9lbmFibGUo
KSByZXR1cm5zIHRydWUuCj4+Cj4+IGlycV9zZXRfcGVyY3B1X2RldmlkKCkgc2V0cyBJUlFfTk9B
VVRPRU4gKHZpYSBpcnFfc2V0X3BlcmNwdV9kZXZpZF9mbGFncyksCj4+IHNvIGlycV9zdGFydHVw
KCkgaXMgaW50ZW50aW9uYWxseSBza2lwcGVkIGZvciBwZXJjcHUtZGV2aWQgSVJRcy4KPj4gZW5h
YmxlX3BlcmNwdV9pcnEoKSBjYWxscyBpcnFfcGVyY3B1X2VuYWJsZSgpIHdoaWNoIGRvZXMgaXJx
X2VuYWJsZS91bm1hc2sKPj4gb24gdGhlIGNoaXAgYnV0IG5ldmVyIHRvdWNoZXMgSVJRRF9JUlFf
RElTQUJMRUQuCj4+Cj4+IFJlc3VsdDogaGFuZGxlX2VkZ2VfaXJxKCkgaGl0cyBpcnFfY2FuX2hh
bmRsZV9hY3Rpb25zKCkg4oaSIGNoZWNrcwo+PiBpcnFkX2lycV9kaXNhYmxlZCgpIOKGkiByZXR1
cm5zIGZhbHNlIOKGkiBJUlEgc2lsZW50bHkgZHJvcHBlZC4KPj4KPj4gVGhpcyB3YXMgY29uZmly
bWVkIGJ5IGxvZ3M6Cj4+Cj4+ICAgICBYRU5fVFJBQ0UgaXJxPTEyIHBlcmNwdV9lbmFibGUgY3B1
PTAgSVJRRF9ESVNBQkxFRD0xCj4+ICAgICBYRU5fVFJBQ0UgaXJxPTEyIGhhbmRsZV9lZGdlIERS
T1AgSVJRRF9ESVNBQkxFRD0xIGFjdGlvbj0uLi4KPj4KPj4gV2hhdCB3ZSB0cmllZAo+PiAtLS0t
LS0tLS0tLS0tCj4+IC0gcmVxdWVzdF9pcnEoKSBjb3JyZWN0bHkgd29ya3Mgd2l0aCB1cHN0cmVh
bSBJTVNJQyB3aGljaCB1c2VzCj4+IGhhbmRsZV9lZGdlX2lycSB3aXRoIG5vCj4+IGlycV9zZXRf
cGVyY3B1X2RldmlkKCkgYnV0IGl0IG1lYW5zIHdlIG9ubHkgY2FuIGhhdmUgb25lIHZDUFUgd2hp
Y2ggd2lsbAo+PiBhbHdheXMgaGFuZGxlIHRoZSBpcnEsCj4+IGFuZCB3ZSBkb24ndCB3YW50IHRo
YXQuCj4+Cj4+IC0gQWRkaW5nIGlycV9zZXRfcGVyY3B1X2RldmlkKCkgKyBzd2l0Y2hpbmcgdG8g
aGFuZGxlX3BlcmNwdV9kZXZpZF9pcnEgaW4KPj4gaW1zaWNfaXJxX2RvbWFpbl9hbGxvYygpIGZp
eGVzIHRoZSBYZW4gY2FzZSBidXQgYnJlYWtzIGFsbCBvdGhlciBJTVNJQwo+PiB1c2VycyAoUENJ
IE1TSSwgcGxhdGZvcm0gZGV2aWNlcykgdGhhdCBjYWxsIHJlcXVlc3RfaXJxKCksIHNpbmNlCj4+
IHJlcXVlc3RfdGhyZWFkZWRfaXJxKCkgcmVqZWN0cyBJUlFzIG1hcmtlZCBfSVJRX1BFUl9DUFVf
REVWSUQ6Cj4+Cj4+ICAgICBXQVJOSU5HOiBDUFU6IDAgUElEOiAxIGF0IGtlcm5lbC9pcnEvbWFu
YWdlLmM6MjEwMQo+PiAgICAgcmVxdWVzdF90aHJlYWRlZF9pcnErMHg4MC8weDEyYwo+Pgo+PiBU
aGVyZWZvcmUsIGRvIHlvdSBoYXZlIGFueSByZWNvbW1lbmRhdGlvbnMgb24gaG93IHNob3VsZCBJ
IGhhbmRsZSB0aGlzCj4+IGNhc2UgPwo+Pgo+IFRoZSBSSVNDLVYgSU1TSUMgZHJpdmVyIGRvZXMg
bm90IHJlZ2lzdGVyIHBlci1DUFUgaW50ZXJydXB0cwo+IHJhdGhlciBpdCB0cmVhdHMgSURzIGFj
cm9zcyBhbGwgQ1BVcyBhcyBpbmRlcGVuZGVudCB2ZWN0b3JzIGFuZAo+IHBpY2tzIHRoZSByaWdo
dCB2ZWN0b3IgZm9yIGEgZGV2aWNlIE1TSSBiYXNlZCBvbiBhdmFpbGFiaWxpdHkgKyBhZmZpbml0
eS4KPgo+IE9ubHkgdGhlIFJJU0MtViBpbnRjIGRyaXZlciBtYW5hZ2VzIHBlci1DUFUgaW50ZXJy
dXB0cyBzbyB0aGUKPiBYZW4gZ3Vlc3QgZXZlbnQgY2hhbm5lbCBpbnRlcnJ1cHQgc2hvdWxkIGJl
IGEgbG9jYWwgaW50ZXJydXB0Cj4gbWFuYWdlZCBieSBSSVNDLVYgaW50YyBkcml2ZXIuCgpEbyB5
b3UgbWVhbiB0aGUgc29mdHdhcmUgaW50ZXJydXB0IGJpdCAoYml0IDIpIG9mIFJJU0MtViBpbnRj
IG9yIApzb21ldGhpbmcgZWxzZSA/Cgo+Cj4gUmVnYXJkcywKPiBBbnVwCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
