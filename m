Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DF3C10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 16:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a/3/iuhKxEJ/pV3JuSBMmp0BD2xaFO14fkvsbpYFbts=; b=G2xBCCHX+rEJXb
	qzQ7mCQLlVcFbT03bNuJToExHNtJzji9GhGJm5BlJX3bCr/DDFh5l95DwHiaR0pp3z9r+cwGCodTT
	GdrJFAxYp45XThe3i4akyuWnVuiR4SCpXjtRUvIHZ96NCru4xIyRlmkS67RZG0IaOqV6On2cFl+l7
	OKCjdFU+OJPAdFPlVNjqEgNAwt8fs1HWxlGPu6nLfSf8l4nUD5Fm6/pcHr8bRU3cKUJ2kLAob/hgT
	q/wi19et/W8WaJ7UYFJSfGuraJsuBSWQV8A4u5MtqGekhU5FZ5xOhFTcRmT0zIKuX/FYc/njtXRiS
	JfQFBgSElWYWF9DmwSVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4NdU-0000000Bx9i-3lrH;
	Tue, 07 May 2024 16:25:49 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4NdR-0000000Bx8j-2ElV
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 16:25:47 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7928c5cb63fso240931685a.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 09:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1715099144; x=1715703944; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4A1sFCToC52p1ydCgtQ7NIaPSTbzbS+T5dDjpm7wNJk=;
        b=HOKawzQCM9uYxi/8MfjItUsTUwEXy3CFidejgYBiHq06q3lFl6xpx6Q5X7sy/T5Im2
         zWLKrojLxFV0rk2rNDq6vpOnnmx2UB5SyailBEfRZcTJkFM6fkd+WuNxqJoyOSZtKdCx
         J70byzzrmDIuRhNsMYMNxA3qgSe7HNMjS3HDUh66CIKHLpdnFmAxi5OUJeeyUhbhUq7j
         eS9B3oWn4yHs9Qod33ASzs2hW1MxBwCA6TphpvhoTlJyUE7q64wx4FFKO9UU8Mp2KpFX
         goucE8NuJQYFdDn48Gf3lwh6eI3n23jeRXRZxgwRQYVpSDhV/W+JW0OX+G5DERVBGZI+
         Y0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099144; x=1715703944;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4A1sFCToC52p1ydCgtQ7NIaPSTbzbS+T5dDjpm7wNJk=;
        b=sKEIuuxwp4o/LCJM/xN8ScRuJ8YL8we9FuaMakqBxXueLNHN3IJKpYDdnNeyv4CLay
         VL/vhjR4UosxRwC4jqGieMKmy94rZTZZU6WFx2X0UvOOG2Sm14mr93DOB1WnWuleyKv8
         nNlhJ46vYG10DmF9NKgn9FlEQBHjuiyXsyFXtcKbFXGJmF+faon+w9yCw5Ob4OfvxcVC
         6dxTVHyqCBotWesVAb5kC9yKLKQC4y7d+s7ywGJsgKOw8MNXY3L8r1j8Ag8aNDsPDl67
         ztP7Mqwe2GJ0BajuzvPNsD2O0J8/gV6eeuKKSF7oKzl4T617X1gjAv5F05WSVbgyVWzh
         tpqA==
X-Forwarded-Encrypted: i=1; AJvYcCWDBrmujLIQt2C3bqvjXAinpvkN8lWCypPBNKE8lMUUSV+TmW4Mlxv/N/KR2S1lNIjorxZWjsZAKZEZL7Iz4L7QTudUNulrCrHvY9v8rmAn
X-Gm-Message-State: AOJu0YzoJc9D2trzzNw3ppQxHHQWbiGDUJ7hd+8vosqYh2Qm+RPchxHI
	m+1CgWiHfHiXel4beo4GBlOF0nlZkim6B58THyI+FOkDQm9U2YhrZ1S/nF0Wl5M0+vlq4GJR2nY
	d
X-Google-Smtp-Source: AGHT+IHR3MbTAXPGdjRNf/QL+MFD2IJBEm9Y6V3orFfaoZDzq3rR0+g0I0blT1MsQ9Ixtyj6g+KxiA==
X-Received: by 2002:a05:620a:e85:b0:790:9e84:9b75 with SMTP id af79cd13be357-792b247fbdcmr40342785a.12.1715099143771;
        Tue, 07 May 2024 09:25:43 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id vr25-20020a05620a55b900b0079291bf9505sm2963899qkn.41.2024.05.07.09.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:25:42 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1s4NdO-0001Rh-8Y;
	Tue, 07 May 2024 13:25:42 -0300
Date: Tue, 7 May 2024 13:25:42 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zong Li <zong.li@sifive.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, kevin.tian@intel.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC RESEND 3/6] iommu/riscv: support GSCID
Message-ID: <20240507162542.GB4718@ziepe.ca>
References: <20240507142600.23844-1-zong.li@sifive.com>
 <20240507142600.23844-4-zong.li@sifive.com>
 <20240507151516.GK901876@ziepe.ca>
 <CANXhq0qLbC2RgW04C5DcuzR-kSmT3hA9rWW=w3e3PKHr+QsyzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANXhq0qLbC2RgW04C5DcuzR-kSmT3hA9rWW=w3e3PKHr+QsyzQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_092545_596404_ADE13CFE 
X-CRM114-Status: GOOD (  31.86  )
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

T24gVHVlLCBNYXkgMDcsIDIwMjQgYXQgMTE6NTI6MTVQTSArMDgwMCwgWm9uZyBMaSB3cm90ZToK
PiBPbiBUdWUsIE1heSA3LCAyMDI0IGF0IDExOjE14oCvUE0gSmFzb24gR3VudGhvcnBlIDxqZ2dA
emllcGUuY2E+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgTWF5IDA3LCAyMDI0IGF0IDEwOjI1OjU3
UE0gKzA4MDAsIFpvbmcgTGkgd3JvdGU6Cj4gPiA+IEBAIC05MTksMjkgKzkyNCw0MyBAQCBzdGF0
aWMgdm9pZCByaXNjdl9pb21tdV9pb3RsYl9pbnZhbChzdHJ1Y3QgcmlzY3ZfaW9tbXVfZG9tYWlu
ICpkb21haW4sCj4gPiA+ICAgICAgIHJjdV9yZWFkX2xvY2soKTsKPiA+ID4KPiA+ID4gICAgICAg
cHJldiA9IE5VTEw7Cj4gPiA+IC0gICAgIGxpc3RfZm9yX2VhY2hfZW50cnlfcmN1KGJvbmQsICZk
b21haW4tPmJvbmRzLCBsaXN0KSB7Cj4gPiA+IC0gICAgICAgICAgICAgaW9tbXUgPSBkZXZfdG9f
aW9tbXUoYm9uZC0+ZGV2KTsKPiA+ID4KPiA+ID4gLSAgICAgICAgICAgICAvKgo+ID4gPiAtICAg
ICAgICAgICAgICAqIElPVExCIGludmFsaWRhdGlvbiByZXF1ZXN0IGNhbiBiZSBzYWZlbHkgb21p
dHRlZCBpZiBhbHJlYWR5IHNlbnQKPiA+ID4gLSAgICAgICAgICAgICAgKiB0byB0aGUgSU9NTVUg
Zm9yIHRoZSBzYW1lIFBTQ0lELCBhbmQgd2l0aCBkb21haW4tPmJvbmRzIGxpc3QKPiA+ID4gLSAg
ICAgICAgICAgICAgKiBhcnJhbmdlZCBiYXNlZCBvbiB0aGUgZGV2aWNlJ3MgSU9NTVUsIGl0J3Mg
c3VmZmljaWVudCB0byBjaGVjawo+ID4gPiAtICAgICAgICAgICAgICAqIGxhc3QgZGV2aWNlIHRo
ZSBpbnZhbGlkYXRpb24gd2FzIHNlbnQgdG8uCj4gPiA+IC0gICAgICAgICAgICAgICovCj4gPiA+
IC0gICAgICAgICAgICAgaWYgKGlvbW11ID09IHByZXYpCj4gPiA+IC0gICAgICAgICAgICAgICAg
ICAgICBjb250aW51ZTsKPiA+ID4gLQo+ID4gPiAtICAgICAgICAgICAgIHJpc2N2X2lvbW11X2Nt
ZF9pbnZhbF92bWEoJmNtZCk7Cj4gPiA+IC0gICAgICAgICAgICAgcmlzY3ZfaW9tbXVfY21kX2lu
dmFsX3NldF9wc2NpZCgmY21kLCBkb21haW4tPnBzY2lkKTsKPiA+ID4gLSAgICAgICAgICAgICBp
ZiAobGVuICYmIGxlbiA+PSBSSVNDVl9JT01NVV9JT1RMQl9JTlZBTF9MSU1JVCkgewo+ID4gPiAt
ICAgICAgICAgICAgICAgICAgICAgZm9yIChpb3ZhID0gc3RhcnQ7IGlvdmEgPCBlbmQ7IGlvdmEg
Kz0gUEFHRV9TSVpFKSB7Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJpc2N2
X2lvbW11X2NtZF9pbnZhbF9zZXRfYWRkcigmY21kLCBpb3ZhKTsKPiA+ID4gKyAgICAgLyoKPiA+
ID4gKyAgICAgICogSG9zdCBkb21haW4gbmVlZHMgdG8gZmx1c2ggZW50cmllcyBpbiBzdGFnZS0y
IGZvciBNU0kgbWFwcGluZy4KPiA+ID4gKyAgICAgICogSG93ZXZlciwgZGV2aWNlIGlzIGJvdW5k
IHRvIHMxIGRvbWFpbiBpbnN0ZWFkIG9mIHMyIGRvbWFpbi4KPiA+ID4gKyAgICAgICogV2UgbmVl
ZCB0byBmbHVzaCBtYXBwaW5nIHdpdGhvdXQgbG9vcGluZyBkZXZpY2VzIG9mIHMyIGRvbWFpbgo+
ID4gPiArICAgICAgKi8KPiA+ID4gKyAgICAgaWYgKGRvbWFpbi0+Z3NjaWQpIHsKPiA+ID4gKyAg
ICAgICAgICAgICByaXNjdl9pb21tdV9jbWRfaW52YWxfZ3ZtYSgmY21kKTsKPiA+ID4gKyAgICAg
ICAgICAgICByaXNjdl9pb21tdV9jbWRfaW52YWxfc2V0X2dzY2lkKCZjbWQsIGRvbWFpbi0+Z3Nj
aWQpOwo+ID4gPiArICAgICAgICAgICAgIHJpc2N2X2lvbW11X2NtZF9zZW5kKGlvbW11LCAmY21k
LCAwKTsKPiA+ID4gKyAgICAgICAgICAgICByaXNjdl9pb21tdV9jbWRfaW9mZW5jZSgmY21kKTsK
PiA+ID4gKyAgICAgICAgICAgICByaXNjdl9pb21tdV9jbWRfc2VuZChpb21tdSwgJmNtZCwgUklT
Q1ZfSU9NTVVfUVVFVUVfVElNRU9VVCk7Cj4gPgo+ID4gSXMgaW9tbXUgbnVsbCBoZXJlPyBXaGVy
ZSBkaWQgaXQgY29tZSBmcm9tPwo+ID4KPiA+IFRoaXMgbG9va3Mgd3JvbmcgdG9vLiBUaGUgImJv
bmRzIiBsaXN0IGlzIHNvcnQgb2YgbWlzbmFtZWQsIGl0IGlzCj4gPiByZWFsbHkgYSBsaXN0IG9m
IGludmFsaWRhdGlvbiBpbnN0cnVjdGlvbnMuIElmIHlvdSBuZWVkIGEgc3BlY2lhbAo+ID4gaW52
YWxpZGF0aW9uIGluc3RydWN0aW9uIGZvciB0aGlzIGNhc2UgdGhlbiB5b3Ugc2hvdWxkIGFsbG9j
YXRlIGEKPiA+IG1lbW9yeSBhbmQgYWRkIGl0IHRvIHRoZSBib25kIGxpc3Qgd2hlbiB0aGUgYXR0
YWNoIGlzIGRvbmUuCj4gPgo+ID4gSW52YWxpZGF0aW9uIHNob3VsZCBzaW1wbHkgaXRlcmF0ZSBv
dmVyIHRoZSBib25kIGxpc3QgYW5kIGRvIHRoZQo+ID4gaW5zdHJ1Y3Rpb25zIGl0IGNvbnRhaW5z
LCBhbHdheXMuCj4gCj4gSSBtZXNzZWQgdXAgdGhpcyBwaWVjZSBvZiBjb2RlIHdoaWxlIGNsZWFu
aW5nIGl0LiBJIHdpbGwgZml4IGl0IGluIHRoZQo+IG5leHQgdmVyc2lvbi4gSG93ZXZlciwgYWZ0
ZXIgeW91ciB0aXBzLCBpdCBzZWVtcyB0byBtZSB0aGF0IHdlIHNob3VsZAo+IGFsbG9jYXRlIGEg
bmV3IGJvbmQgZW50cnkgaW4gdGhlIHMyIGRvbWFpbidzIGxpc3QuIAoKWWVzLCB3aGVuIHRoZSBu
ZXN0IGlzIGF0dGFjaGVkIHRoZSBTMidzIGJvbmQgc2hvdWxkIGdldCBhIEdTQ0lECmludmFsaWRh
dGlvbiBpbnN0cnVjdGlvbiBhbmQgdGhlIFMxJ3MgYm9uZCBzaG91bGQgZ2V0IG5vIGludmFsaWRh
dGlvbgppbnN0cnVjdGlvbi4gQm9uZCBpcyBiZXR0ZXIgdW5kZXJzdG9vZCBhcyAicGFnaW5nIGRv
bWFpbiBpbnZhbGlkYXRpb24KaW5zdHJ1Y3Rpb25zIi4KCihhbHNvIGlmIHlvdSBmb2xsb3cgdGhp
cyBhZHZpY2UsIHRoZW4gYWdhaW4sIEkgZG9uJ3Qgc2VlIHdoeSB0aGUgaWRyCmFsbG9jYXRvcnMg
YXJlIGdsb2JhbCkKCllvdSBoYXZlIHRvIG1ha2UgYSBkZWNpc2lvbiBvbiB0aGUgdXNlciBpbnZh
bGlkYXRpb24gZmxvdywgYW5kIHNvbWUgb2YKdGhhdCBkZXBlbmRzIG9uIHdoYXQgeW91IHBsYW4g
dG8gZG8gZm9yIEFUUyBpbnZhbGlkYXRpb24uCgpJdCBpcyBPSyB0byBtYWtlIHRoZSBuZXN0ZWQg
ZG9tYWluIGxvY2tlZCB0byBhIHNpbmdsZSBpb21tdSwgZW5mb3JjZWQKYXQgYXR0YWNoIHRpbWUs
IGJ1dCBkb24ndCB1c2UgdGhlIGJvbmQgbGlzdCB0byBkbyBpdC4KCkZvciBzaW5nbGUgaW9tbXUg
eW91J2QganVzdCBkZS12aXJ0dWFsaXplIHRoZSBQU0NJRCBhbmQgdGhlIEFUUyB2UklECmFuZCBz
dHVmZiB0aGUgY29tbWFuZHMgaW50byB0aGUgc2luZ2xlIGlvbW11LiBCdXQgdGhpcyBzaG91bGRu
J3QKaW50ZXJhY3Qgd2l0aCB0aGUgYm9uZC4gVGhlIGJvbmQgbGlzdCBpcyBhYm91dCBpbnZhbGlk
YXRpb24KaW5zdHJ1Y3Rpb25zIGZvciB0aGUgcGFnaW5nIGRvbWFpbi4gSnVzdCBsb29zZWx5IHN0
b3JlIHRoZSBvd25pbmcKaW5zdGFjZSBpbiB0aGUgbmVzdGluZyBkb21haW4gc3RydWN0LgoKQWxz
byBwbGVhc2UgYmUgY2FyZWZ1bCB0aGF0IHlvdSBkb24ndCBhZHZlcnRpc2UgQVRTIHN1cHBvcnQg
dG8gdGhlCmd1ZXN0IGJlZm9yZSB0aGUga2VybmVsIGRyaXZlciB1bmRlcnN0YW5kcyBob3cgdG8g
c3VwcG9ydCBpdC4gWW91CnNob3VsZCBwcm9iYWJseSBwdXQgYSBub3RlIHRvIHRoYXQgZWZmZWN0
IGluIHRoZSB1YXBpIHN0cnVjdCBmb3IgdGhlCmdldCBpbmZvIHBhdGNoLgoKSmFzb24KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
