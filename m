Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE0EC4167D
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 17:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=NGhmhfkvH2+kKL9lR2QnFNIY23UcszVrICqtxLS5v2Y=; b=i8dsMDgbU9Axu7/OSJT/fd3m9y
	AnpYDuFJgXrvNJcPiVbzRqWDGH2HgU8Qq5vFD9Gwv5JerpiMxdVxSOjp4eY72oK9FQ1vPkg4t3bcC
	Jxri4znHdTpOPjlypXkpYji5/h/tQntwGlp37cGWoGJXRKOWg/5ZlDqT+/+vyFzD0NJQ+Jrj2pje7
	xs8dUAB37x/aspe+J/vcHO6m1lTXZ7sFMIwrChTAP8AYAxbqvT8ekdPpx/rXZNTEx0YoOPslBtE8V
	1diTnB8hUPafPrR4yUsDscBdw2u7scG7RXN3aydzd6EVC1Ls7LVnro3dTSe701UH4cEVoL/hRz7MX
	dP1JtOjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r03hP-00HGUE-2M;
	Mon, 06 Nov 2023 17:47:43 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r03hH-00HGR1-12
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 17:47:42 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6ce2add34c9so2783316a34.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 09:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1699292853; x=1699897653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FK4uYtCWASAh5nxvSUgk2a3NS0yQI0Q/PF/dmiOH8ms=;
        b=XqT+GAd0Rw+CEY4id9i4WTM9F8YsMBX44b6pKTePZNUyQFfxIA9WCcO3otwM+jhP9H
         7LFsR38J0+J2YcOsuaoWKiwOShjC3QQ3BziBjeZw2McQ++3n3zTiNixmHn68U3+t18fz
         emYteQWXv1kRyX0kP+Bc7u4QLY3WrseAtPpTIA48uWKOefgV9UWO4WE79VdPyIpaiYPz
         w/158RX1vl1kSY8c3yw6T7gk/5xUzNfjlGih7NQrJpih3kT200yNxNtbEghLnwdw6cVw
         2hW3y6OMKau6tydx2VC3nfTXQwpsWm0Aa4uoRR+PHjo54qb11AL2o6WiftkOpfztCOxB
         RXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699292853; x=1699897653;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FK4uYtCWASAh5nxvSUgk2a3NS0yQI0Q/PF/dmiOH8ms=;
        b=WOtIEYZQhR9nNuKN7NUovjJ6HokHCCnenyzIc1+56sQcU18T15+d5J6K4Fe0Q4bSlb
         s5Ujvfn2VyJlpW1C4oyHcAXMFrrIEWI+LUHyZPIilb8oraGzAFnEak8UDL+d6x1xDUXX
         kSMtnMwn4COC+mOyPbAdn/Amlmpa3B5O0c2cVDAXqJ3JjnM3lTzqZ+DwEh3NkuUV8ydm
         sl+dpaRIifihIJ0Pf3W/lIR9DiMBUQLLaxu4fBqZp4ME+jBBSgQwlHjX5pMxVvQsmYtn
         ZAGRqWWuFgtjXuXwJtdO5u3Gr00O4QI2O2rn9Xhp+1Ova3MvCWvFklCum1z+LYyXFdgw
         Sjxw==
X-Gm-Message-State: AOJu0YyDAW5jJNCDOsGncONxWMKoGTzIS3psin81elxIUPhtCfgvs/m2
	yDd8VO2YX1cPkxJacS0VnAmWAg==
X-Google-Smtp-Source: AGHT+IFGSnSfFc6b5MBPxmnaVZPt275KPab3iutOmg8Iu0JyM8F+e9ss29YnSmuuK35tariXtn+E0g==
X-Received: by 2002:a05:6870:6b09:b0:1f0:cef:6a45 with SMTP id mt9-20020a0568706b0900b001f00cef6a45mr411591oab.56.1699292851972;
        Mon, 06 Nov 2023 09:47:31 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id ec29-20020a0568708c1d00b001e9ce1b5e8fsm1473031oab.15.2023.11.06.09.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 09:47:31 -0800 (PST)
Date: Mon, 06 Nov 2023 09:47:31 -0800 (PST)
X-Google-Original-Date: Mon, 06 Nov 2023 09:40:42 PST (-0800)
Subject: Re: [PATCH v2 5/5] riscv: kvm: use ".L" local labels in assembly when applicable
In-Reply-To: <20231024132655.730417-6-cleger@rivosinc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  anup@brainfault.org, atishp@atishpatra.org, ajones@ventanamicro.com, cleger@rivosinc.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
  kvm-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: cleger@rivosinc.com
Message-ID: <mhng-467ba655-d75b-4197-b3cb-4b3f97ff0d26@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_094735_376149_81EE84E8 
X-CRM114-Status: GOOD (  18.06  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyNCBPY3QgMjAyMyAwNjoyNjo1NSBQRFQgKC0wNzAwKSwgY2xlZ2VyQHJpdm9zaW5j
LmNvbSB3cm90ZToKPiBGb3IgdGhlIHNha2Ugb2YgY29oZXJlbmN5LCB1c2UgbG9jYWwgbGFiZWxz
IGluIGFzc2VtYmx5IHdoZW4KPiBhcHBsaWNhYmxlLiBUaGlzIGFsc28gYXZvaWQga3Byb2JlcyBi
ZWluZyBjb25mdXNlZCB3aGVuIGFwcGx5aW5nIGEKPiBrcHJvYmUgc2luY2UgdGhlIHNpemUgb2Yg
ZnVuY3Rpb24gaXMgY29tcHV0ZWQgYnkgY2hlY2tpbmcgd2hlcmUgdGhlCj4gbmV4dCB2aXNpYmxl
IHN5bWJvbCBpcyBsb2NhdGVkLiBUaGlzIG1pZ2h0IGVuZCB1cCBpbiBjb21wdXRpbmcgc29tZQo+
IGZ1bmN0aW9uIHNpemUgdG8gYmUgd2F5IHNob3J0ZXIgdGhhbiBleHBlY3RlZCBhbmQgdGh1cyBm
YWlsaW5nIHRvIGFwcGx5Cj4ga3Byb2JlcyB0byB0aGUgc3BlY2lmaWVkIG9mZnNldC4KPgo+IFNp
Z25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPiBSZXZp
ZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiAtLS0KPiAg
YXJjaC9yaXNjdi9rdm0vdmNwdV9zd2l0Y2guUyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHVfc3dpdGNoLlMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3N3aXRjaC5TCj4gaW5k
ZXggOGIxODQ3Mzc4MGFjLi4wYzI2MTg5YWEwMWMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9r
dm0vdmNwdV9zd2l0Y2guUwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc3dpdGNoLlMKPiBA
QCAtNDUsNyArNDUsNyBAQCBTWU1fRlVOQ19TVEFSVChfX2t2bV9yaXNjdl9zd2l0Y2hfdG8pCj4g
IAlSRUdfTAl0MCwgKEtWTV9BUkNIX0dVRVNUX1NTVEFUVVMpKGEwKQo+ICAJUkVHX0wJdDEsIChL
Vk1fQVJDSF9HVUVTVF9IU1RBVFVTKShhMCkKPiAgCVJFR19MCXQyLCAoS1ZNX0FSQ0hfR1VFU1Rf
U0NPVU5URVJFTikoYTApCj4gLQlsYQl0NCwgX19rdm1fc3dpdGNoX3JldHVybgo+ICsJbGEJdDQs
IC5Ma3ZtX3N3aXRjaF9yZXR1cm4KPiAgCVJFR19MCXQ1LCAoS1ZNX0FSQ0hfR1VFU1RfU0VQQyko
YTApCj4KPiAgCS8qIFNhdmUgSG9zdCBhbmQgUmVzdG9yZSBHdWVzdCBTU1RBVFVTICovCj4gQEAg
LTExMyw3ICsxMTMsNyBAQCBTWU1fRlVOQ19TVEFSVChfX2t2bV9yaXNjdl9zd2l0Y2hfdG8pCj4K
PiAgCS8qIEJhY2sgdG8gSG9zdCAqLwo+ICAJLmFsaWduIDIKPiAtX19rdm1fc3dpdGNoX3JldHVy
bjoKPiArLkxrdm1fc3dpdGNoX3JldHVybjoKPiAgCS8qIFN3YXAgR3Vlc3QgQTAgd2l0aCBTU0NS
QVRDSCAqLwo+ICAJY3NycncJYTAsIENTUl9TU0NSQVRDSCwgYTAKCkFja2VkLWJ5OiBQYWxtZXIg
RGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
