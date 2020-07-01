Return-Path: <SRS0=OTun=AM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A48AAC433DF
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 10:44:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CD2C20722
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 10:44:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LUwJbYEU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnGWDg4Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CD2C20722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Jtzp5He//VQZWId4Yr1D8XcCK1HPr4tsVpkBdUpx5vw=; b=LUwJbYEUJFVCFNFGi8ecsb2yQ
	4a0TKFjUldSxhoVbkOaEHRb2JYgqMBLNcP9JPyto1mRhyDTWiRHT4wtC6GmLqfeuLqh91Tw1pPEZl
	a6p4aL6s8AoALWUoMqxsLt3dMpiygOUEHXDndcr8R6ZH/L5Sc9j5OpbCARILRvlFA4rwf7GNI8mgz
	iMZuIWobWQvK/E2z3YcTs5PMonuza1f/83fom3nNjGbM4bUf9pk4KNg8V03B3Mzbxs4StyUkbAWQo
	xY95CoN2/N+BMFU05UkRnVmFMoJSw6gDFgi/ENphoUh+ixg0EclZ3xwawkFJ12TRMG/GweANpVS/T
	jWMBqiw5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqaDe-0007QN-0Y; Wed, 01 Jul 2020 10:43:58 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqaDb-0007Pu-R7
 for linux-riscv@lists.infradead.org; Wed, 01 Jul 2020 10:43:56 +0000
Received: by mail-wr1-x444.google.com with SMTP id s10so23237939wrw.12
 for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2020 03:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W1vtyiWORlewD9CNBxUjDAhkdyheO7W9s6WFqMz/Lig=;
 b=AnGWDg4Y4qgQ8sg+NKQlz8KwkXU+Akve59H7AdaWgFFP+W0fwdSReGVEl5kzbi+1iw
 tmjg+XBdd7ZQqaqk0tPtLNipTxZHwrnZFfm/5K7YXCgzcKnzYUA1OUrwe4DWEybyZkZH
 rfzM+MHzN5HdfJ/UHg4UiaD94hZSHEuk3VmYaPf8DVWcTp0SZ1tYcaNleX5OQZGRxLlP
 Nv1ruVNyUj95tefboKVUGvxVtgJistCSDmV/DDQfdAnIbE7GhO+h0HbT63z0UQfv6UYs
 AvUHvJ3VkETlAmXNjG3zLM8REaYI4747i3II4lMW0RV9AOw7Wy7xb7WPqFIwpZSmiGCE
 9Nww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W1vtyiWORlewD9CNBxUjDAhkdyheO7W9s6WFqMz/Lig=;
 b=a9H0tJxYI67dTTrGXTz4asiwQOZRt7oGvupDt3GV8TH/v7CESvAkO7/HF4m5BYgYNg
 G2immhg6ZagR9wQVDsZJ4kAIfDocj2B/62T8cwv7AnxOvHagdNuBzrVcfrNN4NIB/orN
 2N/BlloHtyuPqKxPcL5lxasbimnECqtsAFXvIv4+h5NWu/KfOZtoIBJl94aE1njpJ6Ew
 r2Tvb4B9fBmK+ucLlFnfVY0k7/zwvmP0KwoGJRTBkz4+qXJGxbSfberbrbNN1UtusVVw
 Jsnhor4/3//Hoa/BwL4C4M7ycYVC7Mns/Z2NTzg1g2jTvWsa/Qt7SbA0HukvYXQT9CUP
 r9rw==
X-Gm-Message-State: AOAM532wY3+kLMcjQD33YT0PfG3hGgLvZ1skY+sbpRt/klD/CEt+eqf1
 qWAqoxMnQ4BP24jPpTJFzZ7xcxIvgXarDjHjyGo=
X-Google-Smtp-Source: ABdhPJxlQYrI8dON+4aZf8MW9D9VwRKkgBcR8s2LWsBl3g09hcjYIFjSF9MestUBxNArpd74isgJyfD0Y8VVj100QZI=
X-Received: by 2002:adf:ec90:: with SMTP id z16mr26023792wrn.52.1593600234793; 
 Wed, 01 Jul 2020 03:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <CACT4Y+a3A6DEvUjCsk_jKz9nZ=5iAzXTyG4WDPkug6u7BVrceQ@mail.gmail.com>
 <mvmtuysn227.fsf@suse.de>
 <CACT4Y+Y8=0m+Xku_+kQYuiiABgFUDzHBEqUK_FNGs8=f9NGZng@mail.gmail.com>
 <CAJ+HfNgzyOfr7gXeg+weLf64HHOWmm2Wug5Oc1OrOJN9ZcR5bQ@mail.gmail.com>
In-Reply-To: <CAJ+HfNgzyOfr7gXeg+weLf64HHOWmm2Wug5Oc1OrOJN9ZcR5bQ@mail.gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Wed, 1 Jul 2020 12:43:43 +0200
Message-ID: <CAJ+HfNjOtCvNZpLGoRaxJn7nfx+hW=cwoyveiu-pwhTjp3-avg@mail.gmail.com>
Subject: Re: syzkaller on risc-v
To: Dmitry Vyukov <dvyukov@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_064355_959708_0F6915A2 
X-CRM114-Status: GOOD (  20.56  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>,
 Atish Patra <atish.patra@wdc.com>, syzkaller <syzkaller@googlegroups.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Tobias Klauser <tklauser@distanz.ch>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAxIEp1bCAyMDIwIGF0IDEyOjQyLCBCasO2cm4gVMO2cGVsIDxiam9ybi50b3BlbEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCAzMCBKdW4gMjAyMCBhdCAxNToyNywgRG1pdHJ5
IFZ5dWtvdiA8ZHZ5dWtvdkBnb29nbGUuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIEp1biAz
MCwgMjAyMCBhdCAzOjE0IFBNIEFuZHJlYXMgU2Nod2FiIDxzY2h3YWJAc3VzZS5kZT4gd3JvdGU6
Cj4gPiA+Cj4gPiA+IE9uIEp1biAzMCAyMDIwLCBEbWl0cnkgVnl1a292IHdyb3RlOgo+ID4gPgo+
ID4gPiA+IEtBU0FOIHdvdWxkIGJlIGEgcHJlcmVxdWlzaXRlIGZvciB0ZXN0aW5nIHJpc2MtdiBv
biBzeXpib3QuCj4gPiA+Cj4gPiA+IFlvdSBuZWVkIHRvIGltcGxlbWVudCB0aGUgR0NDIHN1cHBv
cnQgZmlyc3QuCj4gPgo+ID4gSW50ZXJlc3RpbmcuIEJqw7ZybiBjbGFpbWVkIEtBU0FOIHdvcmtz
IGFscmVhZHkuICBBbmQgdGhlcmUgaXM6Cj4gPgo+ID4gY29tbWl0IDhhZDhiNzI3MjFkMGYwN2Zh
MDJkYmU3MWY5MDE3NDNmOWM3MWM4ZTYKPiA+IEF1dGhvcjogTmljayBIdQo+ID4gRGF0ZTogICBN
b24gSmFuIDYgMTA6Mzg6MzIgMjAyMCAtMDgwMAo+ID4gICAgIHJpc2N2OiBBZGQgS0FTQU4gc3Vw
cG9ydAo+ID4KPiA+IElzIHRoZXJlIGFueSBrbm93biBpc3N1ZSB3aXRoIGdjYz8KPiA+IERpZCBh
bnlvbmUgdHJ5IGNsYW5nPyBBZGRyZXNzU2FuaXRpemVyIHBhc3MgaW4gY2xhbmcgaXMKPiA+IGFy
Y2gtaW5kZXBlbmRlbnQuIE5vdCBzdXJlIGFib3V0IGdjYy4uLiBpdCBsb29rZWQgbW9zdGx5Cj4g
PiBhcmNoLWluZGVwZW5kZW50Lgo+Cj4gV2VpcmQuIERpZCBhIHF1aWNrIGJpc2VjdCAoanVzdCAi
ZG9lcyBpdCBib290IHdpdGggS0FTQU4gb3Igbm90Igo+IHRlc3QpLCBhbmQgdGhpcyBmZWxsIG91
dDoKPgo+IC0tCj4gZWZjYTEzOTg5MjUwYzNlZGViYWY4ZmNhYThjYTdjOTY2NzM5YzY1YSBpcyB0
aGUgZmlyc3QgYmFkIGNvbW1pdAo+IGNvbW1pdCBlZmNhMTM5ODkyNTBjM2VkZWJhZjhmY2FhOGNh
N2M5NjY3MzljNjVhCj4gQXV0aG9yOiBBdGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAd2RjLmNvbT4K
PiBEYXRlOiAgIFR1ZSBNYXIgMTcgMTg6MTE6MzcgMjAyMCAtMDcwMAo+Cj4gICAgIFJJU0MtVjog
SW50cm9kdWNlIGEgbmV3IGNvbmZpZyBmb3IgU0JJIHYwLjEKPgo+ICAgICBXZSBub3cgaGF2ZSBT
QkkgdjAuMiB3aGljaCBpcyBtb3JlIHNjYWxhYmxlIGFuZCBleHRlbmRhYmxlIHRvIGhhbmRsZQo+
ICAgICBmdXR1cmUgbmVlZHMgZm9yIFJJU0MtViBzdXBlcnZpc29yIGludGVyZmFjZXMuCj4KPiAg
ICAgSW50cm9kdWNlIGEgbmV3IGNvbmZpZyBhbmQgbW92ZSBhbGwgU0JJIHYwLjEgY29kZSB1bmRl
ciB0aGF0IGNvbmZpZy4KPiAgICAgVGhpcyBhbGxvd3MgdG8gaW1wbGVtZW50IHRoZSBuZXcgcmVw
bGFjZW1lbnQgU0JJIGV4dGVuc2lvbnMgY2xlYW5seQo+ICAgICBhbmQgcmVtb3ZlIHYwLjEgZXh0
ZW5zaW9ucyBlYXNpbHkgaW4gZnV0dXJlLiBDdXJyZW50bHksIHRoZSBjb25maWcKPiAgICAgaXMg
ZW5hYmxlZCBieSBkZWZhdWx0LiBPbmNlIGFsbCBNLW1vZGUgc29mdHdhcmUsIHdpdGggdjAuMSwg
aXMgbm8KPiAgICAgbG9uZ2VyIGluIHVzZSwgdGhpcyBjb25maWcgb3B0aW9uIGFuZCBhbGwgcmVs
ZXZhbnQgY29kZSBjYW4gYmUgZWFzaWx5Cj4gICAgIHJlbW92ZWQuCj4KPiAgICAgU2lnbmVkLW9m
Zi1ieTogQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQHdkYy5jb20+Cj4gICAgIFJldmlld2VkLWJ5
OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgo+ICAgICBTaWduZWQtb2ZmLWJ5OiBQ
YWxtZXIgRGFiYmVsdCA8cGFsbWVyZGFiYmVsdEBnb29nbGUuY29tPgo+Cj4gIGFyY2gvcmlzY3Yv
S2NvbmZpZyAgICAgICAgICAgfCAgIDcgKysrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2Jp
LmggfCAgIDIgKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyAgICAgIHwgMTMyICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAx
MTggaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCj4gLS0KPgo+IEknbGwgZGlnIGEgYml0
IG1vcmUuCj4KCk9oLCBmb3Jnb3Qgb25lIHRoaW5nOyBJJ20gYm9vdGluZyB0aGUga2VybmVsIHdp
dGggT3BlblNCSSAoT3BlblNCSQp2MC44LTMtZ2VjM2U1YjE0ZDUyYSkgYW5kIG5vdCB0aGUgQmVy
a2xleSBsb2FkZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
