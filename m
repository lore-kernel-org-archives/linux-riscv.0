Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55F8CD98E4
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 21:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ft57b3nvNrqdjubiFmPfPnVP9hfYDEs+gk7if8ApSto=; b=IwMeF+dmhkRCHq
	0ElO5tkOuxEPTsVBe3ayLkcr+bku8ikW1dLs5aCA8kfq5zbEOxXxPdxMzhi4Et2UceLOmJRXlfJud
	wrCiTKGeqDLhRHmLkoE6bs3580WdBoVhoHW7r4jqkTZpjx3MEv0B4zcKQ1XEWukGY2Ck1zePpXVur
	dxjoiv2llpfQu1C63T7nxIb1CAScKHf8ht1MhJ7OxaNGKfUK+TAV911VCnMIiXdnFdkaJQQ7ri860
	21krimHCrjHcXGw4EjzKLfS4hE0Xgnfd0IWwf0CzsAsdpb99G4a3S9NHFn0BI02jWQLuaM2BPRM00
	HdvXWcSX8K2mr8uAV5og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZyDH-00000000NOb-27Et;
	Wed, 17 Jun 2026 21:54:23 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZyDF-00000000NO8-06Fr
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jun 2026 21:54:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso1164885e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jun 2026 14:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781733259; x=1782338059; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRo7rRtyFnw8rThFCSxCEWpqAPzGeBGOtHfIm/LouJ4=;
        b=Sp7MVN7SZWcpRsdrv6OPTuyNtBYgWF/GsyT2jeK19zwMdNzQu+TMMd8SgfybvIlAsG
         +zMBV3dczX1p1hsyV7OqsH353d+EPL9yXQ2JjuMoUB84TJumKw/eduSms4YrJrGQXVPI
         Hz8J+BUrRsREzo1tXdMM8kA85ARYuj3ObXZmSecY23ENTWQYtecMYYW+8IpKdHG7cAuv
         J5hQuAdjaZlcOIuC2pXUAmo3rTkS+8BzdA2fei69QIbpZl7Zb/O+GwHY0EDBTU/eMw30
         K/n5lVbOHfUPE1tECGCM/G+2mjKe/rzT00SAslG1r0fFZPCtWApGb58jB48+9xYSvvmf
         +eag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781733259; x=1782338059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qRo7rRtyFnw8rThFCSxCEWpqAPzGeBGOtHfIm/LouJ4=;
        b=MXKSVLwDV2bFosKM8tYmXCgwRGrTeKzxvO5WFFuutIZZ6wTclTty0L+dAoLW17MZu8
         9eyvLY//Y06SNqBOJHYB1OVOs/P2fZMqLaJp/t/NpGfeTOgKTfLI7x3fGrAx3ro0GggC
         I7Y1ycFLEBtWAiM2/mU87YEk9KnwTOpNTE818rp8gEiOMgl5/+rK9mIchI+UkEYjHuXU
         UVtvD8fSGGe99/KCtmMqBspm/IMYTayYumoKtpIMLpvmhQAye/oeuADJYmXn8xkMdFyL
         YUBmUVn/Jbv/44lHbJqexeTM4bv6Shh8GquqPOjzCAcD5rtl7pcRP1Cgl+Zt/eaOw/XU
         FO2A==
X-Forwarded-Encrypted: i=1; AFNElJ/mjS2bysdn3qCLSGawZZQurXqcToS/khgOCscsIlAjfuYhyk1+b0t/vA1O4nz0tsKMaVn/QBly551goQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2wvwTjHPnUjpT7UsB+QcYKup+BG43HVM9sqAILlIdvUlhtbLC
	c7VYX71yc14BbtnZXtE1k51n7tWZ3yqRLV+Wqlyg9XQLW1ncZIr6khYO
X-Gm-Gg: Acq92OEX45DRPNQ1OkIPq4ejtRNp56EkdhT7hDHIzSs+HaLDlYtsqfG9GOcI0NwAZHi
	xpVHaz+UgkbJWjD8tTdRZQ5KD6rHbUdUISsymfH0GCPn+KZnjA7jK0/pGI92s0VUUfSWW1Akclb
	CkNiv/VNBmsWRQg/eZSM5NmEiFo1ZdBYe3U2m137J0iIR9hqSnflHeB7r/MzoK9FHR9iCl3L4Cl
	8L09IwGApvxpUPVOSm3IDTvSq6VxAu3GXF+5b61CSbuPdzl2YlCNBLlTsf/0mciVXzCzYZPN5NM
	2zAq7zPBDXDgEJk6A8knKqlDFsg2fk6oIEtnfFbyjsRrxWtRAjfvRZ2CNeMI70Cs23Gemr5Uwtf
	4UiFS01Et9qsHdVDKF0RAnrNqU96FXxw8Us6JHV5UMMXFky1hxyKIOkwWkN51KOrq47jERA4U6h
	rnpFi3TOw9bNGNsML+qH5vAGXyV2T2tiKvpuFI8pmFvTaHDiRbfVBE4TjH6uMY
X-Received: by 2002:a05:600c:848e:b0:490:b3e7:4614 with SMTP id 5b1f17b1804b1-4923342785fmr92261345e9.25.1781733259101;
        Wed, 17 Jun 2026 14:54:19 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm188031235e9.5.2026.06.17.14.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 14:54:18 -0700 (PDT)
Date: Wed, 17 Jun 2026 22:54:16 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: zhangzhanpeng.jasper@bytedance.com, alex@ghiti.fr,
 aou@eecs.berkeley.edu, cuiyunhui@bytedance.com, iommu@lists.linux.dev,
 joro@8bytes.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, luxu.kernel@bytedance.com,
 palmer@dabbelt.com, pjw@kernel.org, robin.murphy@arm.com,
 tjeznach@rivosinc.com, will@kernel.org, yuanzhu@bytedance.com
Subject: Re: [PATCH v1] iommu/riscv: Support 32-bit register accesses
Message-ID: <20260617225416.0c5a79b0@pumpkin>
In-Reply-To: <CAJF2gTTCLKCnTcY=K9hsepRgKwDRXqg5eqJBPxBPqTp98zqFKw@mail.gmail.com>
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
	<20260615123821.373248-1-guoren@kernel.org>
	<20260616113651.1048a19a@pumpkin>
	<CAJF2gTTh1zyAZkKt7AQNZptG_H=-8xSum6PVTyxEmw23pN6-9g@mail.gmail.com>
	<20260616205147.6aa7df98@pumpkin>
	<CAJF2gTTCLKCnTcY=K9hsepRgKwDRXqg5eqJBPxBPqTp98zqFKw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_145421_114183_F5C869AC 
X-CRM114-Status: GOOD (  32.97  )
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

T24gVGh1LCAxOCBKdW4gMjAyNiAwMDoyNDoxMiArMDgwMApHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cgo+IE9uIFdlZCwgSnVuIDE3LCAyMDI2IGF0IDM6NTHigK9BTSBEYXZpZCBM
YWlnaHQKPiA8ZGF2aWQubGFpZ2h0LmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24g
VHVlLCAxNiBKdW4gMjAyNiAyMzo0NzowNSArMDgwMAo+ID4gR3VvIFJlbiA8Z3VvcmVuQGtlcm5l
bC5vcmc+IHdyb3RlOgo+ID4gIAo+ID4gPiBPbiBUdWUsIEp1biAxNiwgMjAyNiBhdCA2OjM24oCv
UE0gRGF2aWQgTGFpZ2h0Cj4gPiA+IDxkYXZpZC5sYWlnaHQubGludXhAZ21haWwuY29tPiB3cm90
ZTogIAo+ID4gPiA+Cj4gPiA+ID4gT24gTW9uLCAxNSBKdW4gMjAyNiAxMjozODoxNyArMDAwMAo+
ID4gPiA+IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPiAgCj4gPiA+
ID4gPiBIaSBaaGFucGVuZyBaaGFuZywgIAo+ID4gPiA+IC4uICAKPiA+ID4gPiA+IDMuIE9ubHkg
cGVyZm9ybWFuY2UtbW9uaXRvcmluZyBjb3VudGVycyByZXF1aXJlIDY0LWJpdCBJTyBhY2Nlc3Mg
b3IgdGhlCj4gPiA+ID4gPiBoaWdoLWxvdy1oaWdoIGRvLXdoaWxlIHJldHJ5IHN0cmF0ZWd5LiBG
b3Igb3JkaW5hcnkgc3RhdHVzIGFuZCBjb250cm9sCj4gPiA+ID4gPiBNTUlPIHJlZ2lzdGVycywg
YSBzaW5nbGUgcmVhZCBpcyBzdWZmaWNpZW50LiAgCj4gPiA+ID4KPiA+ID4gPiBBY3R1YWxseSB0
aGlzIHNlcXVlbmNlIHNob3VsZCBiZSBlbm91Z2ggZm9yIGEgY291bnRlcjoKPiA+ID4gPiAgICAg
ICAgIGhpID0gcmVhZF9oaSgpOwo+ID4gPiA+ICAgICAgICAgbG8gPSByZWFkX2xvKCk7Cj4gPiA+
ID4gICAgICAgICBpZiAoaGkgIT0gcmVhZF9oaSgpKSB7Cj4gPiA+ID4gICAgICAgICAgICAgICAg
IC8vIFBpY2sgYSB2YWx1ZSB0aGF0IGhhcHBlbmVkIHdoaWxlIGRvaW5nIHRoZSByZWFkcy4KPiA+
ID4gPiAgICAgICAgICAgICAgICAgaGkrKzsKPiA+ID4gPiAgICAgICAgICAgICAgICAgbG8gPSAw
Owo+ID4gPiA+ICAgICAgICAgfSAgCj4gPiA+IFRoaXMgaXMgbm90IGEgZnJlZSBvcHRpbWl6YXRp
b24g4oCUIGl0IGRvZXMgbm90IHByZXNlcnZlIHRoZSBzYW1lCj4gPiA+IHNlbWFudGljcyBhcyBh
biBhdG9taWMgNjQtYml0IHJlYWQuIFRoZXJlIGFyZSBhdCBsZWFzdCB0d28gY29ycmVjdG5lc3MK
PiA+ID4gaXNzdWVzOgo+ID4gPgo+ID4gPiAxLiBMb3NzIG9mIHByZWNpc2lvbjogSWYgaGkgY2hh
bmdlZCBkdXJpbmcgdGhlIHJlYWQsIHNldHRpbmcgbG8gPSAwCj4gPiA+IGRpc2NhcmRzIHRoZSBh
Y3R1YWwgbG8gdmFsdWUuIFRoZSBjb3JyZWN0IGFwcHJvYWNoIGlzIHRvIHJlLXJlYWQgbG8KPiA+
ID4gYWZ0ZXIgZGV0ZWN0aW5nIHRoZSBjaGFuZ2UsIG5vdCBmYWJyaWNhdGUgYSB2YWx1ZS4KPiA+
ID4KPiA+ID4gMi4gTXVsdGlwbGUgb3ZlcmZsb3dzOiBUaGlzIGFzc3VtZXMgYXQgbW9zdCBvbmUg
b3ZlcmZsb3cgb2NjdXJzCj4gPiA+IGJldHdlZW4gcmVhZHMuIElmIHR3byBvdmVyZmxvd3MgaGFw
cGVuIChlLmcuLCBkdWUgdG8gaW50ZXJydXB0Cj4gPiA+IGluamVjdGlvbiksIGhpKysgd2lsbCBw
cm9kdWNlIGFuIGluY29ycmVjdCByZXN1bHQsIHNpbGVudGx5IGNvcnJ1cHRpbmcKPiA+ID4gdGhl
IGNvdW50ZXIgdmFsdWUuCj4gPiA+Cj4gPiA+IE5lZ2xpZ2libGUgYmVuZWZpdDogaGkgY2hhbmdp
bmcgYmV0d2VlbiByZWFkcyBpcyBhbiBleHRyZW1lbHkgcmFyZQo+ID4gPiBldmVudC4gT3B0aW1p
emluZyBhd2F5IHRoZSByZXRyeSBsb29wIGZvciBzdWNoIGEgcmFyZSBjYXNlIHByb3ZpZGVzIG5v
Cj4gPiA+IG1lYW5pbmdmdWwgcGVyZm9ybWFuY2UgZ2Fpbi4gQW5kIGlmIGhpIG5ldmVyIHN0YWJp
bGl6ZXMsIHRoYXQKPiA+ID4gaW5kaWNhdGVzIGEgaGFyZHdhcmUgZmFpbHVyZSDigJQgaW4gd2hp
Y2ggY2FzZSBoYW5naW5nIGluIHRoZSByZXRyeSBsb29wCj4gPiA+IGlzIGFjdHVhbGx5IHRoZSBt
b3JlIGFwcHJvcHJpYXRlIGJlaGF2aW9yLCBhcyBpdCBtYWtlcyB0aGUgZmFpbHVyZQo+ID4gPiB2
aXNpYmxlIHJhdGhlciB0aGFuIHNpbGVudGx5IHByb2R1Y2luZyBnYXJiYWdlIHZhbHVlcy4KPiA+
ID4KPiA+ID4gVGhlIGhpZ2gtbG93LWhpZ2ggZG8td2hpbGUgcmV0cnkgc3RyYXRlZ3kgZXhpc3Rz
IHByZWNpc2VseSB0byBoYW5kbGUKPiA+ID4gdGhlc2UgY2FzZXMgY29ycmVjdGx5LiBJIGRvbid0
IHRoaW5rIHRoaXMgcHJvcG9zZWQgc2VxdWVuY2UgaXMgYSB2YWxpZAo+ID4gPiByZXBsYWNlbWVu
dC4KPiA+ID4gIAo+ID4KPiA+IFRoZSBwb2ludCBpcyB0aGF0IGlmIHRoZSB2YWx1ZSBpcyBhbiBp
bmNyZW1lbnRpbmcgY291bnRlciAob2Ygc29tZSBmb3JtKQo+ID4gdGhlbiB0aGUgdmFsdWUgaXMg
c3RhbGUgYnkgdGhlIHRpbWUgdGhlIHJlYWRpbmcgc2VxdWVuY2UgY29tcGxldGVzLgo+ID4gU28g
YWxsIHRoZSBjb2RlIGNhbiBiZSBhc3N1bWVkIHRvIGRvIGlzIHJldHVybiBhIHZhbHVlIHRoZSBj
b3VudGVyIGhhZAo+ID4gc29tZXRpbWUgYmV0d2VlbiB3aGVuIHRoZSBjb2RlIHN0YXJ0ZWQgYW5k
IHdoZW4gaXQgZmluaXNoZWQuCj4gPiBJZiBoaSBjaGFuZ2VzIHRoZW4gaGkrMTowIG11c3QgaGF2
ZSBoYXBwZW5lZCB3aGlsZSB0aGUgY29kZSB3YXMgcnVubmluZwo+ID4gc28gaXQgaXMgYSBzYWZl
IHJldHVybiB2YWx1ZS4gIAo+IFlvdSdyZSByaWdodCDigJQgKGhpICsgMSk6MCBpcyBlbm91Z2gg
Zm9yIGhpLWxvLWhpLiBUaGFuayB5b3UgZm9yCj4gc3RpY2tpbmcgdG8geW91ciBwb2ludDsgaXQg
aGVscGVkIG1lIHRoaW5rIG1vcmUgY2FyZWZ1bGx5IGFuZAo+IHVuZGVyc3RhbmQgdGhlIHN1YnRs
ZXR5LgoKRG9uJ3Qgd29ycnksIEknbGwgaGF2ZSB3cml0dGVuIHRoZSBsb29wIGluIHRoZSBwYXN0
LgpQcm9iYWJseSBiZXN0IGlzIHJlYWQgb2xkX2hpLWxvLWhpIHRoZW4gaWYgKGhpICE9IG9sZF9o
aSkgbG8gPSAwCgoJRGF2aWQKCj4gCj4gPgo+ID4gSXQgaXMgbGlrZWx5IHRoYXQgdGhlIHJlYWRz
IGFyZSBhbHNvIG11Y2ggc2xvd2VyIHRoYW4gbWVtb3J5IHJlYWRzLgo+ID4gSWYgaGkgY2hhbmdl
cyByZWxhdGl2ZWx5IGluZnJlcXVlbnRseSAoY29tcGFyZWQgdG8gdGhlIG51bWJlciBvZiByZWFk
cykKPiA+IGl0IG1heSBiZSB3b3J0aCBzYXZpbmcgdGhlIHByZXZpb3VzbHkgcmVhZCB2YWx1ZSBh
bmQgYXZvaWRpbmcgdGhlIHNlY29uZAo+ID4gcmVhZCBvZiBoaSBpZiBpdCBpcyB0aGUgc2FtZSBh
cyB0aGUgcHJldmlvdXMgcmVhZCBoaSBhbmQgbG8gaGFzIGdvdCBsYXJnZXIuICAKPiAKPiAKPiAt
LQo+IEJlc3QgUmVnYXJkcwo+ICBHdW8gUmVuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
