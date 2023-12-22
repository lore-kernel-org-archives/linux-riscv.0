Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AC1C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 08:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXa7/tsJwmDEb/254KzcBTVkpaSojc9TOMtMfnqUHr4=; b=rv6tgOw+FdU68r
	a5IOdpoYp8tSjnnJsbvuECzZk/sVE4gIcIEB9ojbgrT7MsJxCa2WoJyWaObsbv11EwBdj1E50Ms6S
	kSQ1YyPCGWZp2HcW3bysGYydzkG7X7Iryykmrea3jCjIayg9C+OnjUKh8S3U9cZfcvp3xllWpZK0X
	2a88ujnR4oZV9x57H6bxkK8uMOmoa8q1Bawlvh4zfhPGxeexYdm/j8Ab/tL9OrxNW8CRLjIrzHZt1
	1JHDQXNfPwNbwYGe6bEPE2Jn/RBSbn8gBg1m4RJlQzE/juZqHg6mHtkWrNDGQS6qQP1Ra3gayJrph
	UHMcBIh6N33vEdFGeZhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGarO-005Ioa-2X;
	Fri, 22 Dec 2023 08:26:22 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGarM-005Inj-0M
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 08:26:21 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50e5a9bcec9so2343753e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 00:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703233574; x=1703838374; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLDBolBE+wQXgva30v8VxwvOmdRApKeC4D5SDFfZRY0=;
        b=eVfYia8w4KL6OKW9rTyrZ1MLONVVJGZLH1pKCwXrg/Pz73VGQV6V47sqLovN3jrFI/
         zIFRCIMDHxHil2wa6iMydkNyo+N5HUM7BeBMzUG1zI2nyjAHBHa4L988ATEseomHp73f
         KC5EtIjDwTYbCjTgMAhUPzyDb3wdTaxIp+fawVxVv4CEW14czM9LgXTiIH3ycAKPgLPr
         WwYbAIdr9H627NtZFKiVamRiFfUzTDzLxXQ264PeIbovUnQJSBbaGSYKIqLk4o+o45tJ
         kXhfOy/Mjn9iTNy6nLWct1YP8Z+Y825qDebn/uNb1RsuCiUUDZrB97ynyipTegeSrgw0
         5A0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703233574; x=1703838374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLDBolBE+wQXgva30v8VxwvOmdRApKeC4D5SDFfZRY0=;
        b=DQqL16RoBDlG9orPSzsfYeAAVYgK4ffv0WLjQ8TDNzHOB/l/cW5+Z8VwHcEGtCGH61
         lIe1o3rlPXMZi0Gb4bg3W7rRNYwz7lWUvpsCN4W3+TF/16kpqFdH6Ob4UooUMflJHvat
         wVdc7ytJhum+FKqu32LW6RZ+o4Zfoe6mnFe/W+QQNUtXNtSar6/babe9lV5ZNjlALJpC
         b5mz9Cn3rFKcXUSGjJmkH7oIYnxj8V+sK+WNxevGgeHzrPCpsGOySBCJOaXTT57vFzPw
         2DE4k1MTAPVGQqzozjEfy7BonVvqKvWFneW0wFjlfI67lYl8N6oipv+GO/DtxEW5EK3y
         iUYQ==
X-Gm-Message-State: AOJu0Yxq/RAlr7LEt1CJz5BZjUP7j7TTNwB/qnXFtrc5gGK8Y7DRzLE+
	gOZfA0S/TwyDD8Nj2QoUPk0jHmrtVCSe3Mo2NoWqBbVYfJPd5VFaPwmVCaLWAGM=
X-Google-Smtp-Source: AGHT+IGIQa1mzz4hkN9SgzhaoJN1pBUud6buI87HEZ65k8gaV4cUaH6kTuC5FV3+eWF5oPeYInzqoV7HOcPcBwFh2Qg=
X-Received: by 2002:a19:384e:0:b0:50e:384c:6982 with SMTP id
 d14-20020a19384e000000b0050e384c6982mr403848lfj.42.1703233574444; Fri, 22 Dec
 2023 00:26:14 -0800 (PST)
MIME-Version: 1.0
References: <20231221134318.28105-1-andy.chiu@sifive.com> <20231221134318.28105-2-andy.chiu@sifive.com>
 <20231222053014.GC52600@quark.localdomain>
In-Reply-To: <20231222053014.GC52600@quark.localdomain>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 22 Dec 2023 16:26:03 +0800
Message-ID: <CABgGipWFR5KytGgShx9ei6R00rfeTx7Caxm=hei88uzWk5j-Rw@mail.gmail.com>
Subject: Re: [v7, 01/10] riscv: Add support for kernel mode vector
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	bjorn@kernel.org, charlie@rivosinc.com, ardb@kernel.org, arnd@arndb.de, 
	peterz@infradead.org, tglx@linutronix.de, 
	Vincent Chen <vincent.chen@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Guo Ren <guoren@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, 
	Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_002620_148847_6AF9D806 
X-CRM114-Status: GOOD (  23.28  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMTozMOKAr1BNIEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIERlYyAyMSwgMjAyMyBhdCAwMTo0MzowOFBN
ICswMDAwLCBBbmR5IENoaXUgd3JvdGU6Cj4gPiArLyoKPiA+ICsgKiBXZSB1c2UgYSBmbGFnIHRv
IHRyYWNrIGluLWtlcm5lbCBWZWN0b3IgY29udGV4dC4gQ3VycmVudGx5IHRoZSBmbGFnIGhhcyB0
aGUKPiA+ICsgKiBmb2xsb3dpbmcgbWVhbmluZzoKPiA+ICsgKgo+ID4gKyAqICAtIGJpdCAwLTcg
aW5kaWNhdGVzIHdoZXRoZXIgdGhlIGluLWtlcm5lbCBWZWN0b3IgY29udGV4dCBpcyBhY3RpdmUu
IFRoZQo+ID4gKyAqICAgIGFjdGl2YXRpb24gb2YgdGhpcyBzdGF0ZSBkaXNhYmxlcyB0aGUgcHJl
ZW1wdGlvbi4gT24gYSBub24tUlQga2VybmVsLCBpdAo+ID4gKyAqICAgIGFsc28gZGlzYWJsZSBi
aC4gQ3VycmVudGx5IG9ubHkgMCBhbmQgMSBhcmUgdmFsaWQgdmFsdWUgZm9yIHRoaXMgZmllbGQu
Cj4gPiArICogICAgT3RoZXIgdmFsdWVzIGFyZSByZXNlcnZlZCBmb3IgZnV0dXJlIHVzZXMuCj4g
PiArICovCj4gPiArCj4gPiArI2RlZmluZSBSSVNDVl9LRVJORUxfTU9ERV9WX01BU0sgICAgIDB4
ZmYKPiA+ICsKPiA+ICsjZGVmaW5lIFJJU0NWX0tFUk5FTF9NT0RFX1YgIDB4MQo+Cj4gSXMgdGhl
cmUgYSByZWFzb24gdGhpcyBpc24ndCBqdXN0IGEgc2luZ2xlIGJpdCBmbGFnPwoKSSBoYXZlIG5v
dCB5ZXQgZHJhd24gYSBjb25jbHVzaW9uIG9uIHRoaXMuIEJ1dCBJIGFtIHRoaW5raW5nIGlmIGl0
CndvdWxkIGJlIHVzZWZ1bCB0byBhbGxvdyBjYWxsaW5nIGtlcm5lbF92ZWN0b3JfYmVnaW4gbXVs
dGlwbGUgdGltZXMgb24KYSBjYWxsIGNoYWluLiBUaGVuIHRoZXNlIGV4dHJhIGJpdHMgd291bGQg
YmUgdXNlZnVsIGlmIHdlIHdlcmUgdG8KYWxsb3cgYW5kIGltcGxlbWVudCBpdC4gRm9yIGV4YW1w
bGUsIHRoZSB1c2UgY2FzZSB3b3VsZCBiZSBsaWtlCgprZXJuZWxfdmVjdG9yX2JlZ2luKCk7Cm1l
bXNldCgpOyAvL2NoYWluZWQgdG8gYW5vdGhlciBrZXJuZWxfdmVjdG9yX2JlZ2luIGFuZCB2ZWN0
b3JpemVkIG1lbXNldApkb190aGluZ3Nfd2l0aF92ZWN0b3IoKTsKa2VybmVsX3ZlY3Rvcl9lbmQo
KTsKCj4KPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgcmlzY3Zfdl9jdHhfY250X2FkZCh1MzIgb2Zm
c2V0KQo+ID4gK3sKPiA+ICsgICAgIGN1cnJlbnQtPnRocmVhZC5yaXNjdl92X2ZsYWdzICs9IG9m
ZnNldDsKPiA+ICsgICAgIGJhcnJpZXIoKTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGlubGlu
ZSB2b2lkIHJpc2N2X3ZfY3R4X2NudF9zdWIodTMyIG9mZnNldCkKPiA+ICt7Cj4gPiArICAgICBi
YXJyaWVyKCk7Cj4gPiArICAgICBjdXJyZW50LT50aHJlYWQucmlzY3Zfdl9mbGFncyAtPSBvZmZz
ZXQ7Cj4gPiArfQo+Cj4gV2hhdCBpcyB0aGUgcHVycG9zZSBvZiB0aGUgYmFycmllcnMgYWJvdmU/
Cj4KPiA+ICtzdGF0aWMgaW5saW5lIHUzMiByaXNjdl92X2N0eF9jbnQodm9pZCkKPiA+ICt7Cj4g
PiArICAgICByZXR1cm4gUkVBRF9PTkNFKGN1cnJlbnQtPnRocmVhZC5yaXNjdl92X2ZsYWdzKTsK
PiA+ICt9Cj4KPiBXaGF0IGlzIHRoZSBwdXJwb3NlIG9mIHVzaW5nIFJFQURfT05DRSgpIGhlcmU/
CgpUaGVzZSBjb2RlcyBwcm92aWRlIGNvbXBpbGVyIGJhcnJpZXJzLCBlLmcuIHRvIHByZXZlbnQg
cmlzY3Zfdl9mbGFnCmNvdW50aW5nIHNsaXBzIGludG8gVmVjdG9yIG9wZXJhdGlvbnMuIEN1cnJl
bnRseS4gaXQgc2hvdWxkIGJlIGZpbmUKZm9yIG5vbi1wcmVlbXB0aWJsZSBWZWN0b3IgYXMgcmlz
Y3Zfdl9jdHhfY250X2FkZCgpL3N1YigpIGFyZSBndWFyZGVkCndpdGggcHJlZW1wdF9kaXNhYmxl
KCkvbG9jYWxfYmhfZGlzYWJsZSgpLiBIb3dldmVyLCBpZiBwcmVlbXB0X3Ygb3IKdGhlIGFib3Zl
IHVzZS1jYXNlIGlzIGNvbmNlcm5lZCwgdGhlbiB0aGVzZSBjb21waWxlciBiYXJyaWVycyBhcmUK
bmVlZGVkIGFuZCBzaG91bGQgbm90IGJlIG1peGVkIHdpdGggVmVjdG9yIG9wZXJhdGlvbnMgYWZ0
ZXJ3YXJkLiBPciwKaXQgd291bGQgY29uZnVzZSB0aGUgY29udGV4dCB0cmFja2luZyB3aGVuIHRy
YXBzIHRha2UgcGxhY2UuCgpyaXNjdl92X2N0eF9jbnRfYWRkKCkKZG8gdGhpbmdzIHdpdGggVmVj
dG9yLCBtYXliZSBpbmxpbmVkICh2c3RhdGVfc2F2ZSkKcmlzY3Zfdl9jdHhfY250X3N1YigpCgo+
Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvcHJvY2Vzcy5jCj4gPiBpbmRleCA0ZjIxZDk3MGExMjkuLjVjNGRjZjUxODY4NCAx
MDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYwo+ID4gKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gPiBAQCAtMTg3LDcgKzE4Nyw2IEBAIGludCBhcmNo
X2R1cF90YXNrX3N0cnVjdChzdHJ1Y3QgdGFza19zdHJ1Y3QgKmRzdCwgc3RydWN0IHRhc2tfc3Ry
dWN0ICpzcmMpCj4gPiAgICAgICAqZHN0ID0gKnNyYzsKPiA+ICAgICAgIC8qIGNsZWFyIGVudGly
ZSBWIGNvbnRleHQsIGluY2x1ZGluZyBkYXRhcCBmb3IgYSBuZXcgdGFzayAqLwo+ID4gICAgICAg
bWVtc2V0KCZkc3QtPnRocmVhZC52c3RhdGUsIDAsIHNpemVvZihzdHJ1Y3QgX19yaXNjdl92X2V4
dF9zdGF0ZSkpOwo+ID4gLQo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+Cj4gVW5uZWNlc3Nh
cnkgd2hpdGVzcGFjZSBjaGFuZ2UuCgpUaGlzIHdpbGwgYmUgZml4ZWQgaW4gdjgsIHRoYW5rcyEK
Cj4KPiBPdGhlcndpc2UgdGhpcyBwYXRjaCBsb29rcyBnb29kLCB0aGFua3MhCj4KPiAtIEVyaWMK
ClRoYW5rcywKQW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
