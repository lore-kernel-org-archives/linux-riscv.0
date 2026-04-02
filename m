Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43391D3942F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 14:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yFkZLXrHB4Lqq1Oc1m+N6VeUq+HnV2tOCfWi3P8lzfk=; b=nI0yWc6RGhEkou
	Hawl0GopRHd/Mrw4aIb2TCWsT7ulYvbJPrHkg4C5YcNAkoAlLSjp/vE4TX3ADuO8JxzTh2/Q5+Ucb
	47MabVk7laFNnwnCl1cbyFSljvrkSrhqaSdZIsTMrCxwUkJOGj28DLy6M58FjWOgj5VJHDTSep6xh
	y9YifK6rYKYq0qeS5sEURkcxzumyoeqs2cwVJReJsn4Lzk5TsXjOEGLZig07mfJYCMnI/E874yiS7
	skfnEn/+Qg+e8Q0XUM6Vr+oCCu3IxAB31PqeASmzJiU3cbU+JPg8fqQTTObBSOlzYuFlRDbGSW6yA
	3PAsWBLtKIycODi9VYKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JNs-00000000NZh-25T2;
	Thu, 02 Apr 2026 14:51:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JNd-00000000NXk-3wgT
	for linux-riscv@bombadil.infradead.org;
	Thu, 02 Apr 2026 14:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=za6pvBAfLHdL3QlDjUc6Bu/xHQp9xLt2WtsbUx+6jAc=; b=dnmm0RBb50sb2EIxj9QeJUzwfx
	ciYKwlK33yre+q0YRsN2x119jbBujLq0i2MmqEcW1lLXnzAO++64vkBeNSX+yQwxYwtz+Rw0LXXYR
	3qFZqxP5SfXiGYZZ2h345326LdyIjnR4hokc8xbu+9cAB/0tbZf4gf6kGj44BFyQnQgKb4PiPTQ3t
	iD7QwaAJmjnpgX79NzW6rhJ7FRIUYjPNTKzzCoGNVwy/j8FpCqnnlkWInjRzjf0bxEXuu13v/G7rn
	5Bh6jZYb3y82KN6Pv47CaMZshCASuuuX6e1kHN2P8HnZHfVesis7HNOHhcrhGJdj0iCXBTnhQvO+L
	Rlt2Ti2g==;
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JNS-00000002ikS-38CY
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 14:50:36 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-67bb04151dcso495639eaf.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2026 07:50:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775141433; cv=none;
        d=google.com; s=arc-20240605;
        b=EpkFzqfajwBso7OahAXBMz9j1hUlWh1NzO6/eZ0kVI4jqUkjQsl14omVFxJDPyeH56
         xtN3geF3faEU8hFgUA9AQmgE5AtFjDrdmPZF0g0XMCo+0UR3c7Kq0WGxmJ0i60SZHpRT
         jjb7MdtnCgnjV8s5fpwt7zc/1wTGtIw559nDRZAAMo5mtGICzIgmdpxL/95t5slj53PQ
         YZYaYWuYWQED34XpHFgQnWtLBVoHRJzbfobgTdhIZgQdIeQoBWYkqiKPSRto9g6XZ9u0
         gfac5Sge1dgtDxUTANBQHMvRxGPeatG97coKH5FydMpaKmvtFKpQl9utd1lHx/XR57wT
         XMpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=za6pvBAfLHdL3QlDjUc6Bu/xHQp9xLt2WtsbUx+6jAc=;
        fh=LP2CwbTparVeHgnIRtSIYN69VCODDFkX6jp9BiqfYTc=;
        b=AfocoEgsnx0lQ0948XDxvOIZlztRKWN+wj8oo6RBfmREduub8DVaeVZpxlcWo22+ap
         YNHrLZDZ3Qjj3JiDv3ZsX8bg0Z2olI77a9kTw+REyMn9QuhyKk/InWERoa9TPtwdgIOK
         liJ9jLoB983pJ8xinCX2khPJrP/g6CR7IP8oupg5+RcOssphFNNNt8Lr57M0LRqnosh3
         2rBxHsDvh8v9kDc0NSyxDc2A7YOyk47ae5rua+18c6Fxdbg14vOzaTxvmX0Ufk3/CFCV
         uvWhAHD8r1lvRQBRWDK81vXMvsQVqOeZlLmaT43of7gw46qBShNMnZEWv8kkbr9pF/M4
         Mh+g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1775141433; x=1775746233; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=za6pvBAfLHdL3QlDjUc6Bu/xHQp9xLt2WtsbUx+6jAc=;
        b=Zu9uZJP1fDw5BGukaShmk9bu41zMcEl68wbnNaK1uehpB2ODYN4BdMFa9AQskvaKFH
         VybUtpwyMG0zLlIZpDch1WBVz862E+WGuIgX3XhYtoMh6PRDWdoKjpEJpALpCr/Yd2Xg
         XAf/FmJXbBh6MkR8Eq0s679XaXbDHoeGTf4ikfg+U0IgO2apK3k4gXq3FviooChNib1D
         ZJlC+ulfBBPqfGU2GSqN1wOpzsJ5dX/gzix3US3Wc+0ZvcTd8Avi7GVp5+hyE8gu/do4
         FL6lqz3QcPp1NerdXz4WNHDaEx3ov8ph2bi4yhA91yA0U/B+0c52/5QVpHLkIyXL2p77
         +lcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141433; x=1775746233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=za6pvBAfLHdL3QlDjUc6Bu/xHQp9xLt2WtsbUx+6jAc=;
        b=gnULGZuzEV6JoMwzTm0tQNnmjGB709+P0W6tF3c6bkKZPPQ+ORIVOlinlECKYsa6lh
         j4mJ/c4yrGKDUuG8Ni+fQfpzedB1008XjsFmzxxbgXIp+H5rAdAeogVGiXlIUt2c/C+W
         bXEsVMwQKvRYuKEWAVONzHEIPA4brvCOdcH6FUd2sKRAXRgs46tOL3qpNZ+skXWw4Y0L
         7Bw+uVtKdSWkPavtWe1aYfmmwcBjbSgZQQCSEqEBJB1vPQptkSnxDMKJmOFslNy+G8nP
         hXuVxx3QmNKplJgAPTZ9Cmc6GiVZptFUdHzgLVwRZ1ted9TNs3jssceH9jM0ko4wn+UN
         RMFw==
X-Forwarded-Encrypted: i=1; AJvYcCWU2NTBjuiXWXFOYnKa2en6MLuCzizsTqzXH7a5W/3qVlZBv0ojcQTtLG8y8Z4RG4dEPtuee4WWYCqjmg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxL4RFb6NOHoFoFAx27KtCnZl2qnWBgQw1peflzwOTy3WcmF2gR
	R2T4QcWeMKj64+zhyG9pRvEYULjUdIBbeLImWxxaSoeA4dRS94AiF/j2NMNT1bkhpylEMt9+pkj
	EY+gqHvo+Ym8XMcnFhApNRaBKp+UvbhU7Mk99HG7mVw==
X-Gm-Gg: ATEYQzwsWMsNSRC2objpKs51cy2/JtaCSz8KlsKVO8B2N8E9nPwHB6ZYY176LRZ0fbg
	FzG7psiLOoVUe1ZpA/pUM/77+/BFmEsJlGUl11g9ANfe9ctnYwm3RJMbUgkVZGIhHfdIfC2mYMA
	d0MAsFCfA7qP15THczNuBcuWDoTjvtja+/TjcpXuJ7iXESNhbVquWQgpocI37bIYglHOKG0MdcN
	TFJxmWLN7u4rY8xAsze9Ru3LP0fkwn3mP/9pWzjszAjs57t2ovOhl2PxJabBKiBTRyZNFiWmWTN
	jq/cDMbXKMLmAXqG3dxaUEggEpOownRODyl/w1GDU4AvPko2sAxyoVXj7eJ1GDn9h+EcJCw/RdU
	ioTlDhM1qLSLB1wiYjCQOAYGGmA==
X-Received: by 2002:a05:6820:f02d:b0:67c:2d5e:e9dd with SMTP id
 006d021491bc7-680a7a68576mr2046653eaf.41.1775141432576; Thu, 02 Apr 2026
 07:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260402132303.6252-1-fangyu.yu@linux.alibaba.com> <20260402132303.6252-5-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260402132303.6252-5-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Apr 2026 20:20:21 +0530
X-Gm-Features: AQROBzDsAUAZSEerDJEeGwby7bjL0ghYgE-l4zOLT0yiweIOZblDgrBFsbDEbI0
Message-ID: <CAAhSdy1dXxdF0pb_r+hS+rdZ21VVxezwaZ=MCMmDD+vRCyRUdA@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	skhan@linuxfoundation.org, guoren@kernel.org, radim.krcmar@oss.qualcomm.com, 
	andrew.jones@oss.qualcomm.com, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_155035_051216_8BF7B3F4 
X-CRM114-Status: GOOD (  28.57  )
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

T24gVGh1LCBBcHIgMiwgMjAyNiBhdCA2OjUz4oCvUE0gPGZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbT4KPgo+IEFkZCBhIFZNIGNhcGFiaWxpdHkgdGhhdCBhbGxvd3MgdXNlcnNwYWNlIHRvIHNl
bGVjdCB0aGUgRy1zdGFnZSBwYWdlIHRhYmxlCj4gZm9ybWF0IGJ5IHNldHRpbmcgSEdBVFAuTU9E
RSBvbiBhIHBlci1WTSBiYXNpcy4KPgo+IFVzZXJzcGFjZSBlbmFibGVzIHRoZSBjYXBhYmlsaXR5
IHZpYSBLVk1fRU5BQkxFX0NBUCwgcGFzc2luZyB0aGUgcmVxdWVzdGVkCj4gSEdBVFAuTU9ERSBp
biBhcmdzWzBdLiBUaGUgcmVxdWVzdCBpcyByZWplY3RlZCB3aXRoIC1FSU5WQUwgaWYgdGhlIG1v
ZGUgaXMKPiBub3Qgc3VwcG9ydGVkIGJ5IHRoZSBob3N0LCBhbmQgd2l0aCAtRUJVU1kgaWYgdGhl
IFZNIGhhcyBhbHJlYWR5IGJlZW4KPiBjb21taXR0ZWQgKGUuZy4gdkNQVXMgaGF2ZSBiZWVuIGNy
ZWF0ZWQgb3IgYW55IG1lbXNsb3QgaXMgcG9wdWxhdGVkKS4KPgo+IEtWTV9DSEVDS19FWFRFTlNJ
T04oS1ZNX0NBUF9SSVNDVl9TRVRfSEdBVFBfTU9ERSkgcmV0dXJucyBhIGJpdG1hc2sgb2YgdGhl
Cj4gSEdBVFAuTU9ERSBmb3JtYXRzIHN1cHBvcnRlZCBieSB0aGUgaG9zdC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tPgo+IFJldmlld2Vk
LWJ5OiBBbmRyZXcgSm9uZXMgPGFuZHJldy5qb25lc0Bvc3MucXVhbGNvbW0uY29tPgo+IFJldmll
d2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiAtLS0KPiAgRG9jdW1lbnRhdGlv
bi92aXJ0L2t2bS9hcGkucnN0IHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGFy
Y2gvcmlzY3Yva3ZtL3ZtLmMgICAgICAgICAgICB8IDE4ICsrKysrKysrKysrKysrKystLQo+ICBp
bmNsdWRlL3VhcGkvbGludXgva3ZtLmggICAgICAgfCAgMSArCj4gIDMgZmlsZXMgY2hhbmdlZCwg
NDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QK
PiBpbmRleCAwMzI1MTY3ODNlOTYuLjlkN2Y2OTU4ZmE4MSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2Fw
aS5yc3QKPiBAQCAtODkwMiw2ICs4OTAyLDMzIEBAIGhlbHBmdWwgaWYgdXNlciBzcGFjZSB3YW50
cyB0byBlbXVsYXRlIGluc3RydWN0aW9ucyB3aGljaCBhcmUgbm90Cj4gIFRoaXMgY2FwYWJpbGl0
eSBjYW4gYmUgZW5hYmxlZCBkeW5hbWljYWxseSBldmVuIGlmIFZDUFVzIHdlcmUgYWxyZWFkeQo+
ICBjcmVhdGVkIGFuZCBhcmUgcnVubmluZy4KPgo+ICs3LjQ3IEtWTV9DQVBfUklTQ1ZfU0VUX0hH
QVRQX01PREUKPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gKwo+ICs6QXJj
aGl0ZWN0dXJlczogcmlzY3YKPiArOlR5cGU6IFZNCj4gKzpQYXJhbWV0ZXJzOiBhcmdzWzBdIGNv
bnRhaW5zIHRoZSByZXF1ZXN0ZWQgSEdBVFAgbW9kZQo+ICs6UmV0dXJuczoKPiArICAtIDAgb24g
c3VjY2Vzcy4KPiArICAtIC1FSU5WQUwgaWYgYXJnc1swXSBpcyBvdXRzaWRlIHRoZSByYW5nZSBv
ZiBIR0FUUCBtb2RlcyBzdXBwb3J0ZWQgYnkgdGhlCj4gKyAgICBoYXJkd2FyZS4KPiArICAtIC1F
QlVTWSBpZiB2Q1BVcyBoYXZlIGFscmVhZHkgYmVlbiBjcmVhdGVkIGZvciB0aGUgVk0sIGlmIHRo
ZSBWTSBoYXMgYW55Cj4gKyAgICBub24tZW1wdHkgbWVtc2xvdHMuCj4gKwo+ICtUaGlzIGNhcGFi
aWxpdHkgYWxsb3dzIHVzZXJzcGFjZSB0byBleHBsaWNpdGx5IHNlbGVjdCB0aGUgSEdBVFAgbW9k
ZSBmb3IKPiArdGhlIFZNLiBUaGUgc2VsZWN0ZWQgbW9kZSBtdXN0IGJlIHN1cHBvcnRlZCBieSBi
b3RoIEtWTSBhbmQgaGFyZHdhcmUuIFRoaXMKPiArY2FwYWJpbGl0eSBtdXN0IGJlIGVuYWJsZWQg
YmVmb3JlIGNyZWF0aW5nIGFueSB2Q1BVcyBvciBtZW1zbG90cy4KPiArCj4gK0lmIHRoaXMgY2Fw
YWJpbGl0eSBpcyBub3QgZW5hYmxlZCwgS1ZNIHdpbGwgc2VsZWN0IHRoZSBkZWZhdWx0IEhHQVRQ
IG1vZGUKPiArYXV0b21hdGljYWxseS4gVGhlIGRlZmF1bHQgaXMgdGhlIGhpZ2hlc3QgSEdBVFAu
TU9ERSB2YWx1ZSBzdXBwb3J0ZWQgYnkKPiAraGFyZHdhcmUuCj4gKwo+ICtgYEtWTV9DSEVDS19F
WFRFTlNJT04oS1ZNX0NBUF9SSVNDVl9TRVRfSEdBVFBfTU9ERSlgYCByZXR1cm5zIGEgYml0bWFz
ayBvZgo+ICtIR0FUUC5NT0RFIHZhbHVlcyBzdXBwb3J0ZWQgYnkgdGhlIGhvc3QuIEEgcmV0dXJu
IHZhbHVlIG9mIDAgaW5kaWNhdGVzIHRoYXQKPiArdGhlIGNhcGFiaWxpdHkgaXMgbm90IHN1cHBv
cnRlZC4gU3VwcG9ydGVkLW1vZGUgYml0bWFzayB1c2UgSEdBVFAuTU9ERQo+ICtlbmNvZGluZ3Mg
YXMgZGVmaW5lZCBieSB0aGUgUklTQy1WIHByaXZpbGVnZWQgc3BlY2lmaWNhdGlvbiwgc3VjaCBh
cyBTdjM5eDQKPiArY29ycmVzcG9uZHMgdG8gSEdBVFAuTU9ERT04LCBzbyB1c2Vyc3BhY2Ugc2hv
dWxkIHRlc3QgYml0bWFzayAmIEJJVCg4KS4KPiArCj4gIDguIE90aGVyIGNhcGFiaWxpdGllcy4K
PiAgPT09PT09PT09PT09PT09PT09PT09PQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3Zt
L3ZtLmMgYi9hcmNoL3Jpc2N2L2t2bS92bS5jCj4gaW5kZXggNGQ4MmE4ODYxMDJjLi41ZTgyYTNh
ZDNhZDAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdm0uYwo+ICsrKyBiL2FyY2gvcmlz
Y3Yva3ZtL3ZtLmMKPiBAQCAtMjAxLDYgKzIwMSw5IEBAIGludCBrdm1fdm1faW9jdGxfY2hlY2tf
ZXh0ZW5zaW9uKHN0cnVjdCBrdm0gKmt2bSwgbG9uZyBleHQpCj4gICAgICAgICBjYXNlIEtWTV9D
QVBfVk1fR1BBX0JJVFM6Cj4gICAgICAgICAgICAgICAgIHIgPSBrdm1fcmlzY3ZfZ3N0YWdlX2dw
YV9iaXRzKGt2bS0+YXJjaC5wZ2RfbGV2ZWxzKTsKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4g
KyAgICAgICBjYXNlIEtWTV9DQVBfUklTQ1ZfU0VUX0hHQVRQX01PREU6Cj4gKyAgICAgICAgICAg
ICAgIHIgPSBrdm1fcmlzY3ZfZ2V0X2hnYXRwX21vZGVfbWFzaygpOwo+ICsgICAgICAgICAgICAg
ICBicmVhazsKCkludHJvZHVjaW5nIGEgbmV3IFJJU0MtViBjYXBhYmlsaXR5IGxvb2tzIGEgYml0
IGNvbXBsZXguCkluc3RlYWQgb2YgS1ZNX0NBUF9SSVNDVl9TRVRfSEdBVFBfTU9ERSwgd2UgY2Fu
CnNpbXBseSByZS11c2UgS1ZNX0NBUF9WTV9HUEFfQklUUy4KClRoZSBrdm1fdm1faW9jdGxfY2hl
Y2tfZXh0ZW5zaW9uKCkgZm9yIEtWTV9DQVBfVk1fR1BBX0JJVFMKcmV0dXJuIG51bWJlciBvZiBH
UEEgYml0cyB3aGljaCBpbi1kaXJlY3RseSBpbXBsaWVzIHRoZSB1bmRlcmx5aW5nCmhnYXRwLk1P
REUuIEFzIHdlIGtub3csIGlmIGl0IHJldHVybiA1OSBiaXRzIEdQQSB0aGVuIGl0IG1lYW5zClN2
NTd4NCBpcyB0aGUgc2VsZWN0ZWQgaGdhdHAuTU9ERSBhbmQgU3Y0OHg0IGFuZCBTdjM5eDQgbW9k
ZXMKYXJlIGFsc28gc3VwcG9ydGVkIGFzLXBlciBSSVNDLVYgcHJpdmlsZWdlZCBzcGVjaWZpY2F0
aW9uLgoKVGhlIGt2bV92bV9pb2N0bF9lbmFibGVfY2FwKCkgZm9yIEtWTV9DQVBfVk1fR1BBX0JJ
VFMKd2lsbCB0YWtlIHRoZSBkZXNpcmVkIG51bWJlciBvZiBHUEEgYml0cyBhbmQgZG93bnNpemUg
dGhlIHNlbGVjdGVkCmhnYXRwLk1PREUuIEZvciBleGFtcGxlLCBpZiB1c2VyLXNwYWNlIGFzayBH
UEEgYml0cyA8PSA1MCBhbmQKR1BBIGJpdHMgPiA0MSB0aGVuIHdlIHNlbGVjdCBTdjQ4eDQuIElm
IHVzZXItc3BhY2UgYXNrIEdQQQpiaXRzIDw9IDQxIHRoZW4gd2Ugc2VsZWN0IFN2Mzl4NC4gSWYg
dXNlci1zcGFjZSBhc2sgR1BBIGJpdHMgPD0gNTkKYW5kIEdQQSBiaXRzID4gNTAgdGhlbiB3ZSBz
ZWxlY3QgU3Y1N3g0LgoKPiAgICAgICAgIGRlZmF1bHQ6Cj4gICAgICAgICAgICAgICAgIHIgPSAw
Owo+ICAgICAgICAgICAgICAgICBicmVhazsKPiBAQCAtMjExLDEyICsyMTQsMjMgQEAgaW50IGt2
bV92bV9pb2N0bF9jaGVja19leHRlbnNpb24oc3RydWN0IGt2bSAqa3ZtLCBsb25nIGV4dCkKPgo+
ICBpbnQga3ZtX3ZtX2lvY3RsX2VuYWJsZV9jYXAoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3Zt
X2VuYWJsZV9jYXAgKmNhcCkKPiAgewo+ICsgICAgICAgaWYgKGNhcC0+ZmxhZ3MpCj4gKyAgICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsKPiAgICAgICAgIHN3aXRjaCAoY2FwLT5jYXAp
IHsKPiAgICAgICAgIGNhc2UgS1ZNX0NBUF9SSVNDVl9NUF9TVEFURV9SRVNFVDoKPiAtICAgICAg
ICAgICAgICAgaWYgKGNhcC0+ZmxhZ3MpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7Cj4gICAgICAgICAgICAgICAgIGt2bS0+YXJjaC5tcF9zdGF0ZV9yZXNldCA9IHRy
dWU7Cj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICsgICAgICAgY2FzZSBLVk1fQ0FQX1JJ
U0NWX1NFVF9IR0FUUF9NT0RFOgo+ICsgICAgICAgICAgICAgICBpZiAoIWt2bV9yaXNjdl9oZ2F0
cF9tb2RlX2lzX3ZhbGlkKGNhcC0+YXJnc1swXSkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoa3ZtLT5jcmVhdGVkX3Zj
cHVzIHx8ICFrdm1fYXJlX2FsbF9tZW1zbG90c19lbXB0eShrdm0pKQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiAtRUJVU1k7Cj4gKyNpZmRlZiBDT05GSUdfNjRCSVQKPiArICAgICAg
ICAgICAgICAga3ZtLT5hcmNoLnBnZF9sZXZlbHMgPSAzICsgY2FwLT5hcmdzWzBdIC0gSEdBVFBf
TU9ERV9TVjM5WDQ7Cj4gKyNlbmRpZgo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAg
ICAgIGRlZmF1bHQ6Cj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICAgICAgICAg
fQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtLmggYi9pbmNsdWRlL3VhcGkv
bGludXgva3ZtLmgKPiBpbmRleCA4MDM2NGQ0ZGJlYmIuLmE3NGE4MGZkNDA0NiAxMDA2NDQKPiAt
LS0gYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtLmgKPiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgv
a3ZtLmgKPiBAQCAtOTg5LDYgKzk4OSw3IEBAIHN0cnVjdCBrdm1fZW5hYmxlX2NhcCB7Cj4gICNk
ZWZpbmUgS1ZNX0NBUF9BUk1fU0VBX1RPX1VTRVIgMjQ1Cj4gICNkZWZpbmUgS1ZNX0NBUF9TMzkw
X1VTRVJfT1BFUkVYRUMgMjQ2Cj4gICNkZWZpbmUgS1ZNX0NBUF9TMzkwX0tFWU9QIDI0Nwo+ICsj
ZGVmaW5lIEtWTV9DQVBfUklTQ1ZfU0VUX0hHQVRQX01PREUgMjQ4Cj4KPiAgc3RydWN0IGt2bV9p
cnFfcm91dGluZ19pcnFjaGlwIHsKPiAgICAgICAgIF9fdTMyIGlycWNoaXA7Cj4gLS0KPiAyLjUw
LjEKPgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
