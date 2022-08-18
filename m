Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41533C00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 21:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=/bo9G3R18EEtwePDbC7+WnoCd6Pq3GvHXUW0tvngem8=; b=FUZn4IAYyVqKJeH627CPRI22Xs
	wMnDG5c0XR9H/zHz8qFVLNVjzm5BWjQIu7Ew7SGDjGnMxQA72a55kPjpowPwMPNFtDWCJ697Zx+k4
	6uHFawNyt+Z/aTGwar5G/G+l9YnvWkmSIoYEn5xlWUU9luliO6sRcDvxbZFjNhT2kr0581Q57+H3C
	6npP0cdoNHTWJ74t9ZbFwVSuo3mUE7VUFbL61qDmQ2vZPpPSvaKYWpkW8BogCayZ3hJi/TNe2HE4Q
	82pmilp5XcgPvOIfcKUfeeVlf0eRct1gxXSFvzFVNLDoM4T2Fbtzs38Ov8GaRhXQ64gNmllUVBNXI
	c5Q76BkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOms6-009ivO-6n; Thu, 18 Aug 2022 21:16:10 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOmru-009ioM-3f
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 21:15:59 +0000
Received: by mail-pj1-x1034.google.com with SMTP id t11-20020a17090a510b00b001fac77e9d1fso3145189pjh.5
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 14:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=7oIe7UPglhSMlfQFr1TuN0Ln/s1ah6Fw09rZLyKnfrQ=;
        b=ungHvqmzyqGDAu/fP+qJLsFe+D3rJ3m/3zy0Rh3o0MRNuWupqyMOrkA+PYarA052+7
         7dTwrvjrvy6RHLuRqB7SbLWRgUUlkcxvev7/eRPXFIt+CwvkRpvyL3AawVEk4XKrtbKW
         gRzM8f0ELaJzv+pMnSUoK32ypwoveWAoYb2kMOm9rNiNHJdjTvxdDdvTUvhqPfLGFo5O
         DqRDgAQXLAOylGrPo4kyVRFwbILOcx32ECSyH5M9f1WTbJvk4gjJaTpJKgcuveMzj+vK
         o1aoyEnuA9EHaJWfG7gEKvUKXKId1G9CvDW7hIfs2t0sBmas/RRu0C/IR7cip2KSX+t1
         lmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=7oIe7UPglhSMlfQFr1TuN0Ln/s1ah6Fw09rZLyKnfrQ=;
        b=1+XxSE8hvGfXp2Y4RLyWtNK5S1BJpELvo+qUgEr9lPV0BoWFY8WtWzcpsPbTL22sIQ
         fsYgZ6l7W3TQ5RPfK+L1dE22qirY8Y8W2/5xfvrWrWhmbwTuUxQGpnn+fdCfCHaLbFOH
         d0BPguDY1aBYh6NxNTIgEukxJT20jIt9uB/CILkUH//95FW3XuKdiK2PPXvw3nR8MknH
         BgJbyMysI1KJbzgGOU4fVQG+7w2jldSfRhZ5S3b8w5oZoqSfzGVG7RfCTLd2AitNzloR
         OWrjMxj+bjS2+tCqytfItp/fQqYfkls42lbWEEe00jy9/HqanQW+nkalXKiXpV/o9JmL
         +mtA==
X-Gm-Message-State: ACgBeo1HU3HIh4tgIjt9Z5jB3uHeu43QL3Zja+anscgNHCjAX75Ih7wk
	d0ho/hn1oazaGdHc9M8izUzcUcnneej0Sw==
X-Google-Smtp-Source: AA6agR439SG/RMOn6SpIyP/60Ikavt0l/7rw5mA3CHrjuHRMKlMRmkLZqHOLnA02psRCFa+63TC2MA==
X-Received: by 2002:a17:902:cf43:b0:172:86f3:586a with SMTP id e3-20020a170902cf4300b0017286f3586amr4453826plg.71.1660857355746;
        Thu, 18 Aug 2022 14:15:55 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id z17-20020aa79591000000b0052aaff953aesm2113454pfj.115.2022.08.18.14.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 14:15:55 -0700 (PDT)
Date: Thu, 18 Aug 2022 14:15:55 -0700 (PDT)
X-Google-Original-Date: Thu, 18 Aug 2022 14:15:53 PDT (-0700)
Subject: Re: [GIT PULL] Fix RISC-V's arch-topology reporting
In-Reply-To: <994ad6ea-5d3f-b3d1-e0e5-883530ebaf2a@microchip.com>
CC: sudeep.holla@arm.com, catalin.marinas@arm.com, Will Deacon <will@kernel.org>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Conor.Dooley@microchip.com,
  linux-arm-kernel@lists.infradead.org, atishp@atishpatra.org, Brice.Goglin@inria.fr,
  Greg KH <gregkh@linuxfoundation.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor.Dooley@microchip.com
Message-ID: <mhng-a7823b28-ca11-43bc-9564-2eb7d607d288@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_141558_178770_A1A0C483 
X-CRM114-Status: GOOD (  29.45  )
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

T24gVGh1LCAxOCBBdWcgMjAyMiAxNDoxMDo1NCBQRFQgKC0wNzAwKSwgQ29ub3IuRG9vbGV5QG1p
Y3JvY2hpcC5jb20gd3JvdGU6Cj4gCj4gCj4gT24gMTgvMDgvMjAyMiAyMjowMywgUGFsbWVyIERh
YmJlbHQgd3JvdGU6Cj4+IE9uIE1vbiwgMTUgQXVnIDIwMjIgMTU6MTQ6NTUgUERUICgtMDcwMCks
IENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tIHdyb3RlOgo+Pj4gSGV5IFdpbGwvUGFsbWVyL1N1
ZGVlcCwKPj4+Cj4+PiBDYXRhbGluIHN1Z2dlc3RlZCBbMF0gZHJvcHBpbmcgdGhlIENDOiBzdGFi
bGUgZm9yIHRoZSBhcm02NCBwYXRjaCBhbmQKPj4+IGluc3RlYWQgbWFraW5nIGl0IGEgc3BlY2lm
aWMgcHJlcmVxIG9mIHRoZSBSSVNDLVYgcGF0Y2ggJiBtYWtpbmcgYSBQUiwKPj4+IHNvIGhlcmUg
d2UgYXJlLi4gSSB3YXMgc3RpbGwgdXAgd2hlbiAtcmMxIGNhbWUgb3V0IHNvIHB1c2hlZCBpdCBs
YXN0Cj4+PiBuaWdodCB0byBnZXQgdGhlIHRlc3QgY292ZXJhZ2UsIGJ1dCBMS1Agc2VlbXMgdG8g
bm90IGhhdmUgcmVwb3J0ZWQgYQo+Pj4gYnVpbGQgc3VjY2VzcyBzaW5jZSBlYXJseSBvbiB0aGUg
MTN0aCBzbyBub3QgaG9sZGluZyBteSBob3JzZXMhIEkgYnVpbHQKPj4+IGl0IGFnYWluIGZvciBi
b3RoIEFSTXMgYW5kIFJJU0MtViBteXNlbGYuCj4+Pgo+Pj4gSSB0YWdnZWQgaXQgdG9uaWdodCwg
c28gaXQncyBvbiBjb25vci9saW51eC5naXQgYXMgcmlzY3YtdG9wby1vbi02LjAtcmMxCj4+PiB3
aXRoIHRoZSBwcmVyZXEgc3BlY2lmaWVkLgo+Pj4KPj4+IE5vdCBzdXJlIGlmIHlvdSB3YW50IHRv
IG1lcmdlIHRoaXMgdG9vIFN1ZGVlcCBvciBpZiB0aGF0J3MgdXAgdG8gR3JlZz8KPj4gCj4+IEl0
J3MgYSBsaXR0bGUgYml0IHZhZ3VlIHdoYXQgeW91J3JlIGFza2luZyBmb3IgaGVyZSwgc28gSSdt
IGp1c3QKPj4gZ29pbmcgdG8ga2luZCBvZiBndWVzc2luZyBoZXJlIGJ1dCB0aGlzIG9uIHJpc2N2
L2Zvci1uZXh0LiAgSSdtIG5vdAo+PiBzdXJlIGlmIHlvdSB3ZXJlIGxvb2tpbmcgZm9yIG1lIHRv
IGp1c3QgbWVyZ2UgdGhlIGFyY2gvcmlzY3YgYml0cyBvcgo+PiBpZiB0aGlzIHNob3VsZCBiZSBv
biBmaXhlcyAoanVzdCBsb29raW5nIGF0IHRoZSBwYXRjaCBtYWtlcyBpdCBsb29rCj4+IGxpa2Ug
aXQgc2hvdWxkIGJlKSwgYnV0IEkgZG9uJ3Qgd2FudCB0byBzZW5kIHVwIHNvbWUgYXJtNjQgY29k
ZSB0bwo+PiBmaXhlcyB3aXRob3V0IGl0IGJlaW5nIHByZXR0eSBleHBsaWNpdCB0aGF0IEkgc2hv
dWxkIGRvIHNvCj4gCj4gQWhoIHNvcnJ5LCBJIGNvbXBsZXRlbHkgZm9yZ290IHRvIG1lbnRpb24g
dGhhdCBXaWxsIHNhaWQgImZvciA1LjIxIiBpbgo+IGhpcyByZXNwb25zZSB0byBteSBvcmlnaW5h
bCBwYXRjaHNldC4gZm9yLW5leHQgc291bmRzIGZpbmUgdG8gbWUgLSBhbGwKPiBpbi10cmVlIGRl
dmljZXRyZWVzIGhhZCB0aGUgb3B0aW9uYWwgcHJvcGVydGllcyBhZGRlZCB0byB0aGVtIHRoYXQg
c29sdmUKPiB0aGUgaXNzdWUgLSBhbmQgdGhleSB3ZXJlIEFVVE9TRUwnZWQgdG9vIGZyb20gd2hh
dCBJIGNhbiBzZWUuCgpPSywgc291bmRzIGxpa2Ugd2UncmUgZ29vZCB0aGVuLgoKPiAKPiBUaGFu
a3MgJiBzb3JyeSEKPiBDb25vci4KPiAKPj4gCj4+IEFja2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8
cGFsbWVyQHJpdm9zaW5jLmNvbT4gIyBhcmNoL3Jpc2N2IGJpdHMsIGZvciA2LjAtcmMKPj4gCj4+
IGluIGNhc2Ugc29tZW9uZSBlbHNlIHdhbnRzIHRvIHNlbmQgaXQgdXAgYmVmb3JlIEkgZ2V0IGJh
Y2sgdG8gdGhpcywKPj4gSSdtIGZpbmUgZWl0aGVyIHdheS4KPj4gCj4+IFRoYW5rcyEKPj4gCj4+
Pgo+Pj4gVGhhbmtzLAo+Pj4gQ29ub3IuCj4+Pgo+Pj4gMCAtIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXJpc2N2L1l0YWM3RzF6bHE2V1c0anRAYXJtLmNvbS8KPj4+Cj4+PiBUaGUgZm9s
bG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDU2ODAzNWIwMWNmYjEwN2FmOGQyZTRiZDJmYjlh
ZWEyMmNmNWI4Njg6Cj4+Pgo+Pj4gwqAgTGludXggNi4wLXJjMSAoMjAyMi0wOC0xNCAxNTo1MDox
OCAtMDcwMCkKPj4+Cj4+PiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoK
Pj4+Cj4+PiDCoCBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9jb25vci9saW51eC5naXQvIHRhZ3MvcmlzY3YtdG9wby1vbi02LjAtcmMxCj4+Pgo+Pj4gZm9y
IHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGZiZDkyODA5OTk3YTM5MWYyODA3NWYxYzhiNWVl
MzE0YzIyNTU1N2M6Cj4+Pgo+Pj4gwqAgcmlzY3Y6IHRvcG9sb2d5OiBmaXggZGVmYXVsdCB0b3Bv
bG9neSByZXBvcnRpbmcgKDIwMjItMDgtMTUgMjI6MDc6MzQgKzAxMDApCj4+Pgo+Pj4gLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+Pj4gRml4IFJJU0MtVidzIHRvcG9sb2d5IHJlcG9ydGluZwo+Pj4KPj4+IFRoZSBnb2FsIGhl
cmUgaXMgdGhlIGZpeCB0aGUgaW5jb3JyZWN0bHkgcmVwb3J0ZWQgYXJjaCB0b3BvbG9neSBvbgo+
Pj4gUklTQy1WIHdoaWNoIHNlZW1zIHRvIGhhdmUgYmVlbiBicm9rZW4gc2luY2UgaXQgd2FzIGFk
ZGVkLgo+Pj4gY3B1LCBwYWNrYWdlIGFuZCB0aHJlYWQgSURzIGFyZSBhbGwgY3VycmVudGx5IHJl
cG9ydGVkIGFzIC0xLCBzbyB0b29scwo+Pj4gbGlrZSBsc3RvcG8gdGhpbmsgc3lzdGVtcyBoYXZl
IG11bHRpcGxlIHRocmVhZHMgb24gdGhlIHNhbWUgY29yZSB3aGVuCj4+PiB0aGlzIGlzIG5vdCB0
cnVlOgo+Pj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW4tbXBpL2h3bG9jL2lzc3Vlcy81MzYKPj4+
Cj4+PiBhcm02NCdzIHRvcG9sb2d5IGNvZGUgYmFzaWNhbGx5IGFwcGxpZXMgdG8gUklTQy1WIHRv
bywgc28gaXQgaGFzIGJlZW4KPj4+IG1hZGUgZ2VuZXJpYyBhbG9uZyB3aXRoIHRoZSByZW1vdmFs
IG9mIE1QSURSIHJlbGF0ZWQgY29kZSwgd2hpY2gKPj4+IGFwcGVhcnMgdG8gYmUgcmVkdWRhbnQg
Y29kZSBzaW5jZSAnMzEwMmJjMGU2YWM3ICgiYXJtNjQ6IHRvcG9sb2d5OiBTdG9wCj4+PiB1c2lu
ZyBNUElEUiBmb3IgdG9wb2xvZ3kgaW5mb3JtYXRpb24iKScgcmVwbGFjZWQgdGhlIGNvZGUgdGhh
dCBhY3R1YWxseQo+Pj4gaW50ZXJhY3RlZCB3aXRoIE1QSURSIHdpdGggZGVmYXVsdCB2YWx1ZXMu
Cj4+Pgo+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+Pj4gQ29ub3IgRG9vbGV5ICgyKToKPj4+IMKgwqDCoMKgwqAgYXJt
NjQ6IHRvcG9sb2d5OiBtb3ZlIHN0b3JlX2NwdV90b3BvbG9neSgpIHRvIHNoYXJlZCBjb2RlCj4+
PiDCoMKgwqDCoMKgIHJpc2N2OiB0b3BvbG9neTogZml4IGRlZmF1bHQgdG9wb2xvZ3kgcmVwb3J0
aW5nCj4+Pgo+Pj4gwqBhcmNoL2FybTY0L2tlcm5lbC90b3BvbG9neS5jIHwgNDAgLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4gwqBhcmNoL3Jpc2N2L0tjb25maWfC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+Pj4gwqBhcmNoL3Jpc2N2L2tlcm5lbC9zbXBi
b290LmPCoCB8wqAgMyArKy0KPj4+IMKgZHJpdmVycy9iYXNlL2FyY2hfdG9wb2xvZ3kuYyB8IDE5
ICsrKysrKysrKysrKysrKysrKysKPj4+IMKgNCBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25z
KCspLCA0MiBkZWxldGlvbnMoLSkKPj4gCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+PiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
