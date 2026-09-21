Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5287C982E1
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 10:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G78A1M+HeUTqBpA+Yj/a/hPkXkBCef3Sl5grz0v8BG4=; b=0ya8ZH2vOOuJ8n
	Qs1ka1gHz0dj5B4yxVvB04RDnyNBKWXvfwNdprlsyYCP/TOSBzo9sriFGGa2eSKyiP9pyr5solJ5M
	8hDwuc+wtgwS1fxj4+9nTNSrRhgJecoGZF1CRriG5dHtybI511lVrDYnC3Z00kFzt9COeEOfae+qv
	gZ840I+AnFM+I+VCd+Yr6HdfEg926Ttbxw8od21ufSek52c4H4GqYFH3oXa10XHcK0fJmhLL9nNXc
	6ei8jCwCB39l28338OJFJV50nawu07ATT+j8IxRkW/k7COjLd7Kl1jhmO7ziG41R+5kHZ2yDQmoxF
	Wf/SCUqVpPUHyhpNcq4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bRP-00000001j3z-1k0g;
	Mon, 21 Sep 2026 10:40:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bRM-00000001j31-3SHo
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 10:40:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789987202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lg6lUtI5rOYqzjiYwf3NjDcPU/fuxjGZBEmVSz69a4U=;
	b=g+fYj+DYnqBr5Q0iDJQcGiTQ5UPFJGLW2vjg4MfpEnVzIHt3zhh30J8LsR4UUoLRXuozgn
	WxLXN81IZOapZ06kZvpp/CEb+VxKHN7yROfEqpjEHocYRfo0tOd+jco0vesJRJjjkxDj9Z
	NHyXJflWqRS3KQxuQm4Kp0nT+44dQag=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-02GxzbbDPjqaJ8bcWyYSew-1; Mon, 21 Sep 2026 06:40:00 -0400
X-MC-Unique: 02GxzbbDPjqaJ8bcWyYSew-1
X-Mimecast-MFC-AGG-ID: 02GxzbbDPjqaJ8bcWyYSew_1789987199
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47f2de3ba47so1975841f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 03:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789987199; x=1790591999;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lg6lUtI5rOYqzjiYwf3NjDcPU/fuxjGZBEmVSz69a4U=;
        b=e+hS/1YrHWkMITuFmVy4qkigYwCTXELQHK0Pcohi9zjro5rfoZpvmJvHlDR1N7P2IK
         NFQcI1R/lGra23lgWCXUxTdfCVjhA/ZEGyHlSlcdLZnEbVPyD9m6uW7zXw85Gck/pGWC
         FO5rycDYFR/vBTJj1innp46y1nLv1RdYae4roEHA2+plZwJJH9rYGSzBqOC5sYr9bOkj
         NcrODpb/lXaIXXOrVwxH+InZ1zvWwsu2d0bcL1185yQ6amzR01D38HjM1TyEfm+gyN5b
         ACe3t/uQAdY7LOeTPuKLc86yQ3kO9OAUFVG8//IOm5Xn8IPGHNX/VK8ofYPbGU1w4ax0
         7KwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzS2U+fWd07yvuB2DApnTESVITIaIl42s6FQPTKpynP7ryjPh8maTVfsMh7xJn1Pit848/WRTscfi+0sQ==@lists.infradead.org
X-Gm-Message-State: AFuF++niI0V9sr91PkXEXWTXdQ7l5WEn0nRhj6Ap2e5wUr7fwJSR7waZ
	20FSOKizGDT/fjUmwfVKBu6KYpdPhr5fFPDWPEEidFuAfIR2RL3Hnla176hhdxNZ/NnJtD0VFAf
	1EoeL0WItA4G0KV0O1iSKFW2/QIzMcxkGhAgsfZ6aNGguBzuL6uVPmMINKnFdsu974JHW0nXs4Z
	2dQWJlxv+5nu2PAHCbbInfdH5dUEmbzL3UA6c+wYcPAWTr
X-Gm-Gg: AYBFou3zbK1Rk3kZj29FGPPggC0kx/7OtU3qcvpVlsefdunFUIse6XL3C3Y9LrlG0hV
	jWl5wCGkucXfFIOFW3wx3kbU/7M8tTklpQfevdOsdrph8Dj02q7BYEnvQyuwmbIkANdnROLOMjc
	2wl499E8BXDSh36XMuHVHp+VLyjIWgt5fE8/lXb71nSRH+/E82+A6m9WqclUtSCskWFiXGWfuNp
	s6F3IKbnEp8QnWfWkL7x+9eMVAtdq24eufOSgZndgQMZeyF/uzI74KMjh6vNg==
X-Received: by 2002:a05:6000:2c0b:b0:487:6f0:8658 with SMTP id ffacd0b85a97d-4871e36d031mr14452304f8f.42.1789987198949;
        Mon, 21 Sep 2026 03:39:58 -0700 (PDT)
X-Received: by 2002:a05:6000:2c0b:b0:487:6f0:8658 with SMTP id
 ffacd0b85a97d-4871e36d031mr14452275f8f.42.1789987198577; Mon, 21 Sep 2026
 03:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2MbSq2eGDZfh_EKt2S3OUEn7tJRWUgvncPsWNVR7vqeg@mail.gmail.com>
In-Reply-To: <CAAhSdy2MbSq2eGDZfh_EKt2S3OUEn7tJRWUgvncPsWNVR7vqeg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 21 Sep 2026 12:39:46 +0200
X-Gm-Features: AcwNN1WJeaIYC81GTiQRJhjTHz-vJsYLRzgjmQPP8T2_2LmCGnbvuvv6NPrHA80
Message-ID: <CABgObfbL5QM0T-r1FxNsx_PEZwemk_ibALL60FdiTgpT5hX4bA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 7.3 take #1
To: Anup Patel <anup@brainfault.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"KVM RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gkDgnAhGHH5AiifU1ZjSbbh0pK-kEZh0sH8gvKphkuc_1789987199
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_034004_937280_DC8AD661 
X-CRM114-Status: GOOD (  15.53  )
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

T24gU3VuLCBTZXAgMjAsIDIwMjYgYXQgMTA6MjXigK9BTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPiB3cm90ZToKPgo+IEhpIFBhb2xvLAo+Cj4gV2UgaGF2ZSB0aGUgZm9sbG93aW5n
IGZpeGVzIGZvciB0aGUgNy4zIGtlcm5lbDoKPiAxKSBTeW5jaHJvbml6ZSBocnRpbWVyIGR1cmlu
ZyBWQ1BVIHRlYXJkb3duCj4gMikgRml4IHRoZSBjb252ZXJzaW9uIGJldHdlZW4gdnNpcCBhbmQg
aHZpcCB2YWx1ZXMKPiAzKSBTZXJpYWxpemUgSU1TSUMgYXR0cmlidXRlcyB3aXRoIHZDUFUgbWln
cmF0aW9uCj4gNCkgUmVsZWFzZSB1bnVzZWQgcGFnZSBhZnRlciBNTVUgaW52YWxpZGF0aW9uCj4g
NSkgUHJvcGFnYXRlIGludGVycnVwdGVkIEctc3RhZ2UgZmF1bHRzIHRvIEtWTSB1c2VyLXNwYWNl
Cj4gNikgRml4IE5BQ0wgaGZlbmNlIGVudHJ5IHVwZGF0ZSBvcmRlcgo+IDcpIEZpeCBzZGF0YSBs
ZWFrIGFuZCBzdGFsZSBzbmFwc2hvdF9hZGRyIGluIFBNVSBzbmFwc2hvdF9zZXRfc2htZW0KPiA4
KSBQcmVzZXJ2ZSBmaXJtd2FyZSBjb3VudGVyIHZhbHVlIGFjcm9zcyBQTVUgY291bnRlciBzdG9w
L3N0YXJ0Cj4gOSkgUmVwb3J0IFBNVSBzbmFwc2hvdCB3cml0ZSBmYWlsdXJlIHRvIHRoZSBndWVz
dAo+IDEwKSBGaXggcGVyZi1iYWNrZWQgY291bnRlciBhY2NvdW50aW5nIGFjcm9zcyBQTVUgc3Rv
cCBhbmQgcmVhZAo+IDExKSBGaXggSFNNIGhhcnQgc3RhdHVzIGVycm9yIHByb3BhZ2F0aW9uCj4K
PiBBcyB5b3UgY2FuIHNlZSwgdGhlIGZpeGVzIGFyZSBhbGwgb3ZlciB0aGUgcGxhY2UgZXhjZXB0
IHF1aXRlCj4gZmV3IG9mIHRoZW0gKDQgZml4ZXMpIGZvY3VzIG9ubHkgb24gU0JJIFBNVSBleHRl
bnNpb24uCj4KPiBQbGVhc2UgcHVsbC4KClB1bGxlZCwgdGhhbmtzLgoKUGFvbG8KCj4gUmVnYXJk
cywKPiBBbnVwCj4KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGZkNzNmNGE2
NjU5ODk3MTkxZmEwZDQwNjk1ZmUzNzA5MjVkZDM3ODA6Cj4KPiAgIExpbnV4IDcuMy1yYzMgKDIw
MjYtMDktMTMgMTQ6Mzg6MDIgLTA3MDApCj4KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVw
b3NpdG9yeSBhdDoKPgo+ICAgaHR0cHM6Ly9naXRodWIuY29tL2t2bS1yaXNjdi9saW51eC5naXQg
dGFncy9rdm0tcmlzY3YtZml4ZXMtNy4zLTEKPgo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1
cCB0byA0MWU4MWY3ZTNlZjk2NTk0ZmI4NDA0NDUzNDNjMGVlNzcyM2FhNTUwOgo+Cj4gICBSSVND
LVY6IEtWTTogRml4IEhTTSBoYXJ0IHN0YXR1cyBlcnJvciBwcm9wYWdhdGlvbiAoMjAyNi0wOS0x
NSAxODo1NTo1MSArMDUzMCkKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBLVk0vcmlzY3YgZml4ZXMgZm9yIDcuMywg
dGFrZSAjMQo+Cj4gLSBTeW5jaHJvbml6ZSBocnRpbWVyIGR1cmluZyBWQ1BVIHRlYXJkb3duCj4g
LSBGaXggdGhlIGNvbnZlcnNpb24gYmV0d2VlbiB2c2lwIGFuZCBodmlwIHZhbHVlcwo+IC0gU2Vy
aWFsaXplIElNU0lDIGF0dHJpYnV0ZXMgd2l0aCB2Q1BVIG1pZ3JhdGlvbgo+IC0gUmVsZWFzZSB1
bnVzZWQgcGFnZSBhZnRlciBNTVUgaW52YWxpZGF0aW9uCj4gLSBQcm9wYWdhdGUgaW50ZXJydXB0
ZWQgRy1zdGFnZSBmYXVsdHMgdG8gS1ZNIHVzZXItc3BhY2UKPiAtIEZpeCBOQUNMIGhmZW5jZSBl
bnRyeSB1cGRhdGUgb3JkZXIKPiAtIEZpeCBzZGF0YSBsZWFrIGFuZCBzdGFsZSBzbmFwc2hvdF9h
ZGRyIGluIHNuYXBzaG90X3NldF9zaG1lbQo+IC0gUHJlc2VydmUgZmlybXdhcmUgY291bnRlciB2
YWx1ZSBhY3Jvc3MgUE1VIGNvdW50ZXIgc3RvcC9zdGFydAo+IC0gUmVwb3J0IFBNVSBzbmFwc2hv
dCB3cml0ZSBmYWlsdXJlIHRvIHRoZSBndWVzdAo+IC0gRml4IHBlcmYtYmFja2VkIGNvdW50ZXIg
YWNjb3VudGluZyBhY3Jvc3MgUE1VIHN0b3AgYW5kIHJlYWQKPiAtIEZpeCBIU00gaGFydCBzdGF0
dXMgZXJyb3IgcHJvcGFnYXRpb24KPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBNeWVvbmdodW4gUGFrICgxKToKPiAg
ICAgICBSSVNDLVY6IEtWTTogU3luY2hyb25pemUgaHJ0aW1lciBjYWxsYmFjayBkdXJpbmcgdGVh
cmRvd24KPgo+IFNldW5nSnUgQ2hlb24gKDMpOgo+ICAgICAgIFJJU0MtVjogS1ZNOiBQcmVzZXJ2
ZSBmaXJtd2FyZSBjb3VudGVyIHZhbHVlIGFjcm9zcyBzdG9wL3N0YXJ0Cj4gICAgICAgUklTQy1W
OiBLVk06IFJlcG9ydCBzbmFwc2hvdCB3cml0ZSBmYWlsdXJlIHRvIHRoZSBndWVzdAo+ICAgICAg
IFJJU0MtVjogS1ZNOiBGaXggcGVyZi1iYWNrZWQgY291bnRlciBhY2NvdW50aW5nIGFjcm9zcyBz
dG9wIGFuZCByZWFkCj4KPiBUYW4gQ2hpICgxKToKPiAgICAgICBSSVNDLVY6IEtWTTogRml4IEhT
TSBoYXJ0IHN0YXR1cyBlcnJvciBwcm9wYWdhdGlvbgo+Cj4gWGllIEJvICgzKToKPiAgICAgICBS
SVNDLVY6IEtWTTogU2VyaWFsaXplIElNU0lDIGF0dHJpYnV0ZXMgd2l0aCB2Q1BVIG1pZ3JhdGlv
bgo+ICAgICAgIFJJU0MtVjogS1ZNOiBSZWxlYXNlIHVudXNlZCBwYWdlIGFmdGVyIE1NVSBpbnZh
bGlkYXRpb24KPiAgICAgICBSSVNDLVY6IEtWTTogUHJvcGFnYXRlIGludGVycnVwdGVkIEctc3Rh
Z2UgZmF1bHRzCj4KPiBZaWNvbmcgWWFuZyAoMSk6Cj4gICAgICAgUklTQy1WOiBLVk06IEZpeCB0
aGUgY29udmVyc2lvbiBiZXR3ZWVuIHZzaXAgYW5kIGh2aXAKPgo+IFpvbmdtaW4gWmhvdSAoMik6
Cj4gICAgICAgS1ZNOiByaXNjdjogRml4IE5BQ0wgaGZlbmNlIGVudHJ5IHVwZGF0ZSBvcmRlcgo+
ICAgICAgIFJJU0MtVjogS1ZNOiBGaXggc2RhdGEgbGVhayBhbmQgc3RhbGUgc25hcHNob3RfYWRk
ciBpbiBzbmFwc2hvdF9zZXRfc2htZW0KPgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5o
ICAgICAgIHwgMjAgKysrKysrKysrKysrKysrLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfaW1z
aWMuYyAgICAgICAgIHwgMTEgKysrKysrKystLQo+ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyAgICAg
ICAgICAgICAgIHwgMTAgKysrKysrKystLQo+ICBhcmNoL3Jpc2N2L2t2bS9uYWNsLmMgICAgICAg
ICAgICAgIHwgMjAgKysrKysrKysrKysrKysrLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMg
ICAgICAgICAgICAgIHwgIDMgKy0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhpdC5jICAgICAg
ICAgfCAgMiArLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAgICAgIHwgIDggKysr
LS0tLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYyAgICAgICAgICB8IDQxICsrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2Jp
X2hzbS5jICAgICAgfCAgNCArKy0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfdGltZXIuYyAgICAg
ICAgfCAgNSArKysrLQo+ICB0b29scy9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oIHwgMjAg
KysrKysrKysrKysrKysrLS0tLQo+ICAxMSBmaWxlcyBjaGFuZ2VkLCAxMDEgaW5zZXJ0aW9ucygr
KSwgNDMgZGVsZXRpb25zKC0pCj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
