Return-Path: <SRS0=JiLF=R5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E06E3C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2019 01:59:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA82F204EC
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2019 01:59:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sQaQ47Us";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="F3kxiJAf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA82F204EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=6sZN4G3fwKWFBFGB8pkP3/GWaWX1OM/9pJNyIWL/5sI=; b=sQaQ47UscqxjiyepPxOKrgIUv
	HwGMxqKk8a/ppffNvmUQQ8nhcXQZ/nlbzS7at+z4vAN1GSjGzwfsoVHvOJxAn2N0g7k9qp2rPqEtY
	n/DugzXGYKju3mtSohaB8VRWShOzWWIbckMPc8kMJmJKf7jAnsiNOnuTzzHkrrkcU0yqFrT1i9ZQj
	RHuFn9zjQ1I82D9Q7LHFSIhoxr3oDp44/9k1GYPhSN76oifSwMsi9u2rtAAIhwp94WFNSI5jbjaBG
	XhyAiG/NIclTN1Y8baa7CGg9o6u1CdEm0gSD5FmjqQ26zPx+Q3iSBaxDsdZyIsFL0H1CwUCmgtOm8
	MT9avAW2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8bMf-0002Jw-Tc; Tue, 26 Mar 2019 01:58:57 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8bMc-0002JP-10
 for linux-riscv@lists.infradead.org; Tue, 26 Mar 2019 01:58:56 +0000
Received: by mail-pl1-x633.google.com with SMTP id q6so842041pll.4
 for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2019 18:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=5AxEZ6HMpju9A0Kfo5sF3nIEl+7TllgazrR5fFxC+cg=;
 b=F3kxiJAf3kKLLZzsB6hBaCMldmQIJYHxuSxKLBNuU2RCZu53eiG0Qtpl9orwmbq/sm
 WY+By11KfYlVnESpFYfK+n7tStJZUgs0QhWnACzknLP7eZgwcPkQ+R/+mj8NlSow/6nF
 jwEEfu8pMO4zqH7WDl7gq6eKb0DHgJjo3nz8/AHfjUaXYzuL8I8TdzyH+K9Zdulw5Cg+
 q4wBJJ3fgDHaVQrFkWMm/fnGKRIbDwkq+Z8OeD38l02baGQpJblf6aLzLfCt3gU1xb5n
 Wk2xLBMNyfkqTYSNDYtSAq/G+L9M0fkvz2k5mOlxCb7fggQJYSZVfdpYElieHdvoMd+q
 YTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=5AxEZ6HMpju9A0Kfo5sF3nIEl+7TllgazrR5fFxC+cg=;
 b=DWCv+Qp5vd2sMHEkVvh/bVrkdh+PJm8wDv2kLtV1gKzdi8jah1dtn0qEa7mwm8RcI5
 Q1XTmVmto2kbavX2QhzasalINsjRUePePiAXt2KTBlSyH68b8KQzUnokQ8WhDMnKr2s5
 dkFM059T0a53RaeRfOUlGFbTD2WeK7mCciLBev/vq81ZfDqeYAJy5n6ib4eQ68a2RAJC
 XmP6Toz4FpSMe1hY+0V2Ih/KBnEQj5esCl8STwMjFH2W4TCNCwARLpFP/AVi0uKXBmOu
 BkAOzwg+VP+vpWBkkR0LNfKoW69vKql6uGwgkCPJC5pSl2q4BbdiuyiBHpt3FIWyhWJA
 vVZg==
X-Gm-Message-State: APjAAAW+wVdUzbFz+vKGdochLU0/zCNTbfvvCnZNfPlXV7YEw1+Tua7u
 udpHsrllL4z2pGoIyO6G2O54EA==
X-Google-Smtp-Source: APXvYqyyBaP95HFHvSDNWx/FCe9uMANM69V/YbAqEpIVNBsSEwX1+ANnis3KQNLqlx3qnVxjWqtKZA==
X-Received: by 2002:a17:902:407:: with SMTP id 7mr28749296ple.62.1553565530785; 
 Mon, 25 Mar 2019 18:58:50 -0700 (PDT)
Received: from localhost
 (2001-b011-7001-1270-b809-36ef-31ed-7980.dynamic-ip6.hinet.net.
 [2001:b011:7001:1270:b809:36ef:31ed:7980])
 by smtp.gmail.com with ESMTPSA id 140sm22464065pfb.55.2019.03.25.18.58.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Mar 2019 18:58:49 -0700 (PDT)
Date: Mon, 25 Mar 2019 18:58:49 -0700 (PDT)
X-Google-Original-Date: Mon, 25 Mar 2019 18:47:12 PDT (-0700)
Subject: Re: Thoughts on kexec / SBI
In-Reply-To: <a6d39352e96bfc95574250a303e23809@mailhost.ics.forth.gr>
From: Palmer Dabbelt <palmer@sifive.com>
To: mick@ics.forth.gr
Message-ID: <mhng-ae8f91c3-e0a0-481b-8c51-a2dbf9630a36@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_185854_114525_CDB405D9 
X-CRM114-Status: GOOD (  26.25  )
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
Cc: mick@ics.forth.gr, Atish Patra <Atish.Patra@wdc.com>,
 linux-riscv@lists.infradead.org, Anup Patel <Anup.Patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAyNCBNYXIgMjAxOSAxNToxNzoxMCBQRFQgKC0wNzAwKSwgbWlja0BpY3MuZm9ydGgu
Z3Igd3JvdGU6Cj4gSGVsbG8gQXRpc2gsCj4KPiDOo8+EzrnPgiAyMDE5LTAzLTI0IDAwOjMxLCBB
dGlzaCBQYXRyYSDOrc6zz4HOsc+IzrU6Cj4+IEhpIE5pY2ssCj4+Cj4+IE9uIE1hciAyMywgMjAx
OSwgYXQgMTE6MDUgQU0sIE5pY2sgS29zc2lmaWRpcyA8bWlja0BpY3MuZm9ydGguZ3I+Cj4+IHdy
b3RlOgo+Pgo+Pj4gSGVsbG8gYWxsLAo+Pj4KPj4+IEknbSB3b3JraW5nIG9uIGltcGxlbWVudGlu
ZyBrZXhlYyBvbiBSSVNDLVYgKGp1c3Qga2V4ZWMgZm9yIG5vdywgbm90Cj4+PiBrZHVtcCB5ZXQp
IHNpbmNlIHdlIHdhbnQgdG8gYmUgYWJsZSB0byB0ZXN0IG5ldyBrZXJuZWwgaW1hZ2VzIGVhc2ls
eQo+Pj4gb24gb3VyIHRlc3RiZWRzLiBJdCdzIHBhcnQgb2YgYSBsYXJnZXIgcHJvamVjdCB3aGVy
ZSBJJ20gdHJ5aW5nIHRvCj4+PiBoYXZlIGEgdW5pZmllZCB3YXkgb2YgdGVzdGluZyB2YXJpb3Vz
IGxpbnV4LWNhcGFibGUgUklTQy1WIHRhcmdldHMKPj4+IChodHRwczovL2dpdGh1Yi5jb20vbWlj
a2ZsZW1tL3lhcnZ0IFsxXSkgdGhhdCB3ZSBoYXZlIG9uIHRoZSBsYWIuCj4+Cj4+IEdyZWF0LiBU
aGlzIHJlcG8gd2lsbCBiZSB2ZXJ5IGhlbHBmdWwgdG8gYmVnaW5uZXJzLiBJIGhhZCBhIHF1aWNr
IGxvb2sKPj4gYXQgdGhlIHNpZml2ZS1mdTU0MC9jb21tYW5kcy5zaC4KPj4gb2JqY29weSBzdGVw
IGlzIHJlZHVuZGFudCBmb3IgT3BlblNCSSBhcyBpdCBhbHJlYWR5IGdlbmVyYXRlcyB0aGUKPj4g
ZndfcGF5bG9hZC5iaW4gYXMgd2VsbC4KPj4KPgo+IEkgaG9wZSBzbywgdGhhbmtzIGZvciB0aGUg
dXBkYXRlLCBJIHByZWZlciBpdCB0aGlzIHdheSBzaW5jZSBpdCBzaG93cwo+IGhvdyB0aGUgLmJp
biBpcyBnZW5lcmF0ZWQuCj4KPj4+IFRoZSBpc3N1ZSBpcyB0aGF0IHdlIGRvbid0IGhhdmUgYSB3
YXkgb2Ygc3RvcHBpbmcgdGhlIHNlY29uZGFyeQo+Pj4gaGFydHMgaW4gYSByZWNvdmVyYWJsZSB3
YXksIHNvIGF0IHRoaXMgcG9pbnQgSSBoYXZlIHR3byBvcHRpb25zLAo+Pj4gZWl0aGVyIEknbSBn
b2luZyB0byBjYWxsIHNtcF9zZW5kX3N0b3AoKSBvbiBtYWNoaW5lX3NodXRkb3duKCkgYW5kCj4+
PiBjb21lIGJhY2sgZnJvbSBrZXhlYyB3aXRoIGEgc2luZ2xlIGhhcnQgcnVubmluZyAod2hpY2gg
c2hvdWxkIGJlCj4+PiBmaW5lIGZvciBrZHVtcCBidHcpLCBvciBJIG5lZWQgdG8gaGF2ZSBhIHJl
c2VydmVkIG1lbW9yeSBzcGFjZSB3aGVyZQo+Pj4gSSdsbCBoYXZlIHRvIGtlZXAgc29tZSBjb2Rl
IHRvIGJlIGV4ZWN1dGVkIGJ5IHRoZSBzZWNvbmRhcnkgaGFydHMsCj4+PiB0aGF0IHdpbGwgYmUg
cGF0Y2hlZCBieSB0aGUgYm9vdCBoYXJ0IG9uY2UgdGhlIG5ldyBrZXJuZWwgaXMgaW4KPj4+IHBs
YWNlLCB0byBsZXQgdGhlbSBleGVjdXRlIHRoZSBuZXcga2VybmVsLiBUaGUgc2Vjb25kIG9wdGlv
biBpcyB0b28KPj4+IGNvbXBsaWNhdGVkIGZvciBubyByZWFzb24gYW5kIGl0IGFsc28gcmVkdWNl
cyB0aGUgZmxleGliaWxpdHkgb2YgdGhlCj4+PiBwcm9jZXNzIHNpbmNlIHdlIGNhbid0IHVzZSB0
aGUgd2hvbGUgUkFNIGZvciB0aGUgbG9hZGVkIGtpbWFnZSwgcGx1cwo+Pj4gaXQgd2lsbCBiZSBv
YnNvbGV0ZSB3aGVuIHdlIGhhdmUgcHJvcGVyIGhhbmRsaW5nIG9mIENQVSBzdXNwZW5kIC8KPj4+
IHBlci1oYXJ0IHJlc2V0LCB0aHJvdWdoIFNCSS4gU28gSSdtIGdvaW5nIGZvciB0aGUgZmlyc3Qg
b3B0aW9uIHVudGlsCj4+PiB0aGVuLgo+Pj4KPj4+IEknZCBsaWtlIHRvIGp1bXAtc3RhcnQgdGhl
IGRpc2N1c3Npb24gb24gaG93IHdlIGNhbiBoYW5kbGUgdGhpbmdzCj4+PiB0aHJvdWdoIFNCSSwg
bXkgaW5pdGlhbCB0aHJvdWdoIHdhcyB0aGlzOgo+Pj4KPj4+IGEpIEhhdmUgYSBuZXcgSVBJIGNv
ZGUgSVBJX1NVU1BFTkQsIGhhbmRsZWQgYnkgdGhlIGZpcm13YXJlIChpdHMKPj4+IGNvZGUvZGF0
YSBpcyBwZXJzaXN0ZW50IGFjcm9zcyBrZXhlY3MpLCB0aGF0IHB1dHMgdGhlIGhhcnQgb24gYSB3
ZmkKPj4+IGxvb3AsIGNoZWNraW5nIGZvciBhIHZhcmlhYmxlIHRoYXQgY29udGFpbnMgdGhlIG5l
dyB2aXJ0dWFsIGFkZHJlc3MKPj4+IHRvIGp1bXAgdG8gKHdoZXJlIHRoZSBuZXcga2VybmVsIGlz
IGxvY2F0ZWQpIG9uIHRoaXMgaGFydCdzIHNjcmF0Y2gKPj4+IGJ1ZmZlci4gQWx0ZXJuYXRpdmVs
eSB0aGlzIGNhbGwgbWF5IGRvIHBvd2VyIG1hbmFnZW1lbnQgYW5kCj4+PiBjb21wbGV0ZWx5IHNo
dXQgZG93biB0aGUgQ1BVLCBpZiB0aGUgaGFyZHdhcmUgc3VwcG9ydHMgdGhpcy4KPj4+Cj4+PiBi
KSBIYXZlIGFub3RoZXIgSVBJIGNvZGUgSVBJX1JFU1VNRSwgdGhhdCB3YWtlcyB1cCB0aGUgaGFy
dHMgYnkKPj4+IHByb3ZpZGluZyB0aGVtIHdpdGggdGhlIHZpcnR1YWwgYWRkcmVzcyB0byBqdW1w
IHRvLiBUaGlzIGNhbiBiZSBhCj4+PiBzaW1wbGUgd3JpdGUgb2YgdGhlIG5ldyBhZGRyZXNzIG9u
IHRoZSByZW1vdGUgaGFydCdzIHNjcmF0Y2ggYnVmZmVyCj4+PiArIGludGVycnVwdCwgb3IgaXQg
Y2FuIHVzZSBwb3dlciBtYW5hZ2VtZW50IHRvIHBvd2VyIHVwIHRoZSBoYXJ0IGFuZAo+Pj4gZWl0
aGVyIHByb3ZpZGUgaXQgd2l0aCBhIG5ldyByZXNldCB2ZWN0b3IsIG9yIGRvIHNvbWUgaGFuZGxp
bmcgb24KPj4+IHRoZSBCb290Uk9NIGNvZGUgZm9yIHRoYXQgKHRoaXMgYnR3IGlzIGFsc28gYW4g
b3BlbiBkaXNjdXNzaW9uIG9uCj4+PiB0aGUgVEVFIGdyb3VwIHdoZXJlIHdlIGFyZSBkaXNjdXNz
aW5nIFNlY3VyZSBCb290KS4gQWxzbyBpbiBjYXNlIHRoZQo+Pj4gaGFydCBpcyBhbHJlYWR5IHJ1
bm5pbmcgKGFuIElQSV9TVVNQRU5EIGhhc24ndCBiZWVuIHNlbnQgb24gaXQKPj4+IGJlZm9yZSwg
ZS5nLiBkdXJpbmcgYm9vdCksIHRoZSBmaXJtd2FyZSB3aWxsIGlnbm9yZSB0aGUgZXZlbnQsCj4+
PiBhbHRlcm5hdGl2ZWx5IHdlIG1heSBjYWxsIElQSV9TVVNQRU5EIG9uIHRoZSBmaXJtd2FyZSBk
dXJpbmcgYm9vdCBzbwo+Pj4gdGhhdCB0aGUgYm9vdCBwcm9jZXNzIGhhcHBlbnMgd2l0aCBhIHNp
bmdsZSBoYXJ0IGFuZCBvdGhlciBoYXJ0cwo+Pj4gd2FpdCBmb3IgdGhlIE9TIHRvIHdha2UgdGhl
bSB1cC4KPj4KPj4gTG9va3MgZ29vZCB0byBtZS4gSSBoYWQgc2ltaWxhciBJUEkgYXBwcm9hY2go
SVBJIFdBS0VVUCkgZm9yIGNwdQo+PiBob3RwbHVnIGltcGxlbWVudGF0aW9uIGV4Y2VwdCB0aGUg
cmVzdW1lIGFkZHJlc3MgcmVxdWlyZW1lbnQuCj4+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE4
LzkvNi8yMTQgWzJdCj4+Cj4+IFRoZSBvbmx5IGlzc3VlIGlzIHRoYXQgd2l0aCBhbGwgdGhpcyBJ
UElzIHdpbGwgYmUgcmVkdW5kYW50IHdoZW4gaGFydAo+PiBwb3dlciBtYW5hZ2VtZW50IFNCSSBl
eHRlbnNpb24gKGEgbXVjaCBjbGVhbmVyIGludGVyZmFjZSkgd2lsbCBiZQo+PiBhdmFpbGFibGUu
IE15IGhvdHBsdWcgcGF0Y2ggaXMgb24gaG9sZCBiZWNhdXNlIG9mIHRoYXQgcmVhc29uIGFzIHdl
bGwuCj4+Cj4+Cj4+IFJlZ2FyZHMsCj4+IEF0aXNoCj4+Cj4KPiBNeSBwcm9wb3NhbCBpcyBhYm91
dCB0aGUgbmV3IFNCSSBBUEkvZXh0ZW5zaW9uLCBhcyBJIG1lbnRpb24gdGhlc2UgSVBJCj4gY2Fs
bHMgaSdtIHRhbGtpbmcgYWJvdXQgbmVlZCB0byBiZSBpbXBsZW1lbnRlZCBvbiB0aGUgZmlybXdh
cmUgc2lkZSwKPiB0aGV5IHdvbid0IGJlIGhhbmRsZWQgYnkgdGhlIE9TIGxpa2UgSVBJX1NPRlQu
IFNvIHNpbmNlIHlvdSBwcmVmZXIgdG8KPiBoYXZlIHNlcGFyYXRlIGNhbGxzIGZvciBlYWNoIG9m
IHRoZSBoYXJ0IHN0YXRlcyB0aGUgaWRlYSBpczoKPgo+IHNiaV9oYXJ0X3N1c3BlbmQoY3B1bWFz
aykgLT4gc2VuZCBhbiBJUElfU1VTUEVORCB0byBjcHVzIG9uIGNwdW1hc2sKPiBzYmlfaGFydF9y
ZXN1bWUoY3B1bWFzaykgLT4gc2VuZCBhbiBJUElfUkVTVU1FIHRvIGNwdXMgb24gY3B1bWFzawoK
VGhlIElQSSB0eXBlcyBhcmUgY3VycmVudGx5IG5vdCBleHBvc2VkIGJldHdlZW4gTGludXggYW5k
IHRoZSBmaXJtd2FyZSBhbmQgSSdkIApsaWtlIHRvIGtlZXAgaXQgdGhhdCB3YXkuICBMZXQncyBq
dXN0IHByb3RvdHlwZSB0aGUgZmlyc3QgdmVyc2lvbiBvZiB0aGUgaGFydCAKcG93ZXIgbWFuYWdl
bWVudCBleHRlbnNpb24gaW5zdGVhZC4gIEltcGxlbWVudGluZyB0aGVtIGluIHRoZSBmaXJtd2Fy
ZSB2aWEgSVBJcyAKaXMgdGhlIG9ubHkgdmFsaWQgbWVjaGFuaXNtIG9uIG91ciBleGlzdGluZyBp
bXBsZW1lbnRhdGlvbiwgYnV0IHRoZSBjb2RlcyBjYW4gCnN0YXkgd2l0aGluIHRoZSBmaXJtd2Fy
ZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
