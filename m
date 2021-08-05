Return-Path: <SRS0=4geo=M4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E61C4338F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 20:19:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9540E61004
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 20:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9540E61004
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bWeo6RIwyMxNM2XaQQZHp9xE6jxyLCBNTCfZeb2I+Do=; b=MCkscIkJ9sIC60
	6rG5ZMnb0BBa2d8TDv+NmBSvQp+F+PfofTFl1BkM0s7FRt8xfcGMASsqO/Bs7ETEIAqS0A6yIWrDr
	+3HxBurjNDmnb6xJ3h6Hfxl4ykeiOyZPla8zdy7INqY44tmw3X5e91ZE1NGKo9Rr9OZqcwQ+zUl0t
	t4t/Xonw3CIHAoPE+FobAWxRAKB8T1OMO60+XL/jiesW60BF0epIQtmdMx9it2Udw8cE8DiekxUbn
	gLKecSUOMUaCJ53qdHXozLH1tVcQDHLIVFMI277ijASqxqoxPnKbJONxjHUSbMG1i/Z2ArGuDU+TT
	2udC78Pxv2sEswZoRlYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBjpU-00Ai8P-36; Thu, 05 Aug 2021 20:19:00 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBjpR-00Ai7j-In
 for linux-riscv@lists.infradead.org; Thu, 05 Aug 2021 20:18:59 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id m193so11072375ybf.9
 for <linux-riscv@lists.infradead.org>; Thu, 05 Aug 2021 13:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fH0vxxQHAvzuSfmPIutM3W177fww1jHGdQnX9bRhvaI=;
 b=fTzB+Gj2B051f1oq0FZ9M3kbgo/4Yi3j7cm8GYzWQOerRaMF8Nn0rz3UwKZBWvbdVC
 pgAWnGbg4k8udeakp9C7PXjgZ/Frz0q5WkP5cFIo343ieS5ER6r1tzorZpILgAAmAIZt
 hwL3Iq6BHJoX3J737VGCdoiNKq18aDowzsl+lXiQPEY3IDcCJw0bE3EwlJTMDQKwXf4m
 BM3mNOjY4CmprfKC5/HmCUSrA0ZiTfnZ4yiBsD2tB2Aco87qNj+rtW+dKh3Ert5BJjeP
 nulHdbnoqyx0pYK1v7vY3fSQd2iMhGO1zE4WJI1CZ2zQXrr/L7zPeeOEpYst4jJSirHf
 gkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fH0vxxQHAvzuSfmPIutM3W177fww1jHGdQnX9bRhvaI=;
 b=de9t2kR1F9JdCc4fwx/541p1HJ35/vT+Qm70JZq6oIH/2/DtqFs8Hkn0l8ed7gKfta
 WNabuFG3Lqs8Mc47FG/NB7OrIqi8A44x1HQ1rkfrreGGam+o1k8LO5W/DqYBGH5Hdcpt
 dSqbJgHfLtMDgsXK1x7ITpmmkMLNi1noUuhwWV+qbghWPHooVAzpAL9xaWe3t1edMQtk
 HEKK/rBiD1dXYH1i8qMsREQxcGTg6lNByMMvO8an/3sfsuVGwruUPOgfn+V3LogBXd6E
 JFbA9OH1E7qPCCuzsJeW54u2go7bpBrlwQ/kooK4vV5Fmyd9zY3RQ140OjlU6dSMzVTv
 XRfw==
X-Gm-Message-State: AOAM5311lxZ/7VHgWlisqdA7BAt9Rphorejh5z5k6ExkqehZQORenoav
 2Y2rKK5YKILe9Te43Aqj1w0UGiALZiBJxQpOmNCLIQ==
X-Google-Smtp-Source: ABdhPJyxwKY89+v5i6qCL5OSQb2QZAeV9ZQGAra6Xdvy7OnutdjH3Otp/YCfh/M1SocSGPunDFs9Z+UKMAwcWMfiZ40=
X-Received: by 2002:a25:c9c6:: with SMTP id z189mr8306492ybf.322.1628194727948; 
 Thu, 05 Aug 2021 13:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-4af8be52-7620-478b-bf69-73306a2ffc3b@palmerdabbelt-glaptop>
 <a6615b69-d99f-220b-d980-1f5f40ee2999@gmail.com>
In-Reply-To: <a6615b69-d99f-220b-d980-1f5f40ee2999@gmail.com>
From: =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date: Thu, 5 Aug 2021 13:18:36 -0700
Message-ID: <CAFP8O3JKw5CHiYwM3Pqj5w3vnib0UW2PEs8HRBORci9dSAXwwg@mail.gmail.com>
Subject: Re: [PATCH 1/3] RISC-V: build: Pass `-mattr` to `lld`
To: twd2 <twd2.me@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com, 
 masahiroy@kernel.org, keescook@chromium.org, 
 Nick Desaulniers <ndesaulniers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_131857_689070_AB8FB727 
X-CRM114-Status: GOOD (  22.86  )
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

T24gVGh1LCBBdWcgNSwgMjAyMSBhdCAxOjEyIFBNIHR3ZDIgPHR3ZDIubWVAZ21haWwuY29tPiB3
cm90ZToKPgo+IFN1cmUuIEknbGwgc2VuZCBhIHYyIGFmdGVyIHRoZSBMTFZNIGlzc3VlIGlzIHJl
c29sdmVkLgo+Cj4gVGhhbmtzIQo+IFdlbmRlCj4KPgo+IE9uIDIwMjEvOC81IDQ6NTksIFBhbG1l
ciBEYWJiZWx0IHdyb3RlOgo+ID4gT24gTW9uLCAxOSBKdWwgMjAyMSAxNDoxNDo1OSBQRFQgKC0w
NzAwKSwgbmRlc2F1bG5pZXJzQGdvb2dsZS5jb20gd3JvdGU6Cj4gPj4gT24gTW9uLCBKdWwgMTks
IDIwMjEgYXQgMTo1MyBQTSBXZW5kZSBUYW4gPHR3ZDIubWVAZ21haWwuY29tPiB3cm90ZToKPiA+
Pj4KPiA+Pj4gUGFzcyBgLW1hdHRyYCB0byBgbGxkYCBzbyB0aGF0IGl0IGNhbiBnZW5lcmF0ZSBw
cm9wZXIgbWFjaGluZSBjb2RlLgo+ID4+PiBCeSB0aGUgd2F5LCBpdCBzZWVtcyB0aGF0IGAtbWFy
Y2hgIGRvZXMgbm90IHdvcmsgd2VsbCBub3cuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IFdl
bmRlIFRhbiA8dHdkMi5tZUBnbWFpbC5jb20+Cj4gPj4+IC0tLQo+ID4+PiAgYXJjaC9yaXNjdi9N
YWtlZmlsZSB8IDcgKysrKysrKwo+ID4+PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9NYWtlZmlsZSBiL2FyY2gvcmlz
Y3YvTWFrZWZpbGUKPiA+Pj4gaW5kZXggYmM3NGFmZGJmMzFlLi5iYmMxODZhM2FiNDUgMTAwNjQ0
Cj4gPj4+IC0tLSBhL2FyY2gvcmlzY3YvTWFrZWZpbGUKPiA+Pj4gKysrIGIvYXJjaC9yaXNjdi9N
YWtlZmlsZQo+ID4+PiBAQCAtNTIsOSArNTIsMTYgQEAgcmlzY3YtbWFyY2gtJChDT05GSUdfQVJD
SF9SVjMySSkgICAgIDo9IHJ2MzJpbWEKPiA+Pj4gIHJpc2N2LW1hcmNoLSQoQ09ORklHX0FSQ0hf
UlY2NEkpICAgICAgIDo9IHJ2NjRpbWEKPiA+Pj4gIHJpc2N2LW1hcmNoLSQoQ09ORklHX0ZQVSkg
ICAgICAgICAgICAgIDo9ICQocmlzY3YtbWFyY2gteSlmZAo+ID4+PiAgcmlzY3YtbWFyY2gtJChD
T05GSUdfUklTQ1ZfSVNBX0MpICAgICAgOj0gJChyaXNjdi1tYXJjaC15KWMKPiA+Pj4gK3Jpc2N2
LW1hdHRyLXkgICAgICAgICAgICAgICAgICAgICAgICAgIDo9ICttLCthCj4gPj4+ICtyaXNjdi1t
YXR0ci0kKENPTkZJR19GUFUpICAgICAgICAgICAgICA6PSAkKHJpc2N2LW1hdHRyLXkpLCtmLCtk
Cj4gPj4+ICtyaXNjdi1tYXR0ci0kKENPTkZJR19SSVNDVl9JU0FfQykgICAgICA6PSAkKHJpc2N2
LW1hdHRyLXkpLCtjCj4gPj4+ICBLQlVJTERfQ0ZMQUdTICs9IC1tYXJjaD0kKHN1YnN0IGZkLCwk
KHJpc2N2LW1hcmNoLXkpKQo+ID4+PiAgS0JVSUxEX0FGTEFHUyArPSAtbWFyY2g9JChyaXNjdi1t
YXJjaC15KQo+ID4+Pgo+ID4+PiAraWZlcSAoJChDT05GSUdfTERfSVNfTExEKSx5KQo+ID4+PiAr
ICAgICAgIEtCVUlMRF9MREZMQUdTICs9IC1tbGx2bSAtbWF0dHI9JChyaXNjdi1tYXR0ci15KQo+
ID4+Cj4gPj4gV2Ugc2hvdWxkIHByZXZlbnQgdGhlIHByb2xpZmVyYXRpb24gb2YgdGhlIGNvbXBp
bGVyIGludGVybmFsIGAtbWxsdm1gCj4gPj4gZmxhZ3MgZnJvbSBLYnVpbGQgTWFrZWZpbGVzOyB0
aGVzZSBhcmUgaW5kaWNhdGl2ZSBvZiBMTFZNIElSIHNwZWNpZmljCj4gPj4gaXNzdWVzIHdpdGgg
cmVnYXJkcyB0byBMVE8uICBDYW4geW91IHBsZWFzZSBmaWxlIGEgYnVnIGFnYWluc3QgTExWTQo+
ID4+IHRoYXQgYC1tYXR0cmAgc2hvdWxkIGJlIGVuY29kZWQgaW4gdGhlIElSIGZvciBMVE8ncyBz
YWtlPwo+ID4KPiA+IFdvcmtzIGZvciBtZS4gIEknbGwgaG9sZCBvZmYgb24gdGFraW5nIHRoaXMg
dW50aWwgdGhlIExMVk0gYnVnIGdldHMgc29ydGVkIG91dCBhbmQgZXhwZWN0IGEgdjIgKGlkZWFs
bHkgd2l0aCB0aGUgb3RoZXIgdGV4dHVhbCBjaGFuZ2VzIE5pY2sgc3VnZ2VzdGVkKS4KPiA+Cj4g
PiBUaGFua3MhCgpGb3IgR05VIGxkIGNvbXBhdGliaWxpdHk6IC1tbGx2bSAtbWF0dHI9eHh4ID0+
IC1wbHVnaW4tb3B0PS1tYXR0cj14eHgKCldoaWNoIGNhbiBhbGxvdyB1cyB0byBkcm9wIHRoZSBD
T05GSUdfTERfSVNfTExEIGNvbmRpdGlvbi4KKGdvbGQgZG9lc24ndCBzdXBwb3J0IFJJU0MtViB5
ZXQuKQoKTm90ZTogTExWTSBMVE8gKyBHTlUgbGQgc3VwcG9ydCBpcyBleHBlcmltZW50YWwgYW5k
IGhhcyB2ZXJ5IGxpdHRsZSB0ZXN0aW5nLgpUbyBhY3R1YWxseSBtYWtlIEdOVSBsZCB3b3JrLCB3
ZSBwcm9iYWJseSBhbHNvIG5lZWQgdG8gdGVhY2ggR05VIG5tCmFuZCBhciB0byBzcGVjaWZ5IC0t
cGx1Z2luIExMVk1nb2xkLnNvCmh0dHBzOi8vbGx2bS5vcmcvZG9jcy9Hb2xkUGx1Z2luLmh0bWwK
Cgo+ID4+Cj4gPj4gU2VlIGFsc286Cj4gPj4gY29tbWl0IDAyMzY1MjZkNzZiOCAoIk1ha2VmaWxl
OiBsdG86IFBhc3MgLXdhcm4tc3RhY2stc2l6ZSBvbmx5IG9uIExMRAo+ID4+IDwgMTMuMC4wIikK
PiA+PiBjb21taXQgMjM5OGNlODAxNTJhICgieDg2LCBsdG86IFBhc3MgLXN0YWNrLWFsaWdubWVu
dCBvbmx5IG9uIExMRCA8IDEzLjAuMCIpCj4gPj4KPiA+Pj4gK2VuZGlmCj4gPj4+ICsKPiA+Pj4g
IEtCVUlMRF9DRkxBR1MgKz0gLW1uby1zYXZlLXJlc3RvcmUKPiA+Pj4gIEtCVUlMRF9DRkxBR1Mg
Kz0gLURDT05GSUdfUEFHRV9PRkZTRVQ9JChDT05GSUdfUEFHRV9PRkZTRVQpCj4gPj4+Cj4gPj4+
IC0tCj4KPiAtLQo+IFlvdSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1
YnNjcmliZWQgdG8gdGhlIEdvb2dsZSBHcm91cHMgIkNsYW5nIEJ1aWx0IExpbnV4IiBncm91cC4K
PiBUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgZ3JvdXAgYW5kIHN0b3AgcmVjZWl2aW5nIGVtYWls
cyBmcm9tIGl0LCBzZW5kIGFuIGVtYWlsIHRvIGNsYW5nLWJ1aWx0LWxpbnV4K3Vuc3Vic2NyaWJl
QGdvb2dsZWdyb3Vwcy5jb20uCj4gVG8gdmlldyB0aGlzIGRpc2N1c3Npb24gb24gdGhlIHdlYiB2
aXNpdCBodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvY2xhbmctYnVpbHQtbGludXgv
YTY2MTViNjktZDk5Zi0yMjBiLWQ5ODAtMWY1ZjQwZWUyOTk5JTQwZ21haWwuY29tLgoKCgotLSAK
5a6L5pa5552/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
