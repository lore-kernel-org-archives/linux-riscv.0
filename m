Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA45C25B74
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 05:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wi3K+As/M6g3EDE5t2BrXVAMxWRAVirXllpbmo9fPQc=; b=0HBp7uTQQC6NEt
	Q4C5xmW9t3qTmfZ9ixgWgagxp15fci53g+qiIsMqSGhlY+J5AAkmlxXHsXYX/d6N+z6PLd9HLWowd
	X5nKHnkn6Dc/ZX1ZtHZRG7j8m0llHw4SBK7e+tiobTpbn+VDmHN1oA/s3Fuz/pOTMJb5PZbQyyL+B
	xqKsNU3C4gjwdI59BLZDolt5kZ4sfHxHqnX9xc1AnY9pOTVJNoBH3yUSik7LgzSuId+AuSFQ/yKZN
	GpHDZ5vD3npk/kCr489Fnw3ka3yb77KHqb0056BdhYB3k8I/vZavpA5oZJcgCn3ZujSgk05Y0LHfE
	BoGqTJIspZu+2lUJ4hcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9IBR-0000000GOmE-30jH;
	Tue, 21 May 2024 05:37:09 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9IBN-0000000GOkW-1T6n;
	Tue, 21 May 2024 05:37:07 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2e271acb015so64119071fa.1;
        Mon, 20 May 2024 22:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716269818; x=1716874618; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8X0+eNlzU7aWSFgffzqQI3ZbOHv/ydP087P5MpUwWWY=;
        b=e/6dbLzdjN4f6swR3A4lcXa7/TyM++F+HL7W9UDlSq2Nb2uirzqPpXInP/pMDCyMCc
         5N88kATOeDtZ7KMR0Q87zFnF3gUve6F6gosx3ZE6EO6KOnESmU5Ac+8cJmr5R9SllqsN
         6vgcxwTrWEXRNePfeHkaZ9qvKjsDNBhZzKdS7DtcFyGiYoXP7MAwzrgr1FYbsmih0WZA
         zw4d3SbjGzlfhjSV02lHCX/QpdNZVzfNcC7jq93OOBegblsSDGFQlKq25juUCxvW7cG5
         R9AMWEkxjE6EzCDPFjqmgGZ6lZieznGFHfsEBHQufgl2HcLL2TKQ5lfnzYU0YxwtbaPh
         9nBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716269818; x=1716874618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8X0+eNlzU7aWSFgffzqQI3ZbOHv/ydP087P5MpUwWWY=;
        b=iwldQroE/3My9H7k603FKgJs1iNDMiAm2/n1wiP40E9ATMnzQIKwHVr2tvYqHOXFm+
         7Ly/rNIRFWPCVWmxQMhsOped4+Oy1G0ujYDETB+WcUjZ/A1o+RRIHXHc/TeDOiUpNEY2
         /0mMXaMtua2O4XF7sITF5DSWKbGtd9jDHaYYHQ/vMtfKMhu7OnT6YoXBIiDC65QsbcvN
         BI/JHLSG83XO7MfhZv+K+nSJ5BCz7HWgYdyd+SK/bSDW7PbLizG2f9uaPXds9AfpOg8a
         02TF9E01HZQfzj3W16sXEGQd7NX4a+sogHrSm9c9VzdX9yA+Z46ggaaV753zoRK4w7Uy
         N/Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUWP/fkYncILdFONcqjy7+nIkgJT63FMAl5ZMBCWud0a8rLYkG8ukmNzemUoXJpVX7UN6O6RQhLL48wbzbvEv4Adpe7zApMsl51lzWrXeOlfr3MzYZqrk/oUod0Dd+EaYGC0KlBmosee26HyGVvSpxnB9gDQO8=
X-Gm-Message-State: AOJu0YwbSPIlXlrmAwHhf+hGagIRZ+jThljFIusjlWl3Bb+mOgUM688N
	AOOfNsslPvG0MHV8lWLEOb9bmUwh63D4TeDhrRJSdfR0Pw73ooOmeUitvF+eMtImK/+hB5YVvxk
	q7hg4iIePQMRoW1Aq8U9ml9LygEs=
X-Google-Smtp-Source: AGHT+IEOuv6uBHGuy1kBgi3wLpvrtw9/MW5oRqRPcExCcQ7Flo7D93su7CrKiOr9ufpnZQ1Q1Cg69UJkVd4x5Efr5wk=
X-Received: by 2002:a2e:86cc:0:b0:2d8:67a0:61b2 with SMTP id
 38308e7fff4ca-2e51fe54024mr192133171fa.20.1716269817806; Mon, 20 May 2024
 22:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1713778236.git.haibo1.xu@intel.com>
In-Reply-To: <cover.1713778236.git.haibo1.xu@intel.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Tue, 21 May 2024 13:36:46 +0800
Message-ID: <CAJve8o=bdE_g6ji78+ddjMp22_7iWtX54idmhr5OvtO8U8biHQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add ACPI NUMA support for RISC-V
To: Haibo Xu <haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_223705_418237_1E5D97E3 
X-CRM114-Status: GOOD (  25.29  )
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
Cc: Alison Schofield <alison.schofield@intel.com>, Jisheng Zhang <jszhang@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Zong Li <zong.li@sifive.com>, James Morse <james.morse@arm.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Dave Jiang <dave.jiang@intel.com>, Baoquan He <bhe@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, Greentime Hu <greentime.hu@sifive.com>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, arnd@arndb.de, Charlie Jenkins <charlie@rivosinc.com>, Chen Jiahao <chenjiahao16@huawei.com>, Yuntao Wang <ytcoode@gmail.com>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, ajones@ventanamicro.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QFN1bmlsIFYgTAoKQ291bGQgeW91IGhlbHAgaGF2ZSBhIHJldmlldyBvbiB0aGlzIHBhdGNoIHNl
dD8KClRoYW5rcywKSGFpYm8KCk9uIFdlZCwgQXByIDI0LCAyMDI0IGF0IDE6MjnigK9QTSBIYWli
byBYdSA8aGFpYm8xLnh1QGludGVsLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIHNlcmllcyBl
bmFibGUgUklTQy1WIEFDUEkgTlVNQSBzdXBwb3J0IHdoaWNoIHdhcyBiYXNlZCBvbgo+IHRoZSBy
ZWNlbnRseSBhcHByb3ZlZCBBQ1BJIEVDUlsxXS4KPgo+IFBhdGNoIDEvNiBpcyBnZW5lcmF0ZWQg
ZnJvbSB0aGUgYWNwaWNhIFBSWzJdIGFuZCBzaG91bGQgYmUgbWVyZ2VkIHRocm91Z2gKPiB0aGUg
YWNwaWNhIHByb2plY3QuIER1ZSB0byB0aGlzIGRlcGVuZGVuY3ksIG90aGVyIDUgcGF0Y2hlcyBj
YW4gb25seSBiZQo+IG1lcmdlZCBhZnRlciB0aGUgY29ycmVzcG9uZGluZyBBQ1BJQ0EgcGF0Y2gg
d2FzIHB1bGxlZCBpbnRvIGxpbnV4Lgo+Cj4gUGF0Y2ggMi82IGFkZCBSSVNDLVYgc3BlY2lmaWMg
YWNwaV9udW1hLmMgZmlsZSB0byBwYXJzZSBOVU1BIGluZm9ybWF0aW9uCj4gZnJvbSBTUkFUIGFu
ZCBTTElUIEFDUEkgdGFibGVzLgo+IFBhdGNoIDMvNiBhZGQgdGhlIGNvbW1vbiBTUkFUIFJJTlRD
IGFmZmluaXR5IHN0cnVjdHVyZSBoYW5kbGVyLgo+IFBhdGNoIDQvNiByZW1vdmUgdGhlICcjaWYg
ZGVmaW5lZChDT05GSUdfQVJDSCknIGNvbmRpdGlvbiB0byBtYWtlIHNvbWUgTlVNQQo+IHJlbGF0
ZWQgcGFyc2UgZnVuY3Rpb25zIGNvbW1vbiBmb3IgYWxsIGN1cnJlbnQgYXJjaGl0ZWN0dXJlcyB0
aGF0IHN1cHBvcnQKPiBBQ1BJX05VTUEuCj4gUGF0Y2ggNS82IGNoYW5nZSB0aGUgQUNQSV9OVU1B
IHRvIGEgaGlkZGVuIG9wdGlvbiBzaW5jZSBpdCB3b3VsZCBiZSBzZWxlY3RlZAo+IGJ5IGRlZmF1
bHQgb24gYWxsIHN1cHBvcnRlZCBwbGF0Zm9ybS4KPiBQYXRjaCA2LzYgcmVwbGFjZSBwcl9pbmZv
IHdpdGggcHJfZGVidWcgaW4gYXJjaF9hY3BpX251bWFfaW5pdCgpIHRvIGF2b2lkCj4gcG90ZW50
aWFsIGJvb3Qgbm9pc2Ugb24gQUNQSSBwbGF0Zm9ybXMgdGhhdCBhcmUgbm90IE5VTUEuCj4KPiBC
YXNlZC1vbjogaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXJpc2N2L2xpbnV4LXJpc2N2L3RyZWUv
Zm9yLW5leHQKPgo+IFsxXSBodHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzFZVGREeDJJ
UG01SWVaakFXOTMyRVlVLXRVdGdTMDh0WC92aWV3P3VzcD1zaGFyaW5nCj4gWzJdIGh0dHBzOi8v
Z2l0aHViLmNvbS9hY3BpY2EvYWNwaWNhL3B1bGwvOTI2Cj4KPiBUZXN0aW5nOgo+IFNpbmNlIHRo
ZSBBQ1BJIEFJQS9QTElDIHN1cHBvcnQgcGF0Y2ggc2V0IGlzIHN0aWxsIHVuZGVyIHVwc3RyZWFt
IHJldmlldywKPiBoZW5jZSBpdCBpcyB0ZXN0ZWQgdXNpbmcgdGhlIHBvbGwgYmFzZWQgSFZDIFNC
SSBjb25zb2xlIGFuZCBSQU0gZGlzay4KPiAxKSBCdWlsZCBsYXRlc3QgUWVtdSB3aXRoIHRoZSBm
b2xsb3dpbmcgcGF0Y2ggYmFja3BvcnRlZAo+ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS92bHN1bmls
L3FlbXUvY29tbWl0LzQyYmQ0ZWVlZmQ1ZDQ0MTBhNjhmMDJkNTRmZWU0MDZkOGExMjY5YjAKPgo+
IDIpIEJ1aWxkIGxhdGVzdCBFREstSUkKPiAgICBodHRwczovL2dpdGh1Yi5jb20vdGlhbm9jb3Jl
L2VkazIvYmxvYi9tYXN0ZXIvT3ZtZlBrZy9SaXNjVlZpcnQvUkVBRE1FLm1kCj4KPiAzKSBCdWls
ZCBMaW51eCB3aXRoIHRoZSBmb2xsb3dpbmcgY29uZmlncyBlbmFibGVkCj4gICAgQ09ORklHX1JJ
U0NWX1NCSV9WMDE9eQo+ICAgIENPTkZJR19TRVJJQUxfRUFSTFlDT05fUklTQ1ZfU0JJPXkKPiAg
ICBDT05GSUdfTk9OUE9SVEFCTEU9eQo+ICAgIENPTkZJR19IVkNfUklTQ1ZfU0JJPXkKPiAgICBD
T05GSUdfTlVNQT15Cj4gICAgQ09ORklHX0FDUElfTlVNQT15Cj4KPiA0KSBCdWlsZCBidWlsZHJv
b3Qgcm9vdGZzLmNwaW8KPgo+IDUpIExhdW5jaCB0aGUgUWVtdSBtYWNoaW5lCj4gICAgcWVtdS1z
eXN0ZW0tcmlzY3Y2NCAtbm9ncmFwaGljIFwKPiAgICAtbWFjaGluZSB2aXJ0LHBmbGFzaDA9cGZs
YXNoMCxwZmxhc2gxPXBmbGFzaDEgLXNtcCA0IC1tIDhHIFwKPiAgICAtYmxvY2tkZXYgbm9kZS1u
YW1lPXBmbGFzaDAsZHJpdmVyPWZpbGUscmVhZC1vbmx5PW9uLGZpbGVuYW1lPVJJU0NWX1ZJUlRf
Q09ERS5mZCBcCj4gICAgLWJsb2NrZGV2IG5vZGUtbmFtZT1wZmxhc2gxLGRyaXZlcj1maWxlLGZp
bGVuYW1lPVJJU0NWX1ZJUlRfVkFSUy5mZCBcCj4gICAgLW9iamVjdCBtZW1vcnktYmFja2VuZC1y
YW0sc2l6ZT00RyxpZD1tMCBcCj4gICAgLW9iamVjdCBtZW1vcnktYmFja2VuZC1yYW0sc2l6ZT00
RyxpZD1tMSBcCj4gICAgLW51bWEgbm9kZSxtZW1kZXY9bTAsY3B1cz0wLTEsbm9kZWlkPTAgXAo+
ICAgIC1udW1hIG5vZGUsbWVtZGV2PW0xLGNwdXM9Mi0zLG5vZGVpZD0xIFwKPiAgICAtbnVtYSBk
aXN0LHNyYz0wLGRzdD0xLHZhbD0zMCBcCj4gICAgLWtlcm5lbCBsaW51eC9hcmNoL3Jpc2N2L2Jv
b3QvSW1hZ2UgXAo+ICAgIC1pbml0cmQgYnVpbGRyb290L291dHB1dC9pbWFnZXMvcm9vdGZzLmNw
aW8gXAo+ICAgIC1hcHBlbmQgInJvb3Q9L2Rldi9yYW0gcm8gY29uc29sZT1odmMwIGVhcmx5Y29u
PXNiaSIKPgo+IFsgICAgMC4wMDAwMDBdIEFDUEk6IFNSQVQ6IE5vZGUgMCBQWE0gMCBbbWVtIDB4
ODAwMDAwMDAtMHgxN2ZmZmZmZmZdCj4gWyAgICAwLjAwMDAwMF0gQUNQSTogU1JBVDogTm9kZSAx
IFBYTSAxIFttZW0gMHgxODAwMDAwMDAtMHgyN2ZmZmZmZmZdCj4gWyAgICAwLjAwMDAwMF0gTlVN
QTogTk9ERV9EQVRBIFttZW0gMHgxN2ZlM2JjNDAtMHgxN2ZlM2NmZmZdCj4gWyAgICAwLjAwMDAw
MF0gTlVNQTogTk9ERV9EQVRBIFttZW0gMHgyN2ZmZjRjNDAtMHgyN2ZmZjVmZmZdCj4gLi4uCj4g
WyAgICAwLjAwMDAwMF0gQUNQSTogTlVNQTogU1JBVDogUFhNIDAgLT4gSEFSVElEIDB4MCAtPiBO
b2RlIDAKPiBbICAgIDAuMDAwMDAwXSBBQ1BJOiBOVU1BOiBTUkFUOiBQWE0gMCAtPiBIQVJUSUQg
MHgxIC0+IE5vZGUgMAo+IFsgICAgMC4wMDAwMDBdIEFDUEk6IE5VTUE6IFNSQVQ6IFBYTSAxIC0+
IEhBUlRJRCAweDIgLT4gTm9kZSAxCj4gWyAgICAwLjAwMDAwMF0gQUNQSTogTlVNQTogU1JBVDog
UFhNIDEgLT4gSEFSVElEIDB4MyAtPiBOb2RlIDEKPgo+IC0tLQo+IENoYW5nZXMgc2luY2UgdjIK
PiAgIC0gUmViYXNlIHRvIExpbnV4IDYuOS1yYzEKPiAgIC0gY2hhbmdlZCBBQ1BJX05VTUEgdG8g
YSBoaWRkZW4gb3B0aW9uIGluIHBhdGNoIDUvNiBwZXIgQXJuZCdzIHN1Z2dlc3Rpb24KPiAgIC0g
UmVtb3ZlZCBvcmlnaW5hbCA2LzYgd2hpY2ggd2FzIG5vdCBuZWVkZWQgd2l0aCBjaGFuZ2VzIGlu
IHBhdGNoIDUvNgo+ICAgLSBBZGRlZCBhIG5ldyBwYXRjaCA2LzYgdG8gcmVwbGFjZSBwcl9pbmZv
IHRvIHByX2RlYnVnIGluIGFyY2hfYWNwaV9udW1hX2luaXQKPgo+IEhhaWJvIFh1ICg2KToKPiAg
IEFDUElDQTogU1JBVDogQWRkIFJJU0MtViBSSU5UQyBhZmZpbml0eSBzdHJ1Y3R1cmUKPiAgIEFD
UEk6IFJJU0NWOiBBZGQgTlVNQSBzdXBwb3J0IGJhc2VkIG9uIFNSQVQgYW5kIFNMSVQKPiAgIEFD
UEk6IE5VTUE6IEFkZCBoYW5kbGVyIGZvciBTUkFUIFJJTlRDIGFmZmluaXR5IHN0cnVjdHVyZQo+
ICAgQUNQSTogTlVNQTogTWFrZSBzb21lIE5VTUEgcmVsYXRlZCBwYXJzZSBmdW5jdGlvbnMgY29t
bW9uCj4gICBBQ1BJOiBOVU1BOiBjaGFuZ2UgdGhlIEFDUElfTlVNQSB0byBhIGhpZGRlbiBvcHRp
b24KPiAgIEFDUEk6IE5VTUE6IHJlcGxhY2UgcHJfaW5mbyB3aXRoIHByX2RlYnVnIGluIGFyY2hf
YWNwaV9udW1hX2luaXQKPgo+ICBhcmNoL2FybTY0L0tjb25maWcgICAgICAgICAgICB8ICAgMSAt
Cj4gIGFyY2gvbG9vbmdhcmNoL0tjb25maWcgICAgICAgIHwgICAxIC0KPiAgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9hY3BpLmggfCAgMTUgKysrLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmls
ZSAgICB8ICAgMSArCj4gIGFyY2gvcmlzY3Yva2VybmVsL2FjcGkuYyAgICAgIHwgICA1IC0tCj4g
IGFyY2gvcmlzY3Yva2VybmVsL2FjcGlfbnVtYS5jIHwgMTMxICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyAgICAgfCAgIDQgKy0K
PiAgYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jICAgfCAgIDIgLQo+ICBkcml2ZXJzL2FjcGkv
bnVtYS9LY29uZmlnICAgICB8ICAgNSArLQo+ICBkcml2ZXJzL2FjcGkvbnVtYS9zcmF0LmMgICAg
ICB8ICA0MCArKysrKysrKy0tLQo+ICBkcml2ZXJzL2Jhc2UvYXJjaF9udW1hLmMgICAgICB8ICAg
MiArLQo+ICBpbmNsdWRlL2FjcGkvYWN0YmwzLmggICAgICAgICB8ICAxOCArKysrLQo+ICBpbmNs
dWRlL2xpbnV4L2FjcGkuaCAgICAgICAgICB8ICAgNiArKwo+ICAxMyBmaWxlcyBjaGFuZ2VkLCAy
MDQgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBh
cmNoL3Jpc2N2L2tlcm5lbC9hY3BpX251bWEuYwo+Cj4gLS0KPiAyLjM0LjEKPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
