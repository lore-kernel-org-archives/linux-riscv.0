Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3317EE6452
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 10:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djKCgWDZSlsjKEIlqA436ouz5hsbRgf4HpWj2iCoUlU=; b=anG/SFjjBIHYka
	nCeL4a5x0h28ibkdPcgY1hNgkl/ohTyI+MQeGWrklNlNHN8Lm2NnouCOUdbTFpZb1/PPHd6zWNnyI
	ZQBG2S2G/e73gXUe0MrLQerkkTmtzThDfJzqxiqUhdqgI6pmfCpF4DVzmOXB94pAy0iZTIRVWk2mO
	3pf3QdmU3PFk+I3CASnlS+oGEIkIIcB0lVT2G+txAusZIzITinDbL4hl/eEpFFGRZQvAWnx5Utt3c
	Bucx6rErf7wYsCtDEb0f5kS7gVpX5i4SEgibnwRDFPuZT8I2GGWZVIx33AKONDTjUtJZ4nRRQXgSf
	kjK59RossJnKJi/cDwwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh5x0-00ANnN-2q;
	Fri, 15 Sep 2023 10:21:26 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh5ww-00ANmF-1i;
	Fri, 15 Sep 2023 10:21:23 +0000
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3ab8e324725so381259b6e.0;
        Fri, 15 Sep 2023 03:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694773280; x=1695378080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2EQISS+TI6FymgehjVGYiebl+s7fB1qqSBohFwF18Y=;
        b=P+EF0FsrvfxiZzYsgJcxvnPGgsJWQ80+EHolMWAD/Xz7rLHVbXCddmkCSVAps8Q1KM
         lJAgjc+UJWEMXIejFuJT6ifLjgIU0VZX15qhZeKoUhLHAp0STyNBuN+uPf/Vl3f1jzDU
         QBCJsx4to6Laz/gJidwIx8VGnPLfZWunbTMVKO3MpYmXVjHM3rmqr9wprAo3WCo2fn9V
         Zf9Tq0aZ+wRN/iuEdI+EFbz7OWsfporzQ0VjQ+ccnb8GxzjNHaIsWzCChuCH6w4m4BWx
         1rM4ZvrXhsgD3vDQOrPxbnSJsrt2j7KV3xbDM34AawB1WuuQ/V6bO7ymDvat9i3ezf3F
         lJrg==
X-Gm-Message-State: AOJu0Yze2/dj3DSaFnUxX8fn0W0664v4joIA+7op+XoAhPvpIkSwZdS7
	bfi2P2pTx9he48tVGGd+OoKztNa9ftPVSlHOg/s=
X-Google-Smtp-Source: AGHT+IE91hPOK8y/kVeJFKJe8XyQhu0n/Q+0x2/bog6c455z4TN1+FSBkfJT1sJVgSvtor6J5rMGJgfx0mnsyytHqT0=
X-Received: by 2002:a4a:de83:0:b0:56e:94ed:c098 with SMTP id
 v3-20020a4ade83000000b0056e94edc098mr1206706oou.0.1694773279760; Fri, 15 Sep
 2023 03:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230913163823.7880-1-james.morse@arm.com> <20230913163823.7880-28-james.morse@arm.com>
 <CAMj1kXHRAt7ecB9p_dm3MjDL5wZkAsVh30hMY2SV_XUe=bm6Vg@mail.gmail.com>
 <20230914155459.00002dba@Huawei.com> <CAMj1kXFquiLGCMow3iujHUU4GBZx2t9KfKy1R9iqjBFjY+acaA@mail.gmail.com>
 <f5d9beea95e149ab89364dcdb0f8bf69@huawei.com> <ZQQDJT6MOaIOPmq5@shell.armlinux.org.uk>
 <CAJZ5v0jUQ+4G5ArYAtu1gvYF4356CK_QVTO4oWn0ukwdOiZaHA@mail.gmail.com> <80e36ff513504a0382a1cbce83e42295@huawei.com>
In-Reply-To: <80e36ff513504a0382a1cbce83e42295@huawei.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 15 Sep 2023 12:21:08 +0200
Message-ID: <CAJZ5v0gou9Pdj_CPC=vLJ-6S-hz+0VY+GMgXcRJk=6t9mL1ykw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 27/35] ACPICA: Add new MADT GICC flags fields [code first?]
To: Salil Mehta <salil.mehta@huawei.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Ard Biesheuvel <ardb@kernel.org>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	James Morse <james.morse@arm.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "x86@kernel.org" <x86@kernel.org>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, "jianyong.wu@arm.com" <jianyong.wu@arm.com>, 
	"justin.he@arm.com" <justin.he@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_032122_595921_09039D73 
X-CRM114-Status: GOOD (  18.95  )
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

T24gRnJpLCBTZXAgMTUsIDIwMjMgYXQgMTE6MzTigK9BTSBTYWxpbCBNZWh0YSA8c2FsaWwubWVo
dGFAaHVhd2VpLmNvbT4gd3JvdGU6Cj4KPgo+ID4gRnJvbTogUmFmYWVsIEouIFd5c29ja2kgPHJh
ZmFlbEBrZXJuZWwub3JnPgo+ID4gU2VudDogRnJpZGF5LCBTZXB0ZW1iZXIgMTUsIDIwMjMgOTo0
NSBBTQo+ID4gVG86IFJ1c3NlbGwgS2luZyAoT3JhY2xlKSA8bGludXhAYXJtbGludXgub3JnLnVr
Pgo+ID4gQ2M6IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPjsgQXJkIEJpZXNo
ZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz47Cj4gPiBKb25hdGhhbiBDYW1lcm9uIDxqb25hdGhhbi5j
YW1lcm9uQGh1YXdlaS5jb20+OyBKYW1lcyBNb3JzZQo+ID4gPGphbWVzLm1vcnNlQGFybS5jb20+
OyBsaW51eC1wbUB2Z2VyLmtlcm5lbC5vcmc7IGxvb25nYXJjaEBsaXN0cy5saW51eC5kZXY7Cj4g
PiBsaW51eC1hY3BpQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJjaEB2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LQo+ID4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnOyBsaW51eC0KPiA+IHJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc7IGt2
bWFybUBsaXN0cy5saW51eC5kZXY7IHg4NkBrZXJuZWwub3JnOyBKZWFuLQo+ID4gUGhpbGlwcGUg
QnJ1Y2tlciA8amVhbi1waGlsaXBwZUBsaW5hcm8ub3JnPjsgamlhbnlvbmcud3VAYXJtLmNvbTsK
PiA+IGp1c3Rpbi5oZUBhcm0uY29tCj4gPiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCB2MiAyNy8z
NV0gQUNQSUNBOiBBZGQgbmV3IE1BRFQgR0lDQyBmbGFncyBmaWVsZHMKPiA+IFtjb2RlIGZpcnN0
P10KPiA+Cj4gPiBPbiBGcmksIFNlcCAxNSwgMjAyMyBhdCA5OjA54oCvQU0gUnVzc2VsbCBLaW5n
IChPcmFjbGUpCj4gPiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+ID4KPiA+ID4g
T24gRnJpLCBTZXAgMTUsIDIwMjMgYXQgMDI6Mjk6MTNBTSArMDAwMCwgU2FsaWwgTWVodGEgd3Jv
dGU6Cj4gPiA+ID4gT24geDg2LCBkdXJpbmcgaW5pdCwgaWYgdGhlIE1BRFQgZW50cnkgZm9yIExB
UElDIGlzIGZvdW5kIHRvIGJlCj4gPiA+ID4gb25saW5lLWNhcGFibGUgYW5kIGlzIGVuYWJsZWQg
YXMgd2VsbCB0aGVuIHBvc3NpYmxlIGFuZCBwcmVzZW50Cj4gPiA+Cj4gPiA+IE5vdGUgdGhhdCB0
aGUgQUNQSSBzcGVjIHNheXMgZW5hYmxlZCArIG9ubGluZS1jYXBhYmxlIGlzbid0IGRlZmluZWQu
Cj4gPiA+Cj4gPiA+ICJUaGUgaW5mb3JtYXRpb24gY29udmV5ZWQgYnkgdGhpcyBiaXQgZGVwZW5k
cyBvbiB0aGUgdmFsdWUgb2YgdGhlCj4gPiA+IEVuYWJsZWQgYml0LiBJZiB0aGUgRW5hYmxlZCBi
aXQgaXMgc2V0LCB0aGlzIGJpdCBpcyByZXNlcnZlZCBhbmQKPiA+ID4gbXVzdCBiZSB6ZXJvLiIK
PiA+ID4KPiA+ID4gU28sIGlmIHg4NiBpcyBkb2luZyBzb21ldGhpbmcgd2l0aCB0aGUgZW5hYmxl
ZCAmJiBvbmxpbmUtY2FwYWJsZQo+ID4gPiBzdGF0ZSAob3RoZXIgdGhhbiBpZ25vcmluZyB0aGUg
b25saW5lLWNhcGFibGUpIHRoZW4gdGVjaG5pY2FsbHkgaXQKPiA+ID4gaXMgZG9pbmcgc29tZXRo
aW5nIHRoYXQgdGhlIHNwZWMgZG9lc24ndCBkZWZpbmUKPiA+Cj4gPiBBbmQgc28gaXQgaXMgd3Jv
bmcuCj4KPgo+IE9yIG1heWJlLCBzcGVjaWZpY2F0aW9uIGhhcyBub3QgYmVlbiB1cGRhdGVkIHll
dC4gY29kZS1maXJzdD8KCldlbGwsIGlmIHlvdSBhcmUgYXdhcmUgb2YgYW55IGNoYW5nZSByZXF1
ZXN0cyByZWxhdGVkIHRvIHRoaXMgYW5kCnBvc3RlZCBhcyBjb2RlLWZpcnN0LCBwbGVhc2UgbGV0
IG1lIGtub3cuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
