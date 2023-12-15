Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B014AC35274
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 12:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lQUza5PxZW4qyiw/SuhtkBgrXHjJcaGBz1c9+Ob9JW8=; b=RfM+iVJ4/Q6Uoc
	ad9vvEMzE+Q9iFWOvb6MZihEbkNGQ8Z33Is5CJ6mQJ+dn4v4hHJiWFblDZJZp9Ec/gPSMbhrdQkme
	rzNpUn5i5AhoVgiIZPmpfkO18/LfSnE3H8myZqqkzYDMYloRV98Y/4k1GBQE1FYTi7nv3372GN/Ta
	2VgLh5WJzefmECp5dXMGRyShFJ/+gP63jW1zLXipjzsM5I1WN7bsafr+J8cd0BKseGcNfrikwgq9b
	MNlZjDtcchJSP89F1nsfcoOMU5J6heKacV7eZaMUx5BC6kVEI+bfS3CyEx/0c+a3VE+XvlWF1dyvN
	0UnhiNRSD9y8BYLfJd/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE7gb-003IEH-0l;
	Fri, 15 Dec 2023 12:53:01 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE7gX-003IBq-2w
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 12:52:59 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3363eba94ebso453152f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 04:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702644774; x=1703249574; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zXcFYrTG2R8DEyXiSysplwJ8JzdV6spJFQB5ZFHy7XU=;
        b=nSri0CIaBldgLkdsTT/2rjdn7QU6/oiEcyuXQVqBgUCS68O2lI3T4xVehdahmqteME
         S/MDfs4cVcSaNw6DtaM5ebbZDkHmbnlvowUlcYe0wH1yfm7Gno5YnCcMJFTM5XmDhR1y
         mlbUg4JzrNIifDIfiAwq3iOE1gCnYYwK5GcZoqWjpeWXkrAyb1SdIBc90e5Kx6NrRb3/
         AaAxO7dhFole4JFMmZhXAN5lFsOzfzy6DCUeKrZFUmfi1EHv1hULKloekJ4zBqvRbkEy
         mqV+i38s/FW083xcTqvDSaAAY0KcyXIT6TdC1ph+S6QJEBF/6SETE+R4HT38PUJ5DkeJ
         K7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702644774; x=1703249574;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zXcFYrTG2R8DEyXiSysplwJ8JzdV6spJFQB5ZFHy7XU=;
        b=xVGW3sCQl/bwTHAvCyJ8jWFtt6Z7nTy4IGf7U3XmPaAPt26kYxFNAsUi2ll/xv52QK
         txbDdej31242+KsG5aVIo6sgsJWQ+/v78XdEgN2RZLK/hoW5gExavsKRhf6RDAscIKNd
         afGY7ecWlsHR6LFc68k2up2Db9zk3tXQ8vhAKhcS3EnIigeNaW5+x675OlAYz4GsV48v
         tWLIZv5MQNH+/RjEoe17AOKqmq6qsYkwaQ4NT6zpHTQ+DH0qy5C0+BGL3mK9n1L61mC/
         /a4Sao+ecrHNw/S0w5pinkUA9PjZT//lCs4SIhFOal+IdiO2C52EGxoCV4GK5cv/pTvo
         GojQ==
X-Gm-Message-State: AOJu0Yze+tvMiGD9D9uJbz3bh38S+JGlB19sErml4JsvwrnxjvFrR1nI
	lQ+6jAaup851ocY0yYNd0nebyA==
X-Google-Smtp-Source: AGHT+IGz38QbYMbYn/T15/XpWQRdFLF3er3wHBKyyCK2Dmp4kBjc8hX3P2CRJ+snm39vTRA+2fY97w==
X-Received: by 2002:adf:e5cb:0:b0:336:365c:619a with SMTP id a11-20020adfe5cb000000b00336365c619amr1403454wrn.277.1702644773878;
        Fri, 15 Dec 2023 04:52:53 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id g12-20020a5d46cc000000b003335c061a2asm18774642wrs.33.2023.12.15.04.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 04:52:53 -0800 (PST)
Date: Fri, 15 Dec 2023 13:52:51 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <anup@brainfault.org>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, atishp@atishpatra.org, pbonzini@redhat.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, jgross@suse.com, 
	srivatsa@csail.mit.edu, guoren@kernel.org, conor.dooley@microchip.com
Subject: Re: [PATCH v2 06/13] RISC-V: KVM: Add SBI STA info to vcpu_arch
Message-ID: <20231215-e338fe29468bed2a02dcdc3a@orel>
References: <20231214101552.100721-15-ajones@ventanamicro.com>
 <20231214101552.100721-21-ajones@ventanamicro.com>
 <CAAhSdy2tWPqoq=tZXtfkvsksAf4PPXeR3DOoKMvcfw-2YaDSvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy2tWPqoq=tZXtfkvsksAf4PPXeR3DOoKMvcfw-2YaDSvQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_045257_953627_128AC74C 
X-CRM114-Status: GOOD (  27.30  )
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

T24gRnJpLCBEZWMgMTUsIDIwMjMgYXQgMDI6Mzc6MzJQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUaHUsIERlYyAxNCwgMjAyMyBhdCAzOjQ24oCvUE0gQW5kcmV3IEpvbmVzIDxham9u
ZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gS1ZNJ3MgaW1wbGVtZW50YXRpb24g
b2YgU0JJIFNUQSBuZWVkcyB0byB0cmFjayB0aGUgYWRkcmVzcyBvZiBlYWNoCj4gPiBWQ1BVJ3Mg
c3RlYWwtdGltZSBzaGFyZWQgbWVtb3J5IHJlZ2lvbiBhcyB3ZWxsIGFzIHRoZSBhbW91bnQgb2YK
PiA+IHN0b2xlbiB0aW1lLiBBZGQgYSBzdHJ1Y3R1cmUgdG8gdmNwdV9hcmNoIHRvIGNvbnRhaW4g
dGhpcyBzdGF0ZQo+ID4gYW5kIG1ha2Ugc3VyZSB0aGF0IHRoZSBhZGRyZXNzIGlzIGFsd2F5cyBz
ZXQgdG8gSU5WQUxJRF9HUEEgb24KPiA+IHZjcHUgcmVzZXQuIEFuZCwgb2YgY291cnNlLCBlbnN1
cmUgS1ZNIHdvbid0IHRyeSB0byB1cGRhdGUgc3RlYWwtCj4gPiB0aW1lIHdoZW4gdGhlIHNoYXJl
ZCBtZW1vcnkgYWRkcmVzcyBpcyBpbnZhbGlkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCA2ICsrKysrKwo+ID4gIGFyY2gvcmlzY3Yva3ZtL3Zj
cHUuYyAgICAgICAgICAgICB8IDIgKysKPiA+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEu
YyAgICAgfCA0ICsrKysKPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gPiBpbmRleCAyMzBiODJjMzExOGQuLmIx
MDAyNmZiNjQxMiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hv
c3QuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gPiBAQCAt
MjYzLDYgKzI2MywxMiBAQCBzdHJ1Y3Qga3ZtX3ZjcHVfYXJjaCB7Cj4gPgo+ID4gICAgICAgICAv
KiAnc3RhdGljJyBjb25maWd1cmF0aW9ucyB3aGljaCBhcmUgc2V0IG9ubHkgb25jZSAqLwo+ID4g
ICAgICAgICBzdHJ1Y3Qga3ZtX3ZjcHVfY29uZmlnIGNmZzsKPiA+ICsKPiA+ICsgICAgICAgLyog
U0JJIHN0ZWFsLXRpbWUgYWNjb3VudGluZyAqLwo+ID4gKyAgICAgICBzdHJ1Y3Qgewo+ID4gKyAg
ICAgICAgICAgICAgIGdwYV90IHNobWVtOwo+ID4gKyAgICAgICAgICAgICAgIHU2NCBsYXN0X3N0
ZWFsOwo+ID4gKyAgICAgICB9IHN0YTsKPiA+ICB9Owo+ID4KPiA+ICBzdGF0aWMgaW5saW5lIHZv
aWQga3ZtX2FyY2hfc3luY19ldmVudHMoc3RydWN0IGt2bSAqa3ZtKSB7fQo+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ID4gaW5k
ZXggNjk5NWI4YjY0MWU0Li5mZWM0ZjVmZDBmYTcgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2
L2t2bS92Y3B1LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ID4gQEAgLTgzLDYg
KzgzLDggQEAgc3RhdGljIHZvaWQga3ZtX3Jpc2N2X3Jlc2V0X3ZjcHUoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KQo+ID4gICAgICAgICB2Y3B1LT5hcmNoLmhmZW5jZV90YWlsID0gMDsKPiA+ICAgICAg
ICAgbWVtc2V0KHZjcHUtPmFyY2guaGZlbmNlX3F1ZXVlLCAwLCBzaXplb2YodmNwdS0+YXJjaC5o
ZmVuY2VfcXVldWUpKTsKPiA+Cj4gPiArICAgICAgIHZjcHUtPmFyY2guc3RhLnNobWVtID0gSU5W
QUxJRF9HUEE7Cj4gPiArCj4gCj4gSSB0aGluayB3ZSBzaG91bGQgYWxzbyBzZXQgbGFzdF9zdGVh
bCB0byB6ZXJvIGFzIHdlbGwuCj4gCj4gQWxzbywgbGV0J3MgYWRkIGt2bV9yaXNjdl92Y3B1X3Ni
aV9zdGFfcmVzZXQoKSBpbiB2Y3B1X3NiaV9zdGEuYwo+IHRvIHJlc2V0IFZDUFUgU1RBIHN0YXRl
LgoKV2lsbCBkby4KCj4gCj4gPiAgICAgICAgIC8qIFJlc2V0IHRoZSBndWVzdCBDU1JzIGZvciBo
b3RwbHVnIHVzZWNhc2UgKi8KPiA+ICAgICAgICAgaWYgKGxvYWRlZCkKPiA+ICAgICAgICAgICAg
ICAgICBrdm1fYXJjaF92Y3B1X2xvYWQodmNwdSwgc21wX3Byb2Nlc3Nvcl9pZCgpKTsKPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYyBiL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfc2JpX3N0YS5jCj4gPiBpbmRleCBlMjgzNTFjOTQ4OGIuLjE1N2MxOTliZTBiNCAxMDA2
NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N0YS5jCj4gPiArKysgYi9hcmNo
L3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYwo+ID4gQEAgLTEwLDYgKzEwLDEwIEBACj4gPgo+ID4g
IHZvaWQga3ZtX3Jpc2N2X3ZjcHVfcmVjb3JkX3N0ZWFsX3RpbWUoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1KQo+ID4gIHsKPiA+ICsgICAgICAgZ3BhX3Qgc2htZW0gPSB2Y3B1LT5hcmNoLnN0YS5zaG1l
bTsKPiA+ICsKPiA+ICsgICAgICAgaWYgKHNobWVtID09IElOVkFMSURfR1BBKQo+ID4gKyAgICAg
ICAgICAgICAgIHJldHVybjsKPiA+ICB9Cj4gPgo+ID4gIHN0YXRpYyBpbnQga3ZtX3NiaV9zdGFf
c3RlYWxfdGltZV9zZXRfc2htZW0oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ID4gLS0KPiA+IDIu
NDMuMAo+ID4KPiAKPiBBcGFydCBmcm9tIHRoZSBhYm92ZSwgaXQgbG9va3MgZ29vZCB0byBtZS4K
PiAKPiBSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClRoYW5r
cywKZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
