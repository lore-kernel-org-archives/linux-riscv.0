Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E4FC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 03:52:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D0F9603E5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 03:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D0F9603E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8/0t9Zb6GkWP+6PzwAFrptYOTnqRBu6YprAYRrEVbBo=; b=3weS2eMdEHW/QK6LNIWcaSPaGB
	Y9ZeR7a9glw5sxE1gwuECmMidbKSlvmFhMHikNXQbCLRgKgulwFbSVey0ux/XQYUIXBrcYNzObYey
	guAq/qg8odYkhwIbfj8yY2oaOjASYSOd1OhPZe5p3YO1I6z455OYucZJtWGkO67Rxv4/Vr6pGzGPa
	tsBFxrKaRUdHi51KYlMWBXWfsOUyM5Nx/rEPu97uRmLSHwjJFCikp0L4/rdmJgS7FjCWeCFBaaRvP
	Gpf48jdjP+13O5UnNLyG9bdSgHOVXQN/oMQn1uANNU5hsUPLQjzpuVhOfPo9Zziu/92KJ9Fc2nUzD
	5eqS6Slw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdlbP-009gaH-L5; Fri, 22 Oct 2021 03:52:19 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdlbM-009gZy-Be
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 03:52:17 +0000
Received: by mail-pf1-x429.google.com with SMTP id c29so2490335pfp.2
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 20:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=jB4c/2WPucaW8Lf8osk4eSvo0aNrofmjsRvTABiqQPo=;
 b=LtIJY0mVcktq/K8n8jD1hAyDbe+vE/PqmplXMmbX5IOb0lmI6GVfRL4yU2DfDWnoMj
 DknuJ9nOcFnNCdEsQ8v+AI/ADQOxdi2quUws/lG3QRS46kEI59bjKCmokrqcmsAbpyB5
 7zPmjMqSxyOh8UyMK2DTyNGgM6SboQSVIrOj4mJYKZndfF9ADEx/dieuWh0wzSCEgL19
 lZ7KtYCH9Y4yF8DIRyUDiS1AClm9AsoSfwgnO4d3CZ8rTcjJ8LeqNpd0bphekAay8I/K
 6UodN69jKnHtQTtg7P3CV/RigKiXCwQsReuU3iDCVUMPd59kv/6pz8tEugj4HXMUI171
 CsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=jB4c/2WPucaW8Lf8osk4eSvo0aNrofmjsRvTABiqQPo=;
 b=zByPULCNo72oStXlObrG55XXAffG80sforP4Pyx65YkeZsbNL9/GrR2mA4rhS3fVqp
 7ruW+bhdT9hJBp3Lh27w9IUN/Mo33Z1xD5TGJSNqeuS/x9LLBCulWi5YWkG5dOuwmGxu
 UnIM07YFvIL/vO5cyZu11VFxsrQutDGwtsMj8MVuUSUfzbqeRRZiN+lsYb2ZCmf6L7W7
 wbOsodzPfJsXKDi91muq66n9APNfE9CG/0jy8iGnGq/bhkBss1CymbwicDsbDtsFi2q2
 af10PRYUCgRxMKk5/ujM5ZTpjZeau9HqhJpp91g7O6mh6coHBpvC6V/9y5428XcN42y+
 xEKw==
X-Gm-Message-State: AOAM532IXT+GJBp31Ad8nphtvyLqKFW/RYFxaE5+ChTIAnHYxeApFgjt
 GiKTbMJCl67St0KTmohUvSmHyM4c6gO+kd/Ajn3X/g==
X-Google-Smtp-Source: ABdhPJwl6IbsmHIfwLXxmFOrMkQLKXBEf1/u7iU5nh6SrMTTbOH8xvt1BQiKP2uLra10uOfIUJen5EGSa9UWcYazEKk=
X-Received: by 2002:a05:6a00:14d4:b0:44c:cdfa:f8f1 with SMTP id
 w20-20020a056a0014d400b0044ccdfaf8f1mr9722632pfu.58.1634874732777; Thu, 21
 Oct 2021 20:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631121222.git.greentime.hu@sifive.com>
 <0e65c165e3d54a38cbba01603f325dca727274de.1631121222.git.greentime.hu@sifive.com>
 <c81267bc-4c91-3978-8c1f-78925c46c78b@bluespec.com>
 <CAHCEehJ1uuSFqFWreS1kh+fR5GFfnEycdLMe+4FHXpFsHrRUvA@mail.gmail.com>
 <YVRp5uWFGQrwBpgf@bruce.bluespec.com>
 <CAHCEeh+dA9243=PwNtYvyU1Myu_E8YO2g4UNACxRogQ=6UavLQ@mail.gmail.com>
 <YVxZspMO7rAvtMBS@bruce.bluespec.com>
 <3c9797f6-2fd3-5530-ba34-6e4c4deec984@sifive.com>
 <YXFGAqTzHMeQA+R+@bruce.bluespec.com>
In-Reply-To: <YXFGAqTzHMeQA+R+@bruce.bluespec.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Fri, 22 Oct 2021 11:52:01 +0800
Message-ID: <CABvJ_xjMyZ3HDLinMvY88HtKywb=cwhQNOOCZYTEeL407Gyz2A@mail.gmail.com>
Subject: Re: [RFC PATCH v8 09/21] riscv: Add task switch support for vector
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Vincent Chen <vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_205216_454373_15FB3ECD 
X-CRM114-Status: GOOD (  40.00  )
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

T24gVGh1LCBPY3QgMjEsIDIwMjEgYXQgNjo1MCBQTSBEYXJpdXMgUmFkIDxkYXJpdXNAYmx1ZXNw
ZWMuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDIwLCAyMDIxIGF0IDA2OjAxOjMxUE0gLTA3
MDAsIFBhdWwgV2FsbXNsZXkgd3JvdGU6Cj4gPiBIZWxsbyBEYXJpdXMsCj4gPgo+ID4gT24gVHVl
LCA1IE9jdCAyMDIxLCBEYXJpdXMgUmFkIHdyb3RlOgo+ID4KPiA+ID4gT24gTW9uLCBPY3QgMDQs
IDIwMjEgYXQgMDg6MzY6MzBQTSArMDgwMCwgR3JlZW50aW1lIEh1IHdyb3RlOgo+ID4gPiA+IERh
cml1cyBSYWQgPGRhcml1c0BibHVlc3BlYy5jb20+IOaWvCAyMDIx5bm0OeaciDI55pelIOmAseS4
iSDkuIvljYg5OjI45a+r6YGT77yaCj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gVHVlLCBTZXAgMjgs
IDIwMjEgYXQgMTA6NTY6NTJQTSArMDgwMCwgR3JlZW50aW1lIEh1IHdyb3RlOgo+ID4gPiA+ID4g
PiBEYXJpdXMgUmFkIDxkYXJpdXNAYmx1ZXNwZWMuY29tPiDmlrwgMjAyMeW5tDnmnIgxM+aXpSDp
gLHkuIAg5LiL5Y2IODoyMeWvq+mBk++8mgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gT24g
OS84LzIxIDE6NDUgUE0sIEdyZWVudGltZSBIdSB3cm90ZToKPiA+ID4gPiA+ID4gPiA+IFRoaXMg
cGF0Y2ggYWRkcyB0YXNrIHN3aXRjaCBzdXBwb3J0IGZvciB2ZWN0b3IuIEl0IHN1cHBvcnRzIHBh
cnRpYWwgbGF6eQo+ID4gPiA+ID4gPiA+ID4gc2F2ZSBhbmQgcmVzdG9yZSBtZWNoYW5pc20uIEl0
IGFsc28gc3VwcG9ydHMgYWxsIGxlbmd0aHMgb2Ygdmxlbi4KPiA+Cj4gPiBbIC4uLiBdCj4gPgo+
ID4gPiA+ID4gPiA+IFNvIHRoaXMgd2lsbCB1bmNvbmRpdGlvbmFsbHkgZW5hYmxlIHZlY3RvciBp
bnN0cnVjdGlvbnMsIGFuZCBhbGxvY2F0ZQo+ID4gPiA+ID4gPiA+IG1lbW9yeSBmb3IgdmVjdG9y
IHN0YXRlLCBmb3IgYWxsIHByb2Nlc3NlcywgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIHZlY3Rvcgo+
ID4gPiA+ID4gPiA+IGluc3RydWN0aW9ucyBhcmUgdXNlZD8KPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gWWVzLCBpdCB3aWxsIGVuYWJsZSB2ZWN0b3IgaWYgaGFzX3ZlY3RvcigpIGlzIHRydWUuIFRo
ZSByZWFzb24gdGhhdCB3ZQo+ID4gPiA+ID4gPiBjaG9vc2UgdG8gZW5hYmxlIGFuZCBhbGxvY2F0
ZSBtZW1vcnkgZm9yIHVzZXIgc3BhY2UgcHJvZ3JhbSBpcyBiZWNhdXNlCj4gPiA+ID4gPiA+IHdl
IGFsc28gaW1wbGVtZW50IHNvbWUgY29tbW9uIGZ1bmN0aW9ucyBpbiB0aGUgZ2xpYmMgc3VjaCBh
cyBtZW1jcHkKPiA+ID4gPiA+ID4gdmVjdG9yIHZlcnNpb24gYW5kIGl0IGlzIGNhbGxlZCB2ZXJ5
IG9mdGVuIGJ5IGV2ZXJ5IHByb2Nlc3MuIFNvIHRoYXQKPiA+ID4gPiA+ID4gd2UgYXNzdW1lIGlm
IHRoZSB1c2VyIHByb2dyYW0gaXMgcnVubmluZyBpbiBhIENQVSB3aXRoIHZlY3RvciBJU0EKPiA+
ID4gPiA+ID4gd291bGQgbGlrZSB0byB1c2UgdmVjdG9yIGJ5IGRlZmF1bHQuIElmIHdlIGRpc2Fi
bGUgaXQgYnkgZGVmYXVsdCBhbmQKPiA+ID4gPiA+ID4gbWFrZSBpdCB0cmlnZ2VyIHRoZSBpbGxl
Z2FsIGluc3RydWN0aW9uLCB0aGF0IG1pZ2h0IGJlIGEgYnVyZGVuIHNpbmNlCj4gPiA+ID4gPiA+
IGFsbW9zdCBldmVyeSBwcm9jZXNzIHdpbGwgdXNlIHZlY3RvciBnbGliYyBtZW1jcHkgb3Igc29t
ZXRoaW5nIGxpa2UKPiA+ID4gPiA+ID4gdGhhdC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBEbyB5b3Ug
aGF2ZSBhbnkgZXZpZGVuY2UgdG8gc3VwcG9ydCB0aGUgYXNzZXJ0aW9uIHRoYXQgYWxtb3N0IGV2
ZXJ5IHByb2Nlc3MKPiA+ID4gPiA+IHdvdWxkIHVzZSB2ZWN0b3Igb3BlcmF0aW9ucz8gIE9uZSBj
b3VsZCBlYXNpbHkgYXJndWUgdGhhdCB0aGUgY29udmVyc2UgaXMKPiA+ID4gPiA+IHRydWU6IG5v
IGV4aXN0aW5nIHNvZnR3YXJlIHVzZXMgdGhlIHZlY3RvciBleHRlbnNpb24gbm93LCBzbyBtb3N0
IGxpa2VseSBhCj4gPiA+ID4gPiBwcm9jZXNzIHdpbGwgbm90IGJlIHVzaW5nIGl0Lgo+ID4gPiA+
Cj4gPiA+ID4gR2xpYmMgdXN0cmVhbWluZyBpcyBqdXN0IHN0YXJ0aW5nIHNvIHlvdSBkaWRuJ3Qg
c2VlIHNvZnR3YXJlIHVzaW5nIHRoZQo+ID4gPiA+IHZlY3RvciBleHRlbnNpb24gbm93IGFuZCB0
aGlzIHBhdGNoc2V0IGlzIHRlc3RpbmcgYmFzZWQgb24gdGhvc2UKPiA+ID4gPiBvcHRpbWl6ZWQg
Z2xpYmMgdG9vLiBWaW5jZW50IENoZW4gaXMgd29ya2luZyBvbiB0aGUgZ2xpYmMgdmVjdG9yCj4g
PiA+ID4gc3VwcG9ydCB1cHN0cmVhbWluZyBhbmQgd2Ugd2lsbCBhbHNvIHVwc3RyZWFtIHRoZSB2
ZWN0b3IgdmVyc2lvbiBnbGliYwo+ID4gPiA+IG1lbWNweSwgbWVtY21wLCBtZW1jaHIsIG1lbW1v
dmUsIG1lbXNldCwgc3RyY21wLCBzdHJsZW4uIFRoZW4gd2Ugd2lsbAo+ID4gPiA+IHNlZSBwbGF0
Zm9ybSB3aXRoIHZlY3RvciBzdXBwb3J0IGNhbiB1c2UgdmVjdG9yIHZlcnNpb24gbWVtKiBhbmQg
c3RyKgo+ID4gPiA+IGZ1bmN0aW9ucyBhdXRvbWF0aWNhbGx5IGJhc2VkIG9uIGlmdW5jIGFuZCBw
bGF0Zm9ybSB3aXRob3V0IHZlY3Rvcgo+ID4gPiA+IHdpbGwgdXNlIHRoZSBvcmlnaW5hbCBvbmUg
YXV0b21hdGljYWxseS4gVGhlc2UgY291bGQgYmUgZG9uZSB0byBzZWxlY3QKPiA+ID4gPiB0aGUg
Y29ycmVjdCBvcHRpbWl6ZWQgZ2xpYmMgZnVuY3Rpb25zIGJ5IGlmdW5jIG1lY2hhbmlzbS4KPiA+
Cj4gPiBJbiB5b3VyIHJlcGx5LCBJIG5vdGljZWQgdGhhdCB5b3UgZGlkbid0IGFkZHJlc3MgR3Jl
ZW50aW1lJ3MgcmVzcG9uc2UKPiA+IGhlcmUuICBCdXQgdGhpcyBsb29rcyBsaWtlIHRoZSBrZXkg
aXNzdWUuICBJZiBjb21tb24gbGlicmFyeSBmdW5jdGlvbnMgYXJlCj4gPiB2ZWN0b3ItYWNjZWxl
cmF0ZWQsIHdvdWxkbid0IGl0IG1ha2Ugc2Vuc2UgdGhhdCBhbG1vc3QgZXZlcnkgcHJvY2VzcyB3
b3VsZAo+ID4gd2luZCB1cCB1c2luZyB2ZWN0b3IgaW5zdHJ1Y3Rpb25zPyAgQW5kIHRodXMgdGhl
cmUgd291bGRuJ3QgYmUgbXVjaCBwb2ludAo+ID4gdG8gc2tpcHBpbmcgdGhlIHZlY3RvciBjb250
ZXh0IG1lbW9yeSBhbGxvY2F0aW9uPwo+ID4KPgo+IFRoaXMgaXNzdWUgd2FzIGFkZHJlc3NlZCBp
biB0aGUgdGhyZWFkIHJlZ2FyZGluZyBJbnRlbCBBTVggSSBsaW5rZWQgdG8gaW4gYQo+IHByZXZp
b3VzIG1lc3NhZ2UuICBJIGRvbid0IGFncmVlIHRoYXQgdGhpcyBpcyB0aGUga2V5IGlzc3VlOyBp
dCBpcyBvbmUgb2YgYQo+IG51bWJlciBvZiBpc3N1ZXMuICBXaGF0IGlmIEkgZG9uJ3Qgd2FudCB0
byB0YWtlIHRoZSBwb3RlbnRpYWwKPiBwb3dlci9mcmVxdWVuY3kgaGl0IGZvciB0aGUgdmVjdG9y
IHVuaXQgZm9yIGEgd29ya2xvYWQgdGhhdCwgYXQgYmVzdCwgdXNlcwo+IGl0IGZvciB0aGUgb2Nj
YXNpb25hbCBtZW1jcHk/ICBXaGF0IGlmIHRoZSBhbGxvY2F0aW9uIGZhaWxzLCBob3cgd2lsbCB0
aGF0CgpIaSBEYXJpdXMsClRoZSBtZW1jcHkgZnVuY3Rpb24gc2VlbXMgbm90IHRvIGJlIG9jY2Fz
aW9uYWxseSB1c2VkIGluIHRoZSBwcm9ncmFtcwpiZWNhdXNlIG1hbnkgZnVuY3Rpb25zIGluIEds
aWJjIHVzZSBtZW1jcHkoKSB0byBjb21wbGV0ZSB0aGUgbWVtb3J5CmNvcHkuIEkgdXNlIHRoZSBm
b2xsb3dpbmcgc2ltcGxlIGNhc2UgYXMgYW4gZXhhbXBsZS4KdGVzdC5jCnZvaWQgbWFpbih2b2lk
KSB7CiAgICByZXR1cm47Cn0KVGhlbiwgd2UgY29tcGlsZSBpdCBieSAiZ2NjIHRlc3QuYyAtbyBh
Lm91dCIgYW5kIGV4ZWN1dGUgaXQuIEluIHRoZQpleGVjdXRpb24sIHRoZSBtZW1jcHkoKSBoYXMg
YmVlbiBjYWxsZWQgdW5leHBlY3RlZGx5LiBJdCBpcyBiZWNhdXNlCm1hbnkgbGliYyBpbml0aWFs
aXplZCBmdW5jdGlvbnMgd2lsbCBiZSBleGVjdXRlZCBiZWZvcmUgZW50ZXJpbmcgdGhlCnVzZXIt
ZGVmaW5lZCBtYWluIGZ1bmN0aW9uLiBPbmUgb2YgdGhlIGV4YW1wbGUgaXMgX19saWJjX3NldHVw
X3RscygpLAp3aGljaCBpcyBjYWxsZWQgYnkgX19saWJjX3N0YXJ0X21haW4oKS4gVGhlIF9fbGli
Y19zZXR1cF90bHMoKSB3aWxsCnVzZSBtZW1jcHkoKSBkdXJpbmcgdGhlIHByb2Nlc3Mgb2YgY3Jl
YXRpbmcgdGhlIER5bmFtaWMgVGhyZWFkIFZlY3RvcgooRFRWKS4KClRoZXJlZm9yZSwgSSB0aGlu
ayB0aGUgbWVtY3B5KCkgaXMgd2lkZWx5IHVzZWQgaW4gbW9zdCBwcm9ncmFtcy4KCj4gZ2V0IHJl
cG9ydGVkIHRvIHVzZXIgc3BhY2UgKGhpbnQ6IG5vdCB3ZWxsKT8gIEFjY29yZGluZyB0byBHcmVl
bnRpbWUsCj4gUklTQy1WIHZlY3RvciBpcyBzaW1pbGFyIHRvIEFSTSBTVkUsIHdoaWNoIGFsbG9j
YXRlcyBtZW1vcnkgZm9yIGNvbnRleHQKPiBzdGF0ZSBvbiBmaXJzdCB1c2UgYW5kIG5vdCB1bmNv
bmRpdGlvbmFsbHkgZm9yIGFsbCBwcm9jZXNzZXMuCj4KPiAvLyBkYXJpdXMKPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
