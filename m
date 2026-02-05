Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD67EC1EAC
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 12:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YZ6BtVoWhDv0V60pciU63xQ1UQ/rCBdA+1W14xDgKEo=; b=vu8Fw9oFDC2QC1
	FWjio+KW3rabIFY19wTaTL2oEagDSRl+85iRGu7/kjd1dcv5+OVfdGP4r0/mNvkRUTaRsebZtIGw7
	e8gW0D70Zw+VjjvHxSXfEvsI5Ok7D9e5PrG4UJJDFo5EgDlySE9M2Biq+yy2cBQDPyFLL2j3AOR/t
	bAG/x/zg0gKk5SFV04ccXYUGOCG/Dc4+MD6JEbhrb8pbQE9UULER4K908ykb6jCiiDFLwEY5yiSAB
	a+Ps0i5RXWaa1BclDhM9zcN+gGCaYcryktq7J5kstwNoSqgzvR00bgFEtaDEGP+hgEYuQOBFFV4B2
	LQLXv2VnX9lfzjTcL00g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnyUf-00000009saH-0EH2;
	Thu, 05 Feb 2026 12:29:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnyUc-00000009sZf-2jym
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 12:29:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E3C9943A2A
	for <linux-riscv@lists.infradead.org>; Thu,  5 Feb 2026 12:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78DDC2BC86
	for <linux-riscv@lists.infradead.org>; Thu,  5 Feb 2026 12:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770294592;
	bh=k4nSW4Q0rMAqBWVmxqOJB3hO6+6EhWt2+qxsOU2aLMU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=c2g7gqC8TdKK1/kQpnpFj6EdspnDH05bfQ70icritOeGghWZnUekc33XzjpkASX4A
	 4RAxLtHodHmMItU4YYsplf2RQVQdNPJ2dRcLU+Vb25XjQ0ystFJsWzZTQKjYVJtdgq
	 WFHizAg5w7+3fmrW1TCPRoXjr1lHe6fmnEpZ9K2ZU9gcn0RbORAeULL4z+gEUmuQqy
	 EIQN/P2hkc5emK3RG4u3ROCAZn2j/CqWjt5qH5mFHOazkKLs/pVicKlX081pMjhRNV
	 tN49t2a6H59Ex3oW6BzXvUgOhDhLngYptIb6Dy703MJEq2IJOdfo8EFadyR+0iJ0HJ
	 o49YfZw1FpOgg==
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so9757535e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 04:29:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU76VFKMQEg0YSy3EsTXEJxnCHaTEsUW/CWL8oYUvEtEr+7TBMEfLDEuCI4zfQRjm35cCBClyWB3CyQtw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQveADpTqOOgC2ofQFOJildKkwIeq00/f7hJWPMmvrVsLn22tV
	f4PP02C5eutmGiyybBw0oMetwGv5Oam+eLiKHEp4/9PB4yzn+E+5GQoOy5FA09p2u11fYheF++6
	PApa5U+FT8wj4NXq65+1d/S+RPlJ/XJA=
X-Received: by 2002:a05:600c:4e0e:b0:480:20f1:7abd with SMTP id
 5b1f17b1804b1-4830e98d3c3mr106303735e9.31.1770294591248; Thu, 05 Feb 2026
 04:29:51 -0800 (PST)
MIME-Version: 1.0
References: <20260205121625.716-1-cp0613@linux.alibaba.com>
In-Reply-To: <20260205121625.716-1-cp0613@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 5 Feb 2026 20:29:38 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTDKC-3+Vv_gLP9xTx0b6YMs-e3K5eBvW8=oBdRBuUOLg@mail.gmail.com>
X-Gm-Features: AZwV_Qhpj6PG9ZOjAowLn0EmaQhQ9M4TlQR_WuRxALnZ61hKeXT0mw4lRc440N0
Message-ID: <CAJF2gTTDKC-3+Vv_gLP9xTx0b6YMs-e3K5eBvW8=oBdRBuUOLg@mail.gmail.com>
Subject: Re: [PATCH] riscv: smp: Align secondary_start_sbi to 4 bytes
To: cp0613@linux.alibaba.com
Cc: pjw@kernel.org, anup@brainfault.org, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_042954_769456_D3DE30A7 
X-CRM114-Status: GOOD (  19.65  )
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

T24gVGh1LCBGZWIgNSwgMjAyNiBhdCA4OjE24oCvUE0gPGNwMDYxM0BsaW51eC5hbGliYWJhLmNv
bT4gd3JvdGU6Cj4KPiBGcm9tOiBDaGVuIFBlaSA8Y3AwNjEzQGxpbnV4LmFsaWJhYmEuY29tPgo+
Cj4gRHVyaW5nIFNNUCBib290LCB0aGUgc2Vjb25kYXJ5X3N0YXJ0X3NiaSBhZGRyZXNzIGlzIHBh
c3NlZCB0byB0aGUKPiBzbGF2ZSBjb3JlIHZpYSBzYmlfaHNtX2hhcnRfc3RhcnQuIEluIE9wZW5T
QkksIHRoaXMgYWRkcmVzcyBpcwo+IHdyaXR0ZW4gdG8gU1RWRUMgaW4gc2JpX2hhcnRfc3dpdGNo
X21vZGUuCj4KPiBBY2NvcmRpbmcgdG8gdGhlIHByaXZpbGVnZWQgc3BlY2lmaWNhdGlvbiwgdGhl
IEJBU0UgZmllbGQgb2YgU1RWRUMKPiBtdXN0IGFsd2F5cyBiZSBhbGlnbmVkIG9uIGEgNC1ieXRl
IGJvdW5kYXJ5LiBIb3dldmVyLCBTeXN0ZW0ubWFwCj4gcmV2ZWFscyB0aGF0IHNlY29uZGFyeV9z
dGFydF9zYmkgaXMgbm90IGEgNC1ieXRlIGFsaWduZWQgYWRkcmVzcy4KPgo+IEZvciBleGFtcGxl
LCB0aGUgYWRkcmVzcyBvZiBzZWNvbmRhcnlfc3RhcnRfc2JpIGlzCj4gMHhmZmZmZmZmZjgwMDAx
MDY2LCBhbmQgdGhlIGRpc2Fzc2VtYmx5IGlzIGFzIGZvbGxvd3M6Cj4KPiBEdW1wIG9mIGFzc2Vt
YmxlciBjb2RlIGZyb20gMHhmZmZmZmZmZjgwMDAxMDUyIHRvIDB4ZmZmZmZmZmY4MDAwMTA3YToK
PiAgICAweGZmZmZmZmZmODAwMDEwNTIgPF9zdGFydCs0MTc4PjogICAgYy5ub3AgICAtMTEKPiAg
ICAweGZmZmZmZmZmODAwMDEwNTQgPF9zdGFydCs0MTgwPjogICAgYXVpcGMgICBncCwweDFhMWYK
PiAgICAweGZmZmZmZmZmODAwMDEwNTggPF9zdGFydCs0MTg0PjogICAgYWRkaSAgICBncCxncCw4
NAo+ICAgIDB4ZmZmZmZmZmY4MDAwMTA1YyA8X3N0YXJ0KzQxODg+OiAgICBjc3J3ICAgIHNhdHAs
YTIKPiAgICAweGZmZmZmZmZmODAwMDEwNjAgPF9zdGFydCs0MTkyPjogICAgc2ZlbmNlLnZtYQo+
ICAgIDB4ZmZmZmZmZmY4MDAwMTA2NCA8X3N0YXJ0KzQxOTY+OiAgICByZXQKPiAgICAweGZmZmZm
ZmZmODAwMDEwNjYgPF9zdGFydCs0MTk4PjogICAgY3NydyAgICBzaWUsemVybwo+ICAgIDB4ZmZm
ZmZmZmY4MDAwMTA2YSA8X3N0YXJ0KzQyMDI+OiAgICBjc3J3ICAgIHNpcCx6ZXJvCj4gICAgMHhm
ZmZmZmZmZjgwMDAxMDZlIDxfc3RhcnQrNDIwNj46ICAgIGxpICAgICAgdDAsMgo+ICAgIDB4ZmZm
ZmZmZmY4MDAwMTA3MCA8X3N0YXJ0KzQyMDg+OiAgICBjc3J3ICAgIHNjb3VudGVyZW4sdDAKPiAg
ICAweGZmZmZmZmZmODAwMDEwNzQgPF9zdGFydCs0MjEyPjogICAgYXVpcGMgICBncCwweDFhMWYK
PiAgICAweGZmZmZmZmZmODAwMDEwNzggPF9zdGFydCs0MjE2PjogICAgYWRkaSAgICBncCxncCw1
Mgo+Cj4gV2hlbiB3cml0aW5nIHRvIFNUVkVDIGF0IGFkZHJlc3MgMHhmZmZmZmZmZjgwMDAxMDY2
LCB0aGUgYWN0dWFsCj4gd3JpdGUgYWRkcmVzcyBpcyAweGZmZmZmZmZmODAwMDEwNjQsIGNvcnJl
c3BvbmRpbmcgdG8gdGhlIGFkZHJlc3MKPiBvZiB0aGUgcHJldmlvdXMgcmV0IGluc3RydWN0aW9u
LiBUaGlzIGlzIHVuZXhwZWN0ZWQsIGFuZCBpZiBhbgo+IGludGVycnVwdCBvY2N1cnMgYXQgdGhp
cyBwb2ludCwgaXQgd2lsbCBjYXVzZSB1bnByZWRpY3RhYmxlIHJlc3VsdHMuCj4KPiBIb3dldmVy
LCBzZWNvbmRhcnlfc3RhcnRfc2JpIGltbWVkaWF0ZWx5IG1hc2tzIGFsbCBpbnRlcnJ1cHRzIGFu
ZAo+IHVwZGF0ZXMgU1RWRUMsIHNvIG5vIHByb2JsZW1zIG9jY3VycmVkLgo+Cj4gSW4gc3VtbWFy
eSwgaXQgaXMgbW9yZSByZWFzb25hYmxlIHRvIG1ha2Ugc2Vjb25kYXJ5X3N0YXJ0X3NiaQo+IHNh
dGlzZnkgNC1ieXRlIGFsaWdubWVudC4KPgo+IFNpZ25lZC1vZmYtYnk6IENoZW4gUGVpIDxjcDA2
MTNAbGludXguYWxpYmFiYS5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL2hlYWQuUyB8
IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKPiBpbmRl
eCBiZGYzMzUyYWNmNGMuLmYzNWRiZmE3OTUwNSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tl
cm5lbC9oZWFkLlMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKPiBAQCAtMTI0LDYg
KzEyNCw3IEBAIHJlbG9jYXRlX2VuYWJsZV9tbXU6Cj4KPiAgICAgICAgIHJldAo+ICAjZW5kaWYg
LyogQ09ORklHX01NVSAqLwo+ICsuYWxpZ24gMgo+ICAjaWZkZWYgQ09ORklHX1NNUAo+ICAgICAg
ICAgLmdsb2JhbCBzZWNvbmRhcnlfc3RhcnRfc2JpCj4gIHNlY29uZGFyeV9zdGFydF9zYmk6Cj4g
LS0KPiAyLjUwLjEKPgoKSW4gTGludXgvYXJjaC9yaXNjdi9rZXJuZWwvY3B1X29wc19zYmkuYzoK
dW5zaWduZWQgbG9uZyBib290X2FkZHIgPSBfX3BhX3N5bWJvbChzZWNvbmRhcnlfc3RhcnRfc2Jp
KTsKcmV0dXJuIHNiaV9oc21faGFydF9zdGFydChoYXJ0aWQsIGJvb3RfYWRkciwgaHNtX2RhdGEp
OwoKT3BlblNCSSBzZXRzIGJvb3RfYWRkciB0byBib3RoIHNlcGMgYW5kIHN0dmFsLCBhbmQgc3R2
YWwgcmVxdWlyZXMKNC1ieXRlIGFsaWdubWVudC4KClJldmlld2VkLWJ5OiBHdW8gUmVuIChBbGli
YWJhIERBTU8gQWNhZGVteSkgPGd1b3JlbkBrZXJuZWwub3JnPgoKLS0gCkJlc3QgUmVnYXJkcwog
R3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
