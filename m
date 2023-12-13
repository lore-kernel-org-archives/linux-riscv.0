Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054C1C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 17:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jT0W5/bJRMzkUNIESTpjnm/B/1q3/upwXuuNSSddQqA=; b=NLVai/ax/n0m33
	MIrxqA5WkS8HQmhWlvmpaGSRrHrY+gt+MBwQZNlTy+8BPvXK276UeAsYXoHwu+VjuT5mRXCfcjosh
	jEqEhNBwZu/VCVrEZKy7VntY8tYbRH6AUQsEHMIo9w6igU0wklvAaR93T4vVqpFmsZqK9U/vOSiSY
	84iy42fOl+xbeyeJsirkMfv+wkiBYI47GHGkQHp+YhxdWrwwV+MqPiHAnmyO301loA7OAuy2pOa6z
	ra92KFVudFvlyMYRlYtC8js/YlDXxflraZgQbvYrJfMD+5oIm0z95yUCQfgVCrajfO/oF/trBvcM0
	PH4lnhYAsMhc2ysceoMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSmf-00FYb8-1C;
	Wed, 13 Dec 2023 17:12:33 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSmc-00FYaN-1S
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 17:12:32 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40c55872d80so10806865e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 09:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702487549; x=1703092349; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c59vlX5YclU/QFrLJL0zA0ruhcMbY+hSeyN1btvp4fQ=;
        b=LCwofZYrucPJcJozv7l0NTiq9QN7LadUY3AUXvVtWzO9AesjwyvMAnlaOhtHUA0vuD
         zJutKcTWW868Inb0wUwI1ILnS3qRMeA8VQ8TJNxfsEsNTzTaq3uSXgqvAf9FV5NRhmvo
         AaqX+skY1yWo5iyJouXjjhnUQ10k18uPTG6yA/aGpoVuQB5Ugeol0opOm/wX7eUylRsk
         LcorPCBz84ODMi/40Jl6YeN4IJ9Zo3Pz7XSdQVMk+5j5lfcr7tfiGKFakGkSTk5zEx/2
         zs0Cvg98GqIYlMB78XSbOK+MEeBAX09qzj+MLb5GiL+rZLIw2NkbCMbGc0s7mrlJNLHJ
         ewrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702487549; x=1703092349;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c59vlX5YclU/QFrLJL0zA0ruhcMbY+hSeyN1btvp4fQ=;
        b=VT1lzispQ5RTj0YlveovOs5brEDIHhJOqYCUViidXN8Hb8qti7I+1YNp0wvlRjbD7f
         QEk3bNoSSmetBobhpDrp9TdBWTVJGScoZQqshTvUJ7P7eZfgjHJku/wEK/XvId8PY6aP
         eQDTI67yPyCejSXle1eiwkMJlNV6S9T4+nAeqWr6bQIoAZpGAKc3GVP6WZiArPAv5D7u
         lFmJKDCafqX6e5gpSEJSrGvC1RHl37ck9Fb3R2kpJVYFSfDEsNmWsJq4KXTfdATIswKG
         T9PtlTtaBrXSBU18WAfYD8DY9cGza0JzxjgSfnIPxvW+MVH0eYWDU63x0wRwofH8PIAr
         OOuA==
X-Gm-Message-State: AOJu0YwjPPQG93S7HLjrK8GWEedDtMxuViGzACMhT9NxUTB2ieO9f4QT
	GLlYywPqiam1ZDEmULD1qBl/jA==
X-Google-Smtp-Source: AGHT+IG0YVMcA5InPhxMnjzq4w4I7o9lntXWnDdH7Lx4h/rZh75Nk5CJjro49sbs3dOlCnHPL4S2Zw==
X-Received: by 2002:a05:600c:4897:b0:40c:2b49:460d with SMTP id j23-20020a05600c489700b0040c2b49460dmr4057855wmp.135.1702487548871;
        Wed, 13 Dec 2023 09:12:28 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600c46ce00b0040c4c9c52a3sm9537956wmo.12.2023.12.13.09.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 09:12:28 -0800 (PST)
Date: Wed, 13 Dec 2023 18:12:27 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <anup@brainfault.org>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	atishp@atishpatra.org, palmer@dabbelt.com, haibo1.xu@intel.com
Subject: Re: [PATCH 0/6] RISC-V: KVM: Make SBI uapi consistent with ISA uapi
Message-ID: <20231213-2de73d20a178c32f9a716cf4@orel>
References: <20231130183537.55203-8-ajones@ventanamicro.com>
 <CAAhSdy0ic5ERKR8Q2VdSOzNSgV22omE_7qPN0fNcUTxawZRn4w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy0ic5ERKR8Q2VdSOzNSgV22omE_7qPN0fNcUTxawZRn4w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_091230_489712_4902E0DD 
X-CRM114-Status: GOOD (  19.81  )
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

T24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgMDk6NTk6MjJQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBGcmksIERlYyAxLCAyMDIzIGF0IDEyOjE54oCvQU0gQW5kcmV3IEpvbmVzIDxham9u
ZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gU0JJIGV4dGVuc2lvbiBVQVBJIGlz
IGN1cnJlbnRseSBhbG1vc3QgdGhlIHNhbWUgYXMgdGhlIElTQSBleHRlbnNpb24KPiA+IFVBUEku
IFRoaXMgc2VyaWVzIGNsb3NlcyB0aGUgcmVtYWluaW5nIGdhcCBieSBlbnN1cmluZyB3aGVuIGFu
IFNCSQo+ID4gZXh0ZW5zaW9uIGlzIG5vdCBhdmFpbGFibGUgdGhhdCBpdHMgcmVnaXN0ZXIgcmV0
dXJucyBFTk9FTlQgd2hlbgo+ID4gYWNjZXNzZWQgYnkgdXNlcnNwYWNlLiBXZSBhbHNvIGRyb3Ag
dGhlIFNCSSBtdWx0aSByZWdpc3RlcnMgZnJvbQo+ID4gZ2V0LXJlZy1saXN0IChJU0EgbXVsdGkg
cmVnaXN0ZXJzIGFyZW4ndCB0aGVyZSBlaXRoZXIpIGFuZCBtYWtlCj4gPiBzZXZlcmFsIGltcHJv
dmVtZW50cyB0byB0aGUgZ2V0LXJlZy1saXN0IGtzZWxmdGVzdC4KPiA+Cj4gPiBUaGlzIHNlcmll
cyBpcyBiYXNlZCBvbiBBbnVwJ3MgcmlzY3Zfa3ZtX21vcmVfZXh0c192MSBicmFuY2guCj4gPiBC
YXNlZC1vbjogMjAyMzExMjgxNDUzNTcuNDEzMzIxLTEtYXBhdGVsQHZlbnRhbmFtaWNyby5jb20K
PiA+Cj4gPiBUaGFua3MsCj4gPiBkcmV3Cj4gPgo+ID4gQW5kcmV3IEpvbmVzICg2KToKPiA+ICAg
UklTQy1WOiBLVk06IERvbid0IGFkZCBTQkkgbXVsdGkgcmVncyBpbiBnZXQtcmVnLWxpc3QKPiA+
ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBEcm9wIFNCSSBtdWx0aSByZWdpc3RlcnMKPiA+ICAg
UklTQy1WOiBLVk06IE1ha2UgU0JJIHVhcGkgY29uc2lzdGVudCB3aXRoIElTQSB1YXBpCj4gCj4g
SSBhbSBub3QgYWJsZSB0byBsb2NhdGUgdGhpcyBwYXRjaCBvbiB0aGUgbWFpbGluZyBsaXN0IGFz
IHdlbGwgYXMgb24KPiBwYXRjaHdvcmsuCj4gCj4gQ2FuIHlvdSByZS1zZW5kIHRoaXMgc2VyaWVz
ID8KClNlbnQgYSB2MiByZWJhc2VkIG9uIHRoZSBsYXRlc3Qga3ZtLXJpc2N2L3Jpc2N2X2t2bV9x
dWV1ZSByYXRoZXIKdGhhbiB5b3VyIHJpc2N2X2t2bV9tb3JlX2V4dHNfdjEgYnJhbmNoLiBIb3Bl
ZnVsbHkgdGhpcyBvbmUgbWFrZXMKaXQgdG8gdGhlIE0vTC4KClRoYW5rcywKZHJldwoKPiAKPiBS
ZWdhcmRzLAo+IEFudXAKPiAKPiA+ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgUklTQ1Zf
U0JJX0VYVF9SRUcKPiA+ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBVc2UgcmVnaXN0ZXIgc3Vi
dHlwZXMKPiA+ICAgUklTQy1WOiBLVk06IHNlbGZ0ZXN0czogVHJlYXQgU0JJIGV4dCByZWdzIGxp
a2UgSVNBIGV4dCByZWdzCj4gPgo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVf
c2JpLmggICAgICAgICB8ICAxMCArLQo+ID4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMg
ICAgICAgICAgICAgICAgICB8ICA1MyArLS0tCj4gPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmku
YyAgICAgICAgICAgICAgICAgICAgIHwgIDc1ICsrKy0tCj4gPiAgYXJjaC9yaXNjdi9rdm0vdmNw
dV9zYmlfcmVwbGFjZS5jICAgICAgICAgICAgIHwgICAyICstCj4gPiAgLi4uL3NlbGZ0ZXN0cy9r
dm0vaW5jbHVkZS9rdm1fdXRpbF9iYXNlLmggICAgIHwgICAxICsKPiA+ICAuLi4vc2VsZnRlc3Rz
L2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oICAgfCAgNDAgKy0tCj4gPiAgLi4uL3NlbGZ0
ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jICAgICAgIHwgICA0ICstCj4gPiAgLi4uL3Nl
bGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgICAgICAgIHwgMjc0ICsrKysrKysrKysr
Ky0tLS0tLQo+ID4gIDggZmlsZXMgY2hhbmdlZCwgMjgxIGluc2VydGlvbnMoKyksIDE3OCBkZWxl
dGlvbnMoLSkKPiA+Cj4gPiAtLQo+ID4gMi40My4wCj4gPgo+ID4KPiA+IC0tCj4gPiBrdm0tcmlz
Y3YgbWFpbGluZyBsaXN0Cj4gPiBrdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
