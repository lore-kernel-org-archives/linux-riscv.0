Return-Path: <SRS0=er6D=OO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DFAC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Sep 2021 04:35:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDC7961107
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Sep 2021 04:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BDC7961107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xb5fX9yEUqwliSUT0x32Ox/YV8Pj+KHQYC9lY5g9eZI=; b=CjUdXw2PLNEb7e
	9Raguvlz8eansSLh0vGAolw/n0bA3l9F0uFHyPhFPeGXXWgES4ZWVo/53efRGd0aZ62ZndmyqX2yn
	O6K3rbWbfMLW+vC0NNHBb8K1+jB7Y+QPzFhAja2QNLeixqCADodsZUEngH/wuddEV90Ix/aeN1Hj5
	/TmjGDV0nQKglHKOxIT2CVLzPkKqtQKVyXoUAZUfwb3nXeqyTu6dT6vZFVS5cviiXk2x4rQZrUPfQ
	xUDHBWg9Wb6g60IUUd5Y8aUrqGmT03iLx7k6TOxh+lhbEa8qE9mJTqexShOkWpfWsziNFnQ8aX60o
	opBRUBZs//Qvztat/BPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTcvm-00D55h-Es; Fri, 24 Sep 2021 04:35:26 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTcvj-00D54l-4d
 for linux-riscv@lists.infradead.org; Fri, 24 Sep 2021 04:35:24 +0000
Received: by mail-io1-xd2a.google.com with SMTP id b10so10950764ioq.9
 for <linux-riscv@lists.infradead.org>; Thu, 23 Sep 2021 21:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xcH9wYSR91fpt+5IhR8QHq5X+wHLKfuvWgni3VmGpiU=;
 b=IwQPPQ10h/E5e/e7b49Tir8b5B9hgs/Wi9m4wHV/tEVRB3SijM3j5dbrNfI70GEMmU
 cRwjbjssjw6ODT3JN0RVWcjCh8cD0Y+CxXu3DS242Uo98NLw5U6yKDmaKI7w92iroixP
 FNFPWVZtRff9VniJ6HRtLlhtjP1A+XGYVlKmmehI+WDSy6N3Vhs8UeQdDjtQZonRdhi8
 NccqO+MnV+D0g4F3ZApPzqWM7HOzosTHlI2dmcTR6jmCvjmofQQJgJHaNMaP24vhKiM1
 tuejb39zHQw4ELgt9h8JAtObelmIa1RCFZ/C+W07FW94J8bAun/3aAZVQ5CkoS+Bfp+h
 hSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xcH9wYSR91fpt+5IhR8QHq5X+wHLKfuvWgni3VmGpiU=;
 b=g891ajIErDxeOf0ya2qgv/rd+cxeqF7yDyYNPODWHF7NIhe1jeiOzWsTso3rw7a0we
 +H0D1SwH41wRx39BscT+87pNOGVX+/l816/bHYrpyYfWZFjH8zgYvlJg5UYdMbUaDr9I
 5wA/W5neuYY/bUG3TKZ+3/v8W5FhxfKGuLpXqZcq3ePNYL7K+teIloFSna18dDovZhPM
 /xJgeF8vrW+5E3U2adk8voUW8MRa0C73xADDUMijWRrS+lhzHPfqlUs/tdwW4glDviyk
 7ToWX5AB4v/jYcfRsAox68OdBhPeI3CJUtjcCrURlaxLj4Wtns2eIEAY4dpi9PUJsTv6
 wC8g==
X-Gm-Message-State: AOAM532vYTvHnz2BRMLvxuCqHq4wxUzGtpjy2P9mbyvtkqC9zlymCl+N
 NSeN75j6WFi+bg6UgFZxN2HssPdlXPO9kHjgHek=
X-Google-Smtp-Source: ABdhPJw0PKpy4KqW5zF42c4Or1B+70c7jdEyFtPXZxvh0z0enU/YbxlqfhfU5mkG+k5Ewtfp3z2GHTvrCk4/ot0G2y4=
X-Received: by 2002:a02:2124:: with SMTP id e36mr7336788jaa.35.1632458122367; 
 Thu, 23 Sep 2021 21:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210917061040.2270822-1-alistair.francis@opensource.wdc.com>
 <20210917061040.2270822-2-alistair.francis@opensource.wdc.com>
 <72990864-5ec6-1f73-efd9-61b667a172dd@collabora.com>
 <CAK8P3a3x_EyCiPDpMK54y=Rtm-Wb08ym2TNiuAZgXhYrThcWTw@mail.gmail.com>
In-Reply-To: <CAK8P3a3x_EyCiPDpMK54y=Rtm-Wb08ym2TNiuAZgXhYrThcWTw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 24 Sep 2021 14:34:56 +1000
Message-ID: <CAKmqyKM3vy_Ob1a0=cEi_Efi6_VVAa8YfMb6+rOt3fQK_TTcmw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] perf bench: Add support for 32-bit systems with
 64-bit time_t
To: Arnd Bergmann <arnd@arndb.de>
Cc: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>, 
 Alistair Francis <alistair.francis@opensource.wdc.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Namhyung Kim <namhyung@kernel.org>, 
 Jiri Olsa <jolsa@redhat.com>, linux-perf-users@vger.kernel.org, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Darren Hart <dvhart@infradead.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <alistair.francis@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_213523_208200_1BB38501 
X-CRM114-Status: GOOD (  22.66  )
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

T24gVHVlLCBTZXAgMjEsIDIwMjEgYXQgNjowOCBQTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPiB3cm90ZToKPgo+IE9uIFR1ZSwgU2VwIDIxLCAyMDIxIGF0IDEyOjQ3IEFNIEFuZHLDqSBB
bG1laWRhCj4gPGFuZHJlYWxtZWlkQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+ID4KPiA+ICNpZiBk
ZWZpbmVkKF9faTM4Nl9fKSB8fCBfX1RJTUVTSVpFID09IDMyCj4gPiAjIGRlZmluZSBOUl9nZXR0
aW1lNjQgX19OUl9jbG9ja19nZXR0aW1lNjQKPiA+ICNlbHNlCj4gPiAjIGRlZmluZSBOUl9nZXR0
aW1lNjQgX19OUl9jbG9ja19nZXR0aW1lCj4gPiAjZW5kaWYKPiA+Cj4gPiBzdHJ1Y3QgdGltZXNw
ZWM2NCB7Cj4gPiAgICAgICAgIGxvbmcgbG9uZyB0dl9zZWM7ICAgICAgIC8qIHNlY29uZHMgKi8K
PiA+ICAgICAgICAgbG9uZyBsb25nIHR2X25zZWM7ICAgICAgLyogbmFub3NlY29uZHMgKi8KPiA+
IH07Cj4gPgo+ID4gaW50IGdldHRpbWU2NChjbG9ja190IGNsb2NraWQsIHN0cnVjdCB0aW1lc3Bl
YzY0ICp0dikKPiA+IHsKPiA+ICAgICAgICAgcmV0dXJuIHN5c2NhbGwoTlJfZ2V0dGltZTY0LCBj
bG9ja2lkLCB0dik7Cj4gPiB9Cj4gPgo+ID4gVGhlbiB3ZSBjYW4ganVzdCB1c2UgJnRpbWVvdXQg
YXQgX19OUl9mdXRleF90aW1lNjQgZm9yIDMyYml0IGFyY2ggYW5kIGF0Cj4gPiBfX05SX2Z1dGV4
IGZvciA2NGJpdCBhcmNoLgo+Cj4gVGhpcyBpcyBzdGlsbCBicm9rZW4gd2hlbiB5b3UgZGlzYWJs
ZSBDT05GSUdfQ09NUEFUXzMyQklUX1RJTUUsCj4gd2hpY2ggZGlzYWJsZXMgYWxsIHN5c3RlbSBj
YWxscyB0aGF0IHRha2UgdGltZTMyIGFyZ3VtZW50cy4KPgo+ID4gVGhpcyBtaWdodCBiZSBhIHNp
bXBsZXIgc29sdXRpb24gdG8gdGhlIHByb2JsZW0gdGhhdCB5b3UgYXJlIGZhY2luZyBidXQKPiA+
IEknbSBub3QgZW50aXJlbHkgc3VyZS4gQWxzbywgZnV0ZXgncyBzZWxmdGVzdHMgZG8gdXNlIHRo
ZSB0aW1lb3V0Cj4gPiBhcmd1bWVudCBhbmQgSSB0aGluayB0aGF0IHRoZXkgYWxzbyB3b24ndCBj
b21waWxlIGluIDMyLWJpdCBSSVNDLVYsIHNvCj4gPiBtYXliZSB3ZSBjYW4gc3RhcnQgZnJvbSB0
aGVyZSBzbyB3ZSBjYW4gYWN0dWFsbHkgdGVzdCB0aGUgdGltZW91dAo+ID4gYXJndW1lbnQgYW5k
IGNoZWNrIGlmIGl0J3Mgd29ya2luZy4KPgo+IEkgd291bGQgbG92ZSB0byBzZWUgdGhlIHdyYXBw
ZXIgdGhhdCBBbGlzdGFpciB3cm90ZSBhcyBwYXJ0IG9mIHNvbWUga2VybmVsCj4gdWFwaSBoZWFk
ZXIgcHJvdmlkZWQgdG8gdXNlciBzcGFjZS4gZnV0ZXggaXMgdXNlZCBieSB0b25zIG9mIGFwcGxp
Y2F0aW9ucywKPiBhbmQgd2UgbmV2ZXIgaGFkIGEgbGlicmFyeSBhYnN0cmFjdGlvbiBmb3IgaXQs
IHNvIGV2ZXJ5b25lIGhhcyB0byBkbyB0aGVzZQo+IGJ5IGhhbmQsIGFuZCB0aGV5IGFsbCBnZXQg
dGhlbSBzbGlnaHRseSB3cm9uZyBpbiBkaWZmZXJlbnQgd2F5cy4KPgo+IFdlIG5vcm1hbGx5IGRv
bid0IGRvIHRoaXMgaW4ga2VybmVsIGhlYWRlcnMsIGJ1dCBJIHRoaW5rIHRoZSBiZW5lZml0cwo+
IHdvdWxkIGJlIGZhciBncmVhdGVyIGNvbXBhcmVkIHRvIHRvZGF5J3Mgc2l0dWF0aW9uLgoKSSdt
IGhhcHB5IHRvIHByZXBhcmUgYSBwYXRjaCwgaWYgb3RoZXJzIGFyZSBvbiBib2FyZCB3aXRoIGl0
IGJlaW5nIGFjY2VwdGVkLgoKQWxpc3RhaXIKCj4KPiAgICAgICBBcm5kCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
