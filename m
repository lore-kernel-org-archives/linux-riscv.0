Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BB9C3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 05:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P/kxeDEb31/ZJuKbwVWgX8yYR1uTN2fczoHAgmfRKYc=; b=tNimyhN2DCPrXW
	XYlXElCUFKjuY55Tg+TtFj9Sh358HzEHzWctb64Jfs2EemC6Ry6uilF5jPuBj619lZxUKCYqxUnr7
	NKb/2FtnTQgF330T4YiudVy54Oq1K1vahWuL3uxP3g2cCqxLLkHH9f0nOwLNNVJsSKaonFlKhBGkt
	Bb6Nqm08ewHjNoMYddnXtORenuUdayWITZ/0BKz7y+DK3NsnQKTqo8xv1jBiGBPF0/7WtNTf77RET
	Eck3xSZpu8KomdfCPSDlE41Kxg0Tklzq1WsMNPC+JnTVzXlVhShAT2o7uW8b1IglwmJtuq6voFovC
	pj3x4v5lHW0St63ihHRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPFC2-007ma4-2s;
	Mon, 15 Jan 2024 05:07:26 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPFBz-007mZY-1Y
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 05:07:24 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d54b86538aso41688115ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 14 Jan 2024 21:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705295241; x=1705900041; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w2DMZrv/vftTV3/CK2PgvRDBQKFQBwMoQcf1arJiP6I=;
        b=kqcEX2b2zDUbC+HFjo8UVkTascOxa/G5tEjuXBQxzJmB2gF7aOT9Inj52n60wr5DcI
         FPqGaShI2syoZ93LLw2LoLj6nt6/Nq6WtCAEbWMbX6lWWokL/F3ObD1gd2+eTAcfOF0I
         Gq8Wg9P2236QDzujH8PtOn+g0EQ7IC91v94r9ccpQ46Op1MFW2UJJcJ/9duOkppyrNfi
         bH3bzb6ibdlMCaLIg7FhtgXqEqGTTxbhXkn6SC60QtxGItuPWxS7YOefn+rrY/nX4iGo
         4MIUaccuU9TBEEW2oqY48peQpuGwImf+tOzp7UA3Ud54DuiG8sAy09S/T/wejHatt2os
         8whA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705295241; x=1705900041;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w2DMZrv/vftTV3/CK2PgvRDBQKFQBwMoQcf1arJiP6I=;
        b=N6G35mWK8CFdhRCVHpdqMpsqjdxFqnLwIPgcndbqEwRpFhGKZQS7kfg0DICKO5Kou1
         Yqv192LhFf9zkSpbewoCZmvzr1VVcoaKN/Qz980TxlJQmBDJ191dRn8eFhZ2LLvcpixh
         w+kUBQgF9D2tLHl6zeOPc8m/yHK519ZLpf6Nul01KFCmfgT5IbGwRFl3rl5XNQRu2lqi
         ho+I/khiWtW+Zen0ZNpmXWuzFUAU3Kp9XdCM7VQih/Wf4URkCjRbESPTJhcbdkGWJN6r
         wC/nqFvr3FE9q3/bnld2pLHDaVN7KrrtIoPkTzy3RIJyR13CLFY/T3/EOHVlfsvlSO4P
         MaJA==
X-Gm-Message-State: AOJu0YyOoRtKy82duYRYRqgkeLHeG8A9ZXmXWFrm625zLo+XSLQx/UHm
	JyaxrflE1HBS+mL1GyLtoLGUSqOeJVMq9w==
X-Google-Smtp-Source: AGHT+IEvzxpRVFQLh9OO7fdUTY/2UwLLDyRzSULhO6pjToVkFQ3zpRcC/wUy3kWXKGuh6/R/Edr8Xw==
X-Received: by 2002:a17:903:1209:b0:1d5:8a8d:83be with SMTP id l9-20020a170903120900b001d58a8d83bemr2457583plh.16.1705295241182;
        Sun, 14 Jan 2024 21:07:21 -0800 (PST)
Received: from sunil-laptop ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id lw8-20020a1709032ac800b001d06b63bb98sm6806351plb.71.2024.01.14.21.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 21:07:20 -0800 (PST)
Date: Mon, 15 Jan 2024 10:37:13 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Anup Patel <anup@brainfault.org>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH -next 2/2] cpuidle: RISC-V: Add ACPI LPI support
Message-ID: <ZaS9gQS4fURoiffV@sunil-laptop>
References: <20240111093058.121838-1-sunilvl@ventanamicro.com>
 <20240111093058.121838-3-sunilvl@ventanamicro.com>
 <CAAhSdy22JrFOS8V-FC=ZCQiybhcJCszxy_TsnGAzuzYA06Mw7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy22JrFOS8V-FC=ZCQiybhcJCszxy_TsnGAzuzYA06Mw7Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240114_210723_523381_780CC6E6 
X-CRM114-Status: GOOD (  24.16  )
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

T24gRnJpLCBKYW4gMTIsIDIwMjQgYXQgMTA6MzU6MDdBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUaHUsIEphbiAxMSwgMjAyNCBhdCAzOjAx4oCvUE0gU3VuaWwgViBMIDxzdW5pbHZs
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiA+IEFkZCByZXF1aXJlZCBjYWxsYmFja3Mg
dG8gc3VwcG9ydCBMb3cgUG93ZXIgSWRsZSAoTFBJKSBvbiBBQ1BJIGJhc2VkCj4gPiBSSVNDLVYg
cGxhdGZvcm1zLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Yt
c2JpLmMgfCA3OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCA3OCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3B1aWRs
ZS9jcHVpZGxlLXJpc2N2LXNiaS5jIGIvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2Jp
LmMKPiA+IGluZGV4IGU4MDk0ZmM5MjQ5MS4uY2VhNjdhNTRhYjM5IDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMKPiA+ICsrKyBiL2RyaXZlcnMvY3B1
aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5jCj4gPiBAQCAtNjMyLDMgKzYzMiw4MSBAQCBzdGF0aWMg
aW50IF9faW5pdCBzYmlfY3B1aWRsZV9pbml0KHZvaWQpCj4gPiAgICAgICAgIHJldHVybiAwOwo+
ID4gIH0KPiA+ICBkZXZpY2VfaW5pdGNhbGwoc2JpX2NwdWlkbGVfaW5pdCk7Cj4gPiArCj4gPiAr
I2lmZGVmIENPTkZJR19BQ1BJX1BST0NFU1NPUl9JRExFCj4gPiArCj4gPiArI2luY2x1ZGUgPGxp
bnV4L2FjcGkuaD4KPiA+ICsjaW5jbHVkZSA8YWNwaS9wcm9jZXNzb3IuaD4KPiA+ICsKPiA+ICsj
ZGVmaW5lIFJJU0NWX0ZGSF9MUElfVFlQRV9NQVNLICAgICAgICAgICAgICAgIDB4MTAwMDAwMDAw
MDAwMDAwMFVMTAo+ID4gKyNkZWZpbmUgUklTQ1ZfRkZIX0xQSV9SU1ZEX01BU0sgICAgICAgICAg
ICAgICAgMHgwRkZGRkZGRjAwMDAwMDAwVUxMCj4gPiArCj4gPiArc3RhdGljIGludCBhY3BpX2Nw
dV9pbml0X2lkbGUodW5zaWduZWQgaW50IGNwdSkKPiA+ICt7Cj4gPiArICAgICAgIGludCBpOwo+
ID4gKyAgICAgICBzdHJ1Y3QgYWNwaV9scGlfc3RhdGUgKmxwaTsKPiA+ICsgICAgICAgc3RydWN0
IGFjcGlfcHJvY2Vzc29yICpwciA9IHBlcl9jcHUocHJvY2Vzc29ycywgY3B1KTsKPiA+ICsKPiA+
ICsgICAgICAgaWYgKHVubGlrZWx5KCFwciB8fCAhcHItPmZsYWdzLmhhc19scGkpKQo+ID4gKyAg
ICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gKwo+ID4gKyAgICAgICAvKgo+ID4gKyAg
ICAgICAgKiBUaGUgU0JJIEhTTSBzdXNwZW5kIGZ1bmN0aW9uIGlzIG9ubHkgYXZhaWxhYmxlIHdo
ZW46Cj4gPiArICAgICAgICAqIDEpIFNCSSB2ZXJzaW9uIGlzIDAuMyBvciBoaWdoZXIKPiA+ICsg
ICAgICAgICogMikgU0JJIEhTTSBleHRlbnNpb24gaXMgYXZhaWxhYmxlCj4gPiArICAgICAgICAq
Lwo+ID4gKyAgICAgICBpZiAoc2JpX3NwZWNfdmVyc2lvbiA8IHNiaV9ta192ZXJzaW9uKDAsIDMp
IHx8Cj4gPiArICAgICAgICAgICAhc2JpX3Byb2JlX2V4dGVuc2lvbihTQklfRVhUX0hTTSkpIHsK
PiA+ICsgICAgICAgICAgICAgICBwcl93YXJuKCJIU00gc3VzcGVuZCBub3QgYXZhaWxhYmxlXG4i
KTsKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ICsgICAgICAgfQo+ID4g
Kwo+ID4gKyAgICAgICBpZiAocHItPnBvd2VyLmNvdW50IDw9IDEpCj4gPiArICAgICAgICAgICAg
ICAgcmV0dXJuIC1FTk9ERVY7Cj4gPiArCj4gPiArICAgICAgIGZvciAoaSA9IDE7IGkgPCBwci0+
cG93ZXIuY291bnQ7IGkrKykgewo+ID4gKyAgICAgICAgICAgICAgIHUzMiBzdGF0ZTsKPiA+ICsK
PiA+ICsgICAgICAgICAgICAgICBscGkgPSAmcHItPnBvd2VyLmxwaV9zdGF0ZXNbaV07Cj4gPiAr
Cj4gPiArICAgICAgICAgICAgICAgLyogVmFsaWRhdGUgRW50cnkgTWV0aG9kIGFzIHBlciBGRkgg
c3BlYy4KPiA+ICsgICAgICAgICAgICAgICAgKiBiaXRzWzYzOjYwXSBzaG91bGQgYmUgMHgxCj4g
PiArICAgICAgICAgICAgICAgICogYml0c1s1OTozMl0gc2hvdWxkIGJlIDB4MAo+ID4gKyAgICAg
ICAgICAgICAgICAqIGJpdHNbMzE6MF0gcmVwcmVzZW50IGEgU0JJIHBvd2VyX3N0YXRlCj4gPiAr
ICAgICAgICAgICAgICAgICovCj4gPiArICAgICAgICAgICAgICAgaWYgKCEobHBpLT5hZGRyZXNz
ICYgUklTQ1ZfRkZIX0xQSV9UWVBFX01BU0spIHx8Cj4gPiArICAgICAgICAgICAgICAgICAgIChs
cGktPmFkZHJlc3MgJiBSSVNDVl9GRkhfTFBJX1JTVkRfTUFTSykpIHsKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHByX3dhcm4oIkludmFsaWQgTFBJIGVudHJ5IG1ldGhvZCAlI2xseFxuIiwg
bHBpLT5hZGRyZXNzKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Owo+ID4gKyAgICAgICAgICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgICAgICAgICBzdGF0ZSA9
IGxwaS0+YWRkcmVzczsKPiA+ICsgICAgICAgICAgICAgICBpZiAoIXNiaV9zdXNwZW5kX3N0YXRl
X2lzX3ZhbGlkKHN0YXRlKSkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcHJfd2Fybigi
SW52YWxpZCBTQkkgcG93ZXIgc3RhdGUgJSN4XG4iLCBzdGF0ZSk7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ICsgICAgICAgICAgICAgICB9Cj4gPiArICAg
ICAgIH0KPiA+ICsKPiA+ICsgICAgICAgcmV0dXJuIDA7Cj4gPiArfQo+ID4gKwo+ID4gK2ludCBh
Y3BpX3Byb2Nlc3Nvcl9mZmhfbHBpX3Byb2JlKHVuc2lnbmVkIGludCBjcHUpCj4gPiArewo+ID4g
KyAgICAgICByZXR1cm4gYWNwaV9jcHVfaW5pdF9pZGxlKGNwdSk7Cj4gPiArfQo+ID4gKwo+ID4g
K2ludCBhY3BpX3Byb2Nlc3Nvcl9mZmhfbHBpX2VudGVyKHN0cnVjdCBhY3BpX2xwaV9zdGF0ZSAq
bHBpKQo+ID4gK3sKPiA+ICsgICAgICAgdTMyIHN0YXRlID0gbHBpLT5hZGRyZXNzOwo+ID4gKwo+
ID4gKyAgICAgICBpZiAoc3RhdGUgJiBTQklfSFNNX1NVU1BfTk9OX1JFVF9CSVQpCj4gPiArICAg
ICAgICAgICAgICAgcmV0dXJuIENQVV9QTV9DUFVfSURMRV9FTlRFUl9QQVJBTShzYmlfc3VzcGVu
ZCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGxwaS0+aW5kZXgsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdGF0ZSk7Cj4gPiArICAgICAgIGVsc2UKPiA+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gQ1BVX1BNX0NQVV9JRExFX0VOVEVSX1JFVEVOVElPTl9QQVJBTShzYmlfc3VzcGVuZCwK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBscGktPmluZGV4LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXRlKTsKPiA+ICt9Cj4gPiArCj4gPiArI2Vu
ZGlmCj4gCj4gTGV0cyBrZWVwIHRoZSBjcHVpZGxlLXJpc2N2LXNiaS5jIGRyaXZlciBmb2N1c2Vk
IG9uIERUIG9ubHkuIEluc3RlYWQsCj4gSSB3b3VsZCBzdWdnZXN0IG1vdmluZyB0aGUgcmVxdWly
ZWQgZnVuY3Rpb24gZnJvbSBjcHVpZGxlLXJpc2N2LXNiaS5jCj4gdG8gYXJjaC9yaXNjdiBhbmQg
aGF2ZSBhIHNlcGFyYXRlIGRyaXZlciB1bmRlciBkcml2ZXIvYWNwaS9yaXNjdiBmb3IKPiBMUEkg
c3RhdGVzLgo+IApPa2F5LCBzdXJlLiBMZXQgbWUgc2VuZCB2MiB3aXRoIHlvdXIgc3VnZ2VzdGlv
bi4KClRoYW5rcywKU3VuaWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
