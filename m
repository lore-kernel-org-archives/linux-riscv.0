Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B0CC44512
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jul 2026 23:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Schs2n+VtVKs53mCGF+LNafzlkfgVIagN01WiEjqfCI=; b=qAoJ1mjX05hpfK
	K82/9pvarXfVN2AILzsDbj8eC4qbuIBIfaeZ+sf1rH1IivgCMtW3mrLryeFoz+vB2tqA0OUJxKEqR
	IUXy96EQoTTQVLkZNOs+/JHS8BcqfLddmLqprxG5UPWe1qMCvKhTdlOSd4JX/VVQ8y1+WiJ3G39Mj
	JoCNmlFmhFKFQtfIaGkhmSTgy/btOvB8FeCjAB6wBXkhACQUtxS83/6k8LJdwL3Fx8FexieHUvIIk
	B4rERPnqKR3gbDue0ObSGRzdzEIYNRU+/rbBNRPiYMoQn1b+BG96FuUM4EdZkR7nRW8Do+7KYLe9g
	QklqCHjEPWjxspA9yYxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlao3-00000005VeI-1NhE;
	Sun, 19 Jul 2026 23:20:23 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlao0-00000005Vdk-0BLy
	for linux-riscv@lists.infradead.org;
	Sun, 19 Jul 2026 23:20:22 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-6682259cae6so4059582d50.3
        for <linux-riscv@lists.infradead.org>; Sun, 19 Jul 2026 16:20:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784503219; cv=none;
        d=google.com; s=arc-20260327;
        b=oJgOa53SZBR1jV3h4YtvApcKSOGQB0EVtt0v55PSAS5DXEkzUWd9I8iGYNLApAQtHC
         vyylXwMXDuNCkTFETXqAVW+iWrJDYkimKhR2Jos7u7BYpUyOGIjWkZa2/4SpjNlLd+7U
         9bgeuosmfJufyvvL1yZS/w86bLSWuAhMWGzd+WoGqQkkf9dESe4h549kHU/3ZV/G2Org
         RnQ5tQn65/sYi+Pp5uDtfVCeQXIObvKFZ5hPuuLAyeCni39Ab9Cc3/DWj8jAPccswiLf
         HZG987XQCMBoLo7nsS6q8/l+eVnksyDVQTi12eY2q81V5Q/qiRXA8us+wrORFS6t1c3k
         Hr7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UPqjPIJbJ4hSMkmX6fzNuKXuPBcJE4+S9+cyMi05hk4=;
        fh=mPDNyMaC3Y0gXzro3shbFbOPt5yIO3RCa+gylTRpyH4=;
        b=HuY9y7PevMfFz5cOh+95vl+RLG1B8mZXg2wojo7J6o/mTH2lR72w1eZRQTzu2rhtoo
         APpDHcDld8rVrvX2jLf5ZZTP7IV78/HD4EbJEpKQ0IhNJsMo2BTNNQIqvUU78uHHZP7n
         tW+TdD5f7zAyuNW0dSRARVaGPRBAq9YD8gMEk8oxQwlNNr6ZWIhmOzYWAcrcJN33JyRr
         W95dC4P2bxxLXzPm6pFEd9SwjRGoxH/Azb5uJt5t5b8KJP2Xa5wWnjqutiqmgg01VfxN
         ygQKqK0mAkEWGN/A3KtG1bvA8cVlPzH7WNc006YKkUVLPDd5F2nS++3qNxohmfdgrIsA
         nXyA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784503219; x=1785108019; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UPqjPIJbJ4hSMkmX6fzNuKXuPBcJE4+S9+cyMi05hk4=;
        b=RT4uAF+g7yeEwgO2ofWj5SL5xQJoxDUg0h6xpxPXVvyO4ddGoK3ZeUwK6lKrcaqt/e
         I0GhqCO2OQ8SOk5WzMZDQPppBZIE25B+3G7q6llc6E1KIoRBQsr7lWpnW1luDHejhT8s
         0Q72M5cHgt6QytpCHahLPCdTJiG89urw93w1c3BlVc2EQicxx+nC3NiWoRmrbJ2W7tyr
         UY19vPvBENkbVroTHTmO4krgl8rPkFyWpneVCWZKTztz8FEyt7a8YnbOTB009L3YH0pS
         tSwhPVAZ7UDaShODvRHDRLmTyZdRbnn9edmFV1XCZUwcLJKTSCWLVCRgJpsmE6Lky8KS
         8F9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784503219; x=1785108019;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPqjPIJbJ4hSMkmX6fzNuKXuPBcJE4+S9+cyMi05hk4=;
        b=IHr3SLSc9LNNr6U0VJeAdQOYMUYCx0jUaxoG2nsiPiUGP7rDHtoTIwDVD7eQC+EOHK
         llGftJl9c7xNujOiaF7Ipfi1SZqQQszQ7WIh/hafOmbtsimJI5hoA9E24FaMBf8liuS1
         XkrWCAndyQup1mVG2DAlk3O5FF1T5BP4E4OwRapPvaC8oEVBr+YDfWZyjwXcvB6+FDAf
         J0ZFwkDTPwXWCW7o0k99WhFkl6BLdsDjM9AqBWaoBh5azZ2ltF0Pb2Nd1FMDP14tHDOE
         7YzBl6nSLkHQSpPdMZtp9xA2zSXRwMCXEDObXA1XPqrYNiowjVeykcSMB0HKpfmfh87P
         Hy+w==
X-Forwarded-Encrypted: i=1; AHgh+Ro2OJUFjrVv56WMcn+6UwHhLrkFRKPROGI/gpGBinBqPDyyXU5Y/2Kdb673EiI3i4UzAAzm+rqycE+Xfw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0L8HO/1d6Bl0kGDhfH12rNF9WXIv2P4p+9mfF5+Dac5k0Txa0
	81BiBTco5RGTivrh4ESF1PMMF6r9AoEcInzZDFAsxE3Bh4V5pAnFtHIN/wYL27a4CbcSRggv2np
	2WWQFGI7qhg6AJIb6mRueT2/PAoDxvtgIrRU02h8uww==
X-Gm-Gg: AfdE7clg29Ej9sgStxQgBvGPzC39zD8QfdB+NYlbDKqS29FNGc2mu9vFcwPoHlt5caA
	7qwm4BONmYVaFk8dgDZIkJOxQ0pJUa+625Ots0ZBQgvvS9Xbj7o2TvrxVpN1DBzKXALvfkAWJFM
	tGFpSIVZsYzyhxmYexkcmjk6sN97VlNizs4DoKHtBoXhu37UUb5ZM1tXuXQ/EBrp7DF2/bMF+Ev
	3YiKVHBIlBFTJwMyj9RSz9AiQZcy2sLWE34kspOZEnxNcAvGbPKEF56zHxjIc0uB0t+3xy1jsQv
	yC95Hg8iXKytIio59w/wpusKsC2NP9I6LM0AUSgVY9lmGoGHlgw=
X-Received: by 2002:a05:690e:2504:10b0:667:c15b:dab6 with SMTP id
 956f58d0204a3-6683be6aa35mr2695296d50.95.1784503219030; Sun, 19 Jul 2026
 16:20:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
 <wjbz5tp7vjrsjwjaiu3n7du5ksbrlsduuxhwg2wriyxshkrqd5@t3sdxr6ua2sg>
 <20260713123759-GKD106000@kernel.org> <CAEev2e-g3bZcohFf_7b5CaVyi0BeWi5uwLGj6MuhQXp16jiyEQ@mail.gmail.com>
 <20260713235742-GKE106000@kernel.org>
In-Reply-To: <20260713235742-GKE106000@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Sun, 19 Jul 2026 18:20:08 -0500
X-Gm-Features: AUfX_mxUPpHWs2hIHbiNCUZT8v6smWRhuvoQSN4l0SVoBHHrNzCPKAS_FyVfPXc
Message-ID: <CAEev2e_hmQBrk3Vfv4WmeH+ex_gMwW_9mgNKaUjFaiCScxAqTQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add UFS Host driver support for SpacemiT K3 SoC
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_162020_096765_1DE13A60 
X-CRM114-Status: GOOD (  33.35  )
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

SGkgWWl4dW4sCgpPbiBNb24sIEp1bCAxMywgMjAyNiBhdCA2OjU34oCvUE0gWWl4dW4gTGFuIDxk
bGFuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGkgQW5pcnVkaCwKPgo+IE9uIDA5OjU2IE1vbiAx
MyBKdWwgICAgICwgQW5pcnVkaCBTcmluaXZhc2FuIHdyb3RlOgo+ID4gSGkgWWl4dW4sCj4gPgo+
ID4gT24gTW9uLCBKdWwgMTMsIDIwMjYgYXQgNzozOOKAr0FNIFlpeHVuIExhbiA8ZGxhbkBrZXJu
ZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgQW5pcnVkaCwKPiA+ID4KPiA+ID4gT24gMjI6
NDAgU3VuIDEyIEp1bCAgICAgLCBBbmlydWRoIFNyaW5pdmFzYW4gd3JvdGU6Cj4gPiA+ID4gSGkg
WWl4dW4sCj4gPiA+ID4KPiA+ID4gPiBPbiBUaHUsIEp1bCAwMiwgMjAyNiBhdCAwMjozMTozNEFN
ICswMDAwLCBZaXh1biBMYW4gd3JvdGU6Cj4gPiA+ID4gPiBUaGlzIHNlcmllcyB0cnkgdG8gYWRk
IFVGUyBzdXBwb3J0IGZvciBTcGFjZW1pVCBLMyBTb0MsIHRoZSBjb250cm9sbGVyCj4gPiA+ID4g
PiBjb21wb25lbnRzIGNvbnNpc3RzIG9mIFN5c3RlbSBCdXMgSW50ZXJmYWNlIFVuaXQsIFVGUyBI
b3N0IENvbnRyb2xsZXIKPiA+ID4gPiA+IEludGVyZmFjZSwgVUZTIFRyYW5zcG9ydCBQcm90b2Nv
bCBMYXllciwgVUZTIEhvc3QgUmVnaXN0ZXJzLCBEZXZpY2UKPiA+ID4gPiA+IE1hbmFnZW1lbnQg
RW50aXR5IChETUUpLCBUcmFuc3BvcnQgTGF5ZXIsIE5ldHdvcmsgTGF5ZXIsIERhdGEgTGluawo+
ID4gPiA+ID4gTGF5ZXIsIFBIWSBBZGFwdGVyIExheWVyLCBhbmQgTS1QSFkgSW50ZXJmYWNlLiBB
IG1vcmUgZGV0YWlsIGZ1bmN0aW9uYWwKPiA+ID4gPiA+IGJsb2NrIGRpYWdyYW0gY2FuIGJlIGZv
dW5kIGluIFNwYWNlbWlUIHdlYnNpdGUsIGNoYXB0ZXIgOS43LjMgWzFdCj4gPiA+ID4gPgo+ID4g
PiA+ID4gUGxlYXNlIG5vdGUsIGluIG9yZGVyIHRvIHRlc3QgdGhpcyBkcml2ZXIsIHRoZSBVRlMg
Y2xvY2sgZHJpdmVyWzJdIGhlcmUKPiA+ID4gPiA+IHNob3VsZCBiZSBhcHBsaWVkIGZpcnN0IGFz
IGEgcHJlcmVxdWlzaXRlIHBhdGNoLgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uZSBrbm93biBpc3N1
ZSBpcyB0aGF0IHRoZSBkZXZpY2Ugd2lsbCBvY2Nhc2lvbmFsbHkgcmFpc2UgQktPUFMgaW50ZXJy
dXB0Cj4gPiA+ID4gPiB3aGVuIGRvaW5nIHNvbWUgaGlnaCBsb2FkIHRlc3QsIGxvZyBmcm9tIGRt
ZXNnIHNob3dzCj4gPiA+ID4gPgo+ID4gPiA+ID4gWyAgODA2LjcxMDc2M10gdWZzaGNkLXNwYWNl
bWl0IGMwZTAwMDAwLnVmc2hjOiB1ZnNoY2RfYmtvcHNfZXhjZXB0aW9uX2V2ZW50X2hhbmRsZXI6
IGRldmljZSByYWlzZWQgdXJnZW50IEJLT1BTIGV4Y2VwdGlvbiBmb3IgYmtvcHMgc3RhdHVzIDEK
PiA+ID4gPiA+Cj4gPiA+ID4gPiBMaW5rOiBodHRwczovL3NwYWNlbWl0LmNvbS9jb21tdW5pdHkv
ZG9jdW1lbnQvaW5mbz9ub2RlcGF0aD1oYXJkd2FyZS9rZXlfc3RvbmUvazMvazNfZG9jcy9rM191
c2VybWFudWFsLzA5X21lbW9yeV9zdG9yYWdlLm1kJmxhbmc9ZW4gWzFdCj4gPiA+ID4gPiBMaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA2MzAtMDYtY2xrLXVmcy1zdXBwb3J0
LXYxLTAtY2Y3NTIxZDFkMGZlQGtlcm5lbC5vcmcvIFsyXQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogWWl4dW4gTGFuIDxkbGFuQGtlcm5lbC5vcmc+Cj4gPiA+ID4KPiA+ID4gPiBJIHNlZSB0aGlz
IGR1cmluZyBwcm9iZSBvbiBhIGszLXBpY28taXR4LiBEb2VzIHRoZSBVRlMgY2hpcCBvbiBib2Fy
ZAo+ID4gPiA+IGhhdmUgYW4gUlBNQiBibG9jayBvbiBpdD8gSXMgdGhpcyBlcnJvciBvZiBhbnkg
Y29uY2Vybi4KPiA+ID4gPgo+ID4gPiBJdCdzIHByb2JhYmx5IHRydWUgb2YgaGF2aW5nIGEgUlBN
QiBibG9jaywgYnV0IG5vdCB1c2VkIGluIEszIHBsYXRmb3JtLCBzbyBjYW4gaWdub3JlCj4gPiA+
Cj4gPiA+ID4gWyAgICA1Ljk1Nzg2NF0gdWZzaGNkLXNwYWNlbWl0IGMwZTAwMDAwLnVmc2hjOiB1
ZnNoY2Rfc2NzaV9hZGRfd2x1czogQk9PVCBXTFVOIG5vdCBmb3VuZAo+IC4uCj4gPiA+ID4gWyAg
ICA1Ljk2MzMxOV0gYnVzX2FkZF9kZXZpY2U6IGNhbm5vdCBhZGQgZGV2aWNlICd1ZnNfcnBtYjAn
IHRvIHVucmVnaXN0ZXJlZCBidXMgJ3Vmc19ycG1iJwo+Cj4gSnVzdCBjaGVja2VkIGNvZGUgdW5k
ZXIgZHJpdmVycy91ZnMvLCBhbmQgY291bGRuJ3QgZmluZCB3aGVyZSB1ZnNfcnBtYiBidXMgaXMg
cmVnaXN0ZXJlZCwKPiBzbyB0aGlzIGtpbmQgb2Ygd2FybmluZy9lcnJvciBtZXNzYWdlIGlzIGV4
cGVjdGVkLCBvciBjb3VsZCBVRlMgbWFpbnRhaW5lciBjb25maXJtIHRoaXM/CgpTZWVtcyBsaWtl
IGJvdGggb2YgdGhlc2UgYXJlIGJ1Z3Mgd2l0aCB0aGUgZXhpc3RpbmcgVUZTL1JQTUIgY29kZSBp
bgp0aGUga2VybmVsLiAgVGhlIGRldl9lcnIoIkJPT1QgV0xVTiBub3QgZm91bmQiKSBwcmludCBz
aG91bGQgcHJvYmFibHkKYmUgZG93bmdyYWRlZCB0byBhIGRldl93YXJuLiBBbmQgbGlrZSB5b3Ug
bWVudGlvbmQgYWJvdmUsIHRoZSB1ZnNfcnBtYgpidXMgZG9lc24ndCBzZWVtIHRvIGJlIHJlZ2lz
dGVyZWQgYmVmb3JlIHRoZSB1ZnMgZGV2aWNlIGlzIHByb2JlZC4KCj4KPiA+ID4gPiBbICAgIDUu
OTcxMTU1XSB1ZnNoY2Qtc3BhY2VtaXQgYzBlMDAwMDAudWZzaGM6IEZhaWxlZCB0byByZWdpc3Rl
ciBVRlMgUlBNQiBkZXZpY2UgMAo+ID4gPiA+Cj4gPiA+IE1heWJlIGRpc2FibGUgQ09ORklHX1JQ
TUIgdG8gc2lsZW50IHRoaXM/IEkndmUgbm90IHRlc3RlZCB0aGlzIG9wdGlvbiBsb2NhbGx5Cj4g
Pgo+ID4gSSdtIHRlc3Rpbmcgb24gYSBkaXN0cm8gZGVmY29uZmlnLCBzbyBpdCBoYXMgdGhpcyBv
cHRpb24gZW5hYmxlZC4KPiA+Cj4gPiBJcyB0aGVyZSBhbnl0aGluZyB3ZSBjYW4gZG8gaW4gdGhl
IGRyaXZlciB0byBoYXZlIGl0IGlnbm9yZSB0aGUgUlBNQj8KPgo+IE5vLCBidXQgd2h5IG5vdCBk
aXNhYmxlIENPTkZJR19SUE1CIGluIHRoZSBmaXJzdCBwbGFjZQo+Cj4gPiBJZiB0aGUgZXJyb3Ig
aXMgYSByZWQtaGVycmluZywgd2Ugc2hvdWxkbid0IGJlIGRpc3BsYXlpbmcgaXQgYXQgYWxsIGlu
Cj4gPiB0aGUgZmlyc3QgcGxhY2UuCj4gPgo+Cj4gRWl0aGVyIGZpeCB0aGUgY29kZSBvciBqdXN0
IGlnbm9yZSBpdC4uCj4KPiAtLQo+IFlpeHVuIExhbiAoZGxhbikKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
