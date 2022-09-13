Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F6EC6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 13:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QX/JVcCtJK3Qh3+Q2l6Yw+TXanRW3ePOddpDsc2LOHo=; b=yj7nHXwpwoNot5
	+RL0IqAlLaWaQn0q37oOM+GNQFDJf0XBaxkAdFspBJE/JK/y7cSy5OGvwWHvQzKtODRtq9PRGF6r2
	WcLiM0qqWOz1eAbepOinkioUK+7W4BSW0sxUxPj9WDSatkWm9MMTloryGSHRbvB+JkcjWCgvma4pZ
	7fbkVSk+pBIDqvQAbaKvHURBo6nMCS1zZKj1J2JxQPVNshtZAnXDNPyva5WzccPA++khsA+7dJFT+
	AqeDo8qp6wjrGc8CdOKdndIaD0QttASz2A+DD0D7VU1XnHqvut/YVkRh66jgy8fNYbEsnldcB6JZM
	jIFKy8SFKrkGwhJOLecw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6EZ-00Aw9C-Iu; Tue, 13 Sep 2022 13:45:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6ET-00Aw4t-8g
	for linux-riscv@lists.infradead.org; Tue, 13 Sep 2022 13:45:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 24065B80D87
	for <linux-riscv@lists.infradead.org>; Tue, 13 Sep 2022 13:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA758C433B5
	for <linux-riscv@lists.infradead.org>; Tue, 13 Sep 2022 13:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663076741;
	bh=3rrQ5RGINlT/6e7Fwv1G+nPrcR2pk020BHoYvRzKJpA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IBiFyrim8ekh1Qsg0TGNnkH8WrhVdLiSE5m3UBIPf34W/2eyIJSlQrZgmnh65Oy2c
	 xEFbvOi4Ib+34YpUOSFrCVEIhGka4VtcG6qa6FodwI/ijQDcAlwg6jXZPEmfLUPIZ7
	 pH2Aspc7OZEYIITBZZcCxOKvLiHaisl/eMJlE7wInCSD8CQjOs7nZjHD5Lj8UySUVL
	 dytXwEqmjsJjL5hNai/qv5x392gq3FRwk/5JcgopVKTbjYllm1Is1G9QhFZxU0el/F
	 Pheqv+bhq5nqLwQr66QO9LeUZBlQ/DbvPPQnnBdWhMVMCdi1tVkEilUAc/7HHLDHBU
	 K56fq/Po3dk7w==
Received: by mail-ot1-f53.google.com with SMTP id r13-20020a056830418d00b0065601df69c0so2742441otu.7
        for <linux-riscv@lists.infradead.org>; Tue, 13 Sep 2022 06:45:41 -0700 (PDT)
X-Gm-Message-State: ACgBeo1r1RQ5JxX6ttRSq7wewlSkkiXAmmtr9nrPRItZEU+l5Y+/f5XV
	aIHC5l38jhKlSUAqTgHB8ox/nC1F9CXF5tGef1s=
X-Google-Smtp-Source: AA6agR5bOzewUyP/zHQzii6okUSGGALAWhUdQzEKypPWJlqq9vJib49soQK3crbWOq4rxwFcKur0xy0StZ3l0cF9Cig=
X-Received: by 2002:a05:6830:619:b0:655:dab0:7260 with SMTP id
 w25-20020a056830061900b00655dab07260mr4623212oti.308.1663076740995; Tue, 13
 Sep 2022 06:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220909094230.252031-1-zouyipeng@huawei.com> <CAJF2gTQhUFBGb7yXJ71=soGxXgNRXzBz6Da-EaXQYR9Y-FS2kw@mail.gmail.com>
 <b48224e6-a83e-b36f-edbd-42367d97d8b2@huawei.com>
In-Reply-To: <b48224e6-a83e-b36f-edbd-42367d97d8b2@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 13 Sep 2022 21:45:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRAPW-HoT9gPUvY2h8W9Ue2L1RFzZxnWYrS06Qg0QuhBw@mail.gmail.com>
Message-ID: <CAJF2gTRAPW-HoT9gPUvY2h8W9Ue2L1RFzZxnWYrS06Qg0QuhBw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix TRACE_IRQFLAGS call points in entry.S
To: Yipeng Zou <zouyipeng@huawei.com>
Cc: paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, mark.rutland@arm.com, 
	frederic@kernel.org, nsaenzju@redhat.com, paulmck@kernel.org, 
	liaochang1@huawei.com, chris.zjh@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_064545_657795_6C7BBB2B 
X-CRM114-Status: GOOD (  23.86  )
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

T24gVHVlLCBTZXAgMTMsIDIwMjIgYXQgNzoyMSBQTSBZaXBlbmcgWm91IDx6b3V5aXBlbmdAaHVh
d2VpLmNvbT4gd3JvdGU6Cj4KPgo+IOWcqCAyMDIyLzkvMTEgODo0NSwgR3VvIFJlbiDlhpnpgZM6
Cj4gPiBJIHRoaW5rIGl0IHdvdWxkIGJlIGZpeGVkIGJ5IEdFTkVSSUNfRU5UUlkuIFlvdSBjb3Vs
ZCBoYXZlIGEgdHJ5Lgo+ID4KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2
LzIwMjIwOTA4MDIyNTA2LjEyNzU3OTktMS1ndW9yZW5Aa2VybmVsLm9yZy8KPgo+IEkgdGVzdCB5
b3VyIHBhdGNoIGFuZCB5ZXMgdGhlIFdBUk5JTkcgd2FzIGdvbmUuClRoeCwgY291bGQgeW91IGdp
dmUgbWUgYSBUZXN0ZWQtYnk/Cgo+Cj4gQnV0IEknbSBqdXN0IHdvbmRlcmluZyBhYm91dCB0aGUg
b3RoZXIgc3RhYmxlIGJyYW5jaGVzLCB3aWxsIHlvdXIgcGF0Y2gKPiBiZSBtZXJnZWQgaW50byB0
aGVzZSBicmFuY2hlcz8KTm8sIHlvdXIgcGF0Y2ggaXMgc3RpbGwgd29ydGggZm9yIHN0YWJsZSBi
cmFuY2hlcy4KCj4KPiA+IE9uIEZyaSwgU2VwIDksIDIwMjIgYXQgNTo0NiBQTSBZaXBlbmcgWm91
PHpvdXlpcGVuZ0BodWF3ZWkuY29tPiAgd3JvdGU6Cj4gPj4gVFJBQ0VfSVJRRkxBR1MgbmVlZCB0
cmFjZSBhbGwge0VuYWJsZSxEaXNhYmxlfSBoYXJkIGludGVycnVwdHMgcG9pbnRzCj4gPj4gaW4g
ZW50cnkuUy4KPiA+PiBXZSBtaXNzIGEgcGF0aCh3b3JrX25vdGlmeXNpZykgdGhhdCBjYXVzZSBh
biBXQVJOIGFzIHNob3duIGJlbG93Lgo+ID4+Cj4gPj4gWyAgIDUwLjM2MjQzMV0gLS0tLS0tLS0t
LS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4gPj4gWyAgIDUwLjM2MzYwN10gREVCVUdfTE9D
S1NfV0FSTl9PTighbG9ja2RlcF9oYXJkaXJxc19lbmFibGVkKCkpCj4gPj4gWyAgIDUwLjM2NzIy
OV0gV0FSTklORzogQ1BVOiAzIFBJRDogNzQgYXQga2VybmVsL2xvY2tpbmcvbG9ja2RlcC5jOjU1
MTAgY2hlY2tfZmxhZ3MrMHgxMGEvMHgxZTAKPiA+PiBbICAgNTAuMzY4OTA1XSBNb2R1bGVzIGxp
bmtlZCBpbjoKPiA+PiBbICAgNTAuMzY5NDQwXSBDUFU6IDMgUElEOiA3NCBDb21tOiByY1MgVGFp
bnRlZDogRwo+ID4+IFsgICA1MC4zNzAyMjVdIEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxx
ZW11IChEVCkKPiA+PiBbICAgNTAuMzcwNjMyXSBlcGMgOiBjaGVja19mbGFncysweDEwYS8weDFl
MAo+ID4+IFsgICA1MC4zNzEwMTVdICByYSA6IGNoZWNrX2ZsYWdzKzB4MTBhLzB4MWUwCj4gPj4g
WyAgIDUwLjM3MTc1MV0gZXBjIDogZmZmZmZmZmY4MDhlMjY3MCByYSA6IGZmZmZmZmZmODA4ZTI2
NzAgc3AgOiBmZjIwMDAwMDAwYzNiY2EwCj4gPj4gWyAgIDUwLjM3MjcyMV0gIGdwIDogZmZmZmZm
ZmY4MTdlMjE4OCB0cCA6IGZmNjAwMDAwMDJmZTE4MDAgdDAgOiBmZmZmZmZmZjgxNjJhMmE4Cj4g
Pj4gWyAgIDUwLjM3MzMyMV0gIHQxIDogMDAwMDAwMDAwMDAwMDAwMSB0MiA6IDJkMmQyZDJkMmQy
ZDJkMmQgczAgOiBmZjIwMDAwMDAwYzNiY2MwCj4gPj4gWyAgIDUwLjM3MzkwM10gIHMxIDogZmZm
ZmZmZmY4MTdlMzM0MCBhMCA6IDAwMDAwMDAwMDAwMDAwMzAgYTEgOiBmZmZmZmZmZjgxNjkzZmE4
Cj4gPj4gWyAgIDUwLjM3NDQ3Nl0gIGEyIDogMDAwMDAwMDAwMDAwMDAxMCBhMyA6IGZmZmZmZmZm
ZmZmZmZmZmUgYTQgOiAwODMxNTFhNDIyYjhkZjAwCj4gPj4gWyAgIDUwLjM3NTAzOV0gIGE1IDog
MDgzMTUxYTQyMmI4ZGYwMCBhNiA6IGZmZmZmZmZmODAwNjg5MWUgYTcgOiAwODMxNTFhNDIyYjhk
ZjAwCj4gPj4gWyAgIDUwLjM3NjAyOF0gIHMyIDogZmZmZmZmZmY4MTdlNTRlMCBzMyA6IGZmZmZm
ZmZmODE2OTUwNzAgczQgOiBmZjYwMDAwMDAyN2Q3ODAwCj4gPj4gWyAgIDUwLjM3Njk3OF0gIHM1
IDogZmZmZmZmZmY4MGMyMjc3MCBzNiA6IDAwMDAwMDAyMDAwMDAwMjIgczcgOiBmZmZmZmZmZmZm
ZmZmZmZmCj4gPj4gWyAgIDUwLjM3Nzc3OV0gIHM4IDogZmZmZmZmZmY4MjMwMWVkMCBzOSA6IDAw
MDAwMDAwMDAwMDEwMDAgczEwOiAwMDAwMDAwMDAwMWE5OTA1Cj4gPj4gWyAgIDUwLjM3ODMzNV0g
IHMxMTogMDAwMDAwMDAwMDE0ZjNlOCB0MyA6IGZmZmZmZmZmODIyZDcxNGYgdDQgOiBmZmZmZmZm
ZjgyMmQ3MTRmCj4gPj4gWyAgIDUwLjM3ODk1NV0gIHQ1IDogZmZmZmZmZmY4MjJkNzE1MCB0NiA6
IGZmMjAwMDAwMDBjM2JhOTgKPiA+PiBbICAgNTAuMzc5NzgzXSBzdGF0dXM6IDAwMDAwMDAyMDAw
MDAxMDAgYmFkYWRkcjogMDAwMDAwMDAwMDAwMDAwMCBjYXVzZTogMDAwMDAwMDAwMDAwMDAwMwo+
ID4+IFsgICA1MC4zODA4MTBdIFs8ZmZmZmZmZmY4MDhlMjdiZT5dIGxvY2tfaXNfaGVsZF90eXBl
KzB4NzgvMHgxNGUKPiA+PiBbICAgNTAuMzgxNDc3XSBbPGZmZmZmZmZmODAwM2U4NTA+XSBfX21p
Z2h0X3Jlc2NoZWQrMHgyNi8weDIyYwo+ID4+IFsgICA1MC4zODIwMDZdIFs8ZmZmZmZmZmY4MDAz
ZWE5Mj5dIF9fbWlnaHRfc2xlZXArMHgzYy8weDY2Cj4gPj4gWyAgIDUwLjM4MjQ3N10gWzxmZmZm
ZmZmZjgwMDIzMjRlPl0gZ2V0X3NpZ25hbCsweGFhLzB4OTEyCj4gPj4gWyAgIDUwLjM4Mjk0N10g
WzxmZmZmZmZmZjgwMDA1MzY4Pl0gZG9fbm90aWZ5X3Jlc3VtZSsweDgyLzB4NDM0Cj4gPj4gWyAg
IDUwLjM4MzgzOV0gWzxmZmZmZmZmZjgwMDAzYmVjPl0gcmV0X2Zyb21fZXhjZXB0aW9uKzB4MC8w
eDEwCj4gPj4KPiA+PiBGaXhlczogM2M0Njk3OTgyOTgyICgicmlzY3Y6IEVuYWJsZSBMT0NLREVQ
X1NVUFBPUlQgJiBmaXh1cCBUUkFDRV9JUlFGTEFHU19TVVBQT1JUIikKPiA+PiBTaWduZWQtb2Zm
LWJ5OiBZaXBlbmcgWm91PHpvdXlpcGVuZ0BodWF3ZWkuY29tPgo+ID4+IC0tLQo+ID4+ICAgYXJj
aC9yaXNjdi9rZXJuZWwvZW50cnkuUyB8IDYgKysrKystCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvZW50cnkuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPiA+PiBp
bmRleCBiOWVkYTNmY2JkNmQuLmY0ZDIzOTk1YTRmMSAxMDA2NDQKPiA+PiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC9lbnRyeS5TCj4gPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwo+
ID4+IEBAIC0zNzAsMTYgKzM3MCwyMCBAQCByZXN1bWVfa2VybmVsOgo+ID4+Cj4gPj4gICB3b3Jr
X3BlbmRpbmc6Cj4gPj4gICAgICAgICAgLyogRW50ZXIgc2xvdyBwYXRoIGZvciBzdXBwbGVtZW50
YXJ5IHByb2Nlc3NpbmcgKi8KPiA+PiAtICAgICAgIGxhIHJhLCByZXRfZnJvbV9leGNlcHRpb24K
PiA+PiAgICAgICAgICBhbmRpIHMxLCBzMCwgX1RJRl9ORUVEX1JFU0NIRUQKPiA+PiAgICAgICAg
ICBibmV6IHMxLCB3b3JrX3Jlc2NoZWQKPiA+PiAgIHdvcmtfbm90aWZ5c2lnOgo+ID4+ICsjaWZk
ZWYgQ09ORklHX1RSQUNFX0lSUUZMQUdTCj4gPj4gKyAgICAgICBjYWxsIF9fdHJhY2VfaGFyZGly
cXNfb24KPiA+PiArI2VuZGlmCj4gPj4gKyAgICAgICBsYSByYSwgcmV0X2Zyb21fZXhjZXB0aW9u
Cj4gPj4gICAgICAgICAgLyogSGFuZGxlIHBlbmRpbmcgc2lnbmFscyBhbmQgbm90aWZ5LXJlc3Vt
ZSByZXF1ZXN0cyAqLwo+ID4+ICAgICAgICAgIGNzcnMgQ1NSX1NUQVRVUywgU1JfSUUgLyogRW5h
YmxlIGludGVycnVwdHMgZm9yIGRvX25vdGlmeV9yZXN1bWUoKSAqLwo+ID4+ICAgICAgICAgIG1v
dmUgYTAsIHNwIC8qIHB0X3JlZ3MgKi8KPiA+PiAgICAgICAgICBtb3ZlIGExLCBzMCAvKiBjdXJy
ZW50X3RocmVhZF9pbmZvLT5mbGFncyAqLwo+ID4+ICAgICAgICAgIHRhaWwgZG9fbm90aWZ5X3Jl
c3VtZQo+ID4+ICAgd29ya19yZXNjaGVkOgo+ID4+ICsgICAgICAgbGEgcmEsIHJldF9mcm9tX2V4
Y2VwdGlvbgo+ID4+ICAgICAgICAgIHRhaWwgc2NoZWR1bGUKPiA+Pgo+ID4+ICAgLyogU2xvdyBw
YXRocyBmb3IgcHRyYWNlLiAqLwo+ID4+IC0tCj4gPj4gMi4xNy4xCj4gPj4KPiAtLQo+IFJlZ2Fy
ZHMsCj4gWWlwZW5nIFpvdQo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
