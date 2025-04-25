Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4ABC369D1
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 11:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IdoaAgWRVLdVrZtDqkpHTLFseTTDB7dkMOVYQVNaNzI=; b=QMDbMg41hkLU4f
	YfNOkGybuiYBzhh2M6Tz238kdGtI6k/8f6rcgg+qJjQISZ47oMJmfd/brXgy3t2Bmco4UDzk0stBO
	7LLclz4KX01OMIsB1Xt9tkA/Ay0EaJ4oIOj1KiDfB1pvbnEt922TGFJZD3KKF/seQhP/cs2wMLEiz
	suEgMry1GPjeq6INT0RMEJK6zwUguRzjiPhSTYx2C7XbRyVUt9zBW9iReHV5+HgsM9OsyMWDn3Pa0
	OCjny28ElZPm1oalD8Z5Mfvv/sv6n3lqbSwoggpC5uYZ9bWFyAx+6SUIHsHI/5oZH9UeHt9Kopwmr
	E14xV4o+SoPxckPhubCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HKm-0000000Gz35-3fny;
	Fri, 25 Apr 2025 11:35:08 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8G1i-0000000Gfyd-2oml
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 10:11:23 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-6ff4faf858cso15682587b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Apr 2025 03:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745575881; x=1746180681; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6prVsylQnKDMIBjZXP4uOELttil8ar/HvFRq0ET36k=;
        b=K7YRH7A3+Ki6pV4yx9lydSkShQZ8GDlD1bSXB8FC31YKhJNv5XD6vGMmJnHcW6q8Z9
         +yJRGH8kTfkm30eaQJzFfpJahUqLdlU/xkMANsNJgeHtgjsAOKMxW7hnq+DMnAIJGX2R
         WMbTROfgbs+s9VS6Kac+tifE6TqNMi9Z8/ovEowSSGa936qQC8qL/iCwBRG0OuelvuIM
         ElZTe+1mbNas4I1AMHXVQWjhPu/Oz7UGJvSj6K+BqtJ2DUmmN0MAZ05KjJHp9dvRxJFV
         zGtdkeaCYW0gYg+1WtD3Wh/W1mD0bfhMnB8XikmShlKj7wVESLhVHQAWgUXbrIMvCNgw
         bFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745575881; x=1746180681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6prVsylQnKDMIBjZXP4uOELttil8ar/HvFRq0ET36k=;
        b=oO8fsNuGia+IEuGddknTihXIwO6rjaAF1nnXFQMO9ZDpXXQk1lvh8W2Zem/rUFc8Xk
         csTQgfc9rnqQKpJnEuPk2+mWLvB9Q37/1wBAFVqJAtJZ1YM4Ea/5LaomW8eefJxHeYAQ
         Fo8jzbuHb/tHA92U9AcEs34bW+lYthNH/JR0pUEP+YSA+PL9SgRl5QbCtd2q1ghlGsBA
         j+SKDsSyzRye9FwMHb0x3L3J60u06w7+n6oM//5Cxo81MxmicykKT2O8s5P9xtG9Z1vp
         2Kb8UOowbEdK+lDfOBBy0b2bj4JhKtRT3UGwZ5ewNQy8dK1ao6JPDN5uH09cK9n0pQa8
         E3NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyRWWANqC0s6jn47ffGJCPwRy//jriPd/7SaNQtSZarKT2XnMHIPjc/4P5YPUDb2gAkdFsOCW9ROEFDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRmfgViig8UCNkJ3qx/R67qridmiOB5IlvbhLXh+uatsjWJ6Yg
	EydL188JT71uqypvaWfSZnJn55LKglZJLXfYUQ7TcYPbFq+EjQ/JCZlhwCcY36w1QjmebqNHYpp
	v4gyRi25bUBRoc3mK4zwrjkNC82Zs4wAygr8UeA==
X-Gm-Gg: ASbGncvMdD88zjA9wgYAw5g2h55l+aUMrhduTFl9CNFhgjKVTN4iyPuIgmdgz3FipFp
	kkFMKQcV/xD+pVk2dwyIqo2ROAgQKgBOp7APmCOhFKVG0kSXKT1tsKIBGbYMvQ6uNqkfoKbNp4P
	lBFZ3WhG4xo1BJ30e+Cp9Lh1Q=
X-Google-Smtp-Source: AGHT+IGurFHGYwar2TKD3VtJNgOfTgLYu73UwsY3fMeiKx/80V1BEROWuydsOdDJ1TKv9Y5NtKhSq17Sa7k73YOZM/k=
X-Received: by 2002:a05:690c:4b0a:b0:708:3a47:3d2c with SMTP id
 00721157ae682-70854107cf6mr20217487b3.13.1745575881129; Fri, 25 Apr 2025
 03:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250414185314eucas1p1ae57b937773a2ed4ce8d52d5598eb028@eucas1p1.samsung.com>
 <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
 <20250414-apr_14_for_sending-v2-1-70c5af2af96c@samsung.com>
 <CAJZ5v0irRq8_p35vf41_ZgomW0X=KZN+0HqwU2K9PvPRm8iZQA@mail.gmail.com>
 <b9c4182d-38c2-4173-a35a-0e1773c8f2ed@samsung.com> <CAJZ5v0gE0anjW_mDSwNXY8xoZ_0=bDDxiSbUq1GP7-NycDojrQ@mail.gmail.com>
 <cbf20469-02ab-403a-8db7-2b66e9936b4f@samsung.com> <CAPDyKFqND2JrH8nLUzAqwWgHkwia6M9XOJoY6AqxtR0t120JUA@mail.gmail.com>
 <20250425-lumpy-marmot-of-popularity-cdbbcd@houat>
In-Reply-To: <20250425-lumpy-marmot-of-popularity-cdbbcd@houat>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 25 Apr 2025 12:10:45 +0200
X-Gm-Features: ATxdqUE_JbjUe45S3EVZ15Z84FoHvfu8q4ysbH-yq1WIOchBVAmKx33KA3qSxvM
Message-ID: <CAPDyKFp-Bguqukn0my9mVDdSyG2eQ3EPP+diD-BBg-P_E8S9=A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] PM: device: Introduce platform_resources_managed flag
To: Maxime Ripard <mripard@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, m.szyprowski@samsung.com, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_031122_741593_A4444E1D 
X-CRM114-Status: GOOD (  55.13  )
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

T24gRnJpLCAyNSBBcHIgMjAyNSBhdCAwOTowOSwgTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgMDY6NTE6
MDBQTSArMDIwMCwgVWxmIEhhbnNzb24gd3JvdGU6Cj4gPiBPbiBUaHUsIDE3IEFwciAyMDI1IGF0
IDE4OjE5LCBNaWNoYWwgV2lsY3p5bnNraQo+ID4gPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4g
d3JvdGU6Cj4gPiA+IE9uIDQvMTYvMjUgMTY6NDgsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+
ID4gPiA+IE9uIFdlZCwgQXByIDE2LCAyMDI1IGF0IDM6MzLigK9QTSBNaWNoYWwgV2lsY3p5bnNr
aQo+ID4gPiA+IDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+ID4gPiA+Pgo+ID4g
PiA+PiBPbiA0LzE1LzI1IDE4OjQyLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiA+ID4gPj4+
IE9uIE1vbiwgQXByIDE0LCAyMDI1IGF0IDg6NTPigK9QTSBNaWNoYWwgV2lsY3p5bnNraQo+ID4g
PiA+Pj4gPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4gPiA+ID4+Pj4KPiA+ID4g
Pj4+PiBJbnRyb2R1Y2UgYSBuZXcgZGV2X3BtX2luZm8gZmxhZyAtIHBsYXRmb3JtX3Jlc291cmNl
c19tYW5hZ2VkLCB0bwo+ID4gPiA+Pj4+IGluZGljYXRlIHdoZXRoZXIgcGxhdGZvcm0gUE0gcmVz
b3VyY2VzIHN1Y2ggYXMgY2xvY2tzIG9yIHJlc2V0cyBhcmUKPiA+ID4gPj4+PiBtYW5hZ2VkIGV4
dGVybmFsbHkgKGUuZy4gYnkgYSBnZW5lcmljIHBvd2VyIGRvbWFpbiBkcml2ZXIpIGluc3RlYWQg
b2YKPiA+ID4gPj4+PiBkaXJlY3RseSBieSB0aGUgY29uc3VtZXIgZGV2aWNlIGRyaXZlci4KPiA+
ID4gPj4+Cj4gPiA+ID4+PiBJIHRoaW5rIHRoYXQgdGhpcyBpcyBnZW5wZC1zcGVjaWZpYyBhbmQg
c28gSSBkb24ndCB0aGluayBpdCBiZWxvbmdzIGluCj4gPiA+ID4+PiBzdHJ1Y3QgZGV2X3BtX2lu
Zm8uCj4gPiA+ID4+Pgo+ID4gPiA+Pj4gVGhlcmUgaXMgZGV2LT5wb3dlci5zdWJzeXNfZGF0YS0+
ZG9tYWluX2RhdGEsIHdoeSBub3QgdXNlIGl0IGZvciB0aGlzPwo+ID4gPiA+Pgo+ID4gPiA+PiBI
aSBSYWZhZWwsCj4gPiA+ID4+Cj4gPiA+ID4+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLgo+ID4g
PiA+Pgo+ID4gPiA+PiBZb3UncmUgcmlnaHQg4oCUIHRoaXMgYmVoYXZpb3IgaXMgc3BlY2lmaWMg
dG8gZ2VucGQsIHNvIGVtYmVkZGluZyB0aGUgZmxhZwo+ID4gPiA+PiBkaXJlY3RseSBpbiBzdHJ1
Y3QgZGV2X3BtX2luZm8gbWF5IG5vdCBiZSB0aGUgYmVzdCBjaG9pY2UuIFVzaW5nCj4gPiA+ID4+
IGRldi0+cG93ZXIuc3Vic3lzX2RhdGEtPmRvbWFpbl9kYXRhIG1ha2VzIG1vcmUgc2Vuc2UgYW5k
IGF2b2lkcyBibG9hdGluZwo+ID4gPiA+PiB0aGUgY29yZSBQTSBzdHJ1Y3R1cmUuCj4gPiA+ID4+
Cj4gPiA+ID4+Pgo+ID4gPiA+Pj4gQWxzbywgaXQgc2hvdWxkIGJlIGRvY3VtZW50ZWQgd2F5IG1v
cmUgY29tcHJlaGVuc2l2ZWx5IElNVi4KPiA+ID4gPj4+Cj4gPiA+ID4+PiBXaG8gaXMgc3VwcG9z
ZWQgdG8gc2V0IGl0IGFuZCB3aGVuPyAgV2hhdCBkb2VzIGl0IG1lYW4gd2hlbiBpdCBpcyBzZXQ/
Cj4gPiA+ID4+Cj4gPiA+ID4+IFRvIGNsYXJpZnkgdGhlIGludGVuZGVkIHVzYWdlLCBJIHdvdWxk
IHByb3Bvc2UgYWRkaW5nIHRoZSBmb2xsb3dpbmcKPiA+ID4gPj4gZXhwbGFuYXRpb24gdG8gdGhl
IGNvbW1pdCBtZXNzYWdlOgo+ID4gPiA+Pgo+ID4gPiA+PiAiVGhpcyBmbGFnIGlzIGludGVuZGVk
IHRvIGJlIHNldCBieSBhIGdlbmVyaWMgUE0gZG9tYWluIGRyaXZlciAoZS5nLiwKPiA+ID4gPj4g
ZnJvbSB3aXRoaW4gaXRzIGF0dGFjaF9kZXYgY2FsbGJhY2spIHRvIGluZGljYXRlIHRoYXQgaXQg
d2lsbCBtYW5hZ2UKPiA+ID4gPj4gcGxhdGZvcm0gc3BlY2lmaWMgcnVudGltZSBwb3dlciBtYW5h
Z2VtZW50IHJlc291cmNlcyDigJQgc3VjaCBhcyBjbG9ja3MKPiA+ID4gPj4gYW5kIHJlc2V0cyDi
gJQgb24gYmVoYWxmIG9mIHRoZSBjb25zdW1lciBkZXZpY2UuIFRoaXMgaW1wbGllcyBhIGRlbGVn
YXRpb24KPiA+ID4gPj4gb2YgcnVudGltZSBQTSBjb250cm9sIHRvIHRoZSBQTSBkb21haW4sIHR5
cGljYWxseSBpbXBsZW1lbnRlZCB0aHJvdWdoCj4gPiA+ID4+IGl0cyBzdGFydCBhbmQgc3RvcCBj
YWxsYmFja3MuCj4gPiA+ID4+Cj4gPiA+ID4+IFdoZW4gdGhpcyBmbGFnIGlzIHNldCwgdGhlIGNv
bnN1bWVyIGRyaXZlciAoZS5nLiwgZHJtL2ltYWdpbmF0aW9uKSBjYW4KPiA+ID4gPj4gY2hlY2sg
aXQgYW5kIHNraXAgbWFuYWdpbmcgc3VjaCByZXNvdXJjZXMgaW4gaXRzIHJ1bnRpbWUgUE0gY2Fs
bGJhY2tzCj4gPiA+ID4+IChydW50aW1lX3N1c3BlbmQsIHJ1bnRpbWVfcmVzdW1lKSwgYXZvaWRp
bmcgY29uZmxpY3RzIG9yIHJlZHVuZGFudAo+ID4gPiA+PiBvcGVyYXRpb25zLiIKPiA+ID4gPgo+
ID4gPiA+IFRoaXMgc291bmRzIGdvb2QgYW5kIEkgd291bGQgYWxzbyBwdXQgaXQgaW50byBhIGNv
ZGUgY29tbWVudCBzb21ld2hlcmUuCj4gPiA+ID4KPiA+ID4gPiBJIGd1ZXNzIHlvdSdsbCBuZWVk
IGhlbHBlcnMgZm9yIHNldHRpbmcgYW5kIHRlc3RpbmcgdGhpcyBmbGFnLCBzbwo+ID4gPiA+IHRo
ZWlyIGtlcm5lbGRvYyBjb21tZW50cyBjYW4gYmUgdXNlZCBmb3IgdGhhdC4KPiA+ID4gPgo+ID4g
PiA+PiBUaGlzIGNvdWxkIGFsc28gYmUgaW5jbHVkZWQgYXMgYSBjb2RlIGNvbW1lbnQgbmVhciB0
aGUgZmxhZyBkZWZpbml0aW9uCj4gPiA+ID4+IGlmIHlvdSB0aGluayB0aGF04oCZcyBhcHByb3By
aWF0ZS4KPiA+ID4gPj4KPiA+ID4gPj4gQWxzbywgYXMgZGlzY3Vzc2VkIGVhcmxpZXIgd2l0aCBN
YXhpbWUgYW5kIE1hdHQgWzFdLCB0aGlzIGlzIG5vdCBhYm91dAo+ID4gPiA+PiBmdWxsICJyZXNv
dXJjZSBvd25lcnNoaXAsIiBidXQgbW9yZSBhYm91dCBkZWxlZ2F0aW5nIHJ1bnRpbWUgY29udHJv
bCBvZgo+ID4gPiA+PiBQTSByZXNvdXJjZXMgbGlrZSBjbG9ja3MvcmVzZXRzIHRvIHRoZSBnZW5w
ZC4gVGhhdCBudWFuY2UgbWF5IGJlIHdvcnRoCj4gPiA+ID4+IHJlZmxlY3RpbmcgaW4gdGhlIGZs
YWcgbmFtZSBhcyB3ZWxsLCBJIHdvdWxkIHJlbmFtZSBpdCB0byBsZXQncyBzYXkKPiA+ID4gPj4g
J3J1bnRpbWVfcG1fcGxhdGZvcm1fcmVzX2RlbGVnYXRlZCcsIG9yIG1vcmUgY29uY2lzZQo+ID4g
PiA+PiAncnVudGltZV9wbV9kZWxlZ2F0ZWQnLgo+ID4gPiA+Cj4gPiA+ID4gT3IganVzdCAicnBt
X2RlbGVnYXRlZCIgSSBzdXBwb3NlLgo+ID4gPiA+Cj4gPiA+ID4gQnV0IGlmIHRoZSBnZW5wZCBk
cml2ZXIgaXMgZ29pbmcgdG8gc2V0IHRoYXQgZmxhZywgaXQgd2lsbCByYXRoZXIgbWVhbgo+ID4g
PiA+IHRoYXQgdGhpcyBkcml2ZXIgd2lsbCBub3cgY29udHJvbCB0aGUgcmVzb3VyY2VzIGluIHF1
ZXN0aW9uLCBzbyB0aGUKPiA+ID4gPiBkcml2ZXIgc2hvdWxkIG5vdCBhdHRlbXB0IHRvIG1hbmlw
dWxhdGUgdGhlbSBkaXJlY3RseS4gIElzIG15Cj4gPiA+ID4gdW5kZXJzdGFuZGluZyBjb3JyZWN0
Pwo+ID4gPgo+ID4gPiBZZXMsIHlvdXIgdW5kZXJzdGFuZGluZyBpcyBjb3JyZWN0IOKAlCB3aXRo
IG9uZSBtaW5vciBjbGFyaWZpY2F0aW9uLgo+ID4gPgo+ID4gPiBXaGVuIHRoZSBnZW5wZCBkcml2
ZXIgc2V0cyB0aGUgZmxhZywgaXQgaW5kaWNhdGVzIHRoYXQgaXQgd2lsbCB0YWtlIG92ZXIKPiA+
ID4gY29udHJvbCBvZiB0aGUgcmVsZXZhbnQgUE0gcmVzb3VyY2VzIGluIHRoZSBjb250ZXh0IG9m
IHJ1bnRpbWUgUE0sIGkuZS4sCj4gPiA+IHZpYSBpdHMgc3RhcnQoKSBhbmQgc3RvcCgpIGNhbGxi
YWNrcy4gQXMgYSByZXN1bHQsIHRoZSBkZXZpY2UgZHJpdmVyCj4gPiA+IHNob3VsZCBub3QgbWFu
aXB1bGF0ZSB0aG9zZSByZXNvdXJjZXMgZnJvbSB3aXRoaW4gaXRzIFJVTlRJTUVfUE1fT1BTCj4g
PiA+IChlLmcuLCBydW50aW1lX3N1c3BlbmQsIHJ1bnRpbWVfcmVzdW1lKSB0byBhdm9pZCBjb25m
bGljdHMuCj4gPiA+Cj4gPiA+IEhvd2V2ZXIsIG91dHNpZGUgb2YgdGhlIHJ1bnRpbWUgUE0gY2Fs
bGJhY2tzLCB0aGUgY29uc3VtZXIgZGV2aWNlIGRyaXZlcgo+ID4gPiBtYXkgc3RpbGwgYWNjZXNz
IG9yIHVzZSB0aG9zZSByZXNvdXJjZXMgaWYgbmVlZGVkIGUuZyBmb3IgZGV2ZnJlcS4KPiA+ID4K
PiA+ID4gPgo+ID4gPiA+IEFzc3VtaW5nIHRoYXQgaXQgaXMgY29ycmVjdCwgaG93IGlzIHRoZSBk
ZXZpY2UgZHJpdmVyIGdvaW5nIHRvIGtub3cKPiA+ID4gPiB3aGljaCByZXNvdXJjZXMgaW4gcGFy
dGljdWxhciBhcmUgbm93IGNvbnRyb2xsZWQgYnkgdGhlIGdlbnBkIGRyaXZlcj8KPiA+ID4KPiA+
ID4gR29vZCBxdWVzdGlvbiDigJQgdG8gYWxsb3cgZmluZXItZ3JhaW5lZCBjb250cm9sLCB3ZSBj
b3VsZCByZXBsYWNlIHRoZQo+ID4gPiBjdXJyZW50IHNpbmdsZSBib29sZWFuIGZsYWcgd2l0aCBh
IHUzMiBiaXRtYXNrIGZpZWxkLiBFYWNoIGJpdCB3b3VsZAo+ID4gPiBjb3JyZXNwb25kIHRvIGEg
c3BlY2lmaWMgY2F0ZWdvcnkgb2YgcGxhdGZvcm0gbWFuYWdlZCByZXNvdXJjZXMuIEZvcgo+ID4g
PiBleGFtcGxlOgo+ID4gPgo+ID4gPiAjZGVmaW5lIFJQTV9UQUtFT1ZFUl9DTEsgICAgICAgIEJJ
VCgwKQo+ID4gPiAjZGVmaW5lIFJQTV9UQUtFT1ZFUl9SRVNFVCAgICAgIEJJVCgxKQo+ID4gPgo+
ID4gPiBUaGlzIHdvdWxkIGFsbG93IGEgUE0gZG9tYWluIGRyaXZlciB0byBzZWxlY3RpdmVseSBk
ZWNsYXJlIHdoaWNoCj4gPiA+IHJlc291cmNlcyBpdCBpcyB0YWtpbmcgb3ZlciBhbmQgbGV0IHRo
ZSBjb25zdW1lciBkcml2ZXIgcXVlcnkgb25seSB0aGUKPiA+ID4gcmVsZXZhbnQgcGFydHMuCj4g
Pgo+ID4gQXNzdW1pbmcgd2UgYXJlIHRhcmdldGluZyBkZXZpY2Ugc3BlY2lmaWMgcmVzb3VyY2Vz
IGZvciBydW50aW1lIFBNOwo+ID4gd2h5IHdvdWxkIHdlIHdhbnQgdGhlIGRyaXZlciB0byBiZSBy
ZXNwb25zaWJsZSBmb3Igc29tZSByZXNvdXJjZXMgYW5kCj4gPiB0aGUgZ2VucGQgcHJvdmlkZXIg
Zm9yIHNvbWUgb3RoZXJzPyBJIHdvdWxkIGFzc3VtZSB3ZSB3YW50IHRvIGhhbmRsZQo+ID4gYWxs
IHRoZXNlIFJQTS1yZXNvdXJjZXMgZnJvbSB0aGUgZ2VucGQgcHJvdmlkZXIsIGlmL3doZW4gcG9z
c2libGUsCj4gPiByaWdodD8KPiA+Cj4gPiBUaGUgdHJpY2t5IHBhcnQgdGhvdWdoIChtYXliZSBT
dGVwaGVuIGhhZCBzb21lIGlkZWFzIGluIGhpcyB0YWxrIFthXQo+ID4gYXQgT1NTKSwgaXMgdG8g
dGVhY2ggdGhlIGdlbnBkIHByb3ZpZGVyIGFib3V0IHdoYXQgcmVzb3VyY2VzIGl0IHNob3VsZAo+
ID4gaGFuZGxlLiBJbiBwcmluY2lwbGUgdGhlIGdlbnBkIHByb3ZpZGVyIHdpbGwgbmVlZCBzb21l
IGtpbmQgb2YgZGV2aWNlCj4gPiBzcGVjaWZpYyBrbm93bGVkZ2UsIHBlcmhhcHMgYmFzZWQgb24g
dGhlIGRldmljZSdzIGNvbXBhdGlibGUtc3RyaW5nCj4gPiBhbmQgZGVzY3JpcHRpb24gaW4gRFQu
Cj4gPgo+ID4gTXkgcG9pbnQgaXMsIHVzaW5nIGEgYml0bWFzayBkb2Vzbid0IHNjYWxlIGFzIGl0
IHdvdWxkIGVuZCB1cCBoYXZpbmcKPiA+IG9uZSBiaXQgZm9yIGVhY2ggY2xvY2sgKGEgZGV2aWNl
IG1heSBoYXZlIG11bHRpcGxlIGNsb2NrcyksIHJlZ3VsYXRvciwKPiA+IHBpbmN0cmwsIHBoeSwg
ZXRjLiBJbiBwcmluY2lwbGUsIHJlZmxlY3RpbmcgdGhlIGRlc2NyaXB0aW9uIGluIERULgo+Cj4g
TXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGl0J3MgdG8gYWRkcmVzcyBhIHNpdHVhdGlvbiB3aGVy
ZSBhICJnZW5lcmljIgo+IGRyaXZlciBpbnRlcmFjdHMgd2l0aCBzb21lIHBsYXRmb3JtIHNwZWNp
ZmljIGNvZGUuIEkgdGhpbmsgaXQncyB0aWVkIHRvCj4gdGhlIGRpc2N1c3Npb24gd2l0aCB0aGUg
aW1hZ2luYXRpb24gR1BVIGRyaXZlciBoYW5kbGluZyBoaXMgY2xvY2tzLCBhbmQKPiB0aGUgcGxh
dGZvcm0gZ2VucGQgY2xvY2tzIG92ZXJsYXBwaW5nIGEgYml0Lgo+Cj4gQnV0IHRoZW4sIG15IHF1
ZXN0aW9uIGlzOiBkb2VzIGl0IG1hdHRlcj8gY2xvY2tzIGFyZSByZWZjb3VudGVkLCBhbmQKPiBy
ZXNldHMgYXJlIGFzIHdlbGwgaWlyYywgc28gd2h5IGRvIHdlIG5lZWQgYSB0cmFuc2l0aW9uIGF0
IGFsbD8gQ2FuJ3Qgd2UKPiBqdXN0IGxldCB0aGUgcGxhdGZvcm0gZ2VucGQgY29kZSB0YWtlIGEg
cmVmZXJlbmNlIG9uIHRoZSBjbG9jaywgdGhlIEdQVQo+IGRyaXZlciB0YWtlIG9uZSBhcyB3ZWxs
LCBhbmQgaXQncyBhbGwgZ29vZCwgcmlnaHQ/CgpUaGUgcHJvYmxlbSBpcyB0aGUgcG93ZXItc2Vx
dWVuY2luZyB0aGF0IGlzIG5lZWRlZCB0byBpbml0aWFsaXplIHRoZQpHUFUuIEhhdmUgYSBsb29r
IGF0IHBhdGNoMydzIGNvbW1pdCBtZXNzYWdlIC0gYW5kIEkgdGhpbmsgaXQgd2lsbCBiZQpjbGVh
cmVyIHdoYXQgaXMgbmVlZGVkLgoKSW4gbXkgbGFzdCByZXBseSBmb3IgcGF0Y2ggMy80LCBJIGFt
IHN1Z2dlc3RpbmcgdGhpcyB3aG9sZSB0aGluZyBtYXkKYmUgYmV0dGVyIG1vZGVsZWQgYXMgYSBy
ZWFsIHBvd2VyLXNlcXVlbmNlLCB1c2luZyB0aGUgbmV3IHN1YnN5c3RlbSBpbgpkcml2ZXJzL3Bv
d2VyL3NlcXVlbmNpbmcvKgoKS2luZCByZWdhcmRzClVmZmUKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
