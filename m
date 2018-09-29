Return-Path: <SRS0=lSM2=ML=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB9DC43143
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 20:45:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D84142073F
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 20:45:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XYGJH+oS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D84142073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MVvFveJH6L75a7kkGKdkRJt7c6ocp+GD1V8mgnrlJeM=; b=XYGJH+oS7F0A32ViqZ8Baw244
	kZZu3kqh84WdTMkjWaMY4hjwTtAyHfdoeGfk69vVBHTe005YmXg9Etl1XuywmHVj3HqcxzfEh/PAv
	XhEzLZ1HbI3reKQ1fJj5OrLztUI74bUbIs4AN4pt9ccBmEaEFN6hn8dUX/cfs1ja0Y3B6WB0M29Zq
	RD7sTWkBwaDrh4Hii+U/ZUYU/OFZJD6PSh1YuasosMpQBa3wQ6Nr/8MifcAn4JeEXDJR4aBYIX5dZ
	Lzz+YvbkyM0kJc+j/NeD95r7fb2B3ImJOyi5S25fUG7LuWxhPolvPOIlqBlvSwj4T8s149tyfBK8d
	oCW4uhP7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g6M7M-00066O-89; Sat, 29 Sep 2018 20:45:36 +0000
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g6M7I-0005A4-Pa
 for linux-riscv@lists.infradead.org; Sat, 29 Sep 2018 20:45:34 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 w8TKj6QW074622; Sat, 29 Sep 2018 23:45:08 +0300 (EEST)
X-AuditID: 8b5b9d4d-903ff70000000e62-47-5bafe4512f9c
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 1D.15.03682.154EFAB5; Sat, 29 Sep 2018 23:45:05 +0300 (EEST)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id w8TKj5J9002243; Sat, 29 Sep 2018 23:45:05 +0300
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Sat, 29 Sep 2018 23:45:05 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH] RISC-V: Cosmetic menuconfig changes
Organization: FORTH
In-Reply-To: <mhng-4c7f23e6-3111-4b77-9cb9-87da815f14d7@palmer-si-x1c4>
References: <mhng-4c7f23e6-3111-4b77-9cb9-87da815f14d7@palmer-si-x1c4>
Message-ID: <904aad36ec736345fc715b3f13c268f1@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFLMWRmVeSWpSXmKPExsXSHc2orBv4ZH20wfdJNhZbf89it9j2uYXN
 ovndOXaLzRMWsDqweBzu+MLu8XDTJSaPzUvqPS41X2cPYInisklJzcksSy3St0vgypizfBdz
 wSGuihuT5rM0MK7l6GLk5JAQMJH4dPMmexcjF4eQwFFGiR0v29hAEkIChxglfqwRgSgylZi9
 t5MRxOYVEJQ4OfMJC4jNLGAhMfXKfkYIW16ieetsZhCbRUBV4tn2XWA1bAKaEvMvHQSzRQTU
 JA41HYGq95XYNv08WL0w0JytP68zgdj8AsISn+5eZAWxOQXcJR6sn8wKcY+bxNm/85ggbnCR
 WHfoBwvEbSoSH34/YAexRQWUJV6cmM46gVFoFpJTZyE5dRaSUxcwMq9iFEgsM9bLTC7WS8sv
 KsnQSy/axAgO8bm+OxjPLbA/xCjAwajEwxtwaH20EGtiWXFlLjBcOJiVRHi37gMK8aYkVlal
 FuXHF5XmpBYfYpTmYFES5z38IjxISCA9sSQ1OzW1ILUIJsvEwSnVwBiX/87HPCx5ufPbW0t+
 8CjP6pxynNnwwBlp46v8mYdVP2gtiDwll/XbeN5RFy0Vd0OllKJp/l/Wz3Y/YGmX5TqTJ/bz
 giOPjltwPC06vnpF5Im41Xe597y/XC0eN1GKl+tgnSTj9Ql7qjI957TuV/ya9GLHTlP1FNmH
 sl6davzOTastM6UtjyixFGckGmoxFxUnAgBXmPRybQIAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180929_134533_202379_6EA81E91 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mick@ics.forth.gr, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180929204505.UHVolnNJAIJfg0_VzmDyz0hWJRUq4_zTUEZkoM2qnOo@z>

zqPPhM65z4IgMjAxOC0wOS0yOSAwNDo0NCwgUGFsbWVyIERhYmJlbHQgzq3Os8+BzrHPiM61Ogo+
IE9uIFdlZCwgMTkgU2VwIDIwMTggMTU6NDg6MTUgUERUICgtMDcwMCksIG1pY2tAaWNzLmZvcnRo
LmdyIHdyb3RlOgo+PiAqIE1vdmUgdGhlIGJ1aWx0LWluIGNtZGxpbmUgY29uZmlndXJhdGlvbiBv
biBhIG5ldyBtZW51IGVudHJ5ICJCb290Cj4+ICAgb3B0aW9ucyIsIGl0IGRvZXNuJ3QgbWFrZSBt
dWNoIHNlbnNlIHRvIGJlIHBhcnQgb2YgdGhlIGRlYnVnaW5nIAo+PiBtZW51Lgo+PiAKPj4gKiBS
ZW5hbWUgIktlcm5lbCBUeXBlIiBtZW51IHRvICJLZXJuZWwgZmVhdHVyZXMiIHRvIGJlIG1vcmUg
Y29uc2lzdGVudCAKPj4gd2l0aAo+PiAgIHdoYXQgb3RoZXIgYXJjaGl0ZWN0dXJlcyBhcmUgdXNp
bmcsIHBsdXMgInR5cGUiIGlzIGEgYml0IG1pc2xlYWRpbmcgCj4+IGhlcmUuCj4+IAo+PiBTaWdu
ZWQtb2ZmLWJ5OiBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPgo+IAo+IFRoaXMg
c2VlbXMgcmVhc29uYWJsZSB0byBtZS4gIEkndmUgYWRkZWQgaXQgdG8gb3VyIGZvci1uZXh0IGJy
YW5jaCwKPiB3ZSdsbCBzZWUgaWYgYW55b25lIGVsc2UgaGFzIGNvbW1lbnRzLiAgVGhhbmtzIQo+
IAo+IERpZCB5b3UsIGJ5IGFueSBjaGFuY2UsIGdvIGFuZCBjaGVjayB0byBzZWUgaWYgdGhlc2Ug
Ym9vdCBvcHRpb25zCj4gYWN0dWFsbHkgd29yaz8gIFdlJ3ZlIGdvdCBhIGJ1bmNoIG9mIHN1YnRs
eSBkaWZmZXJlbnQgYm9vdCBtZXRob2RzIGFuZAo+IHRoZXkndmUgYmVlbiBicm9rZW4gaW4gdmFy
aW91cyBvbmVzIGF0IHZhcmlvdXMgdGltZXMsIHNvIEkgYWx3YXlzIGxpa2UKPiB0byB0cnkgYW5k
IGNhdGFsb2cgd2hhdCBhY3R1YWxseSB3b3JrcyBub3cgc28gYXQgbGVhc3QgSSBrbm93IHdoZXJl
IHRvCj4gbG9vayB3aGVuIHRlc3RpbmcgdGhpbmdzLgo+IAoKSSBhc3N1bWVkIHRoYXQgc2luY2Ug
aXQgd2FzIGFscmVhZHkgdGhlcmUgaXQgd29ya2VkIGJ1dCB5b3UgYXJlIHJpZ2h0LCAKY21kbGlu
ZSB3aGVuIHBhc3NlZCBmcm9tIHRoZSBib290bG9hZGVyIHRocm91Z2ggdGhlIGdlbmVyYXRlZCBk
ZXZpY2UgCnRyZWUgCihodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtcWVtdS9ibG9iL3Jp
c2N2LWFsbC9ody9yaXNjdi92aXJ0LmMpIAp3b3JrcyBidXQgd2hlbiBwYXNzZWQgdGhyb3VnaCB0
aGUgY29uZmlnIG9wdGlvbiBkb2Vzbid0LiBEbyB5b3Ugd2FudCBtZSAKdG8gc2VuZCBhIHNlcGFy
YXRlIHBhdGNoIGZvciB0aGF0IG9yIHJlLXNlbmQgdGhpcyBvbmUgYXMgd2VsbCBhcyBhIApzZXJp
ZXMgPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
