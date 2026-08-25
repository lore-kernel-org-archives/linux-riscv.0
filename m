Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB8EC5DF81
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 01:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A58Lx8oVW5M+ptYGtr01dXs/tbVA4tfEZZ7Di9/vx3c=; b=YA9148xuERsHxq
	/BwmWHLfOHE9FA2owXHy17iqjYZ8IPaDRSzLT0SioOBtg/ZNkYol9rPbJN048nU/YVcIs4XsRAiK0
	aOA8mBF9BfTNCyU+3ns4Rp/Opa3xdlGXRRdrAXjlUa1+MEKbFMfaT+a9bfWsF6O3hDt3CdzoZd0Ks
	D6xbwhm+Ea0vdXOthmlXs7FbfkVHvP5nQF39rQizpVBnBcvlRmBx9xpTNWgLKYC067YSUV9vKEMM4
	UWRHgtpx825wCGtjFl270kB/DLuIIgxItY6xi2IHxpn1LhnSJdQx6a0Imltd7F+OhlEx42CgL5xZa
	UKfFW6W3FpVcG4ue8Lww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyfdv-0000000Hawt-2vRZ;
	Tue, 25 Aug 2026 01:07:59 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyfdt-0000000HawX-2A5U
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 01:07:58 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49954b88fffso33023725e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Aug 2026 18:07:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787620075; cv=none;
        d=google.com; s=arc-20260327;
        b=KcfUScTQmA8uHWryLZxV8iv7M2yE/ZQncaKkpsbHG5nJBrSjQO953gZONaHoM+jKXl
         qqLpzekApByP6qXZoGa1JfocbyaGlkFeryArpanW1oyKqvdnb2Di3uh+rPb2Rd/dcYKT
         G0la05Q/Yzl/VO0ON4V56Hz6d3W3/8ls5oS4AFO4FhGhSqwWL7nFqnQlaX449XaV9pSl
         6M+ac3lxru5PdxC9F14rb4mPY1g0S7LucHPb9ZCGCnwBD2YzxFsCDqIwRqJi5/cC8asF
         GJcDxl/ZLyOpUMyoA6hCRLOJD6VLytEuR7FjRmMm5q9TEC+YlHqL9Vqs0NBTHUcSq5gM
         UK2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M1+csfMsmmHJyopa5SSrRnzEy+OE71MsTOFhYQn3jiw=;
        fh=vNRPTEmmhqJGIFEOLTExSoypliHGRfhTYu95W95svFY=;
        b=dak36Uz+HS2Flny+TLVxo10l6vKem7tt7vrsv+oEvCbhJL8sDKVMOtOBKiF5Zq9cp0
         0IYEIk4617KVSxg19oJU5lvSIqaXhGU/cfhRRU7+dTb3IFMlIK4FLjWZ3ziNTCTFDSfw
         ge/cuJS57WdiTo7ZbXMatOrBhklY1W80bC6MhBSVN7+Ee0qUjWXPZs9wcvJiIDUVjhPZ
         V+YBsfR5mm+s7iUtN7U0TfI1wsEXn0vy9cpNVAj9xcf89MyOgLaQTFNkPXtLe+w8VxrV
         sFBXYIWUumrwFXNn2bYH4tViqHA8As1JFSLjNcsFeKyfoVuCilM1ps8gdhvlwia4QPoe
         vqwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1787620075; x=1788224875; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M1+csfMsmmHJyopa5SSrRnzEy+OE71MsTOFhYQn3jiw=;
        b=eSpHA+njWeiWJD4dr0yeN/DZ2AJT5XXvBhvJWh/CXOD7Zh9K0NRqCq67E4fqiXH5n0
         Mr3Y5hVFZOBJlGrGieG9bVTJbeAo0q6TXSOt8r+NGceUsQJAJIIyvMnIMRLUkhl4YxQy
         +c5P75aPQ2XfaL2NnSCJr6uCXLNzd1HhPwb1Bn979cVtGu3CR1zI3NQum6R4AGrUrIWd
         1j4hU6nSZnE2Stw9ienmjjeKSmJmSk1IQa1l6p3ZeRMgzWXLkUAL8Dwp5f8/LQ4n53AJ
         R3T2bCFcvZNf2dCpPhC+VcSjikvDbmwVsfxYRlqql8kArTssMqRTNcmPfqTMiAW89nkl
         70AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787620075; x=1788224875;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1+csfMsmmHJyopa5SSrRnzEy+OE71MsTOFhYQn3jiw=;
        b=P2nNwPNIhw39UX8FVU9/h8HdnW2KtkNkwz9lb+d7MSjSnqI7HMGN5NrYfgBr0I5F8Z
         wFENVJuzga4823rr96oNRRKIZxeYu0Cen9lUpnTdbYdFR469H/7ZzeIrdbW5vQUNgoNT
         0hJIZGhyKB9cbOej7ojMjWbFtcNhT0pj7DGSw9rny1ekeEushWQbzeJHjzpXH8ZbfVtT
         5U3s2OIEr6DaPpKS1mB43sJhiKYCaFEIzQnX1BvF1vvPu8jksea4e1MmvkGIz35zt+hm
         R6eZNDw5fUkOPyQaE512U6TCbL4YGejz+qiGZy+0ejekimNGSRlu4fTAw/w8bmwvr8tN
         /NZw==
X-Forwarded-Encrypted: i=1; AHgh+RrE2oBtXEgdVY3J8YObx2zQLysJ/3ioCememKOzOa+nebc75rimkC+5LMF89dG1HuMnNU5rod9lyV44HQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lk0uZi5meKXo3z2+vTz+WLC+DP4FlMg26klYg0zEp3t+F2eihg
	rJ9c015Og5aDTxT5+ajPD1k03ayLOZHizisKMH+rwOJWy74dX3mO+KMHI3t5kPy/Q7aGHqNt7yk
	pgoBTWERrvp1GEJ6L7J+Lou1L6HYyKz5VCn66O+VtQQ==
X-Gm-Gg: AR+sD12MDtIIU0nqoxwcInmwnrA5zA9haW7JiyRMfeG0ljfviZ4x5KDBxq6+XYnS/Ba
	HVCRW4/uQwLNYVmd5GRK3Nw4o6iwhlQ38Bum/lZgxEPPKv2wMhM8NuMMhgF2gLAidES87p2q9rA
	7p5k0qFt5WJ9sJe1LDL72zpXNOgocMzE4wG0L0nhhdzLpP7Kdhu/ubyoswgQ/JXBsDMediI/KK9
	uEi82NDCkVTqpY/QibftbBx/bChAfVtMPmQqkB9oxVkRc7IkNsEGcJZZg6aQWUv8dvIUiLYJTLK
	QQOgT2OGJtK47ldFwuEQtMRlSM0OO7IqEDYynSmoU9X6ElVfNCzhZ/hUWeKBWeJwxCcwq4SPGfG
	KmdJYXcQGPMmuTY7rHdJoDBFCeoPSxi7g4Dal9JfOdvFwZtT++/1bAPhF5V/7L1sX
X-Received: by 2002:a05:6000:601:b0:482:a8b1:aa6d with SMTP id
 ffacd0b85a97d-482c81bd354mr29734926f8f.10.1787620074801; Mon, 24 Aug 2026
 18:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260823051430.530304-1-liutong@iscas.ac.cn>
In-Reply-To: <20260823051430.530304-1-liutong@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 24 Aug 2026 18:07:42 -0700
X-Gm-Features: AcwNN1XHB4B5CGJ6bdJJTTF08jMwM62T5l_JzRxeXdxXsC_OC82kOnrPpTM1430
Message-ID: <CAAhSdy2J9_6k2V=o+oPaHfUqWqjMwQ-bVrZhFfzzB1Y0=PN50g@mail.gmail.com>
Subject: Re: [PATCH] mailbox: riscv-sbi-mpxy: Fix inverted notification loop
To: liutong <liutong@iscas.ac.cn>
Cc: Rahul Pathak <rpathak@ventanamicro.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_180757_602545_AEB04918 
X-CRM114-Status: GOOD (  17.28  )
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

T24gU2F0LCBBdWcgMjIsIDIwMjYgYXQgMTA6MTTigK9QTSBsaXV0b25nIDxsaXV0b25nQGlzY2Fz
LmFjLmNuPiB3cm90ZToKPgo+IEluIG1weHlfbWJveF9wZWVrX3JwbWlfZGF0YSgpLCB0aGUgd2hp
bGUgbG9vcCBjb25kaXRpb24gY2hlY2tzOgo+Cj4gICAoZXZlbnRzX2RhdGFfbGVuIC0gcG9zKSA8
PSBzaXplb2YoKmV2ZW50KQo+Cj4gVGhpcyBpcyBpbnZlcnRlZC4gVGhlIGxvb3Agc2hvdWxkIGNv
bnRpbnVlIHdoaWxlIHRoZXJlIGlzIGVub3VnaAo+IHJlbWFpbmluZyBkYXRhIHRvIGhvbGQgYXQg
bGVhc3Qgb25lIGV2ZW50IGhlYWRlciwgaS5lLiA+PS4gV2l0aCA8PQo+IHRoZSBsb29wIGJvZHkg
aXMgZW50ZXJlZCBvbmx5IHdoZW4gdGhlIHJlbWFpbmluZyBkYXRhIGlzIHNtYWxsZXIgdGhhbgo+
IG9uZSBoZWFkZXIsIHdoaWNoIGlzIG5ldmVyIHVzZWZ1bC4gSW4gcHJhY3RpY2UsIHNpbmNlIGV2
ZW50c19kYXRhX2xlbgo+IGlzIGFsd2F5cyBsYXJnZXIgdGhhbiBzaXplb2YoKmV2ZW50KSAoNCBi
eXRlcyksIHRoZSBjb25kaXRpb24gaXMgZmFsc2UKPiBvbiB0aGUgZmlyc3QgaXRlcmF0aW9uIGFu
ZCB0aGUgbG9vcCBpcyBuZXZlciBlbnRlcmVkLgo+Cj4gQWxsIFJQTUkgbm90aWZpY2F0aW9uIGV2
ZW50cyBhcmUgc2lsZW50bHkgZHJvcHBlZC4KPgo+IEZpeCB0aGUgY29uZGl0aW9uIGZyb20gPD0g
dG8gPj0uCj4KPiBGaXhlczogYmYzMDIyYTRlYjExICgibWFpbGJveDogQWRkIFJJU0MtViBTQkkg
bWVzc2FnZSBwcm94eSAoTVBYWSkgYmFzZWQgbWFpbGJveCBkcml2ZXIiKQo+IFNpZ25lZC1vZmYt
Ynk6IGxpdXRvbmcgPGxpdXRvbmdAaXNjYXMuYWMuY24+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFu
dXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGRy
aXZlcnMvbWFpbGJveC9yaXNjdi1zYmktbXB4eS1tYm94LmMgfCAyICstCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWFpbGJveC9yaXNjdi1zYmktbXB4eS1tYm94LmMgYi9kcml2ZXJzL21haWxib3gvcmlzY3Yt
c2JpLW1weHktbWJveC5jCj4gaW5kZXggN2M5YzAwNmI3Li4xOGRhOWVmY2MgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9tYWlsYm94L3Jpc2N2LXNiaS1tcHh5LW1ib3guYwo+ICsrKyBiL2RyaXZlcnMv
bWFpbGJveC9yaXNjdi1zYmktbXB4eS1tYm94LmMKPiBAQCAtNDgwLDcgKzQ4MCw3IEBAIHN0YXRp
YyB2b2lkIG1weHlfbWJveF9wZWVrX3JwbWlfZGF0YShzdHJ1Y3QgbWJveF9jaGFuICpjaGFuLAo+
ICAgICAgICAgc3RydWN0IHJwbWlfbWJveF9tZXNzYWdlIG1zZzsKPiAgICAgICAgIHVuc2lnbmVk
IGxvbmcgcG9zID0gMDsKPgo+IC0gICAgICAgd2hpbGUgKHBvcyA8IGV2ZW50c19kYXRhX2xlbiAm
JiAoZXZlbnRzX2RhdGFfbGVuIC0gcG9zKSA8PSBzaXplb2YoKmV2ZW50KSkgewo+ICsgICAgICAg
d2hpbGUgKHBvcyA8IGV2ZW50c19kYXRhX2xlbiAmJiAoZXZlbnRzX2RhdGFfbGVuIC0gcG9zKSA+
PSBzaXplb2YoKmV2ZW50KSkgewo+ICAgICAgICAgICAgICAgICBldmVudCA9IChzdHJ1Y3QgcnBt
aV9ub3RpZmljYXRpb25fZXZlbnQgKikobm90aWYtPmV2ZW50c19kYXRhICsgcG9zKTsKPgo+ICAg
ICAgICAgICAgICAgICBtc2cudHlwZSA9IFJQTUlfTUJPWF9NU0dfVFlQRV9OT1RJRklDQVRJT05f
RVZFTlQ7Cj4gLS0KPiAyLjM0LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
