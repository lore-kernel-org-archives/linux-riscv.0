Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C330C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 14:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JR5m5UGZkPsv6LcvXsUvmotKmuVQ6k5NgM9xMKpx/jY=; b=FnYgrg6QAg9Rhd
	m4sRDepsHyyPiWsKQogiRF+Tlby8gdUQzuQhrgikBHethzR1nFWO756lYUwR6wsjo1hpaIG43EsTS
	wChYivMms/1iuPll4Z7NpIUprpqe0MLI7HXLog4dOQ3bIWU7AphioTIMv47Tyzkl2S7eRL1oHF6bZ
	AehiLKA7qsrpo2DjEhcvBaj1BKZOeTBHvWCRBAcgQC6xQEd/zIQIWBKd4TmSXCpjsUe2y65nDIUNx
	jq/00cIbTfKvEUT8aP62tNGMpsS/zPM51Afgc7dO0ltHkrHooJFc/LIJti37/ih+YJSkv1qUAS2Nm
	pk1WB1JjzB+Lbf/epoMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0wN-00000000PoI-0gie;
	Thu, 25 Jan 2024 14:42:51 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0wK-00000000Pm1-19vL;
	Thu, 25 Jan 2024 14:42:49 +0000
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3bc21303a35so1267868b6e.0;
        Thu, 25 Jan 2024 06:42:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706193766; x=1706798566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WansAIK1kV2qngBkKGzUZEv8a9oLEEFRWHM6D4Yzd+M=;
        b=Gs6y7WBkNQU5CLOMCq4BuwvA7ml3ElTzLqRIspy1BYzGVBtTvOU9DcUs10iD1FtM1v
         2f0iKeyKTo5T0qQLWiITyL5tOT1x+bKJ8W+iWdeS/5St/9Vvmi51dP4QP/IW+NJUTK9u
         2qiMcmpPnaPjf0cq+LSbwg8sDBdZ0+xpUFno5TE8jwS/TPH+hZ/awCBnQAx+NJe7KiHE
         68rC2ufUiU6zVQ/3Xz1gUCAqn3RC+kQjr7/idKU9tY9U7Bt7P7r2Hsf212Q89og8jmVB
         hbNw9w61BeJAvdQDAUuPJGObbe/Mi+YLROVsts/Y2RvgyYFbfbeSfKFj/Q0uKyoPhEla
         +6oA==
X-Gm-Message-State: AOJu0YzT6aVt3RV0p2fyhEyAY55XTZVmT3Q5ahdyHXTQov/v+9J/Kpcu
	fxDnR3fq0WBObVNMJlBJugDjYdB1Av8uxNlAMWqIyXaXmxw9Kd0hapqeAls/uEaxsL5n0VuPiRg
	ifZQykyWSJ0ZHUgHtYetTXj+34brI2mWw
X-Google-Smtp-Source: AGHT+IHrMMS6irD8BFopNOqV65JYF32HklaFUv2M5fjsXBTp38AaiSFl3qoFRWI4K+lpO8xVl3bxSYdmwfq7Su82484=
X-Received: by 2002:a05:6870:618a:b0:214:dbdd:a173 with SMTP id
 a10-20020a056870618a00b00214dbdda173mr987239oah.3.1706193766071; Thu, 25 Jan
 2024 06:42:46 -0800 (PST)
MIME-Version: 1.0
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk> <E1rDOg2-00Dvjk-RI@rmk-PC.armlinux.org.uk>
 <CAJZ5v0ju1JHgpjuFLHZVs4NZiARG6iBZN_wza6c2e0kDhZjK0w@mail.gmail.com>
 <ZaURtUvWQyjYfiiO@shell.armlinux.org.uk> <20240122160227.00002d83@Huawei.com>
 <CAJZ5v0hamuXJ_w-TSmVb=5jGide=Lb7sCjbzzNb_rFuPrvkgxQ@mail.gmail.com>
 <Za6mHRJVjb6M1mun@shell.armlinux.org.uk> <20240123092725.00004382@Huawei.com> <3A26D95F-7366-4354-A010-318A98660076@oracle.com>
In-Reply-To: <3A26D95F-7366-4354-A010-318A98660076@oracle.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 25 Jan 2024 15:42:34 +0100
Message-ID: <CAJZ5v0h1na9BQiT6a4dK==8anmt15S4sArktzuLiSyScvw=bqg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 03/21] ACPI: processor: Register CPUs that are
 online, but not described in the DSDT
To: Miguel Luis <miguel.luis@oracle.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>, 
	"Russell King (Oracle)" <linux@armlinux.org.uk>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "x86@kernel.org" <x86@kernel.org>, 
	"acpica-devel@lists.linuxfoundation.org" <acpica-devel@lists.linuxfoundation.org>, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, 
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Salil Mehta <salil.mehta@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, "jianyong.wu@arm.com" <jianyong.wu@arm.com>, 
	"justin.he@arm.com" <justin.he@arm.com>, James Morse <james.morse@arm.com>, 
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_064248_361327_0AA3BAFE 
X-CRM114-Status: GOOD (  43.08  )
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

SGksCgpPbiBUaHUsIEphbiAyNSwgMjAyNCBhdCAyOjU24oCvUE0gTWlndWVsIEx1aXMgPG1pZ3Vl
bC5sdWlzQG9yYWNsZS5jb20+IHdyb3RlOgo+Cj4gSGkKPgo+ID4gT24gMjMgSmFuIDIwMjQsIGF0
IDA4OjI3LCBKb25hdGhhbiBDYW1lcm9uIDxqb25hdGhhbi5jYW1lcm9uQGh1YXdlaS5jb20+IHdy
b3RlOgo+ID4KPiA+IE9uIE1vbiwgMjIgSmFuIDIwMjQgMTc6MzA6MDUgKzAwMDAKPiA+ICJSdXNz
ZWxsIEtpbmcgKE9yYWNsZSkiIDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4KPiA+
PiBPbiBNb24sIEphbiAyMiwgMjAyNCBhdCAwNToyMjo0NlBNICswMTAwLCBSYWZhZWwgSi4gV3lz
b2NraSB3cm90ZToKPiA+Pj4gT24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgNTowMuKAr1BNIEpvbmF0
aGFuIENhbWVyb24KPiA+Pj4gPEpvbmF0aGFuLkNhbWVyb25AaHVhd2VpLmNvbT4gd3JvdGU6Cj4g
Pj4+Pgo+ID4+Pj4gT24gTW9uLCAxNSBKYW4gMjAyNCAxMTowNjoyOSArMDAwMAo+ID4+Pj4gIlJ1
c3NlbGwgS2luZyAoT3JhY2xlKSIgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4gPj4+
Pgo+ID4+Pj4+IE9uIE1vbiwgRGVjIDE4LCAyMDIzIGF0IDA5OjIyOjAzUE0gKzAxMDAsIFJhZmFl
bCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4+Pj4+PiBPbiBXZWQsIERlYyAxMywgMjAyMyBhdCAxOjQ5
4oCvUE0gUnVzc2VsbCBLaW5nIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4g
Pj4+Pj4+Pgo+ID4+Pj4+Pj4gRnJvbTogSmFtZXMgTW9yc2UgPGphbWVzLm1vcnNlQGFybS5jb20+
Cj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gQUNQSSBoYXMgdHdvIGRlc2NyaXB0aW9ucyBvZiBDUFVzLCBv
bmUgaW4gdGhlIE1BRFQvQVBJQyB0YWJsZSwgdGhlIG90aGVyCj4gPj4+Pj4+PiBpbiB0aGUgRFNE
VC4gQm90aCBhcmUgcmVxdWlyZWQuIChBQ1BJIDYuNSdzIDguNCAiRGVjbGFyaW5nIFByb2Nlc3Nv
cnMiCj4gPj4+Pj4+PiBzYXlzICJFYWNoIHByb2Nlc3NvciBpbiB0aGUgc3lzdGVtIG11c3QgYmUg
ZGVjbGFyZWQgaW4gdGhlIEFDUEkKPiA+Pj4+Pj4+IG5hbWVzcGFjZSIpLiBIYXZpbmcgdHdvIGRl
c2NyaXB0aW9ucyBhbGxvd3MgZmlybXdhcmUgYXV0aG9ycyB0byBnZXQKPiA+Pj4+Pj4+IHRoaXMg
d3JvbmcuCj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gSWYgQ1BVcyBhcmUgZGVzY3JpYmVkIGluIHRoZSBN
QURUL0FQSUMsIHRoZXkgd2lsbCBiZSBicm91Z2h0IG9ubGluZQo+ID4+Pj4+Pj4gZWFybHkgZHVy
aW5nIGJvb3QuIE9uY2UgdGhlIHJlZ2lzdGVyX2NwdSgpIGNhbGxzIGFyZSBtb3ZlZCB0byBBQ1BJ
LAo+ID4+Pj4+Pj4gdGhleSB3aWxsIGJlIGJhc2VkIG9uIHRoZSBEU0RUIGRlc2NyaXB0aW9uIG9m
IHRoZSBDUFVzLiBXaGVuIENQVXMgYXJlCj4gPj4+Pj4+PiBtaXNzaW5nIGZyb20gdGhlIERTRFQg
ZGVzY3JpcHRpb24sIHRoZXkgd2lsbCBlbmQgdXAgb25saW5lLCBidXQgbm90Cj4gPj4+Pj4+PiBy
ZWdpc3RlcmVkLgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IEFkZCBhIGhlbHBlciB0aGF0IHJ1bnMgYWZ0
ZXIgYWNwaV9pbml0KCkgaGFzIGNvbXBsZXRlZCB0byByZWdpc3Rlcgo+ID4+Pj4+Pj4gQ1BVcyB0
aGF0IGFyZSBvbmxpbmUsIGJ1dCB3ZXJlbid0IGZvdW5kIGluIHRoZSBEU0RULiBBbnkgQ1BVIHRo
YXQKPiA+Pj4+Pj4+IGlzIHJlZ2lzdGVyZWQgYnkgdGhpcyBjb2RlIHRyaWdnZXJzIGEgZmlybXdh
cmUtYnVnIHdhcm5pbmcgYW5kIGtlcm5lbAo+ID4+Pj4+Pj4gdGFpbnQuCj4gPj4+Pj4+Pgo+ID4+
Pj4+Pj4gUWVtdSBUQ0cgb25seSBkZXNjcmliZXMgdGhlIGZpcnN0IENQVSBpbiB0aGUgRFNEVCwg
dW5sZXNzIGNwdS1ob3RwbHVnCj4gPj4+Pj4+PiBpcyBjb25maWd1cmVkLgo+ID4+Pj4+Pgo+ID4+
Pj4+PiBTbyB3aHkgaXMgdGhpcyBhIGtlcm5lbCBwcm9ibGVtPwo+ID4+Pj4+Cj4gPj4+Pj4gU28g
d2hhdCBhcmUgeW91IHByb3Bvc2luZyBzaG91bGQgYmUgdGhlIGJlaGF2aW91ciBoZXJlPyBXaGF0
IHRoaXMKPiA+Pj4+PiBzdGF0ZW1lbnQgc2VlbXMgdG8gYmUgc2F5aW5nIGlzIHRoYXQgUUVNVSBh
cyBpdCBleGlzdHMgdG9kYXkgb25seQo+ID4+Pj4+IGRlc2NyaWJlcyB0aGUgZmlyc3QgQ1BVIGlu
IERTRFQuCj4gPj4+Pgo+ID4+Pj4gVGhpcyBjb25mdXNlcyBtZSBzb21ld2hhdCwgYmVjYXVzZSBJ
J20gZmFyIGZyb20gc3VyZSB3aGljaCBtYWNoaW5lcyB0aGlzCj4gPj4+PiBpcyB0cnVlIGZvciBp
biBRRU1VLiAgSSdtIGd1ZXNzaW5nIGl0J3MgYSBsZWdhY3kgdGhpbmcgd2l0aAo+ID4+Pj4gc29t
ZSBvbGQgZGlzdHJvIHZlcnNpb24gb2YgUUVNVSAtIHNvIHdlJ2xsIGhhdmUgdG8gcGFwZXIgb3Zl
ciBpdCBhbnl3YXkKPiA+Pj4+IGJ1dCBmb3IgY3VycmVudCBRRU1VIEknbSBub3Qgc3VyZSBpdCdz
IHRydWUuCj4gPj4+Pgo+ID4+Pj4gSGVscGZ1bGx5IHRoZXJlIGFyZSBhIGJ1bmNoIG9mIEFDUEkg
dGFibGUgdGVzdHMgc28gSSd2ZSBiZWVuIGNoZWNraW5nCj4gPj4+PiB0aHJvdWdoIGFsbCB0aGUg
bXVsdGkgQ1BVIGNhc2VzLgo+ID4+Pj4KPiA+Pj4+IENQVSBob3RwbHVnIG5vdCBlbmFibGVkLgo+
ID4+Pj4gcGMvRFNEVC5kaW1tcHhtICAtIDR4IFByb2Nlc3NvciBlbnRyaWVzLiAgLXNtcCA0Cj4g
Pj4+PiBwYy9EU0RULmFjcGlobWF0IC0gMnggUHJvY2Vzc29yIGVudHJpZXMuICAtc21wIDIKPiA+
Pj4+IHEzNS9EU0RULmFjcGlobWF0IC0gMnggUHJvY2Vzc29yIGVudHJpZXMuIC1zbXAgMgo+ID4+
Pj4gdmlydC9EU0RULmFjcGlobWF0dmlydCAtIDR4IEFDUEkwMDA3IGVudHJpZXMgLXNtcCA0Cj4g
Pj4+PiBxMzUvRFNEVC5hY3BpaG1hdC1ub2luaXRpYXRvciAtIDQgeCBQcm9jZXNzb3IgKCkgZW50
cmllcyAtc21wIDQKPiA+Pj4+IHZpcnQvRFNEVC50b3BvbG9neSAtIDh4IEFDUEkwMDA3IGVudHJp
ZXMKPiA+Pj4+Cj4gPj4+PiBJJ3ZlIGFsc28gbG9va2VkIGF0IHRoZSBjb2RlIGFuZCB3ZSBoYXZl
IHZhcmlvdXMgdHlwZXMgb2YKPiA+Pj4+IENQVSBob3RwbHVnIG9uIHg4NiBidXQgdGhleSBhbGwg
YnVpbGQgYXBwcm9wcmlhdGUgbnVtYmVycyBvZgo+ID4+Pj4gUHJvY2Vzc29yKCkgZW50cmllcyBp
biBEU0RULgo+ID4+Pj4gQXJtIGxpa2V3aXNlIHNlZW1zIHRvIGJ1aWxkIHRoZSByaWdodCBudW1i
ZXIgb2YgQUNQSTAwMDcgZW50cmllcwo+ID4+Pj4gKGFuZCBkb2Vzbid0IHlldCBoYXZlIENQVSBI
UCBzdXBwb3J0KS4KPiA+Pj4+Cj4gPj4+PiBJZiBhbnlvbmUgY2FuIGFkZCBhIHJlZmVyZW5jZSBv
biB3aHkgdGhpcyBpcyBuZWVkZWQgdGhhdCB3b3VsZCBiZSB2ZXJ5Cj4gPj4+PiBoZWxwZnVsLgo+
ID4+Pgo+ID4+PiBZZXMsIGl0IHdvdWxkLgo+ID4+Pgo+ID4+PiBQZXJzb25hbGx5LCBJIHdvdWxk
IHByZWZlciB0byBhc3N1bWUgdGhhdCBpdCBpcyBub3QgbmVjZXNzYXJ5IHVudGlsIGl0Cj4gPj4+
IHR1cm5zIG91dCB0aGF0ICgxKSB0aGVyZSBpcyBmaXJtd2FyZSB3aXRoIHRoaXMgaXNzdWUgYWN0
dWFsbHkgaW4gdXNlCj4gPj4+IGFuZCAoMikgdXBkYXRpbmcgdGhlIGZpcm13YXJlIGluIHF1ZXN0
aW9uIHRvIGZvbGxvdyB0aGUgc3BlY2lmaWNhdGlvbgo+ID4+PiBpcyBub3QgcHJhY3RpY2FsLgo+
ID4+Pgo+ID4+PiBPdGhlcndpc2UsIHdlJ2QgbWFrZSBpdCBlYXNpZXIgdG8gc2hpcCBub24tY29t
cGxpYW50IGZpcm13YXJlIGZvciBubwo+ID4+PiBnb29kIHJlYXNvbi4KPiA+Pgo+ID4+IElmIFNh
bGlsIGNhbid0IGNvbWUgdXAgd2l0aCBhIHJlYXNvbiwgdGhlbiBJJ20gaW4gZmF2b3VyIG9mIGRy
b3BwaW5nCj4gPj4gdGhlIHBhdGNoIGxpa2UgYWxyZWFkeSBkb25lIGZvciBwYXRjaCAyLiBJZiB0
aGUgY29kZSBjaGFuZ2Ugc2VydmVzIG5vCj4gPj4gdXNlZnVsIHB1cnBvc2UsIHRoZXJlJ3Mgbm8g
cG9pbnQgaW4gbWFraW5nIHRoZSBjaGFuZ2UuCj4gPj4KPiA+Cj4gPiBTYWxpbCdzIG91dCB0b2Rh
eSwgYnV0IEkndmUgbWVzc2FnZWQgaGltIHRvIGZvbGxvdyB1cCBsYXRlciBpbiB0aGUgd2Vlay4K
PiA+Cj4gPiBJdCAnbWlnaHQnIGJlIHRoZSBvZGQgY29sZCBwbHVnIHBhdGggd2hlcmUgUUVNVSBo
YWxmIGNvbWVzIHVwLCB0aGVuIGV4dHJhCj4gPiBDUFVzIGFyZSBhZGRlZCwgdGhlbiBpdCBib290
cy4gKHVzZWQgYnkgc29tZSBvcmNoZXN0cmF0aW9uIGZyYW1ld29ya3MpCj4gPiBJIGRvbid0IGhh
dmUgYSBzZXQgdXAgZm9yIHRoYXQgYW5kIEkgd29uJ3QgZ2V0IHRvIGNyZWF0aW5nIG9uZSB0b2Rh
eSBhbnl3YXkKPiA+ICh3ZSBhbGwgbG92ZSBzdGFydCBvZiB0aGUgeWVhciBwbGFubmluZyB3b3Jr
c2hvcHMhKQo+ID4KPiA+IEkndmUgK0NDJ2QgYSBmZXcgcGVvcGxlIGhhdmUgcnVuIHRlc3RzIG9u
IHRoZSB2YXJpb3VzIGl0ZXJhdGlvbnMgb2YgdGhpcwo+ID4gd29yayBpbiB0aGUgcGFzdC4gIE1h
eWJlIG9uZSBvZiB0aGVtIGNhbiBzaGVkIHNvbWUgbGlnaHQgb24gdGhpcz8KPiA+Cj4KPiBJSVVD
LCB0aGlzIHBhdGNoIGNvdmVycyBhIHNjZW5hcmlvIGZvciBub24gY29tcGxpYW50IGZpcm13YXJl
IGFuZCBpbiB3aGljaCBteQo+IHRlc3RzIGZvciBBQXJjaDY0IHVzaW5nIFJGQyB2MiBoYXZlIGJl
ZW4gdW5hYmxlIHRvIHRyaWdnZXIgaXRzIGVycm9yIG1lc3NhZ2Ugc28KPiBmYXIuIFRoaXMgZG9l
cyBub3QgbWVhbiwgaG93ZXZlciwgdGhpcyBwYXRjaCBzaG91bGQgbm90IGJlIHRha2VuIGZvcndh
cmQgdGhvdWdoLgo+Cj4gSXQgc2VlbXMgYmVuZXZvbGVudCBlbm91Z2ggZGV0ZWN0aW5nIG5vbiBj
b21wbGlhbnQgZmlybXdhcmUgYW5kIHN0aWxsIHByb2NlZWQKPiB3aGlsZSBoYXZpbmcgd2hvZXZl
ciB1c2VzIHRoYXQgZmlybXdhcmUgdG8gZ2V0IHRvIGtub3cgdGhhdC4KClRoZXJlIGlzIG9uZSBp
c3N1ZSB3aXRoIHRoaXMgYXBwcm9hY2gsIHRob3VnaC4KCklmIHRoaXMgaXMgZG9uZSBieSBMaW51
eCBhbmQgTGludXggaXMgdXNlZCBhcyBhIG1haW4gdGVzdGluZyB2ZWhpY2xlCmZvciB3aG9ldmVy
IHByb2R1Y2VkIHRoYXQgZmlybXdhcmUsIGl0IG1heSBwYXNzIHRoZSB0ZXN0cyBhbmQgYmUKc2hp
cHBlZCBjYXVzaW5nIGEgcHJvYmxlbSBmb3IgdGhlIHJlc3Qgb2YgdGhlIGluZHVzdHJ5IChiZWNh
dXNlIG90aGVyCm9wZXJhdGluZyBzeXN0ZW1zIHdpbGwgbm90IHN1cHBvcnQgdGhhdCBmaXJtd2Fy
ZSBhbmQgbm93IHRoZXkgd2lsbCBiZQpwdXQgaW4gYW4gYXdrd2FyZCBwb3NpdGlvbikuCgpJJ3Zl
IHNlZW4gZW5vdWdoIGJyZWFrYWdlIHJlc3VsdGluZyBmcm9tIGEgc2ltaWxhciBwb2xpY3kgaW4g
c29tZQpvdGhlciBPUyBhbmQgd2l0aCBMaW51eCBvbiB0aGUgcmVjZWl2aW5nIGVuZCB0aGF0IEkn
ZCByYXRoZXIgYXZvaWQKZG9pbmcgdGhpcyB0byBzb21lb25lIGVsc2UuCgpTbyBpZiB0aGUgZmly
bXdhcmUgaXMgbm90IGNvbXBsaWFudCwgdGhlIGJlc3Qgd2F5IHRvIGdvIGlzIHRvIGFzawp3aG9l
dmVyIHNoaXBzIGl0IHRvIHBsZWFzZSBmaXggdGhlaXIgc3R1ZmYsIG9yIGlmIG90aGVyIE9TZXMg
YWxyZWFkeQp3b3JrIGFyb3VuZCB0aGUgbm9uLWNvbXBsaWFuY2UsIGl0J3MgdGltZSB0byB1cGRh
dGUgdGhlIHNwZWMgdG8KcmVmbGVjdCB0aGUgcmVhbGl0eSAoYWthICJpbmR1c3RyeSBwcmFjdGlj
ZSIpLgoKVGhhbmtzIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
