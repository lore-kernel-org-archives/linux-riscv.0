Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F34AC5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 04:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNMRlyBCpCNgsLyEIoLy3lIh/vwAVvq01mAGOvDptcQ=; b=es6EvbypaFIMdE
	gE4R0cVlyr+i2azlifAltINA6mst1Vs+iwtEzGqReWsXJQNuIVR9OpFK4FRIwxMKSR0rHR4nG3sG3
	7GM1MwMAgJpXdJjlSfYFqBoyS9EVMnBe4OSPlkSxZh7HbFdb5hCsl+2srnjqJeaioAu6IL6Sr8AuE
	97bSbry9MWbSo+6uMmLhtlLjJiAnR9UjeEcTXRA0RPmcIawMMVnyWMf0tcnmldg7zj+/LLRAv9Rqo
	h6/1TG2GE3ZKsBh9TTxDUm5QiD5YUr+wHvftRfFNKHEP+2qAI4ufVcFpekYeyEb/yQEx5hX5QUp+9
	ImUn5gvKBlAxx2l5k8TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfujO-0000000GJQR-24P2;
	Fri, 01 Mar 2024 04:42:46 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfujL-0000000GJOW-3ri0
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 04:42:45 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-7c7c9846910so80018739f.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 20:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1709268163; x=1709872963; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvBduY4sAnPPjxO+Xfm+PRZxCbldlxfEFEFnzNm66ao=;
        b=PLJGaPpXCR7kQG5g7OZ90ysBQaFH04OJv4xyVJjY5issf51Tr0upGqZRCrRODl9VvP
         wgCP1KmXOVJ1SxEiMIdwPvpvMo0il6ybZbOmbdebVEMvE4YIwSBbfe8XMwXwy/ELdAGp
         8nMMxTL4i6WT0K0gBHpe69F9Bnw/Alad5eRCvnL38TcQSvIU06rSLYEjh5G2xXN3XvRm
         CpEfCrY7jEZpCMC5NtdZ356X0JiG9NGgbsb9yKFYvdUjGQ8Yh8bC6GxFplOHaVkezX4g
         QSyBxbun61LjghgUtkX3xbcloNJAwEJ75ShX1NmlSeOpBa8/4W2ZU+UpaaubErapWI8A
         Qhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709268163; x=1709872963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvBduY4sAnPPjxO+Xfm+PRZxCbldlxfEFEFnzNm66ao=;
        b=m1A/yXxU3ht31QTe9dPDMv2RHxXc4DwyhAvBWeIbKKgXSGMm4k2PFWALit2G6GIbA3
         kHfIy/PXeZlXOvLiAz/dPzNI7BeWBNY0MAffFqKwRB/0ikAUPewlAq8ygsPuq3T2GRdl
         rH4RMBTeuwu5/I3DpC8GQOTjklTGvQDUELNtoDHiPjzaZxZQ3rBOqhlvs7EymrFWfC8S
         urx/NTJyc3jqHzgwxm4XzUnriVvIq1k8GBjWXQiXVHNOOEf/hirGNbmU1Ml3BBglWaTu
         iFiwzB8R6sQzKAPOtn08UqoWaRgWUveXp6tnvUZ6+YcOQkPiozYiafuHLv2+xI/6aRWw
         iCtA==
X-Forwarded-Encrypted: i=1; AJvYcCW+/1/ElXNne/zz5rnvF2+KVNewC4T5NSt+F/czrQTulu46sOx92s1XDkAwoyF6il4FzjGYsmpSEWPQtU8VE6mpkPIJMBuLj3Jl1mlAQ3cx
X-Gm-Message-State: AOJu0Ywdw+/mdatGqSZaLBEBacYim9Lykx7QC9WqsdwPg6SrtU2MXM0y
	7xb9TnTl3Eqa+Hw31A2Pup6sEgyslpSatR7NBW4//TFcHL9v703r04G6yKeEWa/JwzTJp+0A7i6
	PXrDM9gVFIrwedHbhWD8WU7as86I9jyeXfG8i9g==
X-Google-Smtp-Source: AGHT+IEiwLynSQVhGquKm7KUUZTdCWl6lpF6xy6jzlGvVXpd+rZtIhRUJOkknsYJ2UtSLC0OjSs3410EETlKnHWqOKg=
X-Received: by 2002:a05:6e02:1e01:b0:365:1ee3:ca8a with SMTP id
 g1-20020a056e021e0100b003651ee3ca8amr792980ila.29.1709268162757; Thu, 29 Feb
 2024 20:42:42 -0800 (PST)
MIME-Version: 1.0
References: <20240229010130.1380926-1-atishp@rivosinc.com> <20240229010130.1380926-12-atishp@rivosinc.com>
In-Reply-To: <20240229010130.1380926-12-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 1 Mar 2024 10:12:32 +0530
Message-ID: <CAAhSdy3MAMPJDZhRfFXY3d3d3BOpTJiPBAqVRAYKgzYNLFWyXg@mail.gmail.com>
Subject: Re: [PATCH v4 11/15] KVM: riscv: selftests: Add Sscofpmf to
 get-reg-list test
To: Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_204243_992773_7A01F642 
X-CRM114-Status: GOOD (  12.47  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBGZWIgMjksIDIwMjQgYXQgNjozMuKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoZSBLVk0gUklTQy1WIGFsbG93cyBTc2NvZnBtZiBleHRl
bnNpb24gZm9yIEd1ZXN0L1ZNIHNvIGxldCB1cwo+IGFkZCB0aGlzIGV4dGVuc2lvbiB0byBnZXQt
cmVnLWxpc3QgdGVzdC4KPgo+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1
bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
a3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0v
cmlzY3YvZ2V0LXJlZy1saXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3Yv
Z2V0LXJlZy1saXN0LmMKPiBpbmRleCA4Y2VjZTAyY2EyM2EuLmNhNmQ5OGE1ZGNlNSAxMDA2NDQK
PiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMK
PiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMK
PiBAQCAtNDMsNiArNDMsNyBAQCBib29sIGZpbHRlcl9yZWcoX191NjQgcmVnKQo+ICAgICAgICAg
Y2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBL
Vk1fUklTQ1ZfSVNBX0VYVF9WOgo+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQg
fCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9TTVNUQVRFRU46
Cj4gICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNB
X1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1NTQUlBOgo+ICsgICAgICAgY2FzZSBLVk1fUkVH
X1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNB
X0VYVF9TU0NPRlBNRjoKPiAgICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZN
X1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfU1NUQzoKPiAgICAgICAg
IGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwg
S1ZNX1JJU0NWX0lTQV9FWFRfU1ZJTlZBTDoKPiAgICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9J
U0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfU1ZO
QVBPVDoKPiBAQCAtNDA2LDYgKzQwNyw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICppc2FfZXh0X3Np
bmdsZV9pZF90b19zdHIoX191NjQgcmVnX29mZikKPiAgICAgICAgICAgICAgICAgS1ZNX0lTQV9F
WFRfQVJSKFYpLAo+ICAgICAgICAgICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU01TVEFURUVOKSwK
PiAgICAgICAgICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFNTQUlBKSwKPiArICAgICAgICAgICAg
ICAgS1ZNX0lTQV9FWFRfQVJSKFNTQ09GUE1GKSwKPiAgICAgICAgICAgICAgICAgS1ZNX0lTQV9F
WFRfQVJSKFNTVEMpLAo+ICAgICAgICAgICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1ZJTlZBTCks
Cj4gICAgICAgICAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihTVk5BUE9UKSwKPiBAQCAtOTI3LDYg
KzkyOSw3IEBAIEtWTV9JU0FfRVhUX1NVQkxJU1RfQ09ORklHKGZwX2YsIEZQX0YpOwo+ICBLVk1f
SVNBX0VYVF9TVUJMSVNUX0NPTkZJRyhmcF9kLCBGUF9EKTsKPiAgS1ZNX0lTQV9FWFRfU0lNUExF
X0NPTkZJRyhoLCBIKTsKPiAgS1ZNX0lTQV9FWFRfU1VCTElTVF9DT05GSUcoc21zdGF0ZWVuLCBT
TVNUQVRFRU4pOwo+ICtLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHNzY29mcG1mLCBTU0NPRlBN
Rik7Cj4gIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoc3N0YywgU1NUQyk7Cj4gIEtWTV9JU0Ff
RVhUX1NJTVBMRV9DT05GSUcoc3ZpbnZhbCwgU1ZJTlZBTCk7Cj4gIEtWTV9JU0FfRVhUX1NJTVBM
RV9DT05GSUcoc3ZuYXBvdCwgU1ZOQVBPVCk7Cj4gQEAgLTk4MCw2ICs5ODMsNyBAQCBzdHJ1Y3Qg
dmNwdV9yZWdfbGlzdCAqdmNwdV9jb25maWdzW10gPSB7Cj4gICAgICAgICAmY29uZmlnX2ZwX2Qs
Cj4gICAgICAgICAmY29uZmlnX2gsCj4gICAgICAgICAmY29uZmlnX3Ntc3RhdGVlbiwKPiArICAg
ICAgICZjb25maWdfc3Njb2ZwbWYsCj4gICAgICAgICAmY29uZmlnX3NzdGMsCj4gICAgICAgICAm
Y29uZmlnX3N2aW52YWwsCj4gICAgICAgICAmY29uZmlnX3N2bmFwb3QsCj4gLS0KPiAyLjM0LjEK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
