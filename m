Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B813CD8CA8
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 12:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qOKNNyuKumHrnz8iB9BzryO2w8GcHIktIbiPcBTmF/s=; b=kTDNk2d+0p51/B
	Kj9eY2Z/FxSHFyC3n7+7tzKLca/5drWVAiNgvSdPDWKZtPwXLei1fOm1SWDmsEsUjUCVYDMO51s9X
	LzPmV6Tjt7ovVfAM0wHJbf0T4cYMPeg5QEyXMolB1S1W7wCLsyhhlolAv1cEEdsHM8zj8XNScrCNc
	+OFj4ilvn+FpQcEbUKrOenlZRai3j55mUViYIPmw8gon17Yx7jAejM5swlOfUTuPcwiF5K5oFc8yl
	b1UXB9rNqQg5hlVsPR1nI4RRgrQ2ACjD9AnvoXmrFcwDeCSMSWov+Gidd3iXPWvWmXXRjE/2JRIo8
	u1sV4J+PRtFye5nDWmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZRP-00000003XXY-1SRq;
	Mon, 08 Jun 2026 12:50:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZRN-00000003XXL-3q6o
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 12:50:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 14157601F1
	for <linux-riscv@lists.infradead.org>; Mon,  8 Jun 2026 12:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76291F0089F
	for <linux-riscv@lists.infradead.org>; Mon,  8 Jun 2026 12:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780923052;
	bh=g4Thl8BELdVNhJiRU1vcOCa2kz5Q3sBldxjcDoBGFQA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lshdfBTP1uMAXI1y1cg+Gga4NAIuXg+VDm3PVkcQaozqo9hehWHPRiAOE1xhD+pNM
	 4xXh4VHy7efOlfzfVAXBqWvYWF2CmdM19sKwxWlafoDFL2ftUFxdPJmfL8jgL8kKCe
	 kCafBotIzr9ahms4YJC12insIxYQqrMljG08Qk18ndNCXU425IPx7ncLLKnIXxRMIV
	 a7ztoXmwNFBTULWAij86WNV+K34kmrYARZ0BakntheLFAIO2HEOSLCyXHzZgft9jXn
	 lcWfItZGmZVZst9Xnyu0WEQuavuOnCT+BppwPR3eQQLzYn4vw1B5oqgHMz1gM5xhMD
	 ivTV1dr+orUkw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39677aed4d3so37853501fa.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 05:50:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/DtdvQ22O2RNcsA1xDCYf9s3kS9szMGttL01Jl85gKLRYzjD7LsiJuCunvhz5UkHRb9C4b51vvBpF5LQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHlT3XQbzKmFsu6QwX95tieQ8KopgnAFWtyVFtW+Kp5kPOqCZF
	QnBc3YyIycfLBV5tRUXX8/mNlTC6ZqEnekt7ZkIau0TM9h18cxFjbckBK0ghMooOQbgPsGJflsi
	1OGIeQaG3I9PqFt5NqOxI7tAQ0KvVXVQ=
X-Received: by 2002:a05:6512:2903:b0:5aa:6938:d873 with SMTP id
 2adb3069b0e04-5aa87bc2343mr2965397e87.26.1780923051088; Mon, 08 Jun 2026
 05:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-5-23ffa16b6ebb@kernel.org>
In-Reply-To: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-5-23ffa16b6ebb@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 8 Jun 2026 14:50:32 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g86XVdkFE0W9xii1XdUMPX0tOd83_SvYDao+YjvYo4kg@mail.gmail.com>
X-Gm-Features: AVVi8CeypFZ6kot-UUapVy4urjC3Q0NEKKlzcfTvjHLJKqyoe8uhxJKP5O_AM1M
Message-ID: <CAJZ5v0g86XVdkFE0W9xii1XdUMPX0tOd83_SvYDao+YjvYo4kg@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] ACPI/IORT: Implement ACPI infrastructure to enable
 GICv5 IWB probe deferral
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, linux-acpi@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, loongarch@lists.linux.dev, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gMywgMjAyNiBhdCAxMDoyMeKAr0FNIExvcmVuem8gUGllcmFsaXNpIDxscGll
cmFsaXNpQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSW1wbGVtZW50IGFuIElPUlQgQUNQSSBob29r
IHRvIHJldHJpZXZlIHRoZSBhY3BpX2hhbmRsZSBvZiB0aGUgaW50ZXJydXB0Cj4gY29udHJvbGxl
ciBoYW5kbGluZyBhIHNwZWNpZmljIEdTSSAoaWYgYW55LCBvbiBHSUN2NSBzeXN0ZW1zIG9ubHkg
dGhlIElXQgo+IGlzIHJlcHJlc2VudGVkIGluIGZpcm13YXJlIHdpdGggYW4gQUNQSSBkZXZpY2Ug
b2JqZWN0KSBhbmQgYWRkIHRoZSBJV0IgdG8KPiB0aGUgbGlzdCBvZiBkZXZpY2VzIHdob3NlIGRl
cGVuZGVuY2llcyBjYW4gYmUgZGV0ZWN0ZWQgKGFuZCBjbGVhcmVkKSBpbgo+IEFDUEkgY29yZSB0
byBndWFyYW50ZWUgdGhhdCBwcm9iZSBkZXBlbmRlbmNpZXMgZm9yIHRoZSBJV0IgY2FuIGJlCj4g
c2F0aXNmaWVkLgo+Cj4gRW5hYmxlIGF1dG9kZXAgZGV0ZWN0aW9uIGZvciBhcm02NCBieSBhZGRp
bmcgdGhlIGFyY2hfYWNwaV9hZGRfYXV0b19kZXAoKQo+IGNhbGxiYWNrIGluIHRoZSBBQ1BJIElP
UlQgZHJpdmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogTG9yZW56byBQaWVyYWxpc2kgPGxwaWVyYWxp
c2lAa2VybmVsLm9yZz4KPiBDYzogSGFuanVuIEd1byA8Z3VvaGFuanVuQGh1YXdlaS5jb20+Cj4g
Q2M6IFN1ZGVlcCBIb2xsYSA8c3VkZWVwLmhvbGxhQGtlcm5lbC5vcmc+Cj4gQ2M6ICJSYWZhZWwg
Si4gV3lzb2NraSIgPHJhZmFlbEBrZXJuZWwub3JnPgoKQWNrZWQtYnk6ICJSYWZhZWwgSi4gV3lz
b2NraSIgKEludGVsKSA8cmFmYWVsQGtlcm5lbC5vcmc+ICMgQUNQSTogc2Nhbi5jCgpUaGUgcmVz
dCBvZiB0aGUgc2VyaWVzIGlzIGtpbmQgb2Ygb3V0c2lkZSBteSBzY29wZSBhbmQgYWxsIG9mIHRo
ZQpwcmV2aW91cyBwYXRjaGVzIHdvdWxkIGF0IGxlYXN0IHJlcXVpcmUgYW4gQUNLIGZyb20gdGhl
IFJJU0MtViBwZW9wbGUuCgo+IC0tLQo+ICBkcml2ZXJzL2FjcGkvYXJtNjQvaW9ydC5jIHwgMjIg
KysrKysrKysrKysrKysrKysrKy0tLQo+ICBkcml2ZXJzL2FjcGkvc2Nhbi5jICAgICAgIHwgIDEg
Kwo+ICBpbmNsdWRlL2xpbnV4L2FjcGlfaW9ydC5oIHwgIDMgKystCj4gIDMgZmlsZXMgY2hhbmdl
ZCwgMjIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2FjcGkvYXJtNjQvaW9ydC5jIGIvZHJpdmVycy9hY3BpL2FybTY0L2lvcnQuYwo+IGluZGV4
IGFmN2E5YjJmZDViYy4uMzQ0MTJjZDY5N2Q4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYWNwaS9h
cm02NC9pb3J0LmMKPiArKysgYi9kcml2ZXJzL2FjcGkvYXJtNjQvaW9ydC5jCj4gQEAgLTc4OSwx
MSArNzg5LDkgQEAgc3RydWN0IGlycV9kb21haW4gKmlvcnRfZ2V0X2RldmljZV9kb21haW4oc3Ry
dWN0IGRldmljZSAqZGV2LCB1MzIgaWQsCj4gICAgICAgICByZXR1cm4gaXJxX2ZpbmRfbWF0Y2hp
bmdfZndub2RlKGhhbmRsZSwgYnVzX3Rva2VuKTsKPiAgfQo+Cj4gLXN0cnVjdCBmd25vZGVfaGFu
ZGxlICppb3J0X2l3Yl9oYW5kbGUodTMyIGl3Yl9pZCkKPiArYWNwaV9oYW5kbGUgaW9ydF9pd2Jf
aGFuZGxlKHUzMiBpd2JfaWQpCj4gIHsKPiAtICAgICAgIHN0cnVjdCBmd25vZGVfaGFuZGxlICpm
d25vZGU7Cj4gICAgICAgICBzdHJ1Y3QgYWNwaV9pb3J0X25vZGUgKm5vZGU7Cj4gLSAgICAgICBz
dHJ1Y3QgYWNwaV9kZXZpY2UgKmRldmljZTsKPiAgICAgICAgIHN0cnVjdCBhY3BpX2lvcnRfaXdi
ICppd2I7Cj4gICAgICAgICBhY3BpX3N0YXR1cyBzdGF0dXM7Cj4gICAgICAgICBhY3BpX2hhbmRs
ZSBoYW5kbGU7Cj4gQEAgLTgwOCw2ICs4MDYsMTkgQEAgc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmlv
cnRfaXdiX2hhbmRsZSh1MzIgaXdiX2lkKQo+ICAgICAgICAgaWYgKEFDUElfRkFJTFVSRShzdGF0
dXMpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPgo+ICsgICAgICAgcmV0dXJuIGhh
bmRsZTsKPiArfQo+ICsKPiArc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmlvcnRfaXdiX2hhbmRsZV9m
d25vZGUodTMyIGl3Yl9pZCkKPiArewo+ICsgICAgICAgc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3
bm9kZTsKPiArICAgICAgIHN0cnVjdCBhY3BpX2RldmljZSAqZGV2aWNlOwo+ICsgICAgICAgYWNw
aV9oYW5kbGUgaGFuZGxlOwo+ICsKPiArICAgICAgIGhhbmRsZSA9IGlvcnRfaXdiX2hhbmRsZShp
d2JfaWQpOwo+ICsgICAgICAgaWYgKCFoYW5kbGUpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBO
VUxMOwo+ICsKPiAgICAgICAgIGRldmljZSA9IGFjcGlfZ2V0X2FjcGlfZGV2KGhhbmRsZSk7Cj4g
ICAgICAgICBpZiAoIWRldmljZSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gQEAg
LTIwOTAsNiArMjEwMSwxMSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgaW9ydF9pbml0X3BsYXRmb3Jt
X2RldmljZXModm9pZCkKPiAgICAgICAgIH0KPiAgfQo+Cj4gK3UzMiBhcmNoX2FjcGlfYWRkX2F1
dG9fZGVwKGFjcGlfaGFuZGxlIGhhbmRsZSkKPiArewo+ICsgICAgICAgcmV0dXJuIGFjcGlfaXJx
X2FkZF9hdXRvX2RlcChoYW5kbGUpOwo+ICt9Cj4gKwo+ICB2b2lkIF9faW5pdCBhY3BpX2lvcnRf
aW5pdCh2b2lkKQo+ICB7Cj4gICAgICAgICBhY3BpX3N0YXR1cyBzdGF0dXM7Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvYWNwaS9zY2FuLmMgYi9kcml2ZXJzL2FjcGkvc2Nhbi5jCj4gaW5kZXggNTMw
NTQ3Y2RhOGIyLi5iYTE1ZGE5MDU4ZGMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9hY3BpL3NjYW4u
Ywo+ICsrKyBiL2RyaXZlcnMvYWNwaS9zY2FuLmMKPiBAQCAtODU2LDYgKzg1Niw3IEBAIHN0YXRp
YyBjb25zdCBjaGFyICogY29uc3QgYWNwaV9pZ25vcmVfZGVwX2lkc1tdID0gewo+Cj4gIC8qIExp
c3Qgb2YgSElEcyBmb3Igd2hpY2ggd2UgaG9ub3IgZGVwcyBvZiBtYXRjaGluZyBBQ1BJIGRldnMs
IHdoZW4gY2hlY2tpbmcgX0RFUCBsaXN0cy4gKi8KPiAgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25z
dCBhY3BpX2hvbm9yX2RlcF9pZHNbXSA9IHsKPiArICAgICAgICJBUk1IMDAwMyIsIC8qIEFSTSBH
SUN2NSBJV0IgKi8KPiAgICAgICAgICJJTlQzNDcyIiwgLyogQ2FtZXJhIHNlbnNvciBQTUlDIC8g
Y2xrIGFuZCByZWd1bGF0b3IgaW5mbyAqLwo+ICAgICAgICAgIklOVEMxMDU5IiwgLyogSVZTQyAo
VEdMKSBkcml2ZXIgbXVzdCBiZSBsb2FkZWQgdG8gYWxsb3cgaTJjIGFjY2VzcyB0byBjYW1lcmEg
c2Vuc29ycyAqLwo+ICAgICAgICAgIklOVEMxMDk1IiwgLyogSVZTQyAoQURMKSBkcml2ZXIgbXVz
dCBiZSBsb2FkZWQgdG8gYWxsb3cgaTJjIGFjY2VzcyB0byBjYW1lcmEgc2Vuc29ycyAqLwo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2FjcGlfaW9ydC5oIGIvaW5jbHVkZS9saW51eC9hY3Bp
X2lvcnQuaAo+IGluZGV4IDE3YmIzMzc0ZjRjYS4uOTMxZWFhN2JiZjZhIDEwMDY0NAo+IC0tLSBh
L2luY2x1ZGUvbGludXgvYWNwaV9pb3J0LmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2FjcGlfaW9y
dC5oCj4gQEAgLTI3LDcgKzI3LDggQEAgaW50IGlvcnRfcmVnaXN0ZXJfZG9tYWluX3Rva2VuKGlu
dCB0cmFuc19pZCwgcGh5c19hZGRyX3QgYmFzZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3X25vZGUpOwo+ICB2b2lkIGlvcnRfZGVyZWdp
c3Rlcl9kb21haW5fdG9rZW4oaW50IHRyYW5zX2lkKTsKPiAgc3RydWN0IGZ3bm9kZV9oYW5kbGUg
KmlvcnRfZmluZF9kb21haW5fdG9rZW4oaW50IHRyYW5zX2lkKTsKPiAtc3RydWN0IGZ3bm9kZV9o
YW5kbGUgKmlvcnRfaXdiX2hhbmRsZSh1MzIgaXdiX2lkKTsKPiArYWNwaV9oYW5kbGUgaW9ydF9p
d2JfaGFuZGxlKHUzMiBpd2JfaWQpOwo+ICtzdHJ1Y3QgZndub2RlX2hhbmRsZSAqaW9ydF9pd2Jf
aGFuZGxlX2Z3bm9kZSh1MzIgaXdiX2lkKTsKPgo+ICAjaWZkZWYgQ09ORklHX0FDUElfSU9SVAo+
ICB1MzIgaW9ydF9tc2lfbWFwX2lkKHN0cnVjdCBkZXZpY2UgKmRldiwgdTMyIGlkKTsKPgo+IC0t
Cj4gMi41NC4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
