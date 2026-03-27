Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1901310F284B
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 16:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sNqE8zpU6+OFcAe3emGfYb37VjeXRkkVCDiXovbhWp4=; b=QC4W2sFJRySUY+
	yDDRnZ4uIGp4b7/5mVkO/mmqgTFeSFbZapPlB5br4jlaYE9xYwdSFAiT0PYoLYN/AWraZkvYj/x28
	4fMMF1Pfm5mKbpoRaDt3PRxt/w+osZN38eYwQq64fc+QvtPBdW3IIeo/+MWIJivoUtUgIpN+JB3wh
	GRs0NI+DpkhzmeHC9OA/xEV++iz7jPePjWsvt+cKR0onYm6jbD0EOD147t3Udk9geJc5hgvV0K2TD
	UB9SgYzuZlokyGddt5DboabgFauEQ7I6yKkISnO5xcxo91c3+PITRlorMejcPcqapiFct9OC1Rl/b
	Lu5QRyYDZEvLtNXOyn4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69yU-00000007lkR-35cx;
	Fri, 27 Mar 2026 16:23:54 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69yS-00000007lj8-057i
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 16:23:53 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7d7e565c877so1189480a34.3
        for <linux-riscv@lists.infradead.org>; Fri, 27 Mar 2026 09:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774628631; cv=none;
        d=google.com; s=arc-20240605;
        b=adT8kQh+Wk7sK0BzZbcHF7GA2qpy1o+NsWQZdlpFgZwnAhjZaKaOhzz6Lcf5fhBexU
         y2u/Rr6Y8HpqrGOfxVN0ST1xogCvB9pBm3q9YWIkFcO0y0A4oJTZmtiTF+XS6aNbzM2u
         IVGB18yTxCXPaG2N57EZsqdcz+omsXVcdwAPYoP+HMvbHg5P6YohRL6h2r2Uxjam0wcs
         mJDWOd4H0JQPJ45JImgx5BNoGHRe4ET7oU8OUBXq79cob5EdwaIQrZSCkZ+7cv7dmpRn
         hGMLkGqIU6BJBACe93kwGu5qlDpxJtmx/zrJPIlhT2YMbw641bvJU7KgXvCZgAoS/cas
         BWBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5i7AMnECXeGliuvzkSngvQOxbDfImYVhWzHk0/VD+K8=;
        fh=TU+9a46jB99LVA0MAyvixkXhPN/K2gBcJQub673kX2Q=;
        b=LbXa7xb6kBoxxMHnYrCCELduw0jJJ+hfGcc+UAg9TFALorZPh70AkwbflXzimdelLh
         c3lr5+6snZok2bo2bfwfKOw/NA40VGMOSRWFLo6bRvIQFx9ex5zccqIKHQcu+DRWGUwl
         PEGVuJ7Ep2KaMQ5v5vD6j6hruTJUhUce2tE0U5d5uBxDgvM9l1JrEzmlRXVUuvWIAf1l
         WOsGMDeOfaw2nde1xXMDBvgvTEaxojznz96VlDtTXkeKN45aIp3/KQirBUPjKAbNpQQA
         Mx+20rXT7ss85Kmf6TzkmL94QHlce/LuuY1r6wdy2TnMZdiW/OHrtA/mLnI8y+Og/+Qh
         Ujbw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774628631; x=1775233431; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5i7AMnECXeGliuvzkSngvQOxbDfImYVhWzHk0/VD+K8=;
        b=BJQSrru7hiN88Ot+ITmPY7m61ICSyr9yKnt04fR81QcFb8jOMkRh+wvyupzW8iLR94
         c7GDEv1gYGSapS16NEz4O5plCyitIvwnxwSaOiOIUNNUCXMOSqfvqwOcPh5r08RWxLi3
         f85xlPJ6Gt05CRi4hZgVdqCUs8QqX802kQI9kvVvUy0a2X8uo+k+KahmGnWuFyWzsJeY
         itSUp85LHObLlhb2cyiM1bT1d5bOoE1ThwnGwOT26vNSl1EM/r7PpuaVkGiqlBYVmQ6h
         woS3T9CzPkbRkAlplb8MBNxQOO/T4j3h1Dk7T/45+a6o+/tp5bgteN6k7JyWzGwlH8/d
         u46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774628631; x=1775233431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5i7AMnECXeGliuvzkSngvQOxbDfImYVhWzHk0/VD+K8=;
        b=eDbqySXBaW50FaBb0713DavaQ4UWBaP2xclYVLXOYArxvYvTANl9wL9OYPrp6U9B2I
         qKx7rGU1qsJ9duQNVK28LOqsDZmBcmYYMJJfbMuTcx5aNh3nvbv2rGnyKleCnz2KSz3t
         VE22He1VZ7GjhHaMrUI5RLKG0colAml3oDqJAU5a9IlYZ+rq8ljvEdLTmBkQrqFaGL58
         ghhC8NN/4J9sFApVJCYIo2+as2q7iutiVquNog9P/rZ/FoWqd7vScYdRS3f88FBoyWMs
         cOVHQXwY3bE3FLB14XNkJaMBeY/2mUsbz+ccGk8nSB+LiFFh9xajGibCRX+02BzBbVGB
         mgJA==
X-Forwarded-Encrypted: i=1; AJvYcCVbNly80aENqEg7mkql/DXONhqPn2BwOtyKAsyKJ/qiRz1NaUOchmx7mQr9ywo7ot4WavBEV5rxJeQO/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEwMiELiokOsbohjwmPwqd0c6FUsPt1lPnc2vm5gCJ+72qr7si
	Sx2mm3afttC93Jcyruy+jn16JzdF0egTd+G8E6sKvLW7PoZlG1Cs7tfW1ll3gboLKw/RTBz9Ap1
	jUPlvqfipXSQvaXlXPIdGB8rNkydgEe2Td3nKqCmKgA==
X-Gm-Gg: ATEYQzzL+RLT28H3VfIpLCe9obM23tWoDrRRcX0/jqOagcSiRSriffEHamHNKSkw9di
	silyoJx8VYvSsqckIU34Em4XYFM9pCkPVD+ulRqURWEXuGIgovCOfuNcUrcWnTyLb+NBx3JPano
	/UEZom4XNV1RUOa9THv1Oz4gJFfdBzuu5AEyOFPNOw+E0vd/FPQ5sFJjR+iPc7ChUjj38eUOrcb
	n0KQajhpY0JvPUQ5o8CVAKmDwDXcC5+zoUmsYSM6nzKl7yU9Z7thly87oR27UR6+eVZRyzMNVdD
	CdWSeGRcBNl/gOOtrWabdH/XNcv8yCnHLwQ8z4oHW2HKd8yke67HXMrH4c3dJx6MwIrN4c3EemE
	N8facHGSSnhZ3aJUfhQHER7JXBLw=
X-Received: by 2002:a05:6820:2916:b0:67d:2cb:2079 with SMTP id
 006d021491bc7-67e1875bd34mr1529379eaf.58.1774628630795; Fri, 27 Mar 2026
 09:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260316014533.2312254-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260316014533.2312254-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 27 Mar 2026 21:53:38 +0530
X-Gm-Features: AQROBzA9STNkwcnpYQkGGVqwDqCIWR_7nCDRTW55e5KIm3IP1CNA2fjdu_Yz16A
Message-ID: <CAAhSdy0CeQOnLdsCqXVxZcP-mxMDqjSMhEnLVVYTr46jbj7iWQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] RISC-V: KVM: Fix array out-of-bounds in firmware
 counter reads
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <pjw@kernel.org>, Shuah Khan <shuah@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_092352_178897_482BC711 
X-CRM114-Status: GOOD (  15.16  )
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

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgNzoxNeKAr0FNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IFdoZW4gYSBndWVzdCByZWFkcyBhIGZpcm13YXJlIFBN
VSBjb3VudGVyIHZpYQo+IFNCSV9FWFRfUE1VX0NPVU5URVJfRldfUkVBRCBvciBTQklfRVhUX1BN
VV9DT1VOVEVSX0ZXX1JFQURfSEkgd2l0aG91dAo+IGZpcnN0IGNvbmZpZ3VyaW5nIGl0IHdpdGgg
U0JJX0VYVF9QTVVfQ09VTlRFUl9DRkdfTUFUQ0gsIHRoZSBjb3VudGVyJ3MKPiBldmVudF9pZHgg
cmVtYWlucyBTQklfUE1VX0VWRU5UX0lEWF9JTlZBTElEICgweEZGRkZGRkZGKS4KPgo+IGdldF9l
dmVudF9jb2RlKCkgZXh0cmFjdHMgdGhlIGxvd2VyIDE2IGJpdHMgZnJvbSBldmVudF9pZHgsIHlp
ZWxkaW5nCj4gMHhGRkZGLCB3aGljaCBpcyB0aGVuIHVzZWQgdG8gaW5kZXggaW50byBrdnBtdS0+
ZndfZXZlbnRbXS4gU2luY2UgdGhlCj4gZndfZXZlbnQgYXJyYXkgb25seSBjb250YWlucyBSSVND
Vl9LVk1fTUFYX0ZXX0NUUlMgZW50cmllcywgdGhpcyByZXN1bHRzCj4gaW4gYW4gb3V0LW9mLWJv
dW5kcyBhY2Nlc3MgdGhhdCBjYW4gYmUgZGV0ZWN0ZWQgYnkgVUJTQU4uCj4KPiBQYXRjaCAxIGZp
eGVzIHRoZSBpc3N1ZSBieSB2YWxpZGF0aW5nIHRoZSBmaXJtd2FyZSBldmVudCBjb2RlIGJlZm9y
ZQo+IGFjY2Vzc2luZyB0aGUgZndfZXZlbnQgYXJyYXkgYW5kIHJldHVybmluZyAtRUlOVkFMIGZv
ciBpbnZhbGlkIHZhbHVlcy4KPgo+IEFmdGVyIGZpeGluZyB0aGUga2VybmVsIGJlaGF2aW9yLCB0
aGUgZXhpc3RpbmcgS1ZNIHNlbGZ0ZXN0Cj4gKHNiaV9wbXVfdGVzdCkgZmFpbHMgYmVjYXVzZSBp
dCBhdHRlbXB0cyB0byByZWFkIGZpcm13YXJlIGNvdW50ZXJzCj4gd2l0aG91dCBjb25maWd1cmlu
ZyB0aGVtIGZpcnN0LiBQYXRjaCAyIHVwZGF0ZXMgdGhlIHNlbGZ0ZXN0IHRvCj4gY29uZmlndXJl
IGEgZmlybXdhcmUgZXZlbnQgYmVmb3JlIHJlYWRpbmcgdGhlIGNvdW50ZXIgYW5kIGFkZHMgYQo+
IG5lZ2F0aXZlIHRlc3QgdG8gZW5zdXJlIHRoYXQgcmVhZGluZyBhbiB1bmNvbmZpZ3VyZWQgZmly
bXdhcmUgY291bnRlcgo+IGZhaWxzIGdyYWNlZnVsbHkuCj4KPiBKaWFrYWkgWHUgKDIpOgo+ICAg
UklTQy1WOiBLVk06IEZpeCBhcnJheSBvdXQtb2YtYm91bmRzIGluIHBtdV9jdHJfcmVhZCgpIGFu
ZAo+ICAgICBwbXVfZndfY3RyX3JlYWRfaGkoKQo+ICAgUklTQy1WOiBLVk06IHNlbGZ0ZXN0czog
Rml4IGZpcm13YXJlIGNvdW50ZXIgcmVhZCBpbiBzYmlfcG11X3Rlc3QKPgo+ICBhcmNoL3Jpc2N2
L2t2bS92Y3B1X3BtdS5jICAgICAgICAgICAgICAgICAgICAgfCAxNCArKysrKysrCj4gIC4uLi90
ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9zYmkuaCB8IDM3ICsrKysrKysrKysr
KysrKysrKysKPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vcmlzY3Yvc2JpX3BtdV90ZXN0LmMgICAgICAg
IHwgMjAgKysrKysrKysrLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDcwIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPgo+IC0tCj4gMi4zNC4xCj4KClF1ZXVlZCB0aGlzIHNlcmllcyBmb3IgTGlu
dXgtNy4xCgpUaGFua3MsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
