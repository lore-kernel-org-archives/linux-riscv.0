Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D52CA0EF8
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 09:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yoTnQkYpCz62RCZX1GS2r1EdtoMzbPAh65/TYOlUt2o=; b=duZGhaX8zxcBzw
	VkTxx0T58PWLFLKmidtNKD5V2I0blVJNb4c/qQwloKqVROpsMwRhNrAH5V6E/WI1HRIoSnwexxg+S
	4FMuYFp+xHYOXi9Me/oqHXLJPxUzjwvYoAY4bN0Z/5e3m3vcqJWreb8mOeifAaczAThFcp4lpT7IJ
	+PZYHh7SUrbVYSc65QkFfN85cw4wvBQLnDnI8WWe7fJ3XdpGKfvl5YgTibcP+qUHywdhwEV2pMwmL
	IUq9ABJNR1qLa7tCdMKUga/ChKLRUXI3zdxcVVH9Arumt4EKgNAnmDR9qNmyWd8bdDhwn0OSIps9n
	zZ/UzndJFAyW3yQv0myw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1nT-0000000GSpM-3EIc;
	Thu, 21 Aug 2025 09:41:27 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0Eh-0000000GAss-2JuR
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 08:01:29 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-30cce8c3afaso585908fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 01:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1755763283; x=1756368083; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0l+hqGahEDr13/VVOMr1/ba48aJ1pl6KG+1VNry8aA=;
        b=BOJIJNcTNs27YbP8/yhEIAwhFQIZWuR9ccrKeQPcx5SMQbdRl/2CvXUfMrmRcDTqdB
         l9XOfBN5oEVLB8HpvBXWjbProQey2UTUumU3PtATYF6GKhv+qe90XQ3dIBKpfW+Ha6My
         YMpluSNNr9m4lI+k8ASHXE7LBAdkseYbGVaRNtvnbFkR8LERbSA2/Weivauk4e7mHbVn
         feIraqw6ngFjI0ZncTahTd4TvCTwOw4bP+eUQRSwk82a6Dy7zUri0cR03+12/DHYXq3U
         SDO67whhwxyQ4tkKSGUIykq1fs1bhCpUTzpaNagoX7TInPT9s80PNLM62Am/rbpeIKjY
         PAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755763283; x=1756368083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X0l+hqGahEDr13/VVOMr1/ba48aJ1pl6KG+1VNry8aA=;
        b=Kmjk/Nw4UxsOepR6wDFGYrnyL0I7sdNvuZSVvvXd8HQyHCq5kR3xqEVGlXNaQ34QSO
         xqBsURoHPq1L3YfnY03dvEa64spgwgrOjzOzgm/WnPfbLc/mO3/DHfN4a9wP7zQjG8XB
         UwiP81fqPepZfV3uAH75DoggLDPpcF9LJf8gl+Gs19PXM1TobcpOtZ+EYANwvtNDSjg2
         uO9BsKmAquTiDNAEou3VaaGF4CvtRWDky+97UEwrkz68Y4cAmV8ANV+kG7AUW0mwMYFV
         +O0vXG0gI/OhrOcAN6V7iBbQaykwYy9eKJCkl0hAOTnVgIyhTZ3B09/LYPjqfcb+XX/D
         MDvg==
X-Forwarded-Encrypted: i=1; AJvYcCUWKrTg+jHahXcQnzLwtAusjM4om58ynXlQsyl5JNsnfT/FFT/tjJJJn+LajZ/4wAvn96137H0kaYyTZw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ3m1cBmWAtuOky7sWirxuckvvibnIKG2Kl3nNZHchqlrs4BGb
	7oHWDH8vzBSNA8eb5cXJeea4zKaogJZJ6XpELBn2Zis3cufvGFE9H675AFA1IXOlxxe7TKlX1Vw
	RE1HjP/dyZwJ5BIQmeAcUtHWxLq8OJNu+vor1C5N2ZQ==
X-Gm-Gg: ASbGnctG14YET1hS474WzPIl1UMjLvdOW1fMSxz77dpU0+tHtbioO7LTkAIcX6bEHlT
	X4w4Bv1pMQlBMO9yXci4HGyB1xGQ3ZeL/quZRfRMOXqBgV5CdoTneBqpsbLQYICbve3gabZNLGZ
	D3DGYALW2CzpepZd0XQcb5y3Dzh/4nH8h9wZ/RGytqdOkezjZfinJLVPrvCJkPKx6ntJv42Atpu
	ZLWkgrOVxhg7jpjn1WhaJ3s
X-Google-Smtp-Source: AGHT+IE1OeafrLylfvLmrdDojnOroAp8hDYwluDFKL9kS6j+UuoaPTREpF8UcR7eJdteZMLpeZ1xWt+LGXG2u0Pv6TQ=
X-Received: by 2002:a05:6808:50a5:b0:435:27b4:3fcb with SMTP id
 5614622812f47-4377d6b1ed9mr504349b6e.3.1755763282540; Thu, 21 Aug 2025
 01:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250819135007.85646-1-cuiyunhui@bytedance.com>
 <20250819135007.85646-3-cuiyunhui@bytedance.com> <e7653089-5c57-ee61-ed01-0b3245e10d82@gentwo.org>
In-Reply-To: <e7653089-5c57-ee61-ed01-0b3245e10d82@gentwo.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 21 Aug 2025 16:01:11 +0800
X-Gm-Features: Ac12FXwUWi_BUfDOcCWj-9DhtNJYZaytAFdS1lP3UQLaq51ftYyrJTGQtLfjgb4
Message-ID: <CAEEQ3w=KrysBJrkYA6mUKCjC=fz23R7u81a2p8EipaN9oVHs_Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 2/2] riscv: introduce percpu.h into include/asm
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: yury.norov@gmail.com, linux@rasmusvillemoes.dk, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dennis@kernel.org, tj@kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_010127_870048_B61B32D4 
X-CRM114-Status: GOOD (  17.97  )
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

SGkgQ2hyaXN0b3BoLAoKT24gVGh1LCBBdWcgMjEsIDIwMjUgYXQgNzozOeKAr0FNIENocmlzdG9w
aCBMYW1ldGVyIChBbXBlcmUpCjxjbEBnZW50d28ub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgMTkg
QXVnIDIwMjUsIFl1bmh1aSBDdWkgd3JvdGU6Cj4KPiA+ICsjZGVmaW5lIF9fUEVSQ1BVX0FNT19P
UF9DQVNFKHNmeCwgbmFtZSwgc3osIGFtb19pbnNuKSAgICAgICAgICAgICAgICAgICAgICAgIFwK
PiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gPiArX19wZXJjcHVfIyNuYW1lIyNfYW1vX2Nhc2VfIyNzeih2
b2lkICpwdHIsIHVuc2lnbmVkIGxvbmcgdmFsKSAgICAgICAgICAgICAgICBcCj4gPiAreyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+ID4gKyAgICAgYXNtIHZvbGF0aWxlICggICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgImFtbyIgI2Ftb19p
bnNuICNzZnggIiB6ZXJvLCAlW3ZhbF0sICVbcHRyXSIgICAgICAgICAgICBcCj4gPiArICAgICAg
ICAgICAgIDogW3B0cl0gIitBIiAoKih1IyNzeiAqKXB0cikgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+ID4gKyAgICAgICAgICAgICA6IFt2YWxdICJyIiAoKHUjI3N6KSh2YWwpKSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgOiAibWVtb3J5Iik7
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArfQo+Cj4g
QU1PIGNyZWF0ZXMgYSBzaW5nbGUgaW5zdHJ1Y3Rpb24gdGhhdCBwZXJmb3JtcyB0aGUgb3BlcmF0
aW9uPwo+Cj4gPiArI2RlZmluZSBfcGNwX3Byb3RlY3Qob3AsIHBjcCwgLi4uKSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyh7ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgIHBy
ZWVtcHRfZGlzYWJsZV9ub3RyYWNlKCk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gPiArICAgICBvcChyYXdfY3B1X3B0cigmKHBjcCkpLCBfX1ZBX0FSR1NfXyk7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgcHJlZW1wdF9lbmFibGVfbm90cmFj
ZSgpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICt9KQo+Cj4g
SXMgIm9wIiBhIHNpbmdsZSBpbnN0cnVjdGlvbj8gSWYgc28gdGhlbiBwcmVlbXB0IGRpc2FibGUg
LyBlbmRhYmxlIHdvdWxkCj4gbm90IGJlIG5lZWRlZCBpZiB0aGVyZSBpcyBubyBvdGhlciBpbnN0
cnVjdGlvbiBjcmVhdGVkLgo+Cj4gQnV0IHJhd19jcHVfcHRyIHBlcmZvcm1zIGEgU0hJRlRfUEVS
Q1BVX1BUUiB3aGljaCBwZXJmb3JtcyBhbiBhZGRpdGlvbi4KPiBTbyB5b3UgbmVlZCB0aGUgZGlz
YWJsaW5nIG9mIHByZWVtcHRpb24gdG8gcHJvdGVjdCB0aGUgYWRkLgo+Cj4gSXMgdGhlcmUgYSB3
YXkgb24gUklTQyBWIHRvIGVtYmVkZCB0aGUgcG9pbnRlciBhcml0aG1ldGljIGluIHRoZSAiQU1P
Igo+IGluc3RydWN0aW9uPyBPciBjYW4geW91IHVzZSByZWxhdGl2ZSBhZGRyZXNzaW5nIHRvIGEg
cmVnaXN0ZXIgdGhhdAo+IGNvbnRhaW5zIHRoZSBjcHUgb2Zmc2V0LiBJIGJlbGlldmUgUklTQyBW
IGhhcyBhIHRocmVhZCBwb2ludGVyPwo+Cj4gSWYgeW91IGNhbiBkbyB0aGlzIHRoZW4gYSBsb3Qg
b2YgcHJlZW1wdF9lbmFibGUvZGlzYWJsZSBwb2ludHMgY2FuIGJlCj4gcmVtb3ZlZCBmcm9tIHRo
ZSBjb3JlIGtlcm5lbCBhbmQgdGhlIGluc3RydWN0aW9uIG1heSBiZSBhcyBzY2FsYWJsZSBhcyB4
ODYKPiB3aGljaCBjYW4gZG8gdGhlIHBlciBjcHUgb3BlcmF0aW9ucyB3aXRoIGEgc2luZ2xlIGlu
c3RydWN0aW9uLgoKWWVzLCB0aGFuayB5b3UuIFdoaWxlIGl04oCZcyBjZXJ0YWlubHkgZ29vZCB0
byByZW1vdmUgcHJlZW1wdGlvbgpkaXNhYmxpbmcsIGN1cnJlbnRseSBSSVNDLVbigJlzIGFtb2Fk
ZC53L2QgaW5zdHJ1Y3Rpb25zIGNhbiB0YWtlIHRoZQphZGRyZXNzIG9mIGEgdmFyaWFibGUgcmF0
aGVyIHRoYW4gYSByZWdpc3Rlci4KCkkgcHJldmlvdXNseSBzdWJtaXR0ZWQgYW4gYXR0ZW1wdCB0
byB1c2UgZ3AgdG8gc3RvcmUgdGhlIHBlcmNwdQpvZmZzZXQsIGFuZCB3ZSBhcmUgYWxzbyB0cnlp
bmcgdG8gcHVzaCBmb3IgYW4gZXh0ZW5zaW9uIHRoYXQgdXNlcyBhCnJlZ2lzdGVyIHRvIHN0b3Jl
IHRoZSBwZXJjcHUgb2Zmc2V0LgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FFRVEzdz1Q
c001VCt5TXJFR2RXWjJubTdtN1NYM3Z6c2NMdFdwT1BWdTF6cGZtM1lRQG1haWwuZ21haWwuY29t
LwpodHRwczovL2xpc3RzLnJpc2N2Lm9yZy9nL3RlY2gtcHJpdmlsZWdlZC90b3BpYy9yaXNjX3Zf
dGVjaF9hcmNoX3Jldmlldy8xMTM0Mzc1NTM/cGFnZT0yCgo+Cj4gPiArCj4gPiArI2RlZmluZSBf
cGNwX3Byb3RlY3RfcmV0dXJuKG9wLCBwY3AsIGFyZ3MuLi4pICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gPiArKHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgdHlwZW9mKHBjcCkgX19y
ZXR2YWw7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsg
ICAgIHByZWVtcHRfZGlzYWJsZV9ub3RyYWNlKCk7ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gPiArICAgICBfX3JldHZhbCA9ICh0eXBlb2YocGNwKSlvcChyYXdfY3B1
X3B0cigmKHBjcCkpLCAjI2FyZ3MpOyAgICAgICAgXAo+ID4gKyAgICAgcHJlZW1wdF9lbmFibGVf
bm90cmFjZSgpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsg
ICAgIF9fcmV0dmFsOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gPiArfSkKPgo+IFNhbWUgaGVyZS4KPgo+CgpUaGFua3MsCll1bmh1aQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
