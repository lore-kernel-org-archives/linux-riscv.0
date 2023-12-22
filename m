Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB29BC41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 17:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s+8TRaoHYcMWGRTJAAvVJk5PDgi+lU17IsLQUEu9tvw=; b=Kpkzkenr2HqHCy
	IPle7S1/MvOngX3d1AyeQrTrT3P/H2P/jqjAmqcX6iptYG5YtRKw4Pzc1tPblE3WssDEMWWhZj4F+
	jzMx/yGkEggFJOmtVglvN/cFuFlrLuyIiyVUvahpf436Za7A7XVpdC+h0bA2xPrN4e5D9OaN5MoXp
	EPrB+xig7u8wdrI5+6a6ld8k/+DKTRnF37WmHVPXnDdK6N5ifQ6dPSHvj9ugszMt8iezBGMIow4fa
	lmNlFAb5aqOHP0DgWUjPaCOqtBbPUXLZNYx2SHFUd3CG5SPAFxgr9QaJDozDfAmrEJrrGkXR0dNnN
	jSfm8zT+1nVlXiGUD6fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGj4o-006TyD-3C;
	Fri, 22 Dec 2023 17:12:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGj4m-006Txd-2W
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 17:12:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703265163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EJPw/6f1GAMSCdMx7JeeVoOTC8jzwbxE2TLobbWNwIc=;
	b=PFcZlwXd/cGC9tNVxB9nKPkVIgEuenPZAOR6IiE0T5Gva1ziBz6kJdyB9i4j0OR/qW65lz
	KlktrM5HMWhBEoHJPfK26jC3vhu5NJ0a+AoV0Kox00k+eQL0G2ioam5dmQ4MSqDc7Myb2R
	y9NF4RkL1piRZguInNvQIO3ib4RZBOQ=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-Xothym29NPyufG76dUOR5A-1; Fri, 22 Dec 2023 12:12:41 -0500
X-MC-Unique: Xothym29NPyufG76dUOR5A-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-6d823fc97f6so1052203b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 09:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703265160; x=1703869960;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EJPw/6f1GAMSCdMx7JeeVoOTC8jzwbxE2TLobbWNwIc=;
        b=PvOGucUfsXme0zQLD6364cXyRFOymjGvIVDsQNenWhgqnwOhWA3FQZNSesr3hQ0nBM
         J4llbXuj+pT1MR6B11PCAi92bZpG0HtTYqo20PsVfOCvDCaIJm2hBpd+tm/wqvaAML3X
         t635r3gqQifjiE8aBbGyT88tNh6axSLmAweAnNkagjMnwTuNrCMaAnO+b/7MoyMfRvTM
         AGpIvubLEGgKJsol9k8vTOcwKApbpTj5BpgYPCBLjTaM1FLc9UYFvHDAjd6sRxsGJNto
         HOVm9FqpefbnIK+3Q1U8n55s+jyau+epKy9iQykoABPEDWLJrXjxqEwun7/VjCu5YNoX
         ZVag==
X-Gm-Message-State: AOJu0YxyfHeFL5OBnHLKAJcjqVvSdvPNBAPL7Mck9Nh8ZO0mXrHiGUSH
	EydN2X3N148TTO9bTgwt+maDNR8fsB39uXIkDm9oQY7snsSOpBHnIF7VvjiNvrtCj8R3+3VitwE
	9eMdc2nDuyjnv90vN6g5A+R91rI+Y4k8z3xpf
X-Received: by 2002:a05:6a00:d4a:b0:6d9:8d88:f22d with SMTP id n10-20020a056a000d4a00b006d98d88f22dmr746224pfv.58.1703265160658;
        Fri, 22 Dec 2023 09:12:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7wNapKmlISZasLTcF4quOdp7zfHeY3L6ZGyiqpO82xhVsohRw7uAy6lOP4gSXhFEz2yNRwg==
X-Received: by 2002:a05:6a00:d4a:b0:6d9:8d88:f22d with SMTP id n10-20020a056a000d4a00b006d98d88f22dmr746213pfv.58.1703265160316;
        Fri, 22 Dec 2023 09:12:40 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a802:7496:88a7:1b1a:a837:bebf])
        by smtp.gmail.com with ESMTPSA id jw1-20020a056a00928100b006d9771857c4sm3163611pfb.27.2023.12.22.09.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 09:12:39 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Guo Ren <guoren@kernel.org>
Cc: Leonardo Bras <leobras@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Greg Ungerer <gerg@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH 2/4] riscv: add compile-time test into is_compat_task()
Date: Fri, 22 Dec 2023 14:12:22 -0300
Message-ID: <ZYXDdlF1CFNpDdiV@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJF2gTQNE7OQiAbkvVNzo9PCV=Xr8KQD0_=s-G56QMZJiZnjvA@mail.gmail.com>
References: <20231222074605.452452-1-leobras@redhat.com> <20231222074605.452452-3-leobras@redhat.com> <CAJF2gTQNE7OQiAbkvVNzo9PCV=Xr8KQD0_=s-G56QMZJiZnjvA@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_091244_915402_86621255 
X-CRM114-Status: GOOD (  29.67  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMDU6MzU6MjBQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBGcmksIERlYyAyMiwgMjAyMyBhdCA1OjAy4oCvUE0gTGVvbmFyZG8gQnJhcyA8bGVvYnJh
c0ByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPiBDdXJyZW50bHkgc2V2ZXJhbCBwbGFjZXMgd2ls
bCB0ZXN0IGZvciBDT05GSUdfQ09NUEFUIGJlZm9yZSB0ZXN0aW5nCj4gPiBpc19jb21wYXRfdGFz
aygpLCBwcm9iYWJseSBpbiBvcmRlciB0byBhdm9pZCBhIHJ1bi10aW1lIHRlc3QgaW50byB0aGUg
dGFzawo+ID4gc3RydWN0dXJlLgo+ID4KPiA+IFNpbmNlIGlzX2NvbXBhdF90YXNrKCkgaXMgYW4g
aW5saW5lZCBmdW5jdGlvbiwgaXQgd291bGQgYmUgaGVscGZ1bCB0byBhZGQgYQo+ID4gY29tcGls
ZS10aW1lIHRlc3Qgb2YgQ09ORklHX0NPTVBBVCwgbWFraW5nIHN1cmUgaXQgYWx3YXlzIHJldHVy
bnMgemVybyB3aGVuCj4gPiB0aGUgb3B0aW9uIGlzIG5vdCBlbmFibGVkIGR1cmluZyB0aGUga2Vy
bmVsIGJ1aWxkLgo+ID4KPiA+IFdpdGggdGhpcywgdGhlIGNvbXBpbGVyIGlzIGFibGUgdG8gdW5k
ZXJzdGFuZCBpbiBidWlsZC10aW1lIHRoYXQKPiA+IGlzX2NvbXBhdF90YXNrKCkgd2lsbCBhbHdh
eXMgcmV0dXJuIDAsIGFuZCBvcHRpbWl6ZS1vdXQgc29tZSBvZiB0aGUgZXh0cmEKPiA+IGNvZGUg
aW50cm9kdWNlZCBieSB0aGUgb3B0aW9uLgo+ID4KPiA+IFRoaXMgd2lsbCBhbHNvIGFsbG93IHJl
bW92aW5nIGEgbG90ICNpZmRlZnMgdGhhdCB3ZXJlIGludHJvZHVjZWQsIGFuZCBtYWtlCj4gPiB0
aGUgY29kZSBtb3JlIGNsZWFuLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExlb25hcmRvIEJyYXMg
PGxlb2JyYXNAcmVkaGF0LmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y29tcGF0LmggICAgfCAzICsrKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZWxmLmggICAg
ICAgfCA0IC0tLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCAgIHwgNiAt
LS0tLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIHwgNCArKy0tCj4g
PiAgNCBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NvbXBhdC5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9jb21wYXQuaAo+ID4gaW5kZXggMmFjOTU1YjUxMTQ4Zi4uOTE1MTdi
NTFiOGUyNyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY29tcGF0LmgK
PiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY29tcGF0LmgKPiA+IEBAIC0xNCw2ICsx
NCw5IEBACj4gPgo+ID4gIHN0YXRpYyBpbmxpbmUgaW50IGlzX2NvbXBhdF90YXNrKHZvaWQpCj4g
PiAgewo+ID4gKyAgICAgICBpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0NPTVBBVCkpCj4gPiArICAg
ICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiArCj4gPiAgICAgICAgIHJldHVybiB0ZXN0X3RocmVh
ZF9mbGFnKFRJRl8zMkJJVCk7Cj4gPiAgfQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2VsZi5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lbGYuaAo+ID4gaW5k
ZXggNTlhMDgzNjdmZGRkNy4uMmU4ODI1N2NhZmFlYSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vZWxmLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZWxm
LmgKPiA+IEBAIC01MywxMyArNTMsOSBAQCBleHRlcm4gYm9vbCBjb21wYXRfZWxmX2NoZWNrX2Fy
Y2goRWxmMzJfRWhkciAqaGRyKTsKPiA+ICAjZGVmaW5lIEVMRl9FVF9EWU5fQkFTRSAgICAgICAg
ICAgICAgICAoKERFRkFVTFRfTUFQX1dJTkRPVyAvIDMpICogMikKPiA+Cj4gPiAgI2lmZGVmIENP
TkZJR182NEJJVAo+ID4gLSNpZmRlZiBDT05GSUdfQ09NUEFUCj4gPiAgI2RlZmluZSBTVEFDS19S
TkRfTUFTSyAgICAgICAgIChpc19jb21wYXRfdGFzaygpID8gXAo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgMHg3ZmYgPj4gKFBBR0VfU0hJRlQgLSAxMikgOiBcCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDNmZmZmID4+IChQQUdFX1NISUZUIC0gMTIp
KQo+ID4gLSNlbHNlCj4gPiAtI2RlZmluZSBTVEFDS19STkRfTUFTSyAgICAgICAgICgweDNmZmZm
ID4+IChQQUdFX1NISUZUIC0gMTIpKQo+ID4gLSNlbmRpZgo+ID4gICNlbmRpZgo+ID4KPiA+ICAv
Kgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+IGluZGV4IDFkNDcyYjMxZTBjZmUuLmVh
NWIyNjliZTIyM2EgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFi
bGUuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+IEBAIC0x
MjcsMTYgKzEyNywxMCBAQAo+ID4gICNkZWZpbmUgVkFfVVNFUl9TVjQ4IChVTCgxKSA8PCAoVkFf
QklUU19TVjQ4IC0gMSkpCj4gPiAgI2RlZmluZSBWQV9VU0VSX1NWNTcgKFVMKDEpIDw8IChWQV9C
SVRTX1NWNTcgLSAxKSkKPiA+Cj4gPiAtI2lmZGVmIENPTkZJR19DT01QQVQKPiA+ICAjZGVmaW5l
IE1NQVBfVkFfQklUU182NCAoKFZBX0JJVFMgPj0gVkFfQklUU19TVjQ4KSA/IFZBX0JJVFNfU1Y0
OCA6IFZBX0JJVFMpCj4gPiAgI2RlZmluZSBNTUFQX01JTl9WQV9CSVRTXzY0IChWQV9CSVRTX1NW
MzkpCj4gPiAgI2RlZmluZSBNTUFQX1ZBX0JJVFMgKGlzX2NvbXBhdF90YXNrKCkgPyBWQV9CSVRT
X1NWMzIgOiBNTUFQX1ZBX0JJVFNfNjQpCj4gPiAgI2RlZmluZSBNTUFQX01JTl9WQV9CSVRTIChp
c19jb21wYXRfdGFzaygpID8gVkFfQklUU19TVjMyIDogTU1BUF9NSU5fVkFfQklUU182NCkKPiA+
IC0jZWxzZQo+ID4gLSNkZWZpbmUgTU1BUF9WQV9CSVRTICgoVkFfQklUUyA+PSBWQV9CSVRTX1NW
NDgpID8gVkFfQklUU19TVjQ4IDogVkFfQklUUykKPiA+IC0jZGVmaW5lIE1NQVBfTUlOX1ZBX0JJ
VFMgKFZBX0JJVFNfU1YzOSkKPiA+IC0jZW5kaWYgLyogQ09ORklHX0NPTVBBVCAqLwo+ID4gLQo+
ID4gICNlbHNlCj4gPiAgI2luY2x1ZGUgPGFzbS9wZ3RhYmxlLTMyLmg+Cj4gPiAgI2VuZGlmIC8q
IENPTkZJR182NEJJVCAqLwo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cHJvY2Vzc29yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gPiBpbmRl
eCBmMTlmODYxY2RhNTQ5Li5lZDMyZTUzZTU1OTk5IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wcm9jZXNzb3IuaAo+ID4gQEAgLTIyLDcgKzIyLDcgQEAKPiA+ICAoeyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgbW1hcF9lbmQ7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ID4gICAgICAgICB0eXBlb2YoYWRkcikgX2FkZHIgPSAoYWRkcik7ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiA+IC0gICAgICAgaWYgKChfYWRkcikgPT0gMCB8fCAoSVNfRU5B
QkxFRChDT05GSUdfQ09NUEFUKSAmJiBpc19jb21wYXRfdGFzaygpKSkgXAo+ID4gKyAgICAgICBp
ZiAoKF9hZGRyKSA9PSAwIHx8IGlzX2NvbXBhdF90YXNrKCkpICAgICAgICAgICAgICAgICAgIFwK
PiA+ICAgICAgICAgICAgICAgICBtbWFwX2VuZCA9IFNUQUNLX1RPUF9NQVg7ICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gPiAgICAgICAgIGVsc2UgaWYgKChfYWRkcikgPj0gVkFfVVNFUl9TVjU3
KSAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gICAgICAgICAgICAgICAgIG1tYXBfZW5kID0g
U1RBQ0tfVE9QX01BWDsgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+IEBAIC0zOSw3ICszOSw3
IEBACj4gPiAgICAgICAgIHR5cGVvZihhZGRyKSBfYWRkciA9IChhZGRyKTsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+ID4gICAgICAgICB0eXBlb2YoYmFzZSkgX2Jhc2UgPSAoYmFzZSk7
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICAgICAgICAgdW5zaWduZWQgbG9uZyBy
bmRfZ2FwID0gREVGQVVMVF9NQVBfV0lORE9XIC0gKF9iYXNlKTsgICBcCj4gPiAtICAgICAgIGlm
ICgoX2FkZHIpID09IDAgfHwgKElTX0VOQUJMRUQoQ09ORklHX0NPTVBBVCkgJiYgaXNfY29tcGF0
X3Rhc2soKSkpIFwKPiA+ICsgICAgICAgaWYgKChfYWRkcikgPT0gMCB8fCBpc19jb21wYXRfdGFz
aygpKSAgICAgICAgICAgICAgICAgICBcCj4gPiAgICAgICAgICAgICAgICAgbW1hcF9iYXNlID0g
KF9iYXNlKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gICAgICAgICBlbHNlIGlm
ICgoKF9hZGRyKSA+PSBWQV9VU0VSX1NWNTcpICYmIChWQV9CSVRTID49IFZBX0JJVFNfU1Y1Nykp
IFwKPiA+ICAgICAgICAgICAgICAgICBtbWFwX2Jhc2UgPSBWQV9VU0VSX1NWNTcgLSBybmRfZ2Fw
OyAgICAgICAgICAgICBcCj4gPiAtLQo+ID4gMi40My4wCj4gPgo+IFJldmlld2VkLWJ5OiBHdW8g
UmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KClRoYW5rcyEKTGVvCgo+IAo+IC0tIAo+IEJlc3QgUmVn
YXJkcwo+ICBHdW8gUmVuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
