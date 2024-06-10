Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57204C27C55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 11:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9LlVaKZnfIYGzYQetShpwAtgyZopaouBSRVDzD7HhYk=; b=jFmJDW19Ahmmi6
	lZ8BcuFptA4EYr2hPh2JQimJnsB0+MIervwUEOHJVcq2A90t6mV3TuX5xrsoKf1inKl0KSMBLrCvM
	woCIsdsRBXy4/PA3Zv+UI7dbcGhaQgCSx2NxUwuPxUXFBuGNq8Hc2xUe6roUM5APbI5fs1BwdjeOu
	s/gPf92S8ZoTg7pUn517Y6gEzKOlH4IZupu5sBckXK5w/ZULCHNXFsgZZAU5MJ/hfcZ5qO6Lf5UsW
	JZdfTZk9QFAvXM4YzHJTiU0HPSaityGP+O3HI6BctKVaO+feKiUC+AFQhz2MYJ4mcZ7pEfcgZjWCI
	aDAX3L9/qynSbv9JXHFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGcue-00000004lmf-0SH8;
	Mon, 10 Jun 2024 11:10:08 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGcub-00000004llf-13XE
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 11:10:07 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-42172ed3597so15973485e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 04:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718017795; x=1718622595; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Prk73DnmPJ51cZiVZTBIXtupptZ0v+zxwxhwZVetsmM=;
        b=AW+Ozvj0NfZH4mrPMhBBuKcMnHiVpkjgGLF3l9btpbdCPFkWz2GxXpk82f9Gu3cshs
         UddXHn7A7ffm6Mc6LgG06r7YU5t8L69X+YTgiMe8gbTpBeQjmVED3fgFqmEW2VJiFKNX
         6N79fqz7IV78joL8dCMs54t7bJDdLEM1YYkyAJiiI4rCMpTzK1QZDE3frzIio8oTPtG8
         ZryfoCDeN9RGzC0aJMKXMlfExNP5rLcXZys9/spmROLYn6G6JkaQrIMJkS4L9exumVZg
         /kmYfA8CyrTQf9uIqoKYAAT6JVtFlfymuehOPREu1QjXJrALdFL5MriYUIRxFqzVG0pT
         gMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718017795; x=1718622595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Prk73DnmPJ51cZiVZTBIXtupptZ0v+zxwxhwZVetsmM=;
        b=pg0kEL7ftkiHRnAc/u4HCCKXAzJZRPWMz3E0Ky2Z9U6J3Kj8YqfAqbmf4p3ClQnW4J
         5w912hJtQcH1Zb+wmAb243LBDQX/m2e1wKyQMS6ZJfoz4HSirhgLp42qMi04tdpsd4+A
         TtbtM8UyXWn0lz7dsQSCfs96/Wr/99/J3ocYAj8OvGSmKLvVgm7tSqtzm0HMeX8K5snJ
         kZF/nV+wG09URctVVlDSFEzN+dbsJ7wP5If55TDMJ76Ge7aQQkPHC+qgMLFLjDjM0P+f
         0PMo1sdlzOj56RjuE8WviE2mNY10iP3f5VoS7DroqJRfri0hrSlBFhbWqEbRrFXZnj1L
         tu9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdURbDVOtUxeZ2EpDyUUgYvfhCAwGhJoV8e78e+XiznYiWNF1ipyit+V6p0t7Ce9rmAnaX49dgVm0kWQzOPohwFHtMKEwEKfTW3ESBzfYn
X-Gm-Message-State: AOJu0YzAEWPu3QdGmK3hVS3kOb/0OLoEPqRQQrBClGSG8f8OaZG59N5L
	KY43XCBxOVwitjQY0FJOMluf11aT+/X/gO6vJsUtNx4CkEJ6xHo09iSudbV59TW5zo41Kzie6pl
	wWBvcTZEzzVQALSVwAJ84eVSagt7Nd+oBFzVRrw==
X-Google-Smtp-Source: AGHT+IHDrzvkYTQO7a1HswOxY54QWUnr1lL0+aFtNp8beJCPB7XJGXVKY971cEuujaGhdfBQBjgtOJxj99AGY9+QH2o=
X-Received: by 2002:a05:600c:4f07:b0:421:661d:89d6 with SMTP id
 5b1f17b1804b1-421661d8dacmr84761065e9.14.1718017795456; Mon, 10 Jun 2024
 04:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240529185337.182722-1-rkanwal@rivosinc.com> <20240529185337.182722-3-rkanwal@rivosinc.com>
 <20240605-manila-exploit-d7191ec7a4bc@spud>
In-Reply-To: <20240605-manila-exploit-d7191ec7a4bc@spud>
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Mon, 10 Jun 2024 12:09:44 +0100
Message-ID: <CAECbVCumdNKLqRO8yvgo7PWEmw7P1OvyX88cF5JdYefSQQY9tQ@mail.gmail.com>
Subject: Re: [PATCH RFC 2/6] riscv: perf: Add Control transfer records CSR definations.
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, adrian.hunter@intel.com, 
	alexander.shishkin@linux.intel.com, ajones@ventanamicro.com, 
	anup@brainfault.org, acme@kernel.org, atishp@rivosinc.com, 
	beeman@rivosinc.com, brauner@kernel.org, heiko@sntech.de, irogers@google.com, 
	mingo@redhat.com, james.clark@arm.com, renyu.zj@linux.alibaba.com, 
	jolsa@kernel.org, jisheng.teoh@starfivetech.com, palmer@dabbelt.com, 
	tech-control-transfer-records@lists.riscv.org, will@kernel.org, 
	kaiwenxue1@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_041005_452339_C50E4635 
X-CRM114-Status: GOOD (  16.76  )
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

T24gV2VkLCBKdW4gNSwgMjAyNCBhdCA3OjAz4oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDI5LCAyMDI0IGF0IDA3OjUzOjMzUE0gKzAx
MDAsIFJham5lc2ggS2Fud2FsIHdyb3RlOgo+ID4gQWRkaW5nIENTUiBkZWZpbmVzIGZvciBSSVND
ViBDb250cm9sIFRyYW5zZmVyIFJlY29yZHMgZXh0ZW5zaW9uIFswXQo+ID4gYWxvbmcgd2l0aCBi
aXQtZmllbGQgbWFjcm9zIGZvciBlYWNoIENTUi4KPiA+Cj4gPiBbMF06IGh0dHBzOi8vZ2l0aHVi
LmNvbS9yaXNjdi9yaXNjdi1jb250cm9sLXRyYW5zZmVyLXJlY29yZHMKPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBSYWpuZXNoIEthbndhbCA8cmthbndhbEByaXZvc2luYy5jb20+Cj4gPiAtLS0KPiA+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oIHwgODMgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4KPiBUaGlzIHBhdGNoIGlzbid0IGZvciBwZXJmLCBzbyAkc3ViamVj
dCBpcyBhIGJpdCBtaXNsZWFkaW5nLgo+Cj4gVGhhbmtzLAo+IENvbm9yLgoKU29ycnksIG15IGJh
ZC4gSSB3aWxsIGZpeCB0aGlzIGluIHRoZSBuZXh0IHNlcmllcy4KCi0gUmFqbmVzaAoKPgo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCA4MyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5o
Cj4gPiBpbmRleCA3MDE5NjNiNjRmYzQuLmE4MGEyZWU5ZDQ0ZSAxMDA2NDQKPiA+IC0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vY3NyLmgKPiA+IEBAIC0zMDksNiArMzA5LDg1IEBACj4gPgo+ID4gICNkZWZpbmUgQ1NSX1NT
Q09VTlRPVkYgICAgICAgICAgICAgICAweGRhMAo+ID4KPiA+ICsvKiBNLW1vZGUgQ29udHJvbCBU
cmFuc2ZlciBSZWNvcmRzIENTUnMgKi8KPiA+ICsjZGVmaW5lIENTUl9NQ1RSQ1RMICAgICAgICAg
IDB4MzRlCj4gPiArCj4gPiArLyogUy1tb2RlIENvbnRyb2wgVHJhbnNmZXIgUmVjb3JkcyBDU1Jz
ICovCj4gPiArI2RlZmluZSBDU1JfU0NUUkNUTCAgICAgICAgICAweDE0ZQo+ID4gKyNkZWZpbmUg
Q1NSX1NDVFJTVEFUVVMgICAgICAgICAgICAgICAweDE0Zgo+ID4gKyNkZWZpbmUgQ1NSX1NDVFJE
RVBUSCAgICAgICAgICAgICAgICAweDE1Zgo+ID4gKwo+ID4gKy8qIFZTLW1vZGUgQ29udHJvbCBU
cmFuc2ZlciBSZWNvcmRzIENTUnMgKi8KPiA+ICsjZGVmaW5lIENTUl9WU0NUUkNUTCAgICAgICAg
IDB4MjRlCj4gPiArCj4gPiArLyogeGN0cnRsIENTUiBiaXRzLiAqLwo+ID4gKyNkZWZpbmUgQ1RS
Q1RMX1VfRU5BQkxFICAgICAgICAgICAgICBfQUMoMHgxLCBVTCkKPiA+ICsjZGVmaW5lIENUUkNU
TF9TX0VOQUJMRSAgICAgICAgICAgICAgX0FDKDB4MiwgVUwpCj4gPiArI2RlZmluZSBDVFJDVExf
TV9FTkFCTEUgICAgICAgICAgICAgIF9BQygweDQsIFVMKQo+ID4gKyNkZWZpbmUgQ1RSQ1RMX1JB
U0VNVSAgICAgICAgICAgICAgICBfQUMoMHg4MCwgVUwpCj4gPiArI2RlZmluZSBDVFJDVExfU1RF
ICAgICAgICAgICBfQUMoMHgxMDAsIFVMKQo+ID4gKyNkZWZpbmUgQ1RSQ1RMX01URSAgICAgICAg
ICAgX0FDKDB4MjAwLCBVTCkKPiA+ICsjZGVmaW5lIENUUkNUTF9CUEZSWiAgICAgICAgIF9BQygw
eDgwMCwgVUwpCj4gPiArI2RlZmluZSBDVFJDVExfTENPRklGUlogICAgICAgICAgICAgIF9BQygw
eDEwMDAsIFVMKQo+ID4gKyNkZWZpbmUgQ1RSQ1RMX0VYQ0lOSCAgICAgICAgICAgICAgICBfQUMo
MHgyMDAwMDAwMDAsIFVMKQo+ID4gKyNkZWZpbmUgQ1RSQ1RMX0lOVFJJTkggICAgICAgICAgICAg
ICBfQUMoMHg0MDAwMDAwMDAsIFVMKQo+ID4gKyNkZWZpbmUgQ1RSQ1RMX1RSRVRJTkggICAgICAg
ICAgICAgICBfQUMoMHg4MDAwMDAwMDAsIFVMKQo+ID4gKyNkZWZpbmUgQ1RSQ1RMX05UQlJFTiAg
ICAgICAgICAgICAgICBfQUMoMHgxMDAwMDAwMDAwLCBVTCkKPiA+ICsjZGVmaW5lIENUUkNUTF9U
S0JSSU5IICAgICAgICAgICAgICAgX0FDKDB4MjAwMDAwMDAwMCwgVUwpCj4gPiArI2RlZmluZSBD
VFJDVExfSU5EQ0FMTF9JTkggICBfQUMoMHgxMDAwMDAwMDAwMCwgVUwpCj4gPiArI2RlZmluZSBD
VFJDVExfRElSQ0FMTF9JTkggICBfQUMoMHgyMDAwMDAwMDAwMCwgVUwpCj4gPiArI2RlZmluZSBD
VFJDVExfSU5ESlVNUF9JTkggICBfQUMoMHg0MDAwMDAwMDAwMCwgVUwpCj4gPiArI2RlZmluZSBD
VFJDVExfRElSSlVNUF9JTkggICBfQUMoMHg4MDAwMDAwMDAwMCwgVUwpCj4gPiArI2RlZmluZSBD
VFJDVExfQ09SU1dBUF9JTkggICBfQUMoMHgxMDAwMDAwMDAwMDAsIFVMKQo+ID4gKyNkZWZpbmUg
Q1RSQ1RMX1JFVF9JTkggICAgICAgICAgICAgICBfQUMoMHgyMDAwMDAwMDAwMDAsIFVMKQo+ID4g
KyNkZWZpbmUgQ1RSQ1RMX0lORE9KVU1QX0lOSCAgX0FDKDB4NDAwMDAwMDAwMDAwLCBVTCkKPiA+
ICsjZGVmaW5lIENUUkNUTF9ESVJPSlVNUF9JTkggIF9BQygweDgwMDAwMDAwMDAwMCwgVUwpCj4g
PiArCj4gPiArLyogc2N0cnN0YXR1cyBDU1IgYml0cy4gKi8KPiA+ICsjZGVmaW5lIFNDVFJTVEFU
VVNfV1JQVFJfTUFTSyAgICAgICAgMHhGRgo+ID4gKyNkZWZpbmUgU0NUUlNUQVRVU19GUk9aRU4g
ICAgX0FDKDB4ODAwMDAwMDAsIFVMKQo+ID4gKwo+ID4gKyNpZmRlZiBDT05GSUdfUklTQ1ZfTV9N
T0RFCj4gPiArI2RlZmluZSBDVFJDVExfS0VSTkVMX0VOQUJMRSBDVFJDVExfTV9FTkFCTEUKPiA+
ICsjZWxzZQo+ID4gKyNkZWZpbmUgQ1RSQ1RMX0tFUk5FTF9FTkFCTEUgQ1RSQ1RMX1NfRU5BQkxF
Cj4gPiArI2VuZGlmCj4gPiArCj4gPiArLyogc2N0cmRlcHRoIENTUiBiaXRzLiAqLwo+ID4gKyNk
ZWZpbmUgU0NUUkRFUFRIX01BU0sgICAgICAgICAgICAgICAweDcKPiA+ICsKPiA+ICsjZGVmaW5l
IFNDVFJERVBUSF9NSU4gICAgICAgICAgICAgICAgMHgwIC8qIDE2IEVudHJpZXMuICovCj4gPiAr
I2RlZmluZSBTQ1RSREVQVEhfTUFYICAgICAgICAgICAgICAgIDB4NCAvKiAyNTYgRW50cmllcy4g
Ki8KPiA+ICsKPiA+ICsvKiBjdHJzb3VyY2UsIGN0cnRhcmdldCBhbmQgY3RyZGF0YSBDU1IgYml0
cy4gKi8KPiA+ICsjZGVmaW5lIENUUlNPVVJDRV9WQUxJRCAgICAgICAgICAgICAgMHgxVUxMCj4g
PiArI2RlZmluZSBDVFJUQVJHRVRfTUlTUCAgICAgICAgICAgICAgIDB4MVVMTAo+ID4gKwo+ID4g
KyNkZWZpbmUgQ1RSREFUQV9UWVBFX01BU0sgICAgMHhGCj4gPiArI2RlZmluZSBDVFJEQVRBX0ND
ViAgICAgICAgICAweDgwMDAKPiA+ICsjZGVmaW5lIENUUkRBVEFfQ0NNX01BU0sgICAgIDB4RkZG
MDAwMAo+ID4gKyNkZWZpbmUgQ1RSREFUQV9DQ0VfTUFTSyAgICAgMHhGMDAwMDAwMAo+ID4gKwo+
ID4gKyNkZWZpbmUgQ1RSREFUQV9UWVBFX05PTkUgICAgICAgICAgICAgICAgICAgIDAKPiA+ICsj
ZGVmaW5lIENUUkRBVEFfVFlQRV9FWENFUFRJT04gICAgICAgICAgICAgICAgICAgICAgIDEKPiA+
ICsjZGVmaW5lIENUUkRBVEFfVFlQRV9JTlRFUlJVUFQgICAgICAgICAgICAgICAgICAgICAgIDIK
PiA+ICsjZGVmaW5lIENUUkRBVEFfVFlQRV9UUkFQX1JFVCAgICAgICAgICAgICAgICAgICAgICAg
IDMKPiA+ICsjZGVmaW5lIENUUkRBVEFfVFlQRV9OT05UQUtFTl9CUkFOQ0ggICAgICAgICA0Cj4g
PiArI2RlZmluZSBDVFJEQVRBX1RZUEVfVEFLRU5fQlJBTkNIICAgICAgICAgICAgNQo+ID4gKyNk
ZWZpbmUgQ1RSREFUQV9UWVBFX1JFU0VSVkVEXzYgICAgICAgICAgICAgICAgICAgICAgNgo+ID4g
KyNkZWZpbmUgQ1RSREFUQV9UWVBFX1JFU0VSVkVEXzcgICAgICAgICAgICAgICAgICAgICAgNwo+
ID4gKyNkZWZpbmUgQ1RSREFUQV9UWVBFX0lORElSRUNUX0NBTEwgICAgICAgICAgIDgKPiA+ICsj
ZGVmaW5lIENUUkRBVEFfVFlQRV9ESVJFQ1RfQ0FMTCAgICAgICAgICAgICA5Cj4gPiArI2RlZmlu
ZSBDVFJEQVRBX1RZUEVfSU5ESVJFQ1RfSlVNUCAgICAgICAgICAgMTAKPiA+ICsjZGVmaW5lIENU
UkRBVEFfVFlQRV9ESVJFQ1RfSlVNUCAgICAgICAgICAgICAxMQo+ID4gKyNkZWZpbmUgQ1RSREFU
QV9UWVBFX0NPX1JPVVRJTkVfU1dBUCAgICAgICAgIDEyCj4gPiArI2RlZmluZSBDVFJEQVRBX1RZ
UEVfUkVUVVJOICAgICAgICAgICAgICAgICAgMTMKPiA+ICsjZGVmaW5lIENUUkRBVEFfVFlQRV9P
VEhFUl9JTkRJUkVDVF9KVU1QICAgICAxNAo+ID4gKyNkZWZpbmUgQ1RSREFUQV9UWVBFX09USEVS
X0RJUkVDVF9KVU1QICAgICAgICAgICAgICAgMTUKPiA+ICsKPiA+ICsjZGVmaW5lIENUUl9FTlRS
SUVTX0ZJUlNUICAgIDB4MjAwCj4gPiArI2RlZmluZSBDVFJfRU5UUklFU19MQVNUICAgICAweDJm
Zgo+ID4gKwo+ID4gICNkZWZpbmUgQ1NSX1NTVEFUVVMgICAgICAgICAgMHgxMDAKPiA+ICAjZGVm
aW5lIENTUl9TSUUgICAgICAgICAgICAgICAgICAgICAgMHgxMDQKPiA+ICAjZGVmaW5lIENTUl9T
VFZFQyAgICAgICAgICAgIDB4MTA1Cj4gPiBAQCAtNDkwLDYgKzU2OSw4IEBACj4gPiAgIyBkZWZp
bmUgQ1NSX1RPUEVJICAgQ1NSX01UT1BFSQo+ID4gICMgZGVmaW5lIENTUl9UT1BJICAgIENTUl9N
VE9QSQo+ID4KPiA+ICsjIGRlZmluZSBDU1JfQ1RSQ1RMICAgICBDU1JfTUNUUkNUTAo+ID4gKwo+
ID4gICMgZGVmaW5lIFNSX0lFICAgICAgICAgICAgICAgU1JfTUlFCj4gPiAgIyBkZWZpbmUgU1Jf
UElFICAgICAgICAgICAgICBTUl9NUElFCj4gPiAgIyBkZWZpbmUgU1JfUFAgICAgICAgICAgICAg
ICBTUl9NUFAKPiA+IEBAIC01MjAsNiArNjAxLDggQEAKPiA+ICAjIGRlZmluZSBDU1JfVE9QRUkg
ICBDU1JfU1RPUEVJCj4gPiAgIyBkZWZpbmUgQ1NSX1RPUEkgICAgQ1NSX1NUT1BJCj4gPgo+ID4g
KyMgZGVmaW5lIENTUl9DVFJDVEwgICAgIENTUl9TQ1RSQ1RMCj4gPiArCj4gPiAgIyBkZWZpbmUg
U1JfSUUgICAgICAgICAgICAgICBTUl9TSUUKPiA+ICAjIGRlZmluZSBTUl9QSUUgICAgICAgICAg
ICAgIFNSX1NQSUUKPiA+ICAjIGRlZmluZSBTUl9QUCAgICAgICAgICAgICAgIFNSX1NQUAo+ID4g
LS0KPiA+IDIuMzQuMQo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
