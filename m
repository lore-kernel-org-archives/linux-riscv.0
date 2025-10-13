Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D95BCCA476
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 03:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KxcX8QjUMtECLPZhPltOsfKv3A728uxjV9hGKqUoAw0=; b=K6Wky3O0lDwshI
	YGkz+GV83VW8ZkIN+qlyLM9t3+tPC9CmW0ECH1bK7oYR7g3pcF3O7Efb9kLTuS07mZ7YzSl9L+I6S
	Wdcu5Dwke7HGMrM1KK3/Uz9rfQGLPo+Bfo4nY3YYMjnB5pqTqVBaToHUADklTHv2sYjorNaKWvidO
	wsnY25dvOYeYennN26h2CVRVRc1rSBP9AancMeHjPEygNMBKi9OIoY6m/uro6vdxKA+gxYLIiU6lp
	0gz0f+gho4ueS8G3LmqlZ5VBfWllM/yBcrE08juGjPALzu0A2dHCdFAL/Lh4e43c4hFMDkjuKbp7N
	3NO6/oHSGcpElXd3Xgqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v89PJ-0000000CALY-3hC1;
	Mon, 13 Oct 2025 03:39:33 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v89PG-0000000CALD-2taT
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 03:39:32 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-586883eb9fbso5022839e87.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Oct 2025 20:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760326768; x=1760931568; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdYDMI1cPsHPTmJq6cygabE7rcNaTT2li88ZbEVvWJs=;
        b=P7lXIUe3kdVK2AGUaFml6Qy7/hSn+dyy2b2KhENMNSlbaBVC0FKpflfMncAeItIMhD
         mrWhaeFc+DcHiJLDSf3JQQi+j0kZGSwTXdsN3KKKg4RhriQzIT2irbqJUwUgIl5ICSkw
         950L9QIVWOyJz2jSKv2tURu36K8x7hXZ5puTxUulsn6RC3igjDk8IMXjdIi/pqvE+gKl
         lZARE6ijNDMJe0v1d8MTqUTlwKgg3CJtko9b7Z6jylmhmB1tdtTk4lbOwrIkksg3YT2G
         fjeZHNPKWKpAovmsHpgfJdbQiTYWDAbWLTJzJpaqJPIltKlePf6x2fuoK3w+P6xebZbE
         27mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760326768; x=1760931568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdYDMI1cPsHPTmJq6cygabE7rcNaTT2li88ZbEVvWJs=;
        b=NBOfTIgeWWkxMzqjHOCJkAcSTL44MlIplYILsR58viUfv1da8kecXuj2Owel3XlkF7
         Xxt8kF+8maVFTE4SU2LiTVdki3xNG7epkbbHJezbNNb+8vZWm4ZkC1XjO2JDRYFmzrqn
         Kvr/VB2P6nAESdxOSjZvOtquzS2mf8+txYce99xU3LqN8+5cu2qPTwmIR9OH0GQRXHsa
         Vh9qlTwgA/aJ0lkX5DOrBIp2pUY4Z4r0890hR2Z5GkcDXNMQ2h5KgFIc5Nf/eyCNYRsZ
         XV5aMY4u7cJrE64QUK94FptFZ/yoaC16VFXqabiMxDpucZYQwwfy4QxPmzL7LzZXUkPk
         UfOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUijeAnrxjsm/dtvua7ds1fdUqPyVIQMWZ3IeUuWsgUFDTp76P6jPSMzqNeK9xwrqqMhWVmybJAwZfmuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdRR5DySKDfL4SBHOP1oXy1hL3SgKogJ+EGa6dcaP15+rLBbz2
	eB9XcmfZB0IXxYxzsMHGwhtsFSKnQvB2l1S5lq0rF4z05th7iSO1V1E87XB/qqlruf/ymibvYIK
	OedB/wl5RWIhLB9Pk0X9U4UijpzC18ki8xFLs4cy4qw==
X-Gm-Gg: ASbGncveW9NGqzwrkX8G/jty6EM84WDrZG7J+fpskjpQ8a92YTjiYMRBJjyQyuS6iEs
	xXP+F56+pB0dDzAAeRfNoCqW7jHjzxSu7eoPpVB2qVoTRDs7wRM/Aju/p4YPlyIOEDjcGxTsoeD
	MGZ3yJ+6iAfP/wLtISkND4BQ2Bku2CEZw6FOlGYetEWktAy4A12bKeSL5PLWPyvt541qrc//uIf
	F76a6+uY653sn9ozKIRmtmqWH4hs5y3DkUd
X-Google-Smtp-Source: AGHT+IG90Qs1cuEh/SOfMtoLKRBVLNz8WEj78axMy76hDwp0zuW58bmlhJgm6WrlO/WHIWexRZc5ywYS+8FNmR+AxyI=
X-Received: by 2002:a05:6512:6c6:b0:58b:274:d04 with SMTP id
 2adb3069b0e04-5906dae5fdbmr6328127e87.42.1760326767858; Sun, 12 Oct 2025
 20:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20251011155746.1558731-1-guoren@kernel.org> <CAK9=C2UrYg+sHsDqkmz7f7KnaREU7hXF4rbON002cnAti_pDXg@mail.gmail.com>
 <CAJF2gTR9VbOcBQOfF6Tqsp00289mypYExi2iGeKhwTu-iDS+aA@mail.gmail.com> <CAJF2gTRwW+0-nAvagfBf8U9vbUWocvCaNfYNVrCN+d2hYxdBYg@mail.gmail.com>
In-Reply-To: <CAJF2gTRwW+0-nAvagfBf8U9vbUWocvCaNfYNVrCN+d2hYxdBYg@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 13 Oct 2025 09:09:14 +0530
X-Gm-Features: AS18NWAR5tMxamwivdBEhgrVec_x0u_27L-8bMr6wG6pbIHJBE2zcpGixkVg2YM
Message-ID: <CAK9=C2XT1S=nb5LPVUJ=_2NtHjx1ABrwzjv2G_edYzFi46bA+Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add pgprot_dmacoherent definition
To: Guo Ren <guoren@kernel.org>
Cc: samuel.holland@sifive.com, david@redhat.com, yongxuan.wang@sifive.com, 
	cuiyunhui@bytedance.com, luxu.kernel@bytedance.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, palmer@dabbelt.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_203930_755357_4FB3531C 
X-CRM114-Status: GOOD (  22.38  )
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

T24gTW9uLCBPY3QgMTMsIDIwMjUgYXQgNjowMOKAr0FNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgT2N0IDEzLCAyMDI1IGF0IDc6NTDigK9BTSBHdW8gUmVu
IDxndW9yZW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gU3VuLCBPY3QgMTIsIDIwMjUg
YXQgMTE6NTHigK9QTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6
Cj4gPiA+Cj4gPiA+IE9uIFNhdCwgT2N0IDExLCAyMDI1IGF0IDk6MjjigK9QTSA8Z3VvcmVuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gRnJvbTogIkd1byBSZW4gKEFsaWJhYmEg
REFNTyBBY2FkZW15KSIgPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4gPiA+Cj4gPiA+ID4gUklTQy1W
IFN2cGJtdCBTdGFuZGFyZCBFeHRlbnNpb24gZm9yIFBhZ2UtQmFzZWQgTWVtb3J5IFR5cGVzCj4g
PiA+ID4gZGVmaW5lcyB0aHJlZSBtb2RlczoKPiA+ID4gPgo+ID4gPiA+ICBNb2RlIHwgVmFsdWUg
fCBSZXF1ZXN0ZWQgTWVtb3J5IEF0dHJpYnV0ZXMKPiA+ID4gPiAgUE1BICB8ICAgMCAgIHwgTm9u
ZQo+ID4gPiA+ICBOQyAgIHwgICAxICAgfCBOb24tY2FjaGVhYmxlLCBpZGVtcG90ZW50LCB3ZWFr
bHktb3JkZXJlZCAoUlZXTU8pLAo+ID4gPiA+ICAgICAgIHwgICAgICAgfCBtYWluIG1lbW9yeQo+
ID4gPiA+ICBJTyAgIHwgICAyICAgfCBOb24tY2FjaGVhYmxlLCBub24taWRlbXBvdGVudCwgc3Ry
b25nbHktb3JkZXJlZAo+ID4gPiA+ICAgICAgIHwgICAgICAgfCAoSS9PIG9yZGVyaW5nKSwgSS9P
Cj4gPiA+ID4KPiA+ID4gPiBUaGUgcGdwcm90X2RtYWNvaGVyZW50IGRlZmF1bHQgdXNlcyB0aGUg
SU8gbWVtb3J5IGF0dHJpYnV0ZSBpZiB0aGVyZQo+ID4gPiA+IGlzIG5vIGFzbSBkZWZpbml0aW9u
LCBidXQgSU8gaXMgbm90IGZvciBtYWluIG1lbW9yeSBhY2NvcmRpbmcgdG8KPiA+ID4gPiBTdnBi
bXQgcnVsZXMuCj4gPiA+ID4KPiA+ID4gPiBUaGlzIGNvbW1pdCBjb3JyZWN0cyBwZ3Byb3RfZG1h
Y29oZXJlbnQgd2l0aCB0aGUgTkMgbWVtb3J5IGF0dHJpYnV0ZSwKPiA+ID4gPiB3aGljaCBzYXRp
c2ZpZXMgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQgYW5kIHByZXZlbnRzIHVzaW5nIHRoZSBJTwo+
ID4gPiA+IGF0dHJpYnV0ZSB0byBhY2Nlc3MgbWFpbiBtZW1vcnkuCj4gPiA+ID4KPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBHdW8gUmVuIChBbGliYWJhIERBTU8gQWNhZGVteSkgPGd1b3JlbkBrZXJu
ZWwub3JnPgo+ID4gPgo+ID4gPiBJIGhhZCBzZW50IHRoZSBzYW1lIHBhdGNoIG9uIEF1ZyAyMCBh
bmQgeW91IGhhZCBwcm92aWRlZAo+ID4gPiBUZXN0ZWQtYnkgdG8gdGhhdCBwYXRjaC4KPiA+ID4K
PiA+ID4gSWYgeW91IGhhZCBjb25jZXJucyB3aXRoIG15IHBhdGNoIHRoZW4geW91IGNvdWxkIGhh
dmUgcHJvdmlkZWQKPiA+ID4gY29tbWVudHMgYnV0IHlvdSBjaG9vc2UgdG8gaGlqYWNrIGl0IGFu
ZCBjaGFuZ2UgYXV0aG9yc2hpcC4KPiA+IEkgZGlkbid0IGZpbmQgeW91ciBwYXRjaCBhdCBmaXJz
dCwgc28gSSBzZW50IGl0IG91dC4gV2hlbiBJIGRpc2NvdmVyZWQKPiA+IHlvdXIgcGF0Y2gsIEkg
Z2F2ZSB0aGUgVGVzdGVkLWJ5IHRvIHlvdXJzLgo+ID4gSSd2ZSBhZGRlZCB0aGUgYWJhbmRvbmVk
IHJlcGx5IHRvIHRoaXMgdGhyZWFkLiBIYXZlIHlvdSBzZWVuIHRoYXQgWzFdPwo+ID4KPiA+IFsx
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FKRjJnVFJmTHpycUhvWXJleFM1NUFUM3Nq
bjVWYmJOS2YyV01FR1dydzlFUlJMWVlBQG1haWwuZ21haWwuY29tLwo+Cj4gVGhpcyBwYXRjaCBp
cyBvbiBTYXQsIE9jdCAxMSwgMjAyNSBbMV0KPiBHdW8ncyBUZXN0ZWQtYnkgaXMgb24gU3VuLCAx
MiBPY3QgMjAyNSAwMjowNzozNCBbMl0KPiBBYmFuZG9uIHJlcGx5IGlzIG9uIFN1biwgMTIgT2N0
IDIwMjUgMTQ6MTE6NDIgWzNdCj4gR2FvJ3MgVGVzdGVkLWJ5IGlzIG9uIFN1biwgMTIgT2N0IDIw
MjUgMTg6MDA6MzYgWzRdCj4KPiBbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1
MTAxMTE1NTc0Ni4xNTU4NzMxLTEtZ3VvcmVuQGtlcm5lbC5vcmcvCj4gWzJdOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9hT3RSMzlwbDV4anlZSG4xQGdtYWlsLmNvbS8KPiBb
M106IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQUpGMmdUUmZMenJxSG9ZcmV4UzU1QVQz
c2puNVZiYk5LZjJXTUVHV3J3OUVSUkxZWUFAbWFpbC5nbWFpbC5jb20vCj4gWzRdOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8wMzEzOTVGRS1DNTFDLTQ1QTctODVBMy1DQzRB
MjVFQjYwNjZAZ21haWwuY29tLwo+Cj4gSSBhbHNvIGFza2VkIEdhbyB0byBub3RpY2UgeW91ciBw
YXRjaCBhbmQgZ2l2ZSBpdCB0aGUgVGVzdGVkLWJ5IHRhZy4KPiBUaGF0J3Mgd2h5IHlvdSBnb3Qg
dHdvIFRlc3RlZC1ieSBvbiBPY3QgMTIgYWZ0ZXIgdHdvIG1vbnRocy4gU28sIHlvdXIKPiByZXBs
eSwgImJ1dCB5b3UgY2hvb3NlIHRvIGhpamFjayBpdCBhbmQgY2hhbmdlIGF1dGhvcnNoaXAsIiBt
YWtlcyBtZQo+IHNhZC4KClBsZWFzZSBoYXZlIGJldHRlciBjb29yZGluYXRpb24gYW1vbmcgeW91
cnNlbHZlcyBiZWZvcmUKc2VuZGluZyBvdXQgcGF0Y2hlcy4KCkl0IG1ha2VzIG1lIHNhZCB3aGVu
IHBlb3BsZSBibGluZGx5IHNlbmQgcGF0Y2hlcyB3aXRob3V0Cm5vdGljaW5nIGV4aXN0aW5nIG9y
IG9uLWdvaW5nIHdvcmsuIFNvbWV0aW1lcyBpdCBhbHNvIGhhcHBlbnMKdGhhdCBwZW9wbGUgYXJl
IGFscmVhZHkgd29ya2luZyBvbiB0aGluZ3Mgd2hpY2ggdGhleSBoYXZlCmFubm91bmNlZCBpbiB0
aGUgYXBwcm9wcmlhdGUgUklTRSBXRyBvciBSVkkgVEcvU0lHLgoKLS0KQW51cAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
