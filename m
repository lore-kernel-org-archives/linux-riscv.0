Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614F7D730A3
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 06:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fdcBnaVomEytYKVWBdV5/6jEKJ0Y5XyL9voTNPauQ9I=; b=nxMXkJgoYbOloY
	5nGGkFAadIXwkpB9GvGTkWupn5jhY++n9m/WMsya47gIopuSHH/Tz1rA+Bd2ARPgQS/7m74TZk0Mz
	fiuTXT3jjoDw9Shg56qyHUXiNTnUrXXpC4KMWk51moJOr0xfytr+UeUXOOifYs7rUKumd/2Nr83ZX
	9lJQHf/PLTrDYaxTuRYCjqHzHS3VFSu+rILQ1tZIMigEEn3v4QkY2P6SJj+PNtQmOLV7ye29Aean2
	CDfQv3aDLDXMEYhmP8tDaXkjPZqFiTQR7SDT4knZuNZ9nx+Ir5/UQuy7qXc4DkHQJUmBmE+BTMYr4
	lvEFNAIuaUX2hNNjyXTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8XsM-00000001Nyn-0lQE;
	Fri, 03 Apr 2026 06:19:26 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8XsJ-00000001Ny8-36fx
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 06:19:25 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-5062fc5d86aso15204381cf.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2026 23:19:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775197162; cv=none;
        d=google.com; s=arc-20240605;
        b=ImmhHA3I6eGNC8xJfQMwKQiQzrop8jcuTYFFrYdS9BDvLvhrfGQBQv5MpnFCpvUhYx
         1GAwWWtsTYtw94dm8dcM1IvXJ1n4j4/Y1YNmEP6ZZxmRIVtLWooGaRbiLz5OSZ/zO5wo
         zuyASAqKqY/f0+R/5K1wIDjhDIFxKyHX8wH0KTjyPu13SE+5bZd4YF0S0fMaj6x3zs8B
         VNdUf/4SY0ncPZtnUX5WSkfe1Kzt9ItbjFC7PR6Wy0OfNx+EZZVcscK+VcRn6DNi+WI4
         WozBHtJV8fsANFomjOo34eK9bJa/YFRVI3Xxl+LeR2bF9t2JPWJSeB1ffBr+fq29PXag
         hVjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kx6Vr/oJKHrL9MwhUSHyoeKfqKn3quqamoeA29dEegU=;
        fh=1WcchsU9rUsJ/VDbfsi2Z01LBcve3vM+0WUOGNoRRNQ=;
        b=Pq33j4cgf42+3ZaZ46JBSGVwV3TJtkOLv3gmSDGHzkQLNnjxi+MT3c5HhFd3jErPm8
         nZCkHO7IaDmD3LUXFB+NY1XeX34OkIgIS7l6zNKgct0nHUZnsiavef2zoQY8piNUKeIp
         t5m9Rf6Z1KyMfdbEqm5bVB2V+wae6n4FOks8WMCeoYYtNEWw8dPI3hEY4GUiNeSLR9y8
         q9YJDttp4mTmR8+irG9abHjU16CTR14FUB0bGlXVF54uJiLCgKRAX4DuwdciWe8XCPKU
         z+/RCpgjcRoSE3vryhOlzy0krMO1lRRxL8XxvcSLpGwBewsnUdfj/hhHhtnJix4jJysz
         dGzA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775197162; x=1775801962; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kx6Vr/oJKHrL9MwhUSHyoeKfqKn3quqamoeA29dEegU=;
        b=gTo1EDMYXsIXY6xtENxZt8zZ1CaQUD411NiaK+7jg0fYSmOwTDrHK6uwztTFYKp0Fe
         DBL1u/zxrE6nHAKKJmQ+9QdxJYXf3+2ZJtr3m7Csx+QQV9CfMOpIAhZb/JO+AqjRiCVe
         8W0a+F/JyUvX0gVKi9HxGsGK1k70wCsKUQcJPEGtp06C2jxhJEx/hUhOn3jN0iWsUMpb
         wQaXwqWWaNQhcCdmk4C5VxEtSGCcvv8D8KfgkIjb7Sb9t8s7WfdxJ5lAcT6dwu3m/D9E
         Wntky+79+CTPrMSjsaoHGPPd34jewbvgb2JppOuDbtNZ+h/L/0CONx8Aku7eibq1k49s
         WjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775197162; x=1775801962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kx6Vr/oJKHrL9MwhUSHyoeKfqKn3quqamoeA29dEegU=;
        b=hHnUeBPwnq3XJih1y43nNAe+nGs1i2YEUwJdtsmO6bouQysDXqciJuxs4JHQtmQwtI
         mWLwfxuROWp1gG27NhI5Bfm+WNMohrZjZvVgGqO8+TY5yNTXOjWQXmPqdCatqs40uBEr
         Bj62dRuk1iRAh/o9sTG9/xVzPLskIVCCK9jI/AgB1VyP8xLNKisI0nT8hr9/ORn0y8SY
         vSyOssdC9Dfokko7RcAy8Tz+rUpkO6NezGqWc65JpU/3RcT6KgX96JcHjAb9LutWrc9d
         6qImpQO5WG6v5UHWVQaGuRSfO2+Z3BTqqQ8r6x6nc4DC9dbBc/Ab1irYmhBBmtik3w1E
         Gq6g==
X-Forwarded-Encrypted: i=1; AJvYcCXPbYP2uYLYtm4Dyp8Mt7FUDgBZbHMNUfYm9XoPMlDtLyGuxrwoNvzK/zTBserAwZpmKxE9Gsp5fDCvLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHMax6JzqoOti+q2ExTQ6/5egHxBpFFIXGEnE3fkaaCKQLzna+
	c5gZ+tq2CVaPHs1Q9ZOLDOFEsHM9cfJzDukJ19ZwN4UK8lHzqcCK1RUyfsgT6h/Z0xeirY6BJnl
	Wxa4Jk7by8w1VriiWpaY6OQNvQDWLtD+6gOGeIZvvxw==
X-Gm-Gg: ATEYQzyFSWFnnN0Xl9aWK9QYsvBCJI/WMDmsnYNW2ZjPQ1zYJ5Xe89y0plAFXneDYaC
	n1xIGrZ6+W3q7Z5l9dCPum9S+ttGDigK3c3ufBEct0S904q7A+cFChH3Q/rKeA3dmXcXWtwAt0A
	9GugzhNmENm0z/GamAkxzqPLb3rwDWnQoBEVZ5Fs8Q9E62Ptlcrt25BxZfQuF52nfNzWnHN8q8L
	fy3kfZGMzRjBV0dAKvvvPEQAwtIrPVuiJuivNpkH/P6sQaASJT3DcIDtGVp4BjuMDEA172pFOpK
	DfeJ+O17LgNHzwCrJ++CDqex6ji2YahYWRxg9ZT+R0Rjn0rxqEZC7SIx+qBX4h7vOp32OKIimB+
	oDDSAgjku4+llpJ2hGpPazzAIQRngrfPuuL/e
X-Received: by 2002:a05:622a:a50e:b0:50b:4e72:aa9 with SMTP id
 d75a77b69052e-50d6262d1c3mr24848491cf.9.1775197161880; Thu, 02 Apr 2026
 23:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260403013137.32604-1-fangyu.yu@linux.alibaba.com> <20260403020249.36676-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260403020249.36676-1-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Apr 2026 11:49:09 +0530
X-Gm-Features: AQROBzB9uVaLIXyFCjKCGQ2JYilonAcViQ8zVbduiOvK0F0aOryvQlhRofsaDPE
Message-ID: <CAAhSdy2CibJNXJYxCvyofXC3CUpCT5KdricNt2aViRSYCOWrrA@mail.gmail.com>
Subject: Re: Re: Re: [PATCH v7 4/4] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr, andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, 
	atish.patra@linux.dev, corbet@lwn.net, guoren@kernel.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org, 
	radim.krcmar@oss.qualcomm.com, skhan@linuxfoundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_231924_048944_EF4DC483 
X-CRM114-Status: GOOD (  34.33  )
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

T24gRnJpLCBBcHIgMywgMjAyNiBhdCA3OjMy4oCvQU0gPGZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbT4gd3JvdGU6Cj4KPiA+Pk9uIFRodSwgQXByIDIsIDIwMjYgYXQgNjo1M+KAr1BNIDxmYW5n
eXUueXVAbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+ID4+Pgo+ID4+PiBGcm9tOiBGYW5neXUg
WXUgPGZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT4KPiA+Pj4KPiA+Pj4gQWRkIGEgVk0gY2Fw
YWJpbGl0eSB0aGF0IGFsbG93cyB1c2Vyc3BhY2UgdG8gc2VsZWN0IHRoZSBHLXN0YWdlIHBhZ2Ug
dGFibGUKPiA+Pj4gZm9ybWF0IGJ5IHNldHRpbmcgSEdBVFAuTU9ERSBvbiBhIHBlci1WTSBiYXNp
cy4KPiA+Pj4KPiA+Pj4gVXNlcnNwYWNlIGVuYWJsZXMgdGhlIGNhcGFiaWxpdHkgdmlhIEtWTV9F
TkFCTEVfQ0FQLCBwYXNzaW5nIHRoZSByZXF1ZXN0ZWQKPiA+Pj4gSEdBVFAuTU9ERSBpbiBhcmdz
WzBdLiBUaGUgcmVxdWVzdCBpcyByZWplY3RlZCB3aXRoIC1FSU5WQUwgaWYgdGhlIG1vZGUgaXMK
PiA+Pj4gbm90IHN1cHBvcnRlZCBieSB0aGUgaG9zdCwgYW5kIHdpdGggLUVCVVNZIGlmIHRoZSBW
TSBoYXMgYWxyZWFkeSBiZWVuCj4gPj4+IGNvbW1pdHRlZCAoZS5nLiB2Q1BVcyBoYXZlIGJlZW4g
Y3JlYXRlZCBvciBhbnkgbWVtc2xvdCBpcyBwb3B1bGF0ZWQpLgo+ID4+Pgo+ID4+PiBLVk1fQ0hF
Q0tfRVhURU5TSU9OKEtWTV9DQVBfUklTQ1ZfU0VUX0hHQVRQX01PREUpIHJldHVybnMgYSBiaXRt
YXNrIG9mIHRoZQo+ID4+PiBIR0FUUC5NT0RFIGZvcm1hdHMgc3VwcG9ydGVkIGJ5IHRoZSBob3N0
Lgo+ID4+Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51eC5h
bGliYWJhLmNvbT4KPiA+Pj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YW5kcmV3LmpvbmVz
QG9zcy5xdWFsY29tbS5jb20+Cj4gPj4+IFJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2Vy
bmVsLm9yZz4KPiA+Pj4gLS0tCj4gPj4+ICBEb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3Qg
fCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+Pj4gIGFyY2gvcmlzY3Yva3ZtL3Zt
LmMgICAgICAgICAgICB8IDE4ICsrKysrKysrKysrKysrKystLQo+ID4+PiAgaW5jbHVkZS91YXBp
L2xpbnV4L2t2bS5oICAgICAgIHwgIDEgKwo+ID4+PiAgMyBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0IGIvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0
Cj4gPj4+IGluZGV4IDAzMjUxNjc4M2U5Ni4uOWQ3ZjY5NThmYTgxIDEwMDY0NAo+ID4+PiAtLS0g
YS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QKPiA+Pj4gKysrIGIvRG9jdW1lbnRhdGlv
bi92aXJ0L2t2bS9hcGkucnN0Cj4gPj4+IEBAIC04OTAyLDYgKzg5MDIsMzMgQEAgaGVscGZ1bCBp
ZiB1c2VyIHNwYWNlIHdhbnRzIHRvIGVtdWxhdGUgaW5zdHJ1Y3Rpb25zIHdoaWNoIGFyZSBub3QK
PiA+Pj4gIFRoaXMgY2FwYWJpbGl0eSBjYW4gYmUgZW5hYmxlZCBkeW5hbWljYWxseSBldmVuIGlm
IFZDUFVzIHdlcmUgYWxyZWFkeQo+ID4+PiAgY3JlYXRlZCBhbmQgYXJlIHJ1bm5pbmcuCj4gPj4+
Cj4gPj4+ICs3LjQ3IEtWTV9DQVBfUklTQ1ZfU0VUX0hHQVRQX01PREUKPiA+Pj4gKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4+PiArCj4gPj4+ICs6QXJjaGl0ZWN0dXJlczog
cmlzY3YKPiA+Pj4gKzpUeXBlOiBWTQo+ID4+PiArOlBhcmFtZXRlcnM6IGFyZ3NbMF0gY29udGFp
bnMgdGhlIHJlcXVlc3RlZCBIR0FUUCBtb2RlCj4gPj4+ICs6UmV0dXJuczoKPiA+Pj4gKyAgLSAw
IG9uIHN1Y2Nlc3MuCj4gPj4+ICsgIC0gLUVJTlZBTCBpZiBhcmdzWzBdIGlzIG91dHNpZGUgdGhl
IHJhbmdlIG9mIEhHQVRQIG1vZGVzIHN1cHBvcnRlZCBieSB0aGUKPiA+Pj4gKyAgICBoYXJkd2Fy
ZS4KPiA+Pj4gKyAgLSAtRUJVU1kgaWYgdkNQVXMgaGF2ZSBhbHJlYWR5IGJlZW4gY3JlYXRlZCBm
b3IgdGhlIFZNLCBpZiB0aGUgVk0gaGFzIGFueQo+ID4+PiArICAgIG5vbi1lbXB0eSBtZW1zbG90
cy4KPiA+Pj4gKwo+ID4+PiArVGhpcyBjYXBhYmlsaXR5IGFsbG93cyB1c2Vyc3BhY2UgdG8gZXhw
bGljaXRseSBzZWxlY3QgdGhlIEhHQVRQIG1vZGUgZm9yCj4gPj4+ICt0aGUgVk0uIFRoZSBzZWxl
Y3RlZCBtb2RlIG11c3QgYmUgc3VwcG9ydGVkIGJ5IGJvdGggS1ZNIGFuZCBoYXJkd2FyZS4gVGhp
cwo+ID4+PiArY2FwYWJpbGl0eSBtdXN0IGJlIGVuYWJsZWQgYmVmb3JlIGNyZWF0aW5nIGFueSB2
Q1BVcyBvciBtZW1zbG90cy4KPiA+Pj4gKwo+ID4+PiArSWYgdGhpcyBjYXBhYmlsaXR5IGlzIG5v
dCBlbmFibGVkLCBLVk0gd2lsbCBzZWxlY3QgdGhlIGRlZmF1bHQgSEdBVFAgbW9kZQo+ID4+PiAr
YXV0b21hdGljYWxseS4gVGhlIGRlZmF1bHQgaXMgdGhlIGhpZ2hlc3QgSEdBVFAuTU9ERSB2YWx1
ZSBzdXBwb3J0ZWQgYnkKPiA+Pj4gK2hhcmR3YXJlLgo+ID4+PiArCj4gPj4+ICtgYEtWTV9DSEVD
S19FWFRFTlNJT04oS1ZNX0NBUF9SSVNDVl9TRVRfSEdBVFBfTU9ERSlgYCByZXR1cm5zIGEgYml0
bWFzayBvZgo+ID4+PiArSEdBVFAuTU9ERSB2YWx1ZXMgc3VwcG9ydGVkIGJ5IHRoZSBob3N0LiBB
IHJldHVybiB2YWx1ZSBvZiAwIGluZGljYXRlcyB0aGF0Cj4gPj4+ICt0aGUgY2FwYWJpbGl0eSBp
cyBub3Qgc3VwcG9ydGVkLiBTdXBwb3J0ZWQtbW9kZSBiaXRtYXNrIHVzZSBIR0FUUC5NT0RFCj4g
Pj4+ICtlbmNvZGluZ3MgYXMgZGVmaW5lZCBieSB0aGUgUklTQy1WIHByaXZpbGVnZWQgc3BlY2lm
aWNhdGlvbiwgc3VjaCBhcyBTdjM5eDQKPiA+Pj4gK2NvcnJlc3BvbmRzIHRvIEhHQVRQLk1PREU9
OCwgc28gdXNlcnNwYWNlIHNob3VsZCB0ZXN0IGJpdG1hc2sgJiBCSVQoOCkuCj4gPj4+ICsKPiA+
Pj4gIDguIE90aGVyIGNhcGFiaWxpdGllcy4KPiA+Pj4gID09PT09PT09PT09PT09PT09PT09PT0K
PiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZtLmMgYi9hcmNoL3Jpc2N2
L2t2bS92bS5jCj4gPj4+IGluZGV4IDRkODJhODg2MTAyYy4uNWU4MmEzYWQzYWQwIDEwMDY0NAo+
ID4+PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92bS5jCj4gPj4+ICsrKyBiL2FyY2gvcmlzY3Yva3Zt
L3ZtLmMKPiA+Pj4gQEAgLTIwMSw2ICsyMDEsOSBAQCBpbnQga3ZtX3ZtX2lvY3RsX2NoZWNrX2V4
dGVuc2lvbihzdHJ1Y3Qga3ZtICprdm0sIGxvbmcgZXh0KQo+ID4+PiAgICAgICAgIGNhc2UgS1ZN
X0NBUF9WTV9HUEFfQklUUzoKPiA+Pj4gICAgICAgICAgICAgICAgIHIgPSBrdm1fcmlzY3ZfZ3N0
YWdlX2dwYV9iaXRzKGt2bS0+YXJjaC5wZ2RfbGV2ZWxzKTsKPiA+Pj4gICAgICAgICAgICAgICAg
IGJyZWFrOwo+ID4+PiArICAgICAgIGNhc2UgS1ZNX0NBUF9SSVNDVl9TRVRfSEdBVFBfTU9ERToK
PiA+Pj4gKyAgICAgICAgICAgICAgIHIgPSBrdm1fcmlzY3ZfZ2V0X2hnYXRwX21vZGVfbWFzaygp
Owo+ID4+PiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gPj4KPiA+PkludHJvZHVjaW5nIGEgbmV3
IFJJU0MtViBjYXBhYmlsaXR5IGxvb2tzIGEgYml0IGNvbXBsZXguCj4gPj5JbnN0ZWFkIG9mIEtW
TV9DQVBfUklTQ1ZfU0VUX0hHQVRQX01PREUsIHdlIGNhbgo+ID4+c2ltcGx5IHJlLXVzZSBLVk1f
Q0FQX1ZNX0dQQV9CSVRTLgo+ID4+Cj4gPj5UaGUga3ZtX3ZtX2lvY3RsX2NoZWNrX2V4dGVuc2lv
bigpIGZvciBLVk1fQ0FQX1ZNX0dQQV9CSVRTCj4gPj5yZXR1cm4gbnVtYmVyIG9mIEdQQSBiaXRz
IHdoaWNoIGluLWRpcmVjdGx5IGltcGxpZXMgdGhlIHVuZGVybHlpbmcKPiA+PmhnYXRwLk1PREUu
IEFzIHdlIGtub3csIGlmIGl0IHJldHVybiA1OSBiaXRzIEdQQSB0aGVuIGl0IG1lYW5zCj4gPj5T
djU3eDQgaXMgdGhlIHNlbGVjdGVkIGhnYXRwLk1PREUgYW5kIFN2NDh4NCBhbmQgU3YzOXg0IG1v
ZGVzCj4gPj5hcmUgYWxzbyBzdXBwb3J0ZWQgYXMtcGVyIFJJU0MtViBwcml2aWxlZ2VkIHNwZWNp
ZmljYXRpb24uCj4gPj4KPiA+PlRoZSBrdm1fdm1faW9jdGxfZW5hYmxlX2NhcCgpIGZvciBLVk1f
Q0FQX1ZNX0dQQV9CSVRTCj4gPj53aWxsIHRha2UgdGhlIGRlc2lyZWQgbnVtYmVyIG9mIEdQQSBi
aXRzIGFuZCBkb3duc2l6ZSB0aGUgc2VsZWN0ZWQKPiA+PmhnYXRwLk1PREUuIEZvciBleGFtcGxl
LCBpZiB1c2VyLXNwYWNlIGFzayBHUEEgYml0cyA8PSA1MCBhbmQKPiA+PkdQQSBiaXRzID4gNDEg
dGhlbiB3ZSBzZWxlY3QgU3Y0OHg0LiBJZiB1c2VyLXNwYWNlIGFzayBHUEEKPiA+PmJpdHMgPD0g
NDEgdGhlbiB3ZSBzZWxlY3QgU3YzOXg0LiBJZiB1c2VyLXNwYWNlIGFzayBHUEEgYml0cyA8PSA1
OQo+ID4+YW5kIEdQQSBiaXRzID4gNTAgdGhlbiB3ZSBzZWxlY3QgU3Y1N3g0Lgo+ID4+Cj4gPgo+
ID5UaGFua3MsIHRoYXQgbWFrZXMgc2Vuc2UuCj4gPgo+ID5JbiB2OCBJ4oCZbGwgZHJvcCBLVk1f
Q0FQX1JJU0NWX1NFVF9IR0FUUF9NT0RFIGFuZCByZS11c2UgS1ZNX0NBUF9WTV9HUEFfQklUUwo+
ID5mb3IgYm90aCBkaXNjb3ZlcnkgYW5kIHNlbGVjdGlvbi4KPiA+Cj4KPiBIaSBBbnVwLAo+Cj4g
V2hpbGUgd29ya2luZyBvbiB0aGUgcmVzcGluIHJldXNpbmcgS1ZNX0NBUF9WTV9HUEFfQklUUywg
SSByZWFsaXplZAo+IGEgcG90ZW50aWFsIGFtYmlndWl0eSBpbiBDSEVDS19FWFRFTlNJT04gc2Vt
YW50aWNzIGFuZCB3YW50ZWQgdG8gY29uZmlybSB0aGUKPiBpbnRlbmRlZCBBQkkgYmVmb3JlIHBv
c3RpbmcgdjguCj4KPiBPbmUgY29uY2VybiBhYm91dCB0aGUgc2VtYW50aWNzOiB0b2RheSBLVk1f
Q0hFQ0tfRVhURU5TSU9OKEtWTV9DQVBfVk1fR1BBX0JJVFMpCj4gb24gYSBWTSBmZCBtYXkgYmUg
aW50ZXJwcmV0ZWQgYXMg4oCcdGhlIEdQQSBiaXRzIGZvciB0aGlzIFZN4oCdIChvciBhdCBsZWFz
dCB3aGF0Cj4gdGhpcyBWTSBjYW4gdXNlKS4gSWYgd2UgYWxzbyB1c2UgS1ZNX0VOQUJMRV9DQVAo
S1ZNX0NBUF9WTV9HUEFfQklUUykgdG8gZG93bnNpemUKPiB0aGUgc2VsZWN0ZWQgSEdBVFAuTU9E
RSBmb3IgYSBwYXJ0aWN1bGFyIFZNIChlLmcuIHRvIFN2NDh4NCA9PiA1MCBiaXRzKSwgdGhlbiBh
Cj4gc3Vic2VxdWVudCBDSEVDS19FWFRFTlNJT04oS1ZNX0NBUF9WTV9HUEFfQklUUykgb24gdGhl
IHNhbWUgVk0gZmQgd291bGQgcmV0dXJuIDUwLgo+IFVzZXJzcGFjZSBtaWdodCB0aGVuIGFzc3Vt
ZSA1MCBpcyB0aGUgbWF4aW11bSBzdXBwb3J0ZWQgYnkgdGhhdCBWTS9ob3N0IGFuZCBsb3NlCj4g
dGhlIGluZm9ybWF0aW9uIHRoYXQgdGhlIGhvc3QgYWN0dWFsbHkgc3VwcG9ydHMgNTkgKFN2NTd4
NCkuCgpJIHRoaW5rIHRoZXJlIGlzIG5vIHZpb2xhdGlvbiBvZiB0aGUgc2VtYW50aWNzIGJlY2F1
c2Ugd2UgYXJlIHByb3ZpZGluZwphIHdheSB0byBhbGxvdyBLVk0gdXNlciBzcGFjZSBjaGFuZ2Ug
InRoZSBHUEEgYml0cyBmb3IgdGhpcyBWTeKAnQp1c2luZyBLVk1fRU5BQkxFX0NBUChLVk1fQ0FQ
X1ZNX0dQQV9CSVRTKSBzbyBzdWJzZXF1ZW50CkNIRUNLX0VYVEVOU0lPTihLVk1fQ0FQX1ZNX0dQ
QV9CSVRTKSBtdXN0IHJldHVybgplZmZlY3RpdmUgbnVtYmVyIG9mIEdQQSBiaXRzIHZpc2libGUg
dG8gdGhlIFZNLgoKVGhlIG9ubHkgYWRkaXRpb25hbCBjb25zdHJhaW50IEkgd291bGQgZW5mb3Jj
ZSBpcyB0aGF0IHRoZQpLVk1fRU5BQkxFX0NBUChLVk1fQ0FQX1ZNX0dQQV9CSVRTKSBtdXN0CnJl
dHVybiAtRUJVU1kgaWYgYW55IG9mIHRoZSBHdWVzdCBWQ1BVcyBoYXZlCnJhbl9hdGxlYXN0X29u
Y2Ugc2V0LgoKUmVnYXJkcywKQW51cAoKPgo+IFRoYW5rcywKPiBGYW5neXUKPgo+ID5UaGFua3Ms
Cj4gPkZhbmd5dQo+ID4KPiA+Pj4gICAgICAgICBkZWZhdWx0Ogo+ID4+PiAgICAgICAgICAgICAg
ICAgciA9IDA7Cj4gPj4+ICAgICAgICAgICAgICAgICBicmVhazsKPiA+Pj4gQEAgLTIxMSwxMiAr
MjE0LDIzIEBAIGludCBrdm1fdm1faW9jdGxfY2hlY2tfZXh0ZW5zaW9uKHN0cnVjdCBrdm0gKmt2
bSwgbG9uZyBleHQpCj4gPj4+Cj4gPj4+ICBpbnQga3ZtX3ZtX2lvY3RsX2VuYWJsZV9jYXAoc3Ry
dWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX2VuYWJsZV9jYXAgKmNhcCkKPiA+Pj4gIHsKPiA+Pj4g
KyAgICAgICBpZiAoY2FwLT5mbGFncykKPiA+Pj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOwo+ID4+PiArCj4gPj4+ICAgICAgICAgc3dpdGNoIChjYXAtPmNhcCkgewo+ID4+PiAgICAg
ICAgIGNhc2UgS1ZNX0NBUF9SSVNDVl9NUF9TVEFURV9SRVNFVDoKPiA+Pj4gLSAgICAgICAgICAg
ICAgIGlmIChjYXAtPmZsYWdzKQo+ID4+PiAtICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsKPiA+Pj4gICAgICAgICAgICAgICAgIGt2bS0+YXJjaC5tcF9zdGF0ZV9yZXNldCA9
IHRydWU7Cj4gPj4+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+Pj4gKyAgICAgICBjYXNl
IEtWTV9DQVBfUklTQ1ZfU0VUX0hHQVRQX01PREU6Cj4gPj4+ICsgICAgICAgICAgICAgICBpZiAo
IWt2bV9yaXNjdl9oZ2F0cF9tb2RlX2lzX3ZhbGlkKGNhcC0+YXJnc1swXSkpCj4gPj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4+PiArCj4gPj4+ICsgICAgICAg
ICAgICAgICBpZiAoa3ZtLT5jcmVhdGVkX3ZjcHVzIHx8ICFrdm1fYXJlX2FsbF9tZW1zbG90c19l
bXB0eShrdm0pKQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVCVVNZOwo+
ID4+PiArI2lmZGVmIENPTkZJR182NEJJVAo+ID4+PiArICAgICAgICAgICAgICAga3ZtLT5hcmNo
LnBnZF9sZXZlbHMgPSAzICsgY2FwLT5hcmdzWzBdIC0gSEdBVFBfTU9ERV9TVjM5WDQ7Cj4gPj4+
ICsjZW5kaWYKPiA+Pj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+ID4+PiAgICAgICAgIGRl
ZmF1bHQ6Cj4gPj4+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+Pj4gICAgICAg
ICB9Cj4gPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtLmggYi9pbmNsdWRl
L3VhcGkvbGludXgva3ZtLmgKPiA+Pj4gaW5kZXggODAzNjRkNGRiZWJiLi5hNzRhODBmZDQwNDYg
MTAwNjQ0Cj4gPj4+IC0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9rdm0uaAo+ID4+PiArKysgYi9p
bmNsdWRlL3VhcGkvbGludXgva3ZtLmgKPiA+Pj4gQEAgLTk4OSw2ICs5ODksNyBAQCBzdHJ1Y3Qg
a3ZtX2VuYWJsZV9jYXAgewo+ID4+PiAgI2RlZmluZSBLVk1fQ0FQX0FSTV9TRUFfVE9fVVNFUiAy
NDUKPiA+Pj4gICNkZWZpbmUgS1ZNX0NBUF9TMzkwX1VTRVJfT1BFUkVYRUMgMjQ2Cj4gPj4+ICAj
ZGVmaW5lIEtWTV9DQVBfUzM5MF9LRVlPUCAyNDcKPiA+Pj4gKyNkZWZpbmUgS1ZNX0NBUF9SSVND
Vl9TRVRfSEdBVFBfTU9ERSAyNDgKPiA+Pj4KPiA+Pj4gIHN0cnVjdCBrdm1faXJxX3JvdXRpbmdf
aXJxY2hpcCB7Cj4gPj4+ICAgICAgICAgX191MzIgaXJxY2hpcDsKPiA+Pj4gLS0KPiA+Pj4gMi41
MC4xCj4gPj4+Cj4gPj4KPiA+PlJlZ2FyZHMsCj4gPj5BbnVwCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
