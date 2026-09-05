Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D231C624D3
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2026 11:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eab1f7TRRhM3FF5iXv6YCI5iddUI5gMYY9QWV0R4QkA=; b=zQ1D01L4Eo0Ty2
	nO4miAZpFEX1/OR22ES37/ckVBSoVKywLs703vh38xJFCGVFNwl3dT4DA4jvXuHwvs4sbO7IDaTf1
	MD7Wkh7iNNN3e5d+yd3oM5OwKRPmTa5+4N6VaZaNW7MrvQfAs3IdZ2HU+R2FUwiPzGY3f5vZV+RES
	4Sb+X0CPohMbopj0Ypf3BXcefF6oQbSl7g5twPkVFwA3jnZVytbF0Q0fYzlPGhLn+AXYL9CbbG3sf
	U626xEOQoDON9IrrQQ+VPyvQTJqHivEYNk87SE8FAQLeZghSE4yykYwdRqem4bn0ragWJkk/L2O0a
	jcBCabJX1yNvt81Py2Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2oFU-000000040P3-1wJU;
	Sat, 05 Sep 2026 11:07:52 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2oFR-000000040O6-3PbG
	for linux-riscv@lists.infradead.org;
	Sat, 05 Sep 2026 11:07:50 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48441a2ba14so1656567f8f.1
        for <linux-riscv@lists.infradead.org>; Sat, 05 Sep 2026 04:07:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788606467; cv=none;
        d=google.com; s=arc-20260327;
        b=WmnL+XIpL0z/rGaPKAF+wJctH3hQaJf/5R2oK+etkl5jV59slWd3INeOWwq950KRWm
         KdgpfL066nJI9NKMJAAKWg48BD2s584AxAxUdt3St1sDZuJifE8vXnF6EXOxzepsuuUa
         NnisDNcHbN4eSe8Acb64bZ9+kJhU0sgdjXEH53zmtdvMxT869K0VDfP1nJF17NATAqJE
         4S4wUGyk1v84iK1YhHKpQ637hW7zVFHW7UZx2aG/8WZN7O7Ugd4l52OHcYXeWUz5SYpt
         i537HQ+eCX3IdNCkQpMwaETwtvysJymjuPm4CuzReDJHtPkAFQXOQCjpz8YJi1jVPSzc
         ++wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WVtlZkuDGXxOI8toXmO4w4iQku+tgCpTeAvW2uxcMZI=;
        fh=xgHUC6N84n6wbV/Z8rwSsMYV207N0FpPB8C2kIrzGAY=;
        b=IoSuH6FPNC2aDe2f7EAlHuYpw0UHd81GeC8XPw0hMdSn2ypEDnPYeFr2J36y55NZ9b
         7RZHJ2F2CUr6ox0kOcI2cp+/c1tCoEHF99SLcgwHjyfBLU1+XvHyhgh6L67J7Bvp7IZE
         tK0x2tsM4pS78oDiK44WRQcoyCMmm/i7uqzl1Qi+AgBffqsWZEs/vHCsA2kjigm7eCO0
         iGBev0F0KY8+NtabEpDG8uNH4loPawF7IMDEDes/jy1LYPBFdMLEWsq2tbgSqH76yY6j
         cdj2TFjR9HQDjvhUxvfYL6ib3g3qZRGC3KLylWPS1KIcw7VQH1ct+uVHhAyjdaj8z0E0
         uulQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788606467; x=1789211267; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WVtlZkuDGXxOI8toXmO4w4iQku+tgCpTeAvW2uxcMZI=;
        b=LVLs9w951RLt/ASxGkGR7QNu4NGNKzzhKfhjX3wltgOaOWMWJYU82tNZsXi5BqKT+W
         A/r1mKzTCD3OelgF1ulvJUkdGr9pzsPNQtNga8q8aFxAyQiB30YqTdqkMAKjiu620wIb
         PvNqbh5GT1U9aKL0/Q1z7JliQBjdNVSUKWKB7gF869hHE6FRMGZPbKSep0Q9YJlj8iC0
         A8vgMlfu8br32Vl3OjHOZDKYvxTYPSyXZzoYhBhEtFWl47LT/RpzITlLDezOaAu6RlLh
         +CN0ULJho2DpIIsSu+DZRKuJ2EGNaSKI7uoDPhLpOM3engC9UafvP7jrKwy3vHV7psF5
         TO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788606467; x=1789211267;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVtlZkuDGXxOI8toXmO4w4iQku+tgCpTeAvW2uxcMZI=;
        b=dGzTp4uuf1Yuu3/JaTiNn0EkhJ9Hjeq4KonQ/78WeurYUvmvJgwRGlIhrMiyPvBpLC
         5Ap7cTi0nofoTOkJ9I+zNlEs/TFfcnguNQX/JCH+TfmOmei6NVGYuejBZVY+Vbc/C5qa
         Wn+FfkgODmPfg+0fzDUkkiI9vBxOHITt1ZBuTe1wAvQ/iGb3BB7GXEfCCKUND64grjbK
         If/91wMQBjvAoSPAzTNc0GiLnhLQL69J5gOwMZgDv6AbS/yIjUzE79NewQLZOC85W3y0
         iRJUy5198A6uULT00mmBbvAtdn5GCh0S+SfjIU1iVbZHb4EV7HQaDjSqqj20NAQerzJ9
         N/Tw==
X-Forwarded-Encrypted: i=1; AKwUvBxL9XAhyXybYDSLeUTW5qCHnHhX45D1YguuN13RbZF3h0jPj31J+PKP8Lv6hubnHQ7weu+9mtWmaxCjYQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lLepChDpHHY19uLw9b4q6Em5+3sXBKqZjT69/fVvXd5DFp8w7y
	4aRqJqBMoqU9KrzvWIOOqP7V5VJvz3ZyB/YNrGyu2CaCoDFIZkbU54bKW+MlGG7Q0eBQJObk7sM
	LsS75qrBMUAczopfnBc6OD2Yq0Llith3AwQa/0FnFXA==
X-Gm-Gg: AYBFou3z9nSfOR8JEH3StFMiS6gRSu/SG5/jKnojEgtOzcbWqegyjn+++PTBDJripbs
	IVg6uxfME5goZV6q6HasVFZJfTqZ7hR7d7E5JuX4RPdNX48ev1CbO1EpBh3Buts5OPdbBLAitTR
	MkuEoNqECOnl6vixc+SzdpiEKjLTy4sgFZ+1ayGD8c+icF34onETDFhMQ45i5pajF01z/sIWldF
	pY9UQGgQzVnbMhAf3m2+KTDtbsG60HqPgpkarDZkwiOVwlvAepFaFbJdUO/RL4hGtghGidr5iXo
	9LI942xeto459eh4kqfucfBfUIFO6rtwCBCSgZmvObdh5s7yh+4sdHGUafQ/R5bWtB2/lrBVKmx
	PVK6tnG4wnuxBJMvJtCA4leUOftGpwV18PEo1x55no4ZnMajx1Fz4B6OnofNFCPEF
X-Received: by 2002:a05:6000:420f:b0:484:f26c:b9f3 with SMTP id
 ffacd0b85a97d-485872ebd4emr13447348f8f.28.1788606466907; Sat, 05 Sep 2026
 04:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <871pb9841j.ffs@fw13>
In-Reply-To: <871pb9841j.ffs@fw13>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 5 Sep 2026 16:37:34 +0530
X-Gm-Features: AcwNN1WQxHO5cqvfPg3ullsdiCu5_mZrtsE7_CGgcOOk53j9-4tDEAMo1ePLZfE
Message-ID: <CAAhSdy1=Z-VjEhGsGOJ15QptCSZP_6zG1NF=B972KwzEJhFbFg@mail.gmail.com>
Subject: Re: Interrupt chip driver maintainence
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Radu Rendec <radu@rendec.net>, 
	Marc Zyngier <maz@kernel.org>, Paul Walmsley <pjw@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_040749_861466_2F140D91 
X-CRM114-Status: GOOD (  19.42  )
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

T24gRnJpLCBTZXAgNCwgMjAyNiBhdCA4OjE54oCvUE0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gRm9sa3MhCj4KPiBJJ20gd2FkaW5nIHRocm91Z2ggbXkgaW5i
b3ggZnVsbCBvZiBwYXRjaGVzIGZvciBpbnRlcnJ1cHQgY2hpcCBkcml2ZXJzCj4gYW5kIEknbSB0
aG9yb3VnaGx5IGFubm95ZWQuIFRoZSB3YXkgaG93IHRoaXMgd29ya3MgdG9kYXkgaXMgbm90Cj4g
c3VzdGFpbmFibGUuCj4KPiBQYXRjaGVzIGVuZCB1cCBpbiBteSBhbmQgUmFkdSdzIGluYm94IGFu
ZCBhbGwgd2UgY2FuIGRvIGlzIGdvIHRocm91Z2gKPiB0aGVtIG1vc3RseSBvbiBhIGZvcm1hbCBi
YXNpcywgYnV0IGl0J3Mgb3V0IG9mIG91ciBzY29wZSB0byBsb29rIGF0IHRoZQo+IGNvcnJlY3Ru
ZXNzIHZzLiBhIHBhcnRpY3VsYXIgaGFyZHdhcmUuIEluIHRoZSBwYXN0IEkganVzdCBwaWNrZWQg
dXAKPiBwYXRjaGVzIHdoZW4gSSBoYWQgdGhlIGd1dCBmZWVsaW5nIHRoZXkgYXJlIHJlbW90ZWx5
IGNvcnJlY3QsIGJ1dCBJJ20KPiB0aXJlZCBvZiB0aGlzLgo+Cj4gSSd2ZSBqdXN0IG1hcmtlZCBh
Ym91dCAyMCBwYXRjaGVzIGFuZCBwYXRjaCBzZXJpZXMgb2Jzb2xldGUgZHVlIHRvIHplcm8KPiBm
ZWVkYmFjayBmcm9tIHRoZSByZWxldmFudCBhcmNoaXRlY3R1cmUvU29DIHBlb3BsZSB3aG8gd2Vy
ZSBvbiBDYy4KPgo+IEFuZCBJJ20gZ29pbmcgdG8gZG8gdGhhdCBmcm9tIG5vdyBvbiB2ZXJ5IGNv
bnNlcXVlbnRseS4gSWYgdGhlCj4gYXJjaGl0ZWN0dXJlLCBTb0MgZXhwZXJ0cyBjYW4ndCBiZSBi
b3RoZXJlZCB0byBsb29rIGFmdGVyIHRoZWlyIHN0dWZmLAo+IHRoZW4gZG9uJ3QgZXhwZWN0IG1l
IHRvIHN1Y2sgYWxsIG9mIHRoaXMgY3JhcCB1cCBhbmQgdGhlbiBkZWFsIHdpdGggdGhlCj4gY29t
cGxhaW50cyB3aGVuIGl0IGJyZWFrcy4KPgo+IEknbSBzdGlsbCBnb2luZyB0byBwaWNrIHVwIG9i
dmlvdXMgYW5kIHNpbXBsZSBidWcgZml4ZXMsIGJ1dCBmb3IKPiBhbnl0aGluZyB3aGljaCByZXF1
aXJlcyBkZWVwIGtub3dsZWRnZSBvbiB0aGUgdW5kZXJseWluZyBoYXJkd2FyZSwgSSdtCj4gZ29p
bmcgdG8ganVzdCBtYXJrIHRoZW0gb2Jzb2xldGUgd2hlbiB0aGV5IG1vbGRlZCBpbiBteSBpbmJv
eCB1bnJldmlld2VkCj4gYnkgdGhlIHBlb3BsZSB3aG8gdW5kZXJzdGFuZCBpdCBmb3Igc2l4IHdl
ZWtzLgo+CgpJIHRoaW5rIHRoaXMgaXMgYSBmYWlyIGFzay4KCkN1cnJlbnRseSwgSSBhbSBmb2N1
c2VkIG9uIHJldmlld2luZyBhbmQgdGVzdGluZyBhbnl0aGluZyB3aGljaAp0b3VjaGVzIFJJU0Mt
ViBBSUEgZHJpdmVycy4gVGhlIFNpRml2ZSBQTElDIGRyaXZlciBvbiBvdGhlciBoYW5kCnNlZW1z
IHRvIGhhdmUgbm8gYWN0aXZlIHJlaXZld2VycyBmcm9tIFJJU0MtViBzcGFjZS4gRmV3IHllYXJz
CmJhY2sgSSBkaWQgdHJ5IHRvIGFjdGl2ZWx5IHJldmlldyBTaUZpdmUgUExJQyBkcml2ZXIgYnV0
IHRoZXNlIGRheXMKSSBkb24ndCBoYXZlIGJhbmR3aWR0aCBmb3IgdGhhdC4KClJlZ2FyZHMsCkFu
dXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
