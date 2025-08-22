Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95CECA0EEB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 15:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OGuhaqxmq/tR+aBhsDAer/S6XOnWvtOMbb+AQqFyJz0=; b=omOR5ZkuoKGNrt
	Qymg/08wJV1BScTC6X63ycNU4PYxGSJSx47gLd0nScAYcENXjMU41TiCnWi+VF0W5hV9f4W4GMwrc
	/+hNycTM8L3/emhzS/j5SWAGcXC/uhFAnYwtaRqSErJV5ceMypxveIuTb18CLyK8ROtTmeQzyoGAs
	d1FZB3YcbZsKMRNEtq4G8SV8RQfFndByWfnVGxb2TLRFOsnANgxfET7s+GRbgekzZ+470M51IcwYk
	puwXr9g/MQ2S4GdYD0fJ5GHOAdsCSQdAOBz8W7Lf8e4JONcL6UxigBPYMO7kmE7TkZwxqcKl2lpOs
	2obZQJIcGas77n5vi05w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTxB-000000035qM-27H5;
	Fri, 22 Aug 2025 15:45:21 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPlN-00000002HZN-1Aqc
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 11:16:54 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3e570042988so19161195ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 Aug 2025 04:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1755861412; x=1756466212; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Q/jRAhPC0Tmtp2ISTMDpD9VBCqxj20vPKIcSTLHsWE=;
        b=OAoYQnH3wcs01Wf0FFnmolQkXFOlUSo3oGXmmD2Zueek5qsLLhci7m0SqTaSmgojdW
         VQUJgcSGXsaYP//zkzIVfIoLcqUdx5LurbW3nZllDMCeCSj08eh1nUHZSEZWmS7Gx1yS
         IWyfIC8tKjozE89+zKTaBwrgPjjOVyFaxhZA2VU9M3amDpZJHAeTIhFpV7oHlFpAtehq
         URef+ziucsOSiQ2C28l0DGtwEmmj1NBJqIadGRAQR0w34QMHtFfqtp3WqR6bUuxBZCR3
         Ed7JD/sm177CCCu4XI/KxkKTQMSRjMYNDNDFrEpv/2AGNnNoBsS0DKVJ6b1E1ZTboeZQ
         dNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755861412; x=1756466212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Q/jRAhPC0Tmtp2ISTMDpD9VBCqxj20vPKIcSTLHsWE=;
        b=uVnjjhp3KbZ1JBSzU9r9YA723EgPkqmINb2o0zBGtdd/CdTOdjWppOK/a3nUl/XHBv
         rVFj/foQIQ/ef9ACOvdAT43/t28OpxBjIdLO1HC2JoZ0YhirX2nDjAcXhUwzKV1YCMjW
         Jq27nIOBK0gymf1gBMf+GCXmV97Ia76p/4donBZiDs4OZJvaZWLp2QuzHk6dpnaC3rhU
         IvrSr0q2Ws38QdbfDyopGBID1OZQLNUGAX/1YLzJo3srZa4T/pp0J1COnhxZVi+6uDOC
         2jBTmZRQbYAvcdmJo+o7mQKIT5R418VjzZBOovRt3b7WQ5G4Pkhg0/sJQSzXXslyxkWp
         zeYg==
X-Forwarded-Encrypted: i=1; AJvYcCU4pCvD2nveYpX+xjefjViPYCDDv+oaG/vAsUTlCPswL5E/vuX4pK7o0c1xiBhal5l2Xt/bD0lHhm6ukQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfraqiUX5IHhhi1hb7RbooQZlokBCR4ji4elIMN16KrBcN9c2e
	h6Xl9cSWS+7SIA0R3wXInOBkos1pslr4Uw7U1NNcMEx/vuY8qGa+4FQ4KWxx59zhFCRrHjGf4+Y
	8XeASPZ7iyuMEQKML27cPrRaN5x2Tv9K6Wxe9O5Pjng==
X-Gm-Gg: ASbGnctiIKpD/tiSYOHVj+XH6snvb5+/uIodOqAqOKxEzYl7rCTJHkenWXBSlEZltRX
	AO96vmIr//p6hNfzqEDFPLWKwthQFCHqbsvjPHhLPp6rLZ0WyUXcB+FlimFLoo89maGYnL1rmjf
	1zE6sq+1xIvLOjXu8vun+UXr+F1QAhTfbwVKsXhZDLv3Y0PmuaZNEhjNz1VvZtwM2cva1hLw+Nm
	JuG7IJVQq8tOtAsBX0=
X-Google-Smtp-Source: AGHT+IEf3catLTwMZg08ITt9v+soiykhih7JmD1rfhONXLyWgFCvIw5fWgoyzMygsiEhsdJqKvljnLxwiGXIRXDHO7Q=
X-Received: by 2002:a05:6e02:220b:b0:3e9:eec4:9b7f with SMTP id
 e9e14a558f8ab-3e9eec4a13cmr7393215ab.30.1755861412296; Fri, 22 Aug 2025
 04:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <49680363098c45516ec4b305283d662d26fa9386.1754326285.git.zhouquan@iscas.ac.cn>
In-Reply-To: <49680363098c45516ec4b305283d662d26fa9386.1754326285.git.zhouquan@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 Aug 2025 16:46:39 +0530
X-Gm-Features: Ac12FXydDmBYaqaWI2oDhvXmh2nBQ17DyRxWSqA9fqFJ4rPMhrjf4Rw1RRPXrJg
Message-ID: <CAAhSdy0kpxEhz8AAiUUXapsEEGo4aMsDpSyMemr9khdYfy0OAw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Correct kvm_riscv_check_vcpu_requests() comment
To: zhouquan@iscas.ac.cn
Cc: ajones@ventanamicro.com, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_041653_321931_A9CEFFB1 
X-CRM114-Status: GOOD (  14.74  )
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

T24gTW9uLCBBdWcgMTEsIDIwMjUgYXQgODowMOKAr0FNIDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4g
d3JvdGU6Cj4KPiBGcm9tOiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFjLmNuPgo+Cj4gQ29y
cmVjdCBgY2hlY2tfdmNwdV9yZXF1ZXN0c2AgdG8gYGt2bV9yaXNjdl9jaGVja192Y3B1X3JlcXVl
c3RzYC4KPgo+IEZpeGVzOiBmNTVmZmFmODk2MzYgKCJSSVNDLVY6IEtWTTogRW5hYmxlIHJpbmct
YmFzZWQgZGlydHkgbWVtb3J5IHRyYWNraW5nIikKPiBTaWduZWQtb2ZmLWJ5OiBRdWFuIFpob3Ug
PHpob3VxdWFuQGlzY2FzLmFjLmNuPgoKUXVldWVkIHRoaXMgYXMgZml4ZXMgZm9yIExpbnV4LTYu
MTcKClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jIHwgMiArLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiBp
bmRleCBmMDAxZTU2NDAzZjkuLjNlYmNmZmZhYTk3OCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2t2bS92Y3B1LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiBAQCAtNjgzLDcgKzY4
Myw3IEBAIHZvaWQga3ZtX2FyY2hfdmNwdV9wdXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICB9
Cj4KPiAgLyoqCj4gLSAqIGNoZWNrX3ZjcHVfcmVxdWVzdHMgLSBjaGVjayBhbmQgaGFuZGxlIHBl
bmRpbmcgdkNQVSByZXF1ZXN0cwo+ICsgKiBrdm1fcmlzY3ZfY2hlY2tfdmNwdV9yZXF1ZXN0cyAt
IGNoZWNrIGFuZCBoYW5kbGUgcGVuZGluZyB2Q1BVIHJlcXVlc3RzCj4gICAqIEB2Y3B1OiAgICAg
IHRoZSBWQ1BVIHBvaW50ZXIKPiAgICoKPiAgICogUmV0dXJuOiAxIGlmIHdlIHNob3VsZCBlbnRl
ciB0aGUgZ3Vlc3QKPiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
