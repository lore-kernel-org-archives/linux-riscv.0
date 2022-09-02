Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB16C38145
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 10:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vSDXAoJ826XM6NVO33IabPBnhsuqvHLjMqQoLnDA4yY=; b=V2Y7uvZUFBHHZD
	fj0zzekVcUnzL9/2h82KnM2nvMSco3Tu5uUbkmI1aTeELDQc1BkjHTs5EHtTVaPg1IFU0VNgN8Jzf
	bwURAFWoz7E1wS9xk52mTotAtjQWyA7X26iK8E01zSib7cCFeW6+M1mnEkpea1YGwRtHST31F/85e
	XUNQl7ZuK/sP2MtEjiOTsfE2nPdbCYaYlT7EEQKAyaLiZnajC51g6nrb8A3j6OSD1VZRgOIrgcBI2
	Jd/0y7iThnfMAN+LirFeoyWIY7kwjzEoY/xJYpOE81gWxryIAnAlapgyrfOUP/hInXcnMf/Qd6vlk
	MgsQhk4HxsPWx74HhBaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3xW-003QyO-VN; Fri, 02 Sep 2022 10:31:35 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3xT-003QsX-Br
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 10:31:33 +0000
Received: by mail-lf1-x135.google.com with SMTP id z29so2590883lfb.13
        for <linux-riscv@lists.infradead.org>; Fri, 02 Sep 2022 03:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=BUpPFpfST7MOj0GWb/MCs9vpUVuEhe0jMqD9RV0JMxI=;
        b=PS4MhTBh84bUUNKz46PogtbrIPCCHnL4ZHeLnXLvf6Yv+QaeTDw0Wh+oplYjqKBb2O
         r1S0ohxtdu3Zm2eS2WsUFAR+6ESLP2jGlNIMRWdxuyJzKCR0sLR/+hmD00ecIa7PxldZ
         dhhCSHMddW+78gnwFlTLBCfbYeFEavaqx7fn48iuNZz1a2+Gf1bchBicE1cpwi7KmVAu
         2fgJ/yblZybBwAfFLIr29Yc3ScbkY83t+ODVV2J3JbLzqckrED84aIWQcKabTDjBhGr1
         63JDJDjzQGTOuMfs4gYCSgGbB1tjR+0CLuwJ7KPi3CqGqpHEBWJWpwelpls4dE69qQWe
         lEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BUpPFpfST7MOj0GWb/MCs9vpUVuEhe0jMqD9RV0JMxI=;
        b=agEr1mY0ut6Q132yBcCmWu7/B/hJJRcbqQszCvWVhcs7tEybV6Ab4varYx5Yrb85Kf
         4CDlSfDKiDSQ4dWvSjiN3Y8PRyuGqCtEah+H+49h3XZ02I9clDUKkICeYgUMoF8lwQhJ
         FNzvXES/OM6nW0J7b2iKCIY7jBuh7jeZq6Pcl/rrUklQedhb1FIRh2L+HqrmyBpmZdtD
         y8sX/63HPtJVl8R6yCUFiIqwYvZhZwUBsy+hiLe/BmwwBtrH2y4Nh3hZZ/BHsfh3Fu1D
         PwV0vnczqMmZgtk9SrnPnRVrM2NdX43LM0c+vJlgnHtu8eDTuN9W49oM1vYWvLJSWC7m
         /Wmg==
X-Gm-Message-State: ACgBeo0FZH8H8RhemHLAwucbEQW3SV451soGx17eSOL9uI8BCu26eh7N
	I+58khcdLQrnxNhfWtYicyVsoXRNg55TkJcwsc59Ag==
X-Google-Smtp-Source: AA6agR4Kqz7VEtdUs9X/PhMNIAaBFdj8fDU94cAEiO2CmkbBijqeapM6tqubfosPTvR1febrySBAUG1Ng03JY6KQEiE=
X-Received: by 2002:a05:6512:169c:b0:492:ca5c:eb23 with SMTP id
 bu28-20020a056512169c00b00492ca5ceb23mr12779713lfb.646.1662114687377; Fri, 02
 Sep 2022 03:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <YxEhC/mDW1lFt36J@aurel32.net> <CAOnJCUJ-E-VyQOyh+psbJP4mDO9F+ShvnxDYjoCUUkH4rddJtw@mail.gmail.com>
 <CAOnJCUKDQfCD7mh-RWrq0E8a3Fmp4Xz348THrS+SmJ71GX8=PA@mail.gmail.com>
 <CA+7wUsww-CGmyNOHJw2bVfcDamq3_XD8mVDJ6pfk0UsxreEjOw@mail.gmail.com>
 <CAAhSdy2RGu9NHg0rOfiGxZYsvvcvtOr-jGWdLVt+iUkpZKgN=w@mail.gmail.com> <CAGRC-mj-v6RoGjCNr_TiabgqYX7H9mTXYE9tx6BhCKT5nHD-Aw@mail.gmail.com>
In-Reply-To: <CAGRC-mj-v6RoGjCNr_TiabgqYX7H9mTXYE9tx6BhCKT5nHD-Aw@mail.gmail.com>
From: Jan Wassenberg <janwas@google.com>
Date: Fri, 2 Sep 2022 12:31:16 +0200
Message-ID: <CAGRC-mhfFj7AVMhQga42u4R-FbqKW3Y_FOqJD6G1-5Xe2AvkBg@mail.gmail.com>
Subject: Re: rdcycle from userland with RISCV_PMU_SBI=y
To: Anup Patel <anup@brainfault.org>
Cc: Mathieu Malaterre <malat@debian.org>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, Aurelien Jarno <aurelien@aurel32.net>, 
	Anup Patel <apatel@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Jan Newger <jannewger@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_033131_436847_10909A6E 
X-CRM114-Status: GOOD (  44.39  )
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

KEZvcndhcmRpbmcgaW4gcGxhaW4gdGV4dCBtb2RlIGFzIGFwcGFyZW50bHkgcmVxdWlyZWQgYnkg
dGhlIGxpc3QsCmFwb2xvZ2llcyBmb3IgdGhlIGR1cGxpY2F0aW9uKQoKT24gRnJpLCBTZXAgMiwg
MjAyMiBhdCAxMjoyMiBQTSBKYW4gV2Fzc2VuYmVyZyA8amFud2FzQGdvb2dsZS5jb20+IHdyb3Rl
Ogo+Cj4gT0ssIGJ1dCBldmVuIGlmIGZyZXF1ZW5jeSBjaGFuZ2VzLCBhIGN5Y2xlIGNvdW50ZXIg
c2VlbXMgbW9yZSB1c2VmdWwgZm9yIGJlbmNobWFya2luZyB0aGFuIGEgbG93LXJlc29sdXRpb24g
d2FsbCB0aW1lLgo+Cj4gRllJIGl0J3Mgbm90IGp1c3QgSGlnaHdheSwgdGhlIEdvb2dsZSBiZW5j
aG1hcmsgbGlicmFyeSBhbHNvIHVzZXMgcmRjeWNsZS4KPgo+IFNvbWUgcGVyc29uYWwgb3Bpbmlv
bnMgb24gc2VjdXJpdHkgKGRpc2NsYWltZXI6IEkgaGF2ZSBzb21lIGV4cGVyaWVuY2UgYnV0IGFt
IG5vdCBhbiBleHBlcnQpOgo+IERpc2FibGluZyBjeWNsZSBjb3VudGVycyBkb2VzIG5vdCBzZWVt
IHRvIHByb3ZpZGUgYW55IGV4dHJhIHNlY3VyaXR5IG9uIGEgbXVsdGktY29yZSBzeXN0ZW0gdW5s
ZXNzCj4gaXQgYWxzbyBkZXRlY3RzIGFuZCBtaXRpZ2F0ZXMgc29mdHdhcmUgdGltZXJzLgo+IFNl
ZSBzZWN0aW9uIDYgaW4gaHR0cDovL2NhbC5jcy5jb2x1bWJpYS5lZHUvcGFwZXJzL2lzY2ExMl90
aW1ld2FycC5wZGYuIEluIHNob3J0LCBvdGhlciBjb3JlKHMpIGNhbiBpbmNyZW1lbnQgYSBzaGFy
ZWQgY291bnRlciwKPiB3aGljaCBpcyBjbG9zZSBlbm91Z2ggdG8gYSBjeWNsZSBjb3VudGVyIHRv
IHNlcnZlIGFzIGEgc2lkZSBjaGFubmVsLiBEZXRlY3Rpbmcgc3VjaCBjb29yZGluYXRpb24gdmlh
IHBlcmZvcm1hbmNlIGNvdW50ZXJzCj4gc2VlbXMgZmVhc2libGUsIHRob3VnaCBpdCByaXNrcyBm
YWxzZSBhbGFybXMgZm9yIHNvbWV0aGluZyBsaWtlIHNwaW5sb2Nrcy4KPgo+IFJlZHVjaW5nIHRp
bWVyIHJlc29sdXRpb24gY291bGQgc3RpbGwgYmUgZGVmZWF0ZWQgYnkgaW50ZXJwb2xhdGluZy4g
SWYgd2UncmUgZGV0ZXJtaW5lZCB0byBkbyBzb21ldGhpbmcsCj4gcGVyaGFwcyB0aGUgY3ljbGUg
Y291bnRlciBjb3VsZCBoYXZlIHNvbWUgaml0dGVyICg+IExMQyBsYXRlbmN5KSwgaWRlYWxseSBv
bmx5IGVuYWJsZWQgaWYKPiBhIHBvc3NpYmxlIGF0dGFjayBpcyBkZXRlY3RlZCBieSB0cmFwcGlu
ZyByZGN5Y2xlIGFuZCBjaGVja2luZyB0aGUgZWxhcHNlZCB0aW1lIHNpbmNlIHRoZSBsYXN0IHJk
Y3ljbGUuCj4KPiBPbiBGcmksIFNlcCAyLCAyMDIyIGF0IDEwOjE5IEFNIEFudXAgUGF0ZWwgPGFu
dXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+Pgo+PiBPbiBGcmksIFNlcCAyLCAyMDIyIGF0IDE6
MjMgUE0gTWF0aGlldSBNYWxhdGVycmUgPG1hbGF0QGRlYmlhbi5vcmc+IHdyb3RlOgo+PiA+Cj4+
ID4gQXRpc2gsCj4+ID4KPj4gPiBPbiBGcmksIFNlcCAyLCAyMDIyIGF0IDk6MTIgQU0gQXRpc2gg
UGF0cmEgPGF0aXNocEBhdGlzaHBhdHJhLm9yZz4gd3JvdGU6Cj4+ID4gPgo+PiA+ID4KPj4gPiA+
Cj4+ID4gPiBPbiBUaHUsIFNlcCAxLCAyMDIyIGF0IDM6MzQgUE0gQXRpc2ggUGF0cmEgPGF0aXNo
cEBhdGlzaHBhdHJhLm9yZz4gd3JvdGU6Cj4+ID4gPj4KPj4gPiA+Pgo+PiA+ID4+Cj4+ID4gPj4g
T24gVGh1LCBTZXAgMSwgMjAyMiBhdCAyOjE1IFBNIEF1cmVsaWVuIEphcm5vIDxhdXJlbGllbkBh
dXJlbDMyLm5ldD4gd3JvdGU6Cj4+ID4gPj4+Cj4+ID4gPj4+IEhpIGFsbCwKPj4gPiA+Pj4KPj4g
PiA+Pj4gTWF0aGlldSBNYWxhdGVycmUgcmVwb3J0ZWQgYW4gaXNzdWUgaW4gRGViaWFuIHdpdGgg
dGhlIGhpZ2h3YXkgcGFja2FnZSwKPj4gPiA+Pj4gd2hpY2ggdXNlcyB0aGUgcmRjeWNsZSBwc2V1
ZG8gaW5zdHJ1Y3Rpb24sIGFuZCBzdGFydGVkIHRvIGZhaWwgcmVjZW50bHkuCj4+ID4gPj4+Cj4+
ID4gPj4+IFdlIHRyYWNrZWQgZG93biBhbiBpc3N1ZSB0byB0aGUgInBlcmYgcGxhdGZvcm0gZHJp
dmVyIGJhc2VkIG9uIFNCSSBQTVUKPj4gPiA+Pj4gZXh0ZW5zaW9uIiByZWNlbnRseSBhZGRlZCBp
biBMaW51eCA1LjE4IFsxXS4gT24gYSBib2FyZCB3aGljaCBydW5zIGFuCj4+ID4gPj4+IFNCSSB3
aXRoIHRoZSBQTVUgZXh0ZW5zaW9uLCB0aGlzIGNhdXNlcyB0aGUgcmRjeWNsZSBwc2V1ZG8gaW5z
dHJ1Y3Rpb24KPj4gPiA+Pj4gdG8gZ2VuZXJhdGUgYSBTSUdJTEwuIFRoaXMgaXMgYmVjYXVzZSB0
aGUgZHJpdmVyIGV4cGxpY2l0bHkgc2V0Cj4+ID4gPj4+IENTUl9TQ09VTlRFUkVOIHRvIDB4MDIs
IGdpdmluZyBhY2Nlc3MgZnJvbSB1c2VybGFuZCB0byByZHRpbWUgYnV0IG5vdAo+PiA+ID4+PiBy
ZGN5Y2xlLgo+PiA+ID4+Pgo+PiA+ID4+PiBJIHdvbmRlciBpZiB0aGlzIGNoYW5nZSBpcyBpbnRl
bnRpb25hbCwgYW5kIGlmIHRoZXJlIGlzIGEgcmVhc29uIHRvCj4+ID4gPj4+IGZvcmJpZCB1c2lu
ZyB0aGUgcmRjeWNsZSBwc2V1ZG8gaW5zdHJ1Y3Rpb24gZnJvbSB1c2VybGFuZC4gSWYgaXQgaXMg
dGhlCj4+ID4gPj4+IGNhc2UsIHRoaXMgc2hvdWxkIHByb2JhYmx5IGJlIGNoYW5nZWQgc28gdGhh
dCB0aGUgYmVoYXZpb3VyIGRvZXMgbm90Cj4+ID4gPj4+IGRpZmZlciBmcm9tIGJvYXJkIHRvIGJv
YXJkIGRlcGVuZGluZyBvbiB0aGUgYXZhaWxhYmxlIFBNVSBleHRlbnNpb24uCj4+ID4gPj4+Cj4+
ID4gPj4KPj4gPiA+PiBZZXMuIFRoZSBjaGFuZ2Ugd2FzIGludGVudGlvbmFsIGR1ZSB0byBzZWN1
cml0eSByZWFzb25zLiBPbmUgcm9ndWUgcHJvY2VzcyBjYW4gaGF2ZSBhY2Nlc3MgdG8gY3ljbGUg
Jgo+PiA+ID4+IGluc3RydWN0aW9ucyBvZiB0aGUgZW50aXJlIGtlcm5lbCBhbHdheXMgd2hpY2gg
Y2FuIGxlYWQgdG8gc29tZSBzb3J0IG9mIHNpZGUgY2hhbm5lbCBhdHRhY2tzLgo+PiA+ID4+Cj4+
ID4gPj4gSG93ZXZlciwgSSBhZ3JlZSB0aGF0IHdlIGNhbid0IGJyZWFrIHVzZXJzcGFjZS4gSSB3
YXMgbm90IGF3YXJlIG9mIHRoZSBmYWN0IHRoYXQgdGhlcmUgYXJlIGFscmVhZHkgdXNlcnMgb2Yg
cmRjeWNsZQo+PiA+ID4+IGluIHRoZSB1c2Vyc3BhY2UuIEkgd2lsbCBzZW5kIGEgcGF0Y2ggdG8g
cmVzdG9yZSB0aGUgb3JpZ2luYWwgYmVoYXZpb3IgYnkgZW5hYmxpbmcgQ1ksIElSIGJpdHMgaW4g
c2NvdW50ZXJlbi4KPj4gPiA+Pgo+PiA+ID4KPj4gPiA+IE1lcmdpbmcgdGhlIHRocmVhZCBmcm9t
IHN3LWRldjoKPj4gPiA+Cj4+ID4gPiAiCj4+ID4gPiA+ID4gT24gVGh1LCBTZXAgMSwgMjAyMiBh
dCA3OjM2IFBNIFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT4gd3JvdGU6
Cj4+ID4gPiA+ID4+Cj4+ID4gPiA+ID4+IElmIEkgcmVjYWxsIGNvcnJlY3RseSwgIG90aGVyIGFy
Y2hpdGVjdHVyZXMgZG9uJ3QgYWxsb3cgZGlyZWN0IGFjY2VzcyB0byB0aGVpciBjeWNsZSBjb3Vu
dGVycyBmcm9tIHVzZXJzcGFjZSBmb3Igc2VjdXJpdHkgcmVhc29ucy4gICBBbnkgcmVhc29uIHdo
eSBSSVNDLVYgc2hvdWxkbid0IGZvbGxvdyB0aGUgc2FtZSBhcHByb2FjaD8KPj4gPiA+ID4gPgo+
PiA+ID4gPiA+Cj4+ID4gPiA+ID4gVGhhdCB3YXMgdGhlIGludGVudGlvbiBiZWhpbmQgZGlzYWJs
aW5nIHRoZSBhY2Nlc3MgaW4gdGhlIFBNVSBkcml2ZXIuIEF0IHRoYXQgdGltZSwgSSBkaWRu4oCZ
dCBmaW5kIGFueSB1c2Vycy4gT2J2aW91c2x5IEkgd2FzIHdyb25nIPCfmIIuIEJ1dCBpcyB0aGF0
IGEgc3VmZmljaWVudCByZWFzb24gdG8gZXhpc3RpbmcgYnJlYWsgdXNlciBzcGFjZSA/Cj4+ID4g
PiA+Cj4+ID4gPiA+IEFzIGFscmVhZHkgcG9pbnRlZCBvdXQsIHdlIGNhbid0IGNvbXByb21pc2Ug
c2VjdXJpdHkgYnkgaGF2aW5nIGFsbAo+PiA+ID4gPiBhcHBzIHVucmVzdHJpY3RlZCBhY2Nlc3Mg
dG8gdGhlIGN5Y2xlIGNvdW50ZXIuIFdlIGFscmVhZHkgaGF2ZSB0aGUKPj4gPiA+ID4gTGludXgg
cGVyZiBzdWJzeXN0ZW0gZm9yIG1hbmFnaW5nIGNvdW50ZXJzIHNvIGFwcHMgc2hvdWxkIGFsd2F5
cyB1c2UKPj4gPiA+ID4gTGludXggcGVyZiBzeXNjYWxscy4KPj4gPiA+ID4KPj4gPiA+ID4gSU1P
LCB0aGUgcGFja2FnZSAiaGlnaHdheSIgZGlyZWN0bHkgYWNjZXNzaW5nIHRoZSBjeWNsZSBjb3Vu
dGVyIHNob3VsZAo+PiA+ID4gPiBiZSBmaXhlZCBpbnN0ZWFkIG9mIGZpeGluZyB0aGUgTGludXgg
U0JJIFBNVSBkcml2ZXIuCj4+ID4gPiA+Cj4+ID4gPiA+IEZ1cnRoZXIgaW52ZXN0aWdhdGluZyB0
aGUgaGlnaHdheSBwcm9qZWN0Cj4+ID4gPiA+IChodHRwczovL2dpdGh1Yi5jb20vZ29vZ2xlL2hp
Z2h3YXkpLCBpdCBzZWVtcyB0aGlzIHByb2plY3QgaXMgdXNpbmcKPj4gPiA+ID4gInJkY3ljbGUi
IHRvIHRyYWNrIHRpbWVyIHRpY2tzIHdoaWNoIGlzIHRvdGFsbHkgd3JvbmcuIEluc3RlYWQgdGhl
IHVzZQo+PiA+ID4gPiBvZiAicmRjeWNsZSIgc2hvdWxkIGJlIHJlcGxhY2VkIHdpdGggInJkdGlt
ZSIgaW4gdGhpcyBwcm9qZWN0Lgo+PiA+ID4gPiAoUmVmZXIsIGxpbmUgMTU2IG9mCj4+ID4gPiA+
IGh0dHBzOi8vZ2l0aHViLmNvbS9nb29nbGUvaGlnaHdheS9ibG9iL21hc3Rlci9od3kvbmFub2Jl
bmNobWFyay5jYykKPj4gPiA+Cj4+ID4gPiBQYXkgYXR0ZW50aW9uIHRoYXQgcXVpdGUgYSBmZXcg
cHJvamVjdHMgYXJlIHVzaW5nIHJkY3ljbGUgaW4gdXNlci1zcGFjZSBhbHJlYWR5Ogo+PiA+ID4K
Pj4gPiA+ICogaHR0cHM6Ly9jb2Rlc2VhcmNoLmRlYmlhbi5uZXQvc2VhcmNoP3E9JTIycmRjeWNs
ZSslMjUwJTIyCj4+ID4gPgo+PiA+ID4gQW55d2F5IGlmIHlvdSBiZWxpZXZlIHJkdGltZSBpcyB0
aGUgcmlnaHQgZml4LCB3ZSBjYW4gZml4IG9uZSBwcm9qZWN0Cj4+ID4gPiBhdCBhIHRpbWUuLi4i
Cj4+ID4gPgo+PiA+ID4gVGhhbmtzIGZvciBzaGFyaW5nIHRoZSBsaXN0LiBJIHRvb2sgYSBxdWlj
ayBsb29rLiBUaGUgZmlyc3QgZmV3IG9uZXMgYXQgbGVhc3QgIChmaXJlZm94LCBsbHZtLCBjaHJv
bWUpCj4+ID4gPiBzZWVtcyB0byB1c2UgcmRjeWNsZSBmb3IgdGltZXN0YW1wLiBBbGwgb2YgdGhl
IHBhY2thZ2VzIHVzZSAicmR0c2MiIGZvciB4ODYuCj4+ID4gPiBUaGUgZXF1aXZhbGVudCBpbnN0
cnVjdGlvbiBpbiBSSVNDLVYgc2hvdWxkIGJlIHJkdGltZSBub3QgcmRjeWNsZS4KPj4gPgo+PiA+
IFtDQy1pbmcgaGlnaHdheSBtYWluIGRldl0KPj4gPgo+PiA+IEhlcmUgaXMgaGlzIGNvbW1lbnQg
b24gdGhlIHJkdGltZSBwYXRjaCBwcm9wb3NhbDoKPj4gPgo+PiA+ID4gRm9yIGJlbmNobWFya2lu
ZyB3ZSByZWFsbHkgd291bGQgcHJlZmVyIGEgY3ljbGUgY291bnQsIHJhdGhlciB0aGFuICJyZWFs
IHRpbWUgY2xvY2sgdGlja3MiLCBmb3Igd2hpY2ggdGhlIHNwZWMgbWFrZXMgbm8gZ3VhcmFudGVl
cy4gSWYvd2hlbiB0aG9zZSB0dXJuIG91dCB0byBiZSBtaWxsaXNlY29uZC1yZXNvbHV0aW9uLCB0
aGV5IGFyZSBub3QgdmVyeSB1c2VmdWwuCj4+Cj4+IFRoZSBSSVNDLVYgc3BlYyBkb2VzIG5vdCBt
YWtlIGFueSBndWFyYW50ZWUgYWJvdXQgZ3JhbnVsYXJpdHkgb2YgdGhlCj4+IGN5Y2xlIGNvdW50
ZXIgYXMgd2VsbC4gSW4gZmFjdCwgb24gc3lzdGVtcyB3aXRoIGNwdWZyZXEgZW5hYmxlZCB0aGUK
Pj4gcmF0ZSBvZiBjeWNsZSBjb3VudGVyIGluY3JlbWVudCB3aWxsIHZhcnkgYXQgcnVudGltZS4K
Pj4KPj4gT24gb3RoZXIgaGFuZCwgdGhlIHRpbWUgQ1NSIChpLmUuIHJkdGltZSkgd2lsbCBhbHdh
eXMgaW5jcmVtZW50IGF0IGEKPj4gZml4ZWQgcGxhdGZvcm0gc3BlY2lmaWMgcmF0ZSB3aGljaCBj
YW4gYmUgcmVhZCBmcm9tCj4+ICIvcHJvYy9kZXZpY2UtdHJlZS9jcHVzL3RpbWViYXNlLWZyZXF1
ZW5jeSIuCj4+Cj4+IFJlZ2FyZHMsCj4+IEFudXAKPj4KPj4KPj4gPgo+PiA+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+ID4gbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0Cj4+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiA+IGh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
