Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65083C4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 12:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BX9vKpCfo5Fja0fLbDpPsEaBWH5xrA0/U9QMypofY5c=; b=W9oROtpGq4xXTg
	TgASz2rRdtsRbVYrkPS3BrQ2sZqzw3e8Bemg736tqev+bki7lfESEzxC0L6mfWjziMhYD69NvXtho
	ETzQPBoSTmD8lKls36f4o59mymmbRDpCtIaLN4lTzoo/SWTujHB599jN88qASSz3IFEiXfBrT7s3i
	hbE6AMtcv4M16q/EYDUd/mZlttPSfib828pbruZ8i/2WUuPYqt8cy5eCs0o1tNVQruKBkwnZaOT3V
	MJYrpmWpQ6Hiq+o/ENlNDO3EBQo2QvA8t8b5gh1PxbccmFDU6BxxEuCH81188mN3YX1DhYbIriGmh
	2ZUyXAXlzsCgHvQnIm3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozzMV-008Yp5-3I; Tue, 29 Nov 2022 12:05:19 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozzMS-008YoZ-OP
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 12:05:18 +0000
Received: by mail-pg1-x535.google.com with SMTP id 62so12770684pgb.13
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 04:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARx8DGGG2NwsFzqPTbWSTy92epmGEhrwV9D25Nv/aKQ=;
        b=OZIonAJ76iD3afXMWfxXGJoGySAf7m1aUnJ9zofdYlJcEx+oUrx1IXN9Za+pdVAVY5
         o6S1I6dWBbUZqH+qbmjanvyEkyKa/B1uvmIfsjBlfTHLnWoK1BJIrh9kFNl1WyunISqC
         wpjilY7vRtAecRBsh7Enj19N4PxTkY6LVcAAJ1f+0f3ykToU5Niu0ow0bKqpNS5wqTVv
         9nqstZYCXpWc2YlXjKJA8EorsTes1HKi0P867BLLSHzm7rYy+J0bpx0Qg6tp8vfxaHZw
         sVl+9k2AoRU2BHFwiWk1JStNVm8ZsbDjFpVlcSUncSmLjewWVxG4aS1sdKa/FvDSyV1g
         rIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARx8DGGG2NwsFzqPTbWSTy92epmGEhrwV9D25Nv/aKQ=;
        b=5RCTVv9QNSrPW7WtY2z3yeJ3I39E8ZivHSPY4dXkOVR9Xa/8AyZqI/Tnb3XkFB3ISL
         AE+hIIQ6PrV5+EiuJgVTLRrqj/csmgscR/9Abw2tlm3FKSGyRKf4M5M7SSIpoVAlmZJC
         ZTy9k8eP22IaddOz9ig09V/39/Fjsl1ALtgK2w53SFlp0bvT8ma56uKfrBMHhZKJEtRO
         o91D80vcoirhQ7j+VoZpAB3bAzliCeEWKq4c0F7Gj3XYsbWrovdFFI9TP2G3ybOJToF6
         aUCnVPBSXIjL2l1T32L5kiZl4b+F+JeTd2NxYw5eCl2xZhdTVzp1Nm/bgG8f8vXExaW6
         WVIQ==
X-Gm-Message-State: ANoB5pndYcRib7gyMzjmo/bx+Ubyv6iV2IvBe4mwZompYirUmatFKXcu
	lI2h49hWDvJ8q2lnH8Xf8DFZ4TvlKOJ5KShej98=
X-Google-Smtp-Source: AA0mqf4phHbt1c0jNw+uLhjgh/om2vq4LWvPE/lm+COFFgqYF6IvLc8TldoF1IjBa1Tg0x4agOWdVS6yKdwuE+izErs=
X-Received: by 2002:a65:694e:0:b0:474:6749:407d with SMTP id
 w14-20020a65694e000000b004746749407dmr30583002pgq.425.1669723509931; Tue, 29
 Nov 2022 04:05:09 -0800 (PST)
MIME-Version: 1.0
References: <20221128154506.2691-1-suagrfillet@gmail.com>
In-Reply-To: <20221128154506.2691-1-suagrfillet@gmail.com>
From: Song Shuai <suagrfillet@gmail.com>
Date: Tue, 29 Nov 2022 12:04:56 +0000
Message-ID: <CAAYs2=iYn8sLQB8oh+RzTKd2VKs8MXOLX6Mwpamx5gdVVN6mkA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv/ftrace: select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
To: guoren@kernel.org
Cc: paul.walmsley@sifive.com, wangkefeng.wang@huawei.com, 
	juerg.haefliger@canonical.com, anshuman.khandual@arm.com, 
	alexandre.ghiti@canonical.com, conor.dooley@microchip.com, 
	atishp@atishpatra.org, heiko@sntech.de, palmer@dabbelt.com, 
	apatel@ventanamicro.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_040516_813547_8E98AD9F 
X-CRM114-Status: GOOD (  15.81  )
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

U29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPiDkuo4yMDIy5bm0MTHmnIgyOOaXpeWR
qOS4gCAxNTo0NeWGmemBk++8mgo+Cj4gRnJvbTogU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21h
aWwuY29tPgo+Cj4gSW4gUklTQy1WLCAtZnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeSBvcHRpb24g
aXMgdXNlZCB0byBzdXBwb3J0Cj4gZHluYW1pYyBmdHJhY2UgaW4gdGhpcyBjb21taXQgYWZjNzZi
OGI4MDExICgicmlzY3Y6IFVzaW5nCj4gUEFUQ0hBQkxFX0ZVTkNUSU9OX0VOVFJZIGluc3RlYWQg
b2YgTUNPVU5UIikuIFNvIHJlY29yZG1jb3VudAo+IGRvbid0IGhhdmUgdG8gYmUgY2FsbGVkIHRv
IGNyZWF0ZSB0aGUgX19tY291bnRfbG9jIHNlY3Rpb24gYmVmb3JlCj4gdGhlIHZtbGludXggbGlu
a2luZy4KPgo+IEhlcmUgc2VsZWN0cyBGVFJBQ0VfTUNPVU5UX1VTRV9QQVRDSEFCTEVfRlVOQ1RJ
T05fRU5UUlkgdG8gdGVsbAo+IE1ha2VmaWxlIG5vdCB0byBydW4gcmVjb3JkbWNvdW50Lgo+Cj4g
TGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvQ0FBWXMyPWozRWFrOXZV
NnhiQXcwelB1b2gwMHJoOHY1QzJVM2ZlUGtva1pGaWJXczJnQG1haWwuZ21haWwuY29tL1QvI3QK
PiBTaWduZWQtb2ZmLWJ5OiBTb25nIFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+Cj4gVGVz
dGVkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KVGhpcyBwYXRjaCBoYXMgY29uZmxp
Y3RzIHdpdGggdGhlIGNvbW1pdCAoInJpc2N2OiBmdHJhY2U6IEFkZApEWU5BTUlDX0ZUUkFDRV9X
SVRIX0RJUkVDVF9DQUxMUwpzdXBwb3J0IikgYW5kIGl0cyBuZXh0IGNvbW1pdCBpbiB0aGlzIGZp
bGUuCgpIb3cgYWJvdXQgcmVwb3N0aW5nIHRoaXMgcGF0Y2ggYmFzZWQgb24gdGhlIGFib3ZlIGNv
bW1pdHMgYW5kIGZvbGRpbmcKaXQgaW50byB0aGUgdjUgdmVyc2lvbj8KCkhlcmUgcGFzdGVzIHRo
ZSBsaW5rIGZvciB5b3VyIGNvbnZlbmllbmNlLgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1yaXNjdi8yMDIyMTEyOTAzMzIzMC4yNTU5NDctNy1ndW9yZW5Aa2VybmVsLm9yZy9ULyN1Cgo+
IC0tLQo+ICBhcmNoL3Jpc2N2L0tjb25maWcgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNj
di9LY29uZmlnCj4gaW5kZXggZmE3ODU5NWE2MDg5Li5hZmM1MjBhNDVkZWQgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gQEAgLTI3
Nyw2ICsyNzcsNyBAQCBjb25maWcgQVJDSF9SVjY0SQo+ICAgICAgICAgc2VsZWN0IEhBVkVfRFlO
QU1JQ19GVFJBQ0UgaWYgIVhJUF9LRVJORUwgJiYgTU1VICYmICQoY2Mtb3B0aW9uLC1mcGF0Y2hh
YmxlLWZ1bmN0aW9uLWVudHJ5PTgpCj4gICAgICAgICBzZWxlY3QgSEFWRV9EWU5BTUlDX0ZUUkFD
RV9XSVRIX1JFR1MgaWYgSEFWRV9EWU5BTUlDX0ZUUkFDRQo+ICAgICAgICAgc2VsZWN0IEhBVkVf
RlRSQUNFX01DT1VOVF9SRUNPUkQgaWYgIVhJUF9LRVJORUwKPiArICAgICAgIHNlbGVjdCBGVFJB
Q0VfTUNPVU5UX1VTRV9QQVRDSEFCTEVfRlVOQ1RJT05fRU5UUlkgaWYgRFlOQU1JQ19GVFJBQ0UK
PiAgICAgICAgIHNlbGVjdCBIQVZFX0ZVTkNUSU9OX0dSQVBIX1RSQUNFUgo+ICAgICAgICAgc2Vs
ZWN0IEhBVkVfRlVOQ1RJT05fVFJBQ0VSIGlmICFYSVBfS0VSTkVMCj4gICAgICAgICBzZWxlY3Qg
U1dJT1RMQiBpZiBNTVUKPiAtLQo+IDIuMzQuMQo+CgoKLS0KVGhhbmtzLApTb25nCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
