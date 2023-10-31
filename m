Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DA8C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 14:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/uUYlNg9EaZIf6wUpuoCTwvnMOOx2Fffahmnp8s3n4=; b=L8yL+Eu9vcKfh9
	dMyjXcH0m04lULNwv0ObSUO5Y8mQqP/OaEA6x20VDz4Xttod8M/1/H1OdLs/pY9PxDg+A/c5RAfhl
	94K/r30m3brUaOIebb2CW1XEWUvYD17sP52CX2Krc5oKB3q5IkMK9GmHzNf0/8d6mOfC4U1WdXXF2
	z4Ba8of2vG5yX2lKeqntkXcFAfdPZ+eUelNa3gde36Nsf5dp3JnMuddATN2GsDOCAFh9B6BYqLrex
	DxXQtmYzKqeJTCgNjAkNRbGkzOXH80I3ImD0eiLz6yZ91qHBNL4lm6jSJv+F1Pz5/xuWTVOlZ2/xj
	z54mmSsnl1RR+OYIAtEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpRi-005Oql-2u;
	Tue, 31 Oct 2023 14:10:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpRf-005OoE-2b
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 14:10:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698761413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OiSKB3bUSv/HS7qcY3tq6bcuqLr5aDmdwQMGjVzvqHw=;
	b=GtivCQCqtkt4GDevKA2+C3Vqf/i17R0MldiKmpp7o7l2Ma/+//44rTf6g0IwI61qSv55xq
	gx5kXaKv2ZFgiFUXl5FA3ZEsfNlS5N++avQJ9uFF4J+oWqap/chynBlgo9y1vr/ni9a9DW
	ZxqkLX4tbcG5ZfmAg7I2RKqJMKfn1T4=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-b8lpFhXpPsO2gH5ViHJ3Sw-1; Tue, 31 Oct 2023 10:10:12 -0400
X-MC-Unique: b8lpFhXpPsO2gH5ViHJ3Sw-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-1e9e1f0edebso6955621fac.2
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 07:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698761411; x=1699366211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiSKB3bUSv/HS7qcY3tq6bcuqLr5aDmdwQMGjVzvqHw=;
        b=uz8Z5ymciFUyIkdgTc5wIz73jLlRF9gTyS6+H527dagZIZOv0v6iWfd+psMeTr3fYR
         I+h5NuJHYuqs84nX1S/d6b8jX254YREefl5BEVkMpYEog4pbmL6i1euEEddF67c2WoK3
         Da+ff4xUNTi7hmyUQXc+P6rCv+nDZp5DpdTWuv2ooYBMAlO/8Q3HFiRNt0PI02h4HNyZ
         TTnE3BeiDE9d9KZKtsyzZAaP36e6Nv1JxIFilBtg68NRE3UNgFKCgGdEltvYqQCDDkKK
         rBoS0ZbRC611fYRAYV1Esklqt1P5rKLPRUmDgmUXPFQxbom4r91TkM+zvZq9rdKSeldH
         VGrQ==
X-Gm-Message-State: AOJu0YwqGmvObE7ZIZx7FzwsK4YSqehztvmABMuXLnpn9XnFPhz5Tact
	8eqsIU/g6M3i5AB9ZMunEG0umYMRxm68SrOx+YwkY7RiUurUfTHuU4bTbnvh6/fywcFs3hvw7UK
	ZZlIQ698KeRnkLYKwZcuYT5t9yncrIev7M8ym4bmjHEtF
X-Received: by 2002:a05:6871:5a88:b0:1e9:dfe4:743d with SMTP id oo8-20020a0568715a8800b001e9dfe4743dmr16139671oac.16.1698761411341;
        Tue, 31 Oct 2023 07:10:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVQuQJ/G/4ligJpilKpiM0deTmGBvpXWFGLn7D21GroXR7q47du5CgC+MS2YFpj9r2PzagWc9yGuPTTCnTCA4=
X-Received: by 2002:a05:6871:5a88:b0:1e9:dfe4:743d with SMTP id
 oo8-20020a0568715a8800b001e9dfe4743dmr16139632oac.16.1698761410950; Tue, 31
 Oct 2023 07:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2dg61z7=vsrOqwxHoV1GBvaAzcdUY4o6pLmTNM0WV5ig@mail.gmail.com>
In-Reply-To: <CAAhSdy2dg61z7=vsrOqwxHoV1GBvaAzcdUY4o6pLmTNM0WV5ig@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 31 Oct 2023 15:09:59 +0100
Message-ID: <CABgObfauR28ttiM1cmM7jU-Xn8pPM0yhcqd2pfqy-6e4xZujEQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.7
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_071015_979757_A6857437 
X-CRM114-Status: GOOD (  15.68  )
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

T24gVHVlLCBPY3QgMjQsIDIwMjMgYXQgOTo1OOKAr0FNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBXZSBoYXZlIHRoZSBmb2xsb3dpbmcg
S1ZNIFJJU0MtViBjaGFuZ2VzIGZvciA2Ljc6Cj4gMSkgU21zdGF0ZWVuIGFuZCBaaWNvbmQgc3Vw
cG9ydCBmb3IgR3Vlc3QvVk0KPiAyKSBWaXJ0dWFsaXplZCBzZW52Y2ZnIENTUiBmb3IgR3Vlc3Qv
Vk0KPiAzKSBBZGRlZCBTbXN0YXRlZW4gcmVnaXN0ZXJzIHRvIHRoZSBnZXQtcmVnLWxpc3Qgc2Vs
ZnRlc3RzCj4gNCkgQWRkZWQgWmljb25kIHRvIHRoZSBnZXQtcmVnLWxpc3Qgc2VsZnRlc3RzCj4g
NSkgVmlydHVhbGl6ZWQgU0JJIGRlYnVnIGNvbnNvbGUgKERCQ04pIGZvciBHdWVzdC9WTQo+IDYp
IEFkZGVkIFNCSSBkZWJ1ZyBjb25zb2xlIChEQkNOKSB0byB0aGUgZ2V0LXJlZy1saXN0IHNlbGZ0
ZXN0cwo+Cj4gUGxlYXNlIHB1bGwuCgpEb25lLCB0aGFua3MuCgpQYW9sbwoKPiBQbGVhc2Ugbm90
ZSB0aGF0IHRoZSBmb2xsb3dpbmcgZm91ciBwYXRjaGVzIGFyZSBwYXJ0IG9mIHRoZQo+IHNoYXJl
ZCB0YWcga3ZtLXJpc2N2LXNoYXJlZC10YWctNi43IHByb3ZpZGVkIHRvIFBhbG1lcjoKPiAgLSBk
dC1iaW5kaW5nczogcmlzY3Y6IEFkZCBaaWNvbmQgZXh0ZW5zaW9uIGVudHJ5Cj4gIC0gUklTQy1W
OiBEZXRlY3QgWmljb25kIGZyb20gSVNBIHN0cmluZwo+ICAtIGR0LWJpbmRpbmdzOiByaXNjdjog
QWRkIHNtc3RhdGVlbiBlbnRyeQo+ICAtIFJJU0MtVjogRGV0ZWN0IFNtc3RhdGVlbiBleHRlbnNp
b24KPgo+IFJlZ2FyZHMsCj4gQW51cAo+Cj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNv
bW1pdCA5NGY2ZjA1NTBjNjI1ZmFiMWYzNzNiYjg2YTY2NjliNDVlOTc0OGIzOgo+Cj4gICBMaW51
eCA2LjYtcmM1ICgyMDIzLTEwLTA4IDEzOjQ5OjQzIC0wNzAwKQo+Cj4gYXJlIGF2YWlsYWJsZSBp
biB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4KPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9rdm0tcmlz
Y3YvbGludXguZ2l0IHRhZ3Mva3ZtLXJpc2N2LTYuNy0xCj4KPiBmb3IgeW91IHRvIGZldGNoIGNo
YW5nZXMgdXAgdG8gZDljMDBmNDRlNWRlNTQyMzQwY2NlMWQwOWUyYzk5MGUxNmMwZWQzYToKPgo+
ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgU0JJIERCQ04gZXh0ZW5zaW9uIHRvIGdldC1y
ZWctbGlzdCB0ZXN0Cj4gKDIwMjMtMTAtMjAgMTY6NTA6MzkgKzA1MzApCj4KPiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
S1ZNL3Jpc2N2IGNoYW5nZXMgZm9yIDYuNwo+Cj4gLSBTbXN0YXRlZW4gYW5kIFppY29uZCBzdXBw
b3J0IGZvciBHdWVzdC9WTQo+IC0gVmlydHVhbGl6ZWQgc2VudmNmZyBDU1IgZm9yIEd1ZXN0L1ZN
Cj4gLSBBZGRlZCBTbXN0YXRlZW4gcmVnaXN0ZXJzIHRvIHRoZSBnZXQtcmVnLWxpc3Qgc2VsZnRl
c3RzCj4gLSBBZGRlZCBaaWNvbmQgdG8gdGhlIGdldC1yZWctbGlzdCBzZWxmdGVzdHMKPiAtIFZp
cnR1YWxpemVkIFNCSSBkZWJ1ZyBjb25zb2xlIChEQkNOKSBmb3IgR3Vlc3QvVk0KPiAtIEFkZGVk
IFNCSSBkZWJ1ZyBjb25zb2xlIChEQkNOKSB0byB0aGUgZ2V0LXJlZy1saXN0IHNlbGZ0ZXN0cwo+
Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+IEFuZHJldyBKb25lcyAoMyk6Cj4gICAgICAgTUFJTlRBSU5FUlM6IFJJU0Mt
VjogS1ZNOiBBZGQgYW5vdGhlciBrc2VsZnRlc3RzIHBhdGgKPiAgICAgICBLVk06IHNlbGZ0ZXN0
czogQWRkIGFycmF5IG9yZGVyIGhlbHBlcnMgdG8gcmlzY3YgZ2V0LXJlZy1saXN0Cj4gICAgICAg
S1ZNOiByaXNjdjogc2VsZnRlc3RzOiBnZXQtcmVnLWxpc3QgcHJpbnRfcmVnIHNob3VsZCBuZXZl
ciBmYWlsCj4KPiBBbnVwIFBhdGVsICgxMSk6Cj4gICAgICAgUklTQy1WOiBEZXRlY3QgWmljb25k
IGZyb20gSVNBIHN0cmluZwo+ICAgICAgIGR0LWJpbmRpbmdzOiByaXNjdjogQWRkIFppY29uZCBl
eHRlbnNpb24gZW50cnkKPiAgICAgICBSSVNDLVY6IEtWTTogQWxsb3cgWmljb25kIGV4dGVuc2lv
biBmb3IgR3Vlc3QvVk0KPiAgICAgICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBzZW52Y2Zn
IHJlZ2lzdGVyIHRvIGdldC1yZWctbGlzdCB0ZXN0Cj4gICAgICAgS1ZNOiByaXNjdjogc2VsZnRl
c3RzOiBBZGQgc21zdGF0ZWVuIHJlZ2lzdGVycyB0byBnZXQtcmVnLWxpc3QgdGVzdAo+ICAgICAg
IEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIGNvbmRvcHMgZXh0ZW5zaW9ucyB0byBnZXQtcmVn
LWxpc3QgdGVzdAo+ICAgICAgIFJJU0MtVjogQWRkIGRlZmluZXMgZm9yIFNCSSBkZWJ1ZyBjb25z
b2xlIGV4dGVuc2lvbgo+ICAgICAgIFJJU0MtVjogS1ZNOiBDaGFuZ2UgdGhlIFNCSSBzcGVjaWZp
Y2F0aW9uIHZlcnNpb24gdG8gdjIuMAo+ICAgICAgIFJJU0MtVjogS1ZNOiBBbGxvdyBzb21lIFNC
SSBleHRlbnNpb25zIHRvIGJlIGRpc2FibGVkIGJ5IGRlZmF1bHQKPiAgICAgICBSSVNDLVY6IEtW
TTogRm9yd2FyZCBTQkkgREJDTiBleHRlbnNpb24gdG8gdXNlci1zcGFjZQo+ICAgICAgIEtWTTog
cmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFNCSSBEQkNOIGV4dGVuc2lvbiB0byBnZXQtcmVnLWxpc3Qg
dGVzdAo+Cj4gTWF5dXJlc2ggQ2hpdGFsZSAoNyk6Cj4gICAgICAgUklTQy1WOiBEZXRlY3QgU21z
dGF0ZWVuIGV4dGVuc2lvbgo+ICAgICAgIGR0LWJpbmRpbmdzOiByaXNjdjogQWRkIHNtc3RhdGVl
biBlbnRyeQo+ICAgICAgIFJJU0MtVjogS1ZNOiBBZGQga3ZtX3ZjcHVfY29uZmlnCj4gICAgICAg
UklTQy1WOiBLVk06IEVuYWJsZSBTbXN0YXRlZW4gYWNjZXNzZXMKPiAgICAgICBSSVNDVjogS1ZN
OiBBZGQgc2VudmNmZyBjb250ZXh0IHNhdmUvcmVzdG9yZQo+ICAgICAgIFJJU0NWOiBLVk06IEFk
ZCBzc3RhdGVlbjAgY29udGV4dCBzYXZlL3Jlc3RvcmUKPiAgICAgICBSSVNDVjogS1ZNOiBBZGQg
c3N0YXRlZW4wIHRvIE9ORV9SRUcKPgo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9l
eHRlbnNpb25zLnlhbWwgICAgICB8ICAxMiArKwo+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vY3NyLmggICAgICAgICAgICAgICAgICAgICAgIHwgIDE4ICsrCj4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vaHdjYXAuaCAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKPiAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9rdm1faG9zdC5oICAgICAgICAgICAgICAgICAgfCAgMTggKysKPiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCAgICAgICAgICAgICAgfCAgIDcgKy0K
PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDcgKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggICAgICAgICAgICAgICAg
ICB8ICAxMiArKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgICAgICAgICAgICAg
ICAgICAgICB8ICAgMiArCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDc2ICsrKysrLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcu
YyAgICAgICAgICAgICAgICAgICAgICAgfCAgNzIgKysrKysrLQo+ICBhcmNoL3Jpc2N2L2t2bS92
Y3B1X3NiaS5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA2MSArKystLS0KPiAgYXJjaC9y
aXNjdi9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jICAgICAgICAgICAgICAgICAgfCAgMzIgKysrCj4g
IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyAgIHwgMjMz
ICsrKysrKysrKysrKystLS0tLS0tLQo+ICAxNCBmaWxlcyBjaGFuZ2VkLCA0MTggaW5zZXJ0aW9u
cygrKSwgMTM1IGRlbGV0aW9ucygtKQo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
