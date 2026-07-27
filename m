Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B629AC53209
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 13:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d8YIzZOHJWH6tKY1kPLf/Ai3RynFk+2/FM/itj527O4=; b=hYwL9Nl4jMvnNo
	NUgJy00CZ96mICOhs51fU/oCOEOs9tiPapXk53BAYboIRzXCsCFFZHDs2anhwES+MKV/QwfQ5tRLx
	p2N6/AHVz3xzBep9kGgV6HHyRY+cdAdx/Enzx7l/lYIxpNtShTm6jPGsE9MdGb8wc4vkfITg0kC3K
	s1Idlh2TCoKeVMctuAk7uQWRExbfR57F1r0pobvSeKrAepZRa8ILBUAikdWt1Yh+u36XlLa9U6QEa
	rDoqacAX/ARJktg4P36QDvt0EXphYUIQIcRJHzfA1Emw1c/lYhDDL89M3tXWZswa4jOkWUlYchM0t
	djfS/dZSHdYEXf5QSv2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLmQ-00000002uNS-3FdX;
	Mon, 27 Jul 2026 13:54:06 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLmP-00000002uML-0Roi
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 13:54:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4956869750eso20432745e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2026 06:54:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785160443; cv=none;
        d=google.com; s=arc-20260327;
        b=jD9hGscETFVEkTNC6RhIr/K98od86OcAxgwExlwgqWxkZrY1nsdAQ2DZLzhL92AzHH
         6TZMcVtXozcL5IGGbx9CsuZ5FiY8SOB5ezMtaZK1UvrRxBGswegdDGjE6VsCfEcXdiDC
         852RJT+PotEFYHhLY6Sv8hc68nO+KLRTDk0fIcJTsbYmkv/5s7ChYevau3hadxnq1Yxe
         FuJ0gwdIqrF30azu09facmod0gHFvD1rInhHT2gW5KLczCtQTtABhhvo2nMnnKVrVFJ3
         n6HHP8MqDdGpPLm+yC2fOEVEVGr4amqllLOA4ahLzZ3UkVjYCunWxfoO+WzmLdfGomaC
         uv2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LkTARaNCDvTrxIcriRua7Id7ovFdqPl8CcOFZ930Vas=;
        fh=mv1F9ahLqNaZP+RKbTbpLzeIMClpcf/fjGLk3w1sVM8=;
        b=UXvMx6r4HpL4q6HAsonGHDxwmNUWvrIEXdvMr1TOEyjHuEEk9kFsGqzzdPTTdVThcb
         7q/KbskyDH1BOP1k/4d4/LL8jAtSlMgN28Qa67iPLPDaKXf6++kviZ+nGk85G8pzv4ao
         k9Y9yKIn0uOlbJkgxX7N71vO6IuGpSniMc58Zi7cf5FRSa/j4epr27diF5g0ITwx850V
         TV3OTy8LG5qoopGvTnslCZ3fipAOc3B4xeoOv+PRuZAQoYrjSn68AdadnMFA/hRUGVn8
         Ay4IlHOD70qe+FQsp12gkWcr0+HLXg+PiMnshzJ5ZSdhnr1z94jgK9MOxu7kN6sRSdXB
         bUTQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785160443; x=1785765243; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LkTARaNCDvTrxIcriRua7Id7ovFdqPl8CcOFZ930Vas=;
        b=GT+DXoXkkUQ0+hYtA8NDf1drKNC2KtR9apk33bn/+ndNmH65mxXH+B8+p5OoewMJPz
         5ZzNucMpT3XuiV/ZAADk8K/8LPE2j43P5G6fYtmEielZSNVFMIyTR8G6F7kZhGUDpAyF
         isNWy6DgCTBG8xWJQdCbK864x63w+h4bkW07IDaEq2p2xXJMZPrQX5laL7ZZULDqHH4p
         n/9yUOzoABo7D02NbMBismciVm/erjNK/+Vy9goEp7Yqst+kA4YdJ38UnhQvnH0/QegE
         GWR4EB5j6IkBFbEpbaZtvfqTWkO4AZEm6A9QJFTCefrOSgcH9Je2crIdjXG0i0hbZbJg
         m/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785160443; x=1785765243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkTARaNCDvTrxIcriRua7Id7ovFdqPl8CcOFZ930Vas=;
        b=APeWPcIpdcOUQ1eEflopVVf1JPsVhQJgPpa7ziSqDc6BOzaBbl7N3jjj8iqZdzx74G
         bTEtwhdyraS8+1Y0BntjoE/nke+cN0tQFNB5w2AyVeNbSIz2jS/FLf4hZpI+VdMForlB
         nauHdUiqoR+KDk2ebv5hF0ZsIFeBEQ/8y0uZ3ZjU6KRFGoe8YD0VLD0PnhvSw4Z9honA
         dCvcPfOK95x/P9U6FDGT6MxnoxSQMlx38YHbSFPbO1NBoUYTJjWKWBVx1zE/afgB/1m+
         ub+9HWA7UVWRUUp5LU6ZCbej8mU+3QMUK0BXlJ0iCA4KiEkfkRXXjS0nvIHAqZp/CTnU
         hcuA==
X-Forwarded-Encrypted: i=1; AHgh+Rrk8TbJayB2cnnoaDz0h+ceDQGzt5TQ7BXMaHLYipGxv9gXUBjiIdatcv8nEM3JdIZC/dJUvz2bjFTjeg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx70AEnNN95mmRARUP4Ua1eo6HBpftie+TMNLqYaKzYhW/ObFlg
	Dq9KXb9um1/KxUnbxMRKewPSxsIp3SXKyK+gvUtsjFtNPYN9Cy1gO+r0PUwjWReJ68fAaY4MSiM
	vZ+8fEVyuVHSSNXvlZBiHpki/RfVx1LEYrm5wClKodQ==
X-Gm-Gg: AR+sD10oXFvSo/ekc9MHSpPNeGQffGgqG2gl9cmI87EPc71qt8B44U//w5dkLv5udo/
	tNQVqkId0jWlHDmKTv61qtyAjMuSZKBfhJrwMSQJi4LpmCUk2tiezaCAaWPzx/9i1CM79LJlpeS
	4WZymtTDcF+qaw1g+tODQ8R4T40V/fpAf/NHAM6ISNOFcfOdNv2p4jg3EfV0JJUytS6MpbYyMXC
	RfJ/zx0pwUqUdrcSagA/OIeXU4/Zq19O9uY3UgRvmXS+7GsAp1QjJKyqyxAjUV8QqA/YxbF4BjV
	yv486DeJYblvEP0FMMloyWQ3a7riCOvvRZ4b0DVBIh9zXF8FR7IIk0xqRIs10AJeIh/vTbnsZ+1
	ZtUiS
X-Received: by 2002:a05:600c:a12:b0:493:eccb:8cb2 with SMTP id
 5b1f17b1804b1-496b57297b8mr114877045e9.30.1785160442437; Mon, 27 Jul 2026
 06:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260727084003.1951324-1-anup.patel@oss.qualcomm.com> <71fd5b46-4388-4106-aee9-b4510069975f@arm.com>
In-Reply-To: <71fd5b46-4388-4106-aee9-b4510069975f@arm.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 Jul 2026 19:23:50 +0530
X-Gm-Features: AUfX_my4QjrER3hRFjzxXael861bKnyaiQylY-XLFhSCxIc_XNnqTG1sq5MogY4
Message-ID: <CAAhSdy2cDHO2w8VX34WV1kBxHQ6N0H0Ra_r6aDKK86250nWFSA@mail.gmail.com>
Subject: Re: [PATCH v2] driver core: platform: Setup device MSI domain just
 before driver probe
To: Robin Murphy <robin.murphy@arm.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Tomasz Jeznach <tomasz.jeznach@linux.dev>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Saket Dumbre <saket.dumbre@intel.com>, Rahul Pathak <rahul@summations.net>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	driver-core@lists.linux.dev, iommu@lists.linux.dev, 
	acpica-devel@lists.linux.dev, Sunil V L <sunilvl@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_065405_397127_4ADA6303 
X-CRM114-Status: GOOD (  27.45  )
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

T24gTW9uLCBKdWwgMjcsIDIwMjYgYXQgNTo0NuKAr1BNIFJvYmluIE11cnBoeSA8cm9iaW4ubXVy
cGh5QGFybS5jb20+IHdyb3RlOgo+Cj4gT24gMjcvMDcvMjAyNiA5OjQwIGFtLCBBbnVwIFBhdGVs
IHdyb3RlOgo+ID4gT24gUklTQy1WLCB0aGUgTVNJIGNvbnRyb2xsZXIgKGFrYSBSSVNDLVYgSU1T
SUMpIGlzIHByb2JlZCBhcyBhIHJlZ3VsYXIKPiA+IHBsYXRmb3JtIGRldmljZSBhbmQgTVNJIGNs
aWVudCBkcml2ZXJzIGFyZSBhbHdheXMgcHJvYmVkIGFmdGVyIHRoZSBNU0kKPiA+IGNvbnRyb2xs
ZXIgZHJpdmVyIHVzaW5nIGZ3X2RldmxpbmsuIFVuZm9ydHVuYXRlbHksIHRoaXMgaXMgbm90IHN1
ZmZpY2llbnQKPiA+IHRvIGVuc3VyZSBkZXZpY2UgTVNJIGRvbWFpbiBpcyBzZXQgZm9yIE1TSSBj
bGllbnQgZGV2aWNlcyBiZWZvcmUgZHJpdmVyCj4gPiBwcm9iZSBiZWNhdXNlIE9GIGZyYW1ld29y
ayBzZXRzIGRldmljZSBNU0kgZG9tYWluIGF0IHRoZSB0aW1lIG9mIHBsYXRmb3JtCj4gPiBkZXZp
Y2UgY3JlYXRpb24gd2hlcmVhcyBBQ1BJIGZyYW1ld29yayBleHBlY3RzIGFyY2ggc3BlY2lmaWMg
Y29kZSB0byBzZXQKPiA+IHRoZSBkZXZpY2UgTVNJIGRvbWFpbiBhdCB0aGUgdGltZSBvZiBwbGF0
Zm9ybSBkZXZpY2UgY3JlYXRpb24uCj4gPgo+ID4gQ3VycmVudGx5LCB0byBhZGRyZXNzIHRoZSBw
cm9ibGVtIG9mIGRldmljZSBNU0kgZG9tYWluIGJlaW5nIG5vdCBzZXQKPiA+IGNvcnJlY3RseSwg
dmFyaW91cyBSSVNDLVYgTVNJIGNsaWVudCBkcml2ZXJzIGV4cGxpY2l0bHkgc2V0IGRldmljZQo+
ID4gTVNJIGRvbWFpbiBpbiB0aGUgZHJpdmVyIHByb2JlIGZ1bmN0aW9uIHVzaW5nIGJlbG93IGNv
ZGUgcGF0dGVybjoKPiA+Cj4gPiAgICAgICAvKgo+ID4gICAgICAgICogVGhlIGRldmljZSBNU0kg
ZG9tYWluIGZvciBwbGF0Zm9ybSBkZXZpY2VzIG9uIFJJU0MtViBhcmNoaXRlY3R1cmUKPiA+ICAg
ICAgICAqIGlzIG9ubHkgYXZhaWxhYmxlIGFmdGVyIHRoZSBNU0kgY29udHJvbGxlciBkcml2ZXIg
aXMgcHJvYmVkIHNvLAo+ID4gICAgICAgICogZXhwbGljaXRseSBjb25maWd1cmUgaGVyZS4KPiA+
ICAgICAgICAqLwo+ID4gICAgICAgaWYgKCFkZXZfZ2V0X21zaV9kb21haW4oZGV2KSkgewo+ID4g
ICAgICAgICAgICAgICAvKgo+ID4gICAgICAgICAgICAgICAgKiBUaGUgZGV2aWNlIE1TSSBkb21h
aW4gZm9yIE9GIGRldmljZXMgaXMgb25seSBzZXQgYXQgdGhlCj4gPiAgICAgICAgICAgICAgICAq
IHRpbWUgb2YgcG9wdWxhdGluZy9jcmVhdGluZyBPRiBkZXZpY2UuIElmIHRoZSBkZXZpY2UgTVNJ
Cj4gPiAgICAgICAgICAgICAgICAqIGRvbWFpbiBpcyBkaXNjb3ZlcmVkIGxhdGVyIGFmdGVyIHRo
ZSBPRiBkZXZpY2UgaXMgY3JlYXRlZAo+ID4gICAgICAgICAgICAgICAgKiB0aGVuIHdlIG5lZWQg
dG8gc2V0IGl0IGV4cGxpY2l0bHkgYmVmb3JlIHVzaW5nIGFueSBwbGF0Zm9ybQo+ID4gICAgICAg
ICAgICAgICAgKiBNU0kgZnVuY3Rpb25zLgo+ID4gICAgICAgICAgICAgICAgKi8KPiA+ICAgICAg
ICAgICAgICAgaWYgKGlzX29mX25vZGUoZndub2RlKSkgewo+ID4gICAgICAgICAgICAgICAgICAg
ICAgIG9mX21zaV9jb25maWd1cmUoZGV2LCBkZXZfb2Zfbm9kZShkZXYpKTsKPiA+ICAgICAgICAg
ICAgICAgfSBlbHNlIGlmIChpc19hY3BpX2RldmljZV9ub2RlKGZ3bm9kZSkpIHsKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgaXJxX2RvbWFpbiAqbXNpX2RvbWFpbjsKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICBtc2lfZG9tYWluID0gaXJxX2ZpbmRfbWF0Y2hpbmdfZndub2RlKGlt
c2ljX2FjcGlfZ2V0X2Z3bm9kZShkZXYpLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRE9NQUlOX0JVU19QTEFURk9STV9NU0kp
Owo+ID4gICAgICAgICAgICAgICAgICAgICAgIGRldl9zZXRfbXNpX2RvbWFpbihkZXYsIG1zaV9k
b21haW4pOwo+ID4gICAgICAgICAgICAgICB9Cj4gPgo+ID4gICAgICAgICAgICAgICBpZiAoIWRl
dl9nZXRfbXNpX2RvbWFpbihkZXYpKQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAt
RVBST0JFX0RFRkVSOwo+Cj4gSSBzdGFuZCBieSBteSBwcmV2aW91cyBjb21tZW50IHRoYXQgcmVs
eWluZyBvbiBBQ1BJIGluaXRjYWxsIG9yZGVyIGFuZAo+IGFzc3VtaW5nIGZ3X2RldmxpbmsgaXMg
ZW5hYmxlZCBkb2Vzbid0IHJlYWxseSBzZWVtIHJvYnVzdCBlbm91Z2ggdG8KPiBqdXN0aWZ5IGRy
b3BwaW5nIHByb3BlciBoYW5kbGluZyBvZiB0aGlzIGNhc2UsIGVzcGVjaWFsbHkgaWYgcHJldGVu
ZGluZwo+IGl0J3MgYSBnZW5lcmljIGludGVyZmFjZS4KCkkgdGhpbmsgeW91IHN0aWxsIGZhaWwg
dG8gdW5kZXJzdGFuZCB0aGUgcm9vdC1jYXVzZSBvZiB0aGUgbXNpX2RvbWFpbiBub3QKYmVpbmcg
c2V0IGNvcnJlY3RseSBpbiB0aGUgc3RydWN0IGRldmljZS4gVGhlcmUgaXMgbm8gaXNzdWUgd2l0
aCB0aGUgcHJvYmUKb3JkZXIgKG9yIHByb2JlIGRlZmVycmFsKSByYXRoZXIgdGhlIGlzc3VlIGlz
IG1zaV9kb21haW4gYmVpbmcgc2V0IHZlcnkKZWFybHkgYnkgT0YgLyBBQ1BJIGZyYW1ld29yayBh
dCB0aGUgdGltZSBvZiBkZXZpY2UgY3JlYXRpb24gd2hlbiB0aGVyZQppcyBubyBNU0kgZG9tYWlu
IHJlZ2lzdGVyZWQuCgpMZXQncyB0YWtlIHRoZSBjYXNlIG9mIE9GIGJhc2VkIHBsYXRmb3JtIGRl
dmljZXMgd2l0aCBSSVNDLVY6CgoxKSBUaGUgT0YgZnJhbWV3b3JrIHNldCB0aGUgbXNpX2RvbWFp
biBhdCB0aGUgdGltZSBvZiBwbGF0Zm9ybQogICAgZGV2aWNlIGNyZWF0aW9uIGJ1dCB1bmZvcnR1
bmF0ZWx5IHRoZSBSSVNDLVYgTVNJIGNvbnRyb2xsZXIKICAgIGRyaXZlciBpcyBhbHNvIGEgcGxh
dGZvcm0gZGV2aWNlIChha2EgUklTQy1WIElNU0lDIGRyaXZlcikgd2hpY2gKICAgIGlzIHByb2Jl
ZCBtdWNoIGxhdHRlciBoZW5jZSB0aGUgbXNpX2RvbWFpbiBmb3IgYWxsIE9GIHBsYXRmb3JtCiAg
ICBkZXZpY2VzIGlzIHNldCB0byBOVUxMLgogICAgKFJlZmVyIGNhbGwgcGF0aCwgIG9mX3BsYXRm
b3JtX2RldmljZV9jcmVhdGVfcGRhdGEoKSAtPgpvZl9tc2lfY29uZmlndXJlKCkgLT4gZGV2X3Nl
dF9tc2lfZG9tYWluKCkKCjIpIFRoZSBmd19kZXZsaW5rIGJhc2VkIHByb2JlIG9yZGVyaW5nIGlu
IHRoZSBMaW51eCBERCBmcmFtZXdvcmsKICAgIGVuc3VyZXMgdGhhdCBSSVNDLVYgTVNJIGNvbnRy
b2xsZXIgZHJpdmVyIGlzIHByb2JlZCBiZWZvcmUgdGhlCiAgICBNU0kgY2xpZW50IGRyaXZlcnMg
KHN1Y2ggYXMgUklTQy1WIEFQTElDIE1TSSBkcml2ZXIsIFJJU0MtVgogICAgc3lzdGVtIE1TSSBk
cml2ZXIsIGV0YykgYnV0IHN0aWxsIHdoZW4gdGhlc2UgTVNJIGNsaWVudCBkcml2ZXJzCiAgICBh
cmUgcHJvYmVkIHRoZSBtc2lfZG9tYWluIHJlbWFpbnMgTlVMTCBmb3IgdGhlIHBsYXRmb3JtIGRl
dmljZQogICAgb2YgTVNJIGNsaWVudC4KCjMpIER1ZSB0byAjMSBhbmQgIzIgYWJvdmUsIHRoZSBN
U0kgY2xpZW50IGRyaXZlciBoYXZlIHRvIGV4cGxpY2l0bGx5CiAgICBjYWxsIG9mX21zaV9jb25m
aWd1cmUoKSBvbiBSSVNDLVYgYmVjYXVzZSBubyBvbmUgdXBkYXRlcyB0aGUKICAgIG1zaV9kb21h
aW4gb2YgYWxsIHBsYXRmb3JtIGRldmljZXMgYWZ0ZXIgUklTQy1WIE1TSSBjb250cm9sbGVyCiAg
ICByZWdpc3RlcnMgYSBNU0kgaXJxZG9tYWluLgoKVGhpcyBwYXRjaCBlbGltaW5hdGVzIHRoZSAj
MyBhYm92ZSBieSBjYWxsaW5nIG9mX21zaV9jb25maWd1cmUoKQpyaWdodCBiZWZvcmUgcHJvYmlu
ZyB0aGUgT0YgcGxhdGZvcm0gZGV2aWNlLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
