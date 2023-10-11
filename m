Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA6ECD98C7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 05:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RFeHQxifQEzMzGtus1gLCFujihzBZG1vnt0F2MUqDpI=; b=4EBz0qZFXNqUE4
	9gXmvOirFVY8EhiS71iyGq17Chs43fD87dOsB6k/w5LlTWVdangdO+8FkRN3plyfoBt+e6nw3efn6
	/Qr01p1Q/DpqU2BZvS20nuiHtc8pARuiI+zdj83h+pwL67pOUJFA9R6k5ETG6YdI0ycyZBtQFMuNf
	Uy9cGDUBs0v2lLoUQ7dD7ecUjbUknUUQVSt4yU+84TINlqF8LkTDm0GcmU74Hpeo42huKVV7uafEB
	8rCF4dNSBrtA/VCrS8GRmOkaifOs6z0W4HNdEUWbas/YCLKrNE6s8OELqJlLZHdUkIxR+tBBNqIj8
	doEJJ0U1SRh7Rh7MqevQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqS8l-00Es9Y-2N;
	Wed, 11 Oct 2023 05:52:15 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqS8i-00Es8W-2q
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 05:52:14 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-578b4997decso4881587a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Oct 2023 22:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697003531; x=1697608331; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uB2f3GYH/kpgRnRbL88LHcmeeqsYhInJn57hhNzYiD0=;
        b=o4oMIQhkmBRlSdosUibn2+qP9m7tEDPIMZZcWjvtw57vbGhsPHSwcrodUVlV1Tk9Fj
         C/y1fZBP4MjH4Yha/s0tc/bRmnDsPCjkeuna3i5Uh6DQGddcC0xsDG/G8wlxF8Vy2MiL
         SDiB1EO0eiWjGeBAsNNBGgtKbuAghTLizrxt8+4HohXusRyw7tfKRMMbFrS3H6G5RvjM
         SQD0Wlh0m51dc6TGR5LDpziwbJ4W4pxa0H8IrYRIX6TrMxCMFrdL9Z7q8fUIuwI9Cfg9
         uE3x95vCAEKvkIOJaa/Y6QDlEOFQs6O5e99ogiZxzWgAHRLCr6ZQENqmeoc41EbcMb6M
         sc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697003531; x=1697608331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uB2f3GYH/kpgRnRbL88LHcmeeqsYhInJn57hhNzYiD0=;
        b=TXWyg13ShDxSTN23MRPM3WUcAzhdFox60NMgJ+RzZU0cDN4jlUGPycrC8sfc1tK8mp
         8r5CPeRwLPcPewk0h2K5E8Z7vHvNzAdXxA5I0mnjoqVQMQkLLZNL5kSaa/JXldz4Uan1
         1A8bIwg7e9YvR2R1Y4N06fKRarByWv7UwCzME7OB8YbC0pmSzZKJSWUU3Um4NszupCKF
         Jfkh4Ntqor8YtYLm/efR0fWYOY0Y9DTU51JmBgOq0g5arzwsd18L2om9OHGxBXhoP6VM
         IxOCKwA8bz4T5lzBXhb3kUxop83Q1gfHmVqMi5RRal2ILcBHBPjuVBpWWUUnMDEaaaTV
         72PA==
X-Gm-Message-State: AOJu0YyR9gG8tHoi8sfmOtq5NLwo51Fj5y097SMj1X06TMGNnabYHoZe
	qV8LYcRXoiK6vhJtx/VJzTyWktfjhi3vur5mEIbOWQ==
X-Google-Smtp-Source: AGHT+IEeEqkGLmFo9PNY3EdvhcjfnAFjglTfyVtroZYi102GSplRjzRGVpjR04ewfA1Sji5L5yjrCQuQw30ii3vCSdo=
X-Received: by 2002:a05:6a20:914b:b0:158:7fdf:66df with SMTP id
 x11-20020a056a20914b00b001587fdf66dfmr25459333pzc.18.1697003530678; Tue, 10
 Oct 2023 22:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-5-apatel@ventanamicro.com> <2023101053-scholar-resolute-a9a0@gregkh>
In-Reply-To: <2023101053-scholar-resolute-a9a0@gregkh>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 11 Oct 2023 11:22:00 +0530
Message-ID: <CAK9=C2XDkYg4kVHFT4bLETBecSGgHkPaTW9wpzLEe_Fjg0UGVQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] tty/serial: Add RISC-V SBI debug console based earlycon
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_225212_915508_7E8D5A4A 
X-CRM114-Status: GOOD (  16.49  )
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

T24gVHVlLCBPY3QgMTAsIDIwMjMgYXQgMTA6NDbigK9QTSBHcmVnIEtyb2FoLUhhcnRtYW4KPGdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgT2N0IDEwLCAyMDIz
IGF0IDEwOjM1OjAxUE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBXZSBleHRlbmQgdGhl
IGV4aXN0aW5nIFJJU0MtViBTQkkgZWFybHljb24gc3VwcG9ydCB0byB1c2UgdGhlIG5ldwo+ID4g
UklTQy1WIFNCSSBkZWJ1ZyBjb25zb2xlIGV4dGVuc2lvbi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZl
cnMvdHR5L3NlcmlhbC9LY29uZmlnICAgICAgICAgICAgICB8ICAyICstCj4gPiAgZHJpdmVycy90
dHkvc2VyaWFsL2Vhcmx5Y29uLXJpc2N2LXNiaS5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysr
Ky0tLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL0tjb25maWcgYi9kcml2
ZXJzL3R0eS9zZXJpYWwvS2NvbmZpZwo+ID4gaW5kZXggYmRjNTY4YTRhYjY2Li5jZWM0NjA5MWE3
MTYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvS2NvbmZpZwo+ID4gKysrIGIv
ZHJpdmVycy90dHkvc2VyaWFsL0tjb25maWcKPiA+IEBAIC04Nyw3ICs4Nyw3IEBAIGNvbmZpZyBT
RVJJQUxfRUFSTFlDT05fU0VNSUhPU1QKPiA+Cj4gPiAgY29uZmlnIFNFUklBTF9FQVJMWUNPTl9S
SVNDVl9TQkkKPiA+ICAgICAgIGJvb2wgIkVhcmx5IGNvbnNvbGUgdXNpbmcgUklTQy1WIFNCSSIK
PiA+IC0gICAgIGRlcGVuZHMgb24gUklTQ1ZfU0JJX1YwMQo+ID4gKyAgICAgZGVwZW5kcyBvbiBS
SVNDVl9TQkkKPiA+ICAgICAgIHNlbGVjdCBTRVJJQUxfQ09SRQo+ID4gICAgICAgc2VsZWN0IFNF
UklBTF9DT1JFX0NPTlNPTEUKPiA+ICAgICAgIHNlbGVjdCBTRVJJQUxfRUFSTFlDT04KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvZWFybHljb24tcmlzY3Ytc2JpLmMgYi9kcml2
ZXJzL3R0eS9zZXJpYWwvZWFybHljb24tcmlzY3Ytc2JpLmMKPiA+IGluZGV4IDI3YWZiMGI3NGVh
Ny4uYjFkYTM0ZThkOGNkIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL2Vhcmx5
Y29uLXJpc2N2LXNiaS5jCj4gPiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvZWFybHljb24tcmlz
Y3Ytc2JpLmMKPiA+IEBAIC0xMCwyMiArMTAsNDkgQEAKPiA+ICAjaW5jbHVkZSA8bGludXgvc2Vy
aWFsX2NvcmUuaD4KPiA+ICAjaW5jbHVkZSA8YXNtL3NiaS5oPgo+ID4KPiA+ICsjaWZkZWYgQ09O
RklHX1JJU0NWX1NCSV9WMDEKPiA+ICBzdGF0aWMgdm9pZCBzYmlfcHV0YyhzdHJ1Y3QgdWFydF9w
b3J0ICpwb3J0LCB1bnNpZ25lZCBjaGFyIGMpCj4gPiAgewo+ID4gICAgICAgc2JpX2NvbnNvbGVf
cHV0Y2hhcihjKTsKPiA+ICB9Cj4gPgo+ID4gLXN0YXRpYyB2b2lkIHNiaV9jb25zb2xlX3dyaXRl
KHN0cnVjdCBjb25zb2xlICpjb24sCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3QgY2hhciAqcywgdW5zaWduZWQgbikKPiA+ICtzdGF0aWMgdm9pZCBzYmlfMF8xX2NvbnNvbGVf
d3JpdGUoc3RydWN0IGNvbnNvbGUgKmNvbiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29uc3QgY2hhciAqcywgdW5zaWduZWQgaW50IG4pCj4gPiAgewo+ID4gICAgICAgc3Ry
dWN0IGVhcmx5Y29uX2RldmljZSAqZGV2ID0gY29uLT5kYXRhOwo+ID4gICAgICAgdWFydF9jb25z
b2xlX3dyaXRlKCZkZXYtPnBvcnQsIHMsIG4sIHNiaV9wdXRjKTsKPiA+ICB9Cj4gPiArI2VuZGlm
Cj4gPiArCj4gPiArc3RhdGljIHZvaWQgc2JpX2RiY25fY29uc29sZV93cml0ZShzdHJ1Y3QgY29u
c29sZSAqY29uLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hh
ciAqcywgdW5zaWduZWQgaW50IG4pCj4gPiArewo+ID4gKyAgICAgcGh5c19hZGRyX3QgcGEgPSBf
X3BhKHMpOwo+ID4gKwo+ID4gKyAgICAgc2JpX2VjYWxsKFNCSV9FWFRfREJDTiwgU0JJX0VYVF9E
QkNOX0NPTlNPTEVfV1JJVEUsCj4gPiArI2lmZGVmIENPTkZJR18zMkJJVAo+ID4gKyAgICAgICAg
ICAgICAgIG4sIHBhLCAodTY0KXBhID4+IDMyLAo+ID4gKyNlbHNlCj4gPiArICAgICAgICAgICAg
ICAgbiwgcGEsIDAsCj4gPiArI2VuZGlmCj4KPiBBZ2Fpbiwgbm8gI2lmZGVmIGluIC5jIGZpbGVz
IHBsZWFzZS4KCk9rYXksIEkgd2lsbCByZW1vdmUgI2lmZGVmIGZyb20gaGVyZSBhcyB3ZWxsLgoK
Pgo+IHRoYW5rcywKPgo+IGdyZWcgay1oCgpUaGFua3MsCkFudXAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
