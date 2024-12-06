Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB99E7716E
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Dec 2024 02:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oPJW55sn9JNphkzThLCTvgLyeExLY1TAxXtzBl3al+0=; b=w7GH3+zbTB7lsT
	G3DnzJ2A7sdXmXhtdu5CqpLN7mfbABcDuoX09etn7oKFRURb99gFam8ny/k2IO9+s0c+8tTTdkyJY
	uXX01NScRV1Kjwt7zFoTPNCNxcBgh7IMdaKlVh1QsIbp+PUQbDmZCD41Y3HpogMxHf/n45Etux5Le
	qC5qHxyhqupidDwM8I/ibfUwrqe9jEI9gx2Q5oM6t/q9Rbs7QyvEhNqbtF7FmMNAAzdpKcsOboaMV
	0PIh5QUl74pXXm60yTawKc5S/Y0Kr8VJqU/0uwtZKZPLdo0K4bP3JJW74oYvTi+nDYfQq1DdvWGt5
	PgYbuTPmWcW+pgnLEVKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJOHo-00000000Ll5-3q0y;
	Fri, 06 Dec 2024 02:41:44 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJOHl-00000000Lkf-2UhL
	for linux-riscv@lists.infradead.org;
	Fri, 06 Dec 2024 02:41:44 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-725ad59ad72so873242b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 18:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733452899; x=1734057699; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyI1vpJbF1lA2GSyRq3p1fE6a3Gj94zXoVwVDWf3HLY=;
        b=Fu8AaP0mU/RIaWB2jDpT8nF0ymZU15AhYF0NHlqFiAjfmpCfqOfzfnQacjHFDCxzcB
         v+PRfNwSrS9L+FP/ahrW1bg89Uy5LuQNHZegOTQnnw3Oms7CeB2MZ8pCtjnpUYEzScuI
         4k2rDiKOOGo4WuGbJiYy9kvN0KvsPorrkX6718TAboWDmmLkMxYcs248iMjNjblURcgo
         OD5Qj4I5/6F4CEECCBnkdYXYAMHcnvIqPMOSAlW54b+pGssshfULoqNedjt7bme8BC8X
         XCnIOZaPQ9uvSWzS75FVwRidMo3w5JhYMaadr0uGCTaWRZwM7C5zykKGsi0FE7EeCw+b
         NdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733452899; x=1734057699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyI1vpJbF1lA2GSyRq3p1fE6a3Gj94zXoVwVDWf3HLY=;
        b=wTuKjNiCMVZrGTw1sPEMjiwDfw/jPE9C+GoJJo0z5LaUOkiiI2iiKRCJ+WNSo4QMHd
         /Xgsfzj3lb9mEvU0FxR6FaJgHOzp+90GMLb9MX37OE/8Sf350TgOwZu6WVBVnqkKxgpb
         DAzLu2pQdIexszEUo1nIPhPwSJWCKR67SxcSlP7bNN6JH5+4I2asxJuKZS1JccqU77Mn
         yT5dsY7kO9oVZVRo9myp2ZMmf68xt0sTWCrskxHQoI3jTr0wmZIVn+j4UdkDdQix/+X/
         z9s7yus0uOSUxU8nnM6L5vEkY/S6ZCmWfqbWkPMI67N29LdkSovKV0FsRYNPryE0KnCH
         V2zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdxyo9uXLjSzbKgY70JM1goZDOg+cIgLMwTUVKav4pqKcJCJKNN1vI0saHlU1MTnLeQXRrjzvK7MvkMg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2Mi+fOqT6amZ0HTNlHyjarJYWgatmNqXzGroEEIeiZfNqLZbp
	ioib1YopPQu4/c1Rz53zRhvCJigrPoPhNttufXwthW6gNANojBQlYj4ViS7gE87mpgw2ggko8Iv
	+3iQQ4j5AztZpjR8rJfxGcCv+qOoY7a40sHGDuQ==
X-Gm-Gg: ASbGnctNkCAZB2BgPZiOb0pkI/6ov2BGH1mSgoJfHK+55AjoiJy1XF5ZwEyCZBmvXqx
	Y7ZLCxS3PQR6qbEhl6Z5jk2zZLoe/DSxUjWMzzbB7JTek2jNS
X-Google-Smtp-Source: AGHT+IEUYjjxoNVonXftGirFN2eYx0YoHUjkucusrRhp2lBZDnBg/ur7q7d/l8gQ0l23mUaXrY71JWBrqUptthTQgSA=
X-Received: by 2002:a17:90b:2ccd:b0:2ee:45fd:34ee with SMTP id
 98e67ed59e1d1-2ef6ab29c3emr2272187a91.37.1733452899670; Thu, 05 Dec 2024
 18:41:39 -0800 (PST)
MIME-Version: 1.0
References: <20241205103729.14798-1-luxu.kernel@bytedance.com> <F94D21C0-8189-404A-B796-BB3C6620AB89@nvidia.com>
In-Reply-To: <F94D21C0-8189-404A-B796-BB3C6620AB89@nvidia.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Fri, 6 Dec 2024 10:41:28 +0800
Message-ID: <CAPYmKFsODeUg69r+bjeH4tZuB4DyXNUjjduAPMbtAzVBhFgpEw@mail.gmail.com>
Subject: Re: [External] Re: [RFC PATCH v2 00/21] riscv: Introduce 64K base page
To: Zi Yan <ziy@nvidia.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	ardb@kernel.org, anup@brainfault.org, atishp@atishpatra.org, 
	xieyongji@bytedance.com, lihangjing@bytedance.com, 
	punit.agrawal@bytedance.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Linux MM <linux-mm@kvack.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_184142_002681_62BB42D1 
X-CRM114-Status: GOOD (  28.12  )
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

SGkgWmkgWWFuLAoKT24gRnJpLCBEZWMgNiwgMjAyNCBhdCAxMDowMOKAr0FNIFppIFlhbiA8eml5
QG52aWRpYS5jb20+IHdyb3RlOgo+Cj4gT24gNSBEZWMgMjAyNCwgYXQgNTozNywgWHUgTHUgd3Jv
dGU6Cj4KPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGF0dGVtcHRzIHRvIGJyZWFrIHRocm91Z2ggdGhl
IGxpbWl0YXRpb24gb2YgTU1VIGFuZAo+ID4gc3VwcG9ydHMgbGFyZ2VyIGJhc2UgcGFnZSBvbiBS
SVNDLVYsIHdoaWNoIG9ubHkgc3VwcG9ydHMgNEsgcGFnZSBzaXplCj4gPiBub3cuIFRoZSBrZXkg
aWRlYSBpcyB0byBhbHdheXMgbWFuYWdlIGFuZCBhbGxvY2F0ZSBtZW1vcnkgYXQgYQo+ID4gZ3Jh
bnVsYXJpdHkgb2YgNjRLIGFuZCB1c2UgU1ZOQVBPVCB0byBhY2NlbGVyYXRlIGFkZHJlc3MgdHJh
bnNsYXRpb24uCj4gPiBUaGlzIGlzIHRoZSBzZWNvbmQgdmVyc2lvbiBhbmQgdGhlIGRldGFpbGVk
IGludHJvZHVjdGlvbiBjYW4gYmUgZm91bmQKPiA+IGluIFsxXS4KPiA+Cj4gPiBDaGFuZ2VzIGZy
b20gdjE6Cj4gPiAtIFJlYmFzZSBvbiB2Ni4xMi4KPiA+Cj4gPiAtIEFkanVzdCB0aGUgcGFnZSB0
YWJsZSBlbnRyeSBzaGlmdCB0byByZWR1Y2UgcGFnZSB0YWJsZSBtZW1vcnkgdXNhZ2UuCj4gPiAg
ICAgRm9yIGV4YW1wbGUsIGluIFNWMzksIHRoZSB0cmFkaXRpb25hbCB2YSBiZWhhdmVzIGFzOgo+
ID4KPiA+ICAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gPiAgICAgfCBwZ2QgaW5kZXggfCBwbWQgaW5kZXggfCBwdGUgaW5kZXggfCBvZmZzZXQgfAo+
ID4gICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+
ICAgICB8IDM4ICAgICAzMCB8IDI5ICAgICAyMSB8IDIwICAgICAxMiB8IDExICAgMCB8Cj4gPiAg
ICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4KPiA+
ICAgICBXaGVuIHdlIGNob29zZSA2NEsgYXMgYmFzaWMgc29mdHdhcmUgcGFnZSwgdmEgbm93IGJl
aGF2ZXMgYXM6Cj4gPgo+ID4gICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPiA+ICAgICB8IHBnZCBpbmRleCB8IHBtZCBpbmRleCB8IHB0ZSBpbmRleCB8
IG9mZnNldCB8Cj4gPiAgICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ID4gICAgIHwgMzggICAgIDM0IHwgMzMgICAgIDI1IHwgMjQgICAgIDE2IHwgMTUg
ICAwIHwKPiA+ICAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gPgo+ID4gLSBGaXggc29tZSBidWdzIGluIHYxLgo+ID4KPiA+IFRoYW5rcyBpbiBhZHZh
bmNlIGZvciBjb21tZW50cy4KPiA+Cj4gPiBbMV0gaHR0cHM6Ly9sd24ubmV0L0FydGljbGVzLzk1
MjcyMi8KPgo+IFRoaXMgbG9va3MgdmVyeSBpbnRlcmVzdGluZy4gQ2FuIHlvdSBjYyBtZSBhbmQg
bGludXgtbW1Aa3ZhY2sub3JnCj4gaW4gdGhlIGZ1dHVyZT8gVGhhbmtzLgoKT2YgY291cnNlLiBI
b3BlIHRoaXMgcGF0Y2ggY2FuIGJlIG9mIGFueSBoZWxwLgoKPgo+IEhhdmUgeW91IHRob3VnaHQg
YWJvdXQgZG9pbmcgaXQgZm9yIEFSTTY0IDRLQiBhcyB3ZWxsPyBBUk02NOKAmXMgY29udGlnIFBU
RQo+IHNob3VsZCBoYXZlIHNpbWlsYXIgZWZmZWN0IG9mIFJJU0MtVuKAmXMgU1ZOQVBPVCwgcmln
aHQ/CgpJIGhhdmUgbm90IHRob3VnaHQgYWJvdXQgaXQgeWV0LiBBUk02NCBoYXMgbmF0aXZlIDY0
SyBNTVUuIFRoZSBrZXJuZWwKY2FuIGRpcmVjdGx5IGNvbmZpZ3VyZSB0aGUgcGFnZSBzaXplIGFz
IDY0SyBhbmQgTU1VIHdpbGwgZG8KdHJhbnNsYXRpb24gYXQgY29ycmVzcG9uZGluZyBncmFudWxh
cml0eS4gU28gSSBkb3VidCBpZiB0aGVyZSBpcyBhCm5lZWQgdG8gaW1wbGVtZW50IDY0SyBQYWdl
IFNpemUgYmFzZWQgb24gQ09OVCBQVEUuIElmIHlvdSB3YW50IHRvIHVzZQpDT05UIFBURSBmb3Ig
YWNjZWxlcmF0aW9uIGluc3RlYWQgb2YgNjRLIE1NVSwgbWF5YmUgeW91IGNhbiBoYXZlIGEgdHJ5
Cm9uIFRIUF9DT05UUFRFWzFdIHdoaWNoIGhhcyBiZWVuIG1lcmdlZH4KClsxXSBodHRwczovL2x3
bi5uZXQvQXJ0aWNsZXMvOTM1ODg3LwoKQmVzdCByZWdhcmRzLAoKWHUgTHUKCj4KPiA+Cj4gPiBY
dSBMdSAoMjEpOgo+ID4gICByaXNjdjogbW06IERpc3Rpbmd1aXNoIGhhcmR3YXJlIGJhc2UgcGFn
ZSBhbmQgc29mdHdhcmUgYmFzZSBwYWdlCj4gPiAgIHJpc2N2OiBtbTogQ29uZmlndXJlIHNhdHAg
d2l0aCBodyBwYWdlIHBmbgo+ID4gICByaXNjdjogbW06IFJlaW1wbGVtZW50IHBhZ2UgdGFibGUg
ZW50cnkgc3RydWN0dXJlcwo+ID4gICByaXNjdjogbW06IFJlaW1wbGVtZW50IHBhZ2UgdGFibGUg
ZW50cnkgY29uc3RydWN0b3IgZnVuY3Rpb24KPiA+ICAgcmlzY3Y6IG1tOiBSZWltcGxlbWVudCBj
b252ZXJzaW9uIGZ1bmN0aW9ucyBiZXR3ZWVuIHBhZ2UgdGFibGUgZW50cnkKPiA+ICAgcmlzY3Y6
IG1tOiBBdm9pZCBwdGUgY29uc3RydWN0b3IgZHVyaW5nIHB0ZSBjb252ZXJzaW9uCj4gPiAgIHJp
c2N2OiBtbTogUmVpbXBsZW1lbnQgcGFnZSB0YWJsZSBlbnRyeSBnZXQgZnVuY3Rpb24KPiA+ICAg
cmlzY3Y6IG1tOiBSZWltcGxlbWVudCBwYWdlIHRhYmxlIGVudHJ5IGF0b21pYyBnZXQgZnVuY3Rp
b24KPiA+ICAgcmlzY3Y6IG1tOiBSZXBsYWNlIFJFQURfT05DRSB3aXRoIGF0b21pYyBwdGUgZ2V0
IGZ1bmN0aW9uCj4gPiAgIHJpc2N2OiBtbTogUmVpbXBsZW1lbnQgUFRFIEEvRCBiaXQgY2hlY2sg
ZnVuY3Rpb24KPiA+ICAgcmlzY3Y6IG1tOiBSZWltcGxlbWVudCBta19odWdlX3B0ZSBmdW5jdGlv
bgo+ID4gICByaXNjdjogbW06IFJlaW1wbGVtZW50IHRsYiBmbHVzaCBmdW5jdGlvbgo+ID4gICBy
aXNjdjogbW06IEFkanVzdCBQR0RJUi9QNEQvUFVEL1BNRF9TSElGVAo+ID4gICByaXNjdjogbW06
IE9ubHkgYXBwbHkgc3ZuYXBvdCByZWdpb24gYmlnZ2VyIHRoYW4gc29mdHdhcmUgcGFnZQo+ID4g
ICByaXNjdjogbW06IEFkanVzdCBGSVhfQlRNQVBTX1NMT1RTIGZvciB2YXJpYWJsZSBQQUdFX1NJ
WkUKPiA+ICAgcmlzY3Y6IG1tOiBBZGp1c3QgRklYX0ZEVF9TSVpFIGZvciB2YXJpYWJsZSBQTURf
U0laRQo+ID4gICByaXNjdjogbW06IEFwcGx5IFN2bmFwb3QgZm9yIGJhc2UgcGFnZSBtYXBwaW5n
IGlmIHBvc3NpYmxlCj4gPiAgIHJpc2N2OiBLY29uZmlnOiBJbnRyb2R1Y2UgNjRLIHBhZ2Ugc2l6
ZQo+ID4gICByaXNjdjogS2NvbmZpZzogQWRqdXN0IG1tYXAgcm5kIGJpdHMgZm9yIDY0SyBQYWdl
Cj4gPiAgIHJpc2N2OiBtbTogQWRqdXN0IGFkZHJlc3Mgc3BhY2UgbGF5b3V0IGFuZCBpbml0IHBh
Z2UgdGFibGUgZm9yIDY0Swo+ID4gICAgIFBhZ2UKPiA+ICAgcmlzY3Y6IG1tOiBVcGRhdGUgRVhF
Q19QQUdFU0laRSBmb3IgNjRLIFBhZ2UKPiA+Cj4gPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAg
ICAgICAgICAgICAgICB8ICAzNCArLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZml4bWFw
LmggICAgICAgfCAgIDMgKy0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h1Z2V0bGIuaCAg
ICAgIHwgICA1ICsKPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2UuaCAgICAgICAgIHwg
IDU2ICsrLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS0zMi5oICAgfCAgMTIg
Ky0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUtNjQuaCAgIHwgMTI4ICsrKyst
LQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS1iaXRzLmggfCAgIDMgKy0KPiA+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCAgICAgIHwgNTY0ICsrKysrKysrKysr
KysrKysrKysrKysrLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oICAg
ICB8ICAyNiArLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9wYXJhbS5oICAgfCAg
MjQgKysKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMgICAgICAgICAgICAgIHwgICA0ICst
Cj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvaGliZXJuYXRlLmMgICAgICAgICB8ICAyMSArLQo+ID4g
IGFyY2gvcmlzY3YvbW0vY29udGV4dC5jICAgICAgICAgICAgICAgfCAgIDcgKy0KPiA+ICBhcmNo
L3Jpc2N2L21tL2ZhdWx0LmMgICAgICAgICAgICAgICAgIHwgIDE1ICstCj4gPiAgYXJjaC9yaXNj
di9tbS9odWdldGxicGFnZS5jICAgICAgICAgICB8ICAzMCArLQo+ID4gIGFyY2gvcmlzY3YvbW0v
aW5pdC5jICAgICAgICAgICAgICAgICAgfCAgNDUgKy0KPiA+ICBhcmNoL3Jpc2N2L21tL2thc2Fu
X2luaXQuYyAgICAgICAgICAgIHwgICA3ICstCj4gPiAgYXJjaC9yaXNjdi9tbS9wZ3RhYmxlLmMg
ICAgICAgICAgICAgICB8IDExMSArKysrLQo+ID4gIGFyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyAg
ICAgICAgICAgICAgfCAgMzEgKy0KPiA+ICBhcmNoL3MzOTAvaW5jbHVkZS9hc20vaHVnZXRsYi5o
ICAgICAgIHwgICAyICstCj4gPiAgaW5jbHVkZS9hc20tZ2VuZXJpYy9odWdldGxiLmggICAgICAg
ICB8ICAgNSArLQo+ID4gIGluY2x1ZGUvbGludXgvcGd0YWJsZS5oICAgICAgICAgICAgICAgfCAg
MjEgKwo+ID4gIGtlcm5lbC9ldmVudHMvY29yZS5jICAgICAgICAgICAgICAgICAgfCAgIDYgKy0K
PiA+ICBtbS9kZWJ1Z192bV9wZ3RhYmxlLmMgICAgICAgICAgICAgICAgIHwgICA2ICstCj4gPiAg
bW0vZ3VwLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMCArLQo+ID4gIG1tL2ht
bS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiA+ICBtbS9odWdldGxi
LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA0ICstCj4gPiAgbW0vbWFwcGluZ19kaXJ0
eV9oZWxwZXJzLmMgICAgICAgICAgICB8ICAgMiArLQo+ID4gIG1tL21lbW9yeS5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KPiA+ICBtbS9tcHJvdGVjdC5jICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAyICstCj4gPiAgbW0vcHRkdW1wLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgOCArLQo+ID4gIG1tL3NwYXJzZS12bWVtbWFwLmMgICAgICAgICAgICAgICAg
ICAgfCAgIDIgKy0KPiA+ICBtbS92bXNjYW4uYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAyICstCj4gPiAgMzMgZmlsZXMgY2hhbmdlZCwgMTAyOSBpbnNlcnRpb25zKCspLCAxNzMgZGVs
ZXRpb25zKC0pCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS91YXBp
L2FzbS9wYXJhbS5oCj4gPgo+ID4gLS0KPiA+IDIuMjAuMQo+Cj4KPiBCZXN0IFJlZ2FyZHMsCj4g
WWFuLCBaaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
