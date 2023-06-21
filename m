Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97D1EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 04:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zv2rb/YhYv0ZtmUOoxrfrTQ3DDoiVrAs5JYyn1rfHk4=; b=MIrlBgR3TP9FlX
	toNMXjXRSPTkuFDaLRW/xNHHjhPylV+TcfURe8yH9thYtIApD8siaEWwpeFTUGilNQlSjaj8mTn9N
	3ulbm6ebglk7/XMDZVfrsotcCYgr0J2q+c8Z+6K4jDd4J//BHXYEidQ5Qk5+jVltVQWyq7JLHktmB
	movPwq+8kPWRdI/hZaCZJdZlfK8Wio9d/Gg2m4LpU/W0t5Z8KV0vDp12W6AaVXG/1IKD3FWTIYRKY
	XwXKNzzevj+BFrPJoco3M3zEmPOnlCdiRsNLMqVULkZqWNz1Yw+Zut2CHMNN8OWj6ztXeVqI10VRZ
	EpgWvYACb6smuVbWUOkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBpP3-00DBr6-1F;
	Wed, 21 Jun 2023 04:25:09 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBpP0-00DBqL-2C
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 04:25:08 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b4826ba943so36566191fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 21:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687321503; x=1689913503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuEAiEqFzxQqtssF/XyIsWFBa1XFMPGQrF0jyK8eg4s=;
        b=XXpqOWb76gFbvNHhpsISUXf41NyGxTGOgD+JApzu1tOt1Ekny/Au85wYwds7Uubgu8
         ydGBnJMW7KUk1G00lw29oWp/1fVcgHrGPiVHc74p95m8qW3E+DOvCsAHYU56WRlldZoG
         TJCqBMgFueyBOpq4TVo8LehsCBwNZQFu4mfpyiBpc3BitrVcUX9+zJr2FTbiBFL0eidM
         5BDvYZ+KdwVKznHkHNWmrHae9zbuSCxdrds+VTb1dEqovVZHzAZ7QF/FrLVPBjMqq1pz
         ho1Zo2+BXtftckfSK1xZah07L5YhK3odnfF/1XKuvAfcRVnYZTi2LwqYJOuO93RMf8iC
         05Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687321503; x=1689913503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LuEAiEqFzxQqtssF/XyIsWFBa1XFMPGQrF0jyK8eg4s=;
        b=JUPHrmQYymn1pcP13gk4xtkIHjKrjxIdWgb/4BP6+pT+7KTxX6TRPSlQMVyRt8C2Dv
         9UJjE5ysbUgipDREBdyZClZDmvvjIIA8Sz288XeleTujYS8KqT9sjEvkJWjs37KDNRHX
         ndj6jvudjknry4Bk+8xBxlfYuvPYe75sP2iFikIsdyICLctAPTqoeZuI+hJ014cYd6U2
         Qr7tJpJlX5WenDX1VEnIT4x9IJOotplABB3MZvcIrJVisnmHmiXpGtMoxpzywUGGfEcf
         dzILwm0wZEUsm7onuCzQMwc+BZVNmp+Ej31IOjmTLxpKVAbKIjzBWYJq1uYQJQXEqlVc
         D2/g==
X-Gm-Message-State: AC+VfDyx14iSKa7ldwUWziT9LNYwfGWE0ua/yOp6+V8aeDjHIBVsy+6I
	mDwsxgxMtN5lzvA4B+61YtQCgtyAtysKeGHnuIPKpA==
X-Google-Smtp-Source: ACHHUZ5e35l6LnX7XodTQBDPnk2bkYC/RZKniEMCiLxMYVECDyKqRYf9BNAs3JuKORFJ64C9YqrbJoQzdffkcu3SbgM=
X-Received: by 2002:a2e:7d09:0:b0:2b4:74a7:9606 with SMTP id
 y9-20020a2e7d09000000b002b474a79606mr4726742ljc.46.1687321503290; Tue, 20 Jun
 2023 21:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230602094841.1225-1-eric.lin@sifive.com>
In-Reply-To: <20230602094841.1225-1-eric.lin@sifive.com>
From: Eric Lin <eric.lin@sifive.com>
Date: Wed, 21 Jun 2023 12:24:52 +0800
Message-ID: <CAPqJEFpamQSbCcD0QJ16u7ctRf1=NYihod6gdZJfxFpE0YUVHQ@mail.gmail.com>
Subject: Re: [PATCH] perf/core: Add pmu stop before unthrottling to prevent WARNING
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	namhyung@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	palmer@dabbelt.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	eranian@google.com
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_212506_794620_9EBB82BF 
X-CRM114-Status: GOOD (  17.20  )
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

Q0M6IFN0ZXBoYW5lIEVyYW5pYW4KCk9uIEZyaSwgSnVuIDIsIDIwMjMgYXQgNTo0OeKAr1BNIEVy
aWMgTGluIDxlcmljLmxpbkBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSwgZHVyaW5n
IHRoZSBwZXJmIHNhbXBsaW5nLCBpZiB0aGUgcGVyZiBpbnRlcnJ1cHQgdGFrZXMgdG9vIGxvbmcs
Cj4gcGVyZiBmcmFtZXdvcmsgd2lsbCBsb3dlciB0aGUgcGVyZl9ldmVudF9tYXhfc2FtcGxlX3Jh
dGUuIFRoaXMgd2lsbCBsaW1pdAo+IHRoZSBudW1iZXIgb2Ygc2FtcGxlcyBwZXIgdGltZXIgdGlj
ayAobWF4X3NhbXBsZXNfcGVyX3RpY2spIGFuZCBzZXQgaHdjLT5pbnRlcnJ1cHRzCj4gdG8gTUFY
X0lOVEVSUlVQVFMgd2l0aGluIHRoZSBfX3BlcmZfZXZlbnRfYWNjb3VudF9pbnRlcnJ1cHQoKSBm
dW5jdGlvbi4KPgo+IEFmdGVyd2FyZCwgdGhlIHBlcmYgZnJhbWV3b3JrIHdpbGwgdW50aHJvdHRs
ZSB0aGUgZXZlbnQgaW4gdGhlIHRpbWVyIGludGVycnVwdAo+IGhhbmRsZXIsIHdoaWNoIHRyaWdn
ZXJzIHRoZSBkcml2ZXIncyAqX3BtdV9zdGFydCgpIGZ1bmN0aW9uLiBNb3N0IG9mIHRoZSBkcml2
ZXIncwo+ICpfcG11X3N0YXJ0KCkgZnVuY3Rpb25zIHdpbGwgY2hlY2sgdGhlIGV2ZW50LT5ody5z
dGF0ZSB0byBkZXRlcm1pbmUgd2hldGhlciB0aGlzCj4gZXZlbnQgaGFzIHN0b3BwZWQuIElmIHRo
ZSBldmVudCBoYXMgbm90IHN0b3BwZWQsIGEgV0FSTl9PTl9PTkNFKCkgd2FybmluZwo+IHdpbGwg
YmUgdHJpZ2dlcmVkIGFzIHNob3duIGJlbG93Ogo+Cj4gWyAyMTEwLjIyNDcyM10gLS0tLS0tLS0t
LS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4gWyAyMTEwLjIyNDg1MV0gV0FSTklORzogQ1BV
OiAwIFBJRDogMjQwIGF0IGRyaXZlcnMvcGVyZi9yaXNjdl9wbXUuYzoxODQgcmlzY3ZfcG11X3N0
YXJ0KzB4N2MvMHg4ZQo+IFsgMjExMC4yMjUyNDJdIE1vZHVsZXMgbGlua2VkIGluOgo+IFsgMjEx
MC4yMjUzODBdIENQVTogMCBQSUQ6IDI0MCBDb21tOiBscyBOb3QgdGFpbnRlZCA2LjQtcmM0LWcx
OWQwNzg4ZTllZjIgIzEKPiBbIDIxMTAuMjI1NTc0XSBIYXJkd2FyZSBuYW1lOiBTaUZpdmUgKERU
KQo+IFsgMjExMC4yMjU2NTddIGVwYyA6IHJpc2N2X3BtdV9zdGFydCsweDdjLzB4OGUKPiBbIDIx
MTAuMjI1ODM0XSAgcmEgOiByaXNjdl9wbXVfc3RhcnQrMHgyOC8weDhlCj4gWyAyMTEwLjIyNTk5
OF0gZXBjIDogZmZmZmZmZmY4MGFlZjg2NCByYSA6IGZmZmZmZmZmODBhZWY4MTAgc3AgOiBmZmZm
OGY4MDAwNGRiNmYwCj4gWyAyMTEwLjIyNjEzNV0gIGdwIDogZmZmZmZmZmY4MWM4Mzc1MCB0cCA6
IGZmZmZhZjgwMDY5ZjliYzAgdDAgOiBmZmZmOGY4MDAwNGRiNmMwCj4gWyAyMTEwLjIyNjI0NV0g
IHQxIDogMDAwMDAwMDAwMDAwMDAwMCB0MiA6IDAwMDAwMDAwMDAwMDAwMWYgczAgOiBmZmZmOGY4
MDAwNGRiNzIwCj4gWyAyMTEwLjIyNjM2N10gIHMxIDogZmZmZmFmODAwOGNhMTA2OCBhMCA6IDAw
MDBmZmZmZmZmZmZmZmYgYTEgOiAwMDAwMDAwMDAwMDAwMDAwCj4gWyAyMTEwLjIyNjQ4OF0gIGEy
IDogMDAwMDAwMDAwMDAwMDAwMSBhMyA6IDAwMDAwMDAwMDAwMDA4NzAgYTQgOiAwMDAwMDAwMDAw
MDAwMDAwCj4gWyAyMTEwLjIyNjYwNV0gIGE1IDogMDAwMDAwMDAwMDAwMDAwMCBhNiA6IDAwMDAw
MDAwMDAwMDA4NDAgYTcgOiAwMDAwMDAwMDAwMDAwMDMwCj4gWyAyMTEwLjIyNjcyMV0gIHMyIDog
MDAwMDAwMDAwMDAwMDAwMCBzMyA6IGZmZmZhZjgwMDUxNjU4MDAgczQgOiBmZmZmYWY4MDA0MjRk
YTAwCj4gWyAyMTEwLjIyNjgzOF0gIHM1IDogZmZmZmZmZmZmZmZmZmZmZiBzNiA6IGZmZmZmZmZm
ODFjYzc1OTAgczcgOiAwMDAwMDAwMDAwMDAwMDAwCj4gWyAyMTEwLjIyNjk1NV0gIHM4IDogMDAw
MDAwMDAwMDAwMDAwNiBzOSA6IDAwMDAwMDAwMDAwMDAwMDEgczEwOiBmZmZmYWY4MDdlZmJjMzQw
Cj4gWyAyMTEwLjIyNzA2NF0gIHMxMTogZmZmZmFmODA3ZWZiYmYwMCB0MyA6IGZmZmZhZjgwMDZh
MTYwMjggdDQgOiAwMDAwMDAwMGRiZmJiNzk2Cj4gWyAyMTEwLjIyNzE4MF0gIHQ1IDogMDAwMDAw
MDcwMDAwMDAwMCB0NiA6IGZmZmZhZjgwMDUyNjk4NzAKPiBbIDIxMTAuMjI3Mjc3XSBzdGF0dXM6
IDAwMDAwMDAyMDAwMDAxMDAgYmFkYWRkcjogMDAwMDAwMDAwMDAwMDAwMCBjYXVzZTogMDAwMDAw
MDAwMDAwMDAwMwo+IFsgMjExMC4yMjc0MDddIFs8ZmZmZmZmZmY4MGFlZjg2ND5dIHJpc2N2X3Bt
dV9zdGFydCsweDdjLzB4OGUKPiBbIDIxMTAuMjI3NjIyXSBbPGZmZmZmZmZmODAxODViNTY+XSBw
ZXJmX2FkanVzdF9mcmVxX3VudGhyX2NvbnRleHQrMHgxNWUvMHgxNzQKPiBbIDIxMTAuMjI3OTYx
XSBbPGZmZmZmZmZmODAxODg2NDI+XSBwZXJmX2V2ZW50X3Rhc2tfdGljaysweDg4LzB4OWMKPiBb
IDIxMTAuMjI4MjM1XSBbPGZmZmZmZmZmODAwNjI2YTg+XSBzY2hlZHVsZXJfdGljaysweGZlLzB4
MjdjCj4gWyAyMTEwLjIyODQ2M10gWzxmZmZmZmZmZjgwMGI1NjQwPl0gdXBkYXRlX3Byb2Nlc3Nf
dGltZXMrMHg5YS8weGJhCj4gWyAyMTEwLjIyODY5MF0gWzxmZmZmZmZmZjgwMGM1YmQ0Pl0gdGlj
a19zY2hlZF9oYW5kbGUrMHgzMi8weDY2Cj4gWyAyMTEwLjIyOTAwN10gWzxmZmZmZmZmZjgwMGM1
ZTBjPl0gdGlja19zY2hlZF90aW1lcisweDY0LzB4YjAKPiBbIDIxMTAuMjI5MjUzXSBbPGZmZmZm
ZmZmODAwYjVlNTA+XSBfX2hydGltZXJfcnVuX3F1ZXVlcysweDE1Ni8weDJmNAo+IFsgMjExMC4y
Mjk0NDZdIFs8ZmZmZmZmZmY4MDBiNmJkYz5dIGhydGltZXJfaW50ZXJydXB0KzB4ZTIvMHgxZmUK
PiBbIDIxMTAuMjI5NjM3XSBbPGZmZmZmZmZmODBhY2M5ZTg+XSByaXNjdl90aW1lcl9pbnRlcnJ1
cHQrMHgzOC8weDQyCj4gWyAyMTEwLjIyOTk4NF0gWzxmZmZmZmZmZjgwMDkwYTE2Pl0gaGFuZGxl
X3BlcmNwdV9kZXZpZF9pcnErMHg5MC8weDFkMgo+IFsgMjExMC4yMzAxNjJdIFs8ZmZmZmZmZmY4
MDA4YTlmND5dIGdlbmVyaWNfaGFuZGxlX2RvbWFpbl9pcnErMHgyOC8weDM2Cj4KPiBUbyBwcmV2
ZW50IHRoaXMgd2FybmluZywgd2Ugc2hvdWxkIGNhbGwgdGhlIGRyaXZlcidzICpfcG11X3N0b3Ao
KSBmdW5jdGlvbiBiZWZvcmUgdW50aHJvdHRsaW5nCj4KPiBTaWduZWQtb2ZmLWJ5OiBFcmljIExp
biA8ZXJpYy5saW5Ac2lmaXZlLmNvbT4KPiAtLS0KPiAga2VybmVsL2V2ZW50cy9jb3JlLmMgfCAx
ICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEva2Vy
bmVsL2V2ZW50cy9jb3JlLmMgYi9rZXJuZWwvZXZlbnRzL2NvcmUuYwo+IGluZGV4IGRiMDE2ZTQx
ODkzMS4uMDk4Yzg3NWFiZTg4IDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9ldmVudHMvY29yZS5jCj4g
KysrIGIva2VybmVsL2V2ZW50cy9jb3JlLmMKPiBAQCAtNDEyOCw2ICs0MTI4LDcgQEAgcGVyZl9h
ZGp1c3RfZnJlcV91bnRocl9jb250ZXh0KHN0cnVjdCBwZXJmX2V2ZW50X2NvbnRleHQgKmN0eCwg
Ym9vbCB1bnRocm90dGxlKQo+Cj4gICAgICAgICAgICAgICAgIGlmIChod2MtPmludGVycnVwdHMg
PT0gTUFYX0lOVEVSUlVQVFMpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBod2MtPmludGVy
cnVwdHMgPSAwOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGV2ZW50LT5wbXUtPnN0b3AoZXZl
bnQsIDApOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIHBlcmZfbG9nX3Rocm90dGxlKGV2ZW50
LCAxKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBldmVudC0+cG11LT5zdGFydChldmVudCwg
MCk7Cj4gICAgICAgICAgICAgICAgIH0KPiAtLQo+IDIuMTcuMQo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
