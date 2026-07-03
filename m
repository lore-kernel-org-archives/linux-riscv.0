Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF67C43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 11:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rK6YzamL7KLQgNYge3RAFwW5kE74g/yrl2OevP5HVWc=; b=vPvyMUeCFxdcpA
	JFFqiFNVTsNgN4gYZvIAOkNa5a/4/MHqyITiUfHW5yC33BcvfbBehWeCGDyf11BWXLqpvrpYFo+hK
	lY/TTRvWKrToiJLpehFO/AY0rKEpkSQKYDFIoVRlcz3GnObWGY2hP9SKcfiUHoM2Phb5oUvZunnEd
	fuzhRkBqMt7ww8dED3+b+Aovg1c23L//TqrUmSeDcLBWL5wylEmewl9J90hEKWBMQs8Ry2kJItntL
	qjsXZk3lnFqwUc89WHk1Uqh6nuNvmxXHBuvNSH2jLrTzBLl5WyH22tXuArMqaiXq+mcU+XPOObGMJ
	Y9rE/LgE10qSK3UxiAQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbcm-00000006k8g-2vnf;
	Fri, 03 Jul 2026 11:00:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbcj-00000006k6y-2Era
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 10:59:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783076394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=90otGYM9YNogT3/612Z38WIGOFh0NDbrJXj/gkAcc4M=;
	b=DGeyS26W8f/vEx9OpUibRjZev8iFzkTX9I0Jv7vcrq5J2aebsbcsc+beNxgH0pm7LEF87E
	8M1Nr9/aR2o3cdB0iOz7/EdqhmCNDK0BnoaeuKEVnjGADDjXxHx0PAOlYw6wHg2GpbbZRZ
	K3ErhCBTa1tpcn/qC6A4Z+9EKJs0j7c=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-TJE2aeqCMhyl-71TN9Qxxw-1; Fri, 03 Jul 2026 06:59:53 -0400
X-MC-Unique: TJE2aeqCMhyl-71TN9Qxxw-1
X-Mimecast-MFC-AGG-ID: TJE2aeqCMhyl-71TN9Qxxw_1783076393
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e55f0613cso35227785a.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jul 2026 03:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076393; x=1783681193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=90otGYM9YNogT3/612Z38WIGOFh0NDbrJXj/gkAcc4M=;
        b=Tk+G3IIwMG0e4/5+6Q/uBbJib0RN0auHM6YJ+n6CT4hfEirrW+YfaUe8kkBm8KEjP8
         lqzmA06LD4F5mo6KVx2QiEoa2Q2WO7Ab0jGNlPsCNnH1nMCiFlaUjSOZaHpoUuOPrgaX
         vFB1jY4/1zDZbsexMyuLCUWCvsdAjs0csFA3rJuv1iwuXAkf2yOSKkNIHbRafZ+1Gepo
         GczjtFOPfgV9Vro57umIMxRznQWtNZ4PPRqOzbDyltl0see87Hrq+iYKqY1VcsIbKV+7
         HA1hxs2sMieBlUHdI/ew2PfDf9WulXPu1Stjsi/TRe7VTHJn1EO0Z/4mHVQ7kD2O9r8e
         iP9w==
X-Forwarded-Encrypted: i=1; AFNElJ+k2d4nD/o7fe1mr494Wm1/VOVFhd1XkwNmPyCKevjwfA/4Kxw+7e8qtACDm3BnAyf8GY3ZBjWK3mec7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcTQTdeeXuZuiIJ69Q6K3h1YCcEuiY05ax2iGmxTgBVbb5UI8r
	EcFXABH1k9xmx+PZ6b2EyBQjP1n7b8NEMzeAlZEQzFfbgtpqZPASVprVVomwG7fGl63Gn7Mxqt7
	NjT2+xRw4CvA+u0NVUYZ6T/r5bexuhbPRunYzNPjDT1+5u1lAZCYFZgxecoHPxjz6nTPPjbMTcV
	9bLA1pn/WV53esX8sDaz6ycKRG+OHnIXHcrMBok/axd823
X-Gm-Gg: AfdE7ckoOR65D7gxbwZ5ENjirIgheQYsaJAy+Rtj//5sIHQ/0/4TKLNYJgN67dlzu2C
	tyUhdpXkM/Y90NFuXmmJiqZCtoxu4anS0pVQx43MTOFyChOzH3MCg3BYc2FfzUP1JE0EjMb9QrG
	ClEDHEbEAGhRF41K27XFDujkqAEumUkmPeILm3m1L79RARfk60ZqerUaBKuNY6PTrFag==
X-Received: by 2002:a05:620a:4016:b0:92e:6a43:4768 with SMTP id af79cd13be357-92e781cde5emr1264293985a.11.1783076392675;
        Fri, 03 Jul 2026 03:59:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4016:b0:92e:6a43:4768 with SMTP id
 af79cd13be357-92e781cde5emr1264290485a.11.1783076392257; Fri, 03 Jul 2026
 03:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260701025732.66330-2-ltao@redhat.com> <akSOb1_1tcJvFyda@kernel.org>
 <CAO7dBbVftLUhd2qrh7hmijTB3PEPfZAhykCGqEfrPoOcSrrj-w@mail.gmail.com> <2vxz33y2j4mi.fsf@kernel.org>
In-Reply-To: <2vxz33y2j4mi.fsf@kernel.org>
From: Tao Liu <ltao@redhat.com>
Date: Fri, 3 Jul 2026 22:59:15 +1200
X-Gm-Features: AVVi8Cezbo0yX7OHAq34QhJe08uT7CxY47RNCIsfCYAyC3SXHTFCS-ZJgPFpSss
Message-ID: <CAO7dBbXBc4kvE2J09EhBs+MYpcJOV1UdNnSG=5RqcUUqimU5Qg@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: Fix a NULL pointer dereference in machine_kexec_prepare
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org, bhe@redhat.com, 
	zohar@linux.ibm.com, roberto.sassu@huawei.com, dmitry.kasatkin@gmail.com, 
	eric.snowberg@oracle.com, linux-integrity@vger.kernel.org, 
	Markus.Elfring@web.de, kernel-janitors@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _eEM9e0BtniedDBO5kxlx70zWXyWu2k57UN-hpWQrjQ_1783076393
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_035957_650909_79F21CC0 
X-CRM114-Status: GOOD (  28.98  )
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

SGkgUHJhdHl1c2gsCgpPbiBUaHUsIEp1bCAyLCAyMDI2IGF0IDEyOjA24oCvQU0gUHJhdHl1c2gg
WWFkYXYgPHByYXR5dXNoQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMDEgMjAy
NiwgVGFvIExpdSB3cm90ZToKPgo+ID4gSGkgSmFya2tvLAo+ID4KPiA+IE9uIFdlZCwgSnVsIDEs
IDIwMjYgYXQgMzo1MOKAr1BNIEphcmtrbyBTYWtraW5lbiA8amFya2tvQGtlcm5lbC5vcmc+IHdy
b3RlOgo+ID4+Cj4gPj4gT24gV2VkLCBKdWwgMDEsIDIwMjYgYXQgMDI6NTc6MzNQTSArMTIwMCwg
VGFvIExpdSB3cm90ZToKPiA+PiA+IEEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGlzc3VlIGlz
IG5vdGljZWQgaW4gcmlzY3YncyBtYWNoaW5lX2tleGVjX3ByZXBhcmUsCj4gPj4gPiB3aGVyZSBp
bWFnZS0+c2VnbWVudFtpXS5idWYgbWlnaHQgYmUgTlVMTCBhbmQgY29waWVkIHVuY2hlY2tlZC4K
PiA+PiA+Cj4gPj4gPiBUaGUgTlVMTCBidWYgY29tZXMgZnJvbSBzZWN1cml0eS9pbnRlZ3JpdHkv
aW1hL2ltYV9rZXhlYy5jOgo+ID4+ID4gaW1hX2FkZF9rZXhlY19idWZmZXIoKSwgd2hlcmUga2J1
ZiBpcyBhZGRlZCBieSBrZXhlY19hZGRfYnVmZmVyKCksCj4gPj4gPiBidXQga2J1Zi5idWZmZXIg
aXMgTlVMTAo+ID4+Cj4gPj4gVGhpcyBzaG91bGQgaGF2ZSBhIHByb3BlciBjYWxsIHNlcXVlbmNl
LiBOb3cgdGhlIHJvb3QgY2F1c2UgaXMKPiA+PiBvYmZ1c2NhdGVkLgo+ID4KPiA+IFN1cmUsIEkg
d2lsbCBhdHRhY2ggdGhlIHN0YWNrIHRyYWNlIGluIHY0LiBIZXJlIGlzIHRoZSBvbmU6Cj4gPgo+
ID4gWyAgIDYyLjg2NzU0MF0ga2V4ZWNfZmlsZShJbWFnZSk6IExvYWRlZCBrZXJuZWwgYXQgMHg4
MDIwMDAwMAo+ID4gYnVmc3o9MHgzNGVkODAwIG1lbXN6PTB4MzVkMDAwMAo+ID4gWyAgIDYyLjg3
OTk4M10gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgYWNjZXNzIHRvIHVzZXIgbWVtb3J5IHdpdGhv
dXQKPiA+IHVhY2Nlc3Mgcm91dGluZXMgYXQgdmlydHVhbCBhZGRyZXNzIDAwMDAwMDAwMDAwMDAw
MDAKPiA+IFsgICA2Mi44ODA3MzZdIEN1cnJlbnQga2V4ZWMgcGd0YWJsZTogNEsgcGFnZXNpemUs
IDU3LWJpdCBWQXMsCj4gPiBwZ2RwPTB4MDAwMDAwMDEwNjJlYjAwMAo+ID4gWyAgIDYyLjg4MTE4
NV0gWzAwMDAwMDAwMDAwMDAwMDBdIHBnZD0wMDAwMDAwMDQxM2I0NDAxLAo+ID4gcDRkPTAwMDAw
MDAwNDE1MWJjMDEsIHB1ZD0wMDAwMDAwMDQxNWI3ODAxLCBwbWQ9MDAwMDAwMDA0MGFmNTgwMSwK
PiA+IHB0ZT0wMDAwMDAwMDAwMDAwMDAwCj4gPiBbICAgNjIuODgxOTY5XSBPb3BzIFsjMV0KPiA+
IFsgICA2Mi44ODIwNzddIE1vZHVsZXMgbGlua2VkIGluOgo+ID4gWyAgIDYyLjg4MjcxN10gQ1BV
OiAxIFVJRDogMCBQSUQ6IDg5NCBDb21tOiBrZXhlYyBOb3QgdGFpbnRlZCA3LjEuMSAjNAo+ID4g
UFJFRU1QVChsYXp5KQo+ID4gWyAgIDYyLjg4MzAzN10gSGFyZHdhcmUgbmFtZTogUUVNVSBRRU1V
IFZpcnR1YWwgTWFjaGluZSwgQklPUwo+ID4gZWRrMi0yMDI2MDUwOC0yLmZjNDQgMDUvMDgvMjAy
Ngo+ID4gWyAgIDYyLjg4MzM2NV0gZXBjIDogX19tZW1jcHkrMHhkNC8weGY4Cj4gPiBbICAgNjIu
ODgzNjg1XSAgcmEgOiBtYWNoaW5lX2tleGVjX3ByZXBhcmUrMHg4YS8weDI5OAo+ID4gWyAgIDYy
Ljg4MzkxNF0gZXBjIDogZmZmZmZmZmY4MTM5M2VlOCByYSA6IGZmZmZmZmZmODAwMzY2Y2Egc3Ag
Ogo+ID4gZmYyMDAwMDAwNGE4M2QxMAo+ID4gWyAgIDYyLjg4NDIxNF0gIGdwIDogZmZmZmZmZmY4
MzI1OGRiOCB0cCA6IGZmNjAwMDAwODU3M2RiODAgdDAgOgo+ID4gZmZmZmZmZmY4MDAzMzY0MAo+
ID4gWyAgIDYyLjg4NDQzM10gIHQxIDogMjE1MmZmZmZmZmZmZmZjMCB0MiA6IDAwMDAwMDAwMDMw
MDAwMDAgczAgOgo+ID4gZmYyMDAwMDAwNGE4M2Q4MAo+ID4gWyAgIDYyLjg4NDcxMF0gIHMxIDog
MDAwMDAwMDAwMDAwMDAwMCBhMCA6IGZmMjAwMDAwMDRhODNkMTAgYTEgOgo+ID4gMDAwMDAwMDAw
MDAwMDAwMAo+ID4gWyAgIDYyLjg4NDk4N10gIGEyIDogMDAwMDAwMDAwMDAwMDAyOCBhMyA6IDAw
MDAwMDAwMDAwMDAwMjggYTQgOgo+ID4gMDAwMDAwMDAwMDAwMDAwMAo+ID4gWyAgIDYyLjg4NTIw
OF0gIGE1IDogMDAwMDAwMDAwMDAwMDAwMCBhNiA6IDAwMDAwMDAxMDRlMzNmZmYgYTcgOgo+ID4g
MDAwMDAwMDAwMDAwMDAwMAo+ID4gWyAgIDYyLjg4NTQ4Nl0gIHMyIDogZmY2MDAwMDA4MmEzNTgw
MCBzMyA6IDAwMDAwMDAwMDAwMDAwMDAgczQgOgo+ID4gMDAwMDAwMDAwMDAwMDAxMAo+ID4gWyAg
IDYyLjg4NTc3NF0gIHM1IDogMDAwMDAwMDAwMDAwMDAyOCBzNiA6IGZmMjAwMDAwMDRhODNkMTAg
czcgOgo+ID4gMDAwMDAwMDAwMDAwMDAwNQo+ID4gWyAgIDYyLjg4NjAwNV0gIHM4IDogMDAwMDAw
MDAwMDAwMDBjMCBzOSA6IDAwMDAwMDAwMGFjMGQyMjAgczEwOgo+ID4gZmZmZmZmZmY4MzU0MjBl
OAo+ID4gWyAgIDYyLjg4NjIxOF0gIHMxMTogMDAwMDAwMDAwMDAwMDAwMCB0MyA6IGZmZmZmZjgw
MDAwMDAwN2MgdDQgOgo+ID4gZmYxYzAwMDAwMjEzOGQwMAo+ID4gWyAgIDYyLjg4NjUxNV0gIHQ1
IDogZmZmZmZmZmZmZmZmZmZmZiB0NiA6IGZmMjAwMDAwMDRhODNkMTAgc3NwIDoKPiA+IDAwMDAw
MDAwMDAwMDAwMDAKPiA+IFsgICA2Mi44ODY4NjBdIHN0YXR1czogMDAwMDAwMDIwMDAwMDEyMCBi
YWRhZGRyOiAwMDAwMDAwMDAwMDAwMDAwCj4gPiBjYXVzZTogMDAwMDAwMDAwMDAwMDAwZAo+ID4g
WyAgIDYyLjg4NzE2Ml0gWzxmZmZmZmZmZjgxMzkzZWU4Pl0gX19tZW1jcHkrMHhkNC8weGY4Cj4g
PiBbICAgNjIuODg3Mzg4XSBbPGZmZmZmZmZmODAxYjI1M2E+XSBfX2RvX3N5c19rZXhlY19maWxl
X2xvYWQrMHgxYjIvMHgzMzgKPiA+IFsgICA2Mi44ODc2MTJdIFs8ZmZmZmZmZmY4MDFiMjZlND5d
IF9fcmlzY3Zfc3lzX2tleGVjX2ZpbGVfbG9hZCsweDI0LzB4NDAKPiA+IFsgICA2Mi44ODc4NTVd
IFs8ZmZmZmZmZmY4MTM5NWVhND5dIGRvX3RyYXBfZWNhbGxfdSsweDFhNC8weDVhOAo+ID4gWyAg
IDYyLjg4ODEzNF0gWzxmZmZmZmZmZjgxM2E5ZWVjPl0gaGFuZGxlX2V4Y2VwdGlvbisweDE2Yy8w
eDE3OAo+ID4gWyAgIDYyLjg4ODQ0NV0gQ29kZTogNzYxMyAwN2Y2IGNhMDUgODZiMyAwMGM1IGU3
YjMgMDFmNSA4ZmQ1IDhiOGQgZWI4OQo+ID4gKDQxOTgpIDA1OTEKPiA+IFsgICA2Mi44ODkyMjNd
IC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQo+ID4gU2VnbWVudGF0aW9uIGZh
dWx0ICAgICAgICAga2V4ZWMgLWwgL2Jvb3Qvdm1saW51ei03LjEuMQo+ID4gLS1pbml0cmQ9L2Jv
b3QvaW5pdHJhbWZzLTcuMS4xLmltZyAtLXJldXNlLWNtZGxpbmUKPiA+Cj4gPiAoZ2RiKSBwIGlt
YWdlLT5zZWdtZW50WzBdCj4gPiAkMyA9IHt7YnVmID0gMHgwLCBrYnVmID0gMHgwfSwgYnVmc3og
PSAwLCBtZW0gPSAxMDczNzU4NjE3NiwgbWVtc3ogPSA0MDk2fQo+ID4KPiA+IFRoZSBidWYgPSAw
eDAgYW5kIGJ1ZnN6ID0gMCBjb21lcyBmcm9tIGltYV9hZGRfa2V4ZWNfYnVmZmVyKCksIHRob3Vn
aHQKPiA+IEknbSBub3Qgc3VyZSB3aHkgaXQgYWRkZWQgYSBOVUxMIHNlZ21lbnQsIGJ1dCBpdCBp
cyBubyBoYXJtIHRvIGFkZCBhCj4gPiBOVUxMIGNoZWNrZXIgaGVyZSBpbiBjYXNlIGFueSBvdGhl
ciBzY2VuYXJpb3Mgc2ltaWxhciBhcyBJTUEuCj4KPiBGcm9tIG15IHJlYWRpbmcgb2YgdGhlIElN
QSBjb2RlLCBJIHRoaW5rIHRoZXkgZG8gc28gYmVjYXVzZSB0aGV5IGRvbid0Cj4gd2FudCB0byBh
ZGQgYSBidWZmZXIgdG8gdGhlIGtpbWFnZSBqdXN0IHlldC4gVGhpcyBpcyBiZWNhdXNlIHRoZXJl
IGNhbgo+IGJlIElNQSBtZWFzdXJlbWVudHMgYmV0d2VlbiBrZXhlYyBsb2FkIGFuZCBrZXhlYyBy
ZWJvb3QuIFNvIHRoZXkgdXNlCj4ga2V4ZWNfYWRkX2J1ZmZlcigpIHRvIHJlc2VydmUgdGhlIHBo
eXNpY2FsIGFkZHJlc3Mgc3BhY2UsIHRoZW4gdGhleSB2bWFwCj4gdGhlIGRlc3RpbmF0aW9uIHBh
Z2VzIGluIGltYV9rZXhlY19wb3N0X2xvYWQoKSwgYW5kIHRoZW4gdXBkYXRlIHRoZQo+IGRlc3Rp
bmF0aW9uIHBhZ2VzIGRpcmVjdGx5IHZpYSBhIHJlYm9vdCBub3RpZmllci4gU28gdGhleSBkbyBu
b3QgaGF2ZSBhCj4gYnVmZmVyIGNvcGllZCB0byB0aGUgZGVzdGluYXRpb24gcGFnZXMgYXQgdGhl
IHRpbWUgb2YKPiBrZXhlY19hZGRfYnVmZmVyKCkuCj4KPiBOb3cgYWxsIHRoYXQgaXMgZmFpcmx5
IGNvbnZvbHV0ZWQgYW5kIG5vdCB2ZXJ5IG9idmlvdXMsIGJ1dCBJIGFtIG5vdAo+IHN1cmUgaWYg
dGhlcmUgaXMgYSBiZXR0ZXIgd2F5IG9mIGRvaW5nIHRoaXMgb2ZmIHRoZSB0b3Agb2YgbXkgaGVh
ZC4KClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHJlc29sdmluZyBteSBjb25mdXNpb24hIE5vdyBJ
IHVuZGVyc3RhbmQgaXQKbXVjaCBiZXR0ZXIuLi4KClRoYW5rcywKVGFvIExpdQoKPgo+ID4KPiA+
Pgo+ID4+ID4KPiA+PiA+IEZpeCB0aGlzIGJ5IHNpbXBseSBhZGRpbmcgYSBjaGVjayBiZWZvcmUg
Y29weS4KPiA+PiA+Cj4gPj4gPiBGaXhlczogYjdmYjRkNzhhNmFkICgiUklTQy1WOiB1c2UgbWVt
Y3B5IGZvciBrZXhlY19maWxlIG1vZGUiKQo+ID4+ID4gQWNrZWQtYnk6IEJhb3F1YW4gSGUgPGJo
ZUByZWRoYXQuY29tPgo+ID4+ID4gQWNrZWQtYnk6IFByYXR5dXNoIFlhZGF2IDxwcmF0eXVzaEBr
ZXJuZWwub3JnPgo+ID4+ID4gU2lnbmVkLW9mZi1ieTogVGFvIExpdSA8bHRhb0ByZWRoYXQuY29t
Pgo+IFsuLi5dCj4KPiAtLQo+IFJlZ2FyZHMsCj4gUHJhdHl1c2ggWWFkYXYKPgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
